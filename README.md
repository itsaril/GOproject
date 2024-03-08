# GOproject
Project Name: School Learning Portal

Project Description:
The School Learning Portal is a web application that provides management of educational materials, class schedules, grades, and communication between teachers, students, and parents. Within this project, we will create a fully functional system for managing educational processes in a school.

API Structure:
The API will be built according to the REST architectural style to ensure flexibility and scalability. It will provide endpoints for working with educational materials, class schedules, grades, and users (teachers, students, and parents).

Database Entity Structure and Relationships:
The database will contain the following main entities:

Users (teachers, students, parents) with corresponding attributes (ID, name, email, password, etc.).
Educational materials with attributes (ID, title, description, subject, grade, etc.).
Class schedules with attributes (ID, day of the week, start and end time, subject, teacher, etc.).
Grades with attributes (ID, student, subject, grade, date, etc.).

Working CRUD on one of your database entities:
We will start by implementing CRUD operations (Create, Read, Update, Delete) for managing users. This will allow us to create basic functionality and test the database operations.

Code Structure according to Standard Layout:
The code will be structured according to the principles of Standard Layout to ensure clarity and comprehensibility. Separate packages will be created for handling requests, working with the database, authentication, and other application components.
