<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String repoName = request.getParameter("repoName");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit Repository | RepoSphere</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    background:linear-gradient(135deg,#0f172a,#1e293b);
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    color:white;
    font-family:Arial, Helvetica, sans-serif;
}

.card{
    width:100%;
    max-width:650px;
    background:#1e293b;
    border:none;
    border-radius:20px;
    box-shadow:0 20px 45px rgba(0,0,0,.35);
}

.logo{
	color:white;
    font-size:2rem;
    font-weight:700;
}

.subtitle{
    color:#94a3b8;
}

.current-box{
    background:#111827;
    border:1px solid #374151;
    border-radius:12px;
    padding:18px;
    font-size:1.15rem;
    font-weight:600;
    color:white;
    user-select:none;
    cursor:default;
}

.form-control{
    background:#0f172a;
    color:white;
    border:1px solid #334155;
    height:50px;
}

.form-control:focus{
    background:#0f172a;
    color:white;
    border-color:#22c55e;
    box-shadow:0 0 0 .2rem rgba(34,197,94,.15);
}

.form-control::placeholder{
    color:#94a3b8;
}

.form-label{
	color:white;
	font-weight:600;
	margin-bottom:6px;	
}

.btn{
    transition:.3s;
}

.btn:hover{
    transform:translateY(-2px);
}

.btn{
    transition:.25s ease;
}

</style>

</head>

<body>

<div class="card">

<div class="card-body p-5">

<div class="text-center mb-4">

<div class="logo">
📁 Edit Repository
</div>

<p class="subtitle">
Rename your repository without affecting its files.
</p>

</div>

<form action="editRepo" method="post">

<input
type="hidden"
name="oldRepoName"
value="<%= repoName %>">

<div class="mb-4">

<label class="form-label">
Current Name
</label>

<div class="current-box">
📁 <%= repoName %>
</div>

</div>

<div class="mb-4">

<label class="form-label">
New Name
</label>

<input
type="text"
name="newRepoName"
class="form-control"
value="<%= repoName %>"
placeholder="Enter new repository name"
required>

</div>

<div class="d-flex justify-content-between">

<a href="viewRepos" class="btn btn-outline-light px-4">
 Cancel
</a>

<button class="btn btn-success px-4">
Update Repository
</button>

</div>

</form>

</div>

</div>

</body>

</html>