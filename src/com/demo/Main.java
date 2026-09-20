package com.demo;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        StudentManager manager = new StudentManager();
        Scanner scanner = new Scanner(System.in);
        boolean running = true;

        System.out.println("Welcome to the Student Management System");

        while (running) {
            System.out.println("\nPlease select an option:");
            System.out.println("1. Add a new student");
            System.out.println("2. View all students");
            System.out.println("3. Update a student");
            System.out.println("4. Delete a student");
            System.out.println("5. Exit");
            System.out.print("Enter choice: ");

            String choice = scanner.nextLine();

            switch (choice) {
                case "1":
                    System.out.print("Enter name: ");
                    String name = scanner.nextLine();
                    System.out.print("Enter course: ");
                    String course = scanner.nextLine();
                    System.out.print("Enter email: ");
                    String email = scanner.nextLine();
                    System.out.print("Enter mobile: ");
                    String mobile = scanner.nextLine();
                    manager.createStudent(name, course, email, mobile);
                    break;
                case "2":
                    manager.readAllStudents();
                    break;
                case "3":
                    System.out.print("Enter ID of student to update: ");
                    try {
                        int id = Integer.parseInt(scanner.nextLine());
                        System.out.print("Enter new name (leave blank to keep current): ");
                        String newName = scanner.nextLine();
                        System.out.print("Enter new course (leave blank to keep current): ");
                        String newCourse = scanner.nextLine();
                        System.out.print("Enter new email (leave blank to keep current): ");
                        String newEmail = scanner.nextLine();
                        System.out.print("Enter new mobile (leave blank to keep current): ");
                        String newMobile = scanner.nextLine();
                        manager.updateStudent(id, newName, newCourse, newEmail, newMobile);
                    } catch (NumberFormatException e) {
                        System.out.println("Invalid ID format.");
                    }
                    break;
                case "4":
                    System.out.print("Enter ID of student to delete: ");
                    try {
                        int deleteId = Integer.parseInt(scanner.nextLine());
                        manager.deleteStudent(deleteId);
                    } catch (NumberFormatException e) {
                        System.out.println("Invalid ID format.");
                    }
                    break;
                case "5":
                    running = false;
                    System.out.println("Exiting Student Management System. Goodbye!");
                    break;
                default:
                    System.out.println("Invalid choice. Please try again.");
            }
        }
        scanner.close();
    }
}
