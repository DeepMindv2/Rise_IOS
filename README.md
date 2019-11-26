# Rise-APP

![Intro Image](https://github.com/DeepMindv2/Rise/blob/master/Images/Screen%20Shot%202019-11-24%20at%207.52.31%20PM.png)

Quantitative Self Feedback Loop for ADHD students. This app is designed as a form of Bio-feedback meant to help notify users when the attention levels are below a certain threshold. This is an IOS app currently under development by the Neuro-Machine-Interaction Lab at the University of South Florida. This project was inspired by Dr. Marvin Andujar's Dissertation: "Aiding users to self-regulate their attention through Quantified-Self feedback while performing a learning task from a Brain-Computer Interface."  

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
5. From there the app retrieves the Engagement scores and sends notifications to the user when the Engagement score is low 

![Project Flow](https://github.com/DeepMindv2/Rise_2.0__2/blob/master/Images/Screen%20Shot%202019-11-24%20at%207.29.10%20PM.png)

# G-tec Nautilus
g.Nautilus RESEARCH is a non-certified wearable EEG headset. It is intended to be used for neuroscience research and comes with flexible cables to configure the EEG electrode positions as you wish [2]. For this study the dry EEG electrode version will be used and 32 channels. 

# Firebase 
We use Firebase as an intemediary between the App and the G-tec. Firebase saves data in a JSON format. We save data in Firebase based on Subject Number (S#), Baseline, and Task. To save data to and from Firebase run python file: python_firebase_Final.py. 

![Image of Firebase Console](https://github.com/DeepMindv2/Rise_2.0__2/blob/master/Images/Screen%20Shot%202019-11-24%20at%205.45.52%20PM.png)

# Engagement 
Engagement is calculated by this formula, Beta/(Alpha+Theta). The code where the Engagement is calculated is in the python_firebase_Final.py file. The Engagement is calculated in real-time and constantly gets updated in order to determine when the users engagement is too low. 

Figure 1: Engagement Formula [1]
![Engagement Formula](https://github.com/DeepMindv2/Rise/blob/master/Images/Engagement-formula.png)


# Necessary Dependencies
- Python 3.5
- Openvibe
- Matplotlib
- Pandas
- Xcode
- Firebase

# References 
- [1] https://www.researchgate.net/publication/305933823_Using_a_Visual_Programing_Language_to_Interact_with_Visualizations_of_Electroencephalogram_Signals/figures
- [2] 
https://www.gtec.at/product/gnautilus-research/


