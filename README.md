# Student Management System

## Overview
The Student Management System is a robust, console-based Java application designed to efficiently handle student records. Built with core Object-Oriented Programming (OOP) principles such as encapsulation, modularity, and clean class design, this system provides a reliable way to perform Create, Read, Update, and Delete (CRUD) operations on student data. It currently uses an in-memory collection to store records, making it extremely lightweight and perfect for demonstrations, with optional database integration queries provided for future scalability.

## Tech Stack
* Language: Java (Core Java, JDK 8 or higher)
* Architecture: Console-based, pure OOP structure
* Storage: In-memory Collections (ArrayList)
* Database (Optional/Prepared): MySQL (schema provided)

## Local Setup and Run Instructions

### Prerequisites
* Java Development Kit (JDK) 8 or later installed on your machine.
* A terminal or command prompt.

### Compilation and Execution
1. Open your terminal and navigate to the root directory of the project.
2. Compile the Java source files using the `javac` command:
   ```bash
   javac src/com/demo/*.java
   ```
3. Run the compiled application using the `java` command, specifying the fully qualified name of the `Main` class and the classpath:
   ```bash
   java -cp src com.demo.Main
   ```
4. Follow the on-screen prompts to manage student records.

### Database Setup (Optional)
If you wish to integrate a database in the future, a `schema.sql` file is included in the root directory. You can execute this script in your MySQL environment to create the required database and tables.
