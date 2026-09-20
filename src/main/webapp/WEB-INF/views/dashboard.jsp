<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard - Student Management</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #0f172a;
        margin: 0;
        padding: 32px;
        color: #e5e7eb;
    }
    .layout {
        max-width: 960px;
        margin: 0 auto;
    }
    .top-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 24px;
    }
    h2 {
        margin: 0;
        font-size: 26px;
        color: #f9fafb;
    }
    .top-actions a {
        margin-left: 10px;
        padding: 8px 16px;
        border-radius: 999px;
        font-size: 13px;
        font-weight: 600;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        justify-content: center;
    }
    .btn-primary {
        background: linear-gradient(135deg, #3b82f6, #2563eb);
        color: #f9fafb;
        box-shadow: 0 16px 35px rgba(37, 99, 235, 0.6);
    }
    .btn-secondary {
        background: rgba(15, 23, 42, 0.9);
        color: #e5e7eb;
        border: 1px solid rgba(148, 163, 184, 0.6);
    }
    .cards {
        display: grid;
        grid-template-columns: repeat(3, minmax(0, 1fr));
        gap: 18px;
        margin-bottom: 26px;
    }
    .card {
        background: rgba(15, 23, 42, 0.95);
        border-radius: 16px;
        padding: 18px 18px 16px;
        box-shadow: 0 18px 40px rgba(15, 23, 42, 0.85);
        border: 1px solid rgba(148, 163, 184, 0.5);
    }
    .card-title {
        font-size: 12px;
        text-transform: uppercase;
        letter-spacing: 0.08em;
        color: #9ca3af;
        margin-bottom: 8px;
    }
    .card-value {
        font-size: 28px;
        font-weight: 700;
        color: #f9fafb;
    }
    .courses {
        background: rgba(15, 23, 42, 0.96);
        border-radius: 16px;
        padding: 18px 20px 16px;
        box-shadow: 0 18px 40px rgba(15, 23, 42, 0.85);
        border: 1px solid rgba(148, 163, 184, 0.5);
    }
    .courses-title {
        font-size: 13px;
        text-transform: uppercase;
        letter-spacing: 0.08em;
        color: #9ca3af;
        margin-bottom: 10px;
    }
    .course-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 6px 0;
        border-bottom: 1px solid rgba(55, 65, 81, 0.7);
        font-size: 14px;
    }
    .course-row:last-child {
        border-bottom: none;
    }
    .course-name {
        color: #e5e7eb;
    }
    .course-count {
        color: #93c5fd;
        font-weight: 600;
    }
</style>
</head>
<body>
    <div class="layout">
        <div class="top-row">
            <h2>Student dashboard</h2>
            <div class="top-actions">
                <a href="view" class="btn-primary">+ Add student</a>
                <a href="findReg" class="btn-secondary">View all</a>
                <a href="search" class="btn-secondary">Advanced search</a>
                <a href="logout" class="btn-secondary">Logout</a>
            </div>
        </div>

        <div class="cards">
            <div class="card">
                <div class="card-title">Total students</div>
                <div class="card-value">${totalStudents}</div>
            </div>
            <div class="card">
                <div class="card-title">Distinct courses</div>
                <div class="card-value">
                    <c:choose>
                        <c:when test="${not empty countsByCourse}">
                            ${fn:length(countsByCourse)}
                        </c:when>
                        <c:otherwise>0</c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="card">
                <div class="card-title">Most popular course</div>
                <div class="card-value">
                    <c:choose>
                        <c:when test="${not empty countsByCourse}">
                            <c:forEach var="entry" items="${countsByCourse}" varStatus="status">
                                <c:if test="${status.first}">${entry.key}</c:if>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>n/a</c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <div class="courses">
            <div class="courses-title">Students per course</div>
            <c:choose>
                <c:when test="${not empty countsByCourse}">
                    <c:forEach var="entry" items="${countsByCourse}">
                        <div class="course-row">
                            <div class="course-name">${entry.key}</div>
                            <div class="course-count">${entry.value}</div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="course-row">
                        <div class="course-name">No data yet</div>
                        <div class="course-count">0</div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>

