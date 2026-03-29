# 🦌 Gacela

[Español](./README_es.md)

Advanced Shared Album Manager for Linux.

*The gallery manager your family actually needed.*

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Made with Gambas](https://img.shields.io/badge/Made%20with-Gambas-green.svg)](http://gambas.sourceforge.net/)
[![Platform](https://img.shields.io/badge/Platform-Linux-orange.svg)](https://www.linux.org/)

## Why Gacela?

**Gacela** is a photo gallery manager built for **families and teams sharing the same Linux computer**. Instead of scattering duplicate files across user folders, Gacela keeps your original images intact while giving fast access to private and shared collections.

## What makes it different

- **Smart multi-user workflow**: switch between private and shared galleries from the same app.
- **Safer photo management**: photo locking helps prevent accidental deletions.
- **Fast previews**: thumbnails are optimized for quick browsing.
- **Event-driven UI**: a responsive interface coordinated through internal services.
- **Lightweight desktop app**: fast startup and low resource usage.

## Why choose Gacela instead of other tools?

### Common problems with traditional gallery software

- Some tools are powerful but heavy.
- Others are simple but do not handle shared usage well.
- Many duplicate or reorganize files in ways that do not fit a family workflow.

### Gacela's approach

- Your original photos remain yours.
- Private and shared environments are separated clearly.
- The app favors confirmation before critical actions.
- A single gallery workflow can serve a whole household or small team.

## Architecture highlights

Gacela is designed with pragmatic engineering principles:

- **Clean Architecture**: separation between business logic and infrastructure.
- **Mediator pattern**: UI coordination is centralized through services such as `PhotoSelectionService`.
- **SQLite-backed metadata**: fast local access to gallery data.
- **Binary thumbnails**: quick preview loading from the database.
- **Decoupled UI components**: forms and services collaborate without excessive coupling.

## Main features

### For families

- **Private spaces per user**
- **Shared albums for household memories**

### For power users

- **Smart import flow**
- **SQLite-based storage**
- **No vendor lock-in**

## Use cases

- Families sharing one Linux desktop
- Small offices with collaborative photo archives
- Home servers or NAS-like gallery setups
- Community or group photography projects

## Screenshots

*Screenshots placeholder*

## Contributing

Contributions are welcome, whether you are reporting bugs, suggesting improvements, or sending code.

1. Fork the repository
2. Create a branch (`git checkout -b feature/my-change`)
3. Commit your changes
4. Push your branch
5. Open a Pull Request

## Contact

<p align="center">
  <a href="https://www.linkedin.com/in/sepulvedamarcos">
    <img src="https://img.shields.io/badge/LinkedIn-Marcos%20Sep%C3%BAlveda-blue?logo=linkedin&logoColor=white" />
  </a>
  <a href="mailto:sepulvedamarcos@gmail.com">
    <img src="https://img.shields.io/badge/Email-sepulvedamarcos%40gmail.com-red?logo=gmail&logoColor=white" />
  </a>
  <a href="https://ko-fi.com/sepulvedamarcos">
    <img src="https://img.shields.io/badge/Ko--fi-Buy%20me%20a%20coffee-ff5e5b?logo=kofi&logoColor=white" />
  </a>
</p>

---

If you like Gacela, consider starring the repository.
