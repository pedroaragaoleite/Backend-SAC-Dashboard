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
