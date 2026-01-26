# Project Overview

Gacela is a photo gallery manager for Linux, designed for families and teams sharing a computer. It is built with Gambas and uses SQLite as its database. The project's main goal is to provide a multi-user environment where users can have their private galleries and shared albums without duplicating files.

## Architecture

The project follows a clean, layered architecture:

*   **Core:** This layer contains the application's core business logic.
    *   **Domain:** Defines the main business entities, such as `PhotoEntity` and `AlbumEntity`.
    *   **Services:** Implements the business logic for the entities. For example, `PhotoService` handles photo-related operations.
    *   **Main.module:** The application's entry point, responsible for initializing all the components and starting the main form.
*   **Infrastructure:** This layer is responsible for data access.
    *   **Data:** Contains the `SQLiteContext` for managing the database connection and the `PhotoRepository` for accessing photo data. It follows the repository pattern to decouple the business logic from the data access layer.
*   **Views:** This layer contains the application's user interface.
    *   It consists of Gambas forms (`.form`) and their corresponding code-behind classes (`.class`).
*   **Configuration:** This layer manages the application's configuration.

## Key Features

*   **Multi-user support:** Each user can have a private gallery, and there can be shared albums for everyone.
*   **No file duplication:** Gacela works with the original files, avoiding duplicates.
*   **SQLite database:** All the photo metadata is stored in a single SQLite database file.
*   **Fast previews:** Thumbnails are generated and stored for fast loading.

# Building and Running

## From source

1.  Clone the repository:
    ```bash
    git clone https://github.com/sepulvedamarcos/gambas_gacela.git gacela
    ```
2.  Open the project in the Gambas IDE.
3.  Go to the "Project" menu.
4.  Select the "Make executable" option.
5.  Select the "Make installer" option.
6.  Run the generated installer.

## From .deb package

Download the `.deb` package from the repository and install it.

# Development Conventions

*   **Language:** The project is written in Gambas.
*   **Coding Style:** The code follows the standard Gambas conventions. It uses explicit variable declarations and a consistent naming convention.
*   **Dependency Injection:** The project uses dependency injection to manage the dependencies between the different components. For example, the `PhotoService` receives a `PhotoRepository` instance in its constructor.
*   **Error Handling:** The project uses `Try...Catch` blocks for error handling.
*   **Logging:** The project uses a custom logging class `Log4Gambas3` for logging.
*   **Gambas Class Files:** Files with the `.class` extension are text files and can be opened with any text editor.
