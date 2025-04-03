# Flutter Navigation & Widgets

Este proyecto es una aplicación en Flutter que implementa navegación con `go_router`, muestra una `GridView`, utiliza `TabBar` para organizar secciones y cuenta con un `Drawer` para facilitar la navegación.

## Características
- **Navegación con go_router**: Se implementó la navegación entre pantallas y el paso de parámetros.
- **GridView**: Se muestra una lista de elementos organizados en cuadrícula.
- **TabBar**: Se utilizaron pestañas para cambiar entre diferentes secciones.
- **Drawer**: Menú lateral disponible en las pantallas principales.
- **Evidencia del ciclo de vida**: Se añadieron `print()` en los métodos clave del ciclo de vida de `StatefulWidget` (`initState()`, `didChangeDependencies()`, `build()`, `setState()`, `dispose()`).

## Requisitos
Antes de clonar y ejecutar el proyecto, asegúrete de tener instalado lo siguiente:
- Flutter SDK
- Dart
- Un editor de código como VS Code o Android Studio
- Un emulador o dispositivo físico para probar la app

## Instalación
Sigue estos pasos para configurar y ejecutar el proyecto en tu máquina:

1. Clona este repositorio:
   ```sh
   git clone https://github.com/Cristhian-Cruz/Flutter_dev/tree/dev
   ```
2. Navega al directorio del proyecto:
   ```sh
   cd nombre-del-proyecto
   ```
3. Instala las dependencias:
   ```sh
   flutter pub get
   ```
4. Verifica que tu entorno esté listo:
   ```sh
   flutter doctor
   ```
   Si hay errores, sigue las instrucciones para corregirlos.
5. Ejecuta la aplicación en modo debug:
   ```sh
   flutter run
   ```

## Uso
- Al iniciar, la pantalla principal muestra botones para navegar a `TabBar`, `GridView` y una pantalla de detalle con un mensaje.
- El `Drawer` permite moverse entre las diferentes secciones.
- Los mensajes en consola muestran el ciclo de vida de los widgets en `StatefulWidget`.

## Estructura del Proyecto
```
/lib
│── main.dart           # Punto de entrada de la aplicación
│── router.dart         # Configuración de rutas con go_router
│── screens/
│   ├── home_page.dart  # Pantalla principal con Drawer y botones de navegación
│   ├── grid_view.dart  # Pantalla con una lista de elementos en cuadrícula
│   ├── tab_bar.dart    # Pantalla con TabBar para cambiar entre secciones
│   ├── detail_page.dart# Pantalla que recibe y muestra un mensaje como parámetro
│── widgets/
│   └── custom_drawer.dart # Widget reutilizable para el Drawer
│── models/
│   └── item_model.dart # Modelo de datos para los elementos del GridView
```

## Posibles Errores y Soluciones

1. **Error:** "No matching device found"
   - **Solución:** Asegúrate de tener un emulador corriendo o un dispositivo físico conectado.

2. **Error:** "go_router no encontrado"
   - **Solución:** Asegúrate de haber ejecutado `flutter pub get` para instalar todas las dependencias.

3. **Error:** "Missing 'flutterfire' configuration"
   - **Solución:** Si decides agregar Firebase, usa `flutterfire configure` antes de ejecutar la app.

## Autor
Cristhian Cruz
