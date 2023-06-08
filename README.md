# Quiz App

Welcome to my Quiz App! Get ready to test your knowledge and have fun with my engaging quizzes. I've built this app using Firebase as the backend and Provider as the state management solution to provide you with a seamless and interactive experience.

# ScreenShots Of Quiz App
<table>
  <tr>
    <td>Splash Screen</td>
     <td>On Board Screen</td>
     <td>Login Screen</td>
     <td>SignUp Screen</td>
    <td>Home Screen</td>
    <td>Introduction Screen</td>
    <td>Playing Screen</td>
    <td>Win Screen</td>
    <td>Lost Screen</td>
  </tr>
  
  <tr>
    <td><img src="https://github.com/hamxamehboob/Quiz-App/assets/97390895/6a3662e1-b884-4a77-8bd7-07d29ffcc096.jpg" width="1000%"></img></td>
    <td><img src="https://github.com/hamxamehboob/Quiz-App/assets/97390895/6b1b1c32-cc46-406b-8d39-70e1c33bcdc2.jpg" width="1000%"></img></td>
    <td><img src="https://github.com/hamxamehboob/Quiz-App/assets/97390895/15b98aaa-887e-43b8-ad10-77a469a311c6.jpg" width="1000%"></img></td>
    <td><img src="https://github.com/hamxamehboob/Quiz-App/assets/97390895/84e5c6a3-7ec7-4284-82aa-b9c76582b513.jpg" width="1000%"></img></td>
    <td><img src="https://github.com/hamxamehboob/Quiz-App/assets/97390895/18526553-aba7-4f6c-a187-fad543035d69.jpg" width="1000%"></img></td>
    <td><img src="https://github.com/hamxamehboob/Quiz-App/assets/97390895/804ff2f8-74ed-4c4c-93be-8261c0d7a4c1.jpg" width="1000%"></img></td>
    <td><img src="https://github.com/hamxamehboob/Quiz-App/assets/97390895/c397bda4-55a2-4782-a065-296f7043c8bb.jpg" width="1000%"></img></td>
    <td><img src="https://github.com/hamxamehboob/Quiz-App/assets/97390895/e4f229fe-1e00-4a90-9ecb-f738e5f7b0fd.jpg" width="1000%"></img></td>
    <td><img src="https://github.com/hamxamehboob/Quiz-App/assets/97390895/66e784ff-1987-4232-a74d-b0d0e86f282b.jpg" width="1000%"></img></td>
    
  </tr>
 </table>


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
* As a user, I want to register for a new account and log in to the app to access all the features and functionalities.

* As a Registered user,I want to attempt Quiz.

* As a Registered user,I want to see my tracks of quiz which i attempted.

* As a Registered user,I want to see my performance in terms of a score.


 
## System Architecture
![Screenshot 2023-05-24 232332](https://github.com/hamxamehboob/Quiz-App/assets/97390895/0c98097c-9bc3-4a86-82de-d5a6d5c3c855)

## Entity Relation Diagram
![ERD](https://github.com/hamxamehboob/Quiz-App/assets/97390895/50b1ab9e-b165-4f11-8593-fce0f56ab9d7)




