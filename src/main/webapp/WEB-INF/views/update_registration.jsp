<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Student</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f5f7fb;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }
    .card {
        background: #ffffff;
        box-shadow: 0 10px 25px rgba(15, 23, 42, 0.12);
        border-radius: 12px;
        padding: 32px 40px;
        width: 420px;
    }
    h2 {
        margin-top: 0;
        margin-bottom: 16px;
        font-size: 24px;
        color: #111827;
        text-align: center;
    }
    .subtitle {
        font-size: 13px;
        color: #6b7280;
        text-align: center;
        margin-bottom: 24px;
    }
    .form-group {
        margin-bottom: 16px;
    }
    label {
        display: block;
        margin-bottom: 6px;
        font-size: 13px;
        color: #374151;
        font-weight: 600;
    }
    input[type="text"] {
        width: 100%;
        padding: 10px 12px;
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
        margin-top: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 8px;
        flex-wrap: wrap;
    }
    .btn-primary {
        background: linear-gradient(135deg, #2563eb, #1d4ed8);
        border: none;
        color: white;
        padding: 10px 20px;
        border-radius: 999px;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
        box-shadow: 0 8px 18px rgba(37, 99, 235, 0.35);
        transition: transform 0.1s ease, box-shadow 0.1s ease, background 0.15s ease;
    }
    .btn-primary:hover {
        transform: translateY(-1px);
        box-shadow: 0 12px 28px rgba(37, 99, 235, 0.45);
    }
    .btn-secondary {
        background: transparent;
        border: none;
        color: #2563eb;
        font-size: 13px;
        cursor: pointer;
        text-decoration: underline;
        padding: 0;
    }
    .message {
        margin-top: 16px;
        font-size: 13px;
        color: #16a34a;
        text-align: center;
    }
</style>
</head>
<body>
    <div class="card">
        <h2>Update student</h2>
        <div class="subtitle">Modify the existing student details</div>
        <form action="updateReg" method="post">
            <input type="hidden" name="id" value="${dto.id}"/>
            <div class="form-group">
                <label for="name">Name</label>
                <input id="name" type="text" name="name" value="${dto.name}" required />
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" type="text" name="email" value="${dto.email}" required />
            </div>
            <div class="form-group">
                <label for="mobile">Mobile</label>
                <input id="mobile" type="text" name="mobile" value="${dto.mobile}" maxlength="10" required />
            </div>
            <div class="form-group">
                <label for="course">Course</label>
                <input id="course" type="text" name="course" value="${dto.course}" required />
            </div>
            <div class="actions">
                <button type="submit" class="btn-primary">Update student</button>
                <button type="button" class="btn-secondary" onclick="window.location.href='dashboard'">
                    Dashboard
                </button>
                <button type="button" class="btn-secondary" onclick="window.location.href='findReg'">
                    Back to list
                </button>
            </div>
        </form>
        <div class="message">${msg}</div>
    </div>
</body>
</html>