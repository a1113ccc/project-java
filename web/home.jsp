<%-- 
    Document   : home
    Created on : Nov 23, 2018, 8:40:13 PM
    Author     : abdelhamid
--%>

<%@page import="com.gestion_medical.UserDao"%>
<%@page import="com.gestion_medical.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Bubbly - Boootstrap 4 Admin template by Bootstrapious.com</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <!-- Google fonts - Popppins for copy-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
    <!-- orion icons-->
    <link rel="stylesheet" href="css/orionicons.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/favicon.png?3">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    
    </head>
    <body>
        <%  String userName = "" + session.getAttribute("username");
            UserDao userDao = new UserDao();
            User user = userDao.getUser(userName);
        %>
        <%  if(userName.equals("null"))
                response.sendRedirect("index.jsp");
        %>
        <!-- Header-->
        <jsp:include page="shared/_headerHome.jsp" ></jsp:include>

        <div class="d-flex align-items-stretch">
            
            <!-- SideBar -->
            <c:choose>
                <c:when test="${user.getUserType().equals("patient")}"><jsp:include page="shared/_sidebarHomePatient.jsp" ></jsp:include></c:when>
                <c:when test="${user.getUserType().equals("medcin")}"><jsp:include page="shared/_sidebarHomeMedcin.jsp" ></jsp:include></c:when>
                <c:when test="${user.getUserType().equals("infermier")}"><jsp:include page="shared/_sidebarHomeInfermier.jsp" ></jsp:include></c:when>
                <c:when test="${user.getUserType().equals("comptable")}"><jsp:include page="shared/_sidebarHomeComptable.jsp" ></jsp:include></c:when>
                <c:when test="${user.getUserType().equals("recepteur")}"><jsp:include page="shared/_sidebarHomeRecepteur.jsp" ></jsp:include></c:when>
                <c:otherwise><jsp:include page="shared/_sidebarHomePatient.jsp" ></jsp:include></c:otherwise>
            </c:choose>
            
      <div class="page-holder w-100 d-flex flex-wrap">
        <div class="container-fluid px-xl-5">
            <!-- content Home -->
            <c:choose>
                <c:when test="${user.getUserType().equals("patient")}"><jsp:include page="shared/_homePatient.jsp" ></jsp:include></c:when>
                <c:when test="${user.getUserType().equals("medcin")}"><jsp:include page="shared/_homeMedcin.jsp" ></jsp:include></c:when>
                <c:when test="${user.getUserType().equals("infermier")}"><jsp:include page="shared/_homeInfermier.jsp" ></jsp:include></c:when>
                <c:when test="${user.getUserType().equals("comptable")}"><jsp:include page="shared/_homeComptable.jsp" ></jsp:include></c:when>
                <c:when test="${user.getUserType().equals("recepteur")}"><jsp:include page="shared/_homeRecepteur.jsp" ></jsp:include></c:when>
                <c:otherwise><jsp:include page="shared/_sidebarHomePatient.jsp" ></jsp:include></c:otherwise>
            </c:choose>
        </div>
            <!-- Footer -->
            <jsp:include page="shared/_footerHome.jsp" ></jsp:include>  
            
      </div>
    </div>
    <!-- JavaScript files-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
    <script src="js/charts-home.js"></script>
    <script src="js/front.js"></script>
    </body>
</html>
