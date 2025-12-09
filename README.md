# 🦌 Gacela
Gestor de Álbumes Compartidos En Linux Avanzado

*El gestor de galería que tu familia necesitaba*

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Made with Gambas](https://img.shields.io/badge/Made%20with-Gambas-green.svg)](http://gambas.sourceforge.net/)
[![Platform](https://img.shields.io/badge/Platform-Linux-orange.svg)](https://www.linux.org/)

## ¿Cansado de duplicar fotos por toda tu computadora?

**Gacela** es el primer gestor de galería diseñado específicamente para **familias y equipos que comparten una computadora Linux**. Olvídate de tener copias de tus fotos dispersas por el sistema - Gacela mantiene tus archivos originales intactos mientras te da acceso instantáneo a toda tu colección.

### ✨ Lo que hace único a Gacela

- **🏠 Multiusuario inteligente**: Galerías privadas y compartidas en la misma aplicación a solo un click
- **⚡ Previews instantáneos**: Miniaturas ultrarrápidas sin esperas
- **🎯 Cero duplicación**: No duplicamos el archivo en una galeria de directorios como hacen otros
- **💾 Base de datos única**: Todo organizado en SQLite autocontenido
- **🪶 Súper liviano**: Arranca en segundos, consume mínimos recursos
- **🔍 Filtrado avanzado**: Metadatos EXIF para búsquedas precisas

## 🚀 ¿Por qué elegir Gacela?

### El problema con otros gestores

- **digiKam**: Potente pero pesado, replica archivos, complejo para uso familiar
- **Shotwell**: Básico, sin multiusuario real
- **Otros**: O muy simples o muy complicados

### La solución Gacela

```
📁 Tus fotos no se replacan
💾 Gacela crea una base de datos inteligente
⚡ Previews instantáneos desde la BD
👥 Cada usuario ve lo suyo y lo compartido cambiando el entorno
🎯 Un solo lugar para toda la familia
```

## 🏗️ Arquitectura innovadora

Gacela usa una arquitectura híbrida única:

1. **Compresión ZIP embebida**: Almacena copias comprimidas en SQLite
2. **Thumbnails binarios**: Previsualizaciones ultrarápidas integradas en la BD gracias a una miniatura
3. **Descompresión bajo demanda**: Solo extrae la imagen completa cuando la necesitas

### Beneficios de esta arquitectura

- ⚡ **Velocidad**: Previews desde memoria, sin acceso a disco
- 💿 **Espacio**: Sin duplicación innecesaria
- 🔒 **Integridad**: Tus archivos originales intactos
- 📱 **Portabilidad**: BD autocontenida, fácil de respaldar

## 📋 Características principales

### Para familias
- **Perfiles por usuario**: Cada miembro tiene su espacio privado
- **Álbumes compartidos**: Fotos familiares visibles para todos

### Para power users  
- **Metadatos EXIF**: Filtrado por cámara, fecha, ubicación, configuración
- **Importación inteligente**: Detecta duplicados, organiza automáticamente
- **Base de datos SQLite**: Acceso directo para consultas avanzadas
- **Sin vendor lock-in**: Tus fotos siguen siendo tuyas y accesibles

## 🖥️ Capturas de pantalla

*[Screenshots placeholder - aquí irán las capturas cuando las tengas]*

## 🔧 Instalación

### Desde paquetes (proximamente)
```bash
# Pronto disponible en tu gestor de paquetes favorito
sudo apt install gacela       # Ubuntu/Debian
sudo dnf install gacela       # Fedora  
sudo pacman -S gacela         # Arch Linux
```

### Desde código fuente
```bash
git clone [https://github.com/sepulvedamarcos](https://github.com/sepulvedamarcos/gambas_gacela.git) gacela
cd gacela
#Instrucciones de compilación Gambas
- Ir al menú de proyecto
- Seleccionar opción de creación de ejecutable
- Seleccionar opcion de crear instalador
- Ejecutar el instalador
```

## 🎯 Casos de uso perfectos

- **👨‍👩‍👧‍👦 Familias**: Computadora compartida con fotos de todos
- **🏢 Pequeñas oficinas**: Archivo fotográfico colaborativo  
- **🏠 Servidores caseros**: NAS con acceso multiusuario
- **👥 Colectivos**: Proyectos fotográficos grupales

## 🛣️ Roadmap

- [ ] Gestión básica de galerías
- [ ] Sistema multiusuario
- [ ] Previews optimizados
- [ ] Importación masiva inteligente
- [ ] Geotagging y mapas
- [ ] Integración con servicios cloud
- [ ] Plugins de exportación
- [ ] **Aplicación hermana para ebooks** 📚

## 🤝 Contribuir

¡Las contribuciones son bienvenidas! Ya sea reportando bugs, sugiriendo funcionalidades o enviando código.

1. Fork el proyecto
2. Crea tu branch (`git checkout -b feature/nueva-funcionalidad`)
3. Commit tus cambios (`git commit -m 'Agrega nueva funcionalidad'`)
4. Push al branch (`git push origin feature/nueva-funcionalidad`)
5. Abre un Pull Request

**¿Necesitas algo similar para libros?**
📚 Mantente atento a nuestro próximo proyecto...

### 🤝 Conectemos

<p align="center">
  <a href="https://www.linkedin.com/in/sepulveda-marcos">
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
**¿Te gusta Gacela?**
⭐ Dale una estrella al repo y cuéntanos tu experiencia en [Issues](https://github.com/sepulvedamarcos/gambas_acela/issues)
---
<p align="center">
  <i>"Una aplicación no debería obligarte a reorganizar tu vida digital. Debería adaptarse a como ya trabajas."</i>
</p>
