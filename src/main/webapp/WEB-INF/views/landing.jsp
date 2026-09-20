<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management System</title>
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
    .shell {
        max-width: 800px;
        width: 100%;
        padding: 32px 20px;
    }
    .card {
        background: rgba(15, 23, 42, 0.92);
        border-radius: 20px;
        box-shadow: 0 24px 60px rgba(15, 23, 42, 0.8);
        padding: 32px 32px 28px;
        border: 1px solid rgba(148, 163, 184, 0.3);
        backdrop-filter: blur(12px);
    }
    .badge {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        padding: 4px 10px;
        border-radius: 999px;
        background: rgba(37, 99, 235, 0.15);
        color: #bfdbfe;
        font-size: 11px;
        text-transform: uppercase;
        letter-spacing: 0.09em;
        margin-bottom: 12px;
    }
    .badge-dot {
        width: 8px;
        height: 8px;
        border-radius: 999px;
        background: #22c55e;
        box-shadow: 0 0 0 4px rgba(34, 197, 94, 0.28);
    }
    h1 {
        margin: 0 0 10px;
        font-size: 32px;
        color: #f9fafb;
    }
    .subtitle {
        font-size: 14px;
        color: #9ca3af;
        max-width: 520px;
        margin-bottom: 24px;
    }
    .actions {
        display: flex;
        gap: 12px;
        margin-bottom: 26px;
        flex-wrap: wrap;
    }
    .btn-primary,
    .btn-secondary {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 10px 18px;
        border-radius: 999px;
        font-size: 14px;
        font-weight: 600;
        border: none;
        cursor: pointer;
        text-decoration: none;
        transition: transform 0.1s ease, box-shadow 0.1s ease, background 0.15s ease;
        white-space: nowrap;
    }
    .btn-primary {
        background: linear-gradient(135deg, #3b82f6, #2563eb);
        color: #f9fafb;
        box-shadow: 0 16px 35px rgba(37, 99, 235, 0.55);
    }
    .btn-primary:hover {
        transform: translateY(-1px);
        box-shadow: 0 22px 45px rgba(37, 99, 235, 0.75);
    }
    .btn-secondary {
        background: rgba(15, 23, 42, 0.8);
        color: #cbd5f5;
        border: 1px solid rgba(148, 163, 184, 0.5);
    }
    .btn-secondary:hover {
        background: rgba(15, 23, 42, 0.95);
    }
    .meta-row {
        display: flex;
        gap: 16px;
        flex-wrap: wrap;
        font-size: 12px;
        color: #9ca3af;
    }
    .pill {
        padding: 4px 10px;
        border-radius: 999px;
        border: 1px solid rgba(148, 163, 184, 0.4);
    }
</style>
</head>
<body>
    <div class="shell">
        <div class="card">
            <div class="badge">
                <span class="badge-dot"></span>
                Student Management System
            </div>
            <h1>Welcome to your student dashboard</h1>
            <div class="subtitle">
                Add new students, update existing records, and browse all registrations
                with a clean, simple interface powered by Spring MVC and JSP.
            </div>
            <div class="actions">
                <a href="view" class="btn-primary">+ Add new student</a>
                <a href="findReg" class="btn-secondary">View all students</a>
            </div>
            <div class="meta-row">
                <div class="pill">Spring MVC · JSP · Hibernate/JPA</div>
                <div class="pill">Backed by your MySQL database</div>
            </div>
        </div>
    </div>
</body>
</html>

