# Documentación de proyecto de Gestión de Ciudadanos y Turnos Administrativos con JSP+JPA
Mediante esta aplicación podremos gestionar ciudadanos y turnos almacenados en una base de datos (implementada con JPA), relacionados entre sí para evitar que un mismo turno se le asigne a varios ciudadanos, pero un mismo ciudadano si que puede poseer varios turnos.
La aplicación proporciona un menú al iniciarse en el que disponemos de varios botones para realizar las diferentes operaciones que se nos solicitan tales como introducir turnos o listarlos con filtros. Se ha implementado la inserción de ciudadanos para poder realizar las relaciones con los turnos.
El manejo de la aplicación se realizará por el usuario mediante JSP (Java Server Pages) en el que disponemos de una interfaz gráfica y ya evitamos el uso de la consola del IDE. En versiones posteriores se implementará dicha interfaz ya que de momento se ha utilizado una plantilla para darle forma pero con el equipo del FrontEnd procederíamos a darle un estilo propio y más adecuado al tema que trata la app.

## Estado del proyecto
Esta aplicación está aún en desarrollo, pero ya se han implementado las funciones necesarias para realizar las pruebas pertinentes y comprobar que todo lo que nos solicita el cliente funciona correctamente.
Algunas funciones de las que se han implementado se omitirán en versiones posteriores ya que, por ejemplo, el decidir que turnos se han atendido no debería ser función del usuario, pero en este caso para realizar las pruebas lo necesitábamos. Posteriormente se puede implementar que los turnos cambien de estado en función a otra fecha de vencimiento.

## Tecnologías utilizadas
* JAVA 17 (JDK 17).
* Conexión a Bases de Datos con JPA (Java Persistence API).
* Creación de páginas web mediante JSP (Java Server Pages) + Jakarta EE.
* Tomcat.
* Proovedor de JPA EclipseLink.
* MySQL phpMyAdmin.

## Instalación
Para poder instalar esta aplicación basta con poseer un IDE con versión de JAVA 17 y JDK 17. Se recomienda utilizar NetBeans (pero no instale la última versión, ya que está dando problemas al crear la unidad de persistencia)para la creación del proyecto, ya que ayuda mucho pero una vez creado se puede utilizar el IDE que más cómodo nos resulte.
Hay que tener instalado también XAMP para la conexión con la base de datos y una aplicación web como por ejemplo phpMyAdmin para la administración de la base de datos.
Agregaremos Tomcat al proyecto para poder utilizar la interfaz de páginas Web.
Una vez que comprobamos que tenemos todo iniciamos XAMP y entramos en phpMyAdmin y lanzamos el proyecto y pulsamos en Run, y en este momento se puede comenzar a utilizar la aplicación.

## Uso
Una vez que inicia la aplicación se abrirá una página web con 4 botones:
### 1. Agregar un Ciudadano.
* Permite al usuario ingresar detalles del ciudadano en un formulario ubicado en una nueva página web.
* Requiere que todos los campos estén completos, de lo contrario, nos redirige a otra página(error.jsp) en la que se nos muestra un mensaje diciendo que todos los campos son obligatorios.
* Si todos los detalles son correctos, al pulsar el botón.
### 2. Listar empleados.
* Lista todos los empleados activos (los que no han sido eliminados lógicamente) recuperados de la base de datos lanzando una consulta.
* Implementa la eliminación lógica, marcando a los empleados como eliminados sin quitarlos de la base de datos.
### 3. Actualizar información de un empleado.
* Solicita el ID del empleado a modificar, verificando su validez, ya que si no encuentra el ID proporcionado mandará un mensaje de que ese trabajador no existe y lo seguirá pidiendo hasta obtener un ID válido.
* Muestra los datos del empleado que se va a modificar.
* Muestra un menú para modificar cada campo de datos del empleado. En función de la opción escogida se procederá a modificar el campo correspondiente.
* Se pueden modificar desde 1 a todos los campos ya que el menú se repetirá hasta que el usuario decida pulsar la opción de no modificar datos.
### 4. Eliminar un empleado.
* Solicita el ID del empleado a modificar, verificando su validez, ya que si no encuentra el ID proporcionado mandará un mensaje de que ese trabajador no existe y lo seguirá pidiendo hasta obtener un ID válido.
* Muestra los datos del empleado que se ha eliminado. En caso de eliminación por error podemos acceder a la base de datos y cambiarle el estado de "borrado" a false.
* Para llevar a cabo un borrado lógico y no uno físco realizaremos una edición del empleado en lugar de una eliminación. Utilizaremos un campo booleano que se activará cuando se "elimine" el trabajador, de tal manera que al listarlo no aparecerá pero lo mantendremos en la base de datos.
### 5. Buscar empleados por cargo.
* Solicita al usuario ingresar un cargo por teclado.
* Realiza una consulta a la base de datos para recuperar y mostrar empleados con el cargo especificado.
* Proporciona comentarios apropiados para roles incorrectos o inexistentes.
### 0. Salir.
* Da fin a la ejecución del programa y se despide mediante un mensaje.
