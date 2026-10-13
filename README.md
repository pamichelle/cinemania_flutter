CineManía

**Aplicación de catálogo de películas desarrollada con Flutter y Dart.**

Descripción

CineManía es una aplicación que permite explorar un catálogo de películas de una manera sencilla e interactiva. Su objetivo es que los usuarios puedan conocer diferentes películas, consultar su información y guardar sus favoritas.

Objetivo del proyecto

Desarrollar una aplicación interactiva utilizando Flutter, aplicando conceptos de diseño de interfaces, navegación entre pantallas, manejo de datos y componentes visuales.

Tecnologías utilizadas

- **Flutter:** framework utilizado para desarrollar la aplicación.
- **Dart:** lenguaje de programación utilizado.
- **Material Design:** componentes visuales para construir la interfaz.
- **Git y GitHub:** herramientas para controlar versiones y almacenar el código fuente.

Funcionalidades

- Pantalla de bienvenida con transición automática.
- Catálogo de películas con imágenes y descripciones.
- Buscador para encontrar películas por título.
- Filtros por categorías y géneros.
- Pantalla de detalles para consultar información de cada película.
- Opción para agregar y quitar películas de favoritos.
- Interfaz visual con tema oscuro y detalles en color rojo.

Capturas de pantalla

Pantalla de bienvenida
<img width="774" height="515" alt="image" src="https://github.com/user-attachments/assets/ecdf2060-fc6a-4b4f-b785-eb7220315605" />

Catálogo de películas
<img width="959" height="539" alt="image" src="https://github.com/user-attachments/assets/96b0b105-b23c-4e1b-813a-c5ec8a9b03e3" />

Detalle de una película
<img width="959" height="538" alt="image" src="https://github.com/user-attachments/assets/aa816e15-231e-48ef-8d8a-16b561a6f659" />

Películas favoritas
<img width="959" height="539" alt="image" src="https://github.com/user-attachments/assets/945f3c32-365b-40df-872e-1ae065354eae" />


Estructura del proyecto

```text
cinemania/
├── android/
├── ios/
├── lib/
│   └── main.dart
├── linux/
├── macos/
├── test/
├── web/
├── windows/
├── .gitignore
├── pubspec.yaml
├── pubspec.lock
└── README.md
```

Cómo ejecutar el proyecto

1. Instalar Flutter y Dart.
2. Instalar Visual Studio Code y las extensiones necesarias.
3. Descargar o clonar este repositorio.
4. Abrir una terminal dentro de la carpeta del proyecto.
5. Ejecutar los siguientes comandos:

```bash
flutter pub get
flutter run
```

Para ejecutar la aplicación en el navegador Chrome, se puede utilizar:

```bash
flutter run -d chrome
```

Preguntas y respuestas sobre Flutter

### 1. ¿Para qué sirve `Scaffold` y qué función cumple `appBar`?

`Scaffold` proporciona la estructura básica de una pantalla en Flutter. Permite colocar elementos como la barra superior, el contenido principal y los botones de navegación. `appBar` sirve para mostrar una barra en la parte superior de la pantalla.

### 2. ¿Qué es `Card` y para qué sirve la propiedad `elevation`?

`Card` permite agrupar información dentro de una tarjeta visual. La propiedad `elevation` controla la sombra que se muestra debajo de la tarjeta para darle una apariencia de profundidad.

### 3. ¿Cómo se pueden mostrar imágenes con bordes redondeados?

Se puede utilizar el widget `ClipRRect`, que recorta el contenido para que sus esquinas tengan una forma redondeada. Se puede configurar con `borderRadius`.

### 4. ¿Cómo se declaran los recursos o assets en Flutter?

Los archivos locales, como imágenes, se declaran en el archivo `pubspec.yaml`, dentro de la sección `flutter` y la propiedad `assets`. Después se pueden utilizar mediante `Image.asset()`.

### 5. ¿Para qué sirven las propiedades `size` y `color` de `Icon`?

`size` permite cambiar el tamaño del icono y `color` permite cambiar su color.

### 6. ¿Cuál es la diferencia entre `InkWell` y `GestureDetector`?

Ambos permiten detectar gestos del usuario. `InkWell` puede mostrar un efecto visual al tocar un elemento, mientras que `GestureDetector` detecta gestos sin proporcionar ese efecto visual de forma predeterminada.

### 7. ¿Para qué sirve `mainAxisAlignment` en un widget `Row`?

Permite distribuir y alinear los elementos horizontalmente dentro de un `Row`, por ejemplo, al inicio, al centro, al final o con espacios entre ellos.

### 8. ¿Para qué sirve `Expanded` cuando hay problemas de espacio?

`Expanded` permite que un elemento ocupe el espacio disponible dentro de un `Row`, `Column` o `Flex`. Ayuda a distribuir el espacio y puede evitar problemas de desbordamiento.

### 9. ¿Cómo se pueden enviar datos de una pantalla a otra usando `Navigator`?

Se puede utilizar `Navigator.push()` para abrir una nueva pantalla y pasarle los datos mediante su constructor. Por ejemplo, se puede enviar el objeto de una película para mostrar sus detalles.

### 10. ¿Cómo se puede obtener un resultado al regresar de una pantalla con `Navigator.pop()`?

`Navigator.pop()` permite cerrar la pantalla actual y, opcionalmente, devolver un resultado a la pantalla anterior. La pantalla que abrió la nueva puede recibir ese resultado mediante `await` al utilizar `Navigator.push()`.

Autora

Proyecto académico desarrollado como práctica de programación de aplicaciones con Flutter y Dart.

Repositorio

[Ver código fuente de CineManía en GitHub](https://github.com/pamichelle/cinemania_flutter)

---

CineManía — Explora, descubre y guarda tus películas favoritas.
