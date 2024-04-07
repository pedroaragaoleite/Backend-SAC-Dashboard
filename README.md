# Backend-SAC-Dashboard

## Full Stack Dashboard Project
This project is a full-stack application designed to provide a dynamic and responsive dashboard for managing users, customers, and projects. The backend is built with Node.js and Express, leveraging MySQL for data storage, while the frontend utilizes Angular 17 along with Tailwind CSS for a modern, responsive user interface. This README outlines the project setup, key features, and how to get started with both the backend and frontend.

# Key Features


## Backend

* Secure Authentication: Uses JWT or secure cookies for handling user authentication securely.

* CRUD Operations: Comprehensive support for creating, reading, updating, and deleting (CRUD) users, customers, and projects.

* MySQL Database: Structured data storage for reliability and efficiency.


## Frontend

* Angular 17: Leveraging the latest Angular framework for building a scalable and maintainable web App.

* Tailwind CSS: Utilizes Tailwind CSS for styling, ensuring a responsive and customizable UI with minimal effort.

* Dynamic Charting: Integrates charting solutions to visualize data, providing insights into various metrics like project progress, user activity, and customer engagement.

* Token/Cookie-Based Authentication: Implements a secure authentication flow, seamlessly connecting with the backend for user sessions.


# Getting Started

## Installation

Prerequisites
Node.js and npm (Node Package Manager)
MySQL Database
Angular CLI

## Backend Setup

1 - Clone the repository and navigate to the backend directory.
> git clone https://github.com/pedroaragaoleite/Backend-SAC-Dashboard.git

2 - Install dependecies
npm install

3- Create an .env file in the root directory

4 - Add the database and token information:
PORT=3000
DB_HOST= localhost
DB_PORT= db_port
DB_USER = root
DB_PASSWORD = your_password
DB_DATABASE = sac
JWT_TOKEN= your_secret_token


## Frontend Setup

1-  Clone the repository and navigate to the frontend directory.

2 - Install dependecies
npm install


# Development server

## Frontend

1 - Run ng serve

2 - Navigate to http://localhost:4200/. The application will automatically reload if you change any of the source files.

## Backend

1 - Start Apache and MySQL in XAMPP
2 - run npm run dev

# MySql
Create the data base using the sac.sql file in the Backend


## Contact
Pedro de Aragão - pedro.aragao.leite@gmail.com







## Table of Contents
1. [General Info](#general-info)
2. [Technologies](#technologies)
3. [Installation](#installation)
4. [Collaboration](#collaboration)
5. [FAQs](#faqs)
### General Info
***
Write down general information about your project. It is a good idea to always put a project status in the readme file. This is where you can add it. 
### Screenshot
![Image text](https://www.united-internet.de/fileadmin/user_upload/Brands/Downloads/Logo_IONOS_by.jpg)
## Technologies
***
A list of technologies used within the project:
* [Technology name](https://example.com): Version 12.3 
* [Technology name](https://example.com): Version 2.34
* [Library name](https://example.com): Version 1234
## Installation
***
A little intro about the installation. 
```
$ git clone https://example.com
$ cd ../path/to/the/file
$ npm install
$ npm start
```
Side information: To use the application in a special environment use ```lorem ipsum``` to start
## Collaboration
***
Give instructions on how to collaborate with your project.
> Maybe you want to write a quote in this part. 
> Should it encompass several lines?
> This is how you do it.
## FAQs
***
A list of frequently asked questions
1. **This is a question in bold**
Answer to the first question with _italic words_. 
2. __Second question in bold__ 
To answer this question, we use an unordered list:
* First point
* Second Point
* Third point
3. **Third question in bold**
Answer to the third question with *italic words*.
4. **Fourth question in bold**
| Headline 1 in the tablehead | Headline 2 in the tablehead | Headline 3 in the tablehead |
|:--------------|:-------------:|--------------:|
| text-align left | text-align center | text-align right |
