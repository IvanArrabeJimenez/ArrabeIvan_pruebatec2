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
            <!-- Menú basado en botones -->
            <form action="MenuSv" method="post">
                <h1>Bienvenido a nuestra aplicación para gestionar los trámites de los ciudadanos</h1>
                <br>
                <br> 
                <h2>¿Qué desea hacer?</h2>
                <button type="submit" name="accion" value="agregarCiudadano" class="btn btn-primary">Agregar Ciudadano</button>                
                <br>
                <br> 
                <button type="submit" name="accion" value="agregarTurno" class="btn btn-secondary">Agregar Nuevo Turno</button>
                <br>
                <br> 
                <button type="submit" name="accion" value="listar" class="btn btn-primary">Atender Turno / Filtro por Fecha</button>
                <br>
                <br> 
                <button type="submit" name="accion" value="filtrar" class="btn btn-secondary">Filtro Turnos Por Fecha y Estado</button>          
            </form>            
        </div>
        <!-- Scripts de Bootstrap -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </body>
</html>
