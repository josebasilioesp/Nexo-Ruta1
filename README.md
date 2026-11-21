# Trans-SaaS Perú | Plataforma de Gestión de Flotas de Carga Pesada

Sistema integral multi-empresa de gestión de transporte de carga pesada y logística adaptado al mercado peruano (es-PE, America/Lima, PEN S/, MTC, SUNAT RUC/DNI). La plataforma está diseñada bajo el modelo SaaS para ser alquilada a múltiples empresas transportistas, garantizando aislamiento estricto de datos.

---

## 🚀 Características Principales

1. **Pantalla de Inicio con Simulador 1-Clic**:
   - Acceso sobrio y profesional con campos de usuario, contraseña, selector de visibilidad y botón ingresar.
   - **Simulador de Accesos (1 Clic)** para probar inmediatamente los 3 perfiles: Administrador General, Supervisores y Conductores sin memorizar credenciales.
2. **Requisito Central: Subida de Fotos de Evidencia**:
   - Botón permanentemente visible en el detalle del viaje del conductor.
   - Captura directa desde cámara o galería de fotos.
   - Compresión en cliente (< 500 KB) con HTML Canvas preservando legibilidad de precintos, placas y guías selladas.
   - Almacenamiento directo en carpetas privadas de **Google Drive** y registro de fila en **Google Sheets**.
   - Funcionamiento sin conexión (**IndexedDB**): almacena fotos pendientes de envío y sincroniza automáticamente al recuperar la red.
3. **Portal del Conductor (PWA Mobile-First)**:
   - Vista optimizada para celulares Android e iOS instalable como aplicación.
   - Tarjetas con placa del tracto, placa de la carreta, origen, paradas y estado.
   - Los 6 estados reglamentarios: *Asignado*, *En camino al punto de carga*, *En carga*, *En tránsito al destino*, *En descarga*, *Finalizado*.
   - Flujo multi-destino: botón *"Continuar al siguiente destino"* al completar la primera descarga.
   - Registro de kilometraje con validación estricta (Km final $\ge$ Km inicial).
   - Captura de ubicación GPS satelital con precisión en metros.
   - Reporte de incidencias de ruta con evidencia fotográfica.
4. **Portal del Supervisor ("Servicios de mi empresa")**:
   - Modo de solo lectura con aislamiento estricto (solo ve la información de su propia empresa).
   - **Conductores de mi flota**: consulta individual de cada chofer con su recorrido, odómetro y la galería de todas las fotos subidas con visor en pantalla completa (lightbox).
   - Filtros de búsqueda por código, chofer, placa y destino.
   - Exportación de reportes a **Excel (.xlsx)** con SheetJS y **PDF** con jsPDF.
5. **Panel del Administrador General (Propietario)**:
   - 10 módulos operativos completos:
     1. *Resumen General*: Métricas y KPIs de flota nacional.
     2. *Empresas Clientes*: Alta de transportistas y activación/suspensión de accesos.
     3. *Usuarios del Sistema*: Creación de cuentas y asignación de roles.
     4. *Conductores Registrados*: Fichas técnicas, licencias MTC y categorías.
     5. *Tractos y Carretas*: Tablas de camiones y semirremolques con historial.
     6. *Servicios y Asignaciones*: Programación con detección automática de cruces y conflictos de recursos.
     7. *Auditoría de Evidencias*: Control de visibilidad de fotos para supervisores (`AUTORIZADO` / `RESTRICTO`).
     8. *Incidencias Operativas*: Alertas de ruta y acciones administrativas.
     9. *Libro de Auditoría*: Registro inmutable de correcciones con motivo obligatorio.
     10. *Respaldos Google Drive*: Ejecución de respaldo manual y disparador diario a las 02:00 AM.
   - Acceso nativo desde Google Workspace mediante Google Apps Script HTML Service sin exigir segunda contraseña.

---

## 👥 Credenciales de Prueba (Simulador Multi-Empresa)

