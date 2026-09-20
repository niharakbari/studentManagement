<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Students</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f5f7fb;
        margin: 0;
        padding: 32px;
    }
    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 24px;
        gap: 12px;
        flex-wrap: wrap;
    }
    h2 {
        margin: 0;
        font-size: 24px;
        color: #111827;
    }
    .btn-primary {
        background: linear-gradient(135deg, #2563eb, #1d4ed8);
        border: none;
        color: white;
        padding: 8px 16px;
        border-radius: 999px;
        font-size: 13px;
        font-weight: 600;
        cursor: pointer;
        box-shadow: 0 6px 14px rgba(37, 99, 235, 0.35);
        text-decoration: none;
    }
    .btn-secondary {
        background: #e5e7eb;
        border: none;
        color: #374151;
        padding: 8px 16px;
        border-radius: 999px;
        font-size: 13px;
        font-weight: 600;
        cursor: pointer;
        text-decoration: none;
        margin-right: 6px;
    }
    .table-wrapper {
        background: #ffffff;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(15, 23, 42, 0.12);
        padding: 16px 24px 24px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        padding: 10px 8px;
        text-align: left;
        font-size: 14px;
    }
    th {
        color: #6b7280;
        text-transform: uppercase;
        font-size: 11px;
        letter-spacing: 0.05em;
        border-bottom: 1px solid #e5e7eb;
    }
    tr:nth-child(even) {
        background-color: #f9fafb;
    }
    td.actions a {
        font-size: 12px;
        padding: 4px 10px;
        border-radius: 999px;
        text-decoration: none;
        margin-right: 6px;
    }
    .link-delete {
        background: #fee2e2;
        color: #b91c1c;
    }
    .link-update {
        background: #dbeafe;
        color: #1d4ed8;
    }
</style>
</head>
<body>
    <div class="header">
        <h2>All students</h2>
        <div>
            <a class="btn-secondary" href="dashboard">Dashboard</a>
            <a class="btn-secondary" href="search">Search</a>
            <a class="btn-primary" href="view">+ Add new student</a>
        </div>
    </div>
    <div class="table-wrapper">
        <table>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Course</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="student" items="${students}">
                <tr>
                    <td>${student.name}</td>
                    <td>${student.email}</td>
                    <td>${student.mobile}</td>
                    <td>${student.course}</td>
                    <td class="actions">
                        <a class="link-update" href="studentByIdReg?id=${student.id}">Update</a>
                        <a class="link-delete" href="deleteReg?id=${student.id}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>