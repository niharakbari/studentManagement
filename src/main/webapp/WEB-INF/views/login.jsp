<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - Student Management</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: radial-gradient(circle at top, #2563eb 0, #0f172a 55%, #020617 100%);
        margin: 0;
        padding: 0;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        color: #e5e7eb;
    }
    .card {
        background: rgba(15, 23, 42, 0.96);
        border-radius: 16px;
        box-shadow: 0 22px 55px rgba(15, 23, 42, 0.9);
        padding: 28px 32px 24px;
        width: 360px;
        border: 1px solid rgba(148, 163, 184, 0.45);
        backdrop-filter: blur(10px);
    }
    h2 {
        margin: 0 0 6px;
        font-size: 24px;
        color: #f9fafb;
        text-align: center;
    }
    .subtitle {
        font-size: 13px;
        color: #9ca3af;
        text-align: center;
        margin-bottom: 20px;
    }
    .form-group {
        margin-bottom: 16px;
    }
    label {
        display: block;
        margin-bottom: 6px;
        font-size: 13px;
        color: #d1d5db;
        font-weight: 600;
    }
    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 9px 12px;
        border-radius: 10px;
        border: 1px solid #4b5563;
        background: rgba(15, 23, 42, 0.85);
        color: #e5e7eb;
        font-size: 14px;
        box-sizing: border-box;
        transition: border-color 0.15s ease, box-shadow 0.15s ease, background 0.15s ease;
    }
    input[type="text"]:focus,
    input[type="password"]:focus {
        outline: none;
        border-color: #60a5fa;
        box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.4);
        background: rgba(15, 23, 42, 0.95);
    }
    .btn-primary {
        width: 100%;
        background: linear-gradient(135deg, #3b82f6, #2563eb);
        border: none;
        color: white;
        padding: 10px 0;
        border-radius: 999px;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        box-shadow: 0 16px 35px rgba(37, 99, 235, 0.7);
        transition: transform 0.1s ease, box-shadow 0.1s ease;
        margin-top: 6px;
    }
    .btn-primary:hover {
        transform: translateY(-1px);
        box-shadow: 0 22px 45px rgba(37, 99, 235, 0.85);
    }
    .hint {
        margin-top: 10px;
        font-size: 11px;
        color: #9ca3af;
        text-align: center;
    }
    .error {
        margin-top: 10px;
        font-size: 12px;
        color: #fecaca;
        background: rgba(127, 29, 29, 0.6);
        border-radius: 8px;
        padding: 8px 10px;
        text-align: center;
        border: 1px solid rgba(248, 113, 113, 0.6);
    }
</style>
</head>
<body>
    <div class="card">
        <h2>Sign in</h2>
        <div class="subtitle">Use the demo admin account to manage students.</div>
        <form action="login" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" type="text" name="username" value="admin" />
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" type="password" name="password" value="admin123" />
            </div>
            <button type="submit" class="btn-primary">Login</button>
        </form>
        <div class="hint">Demo credentials: admin / admin123</div>
        <c:if test="${not empty error}">
            <div class="error">${error}</div>
        </c:if>
    </div>
</body>
</html>

