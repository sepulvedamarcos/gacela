# 🦌 Gacela

[English](./README.md)

Gestor avanzado de álbumes compartidos para Linux.

*El gestor de galería que tu familia realmente necesitaba.*

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Made with Gambas](https://img.shields.io/badge/Made%20with-Gambas-green.svg)](http://gambas.sourceforge.net/)
[![Platform](https://img.shields.io/badge/Platform-Linux-orange.svg)](https://www.linux.org/)

## ¿Por qué Gacela?

**Gacela** es un gestor de galerías fotográficas pensado para **familias y equipos que comparten una misma computadora Linux**. En lugar de duplicar archivos por distintas carpetas, Gacela mantiene las imágenes originales intactas y ofrece acceso rápido a colecciones privadas y compartidas.

## Qué lo hace diferente

- **Flujo multiusuario inteligente**: cambia entre galerías privadas y compartidas desde la misma aplicación.
- **Gestión más segura**: el bloqueo de fotos ayuda a prevenir borrados accidentales.
- **Previsualizaciones rápidas**: miniaturas optimizadas para una navegación ágil.
- **UI orientada a eventos**: una interfaz responsiva coordinada mediante servicios internos.
- **Aplicación liviana de escritorio**: inicio rápido y bajo consumo de recursos.

## ¿Por qué elegir Gacela?

### Problemas comunes en otros gestores

- Algunas herramientas son potentes, pero pesadas.
- Otras son simples, pero no resuelven bien el uso compartido.
- Muchas duplican o reorganizan archivos de una forma que no encaja con el flujo de una familia.

### El enfoque de Gacela

- Tus fotos originales siguen siendo tuyas.
- Los entornos privados y compartidos están claramente separados.
- La aplicación prioriza pedir confirmación antes de acciones críticas.
- Un único flujo de galería puede servir a todo un hogar o equipo pequeño.

## Puntos destacados de la arquitectura

Gacela está diseñado con principios de ingeniería pragmáticos:

- **Clean Architecture**: separación entre lógica de negocio e infraestructura.
- **Patrón Mediator**: la coordinación de la UI se centraliza en servicios como `PhotoSelectionService`.
- **Metadatos en SQLite**: acceso local rápido a los datos de la galería.
- **Miniaturas binarias**: carga veloz de previews desde la base de datos.
- **Componentes desacoplados**: formularios y servicios colaboran sin acoplamiento excesivo.

## Funcionalidades principales

### Para familias

- **Espacios privados por usuario**
- **Álbumes compartidos para recuerdos familiares**

### Para usuarios avanzados

- **Flujo de importación inteligente**
- **Persistencia basada en SQLite**
- **Sin vendor lock-in**

## Casos de uso

- Familias que comparten un escritorio Linux
- Pequeñas oficinas con archivos fotográficos colaborativos
- Servidores caseros o configuraciones tipo NAS
- Proyectos fotográficos grupales o comunitarios

## Capturas de pantalla

*Placeholder de capturas*

## Contribuir

Las contribuciones son bienvenidas, ya sea reportando bugs, proponiendo mejoras o enviando código.

1. Haz un fork del repositorio
2. Crea una rama (`git checkout -b feature/mi-cambio`)
3. Haz commit de tus cambios
4. Sube tu rama
5. Abre un Pull Request

## Contacto

<p align="center">
  <a href="https://www.linkedin.com/in/sepulvedamarcos">
    <img src="https://img.shields.io/badge/LinkedIn-Marcos%20Sep%C3%BAlveda-blue?logo=linkedin&logoColor=white" />
  </a>
  <a href="mailto:sepulvedamarcos@gmail.com">
    <img src="https://img.shields.io/badge/Email-sepulvedamarcos%40gmail.com-red?logo=gmail&logoColor=white" />
  </a>
  <a href="https://ko-fi.com/sepulvedamarcos">
    <img src="https://img.shields.io/badge/Ko--fi-Apoyar%20con%20un%20caf%C3%A9-ff5e5b?logo=kofi&logoColor=white" />
  </a>
</p>

---

Si te gusta Gacela, considera darle una estrella al repositorio.
