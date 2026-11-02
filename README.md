# Flutter Book App

A clean and modern book browsing and exploration application built with **Flutter**, fetching live data from **DummyJSON** APIs with a robust architecture and scalable state management.

---

## Features

- **Book Catalog:** Browse a diverse collection of books dynamically fetched from remote endpoints.
- **Detailed View:** Clean inspection interface for viewing specific book details.
- **State Management:** Efficient and predictable UI state handling using **Provider**.
- **Dependency Injection:** Modular service locator implementation via **GetIt**.
- **Architecture:** Strictly structured following the **MVVM (Model-View-ViewModel)** pattern to separate business logic from UI components.

---

## Technologies Used

- **Flutter & Dart** – Cross-platform mobile application development
- **Provider** – State management solution
- **GetIt** – Dependency injection and service locator
- **DummyJSON API** – Remote data provider for book records
- **REST API** – HTTP communication and data parsing

---

## Architecture

The project follows the **MVVM** pattern:
- **Model:** Handles data parsing and data transfer objects (DTOs) from the DummyJSON API.
- **View:** Represents the UI screens and widgets observing state changes.
- **ViewModel:** Manages business logic, API calls, and exposes reactive states to the View via Provider.
