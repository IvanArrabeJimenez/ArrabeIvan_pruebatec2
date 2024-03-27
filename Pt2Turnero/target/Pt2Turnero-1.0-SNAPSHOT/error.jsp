<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Aplicación de Gestión de Turnos</title>
        <!-- Agregar estilos de Bootstrap -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/solar/bootstrap.min.css" integrity="sha384-NCwXci5f5ZqlDw+m7FwZSAwboa0svoPPylIW3Nf+GBDsyVum+yArYnaFLE9UDzLd" crossorigin="anonymous">
    </head>
    <body>
        <!-- Cuando no se rellenan todos los campos de un formulario redirigimos a esta página para que no se introduzcan valores vacíos en la BBDD -->
        <div class="container mt-4">
            <br>
            <a href="index.jsp">Volver al inicio</a>
            <br>
            <h1>Error: Todos los campos son obligatorios.</h1>
            <!-- Scripts de Bootstrap -->
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        </div>
    </body>
</html>
