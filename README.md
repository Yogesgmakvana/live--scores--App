# 🏏 Live Scores Flutter App

A production-ready Flutter Cricket Live Score application featuring Firebase Authentication, REST API integration, animated splash screens, profile management, clean architecture, GitHub Actions CI/CD pipeline, and automated APK releases.

---

## ✨ Features

### 🔐 Authentication

* Firebase Authentication
* User Registration
* User Login
* Persistent Login Session
* Logout Functionality

### 🏏 Live Cricket Data

* Real-time Cricket Match Data
* Live Matches
* Upcoming Matches
* Match Details
* Team Information
* Player Information
* REST API Integration (Entity Sport API)

### 👤 Profile Management

* User Profile Screen
* Authentication State Management
* Secure User Session Handling

### 🎨 Modern UI

* Animated Splash Screen
* Material Design 3
* Dark Theme Support
* Reusable Widgets
* Responsive Layout
* Centralized Theme Management
* Clean User Experience

### ⚙️ Configuration Management

* Separate API Configuration File
* Separate Base URL Management
* Separate API Token Management
* Easy Environment Configuration

### 🚀 CI/CD Automation

* GitHub Actions Workflow
* Automated APK Build
* Automated Release Creation
* Version-based Deployment
* Release Asset Upload

---

## 📂 Project Structure

```text
lib/
│
├── ApiServices/
│   └── api_services.dart
│
├── config/
│   └── secret.dart
│
├── constants/
│   ├── colors.dart
│   └── text_string.dart
│
├── firebase/
│   └── firebase_options.dart
│
├── models/
│
├── screens/
│   ├── auth/
│   │   ├── login_screen.dart
│   │   └── register_screen.dart
│   │
│   ├── aboutMatch_screen.dart
│   ├── home_screen.dart
│   ├── players_screen.dart
│   └── splash_screen.dart
│
├── utils/
│   └── util.dart
│
├── widgets/
│   ├── bottom_auth_widget.dart
│   ├── header.dart
│   └── tile_box.dart
│
└── main.dart
```

---

## 🛠 Tech Stack

### Frontend

* Flutter
* Dart

### Backend Services

* Firebase Authentication

### API Integration

* REST API
* HTTP Package
* Entity Sport Cricket API

### DevOps

* Git
* GitHub
* GitHub Actions
* CI/CD Pipeline

### UI/UX

* Material Design 3
* Custom Theme System
* Reusable Widgets

---

## 🔥 Firebase Integration

### Authentication Features

* Email & Password Login
* User Registration
* Session Persistence
* Logout Management

### Firebase Setup

1. Create Firebase Project
2. Enable Authentication
3. Configure Android/iOS Apps
4. Run:

```bash
flutterfire configure
```

5. Generated File:

```text
lib/firebaseServices/firebase_options.dart
```

---

## 🌐 API Configuration

### Secret Configuration

Create:

```text
lib/config/secret.dart
```

```dart
class Secret {
  static const String baseUrl =
      "https://restapi.entitysport.com/v2/";

  static const String token =
      "YOUR_API_TOKEN";
}
```

### Example API Call

```dart
final response = await http.get(
  Uri.parse(
    '${Secret.baseUrl}matches/?status=2&token=${Secret.token}',
  ),
);
```

---

## 🎨 Theme & Color Management

All application colors are managed from:

```text
lib/constants/colors.dart
```

Benefits:

* Single Source of Truth
* Easy Theme Updates
* Consistent UI Design
* Better Maintainability

---

## 📱 Application Flow

```text
Animated Splash Screen
          ↓
Firebase Auth Check
          ↓
Login / Register
          ↓
Home Screen
          ↓
Match Listing
          ↓
Match Details
          ↓
Player Details
```

---

## 🚀 CI/CD Pipeline

This project uses GitHub Actions for automated build and release management.

### Workflow Features

* Automatic Flutter Setup
* Dependency Installation
* APK Build Generation
* GitHub Release Creation
* APK Upload to Releases
* Version-Based Deployment

### Workflow Structure

```text
Push Tag
    ↓
GitHub Actions
    ↓
Flutter Build APK
    ↓
Generate Release
    ↓
Upload APK
    ↓
GitHub Release Ready
```

### Workflow File

```text
.github/workflows/release.yml
```

### Create New Release

```bash
git tag v1.0.0
git push origin v1.0.0
```

GitHub Actions automatically:

* Builds APK
* Creates Release
* Uploads APK Asset

---

## 🔒 Security

Sensitive information is stored separately:

```text
lib/config/secret.dart
```

Add to `.gitignore`:

```gitignore
lib/config/secret.dart
```

Never commit:

* API Tokens
* Private Keys
* Secrets
* Environment Credentials

---

## 📦 Installation

### Clone Repository

```bash
git clone https://github.com/your-username/live_scores.git
```

### Install Packages

```bash
flutter pub get
```

### Run Project

```bash
flutter run
```

### Build APK

```bash
flutter build apk --release
```

---

## 📸 Screens Included

* Animated Splash Screen
* Login Screen
* Registration Screen
* Home Screen
* Match Details Screen
* Player Details Screen
* Profile Management Screen

---

## 🎯 Learning Objectives

This project demonstrates:

* Firebase Authentication
* REST API Integration
* Flutter State Management
* Clean Project Structure
* Reusable Widgets
* Theme Management
* Secure API Configuration
* GitHub Actions CI/CD
* Release Automation

---

## 👨‍💻 Developer

**Yogesh Makwana**

BCA Student | Flutter Developer

### Skills

* Flutter
* Dart
* Firebase
* REST APIs
* Git & GitHub
* CI/CD
* Android Development

---

## ⭐ Support

If you like this project, consider giving it a star on GitHub.

---

## 📄 License

This project is developed for learning, portfolio, and educational purposes.
