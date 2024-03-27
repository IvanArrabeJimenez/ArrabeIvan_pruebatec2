<%@page import="java.util.List"%>
<%@page import="com.ivanarrabe.pt2turnero.logica.Ciudadano"%>
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
            <h1>Agregando ciudadanos</h1>
            <!-- Formulario para agregar los ciudadanos que mandamos al método post del servlet -->
            <form action="CiudadanoSv" method="post" accept-charset="UTF-8">
                <div class="form-group">
                    <label for="numero">DNI Ciudadano: </label>
                    <input type="text" class="form-control" id="dniCiudadano" name="dniCiudadano">
                </div>
                <div class="form-group">
                    <label for="fecha">Nombre: </label>
                    <input type="text" class="form-control" id="nombre" name="nombre">
                </div>
                <div class="form-group">
                    <label for="descripcion">Apellido: </label>
                    <input type="text" class="form-control" id="apellido" name="apellido">
                </div>
                <button type="submit" class="btn btn-success">Registrar Ciudadano</button>
            </form>
            <hr>
            <h2>Mostrar Ciudadanos Registrados:</h2>
            <!-- Formulario para listar los ciudadanos que recogemos en el método get del servlet-->
            <form action="CiudadanoSv" method="get" accept-charset="UTF-8">
                <button type="submit" class="btn btn-danger">Mostrar Ciudadanos</button>
            </form>
            <br>
            <br>
            <!-- Resultados en tabla de los Ciudadanos registrados -->
            <div class="results-table">
                <% if (request.getAttribute("resultadosCiudadanos") != null) { %>
                <h3>Resultados:</h3>
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>DNI</th>
                            <th>Nombre</th>
                            <th>Ciudad</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Ciudadano ciudadano : (List<Ciudadano>) request.getAttribute("resultadosCiudadanos")) {%>
                        <tr>
                            <td><%= ciudadano.getId()%></td>
                            <td><%= ciudadano.getDni()%></td>
                            <td><%= ciudadano.getNombre()%></td>
                            <td><%= ciudadano.getApellido()%></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                <% }%>
            </div>
        </div>
        <!-- Scripts de Bootstrap -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </body>
</html>
