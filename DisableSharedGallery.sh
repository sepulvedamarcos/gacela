#!/bin/bash

# ==============================================================================
# Script: DisableSharedGallery.sh
# Description: This script disables the shared gallery for the Gacela
#              application. It removes the shared directory and the
#              dedicated group.
# Author: Gemini
# Version: 1.0
# ==============================================================================

# --- Mensajes de Salida ---
MSG_ROOT_REQUIRED="Este script debe ser ejecutado como root. Abortando."
MSG_DIR_NOT_EMPTY="El directorio '/usr/local/share/gacela' no está vacío. Abortando."
MSG_DIR_REMOVED="Directorio '/usr/local/share/gacela' eliminado exitosamente."
MSG_DIR_NOT_FOUND="El directorio '/usr/local/share/gacela' no existe. Omitiendo eliminación."
MSG_GROUP_REMOVED="Grupo 'gacela-shared' eliminado exitosamente."
MSG_GROUP_NOT_FOUND="El grupo 'gacela-shared' no existe. Omitiendo eliminación."
MSG_SUCCESS="La configuración de la galería compartida ha sido deshabilitada exitosamente."
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
# Verifica si el directorio compartido está vacío
#
check_directory_empty() {
  if [ -d "/usr/local/share/gacela" ]; then
    if [ -n "$(ls -A /usr/local/share/gacela)" ]; then
      echo "$MSG_DIR_NOT_EMPTY"
      exit 1
    fi
  fi
}

#
# Elimina el directorio compartido
#
remove_directory() {
  if [ -d "/usr/local/share/gacela" ]; then
    echo "Eliminando el directorio '/usr/local/share/gacela'..."
    if rm -r /usr/local/share/gacela; then
      echo "$MSG_DIR_REMOVED"
    else
      echo "$MSG_ERROR: No se pudo eliminar el directorio."
      exit 1
    fi
  else
    echo "$MSG_DIR_NOT_FOUND"
  fi
}

#
# Elimina el grupo
#
remove_group() {
  if getent group gacela-shared >/dev/null; then
    echo "Eliminando el grupo 'gacela-shared'..."
    if groupdel gacela-shared; then
      echo "$MSG_GROUP_REMOVED"
    else
      echo "$MSG_ERROR: No se pudo eliminar el grupo."
      exit 1
    fi
  else
    echo "$MSG_GROUP_NOT_FOUND"
  fi
}

# --- Función Principal ---

main() {
  check_root
  check_directory_empty
  remove_directory
  remove_group
  echo "$MSG_SUCCESS"
}

# --- Ejecutar el Script ---
main "$@"
