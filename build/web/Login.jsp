<%-- 
    Document   : Login
    Created on : 9 juil. 2022, 23:18:21
    Author     : ahansal
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Authentification</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
   <style><%@include file="/Login.css"%></style>
    </head>
    <body class="bg-primary-body" >
        <div class="container">
            <div class="container-new d-flex justify-content-center">
                <div class="card shadow-lg rounded-3">
                    <div class="card-new d-flex justify-content-center align-items-center">

                        <div class="divimg ms-3">
                            <img src="${pageContext.request.contextPath}/img/undraw_access_account_re_8spm.svg" width="100%" height="100%" alt="ENST"/>
                        </div>

                        <div class="p-3 ms-3 divform border-start border-3 " >
                            <h2>Bienvenue</h2>
                            <p>Annuaire ENS Tetouan</p>
                            <form class="mt-4" method="post" action="/AnnuaireENSProject/Login">
                                <div class="mb-3">
                                    <label for="Email" class="col-sm col-form-label">Email</label>
                                    <div class="col-11">
                                        <input type="email" name="user"  class="form-control rounded-5 p-2" id="Email">
                                    </div>
                                </div>
                                <div class="mb-11">
                                    <label for="Password"  class="col-sm col-form-label">Mot de passe</label>
                                    <div class="col-11">
                                        <input type="password" name="password" class="form-control rounded-5" id="Password">
                                    </div>
                                </div>
                                <center>    
                                    <button type="submit" class="btn btn-primary mt-4 bt">Connexion</button> 
                                </center>
                            </form>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
        
        
        
    </body>
</html>
