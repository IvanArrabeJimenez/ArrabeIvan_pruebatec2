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
* Si todos los detalles son correctos, al pulsar el botón "Registrar Ciudadano" se insertará el nuevo ciudadano en la Base de Datos.

