<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script language="JavaScript" type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js"></script>
        <style><jsp:directive.include file="/WEB-INF/styles.css"/></style>
        <script><jsp:directive.include file="/WEB-INF/functions.js"/></script>
    </head>

    <body>
        <h1>TODO list</h1>

        <table id = "tbitems" align="center" border="1" cellpadding="2" cellspacing="2">
            <tr>
                <th>Due Date</th>
                <th>Title</th>
                <th>Description</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="list_item" items="${items}">
                <tr>
                    <td><fmt:formatDate value="${list_item.dueDate}" pattern="yyyy-MM-dd hh:mm a"/></td>
                    <td width="150px">${list_item.title}</td>
                    <td width="350px">${list_item.item}</td>
                    <td class = statusColor>${list_item.status}</td>
                    <td><nobr><button type="button" class="edit" id="${list_item.ID}">Edit</button><button type="button" class="del" id="${list_item.ID}">Delete</button></nobr></td>
                </tr>
            </c:forEach>
            <form name="list_item">
                <tr>
                    <td><input type="datetime-local" id="dueDate" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}"/></td>
                    <td><input type="text" id="title"></td>
                    <td><textarea id="item"></textarea></td>
                    <td>
                        <select id="status">
                        <option value="Done">Done</option>
                        <option value="In Progress">In Progress</option>
                        <option value="Pending">Pending</option>
                    </select>
                    </td>
                    <td><button type="button" class="submit" id=0>Submit</button><button type="button" class="clear">Clear</button></td>
                </tr>
            </form>
        </table>
    </body>
</html>