<%@page import="java.util.List"%>
<%@page import="com.ivanarrabe.pt2turnero.logica.Turno"%>
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
            <h1>Formulario para Filtrar Los turnos por su estado y Fecha</h1>
            <!-- En este formulario mandamos una fecha y un estado y nos devuelve los turnos que coincidan con ambos campos -->
            <form action="FiltroSv" method="get" accept-charset="UTF-8">
                <div class="form-group">
                    <label for="fecha">Fecha: </label>
                    <input type="date" class="form-control" id="fecha" name="fecha">
                </div>
                <div class="form-group">
                    <label for="estado">Estado:</label>
                    <select class="form-control" id="estado" name="estado">
                        <option value="En espera">En espera</option>
                        <option value="Atendido">Atendido</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Listar turnos</button>
            </form>
            <br>
            <br>
            <!-- Resultados en tabla -->
            <div class="results-table">
                <% if (request.getAttribute("resultadosTurnosFiltro") != null) { %>
                <h3>Resultados:</h3>
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Fecha</th>
                            <th>Estado</th>
                            <th>Tramite</th>
                            <th>Nombre Ciudadano</th>
                            <th>Apellido Ciudadano</th>
                            <th>DNI Ciudadano</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Turno turno : (List<Turno>) request.getAttribute("resultadosTurnosFiltro")) {%>
                        <tr>
                            <td><%= turno.getId()%></td>
                            <td><%= turno.getFecha()%></td>
                            <td><%= turno.getEstado()%></td>
                            <td><%= turno.getTramite()%></td>
                            <td><%= turno.getCiudadano().getNombre()%></td>
                            <td><%= turno.getCiudadano().getApellido()%></td>
                            <td><%= turno.getCiudadano().getDni()%></td>
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
