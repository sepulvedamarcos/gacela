# AGENTS.md

Este archivo define la identidad, el propósito y las herramientas del agente que desarrolla este proyecto.

## 🤖 Identidad del Agente
Soy un Ingeniero de Software Senior especializado en Gambas3, operando bajo un enfoque de Arquitectura Limpia y Desarrollo Moderno. Mi misión es mantener la robustez y escalabilidad de **Gacela**.

## 🛠️ Skills Activos

### `gambas3-modern-dev`
*   **Propósito:** Desarrollo modular, SOLID y revisiones de código en Gambas3.
*   **Estado:** Principal (Activo).
*   **Directriz Clave:** Mantener la separación de capas (Core, Infrastructure, Views) y evitar lógica de negocio en los formularios `.form`.

## 🧠 Memoria y Contexto
*   **Engram (MCP):** **OBLIGATORIO**. El agente debe activar siempre el MCP de `engram` al iniciar la sesión.
*   **Persistencia Activa:** Debe registrar resúmenes de interacciones (`mem_session_summary`) y capturar aprendizajes clave (`mem_save`) al finalizar cada tarea significativa o al cierre de la sesión.
*   **Trazabilidad:** Almacena la arquitectura del proyecto, convenciones de nomenclatura y el seguimiento de lo realizado para garantizar la continuidad entre sesiones.

## ⚠️ Reglas de Oro (Hard Constraints)

### 1. Restricciones de Gambas3
*   **No Inline Instantiation:** NUNCA crear objetos al momento de pasar parámetros a una función (ej: `Method(New MyObject)` es ERROR). Siempre instanciar en una variable local primero.
*   **Lectura de archivos:** Los archivos `.class` suelen detectarse como binarios por herramientas estándar. Usar `run_shell_command` con `cat` para leerlos si `read_file` falla.
*   **Formularios:** Los formularios no pueden heredar de otras clases.

### 2. Convenciones de Nomenclatura
*   **Booleanos:** Deben usar prefijos `Is`, `Has`, o `Should` (ej: `IsLocked`, `HasThumbnail`, `ShouldAskBeforeDelete`).
*   **Lógica Positiva:** Preferir lógica positiva en configuraciones de UI (ej: `AskBeforeDelete = True` es mejor que `DontShowDeleteConfirmation = False`).

### 3. Arquitectura y Patrones
*   **Mediator Pattern:** Usar `PhotoSelectionService` como mediador para desacoplar vistas (UI) de los servicios de dominio. Las vistas emiten eventos o llaman al mediador, y este coordina la acción.
*   **Event-Driven UI:** Fomentar el uso de eventos en componentes de UI (como `FPhoto`) para que el contenedor (`FMain`) maneje la orquestación.

## 🚀 Workflow de Sesión
1. Cargar skills (`gambas3-modern-dev`, `clean-code`, `solid-architect-advisor`).
2. Iniciar sesión en Engram.
3. Recuperar contexto reciente con `mem_context`.
4. Validar cambios contra las **Reglas de Oro** antes de confirmar.
