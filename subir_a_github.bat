@echo off
chcp 65001 >nul
title Subir Trans-SaaS Perú a GitHub
cls
echo =====================================================================
echo           SUBIR PROYECTO TRANS-SAAS PERÚ A GITHUB
echo =====================================================================
echo.

:: Verificar si git está instalado
where git >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [AVISO] No se detectó Git instalado en este equipo.
    echo.
    echo Puedes hacer cualquiera de estas dos opciones sencillas:
    echo.
    echo OPCIÓN 1 (Directa desde la web sin instalar nada):
    echo   1. Entra a https://github.com/new y crea tu repositorio.
    echo   2. En la página de tu repositorio haz clic en "uploading an existing file".
    echo   3. Arrastra los archivos de este proyecto o el archivo "trans-saas-peru.zip".
    echo.
    echo OPCIÓN 2 (Instalar Git):
    echo   1. Descarga e instala Git desde: https://git-scm.com/
    echo   2. Vuelve a ejecutar este archivo (subir_a_github.bat).
    echo.
    pause
    exit /b
)

echo [OK] Git detectado correctamente.
echo.
set /p REPO_URL="Pega la URL de tu repositorio de GitHub (ej. https://github.com/tu-usuario/tu-repo.git): "

if "%REPO_URL%"=="" (
    echo [ERROR] Debes ingresar una URL válida de GitHub.
    pause
    exit /b
)

echo.
echo [1/5] Inicializando repositorio Git local...
git init

echo [2/5] Agregando todos los archivos...
git add .

echo [3/5] Creando commit inicial...
git commit -m "feat: Sistema integral de transporte de carga pesada Trans-SaaS Peru"

echo [4/5] Configurando rama principal main...
git branch -M main

echo [5/5] Conectando y subiendo a GitHub (%REPO_URL%)...
git remote remove origin >nul 2>&1
git remote add origin %REPO_URL%
git push -u origin main

if %ERRORLEVEL% equ 0 (
    echo.
    echo =====================================================================
    echo   ¡ÉXITO! Tu proyecto se ha subido correctamente a GitHub.
    echo =====================================================================
) else (
    echo.
    echo [AVISO] Hubo un problema al subir a GitHub. Verifica tus credenciales o permisos en el repositorio.
)

echo.
pause
