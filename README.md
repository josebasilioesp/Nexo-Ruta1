# Nexa Ruta | Plataforma de Gestión de Flotas de Carga Pesada

Sistema integral multiempresa de gestión de transporte de carga pesada y logística adaptado al mercado peruano (**es-PE**, **America/Lima**, moneda **PEN S/**, normativas del **MTC**, validación de **SUNAT RUC/DNI** y licencias **A-IIb**, **A-IIIb**, **A-IIIc**).

Diseñado bajo el modelo **SaaS multi-inquilino** para ser alquilado a múltiples empresas transportistas, garantizando aislamiento estricto de datos por empresa, panel del Administrador General para control maestro, portal del Supervisor con mapa GPS en vivo y galería de evidencias, y portal móvil PWA para conductores.

---

## 🚀 Características Principales

1. **Pantalla de Inicio Sobria y Limpia**:
   - Portadas responsivas en alta definición: formato paisaje para computadoras y retrato para dispositivos móviles.
   - Logotipo oficial de Nexa Ruta.
   - Formulario de acceso sobrio sin botones técnicos visibles de Google Drive ni Google Apps Script.
   - Consentimiento obligatorio de Privacidad y Tratamiento de Datos bajo la **Ley N° 29733 de Protección de Datos Personales del Perú**.

2. **Portal del Supervisor de Flota ("Servicios de mi empresa")**:
   - **Aislamiento Multiempresa Estricto**: Cada supervisor ve únicamente los tractos, carretas, servicios y choferes de su propia empresa.
   - **Registrar Conductor**: Permite inscribir nuevos conductores con sus datos completos (DNI, Celular, Licencia MTC, categoría, placas asignadas) y generar al instante su usuario y contraseña para la app móvil.
   - **Asignar Rutas y Despacho**: Creación y asignación de servicios de transporte indicando origen, destinos, tipo de carga, peso y fecha/hora prevista.
   - **Seguimiento GPS y Galería de Evidencias**:
     - Botón **"Ver en mapa y fotos"** en cada conductor.
     - Mapa interactivo con **Leaflet** mostrando la última posición satelital del camión, recorrido y estado.
     - Galería completa de fotografías subidas por el conductor ordenadas cronológicamente con fecha, hora y ubicación.
     - **Visor Lightbox** en pantalla completa para revisar precintos, remitos y guías en alta resolución.
   - **Exportación de Reportes**: Descarga directa de la operación de su flota a **Excel (.xlsx)** y **PDF**.

3. **Portal del Administrador General (Control Maestro)**:
   - **Gestión de Empresas Clientes**: Alta de nuevas empresas transportistas y control de licencias (activar/suspender).
   - **Supervisión de Flotas**: Vista centralizada de qué conductores ha incorporado cada empresa.
   - **Manipulación de Usuarios y Contraseñas**: Modal administrativo para editar datos, cambiar contraseñas y modificar el estado de cualquier usuario de la plataforma.
   - **Historial Filtrable por Período**: Consulta de movimientos filtrada por:
     - *Día (Hoy)*
     - *Esta Semana*
     - *Año 2026*
     - *Todo el Historial*
   - **Exportación Global**: Botones de descarga de reportes generales a **Excel (.xlsx)** y **PDF**.

4. **Portal del Conductor (PWA Mobile-First)**:
   - Diseñado prioritariamente para teléfonos inteligentes, instalable como aplicación PWA (Android / iOS).
   - Acceso de solo lectura a su itinerario asignado (el conductor no puede alterar empresas, placas ni asignaciones confirmadas).
   - Los 6 estados operativos reglamentarios:
     1. *Asignado*
     2. *En camino al punto de carga*
     3. *En carga*
     4. *En tránsito al destino*
     5. *En descarga*
     6. *Finalizado*
   - **Subida de Fotos de Evidencia**:
     - Botón permanente en el detalle del viaje.
     - Captura mediante cámara o galería del celular.
     - Selector de paradas y tipo de evidencia (Carga, Descarga, Incidencia, Documento, etc.).
     - Compresión automática en cliente preservando la nitidez de placas y sellos.
     - Almacenamiento fuera de línea con **IndexedDB** y sincronización automática al recuperar señal.
   - Registro de kilometraje con odómetro acumulativo y reporte de incidencias en ruta.

---

## 👥 Credenciales de Prueba

| Rol | Usuario | Contraseña | Empresa / Alcance |
| :--- | :--- | :--- | :--- |
| **Administrador General** | `admin.general` | `DemoAdmin!4826` | Control global, todas las flotas, cambio de claves, exportación día/semana/año |
| **Supervisor** | `supervisor.andinos` | `DemoAndinos!7142` | Transportes Andinos S.A.C. (Gestión de conductores, mapa en vivo, fotos) |
| **Supervisor** | `supervisor.centro` | `DemoCentro!8531` | Carga del Centro S.A. (Flota segregada) |
| **Conductor** | `conductor.juan` | `RutaSegura!2026` | Chofer asignado a Tracto V7X-890 (Transportes Andinos) |
| **Conductor** | `conductor.miguel` | `RutaSegura!2026` | Chofer asignado a Tracto B3K-912 (Carga del Centro) |

---

## 📂 Estructura de Archivos del Repositorio

```text
├── index.html                   # Aplicación Web Frontend completa y portales por rol
├── manifest.json                # Manifiesto PWA para instalación en Android / iOS
├── sw.js                        # Service Worker v2.1 para soporte offline y caché PWA
├── server.js                    # Servidor local Node.js HTTP sin dependencias externas
├── README.md                    # Documentación general y manual de usuario
├── .gitignore                   # Exclusiones de Git
├── subir_a_github.bat           # Script automático para subir a GitHub en Windows
├── recursos/                    # Logos oficiales SVG y portadas de alta definición
│   ├── logo-blanco.svg          # Logotipo vectorial para fondo claro
│   ├── logo-oscuro.svg          # Logotipo vectorial para fondo oscuro
│   ├── portada-desktop.png      # Fondo panorámico para pantallas de escritorio
│   └── portada-mobile.png       # Fondo vertical para dispositivos móviles
├── backend/
│   ├── Code.gs                  # Backend en Google Apps Script (REST API y sincronización Sheets/Drive)
│   └── database_schema.md       # Diccionario de datos relacionales (15 pestañas de control)
└── docs/
    ├── guia_de_pruebas_y_despliegue.md  # Manual paso a paso para Google Sheets, Drive y GitHub Pages
    └── propuesta_cotizacion_tecnica.md  # Arquitectura técnica, costos y acuerdos de nivel de servicio
```

---

## 🌐 Cómo Subir y Publicar en GitHub

### Opción A: Mediante la Web de GitHub (Sin instalar programas)
1. Ingresa a [GitHub](https://github.com/) e inicia sesión.
2. Crea un nuevo repositorio (por ejemplo: `nexa-ruta`).
3. Haz clic en **Add file** > **Upload files**.
4. Arrastra los archivos y carpetas del proyecto (`index.html`, `manifest.json`, `sw.js`, `recursos`, `backend`, `docs`, etc.).
5. Haz clic en **Commit changes**.
6. Ve a **Settings** > **Pages**:
   - En **Build and deployment** > **Branch**, selecciona `main` y carpeta `/ (root)`.
   - Haz clic en **Save**.
   - En 1 o 2 minutos, GitHub te entregará el enlace público (por ejemplo: `https://tu-usuario.github.io/nexa-ruta/`).

### Opción B: Usando el script automático en Windows
1. Haz doble clic en el archivo `subir_a_github.bat`.
2. Si tienes Git instalado, te pedirá la URL de tu repositorio (por ejemplo: `https://github.com/tu-usuario/nexa-ruta.git`).
3. El script inicializará el repositorio, creará el commit y subirá todo automáticamente a la rama `main`.

---

## 💻 Ejecución Local

Para probar la plataforma en tu propia computadora:

```bash
node server.js
```

Abre en tu navegador:
```text
http://localhost:3000
```
