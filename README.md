# Quiz App

Welcome to my Quiz App! Get ready to test your knowledge and have fun with my engaging quizzes. I've built this app using Firebase as the backend and Provider as the state management solution to provide you with a seamless and interactive experience.

## Features:

1. Splash Screen:

* The splash screen appears when the app is launched and displays the app logo or a loading animation.
* It creates an initial loading experience for users while the app initializes.
* After a set duration, it automatically transitions to the login or signup screen.
2. Login and Signup Screens:

* Users can either log in with their existing credentials or sign up for a new account.
* Firebase Authentication is integrated to securely manage user authentication.
* The login screen includes fields for the user to enter their email address and password.
* The signup screen includes fields for the user to enter their name, email address and  password.
* Appropriate validation is performed on the input fields to ensure data integrity.
* Users can switch between the login and signup screens seamlessly.

3.Home Screen:
* After successful authentication, users are directed to the home screen.
* The home screen displays a list of available quizzes or categories.
* Users can select a quiz category or specific quiz to start answering questions.
* Each quiz category or quiz is represented with relevant information such as the title, description, and image.

4. User Progress Tracking Screen:
* This screen provides users with an overview of their quiz performance and progress.
* Users can view their scores, completion status, and other relevant statistics.
* Firebase Firestore is used to store and retrieve user progress data securely.

By incorporating Firebase Authentication and Firestore, the quiz app ensures a secure login/signup process and persistent storage of user progress data. This allows users to track their progress over time and enhancing the overall user experience.

## Installation
To install FireBlog, follow these steps:

* Clone the repository to your local machine.
* Navigate to the project directory and run flutter pub get.
* Set up a Firebase project and add your configuration file to the project.
* Run the app on your preferred emulator or physical device.


## System Architecture
![Screenshot 2023-05-24 232332](https://github.com/hamxamehboob/Quiz-App/assets/97390895/0c98097c-9bc3-4a86-82de-d5a6d5c3c855)
