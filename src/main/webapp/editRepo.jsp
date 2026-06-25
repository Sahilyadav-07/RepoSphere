<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
String repoName = request.getParameter("repoName");
%>

<!DOCTYPE html>
<html>

<head>

<title>Edit Repository</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    background: linear-gradient(135deg,#0f172a,#1e293b);
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
}

.card{
    width:600px;
    background:#1e293b;
    color:white;
    border:none;
    border-radius:18px;
}

.logo{
    font-size:2rem;
    font-weight:bold;
}

</style>

</head>

<body>

<div class="card shadow-lg">

<div class="card-body p-5">

<div class="text-center mb-4">

<div class="logo">
✏ RepoSphere
</div>

<p class="text-secondary">
Rename your repository
</p>

</div>

<form action="editRepo" method="post">

<input
type="hidden"
name="oldRepoName"
value="<%= repoName %>">

<div class="mb-3">

<label class="form-label">
Repository Name
</label>

<input
type="text"
class="form-control"
name="newRepoName"
value="<%= repoName %>"
required>

</div>

<div class="d-flex gap-2">

<button class="btn btn-warning">
Update Repository
</button>

<a href="viewRepos"
class="btn btn-secondary">
Cancel
</a>

</div>

</form>

</div>

</div>

</body>

</html>