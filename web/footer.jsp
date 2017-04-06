<%-- 
    Document   : footer
    Created on : 26/02/2017, 01:40:46 PM
    Author     : juanfer
--%>

</div>

<footer class="page-footer blue-grey">
    <div class="container">
        <div class="row">
            <div class="col l6 s12">
                <h5 class="white-text">Concesionaria Jaidiber S.A</h5>
                <p class="grey-text text-lighten-4">Aplicación que permite manejar la información de un concesionario de vehículos</p>
            </div>
            <div class="col l4 offset-l2 s12">
                <h5 class="white-text">Enlaces de interes</h5>
                <ul>                    
                    <li><a class="grey-text text-lighten-3" href="https://sites.google.com/site/cursosdiegobotia/" target="_blank">Site del curso</a></li>                    
                </ul>
            </div>
        </div>
    </div>
    <div class="footer-copyright blue-grey">
        <div class="container">
            Hippie Team ©© 2017 Creative Commons            
        </div>
    </div>
</footer>

<!--Import jQuery before materialize.js-->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>

<script type="text/javascript" src="js/fieldsValidator.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $(".button-collapse").sideNav();
        $('select').material_select();
        $('.slider').slider({full_width: true});
        $('.modal-trigger').leanModal();
    });
</script>
</body>
</html>