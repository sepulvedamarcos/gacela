#!/bin/bash

# ==============================================================================
# Script: EnableSharedGallery.sh
# Description: This script configures a shared gallery for the Gacela
#              application. It creates a dedicated group, a shared directory,
#              and sets the necessary permissions.
# Author: Gemini
# Version: 1.0
# ==============================================================================

# --- Mensajes de Salida ---
MSG_ROOT_REQUIRED="Este script debe ser ejecutado como root. Abortando."
MSG_INFO_DIR="Se creará el directorio '/usr/local/share/gacela' para la galería compartida."
MSG_INFO_GROUP="Se creará un grupo llamado 'gacela-shared' para gestionar el acceso a la galería."
MSG_GROUP_EXISTS="El grupo 'gacela-shared' ya existe. Omitiendo creación."
MSG_GROUP_CREATED="Grupo 'gacela-shared' creado exitosamente."
MSG_ADD_USERS_TO_GROUP="Agregando usuarios convencionales al grupo 'gacela-shared' நான"
MSG_NO_USERS_ADDED="No se agregaron nuevos usuarios al grupo."
MSG_USERS_ADDED="Usuarios agregados al grupo."
MSG_DIR_CREATED="Directorio '/usr/local/share/gacela' creado exitosamente."
MSG_PERMISSIONS_SET="Permisos establecidos para el directorio '/usr/local/share/gacela'."
MSG_TEST_FILE_CREATED="Archivo de prueba creado exitosamente."
MSG_TEST_FILE_REMOVED="Archivo de prueba eliminado exitosamente."
MSG_SUCCESS="La configuración de la galería compartida ha finalizado exitosamente."
MSG_ERROR="Se ha producido un error."

# --- Funciones ---

#
# Comprueba si el script se está ejecutando como root
#
check_root() {
  if [[ $EUID -ne 0 ]]; then
    echo "$MSG_ROOT_REQUIRED"
    exit 1
  fi
}

#
# Muestra información sobre el directorio a crear
#
display_info() {
  echo "$MSG_INFO_DIR"
  echo "$MSG_INFO_GROUP"
}

#
# Crea el grupo gacela-shared y agrega usuarios
#
create_group_and_add_users() {
    if getent group gacela-shared >/dev/null; then
        echo "$MSG_GROUP_EXISTS"
    else
        echo "Creando el grupo 'gacela-shared' நான"
        if groupadd gacela-shared; then
            echo "$MSG_GROUP_CREATED"
        else
            echo "$MSG_ERROR: No se pudo crear el grupo 'gacela-shared'."
            exit 1
        fi
    fi

    echo "$MSG_ADD_USERS_TO_GROUP"
    
    # Obtener una lista de usuarios convencionales (UID >= 1000 y con shell de login)
    mapfile -t users < <(getent passwd | awk -F: '$3 >= 1000 && $7 ~ /bash|sh|zsh/ {print $1}')

    if [ ${#users[@]} -eq 0 ]; then
        echo "$MSG_NO_USERS_ADDED"
        return
    fi
    
    for user in "${users[@]}"; do
        if ! groups "$user" | grep -q '\bgacela-shared\b'; then
            echo "Agregando usuario '$user' al grupo 'gacela-shared' நான"
            if usermod -aG gacela-shared "$user"; then
                echo "Usuario '$user' agregado."
            else
                echo "$MSG_ERROR: No se pudo agregar el usuario '$user' al grupo."
            fi
        else
            echo "El usuario '$user' ya pertenece al grupo 'gacela-shared'."
        fi
    done

    echo "$MSG_USERS_ADDED"
}

#
# Crea el directorio y establece los permisos
#
create_directory_and_set_permissions() {
  if [ ! -d "/usr/local/share/gacela" ]; then
    echo "Creando el directorio '/usr/local/share/gacela' நான"
    if mkdir -p /usr/local/share/gacela; then
      echo "$MSG_DIR_CREATED"
    else
      echo "$MSG_ERROR: No se pudo crear el directorio."
      exit 1
    fi
  fi
  
  echo "Estableciendo propietario y permisos..."
  if chown -R root:gacela-shared /usr/local/share/gacela && \
     chmod -R 2775 /usr/local/share/gacela; then
    echo "$MSG_PERMISSIONS_SET"
  else
    echo "$MSG_ERROR: No se pudieron establecer los permisos."
    exit 1
  fi
}

#
# Crea y elimina un archivo de prueba para verificar los permisos
#
test_permissions() {
    echo "Realizando prueba de permisos..."
    local test_file="/usr/local/share/gacela/test.txt"
    
    if touch "$test_file"; then
        echo "$MSG_TEST_FILE_CREATED"
    else
        echo "$MSG_ERROR: No se pudo crear el archivo de prueba."
        exit 1
    fi

    if echo "Esto es una prueba" > "$test_file"; then
        echo "Escritura en el archivo de prueba exitosa."
    else
        echo "$MSG_ERROR: No se pudo escribir en el archivo de prueba."
        exit 1
    fi

    if rm "$test_file"; then
        echo "$MSG_TEST_FILE_REMOVED"
    else
        echo "$MSG_ERROR: No se pudo eliminar el archivo de prueba."
        exit 1
    fi
}


# --- Función Principal ---

main() {
  check_root
  display_info
  create_group_and_add_users
  create_directory_and_set_permissions
  test_permissions
  echo "$MSG_SUCCESS"
}

# --- Ejecutar el Script ---
main "$@"
