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
        <div class="container mt-4">
            <br>
            <a href="index.jsp">Volver al inicio</a>
            <br>
            <h1>Formulario para agregar turnos</h1>
            <!-- Formulario para registrar los turnos en la base de datos que enviamos al método post del servlet -->
            <form action="TurnoSv" method="post" accept-charset="UTF-8">
                <div class="form-group">
                    <label for="numero">Id Ciudadano: </label>
                    <input type="text" class="form-control" id="idCiudadano" name="idCiudadano">
                </div>
                <div class="form-group">
                    <label for="fecha">Fecha del Trámite: </label>
                    <input type="date" class="form-control" id="fecha" name="fecha">
                </div>
                <div class="form-group">
                    <label for="descripcion">Descripción del Trámite: </label>
                    <input type="text" class="form-control" id="descripcion" name="descripcion">
                </div>
                <button type="submit" class="btn btn-success">Registrar Turno</button>
            </form>   
        </div>
        <!-- Scripts de Bootstrap -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </body>
</html>
