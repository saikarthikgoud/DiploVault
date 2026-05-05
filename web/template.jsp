<!DOCTYPE HTML>
<html>

    <head>
        <title>Diplo Cloud</title>
        <meta name="description" content="website description" />
        <meta name="keywords" content="website keywords, website keywords" />
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <!-- modernizr enables HTML5 elements and feature detects -->
        <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
        <style>
            #id{
                width: 200px;
                height: 40px;
               
            }
            #but{
                width: 60px;
                height: 25px;
            }
        </style>
        <script>
            
        </script>
    </head>

    <body>
        <div id="main">
            <header>
                <div id="logo">
                    <div id="logo_text">
                        <!-- class="logo_colour", allows you to change the colour of the text -->
                       <pre><h1><b>DiploCloud: Efficient and Scalable Management of<br><center> RDF Data in the Cloud</center></b></h1></pre>
        </div>
      </div>
      <nav>
        <ul class="sf-menu" id="nav">
          <li><a href="user_page1.jsp">User Home</a></li>
                        <li><a href="upload.jsp">Upload</a></li>
                        <li><a href="#">Search file</a>
                            <ul>
                                <li class="selected"><a href="template.jsp">Template ID </a></li>
                            <li><a href="molecule.jsp">Molecules  </a></li>
                            </ul>
                            
                        </li>
                        
                       
                                <li><a href="index.html">Logout</a></li>
                         
                         
        </ul>
                </nav>
            </header>
            <div id="site_content">
                <div id="sidebar_container">
                    <div class="gallery">
                        <ul class="images">
                            <img width="450" height="450" src="images/id.jpg" alt="photo_one" />
                           
                        </ul>
                    </div>
                </div>
                <div id="content">
                    <fieldset style="background-color:tomata;border-radius: 9px;height: 350px;margin-top: 40px;background-image: url('images/')">
                        <center>
                            <h1 style="font: monospace;font-size: 35px;font-weight: bold;color: darkslateblue">TemplateID Search</h1><br>
                            <form action="search.jsp" name="ulogin" method="post" onsubmit="return validation()"> 
                                <!--                  USERNAME:<br>-->
                            <label style="font-size: 30px;margin-left:17px;">Template ID</label<br><input type="text" id="id" name="search"required style="margin-left: 30px;" placeholder="Search by ID"/><br><br>
<!--                  PASSWORD:<br>-->
 <input type="submit"  value="Search"style="border-radius: 12px;height: 38px;width: 93px;background-color:slateblue"/>



                            </form>
                        </center>
                    </fieldset>
                </div>
            </div>
           
        </div>
        <p>&nbsp;</p>
        <!-- javascript at the bottom for fast page loading -->
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.easing-sooper.js"></script>
        <script type="text/javascript" src="js/jquery.sooperfish.js"></script>
        <script type="text/javascript" src="js/image_fade.js"></script>
        <script type="text/javascript">
                                $(document).ready(function() {
                                    $('ul.sf-menu').sooperfish();
                                });
        </script>
    </body>
</html>