| Entidad / Empresa | Rol | Usuario | Contraseña Demo |
| :--- | :--- | :--- | :--- |
| **Control Global** | **Administrador General** *(Propietario)* | `admin.general` | `DemoAdmin!4826` |
| **Transportes Andinos S.A.C.** | **Supervisor de Flota** | `supervisor.andinos` | `DemoAndinos!7142` |
| **Transportes Andinos S.A.C.** | **Conductor** *(Juan Carlos Pérez)* | `conductor.andinos` | `RutaAndinos!3658` |
| **Carga del Centro S.A.** | **Supervisor de Flota** | `supervisor.centro` | `DemoCentro!5931` |
| **Carga del Centro S.A.** | **Conductor** *(Raúl Mendoza Díaz)* | `conductor.centro` | `RutaCentro!8274` |
| **Logística del Pacífico E.I.R.L.** | **Supervisor de Flota** | `supervisor.pacifico` | `DemoPacifico!6419` |
| **Logística del Pacífico E.I.R.L.** | **Conductor** *(Miguel Flores Ticona)* | `conductor.pacifico` | `RutaPacifico!2583` |

---

## 📂 Estructura del Proyecto

```text
├── index.html                   # Aplicación Web y PWA (Frontend integral y portales por rol)
├── server.js                    # Servidor local Node.js HTTP sin dependencias externas
├── manifest.json                # Manifiesto PWA para instalación en Android / iOS
├── sw.js                        # Service Worker para modo fuera de línea y caché
├── .gitignore                   # Archivos ignorados por Git
├── backend/
│   ├── Code.gs                  # Backend completo en Google Apps Script (REST API y HTML Service)
│   └── database_schema.md       # Diccionario de datos de las 15 hojas relacionales
└── docs/
    ├── guia_de_pruebas_y_despliegue.md  # Manual paso a paso de despliegue en Google Sheets y Drive
    └── propuesta_cotizacion_tecnica.md  # Arquitectura técnica, cuotas y presupuesto
```

---

## 🛠️ Cómo Ejecutar Localmente

1. Clona o descarga este repositorio en tu computadora.
2. Asegúrate de tener instalado [Node.js](https://nodejs.org/).
3. Abre una terminal en la carpeta del proyecto y ejecuta:
   ```bash
   node server.js
   ```
4. Abre tu navegador web en: **`http://localhost:3000`**

---

## ☁️ Conexión con Google Apps Script y Google Sheets

1. Abre [Google Sheets](https://sheets.new) con tu cuenta de Google.
2. En el menú superior ve a **Extensiones** $\to$ **Apps Script**.
3. Pega el código de `backend/Code.gs`.
4. Ejecuta la función `configurarSistema()` y autoriza los permisos de Google Drive y Sheets (creará automáticamente las 15 hojas y las carpetas de evidencias y respaldos).
5. Ejecuta `cargarDatosDemo()` para sembrar las 3 empresas y usuarios de prueba.
6. Haz clic en **Implementar** $\to$ **Nueva implementación** $\to$ **Aplicación web** (Acceso: *Cualquier usuario*).
7. Copia la URL `/exec` generada y pégala en el botón **"Conectar Google Apps Script"** de la barra superior en `http://localhost:3000`.

---

## 📤 Instrucciones para Subir a GitHub

Si deseas subir este proyecto a tu repositorio de GitHub, ejecuta los siguientes comandos en tu terminal o PowerShell:

```bash
# 1. Inicializar repositorio git local (si aún no está inicializado)
git init

# 2. Agregar todos los archivos del proyecto
git add .

# 3. Crear el primer commit
git commit -m "feat: Sistema integral de transporte de carga pesada Trans-SaaS Peru"

# 4. Renombrar la rama principal a main
git branch -M main

# 5. Vincular con tu repositorio remoto de GitHub (reemplaza con tu URL)
git remote add origin https://github.com/TU_USUARIO/TU_REPOSITORIO.git

# 6. Subir los archivos a GitHub
git push -u origin main
```

---

## 📄 Licencia
Propiedad privada y comercial para alquiler SaaS a empresas de transporte de carga pesada en Perú.
