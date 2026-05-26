<%@ page import="java.io.*" %>

<%
    String repoName = (String) request.getAttribute("repoName");
    String msg = request.getParameter("msg");
%>

<h2>Repository: <%= repoName %></h2>

<a href="viewRepos"> Back to Repositories</a>

<% if ("deleted".equals(msg)) { %>
    <p style="color:green;">File deleted successfully</p>
<% } %>

<hr>

<h3>Upload File</h3>

<form action="uploadFile" method="post" enctype="multipart/form-data">
    <input type="hidden" name="repoName" value="<%= repoName %>">
    <input type="file" name="file" required>
    <br><br>
    <button type="submit">Upload</button>
</form>

<hr>

<h3>Files in Repository</h3>

<%
    String path = application.getRealPath("") + "Repositories/" + repoName;
    File folder = new File(path);

    if (folder.exists()) {
        File[] files = folder.listFiles();

        if (files != null && files.length > 0) {
            for (File file : files) {
%>

    <p>
        <!-- Download -->
        <a href="downloadFile?repoName=<%= repoName %>&fileName=<%= file.getName() %>">
            <%= file.getName() %>
        </a>

        <!-- Delete -->
        <form action="deleteFile" method="post" style="display:inline;">
            <input type="hidden" name="repoName" value="<%= repoName %>">
            <input type="hidden" name="fileName" value="<%= file.getName() %>">
            <button type="submit">Delete</button>
        </form>
    </p>

<%
            }
        } else {
%>
    <p>No files uploaded</p>
<%
        }
    } else {
%>
    <p>No repository folder found</p>
<%
    }
%>