# WellnessWave-IoMT-App
A mobile health app using wearable data and cloud integration for real-time stress monitoring.
# 🧘🏽‍♀️ WellnessWave – IoMT Wearable Stress App

**WellnessWave** is a mobile health app designed to support stress awareness and self-regulation using real-time biometric data. Built for an Internet of Medical Things (IoMT) course project, this app integrates a wearable Fitbit device, a Flutter-based mobile UI, and AWS cloud services to deliver seamless stress tracking and emotional check-ins.

---

## 📽 Demo Video

🎥 [Watch Demo here]([https://your-video-link-here.com](https://drive.google.com/file/d/1zE1TYC3qM41gIN1S6O0PYKb-0nfNWc81/view?usp=drive_link))

_This video walks through the core features of the WellnessWave app, including the wearable integration, mood tracking, and backend setup._

---

## 🚀 Key Features

- 📱 Clean and responsive Flutter UI for mood check-ins  
- 📊 Real-time heart rate data collection from Fitbit via OAuth  
- ☁️ Cloud-based architecture using AWS Lambda and API Gateway  
- 🔐 Secure storage of user data in DynamoDB  
- 🧠 Emotion-stress mapping based on user input and biometric signals  
- 🔄 Automatic token refresh for Fitbit API access

---

## 🧰 Tech Stack & Tools

| Component            | Description                                       |
|---------------------|---------------------------------------------------|
| **Frontend**         | Flutter (Dart), Android Studio Emulator           |
| **Backend**          | AWS Lambda, API Gateway, Python                   |
| **Database**         | Amazon DynamoDB                                   |
| **Authentication**   | Fitbit OAuth2.0 Access Token Integration          |
| **Dev Tools**        | Android Studio, Postman, Git, AWS Console         |
| **Testing**          | Emulator + Real Device Testing (Android)          |

---

## 🧠 App Architecture

```plaintext
[Flutter App] ⇄ [Fitbit API] ⇄ [AWS API Gateway]
        ⇅                 ⇅
 [User Mood Input]     [Heart Rate Data]
        ⇅
   [AWS Lambda Functions]
        ⇅
    [DynamoDB Storage]
