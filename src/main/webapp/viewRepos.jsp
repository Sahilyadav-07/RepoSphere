<%@ page import="java.util.*" %>

<h2>All Repositories</h2>

<%
    ArrayList<String> repos = (ArrayList<String>) request.getAttribute("repos");

    if (repos != null && repos.size() > 0) {
        for (String repo : repos) {
%>
    <p>
        <%= repo %>

        <form action="openRepo" method="get" style="display:inline;">
            <input type="hidden" name="repoName" value="<%= repo %>">
            <button type="submit">Open</button>
        </form>

        <form action="deleteRepo" method="post" style="display:inline;">
            <input type="hidden" name="repoName" value="<%= repo %>">
            <button type="submit">Delete</button>
        </form>
    </p>
<%
        }
    } else {
%>
    <p>No repositories found</p>
<%
    }
%>

<br>
<a href="createRepo.jsp">Create New Repository</a>