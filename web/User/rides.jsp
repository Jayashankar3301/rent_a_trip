<%@page import="java.sql.Date"%>
<!DOCTYPE html>
<!--[if IE 7]>                  <html class="ie7 no-js" lang="en">     <![endif]-->
<!--[if lte IE 8]>              <html class="ie8 no-js" lang="en">     <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> 
    <%
if(session.getAttribute("userid") == null) {
       response.sendRedirect("log.jsp");
       return ;
    }
%>
<html>  <!--<![endif]-->
    
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="DB.DBConnection"></jsp:useBean>
    <head>
    <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>Rent A Trip - Rides</title>
        <meta name="description" content="">
        <meta name="author" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- Mobile Specific Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Styles -->

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Forms -->
        <link href="css/jquery.idealforms.css" rel="stylesheet">
        <!-- Select  -->
        <link href="css/jquery.idealselect.css" rel="stylesheet">
        <!-- Slicknav  -->
        <link href="css/slicknav.css" rel="stylesheet">
        <!-- Main style -->
        <link href="css/style.css" rel="stylesheet">

        <!-- Modernizr -->
        <script src="js/modernizr.js"></script>

        <!-- Fonts -->
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href='http://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        
        
        <%
                               
            String from="";
            String to="";
            String date="";
            String seats="";
        if (request.getParameter("submit") != null) {
            from= request.getParameter("from");
            to= request.getParameter("to");
            date= request.getParameter("date");
            seats= request.getParameter("seats");
             
             session.setAttribute("from", from);
             session.setAttribute("to", to);
             session.setAttribute("date", date);
             session.setAttribute("seats", seats);
             session.setMaxInactiveInterval(-1);
             response.sendRedirect("ridelist.jsp");
             
            }
             %>
        

    </head>

    <body>

        <header class="header">

            <div class="top-menu">

                <section class="container">
                    <div class="row">

                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <div class="user-log">
                               <% String user =session.getAttribute("user").toString(); %>
                                Welcome <%=user%>
                            </div><!-- end .user-log -->
                        </div><!-- end .col-sm-4 -->

                        <div class="col-md-8 col-sm-8 col-xs-12">

                            <ul class="social-icons">
                                <li>
                                    <a class="facebook" href="#">
                                        <i class="fa fa-facebook"></i>
                                    </a>
                                </li>
                                <li>
                                    <a class="twitter" href="#">
                                        <i class="fa fa-twitter"></i>
                                    </a>
                                </li>
                                <li>
                                    <a class="google" href="#">
                                        <i class="fa fa-google-plus"></i>
                                    </a>
                                </li>
                            </ul>

                        </div><!-- end .col-sm-8 -->

                    </div><!-- end .row -->
                </section><!-- end .container -->

            </div><!-- end .top-menu -->

            <div class="main-baner">

                <div class="background parallax clearfix" style="background-image:url('img/tumblr_n7yhhvUQtx1st5lhmo1_1280.jpg');" data-img-width="1600" data-img-height="1064">

                    <div class="main-parallax-content">

                        <div class="second-parallax-content">

                            <section class="container">

                                <div class="row">

                                    <div class="main-header-container clearfix">

                                        <div class="col-md-4 col-sm-12 col-xs-12">

                                            <div class="logo">
                                                <h1>Rent A Trip</h1>
                                            </div><!-- end .logo -->

                                        </div><!-- end .col-sm-4 -->

                                        <div class="col-md-8 col-sm-8 col-xs-12">

                                            <nav id="nav" class="main-navigation">

                                                <ul class="navigation">
                                                    <li>
                                                        <a href="home.jsp">Home</a>
                                                    </li>
                                                    <li>
                                                        <a href="rides.jsp">Rides</a>
                                                    </li>
                                                    <li>
                                                        <a href="singletrip.jsp">Submit</a>
                                                    </li>
                                                    <li>
                                                        <a href="#">Pages</a>
                                                        <ul class="sub-menu">
                                                            <li>
                                                                <a href="myrides.jsp">My Rides</a>
                                                            </li>
                                                            <li>
                                                                <a href="myrequests.jsp">My Requests</a>
                                                            </li>
                                                            <li>
                                                                <a href="viewrequests.jsp">Requests to you</a>
                                                            </li>
                                                            <li>
                                                                <a href="register_vehicle.jsp">Add Vehicle</a>
                                                            </li>
                                                            <li>
                                                                <a href="change_password.jsp">Change Password</a>
                                                            </li>
                                                        </ul>
                                                        </li>
                                                    <li>
                                                        <a name="btnLogout" id="btnLogout" href="index.jsp">Logout</a>
                                                    </li>
                                                    <li>
                                                        <a href="contact.jsp">Contact</a>
                                                    </li>
                                                </ul>

                                            </nav><!-- end .main-navigation -->

                                        </div><!-- end .col-md-8 -->

                                    </div><!-- end .main-header-container -->

                                </div><!-- end .row -->

                            </section><!-- end .container -->

                            <div class="col-md-12 col-sm-12 col-xs-12">

                                <div class="search-content">

                                    <form action="" name="tripsearch" novalidate autocomplete="off" class="idealforms searchtours">

                                        <div class="row">

                                            <div class="col-md-3 col-sm-3 col-xs-12">
                                                <div class="field">
                                                    <script src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyDZObWCbe5XsVd0Wudq-I24usXkQ7PWYXg"></script>
                                                    <script>
                                                        google.maps.event.addDomListener(window,'load',initialize);
                                                        function initialize() {
                                                        var input1 = document.getElementById('from-input');
                                                        var input2 = document.getElementById('to-input');
                                                        var autocomplete = new google.maps.places.Autocomplete(input1);
                                                        var autocomplete2 = new google.maps.places.Autocomplete(input2);
                                                        autocomplete.addListener('place_changed', function () {
                                                        var place = autocomplete.getPlace();
                                                        // place variable will have all the information you are looking for.
                                                        console.log(place.geometry['location'].lat());
                                                        console.log(place.geometry['location'].lng());
                                                        var lat1=place.geometry['location'].lat();
                                                        var lng1=place.geometry['location'].lng();
                                                        document.tripsearch.hidden1.value=lat1;
                                                        document.tripsearch.hidden2.value=lng1;
                                                        });
                                                        autocomplete2.addListener('place_changed', function () {
                                                        var place = autocomplete2.getPlace();
                                                        // place variable will have all the information you are looking for.
                                                        console.log(place.geometry['location'].lat());
                                                        console.log(place.geometry['location'].lng());
                                                        var lat2=place.geometry['location'].lat();
                                                        var lng2=place.geometry['location'].lng();
                                                        document.tripsearch.hidden3.value=lat2;
                                                        document.tripsearch.hidden4.value=lng2;
                                                        });
                                                        }
                                                        </script>
                                                        <input id="from-input" type="text" name="from" placeholder="from location" required>
                                                </div>
                                            </div>

                                            <div class="col-md-3 col-sm-3 col-xs-12">

                                                <div class="field">
                                                    <input id="to-input" type="text" name="to" placeholder="to location" required>
                                                </div>

                                            </div>
                                                        <input type="hidden" name="hidden1" value="">
                                                        <input type="hidden" name="hidden2" value="">
                                                        <input type="hidden" name="hidden3" value="">
                                                        <input type="hidden" name="hidden4" value="">
                                            <div class="col-md-3 col-sm-3 col-xs-12">

                                                <div class="field">
                                                   
                                                     <input type="date" min="2017-10-25" name="date"  required >
                                                    
                                                </div>


                                            </div>

                                            <div class="col-md-3 col-sm-3 col-xs-12">

                                                <div class="field">
                                                    <select id="destination" name="seats">
                                                        <option value="default">Number of seats</option>
                                                        <option>1</option>
                                                        <option>2</option>
                                                        <option>3</option>
                                                        <option>4</option>
                                                        <option>5</option>
                                                        <option>6</option>
                                                    </select>
                                                </div>

                                            </div>

                                            <div class="col-md-3 col-sm-3 col-xs-12">

                                                <div class="field buttons">
                                                    <input name="submit" id="submit" type="submit"  value="submit">
                                                </div>

                                            </div>

                                        </div>


                                    </form>
                                </div><!-- end .search-content -->

                            </div><!-- end .col-sm-12 -->

                        </div><!-- end .second-parallax-content -->

                    </div><!-- end .main-parallax-content -->

                </div><!-- end .background .parallax -->

            </div><!-- end .main-baner -->

        </header><!-- end .header -->

        <section class="main-content">

            <div class="container">
                <div class="row">

                    <div class="col-md-12 col-sm-12 col-xs-12">

                        <div class="page-sub-title textcenter">
                            <h2>Last rides</h2>
                            <div class="line"></div>
                        </div><!-- end .page-sub-title -->

                    </div><!-- end .col-md-12 col-sm-12 col-xs-12 -->

                                 <% 
                                
                                String new1="select * from tbl_strip s,tbl_type t,tbl_vehicle v,tbl_users u where v.vehicle_id=s.vehicle_id and u.user_id=v.user_id and t.type_id=v.type_id ORDER BY s.strip_id desc limit 5";
                                ResultSet newrs1=obj.select(new1);
                                int c=0;
                                while(newrs1.next()){
                                String trfrom=newrs1.getString("s.strip_from");
                                String trto=newrs1.getString("s.strip_to");
                                String trdate=newrs1.getString("s.strip_date");
                                String trtime=newrs1.getString("s.strip_time");   
                                String sts=newrs1.getString("t.type_no_seats");
                                String drfn=newrs1.getString("u.firstname");
                                String drln=newrs1.getString("u.lastname");
                                %>
                            <div class="col-md-12 col-sm-12 col-xs-12">

                                <article class="ride-box clearfix">

                                    <div class="ride-content">
                                        <h3><a href="#">From <%=trfrom%> to <%=trto%></a></h3>ride by <a href="#"><%=drfn%> &nbsp; <%=drln%></a>
                                    </div>

                                    <ul class="ride-meta">

                                        <li class="ride-date">
                                            <a href="#" class="tooltip-link" data-original-title="Date" data-toggle="tooltip">
                                                <i class="fa fa-calendar"></i>
                                                <%=trdate%> at <%=trtime%>
                                            </a>
                                        </li><!-- end .ride-date -->

                                        <li class="ride-people">
                                            <a href="#" class="tooltip-link" data-original-title="Number of seats" data-toggle="tooltip">
                                                <i class="fa fa-user"></i>
                                                <%=sts%>
                                            </a>
                                        </li><!-- end .ride-people -->

                                        <li>
                                            <a href="#">
                                                <i class="fa fa-file"></i>
                                                Read more
                                            </a>
                                        </li>

                                    </ul><!-- end .ride-meta -->

                                </article><!-- end .ride-box -->
                                
                               <%
                                    c+=1;
                                    if(c>=5)
                                        break;
                                }
                                
                                %>

                                

                                <div class="clearfix"></div>

                                <div class="post-pagination pagination-margin clearfix">

                                    <div class="next pull-right">
                                        <a href="#">
                                            Next
                                            <i class="fa fa-chevron-right"></i>
                                        </a>
                                    </div>

                                </div><!-- end .post-pagination -->

                            </div><!-- end .events-list -->

                        </div><!-- end .page-content -->

                    </div><!-- end .col-md-12 col-sm-12 col-xs-12 -->

        </section><!-- end .main-content -->

        <footer id="footer">

            <div class="footer-copyright">

                <div class="container">
                    <div class="row">

                        <div class="col-md-12 col-sm-12 col-xs-12">
                            Copyright by Rent A Trip
                        </div>

                    </div><!-- end .row -->
                </div><!-- end .container -->

            </div><!-- end .footer-copyright -->
          
        </footer><!-- end #footer -->

        <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div><!-- end .modal-header -->

                    <div class="modal-body">
                        <form action="" novalidate autocomplete="off" class="idealforms login">

                            <div class="log-header">
                                <span class="log-in">Log in</span>
                            </div>

                            <div class="field">
                                <input name="username" type="text" placeholder="Username">
                                <span class="error"></span>
                            </div>

                            <div class="field">
                                <input type="password" name="password" placeholder="Password">
                                <span class="error"></span>
                            </div>

                            <div class="field buttons">
                                <button type="submit" class="submit btn green-color">Log in</button>
                            </div>

                            <a href="#" class="log-twitter twitter"><i class="fa fa-twitter"></i>Twitter</a>
                            <a href="#" class="log-facebook facebook"><i class="fa fa-facebook"></i>Facebook</a>

                            <div class="clearfix"></div>

                        </form><!-- end .login -->
                    </div><!-- end .modal-body -->

                </div><!-- end .modal-content -->
            </div><!-- end .modal-dialog -->
        </div><!-- end .modal -->

        <div class="modal fade" id="regModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>

                    <div class="modal-body">
                        <form action="" novalidate autocomplete="off" class="idealforms reg">

                            <div class="log-header">
                                <span class="log-in">Sign up</span>
                            </div>

                            <div class="field">
                                <input name="username" type="text" placeholder="Username">
                                <span class="error"></span>
                            </div>

                            <div class="field">
                                <input name="email" type="email"  placeholder="E-Mail">
                                <span class="error"></span>
                            </div>

                            <div class="field">
                                <input type="password" name="password" placeholder="Password">
                                <span class="error"></span>
                            </div>

                            <div class="field">
                                <input name="confirmpass" type="password"  placeholder="Password">
                                <span class="error"></span>
                            </div>

                            <div class="field buttons">
                                <button type="submit" class="submit btn green-color">Sign up</button>
                            </div>

                            <div class="clearfix"></div>

                        </form><!-- end .reg -->
                    </div><!-- end .modal-body -->

                </div><!-- end .modal-content -->
            </div><!-- end .modal-dialog -->
        </div><!-- end .modal -->

        <!-- Javascript -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- Main jQuery -->
        <script type="text/javascript" src="js/jquery.main.js"></script>
        <!-- Form -->
        <script type="text/javascript" src="js/jquery.idealforms.min.js"></script>
        <script type="text/javascript" src="js/jquery.idealselect.min.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
        <!-- Menu -->
        <script type="text/javascript" src="js/hoverIntent.js"></script>
        <script type="text/javascript" src="js/superfish.js"></script>
        <!-- Counter-Up  -->
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
        <script type="text/javascript" src="js/jquery.counterup.min.js"></script>
        <!-- Rating  -->
        <script type="text/javascript" src="js/bootstrap-rating-input.min.js"></script>
        <!-- Slicknav  -->
        <script type="text/javascript" src="js/jquery.slicknav.min.js"></script>
        
    </body>
</html>