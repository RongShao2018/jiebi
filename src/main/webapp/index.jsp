<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>test</title>
</head>
<script>
    function selectUser() {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                document.getElementById("test").innerHTML = xmlhttp.responseText;
            }
        }
        xmlhttp.open("POST", "user/showUser.do", true);
        xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xmlhttp.send("id=1");
    }
</script>
<body>
<p id="test">Hello World!</p>
<button type="button" onclick="selectUser()">onclick test</button>

<form action="/user/login" method="post">
    id:<input type="text" id="id" name="id"><br>
    password:<input type="password" id="password" name="password"><br>
    <input type="submit" value="login" id="login"><br>
</form>

<a href="regist.jsp">regist</a><br>
<%--<a href="deleteUser.jsp">deleteUser</a><br>
<a href="updatePW.jsp">updatePW</a><br>--%>
</body>

</html>
