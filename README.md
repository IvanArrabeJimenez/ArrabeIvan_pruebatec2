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

## Contribuciones
Si deseas contribuir al proyecto, sigue estos pasos:

1. Haz un fork del repositorio.
2. Crea una nueva rama para tu funcionalidad o corrección de errores.
3. Realiza tus cambios y haz commits.
4. Sube tus cambios a tu fork.
5. Crea una solicitud de extracción.
   ¡Gracias por contribuir!

## Documentación de Métodos y clases
En este proyecto, al no haber método Main y como el lanzamiento de la app lo hacemos por medio de JPS pasamos a explicar las clases de la lógica, la persistencia y los servlets:
### Clase Ciudadano:
```java
public class Ciudadano implements Serializable {
```
Clase que representa la entidad Ciudadano mapeada a la base de datos mediante JPA.

### Clase Controladora
```java
public class Controladora {
```
Contiene métodos para realizar operaciones CRUD en la base de datos utilizando JPA (crear, leer, actualizar, eliminar). Recibe la información de los Servlets.java y lo envía a ControladoraPersistencia.java.

### Clase Turno:
```java
public class Turno implements Serializable {
```
Clase que representa la entidad Turno mapeada a la base de datos mediante JPA.

### Clase CiudadanoJpaController
```java
public class CiudadanoJpaController implements Serializable {
```
Realiza las operaciones CRUD en la base de datos utilizando JPA (crear, leer, actualizar, eliminar). Recibe la información de ControladoraPersistencia.java, procesa los datos y, finalmente los devuelve en sentido contrario pasando por las clases hasta llegar al CiudadanoSv.java y éste, a su vez, lo envía al agregarCiudadano.jsp para mostrar los resultados por medio de una tabla.

### Clase ControladoraPersistencia
```java
public class ControladoraPersistencia {
```
Contiene métodos para realizar operaciones CRUD en la base de datos utilizando JPA (crear, leer, actualizar, eliminar). Recibe la información de Controladora.java y lo envía a CiudadanoJpaController.java y a TurnoJpaController.java.

### Clase TurnoJpaController
```java
public class CiudadanoJpaController implements Serializable {
```
Realiza las operaciones CRUD en la base de datos utilizando JPA (crear, leer, actualizar, eliminar). Recibe la información de ControladoraPersistencia.java, procesa los datos y, finalmente los devuelve en sentido contrario pasando por las clases hasta llegar a TurnoSv.java,ListaSv.java y FiltroSv.java,Estos a su vez lo envían al agregarTurno.jsp,listar.jsp y filtrar.jsp para mostrar los resultados por medio de una tabla.

### Clase TurnoJpaController
```java
public class CiudadanoJpaController implements Serializable {
```

### Clase CiudadanoSv
```java
public class CiudadanoSv extends HttpServlet {
```
Recibe de agregarCiudadano.jsp los datos de los ciudadanos a inscribir en la base de datos y lo envía a la Controladora.java para que realice las operaciones CRUD.
Devuelve los resultados al agregarCiudadano.jsp en forma de tabla cuando se solicite.

### Clase FiltroSv
```java
public class FiltroSv extends HttpServlet {
```
Recibe de filtrar.jsp los datos de los turnos a filtrar en la base de datos y lo envía a la Controladora.java para que realice las operaciones CRUD, en concreto la de Leer los datos y por medio de un filtrado por fecha y por estado que le solicitamos nos devuelve en el filtrar.jsp los datos de los turnos solicitados por medio de una tabla.

### Clase ListaSv
```java
public class ListaSv extends HttpServlet {
```
Recibe de listar.jsp los datos de los turnos a filtrar en la base de datos y lo envía a la Controladora.java para que realice las operaciones CRUD, en concreto la de Leer los datos y por medio de un filtrado por fecha  que le solicitamos nos devuelve en el listar.jsp los datos de los turnos solicitados por medio de una tabla.
Envía también los datos por medio de la recogida del id del turno para cambiar el estado del turno seleccionado.

### Clase MenuSv
```java
public class MenuSv extends HttpServlet {
```
Recoge el botón pulsado en el index.jsp y redirige al .jsp correspondiente en función del botón que se haya pulsado.

### Clase TurnoSv
```java
public class TurnoSv extends HttpServlet {
```
Recibe de agregarTurno.jsp los datos de los turnos a inscribir en la base de datos y lo envía a la Controladora.java para que realice las operaciones CRUD.
Cuando termina de inscribir un turno nos redirige al index.jsp.

### Los métodos más importantes a tener en cuenta se encuentran en la clase CiudadanoJpaController.java y TurnoJpaController.java y todos ellos tienen una función para el tratamiento de la base de datos
Los métodos que se utilizan para las operaciones CRUD son: 
* **create()**, para insertar un registro en la base de datos.
* **edit()**, para editar un registro ya existente en la base de datos.
* **findCiudadanoEntities()**, para buscar los ciudadanos en la base de datos y poder visualizarlos en la tabla.
* **findCiudadano()**, para buscar un ciudadano por su id y devolver ese ciudadano para relacionarlo con la tabla de turnos.
* **findTurnoEntities()**, para buscar los turnos en la base de datos y poder visualizarlos en la tabla.
* **findTurno()**, para buscar los turnos por su id y poder cambiar su estado.
* **traerTurnosFecha()**, para filtrar de la base de datos aquellos turnos que hayan sido inscritos en una fecha determinada y devolverlos al .jsp para visualizarlos en la tabla.
* **traerTurnosFechaEstado()**, para filtrar de la base de datos aquellos turnos que hayan sido inscritos en una fecha determinada y un estado concreto y devolverlos al .jsp para visualizarlos en la tabla.

## Supuestos
* Se asume que los datos ingresados por el usuario (nombres, apellidos, fecha, etc.) son válidos y están formateados correctamente.
* No se implementa validación exhaustiva de datos de entrada para simplificar el ejemplo.
* Se asume que el usuario conoce el ID de los ciudadanos y de los turnos para evitar que los jsp lancen errores.
* Se asume que el usuario sabe utilizar el IDE y que sabe como se inicia el programa.

## Problemas conocidos
De mo
