<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Students</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f5f7fb;
        margin: 0;
        padding: 32px;
    }
    .layout {
        max-width: 960px;
        margin: 0 auto;
    }
    .top-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 12px;
        gap: 12px;
        flex-wrap: wrap;
    }
    h2 {
        margin: 0 0 16px;
        font-size: 24px;
        color: #111827;
    }
    .subtitle {
        font-size: 13px;
        color: #6b7280;
        margin-bottom: 20px;
    }
    .btn-nav {
        background: #e5e7eb;
        color: #374151;
        padding: 6px 14px;
        border-radius: 999px;
        font-size: 12px;
        font-weight: 600;
        text-decoration: none;
        margin-left: 6px;
    }
    .search-card {
        background: #ffffff;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(15, 23, 42, 0.12);
        padding: 20px 24px 18px;
        margin-bottom: 24px;
    }
    .form-row {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 16px 20px;
    }
    label {
        display: block;
        margin-bottom: 6px;
        font-size: 12px;
        color: #374151;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.04em;
    }
    input[type="text"] {
        width: 100%;
        padding: 9px 11px;
        border-radius: 8px;
        border: 1px solid #d1d5db;
        font-size: 14px;
        box-sizing: border-box;
        transition: border-color 0.15s ease, box-shadow 0.15s ease;
    }
    input[type="text"]:focus {
        outline: none;
        border-color: #2563eb;
        box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.15);
    }
    .actions {
        margin-top: 16px;
        display: flex;
        gap: 10px;
        justify-content: flex-start;
    }
    .btn-primary,
    .btn-secondary {
        padding: 8px 16px;
        border-radius: 999px;
        font-size: 13px;
        font-weight: 600;
        border: none;
        cursor: pointer;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        justify-content: center;
    }
    .btn-primary {
        background: linear-gradient(135deg, #2563eb, #1d4ed8);
        color: #ffffff;
        box-shadow: 0 8px 18px rgba(37, 99, 235, 0.4);
    }
    .btn-secondary {
        background: #e5e7eb;
        color: #374151;
    }
    .results-card {
        background: #ffffff;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(15, 23, 42, 0.1);
        padding: 18px 22px 20px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        padding: 9px 8px;
        font-size: 14px;
        text-align: left;
    }
    th {
        color: #6b7280;
        text-transform: uppercase;
        font-size: 11px;
        letter-spacing: 0.06em;
        border-bottom: 1px solid #e5e7eb;
    }
    tr:nth-child(even) {
        background-color: #f9fafb;
    }
    .empty {
        font-size: 13px;
        color: #6b7280;
        padding: 4px 0 2px;
    }
</style>
</head>
<body>
    <div class="layout">
        <div class="top-row">
            <h2>Search students</h2>
            <div>
                <a class="btn-nav" href="dashboard">Dashboard</a>
                <a class="btn-nav" href="findReg">All students</a>
            </div>
        </div>
        <div class="subtitle">
            Search by name, course, email or a combination of email and mobile number.
            Only one search type is applied at a time.
        </div>

        <div class="search-card">
            <form action="search" method="get">
                <div class="form-row">
                    <div>
                        <label for="name">Name contains</label>
                        <input id="name" type="text" name="name" value="${param.name}" />
                    </div>
                    <div>
                        <label for="course">Course equals</label>
                        <input id="course" type="text" name="course" value="${param.course}" />
                    </div>
                    <div>
                        <label for="email">Email</label>
                        <input id="email" type="text" name="email" value="${param.email}" />
                    </div>
                    <div>
                        <label for="mobile">Mobile</label>
                        <input id="mobile" type="text" name="mobile" value="${param.mobile}" />
                    </div>
                </div>
                <div class="actions">
                    <button type="submit" class="btn-primary">Search</button>
                    <a href="search" class="btn-secondary">Clear</a>
                </div>
            </form>
        </div>

        <div class="results-card">
            <c:choose>
                <c:when test="${not empty results}">
                    <table>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Mobile</th>
                            <th>Course</th>
                        </tr>
                        <c:forEach var="student" items="${results}">
                            <tr>
                                <td>${student.name}</td>
                                <td>${student.email}</td>
                                <td>${student.mobile}</td>
                                <td>${student.course}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="empty">
                        Enter criteria above and click <strong>Search</strong> to see results.
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>

