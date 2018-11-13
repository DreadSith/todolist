<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script language="JavaScript" type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    </head>

    <body>
        <h1>TODO list</h1>

        <table id = "tbitems" border="1" cellpadding="2" cellspacing="2">
            <tr>
                <th>Due Date</th>
                <th>Title</th>
                <th>Description</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="list_item" items="${items }">
                <tr>
                    <td>${list_item.dueDate }</td>
                    <td>${list_item.title }</td>
                    <td>${list_item.item }</td>
                    <td>${list_item.status }</td>
                    <td><button type="button" class="edit">Edit</button><button type="button" class="del"  id="${list_item.ID }">Delete</button></td>
                </tr>
            </c:forEach>
                <tr>
                    <td><input id="party" type="datetime-local" name="partydate" min="2018-13-01T08:30"></td>
                    <td><input type="text" name="title"></td>
                    <td><textarea name="comment">Enter text here...</textarea></td>
                    <td>
                        <select name="status">
                        <option value="done">Done</option>
                        <option value="inprogress">In Progress</option>
                        <option value="pending">Pending</option>
                    </select>
                    </td>
                    <td><button type="button" class="submit">Submit</button></td>
                </tr>
        </table>
    <script>

        $(document).ready(function() {
// crating new click event for save button
            $(".del").click(function() {
                var id = +this.id;
                $.ajax({
                    url: "/items/" + id,
                    type: "delete",
                    data: {
                        id : id,
                    },
                    success : function(data){
                        alert("Data deleted successfully."); // alerts the response from jsp
                        location.reload();
                    }
                });
            });
        });
    </script>
    </body>
</html>