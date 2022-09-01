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
            /******************** Contenu ******************/
            .home_content{
                position: absolute;
                overflow: auto;
                height: 100%;
                width: calc(100% - 78px);
                left: 78px;
                background: #FFF;
                box-shadow: 0 5px 10px rgba(0,0,0,0.2px);
                transition: all 0.5s ease;
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                padding: 20px;
            }
            .home_content::-webkit-scrollbar {
                width: 0.4em;
            }
            .home_content::-webkit-scrollbar-track {
                /* box-shadow: inset 0 0 6px #198754; */
                background-color: rgb(218, 216, 216);
            }
            .home_content::-webkit-scrollbar-thumb {
                background-color: rgb(18, 142, 224);
                /* outline: 1px solid #11101d; */
                border-radius: 12px;
            }
            .home_content .text{
                font-size: 25px;
                font-weight: 500;
                color: #1d1b31;
                margin: 12px;
            }
            #home_content2,#home_content3,#home_content4{
                display: none;
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
            .topnav h2{
                color: rgb(18, 142, 224);
                float: left;
                margin-left: 10px;
                font-size: 1.5rem;

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
                display: flex;
                list-style: none;
                justify-content:space-around;
                width: 30%;
            }
            .opera li{
                color: black;
                font-size: 20px;
            }
            .opera li:hover{
                zoom: 1.10;
                cursor: pointer;
            }
            .opera li:first-child{
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
                min-height:80vh;
                background-color: #FFF;
                box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.4);
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
        </style>

    </head>
    <body>


        <nav class="topnav" id="myTopnav">

            <ul class="opera" >
                <li id="opera1">Utilisation</li>
                <li id="opera2">Administration</li>
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
                    <a href="/ProjectAnnuaireENS/AdminePage/Utilisation/Etudiant" >
                        <i class='bx bxs-user' style="font-size:25px"></i>
                        <span class="links_name">Etudiant</span>
                    </a>
                    <span class="tooltip">Etudiant</span>
                </li>
                <br>
                <li>
                    <a href="/ProjectAnnuaireENS/AdminePage/Utilisation/Departement"  style="color:rgb(18, 142, 224);background:white;">
                        <i  class='bx bxs-school' id="a1" style="font-size:30px"></i>
                        <span class="links_name" >Département</span>
                    </a>
                    <span class="tooltip" >Département</span>
                </li>
                <br>
                <li>

                    <a  href="/ProjectAnnuaireENS/AdminePage/Utilisation/Filiere">
                        <i class='bx bx-git-branch' style="font-size:30px"></i>
                        <span class="links_name" >Filière</span>
                    </a>
                    <span class="tooltip" >Filière</span>
                </li>

            </ul>
            <div class="profile_content">

                <div class="profile">
                    <a href="Deconnexion.php" class="dec">
                        <i class='bx bx-log-out' id="log_out" ></i>
                        <span class="dec1" >Deconnexion</span>     
                    </a>
                </div>
            </div> 
        </div>

        <!-- ************************Contenu************************* -->
        <div class="sec">
            <div class="flex">
            <h3>Table des départements</h3>
            <div class="wrap">
                <div class="search">
                    <input type="text" class="searchTerm" placeholder="Recherche ....">
                    <button type="submit" class="searchButton">
                       <i class='bx bx-search'></i>
                    </button>
                </div>
            </div>
            </div>
            <br>
            <table id="customers">
                <tr>
                    <th>N°</th>
                    <th>Nom Département</th>
                    <th>Date d'adhésion</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="counter_variable_name" begin="0" end="5">
                    <tr>
                        <td>1</td>
                        <td>**</td>
                        <td>**</td> 
                        <td style="display: flex; justify-content: space-around;">
                            <a class="click" style="color: red;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x-trash" viewBox="0 0 16 16">
                                <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                                </svg>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
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
