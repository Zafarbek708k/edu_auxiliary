# edu_auxiliary

A new Flutter project.
---
# Edu Auxiliary

Edu Auxiliary is a Learning Management System (LMS) application designed to provide a seamless online learning experience. Built using Flutter and Riverpod state management, Edu Auxiliary integrates Firebase for real-time database, Cloud Firestore, and Authentication services, with support for localization, theming, and local storage via SharedPreferences. The app is designed with a structured and modular architecture for maintainability and scalability.

## Table of Contents
    
    1. [Features](#features)
       2. [Technologies Used](#technologies-used)
       3. [Project Structure](#project-structure)
       4. [Setup Instructions](#setup-instructions)
       5. [Usage](#usage)
       6. [Contributing](#contributing)
       7. [License](#license)

---

## Features
    
    - **User Authentication**: Firebase Authentication integration for secure sign-up, login, and account management.
      - **Real-Time Database & Cloud Firestore**: Stores and synchronizes data with Firebase's real-time capabilities.
      - **Localization**: Supports multiple languages (English, Russian, and Uzbek) using ARB files.
      - **Theming**: Customizable themes that can be toggled in the settings.
      - **Local Storage**: Stores user preferences locally using SharedPreferences.
      - **Modular Design**: Organized feature and core modules following clean architecture principles.
      - **Teacher Dashboard**: Provides specialized tools and analytics for teachers.

## Technologies Used
    
    - **Flutter** with **Riverpod** for state management.
      - **Firebase**:
          - **Authentication** for user management.
          - **Cloud Firestore** and **Realtime Database** for data storage.
      - **Localization**: ARB files (`app_en.arb`, `app_ru.arb`, `app_uz.arb`) for language support.
      - **Shared Preferences** for local storage.
      - **Custom Interceptors** for network requests.

## Project Structure

The project follows a well-structured and modular architecture to ensure scalability and maintainability. Below is an overview of the structure:

        ```
        lib
        └── generated
        │   └── asset.dart                   # Asset management
        └── l10n
        │   ├── app_en.arb                   # English localization
        │   ├── app_ru.arb                   # Russian localization
        │   └── app_uz.arb                   # Uzbek localization
        └── src
            ├── core
            │   ├── constants                # Defines app-wide constants
            │   ├── interceptors             # Custom interceptors for network requests
            │   ├── routes                   # Route management
            │   ├── server                   # API server configurations
            │   ├── storage                  # Local storage configurations
            │   ├── style                    # Theme and style configurations
            │   └── widgets                  # Reusable widgets
            ├── data
            │   ├── entity                   # Defines data models
            │   └── repository               # Data repositories
            ├── feature
            │   ├── auth                     # Authentication module
            │   ├── course                   # Course module
            │   ├── home                     # Home module
            │   ├── inbox                    # Inbox/Notifications module
            │   ├── profile                  # User profile module
            │   ├── setting                  # App settings (theme and localization)
            │   ├── teacher                  # Teacher dashboard
            │   └── widgets                  # Feature-specific widgets
            ├── app.dart                     # Main app widget
            └── firebase_options.dart        # Firebase configuration options
            └── main.dart                    # Application entry point
            └── riverpod.dart                # Riverpod provider management
            └── runner.dart                  # App runner
            └── setup.dart                   # Dependency injection setup
        ```

## Setup Instructions

To set up the project on your local machine:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/EduAuxiliary.git
   cd EduAuxiliary
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**:
    - Ensure Firebase is set up for iOS, Android, and Web (if applicable).
    - Add your `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) in the respective directories.
    - Replace `firebase_options.dart` with your Firebase configuration (or use the existing `firebase_options.dart` file if already configured).

4. **Run the application**:
   ```bash
   flutter run
   ```

## Usage

Edu Auxiliary offers the following core modules:

- **Authentication**: Sign up, log in, and manage user accounts.
- **Courses**: Access and enroll in various courses.
- **Inbox**: Receive and manage messages/notifications.
- **Profile**: Update user information and view activity.
- **Settings**: Change language preferences and themes.
- **Teacher Dashboard**: Manage courses and view analytics (for teachers).

## Contributing

We welcome contributions! Please follow these steps:

1. Fork the project.
2. Create your feature branch: `git checkout -b feature/AmazingFeature`.
3. Commit your changes: `git commit -m 'Add some AmazingFeature'`.
4. Push to the branch: `git push origin feature/AmazingFeature`.
5. Open a pull request.

## License

Distributed under the MIT License. See `LICENSE` for more information.

---

Happy coding with **Edu Auxiliary**! 🎓

