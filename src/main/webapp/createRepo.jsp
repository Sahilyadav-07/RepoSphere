<!DOCTYPE html>
<html>
<head>
<title>RepoSphere</title>

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
    border:none;
    border-radius:20px;
    background:#1e293b;
    color:white;
}

.btn-create{
    background:#10b981;
    border:none;
}

.btn-create:hover{
    background:#059669;
}

.logo{
    font-size:2rem;
    font-weight:bold;
}
</style>

</head>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<body>

<div class="card shadow-lg">

<div class="card-body p-5">

<div class="text-center mb-4">

<div class="logo">
<i class="bi bi-folder-fill text-success"></i>
RepoSphere
</div>

<p class="text-secondary">
Create and manage repositories effortlessly.
</p>

</div>

<form action="createRepo" method="post">

<div class="mb-3">

<label class="form-label">
Repository Name
</label>

<input type="text"
       class="form-control"
       name="repoName"
       placeholder="e.g. AI-Project"
       required>

</div>

<div class="d-flex gap-2">

<button class="btn btn-create text-white">
Create Repository
</button>

<a href="viewRepos"
   class="btn btn-secondary">
Back
</a>

</div>

</form>

</div>

</div>

</body>
</html>