# Rise-APP
Quantitative Self Feedback Loop for ADHD students. This app is designed to function with a G-Tec Nautilus and Openvibe. 

# Features
- Tips on improving Focus 
- Positive Reinforcement Techniques 
- Ability to store and review previous data
- Gamification features for game rewards 
- Shows picture of brain regions that are active in color 

# Project Flow
1. Data gets recorded from G-tec Nautilus to Openvibe
2. Openvibe saves the users raw data locally
3. From there a python script is run which calculates the Engagement 
4. The Engagement score is then sent to Firebase (Cloud Storage)
5. From there the app retrieves the Engagement scores 

# Necessary Dependencies
- Python 3.5
- Openvibe
- Pandas
- Xcode
- Firebase


![Image of APP](https://github.com/DeepMindv2/Rise_2.0__2/blob/master/Images/Screen%20Shot%202019-11-24%20at%203.10.34%20PM.png)

![Image of Firebase Console](https://github.com/DeepMindv2/Rise_2.0__2/blob/master/Images/Screen%20Shot%202019-11-24%20at%205.45.52%20PM.png)
