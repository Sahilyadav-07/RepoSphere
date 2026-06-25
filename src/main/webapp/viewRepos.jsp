<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>

<%
ArrayList<String> repos =
(ArrayList<String>) request.getAttribute("repos");
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

.repo-card{
    background:#1e293b;
    border:none;
    border-radius:18px;
    transition:0.3s;
}

.repo-card:hover{
    transform:translateY(-4px);
    box-shadow:0 15px 35px rgba(0,0,0,0.3);
}

.repo-name{
	color:white;
    font-size:1.2rem;
    font-weight:600;
}

.subtitle{
    color:#94a3b8;
}

.logo{
    font-weight:bold;
    font-size:1.8rem;
}

.btn{
    transition:0.3s;
}

.btn:hover{
    transform:translateY(-2px);
}

</style>

</head>



<body>

<nav class="navbar navbar-dark">

<div class="container">

<span class="navbar-brand logo">
RepoSphere
</span>

<a href="createRepo.jsp"
   class="btn btn-success">
+ Create Repository
</a>

</div>

</nav>

<div class="container mt-5">

<h2>Your Repositories</h2>

<p class="subtitle">
Manage all your repositories from one place.
</p>

<%
String msg = request.getParameter("msg");

if("created".equals(msg)){
%>

<div class="alert alert-success">
    Repository created successfully and added to your dashboard.
</div>

<%
}
else if("updated".equals(msg)){
%>

<div class="alert alert-success">
    Repository renamed successfully.
</div>

<%
}
else if("deleted".equals(msg)){
%>

<div class="alert alert-danger">
    Repository deleted successfully.
</div>

<%
}
else if("failed".equals(msg)){
%>

<div class="alert alert-danger">
    Unable to rename repository.
</div>

<%
}
else if("error".equals(msg)){
%>

<div class="alert alert-danger">
    Something went wrong.
</div>

<%
}
%>


<p class="subtitle">
<%= (repos != null) ? repos.size() : 0 %> repositories available
</p>

<div class="mb-4">
	<input type="text"
		id="searchRepo"
		class="form-control"
		placeholder="Search Repository">
</div>

<%
if(repos != null && repos.size() > 0){

for(String repo : repos){
%>

<div class="card repo-card mb-3">

<div class="card-body d-flex justify-content-between align-items-center">

<div>

<div class="repo-name repo-title">
📁 <%= repo %>
</div>

<div class="subtitle">
Repository
</div>

</div>

<div>

<form action="openRepo"
      method="get"
      style="display:inline;">

<input type="hidden"
       name="repoName"
       value="<%= repo %>">

<button class="btn btn-primary">
Open
</button>

</form>

<form action="editRepo.jsp"
      method="get"
      style="display:inline;">

    <input type="hidden"
           name="repoName"
           value="<%= repo %>">

    <button type="submit"
            class="btn btn-secondary">
        Edit
    </button>

</form>

<form action="deleteRepo"
      method="post"
      style="display:inline;">

    <input type="hidden"
           name="repoName"
           value="<%= repo %>">

    <button class="btn btn-danger"
            onclick="return confirm('Delete repository?')">
        Delete
    </button>

</form>

</div>

</div>

</div>

<%
}
}
else{
%>

<div class="alert alert-dark">

No repositories found.

<br><br>

<a href="createRepo.jsp"
   class="btn btn-success">
Create Your First Repository
</a>

</div>

<%
}
%>

</div>

<script>
document.getElementById("searchRepo").addEventListener("keyup", function() {

    let search = this.value.toLowerCase();

    let cards = document.querySelectorAll(".repo-card");

    cards.forEach(function(card) {

        let repoName = card.querySelector(".repo-title")
                           .innerText
                           .toLowerCase();

        if (repoName.includes(search)) {
            card.style.display = "";
        } else {
            card.style.display = "none";
        }
    });

});
</script>

</body>
</html>