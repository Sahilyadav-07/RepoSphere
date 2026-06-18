<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*" %>

<%
String repoName =
(String) request.getAttribute("repoName");

String msg =
request.getParameter("msg");
%>

<!DOCTYPE html>
<html>

<head>

<title>RepoSphere</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    background: linear-gradient(135deg,#0f172a,#1e293b);
    min-height:100vh;
    color:white;
}

.navbar{
    background:#020617;
    border-bottom:1px solid #334155;
}

.logo{
    font-weight:bold;
    font-size:1.8rem;
}

.card-dark{
    background:#1e293b;
    border:none;
    border-radius:18px;
}

.file-row{
    padding:15px;
    border-bottom:1px solid #334155;
}

.file-row:last-child{
    border-bottom:none;
}

.btn{
    transition:0.3s;
}

.btn:hover{
    transform:translateY(-2px);
}

.subtitle{
    color:#94a3b8;
}

.file-name{
    color:white;
    font-weight:500;
}

.card-dark h4{
    color:white;
}

</style>

</head>

<body>

<nav class="navbar navbar-dark">

<div class="container">

<span class="navbar-brand logo">
RepoSphere
</span>

<a href="viewRepos"
   class="btn btn-secondary">
⬅ Back
</a>

</div>

</nav>

<div class="container mt-5">

<h2>
📁 <%= repoName %>
</h2>

<p class="subtitle">
Manage files inside this repository
</p>

<%
if("uploaded".equals(msg)){
%>

<div class="alert alert-success">
    File uploaded successfully.
</div>

<%
}
else if("deleted".equals(msg)){
%>

<div class="alert alert-danger">
    File deleted successfully.
</div>

<%
}
%>

<!-- Upload Section -->

<div class="card card-dark mt-4 shadow">

<div class="card-body">

<h4>Upload File</h4>

<form action="uploadFile"
      method="post"
      enctype="multipart/form-data">

<input type="hidden"
       name="repoName"
       value="<%= repoName %>">

<input type="file"
       class="form-control"
       name="file"
       required>

<br>

<button class="btn btn-success">
Upload
</button>

</form>

</div>

</div>

<!-- Files Section -->

<div class="card card-dark mt-4 shadow">

<div class="card-body">

<h4>Repository Files</h4>

<%
String path =
application.getRealPath("") +
"Repositories/" +
repoName;

File folder =
new File(path);

if(folder.exists()){

File[] files =
folder.listFiles();

if(files != null &&
files.length > 0){

for(File file : files){
%>

<div class="file-row d-flex justify-content-between align-items-center">

<div class="file-name">
📄 <%= file.getName() %>
</div>
<div>

<a href="downloadFile?repoName=<%= repoName %>&fileName=<%= file.getName() %>"
   class="btn btn-primary btn-sm">
Download
</a>

<form action="deleteFile"
      method="post"
      style="display:inline;">

<input type="hidden"
       name="repoName"
       value="<%= repoName %>">

<input type="hidden"
       name="fileName"
       value="<%= file.getName() %>">

<button class="btn btn-danger btn-sm"
        onclick="return confirm('Delete this file?')">
Delete
</button>

</form>

</div>

</div>

<%
}
}
else{
%>

<div class="alert alert-secondary">
No files uploaded.
</div>

<%
}
}
else{
%>

<div class="alert alert-warning">
Repository folder not found.
</div>

<%
}
%>

</div>

</div>

</div>

</body>
</html>