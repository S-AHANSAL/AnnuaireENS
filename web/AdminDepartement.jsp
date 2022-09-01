<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Boxicons CDN Link -->
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- style Fonts google -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Courgette&family=Ubuntu+Condensed&display=swap" rel="stylesheet">

         <style>
            /* Google Font CDN Link */
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Courgette', cursive;
                font-family: 'Ubuntu Condensed', sans-serif;
                font-size: 20px;
            }
            body{
                position: relative;
                min-height: 100vh;
                width: 100%;
                /*overflow: hidden;*/
            }
            *::-webkit-scrollbar {
                width: 0.4em;
            }
            *::-webkit-scrollbar-track {
                /* box-shadow: inset 0 0 6px #198754; */
                background-color: rgb(218, 216, 216);
            }
            *::-webkit-scrollbar-thumb {
                background-color: rgb(18, 142, 224);
                /* outline: 1px solid #11101d; */
                border-radius: 12px;
            }
            ::selection{
                color: #fff;
                background: #11101d;
            }
            .user1{
                display: none;
            }
            .user1.user{
                display: block;
            }
            .dec{
                display: flex;
                align-items: center;
                color: white;
                text-decoration: none;
                background-color:rgb(18, 142, 224) ;
                padding: 12px;
                border-radius: 9px;
            }
            .dec1{
                margin-left: 30px;
                font-size: 18px;
                display: none;
            }
            .dec2{
                display: block;
            }
            .sidebar{
                position: fixed;
                top: 0;
                left: 0;
                height: 100%;
                width: 78px;
                background:  #F5F5F5;
                padding: 6px 14px;
                z-index: 99;
                transition: all 0.5s ease;
                box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.4);

            }
            .sidebar.active{
                width: 240px;
                box-shadow: 0 0 25px 0 rgba(0, 0, 0, 0.4);
            }
            .sidebar .logo_content .logo{
                color:rgb(18, 142, 224);
                display: flex;
                height: 50px;
                width: 100%;
                align-items: center;
                opacity: 0;
                pointer-events: none;
                transition: all 0.5s ease;
            }
            .sidebar.active .logo_content .logo{
                opacity: 1;
                pointer-events: none;
            }
            .logo_content .logo i{
                font-size: 28px;
                margin-right: 5px;
            }
            .logo_content .logo .logo_name{
                font-size: 20px;
                font-weight: 400;
            }
            .sidebar #btn{
                position: absolute;
                color: rgb(18, 142, 224);
                top: 6px;
                left: 50%;
                font-size: 22px;
                height: 50px;
                width: 50px;
                text-align: center;
                line-height: 50px;
                transform: translateX(-50%);
            }
            .sidebar.active #btn{
                left: 90%;
            }
            .sidebar ul{
                margin-top: 20px;
            }
            .sidebar ul li{
                position: relative;
                height: 50px;
                width: 100%;
                margin: 0 5px;
                list-style: none;
                line-height: 50px;
                margin: 5px 0;
            }
            .sidebar ul li .tooltip{
                position: absolute;
                left: 125px;
                top: 0;
                transform: translate(-50% , -50%);
                border-radius: 6px;
                height: 35px;
                width: 180px;
                background: #fff;
                line-height: 35px;
                text-align: center;
                box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
                transition: 0s;
                opacity: 0;
                pointer-events: none;
                display: block;
            }
            .sidebar.active ul li .tooltip{
                display: none;
            }
            .sidebar ul li:hover .tooltip{
                transition: all 0.5s ease;
                opacity: 1;
                top: 50%
            }

            .sidebar ul li a{
                color: black;
                display: flex;
                align-items: center;
                text-decoration: none;
                border-radius: 12px;
                white-space: nowrap;
                transition: all 0.4s ease;

            }
            .sidebar ul li a:hover{
                color: rgb(18, 142, 224);
                background: #fff;
            }
            .sidebar ul li i{
                font-size: 20px;
                font-weight: 400;
                height: 50px;
                min-width: 50px;
                border-radius: 12px;
                line-height: 50px;
                text-align: center;
            }
            .sidebar .links_name{
                font-size: 20px;
                font-weight: 400;
                opacity: 0;
                pointer-events: none;
                transition: all 0.3s ease;
            }
            .sidebar.active .links_name{
                transition: 0s;
                opacity: 1;
                pointer-events: auto
            }
            .sidebar .profile_content{
                position: absolute;
                color: black;
                bottom: 0;
                left: 0;
                width: 100%;
                display: none;
            }
            .sidebar .profile_content .profile{
                position: relative;
                padding: 10px 6px;
                height: 60px;
                background: none;
                transition: all 0.4s ease;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .sidebar.active .profile_content .profile{
                background: #d8d6d6;

            }
            .profile_content .profile .profile_details{
                display: flex;
                align-items: center;
                opacity: 0;
                pointer-events: none;
                white-space: nowrap;
                transition: all 0.4s ease;
            }
            .sidebar.active ~ .profile .profile_details{
                opacity: 1;
                pointer-events: auto;
            }

            .profile #log_out{
                position: absolute;
                left: 50%;
                transform: translateX(-50%);
                min-width: 50px;
                line-height: 50px;
                font-size: 18px;
                font-weight: bold;
                border-radius: 12px;
                text-align: center;
                transition: all 0.4s ease;
                background: #d8d6d6;
            }
            .sidebar.active .profile #log_out{
                left: 28%;
            }
            .sidebar.active .profile #log_out{
                background: none
            }
            .profile:hover{
                cursor: pointer;
            }
            .sidebar.active ~ .home_content{
                z-index: 100;
            }

            .sidebar.active ~ .home_content{
                width: calc(100% - 240px);
                left: 240px;

            }

            /* ********************** */

            /**navbar**/
            .topnav {
                position:relative;

                background-color: #FFF;
                border-bottom: inset rgb(226, 226, 226);
                box-shadow: 0 5px 9px 0 rgba(0,0,0,0.2);
                border-width:0.5px;


                width:100%;
                height: 60px;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .button {
                padding: 10px 10px;
                text-decoration: none;
                cursor: pointer;
                border: 1px solid rgb(18, 142, 224);
                font-size: 1rem;
                display: flex;
                justify-content: center;
                align-items: center;
                border-radius: 7px;
                color: #FFF;
                background-color: rgb(18, 142, 224);
                margin-right: 8px;
            }
            .button:hover {
                color: #FFF;
                box-shadow: 0 5px 9px 0 rgba(0,0,0,0.2);
                opacity: 0.9;
            }

            @media screen and (max-width: 700px){
                .topnav h2{
                    font-size: 1rem;
                }
                .button{
                    margin-top:10px;
                    font-size: 0.5rem;
                }

            }
            .opera{
                color:black;
                display: flex;
                list-style: none;
                justify-content:space-around;
                width: 30%;
            }
            .opera li{
                font-size: 20px;
            }
            .opera li:hover{
                zoom: 1.10;
                cursor: pointer;
            }
            .operaActive{
                border-bottom: solid 4px  rgb(18, 142, 224);
                color: rgb(18, 142, 224);
            }
            #customers {
                border-collapse: collapse;
                width: 95%;
                margin-left: 20px;
            }

            #customers td, #customers th {
                border: 1px solid #ddd;
                padding: 8px;
            }

            #customers tr:nth-child(even){
                background-color: #f2f2f2;
            }

            #customers tr:hover {
                background-color: #ddd;
            }

            #customers th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: center;
                background-color: rgb(18, 142, 224);
                color: white;
            }
            #customers td{
                text-align: center;
            }
            .click{
                opacity: 0.4;
                cursor:pointer;
            }
            .click:hover{
                opacity: 1;
                zoom: 1.05;

            }
            .sec{
                position: relative;
                margin-left:10%;
                margin-top: 5%;
                width: 80%;
                padding:4%;
                min-height:70vh;
                background-color: #FFF;
                box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.4);
            }
            a{
                text-decoration: none;
                color:black;
            }
            .search {
                width: 100%;
                position: relative;
                display: flex;
            }
            .searchTerm {
                width: 100%;
                border: 3px solid rgb(18, 142, 224);
                border-right: none;
                padding: 15px;
                height: 20px;
                border-radius: 5px 0 0 5px;
                outline: none;
                color: rgb(18, 142, 224);
            }

            .searchTerm:focus{
                color: rgb(18, 142, 224);
            }

            .searchButton {
                width: 40px;
                height: 36px;
                border: 1px solid #00B4CC;
                background: rgb(18, 142, 224);
                text-align: center;
                color: #fff;
                border-radius: 0 5px 5px 0;
                cursor: pointer;
                font-size: 20px;
            }
            .wrap{
                width: 30%;
            }
            .flex{
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            /* *****form ajouter ***** */
            #contact input[type="text"],
            #contact input[type="file"],
            #contact input[type="tel"],
            #contact input[type="number"],
            #contact select,
            #contact textarea,
            #contact button[type="submit"] {
                /* font: 400 12px/16px "Roboto", Helvetica, Arial, sans-serif; */
                font-family: 'Courgette', cursive;
                font-family: 'Ubuntu Condensed', sans-serif;
                font-size: 15px;
            }

            #contact {
                padding: 45px;
                width: 60%;
                border-radius: 20px;
            }

            #contact h3 {
                display: block;
                font-size: 30px;
                font-weight: 300;
                margin-bottom: 10px;
            }

            #contact h4 {
                margin: 5px 0 15px;
                display: block;
                font-size: 13px;
                font-weight: 400;
            }

            fieldset {
                border: medium none !important;
                margin: 0 0 10px;
                min-width: 100%;
                padding: 0;
                width: 100%;
            }

            #contact input[type="text"],
            #contact input[type="file"],
            #contact input[type="tel"],
            #contact input[type="number"],
            #contact select,
            #contact textarea {
                width: 100%;
                border: 1px solid #ccc;
                background: #FFF;
                margin: 0 0 5px;
                padding: 10px;
            }

            #contact input[type="text"]:hover,
            #contact input[type="email"]:hover,
            #contact input[type="tel"]:hover,
            #contact input[type="number"]:hover,
            #contact textarea:hover {
                -webkit-transition: border-color 0.3s ease-in-out;
                -moz-transition: border-color 0.3s ease-in-out;
                transition: border-color 0.3s ease-in-out;
                border: 1px solid #aaa;
            }

            #contact textarea {
                height: 100px;
                max-width: 100%;
                resize: none;
            }

            #contact button[type="submit"] {
                cursor: pointer;
                width: 100%;
                border: none;
                background: rgb(18, 142, 224);
                color: #FFF;
                margin: 0 0 5px;
                padding: 10px;
                font-size: 15px;
            }

            #contact button[type="submit"]:hover {
                opacity: 0.8;
                -webkit-transition: background 0.3s ease-in-out;
                -moz-transition: background 0.3s ease-in-out;
                transition: background-color 0.3s ease-in-out;
            }

            #contact button[type="submit"]:active {
                box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.5);
            }



            #contact input:focus,
            #contact textarea:focus {
                outline: 0;
                border: 1px solid #aaa;
            }

            ::-webkit-input-placeholder {
                color: #888;
            }

            :-moz-placeholder {
                color: #888;
            }

            ::-moz-placeholder {
                color: #888;
            }

            :-ms-input-placeholder {
                color: #888;
            }
        </style>

    </head>
    <body>


        <nav class="topnav" id="myTopnav">

            <ul class="opera" >
                <li><a href="/AnnuaireENSProject/AdminePage/Utilisation/Etudiant">Utilisation</a></li>
                <li class="operaActive"><a href="/AnnuaireENSProject/AdminePage/Administration/Etudiant">Administration</a></li>
            </ul>

        </nav> 



        <div class="sidebar">
            <div class="logo_content">
                <div class="logo">

                    <div class="logo_name">Annuaire ENS</div> 
                </div>
                <i class='bx bx-menu' id="btn" style="cursor:pointer;"></i>
            </div>
            <ul class="nav_list" >
                <p><center class="user1" style="margin-bottom:20px;color:rgb(18, 142, 224);"> <sup></sup></center></p> 
                <br>    
                <li>
                    <a href="/AnnuaireENSProject/AdminePage/Administration/Etudiant" >
                        <i class='bx bxs-user' style="font-size:25px"></i>
                        <span class="links_name">Etudiant</span>
                    </a>
                    <span class="tooltip">Etudiant</span>
                </li>
                <br>
                <li>
                    <a href="/AnnuaireENSProject/AdminePage/Administration/Departement"  style="color:rgb(18, 142, 224);background:white;">
                        <i  class='bx bxs-school' id="a1" style="font-size:30px"></i>
                        <span class="links_name" >Département</span>
                    </a>
                    <span class="tooltip" >Département</span>
                </li>
                <br>
                <li>

                    <a  href="/AnnuaireENSProject/AdminePage/Administration/Filiere">
                        <i class='bx bx-git-branch' style="font-size:30px"></i>
                        <span class="links_name" >Filière</span>
                    </a>
                    <span class="tooltip" >Filière</span>
                </li>

            </ul>
            <div class="profile_content">

                <div class="profile">
                    <a href="/AnnuaireENSProject/Deconnexion" class="dec">
                        <i class='bx bx-log-out' id="log_out" ></i>
                        <span class="dec1" >Deconnexion</span>     
                    </a>
                </div>
            </div> 
        </div>

        <!-- ************************Contenu************************* -->
        <div class="sec">
            <h2>Ajouter nouveau département:</h2>
            <center>
                <form id="contact" action="/AnnuaireENSProject/AdminePage/Administration/Departement" method="post">
                  <fieldset>
                        <input placeholder="Nom de Département" name="departement"  type="text" tabindex="1" required autofocus>
                    </fieldset>

                    <fieldset>
                        <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Ajouter</button>
                    </fieldset>
                </form>
            </center>
        </div>
        <script>
// sidebar

            let btn = document.querySelector("#btn");
            let sidebar = document.querySelector(".sidebar");
            btn.onclick = function () {
                document.querySelector(".user1").classList.toggle("user");
                document.querySelector(".dec1").classList.toggle("dec2");
                sidebar.classList.toggle("active");
            }
        </script>
    </body>
</html>
