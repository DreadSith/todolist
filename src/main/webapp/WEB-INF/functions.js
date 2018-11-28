$(document).ready(function() {

    $('.statusColor:contains("Done")').css('color', 'green');
    $('.statusColor:contains("In Progress")').css('color', 'orange');
    $('.statusColor:contains("Pending")').css('color', 'red');

    $(".del").click(function(e) {
        e.preventDefault();
        var id = +this.id;
        $.ajax({
            url: "/items/" + id,
            type: "DELETE",
            success : function(data){
                alert("Data deleted successfully.");
                location.reload();
            }
        });
    });

    $(".submit").click(function(e) {
        e.preventDefault();
        var id = +this.id

        var dueDateT = document.forms["list_item"]["dueDate"].value;
        var dueDate = dueDateT.split('T');
        var date = dueDate[0].toString();
        var time = dueDate[1].toString();
        var datetime = new Date(date + " " + time);
        var title  = document.forms["list_item"]["title"].value;
        var item = document.forms["list_item"]["item"].value;
        var status = document.forms["list_item"]["status"].value;

        if(id == 0) {

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
                success: function (data) {
                    alert("Data added successfully.");
                    location.reload();
                }
            });

        } else {

            var jsonObj = {
                "dueDate": datetime,
                "title": title,
                "item": item,
                "status": status,
                "id": id,
            }

            var jsonString = JSON.stringify(jsonObj);

            $.ajax({
                url: "/items/" + id,
                type: "PUT",
                contentType: 'application/json',
                data: jsonString,
                success: function (data) {
                    alert("Data updated successfully.");
                    location.reload();
                }
            });
        }

    });

    $(".edit").click(function(e) {
        e.preventDefault();
        var id = +this.id;
        $.ajax({
            url: "/items/" + id,
            type: "GET",
            dataType:'json',
            success : function(data){
                var mydate = new Date(data.dueDate);
                $('#dueDate').val(moment(mydate).format("YYYY-MM-DDThh:mm"));
                $('#title').val(data.title);
                $('#item').val(data.item);
                $('#status').val(data.status);
                $('.submit').attr('id', id);
            }
        });
    });

    $(".clear").click(function(e) {
        e.preventDefault();
        $('#dueDate').val("");
        $('#title').val("");
        $('#item').val("");
        $('#status').val("Done");
        $('.submit').attr('id', 0);
        alert("Data cleared successfully.");
    });

});