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
To install quiz app,follow these steps:

* Clone the repository to your local machine.
* Navigate to the project directory and run flutter pub get.
* Set up a Firebase project and add your configuration file to the project.
* Run the app on your preferred emulator or physical device.
## User Story Features:
As a user, I want to use a Quiz app to test my knowledge.The app should have the following screens:
* When I open the app, I expect to see a visually appealing splash screen with the app logo.
* The splash screen should appear for a few seconds to provide a smooth transition to the main app.
* After the splash screen, I should be directed to the login screen.
* On the login screen, I want to be able to enter my username and password.
* I should also have the option to log in using my social media accounts, such as Google 
* If I don't have an account, there should be a link to the signup screen.
* If I choose to create a new account, I should be directed to the signup screen.
* On the signup screen, I want to be able to enter my desired username, email address, and password.
* The screen should include a confirmation field for the password to avoid errors.
* After providing the required information, I should be able to sign up and proceed to the Quiz screen.
* Once I am logged in or signed up, I expect to be taken to the Quiz screen.
* The Quiz screen should display a question and multiple options.
* I should be able to select one option as my answer.
* After submitting my answer, the screen should display whether my answer was correct or incorrect.
* The Quiz screen should provide a next button to move to the next question.
* The Quiz screen should keep track of the number of questions answered correctly and incorrectly.
* After completing the quiz or at any point during the quiz, I should have access to the tracking screen.
* The tracking screen should show my overall progress, including the number of questions answered correctly and incorrectly.
* It should also display my performance in terms of a score.
## System Architecture
![Screenshot 2023-05-24 232332](https://github.com/hamxamehboob/Quiz-App/assets/97390895/0c98097c-9bc3-4a86-82de-d5a6d5c3c855)

## Entity Relation Diagram
![ERD](https://github.com/hamxamehboob/Quiz-App/assets/97390895/50b1ab9e-b165-4f11-8593-fce0f56ab9d7)


