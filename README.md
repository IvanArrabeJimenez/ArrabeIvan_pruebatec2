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
### 1. Agregar Ciudadano.
* Permite al usuario ingresar detalles del ciudadano en un formulario ubicado en una nueva página web(agregarCiudadano.jsp).
* Requiere que todos los campos estén completos, de lo contrario, nos redirige a otra página(error.jsp) en la que se nos muestra un mensaje diciendo que todos los campos son obligatorios.
* Si todos los detalles son correctos, al pulsar el botón "Registrar Ciudadano" se insertará el nuevo ciudadano en la Base de Datos y nos redirigirá a la página principal (index.jsp).
* Dentro de la misma página (agregarCiudadano.jsp) encontraremos otro botón llamado "Mostrar Ciudadanos", el cual al pulsarlo, nos devolverá en forma de tabla y en la misma página todos los ciudadanos que han sido registrados ya en la base de datos.
### 2. Agregar Nuevo Turno.
* Permite al usuario ingresar detalles de un nuevo turno en un formulario ubicado en una nueva página web(agregarTurno.jsp).
* Requiere que todos los campos estén completos, de lo contrario, nos redirige a otra página(error.jsp) en la que se nos muestra un mensaje diciendo que todos los campos son obligatorios.
* Si todos los detalles son correctos, al pulsar el botón "Registrar Turno" se insertará el nuevo turno en la Base de Datos y nos redirigirá a la página principal (index.jsp).
### 3. Atender Turno / Filtro por fecha.
* Al pulsar este botón se nos redirige a una nueva página (listar.jsp) en la que aparecen dos formularios, uno para cambiar el estado del Turno a "Atendido" y otro para filtrar los turnos por fecha.
* En el primer formulario debemos introducir el id del turno que queremos cambiar y al pulsar el botón nos redirigirá al index y Cambiará el estado del turno en la base de datos.
* En el segundo formulario se nos solicita una fecha y cuando la introduzcamos y pulsemos sobre el botón de Listar Turnos nos aparecerán, en una tabla, aquellos turnos que aparezcan en la base de datos con esa fecha específica. En este filtro hemos metido una función lambda que filtra por fecha y luego ordena por id.
* En ambos casos tiene que haber datos introducidos para que no nos redirija a la página de error.jsp.
### 4. Filtro Turnos Por Fecha y Estado.
* Al pulsar este botón se nos redirige a una nueva página (filtrar.jsp) en la que aparece un formulario para filtrar los turnos por fecha y a la vez por el estado, de esta manera se utilizan dos filtros para hacer la búsqueda más exhaustiva.
* Requiere que todos los campos estén completos, de lo contrario, nos redirige a otra página(error.jsp) en la que se nos muestra un mensaje diciendo que todos los campos son obligatorios.
* Cuando tengamos elegida una fecha y un estado, por medio de una función lambda que filtra por fecha, luego por el estado y finalmente ordena por id, pulsaremos el botón "Listar turnos" y nos devolverá, por medio de una tabla, de la base de datos todos los turnos que posean esa misma fecha y el estado seleccionado.
### Volver al inicio.
Salvo en el index.jsp todas las demás páginas disponen de esta opción que redirige al propio index. Esta función se ha implementado para volver a inicio en caso de que se pulsase una opción por error y se quiera volver atrás sin tener que introducir datos.

## Configuración
Para la configuración basta con lo solicitado en el apartado de instalación ya que se descargará el proyecto completo y si se tiene todo lo indicado en ese punto el programa funcionará correctamente.

## Estructura de carpetas y Archivos
La estructura de carpetas y archivos se ha basado en el modelo de JPA:
* **Igu(Web pages)**
  - agregarCiudadano.jsp
  - agregarTurno.jsp
  - error.jsp
  - filtrar.jsp
  - index.jsp
  - listar.jsp
* **Lógica**
  - Ciudadano.java
  - Controladora.java
  - Turno.java
* **Persistencia**
  * **exceptions**
    - IllegalOrphanException.java
    - NonexistentEntityException.java
    - PreexistingEntityException.java
  - CiudadanoJpaController.java
  - ControladoraPersistencia.java
  - TurnoJpaController.java
* **Servlets**
  - CiudadanoSv.java
  - FiltroSv.java
  - ListaSv.java
  - MenuSv.java
  - TurnoSv.java
