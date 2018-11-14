<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                    <td><fmt:formatDate value="${list_item.dueDate}" pattern="yyyy-MM-dd hh:mm a" /></td>
                    <td width="150px">${list_item.title }</td>
                    <td width="350px">${list_item.item }</td>
                    <td>${list_item.status }</td>
                    <td><nobr><button type="button" class="edit" id="${list_item.ID }">Edit</button><button type="button" class="del"  id="${list_item.ID }">Delete</button></nobr></td>
                </tr>
            </c:forEach>
            <form name="list_item">
                <tr>
                    <td><input type="datetime-local" id="dueDate" pattern="[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}"/></td>
                    <td><input type="text" id="title"></td>
                    <td><textarea id="item" style="border: none; width: 100%; -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;"></textarea></td>
                    <td>
                        <select id="status">
                        <option value="Done">Done</option>
                        <option value="In Progress">In Progress</option>
                        <option value="Pending">Pending</option>
                    </select>
                    </td>
                    <td><button type="button" class="submit" style="display: block; margin: auto;">Submit</button></td>
                </tr>
            </form>
        </table>
    <script>

        $(document).ready(function() {
// crating new click event for save button
            $(".del").click(function(e) {
                e.preventDefault();
                var id = +this.id;
                $.ajax({
                    url: "/items/" + id,
                    type: "DELETE",
                    data: {
                        id : id,
                    },
                    success : function(data){
                        alert("Data deleted successfully."); // alerts the response from jsp
                        location.reload();
                    }
                });
            });

            // crating new click event for save button
            $(".submit").click(function(e) {
                e.preventDefault();

                var dueDateT = document.forms["list_item"]["dueDate"].value;
                var dueDate = dueDateT.split('T');
                var date = dueDate[0].toString();
                var time = dueDate[1].toString();
                var datetime = new Date(date + " " + time);
                var title  = document.forms["list_item"]["title"].value;
                var item = document.forms["list_item"]["item"].value;
                var status = document.forms["list_item"]["status"].value;

                var jsonObj = {
                    "dueDate": datetime,
                    "title": title,
                    "item": item,
                    "status": status,
                }

                var jsonString = JSON.stringify(jsonObj);

                $.ajax({
                    url: "/items",
                    type: "POST",
                    contentType: 'application/json',
                    data: jsonString,
                    success : function(data){
                        alert("Data added successfully."); // alerts the response from jsp
                        location.reload();
                    }
                });
            });


        });
    </script>
    </body>
</html>