# Flutter Navigation & Widgets

Este proyecto es una aplicación en Flutter que implementa navegación con `go_router`, muestra una `GridView`, utiliza `TabBar` para organizar secciones y cuenta con un `Drawer` para facilitar la navegación.

## Características
- **Navegación con go_router**: Se implementó la navegación entre pantallas y el paso de parámetros.
- **GridView**: Se muestra una lista de elementos organizados en cuadrícula.
- **TabBar**: Se utilizaron pestañas para cambiar entre diferentes secciones.
- **Drawer**: Menú lateral disponible en las pantallas principales.
- **Evidencia del ciclo de vida**: Se añadieron `print()` en los métodos clave del ciclo de vida de `StatefulWidget` (`initState()`, `didChangeDependencies()`, `build()`, `setState()`, `dispose()`).
- **Lista de Estudiantes**:  
  - Se cargan datos asíncronos con `Future.delayed()`.  
  - Mientras se obtienen, se muestra un `CircularProgressIndicator`.
- **Tarea Pesada con Isolate**:  
  - Se ejecuta en segundo plano sin bloquear la interfaz.  
  - Muestra el resultado en un `SnackBar`.  

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


## Posibles Errores y Soluciones

1. **Error:** "No matching device found"
   - **Solución:** Asegúrate de tener un emulador corriendo o un dispositivo físico conectado.

2. **Error:** "go_router no encontrado"
   - **Solución:** Asegúrate de haber ejecutado `flutter pub get` para instalar todas las dependencias.

3. **Error:** "Missing 'flutterfire' configuration"
   - **Solución:** Si decides agregar Firebase, usa `flutterfire configure` antes de ejecutar la app.
     
4. Error: "Botón de retroceso cierra la aplicación"
   - **Solución:** Se implementó `WillPopScope` para controlar el comportamiento del botón de retroceso.

## Autor
Cristhian Cruz
