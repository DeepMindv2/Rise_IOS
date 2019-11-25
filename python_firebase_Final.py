import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
from firebase import firebase
import firebase_admin
from firebase_admin import credentials
import pandas as pd
from matplotlib import pyplot as plt
from pathlib import Path
import numpy as np
import array as arr
from Crypto.PublicKey import RSA
import codecs, json
from pandas.io.json import json_normalize
import json


# normalizes a 1D array of data that has the cols averaged for each row
# normalizes between 0-1, does not use absolotute values
def normalize_data(A, n):
#def normalize_data(A):
	temp_min = np.min(A)
	temp_max = np.max(A)
	shift_val = 0 - temp_min
	new_min = 0
	new_max = temp_max + shift_val
	B = arr.array('d', [])
	#for i in range(0, n):
	for i in range(len(A)):
		if i > 0:						# for every second
		#if i%2520 == 0:							# for every 10 seconds
			B.append( (A[i] + shift_val) / new_max )
	return B

# normalizes between 0-1, uses absolute values
def normalize_data_alt(A, n):
	for i in range(len(A)):
		A[i] = abs(A[i])
	max_val = np.max(A)
	B = arr.array('d', [])
	for i in range(len(A)):
		if i > 0:						# for every second
		#if i%2520 == 0:						# for every 10 seconds
			B.append(A[i]/max_val)
	return B

# normalizes data between -1 and 1, does not use absolute values
def normalize_data_alt_2(A, n):
	min_val = np.min(A)
	max_val = np.max(A)
	B = arr.array('d', [])
	for i in range(len(A)):
		if i > 0:						# for every second
		#if i %2520 == 0:					# for every 10 seconds
			if A[i] > 0:
				B.append(A[i]/max_val)
			elif A[i] < 0:
				#print('less than 0: ', A[i])
				B.append(A[i]/min_val)
			else:
				B.append(0.0)
	return B

#print('hi 1')
print('Starting program...')

print('Reading input files...')
alpha_file = Path('Data/alpha.csv')
beta_file = Path('Data/beta.csv')
theta_file = Path('Data/theta.csv')

alpha_data = pd.read_csv(alpha_file)
beta_data = pd.read_csv(beta_file)
theta_data = pd.read_csv(theta_file)
print('Input files read successfully')


total_rows=len(alpha_data.axes[0])
print('Total rows: ', total_rows)
#total_rows = 0

alpha_raw = alpha_data.values
beta_raw = beta_data.values
theta_raw = theta_data.values
#print('ALPHA RAW:')
#print(alpha_raw)

# average alpha data
#print('Averaging alpha...')
alpha_avgs = arr.array('d', [])
for i in range(0, total_rows):
	sum = 0.0
	#for j in range(2, 18):
	for j in range(2, 12):
		sum += float(alpha_raw[i][j])
		#sum += alpha_raw[i][j]
		#print("%0.05f" %alpha_raw[i][j], end=' ')
	#print('sum: ', sum)
	#avg = sum / 16		# 16 channels
	avg = sum/12		# 12 channels
	#print(' ')
	#print('appending', float(avg), 'to alpha_avgs')
	alpha_avgs.append(avg)
	#total_rows += 1

# average beta data
#print('Averaging beta...')
beta_avgs = arr.array('d', [])
for i in range(0, total_rows):
	sum = 0.0
	#for j in range(2, 18):
	for j in range(2, 12):
		sum += beta_raw[i][j]
		#print("%0.05f" %beta_raw[i][j], end=' ')
	#print('sum: ', sum)
	#avg = sum / 16		# 16 channels
	avg = sum/12		#12 channels
	#print(' ')
	beta_avgs.append(avg)

# average theta data
#print('Averaging theta...')
theta_avgs = arr.array('d', [])
for i in range(0, total_rows):
	sum = 0.0
	#for j in range(2, 18):
	for j in range(2, 12):
		sum += theta_raw[i][j]
		#print("%0.05f" %beta_raw[i][j], end=' ')
	#print('sum: ', sum)
	#avg = sum / 16		# 16 channels
	avg = sum/12		# 12 channels
	#print(' ')
	theta_avgs.append(avg)

# get engagement array of raw averages
print('Calculating engagement...')
eng_avgs = arr.array('d', [])
for i in range(0, total_rows):
		if(alpha_avgs[i] + theta_avgs[i] == 0):
			eng_avgs.append(0)
			continue
		eng_avgs.append( beta_avgs[i] / (alpha_avgs[i] + theta_avgs[i]) )


# normalize engagement array
a = np.array(eng_avgs)
abg_eng = (a*100)
#print('Engagment Averages', abg_eng)
eng_norm = normalize_data(eng_avgs, total_rows)


#eng_norm = normalize_data(eng_avgs)
#print('Eng_norm Before: ', eng_norm)


#print('Normalizing alpha...')
alpha_norm = normalize_data_alt(alpha_avgs, total_rows)
#print('Normalizing beta...')
beta_norm = normalize_data_alt(beta_avgs, total_rows)
#print('Normalizing theta...')
theta_norm = normalize_data_alt(theta_avgs, total_rows)
#print('Normalizing engagement...')
#eng_norm = normalize_data_alt(eng_avgs, total_rows)



################################## Completing Final Engagement ##################################


#print('Engagement Norm: ', eng_norm)
a = np.array(eng_norm)
final_eng = a*100
print(final_eng)

for i in final_eng:
	#print(i)
	Final_Engagement = int(i)
	#print(int(i))

print('Final Engagement: ', Final_Engagement)



################################## Averaging Engagement Scores ##################################

scores = [32, 40, 38]
len = len(scores)
baseline = []
# Averaging 3 Engagement Scores
def average(scores, len):
	scores = np.sum(scores)
	baseline = scores/len
	print('Baseline Engagement: ', baseline)
	return baseline

average(scores, len)
print('New baseline: ', baseline)


################################## Notification When Engagment to Low ##################################

#if currentEng < baseline:
#	print('Not Focused: Ending Task')




#######################################################################################
#######################################################################################
# 										Firebase 						              #
#######################################################################################
#######################################################################################


# Initializing Firebase
cred = credentials.Certificate('key.json')
# Initialize the app with a service account, granting admin privileges
firebase_admin.initialize_app(cred,{
    'databaseURL': 'https://rise-78b88.firebaseio.com/'
    })
### Read FIREBASE ###
print('Reading From Firebase')
# See Who is the current User
ref = db.reference('')
users_ref = ref.child('Users')
users_ref = users_ref.push()
subject_ref = users_ref.child('User 2')
baseline_ref = subject_ref.child('Baseline')
baseline_ref.set({
    'author': 'subject1',
    'Engagement Score': Final_Engagement,
})
task_ref = subject_ref.child('Tasks')
task_ref.set({
    'author': 'subject1',
    'Engagement Score': Final_Engagement,
})
data = users_ref.get()
#df = pd.DataFrame.from_dict(data)



	#print("===================================================")
	#print('Ref Reference: ', ref.get())
	#print('User Reference: ', users_ref.get())
	#print(df)
	#print("===================================================")


    #print("===================================================")
    #print('Current User: ', ref.get())
    #print("===================================================")

	# Check to see how many Engagment Scores he Already has
	#If he has more than 3 Average
		# Average the 3 Scores

	### Sending to FIREBASE ###
	#print("Sending to Firebase")
		# Send Engagment Score under Current User




#Firebase()
print('Engagement Score: ', Final_Engagement)

print('Completed!')








#
