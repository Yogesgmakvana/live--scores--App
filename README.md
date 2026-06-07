# 🏏 Live Scores Flutter App

A modern Flutter application that provides real-time cricket match updates using a REST API. The app includes Firebase Authentication, animated splash screens, profile management, clean architecture, and a responsive UI.

---

## ✨ Features

### 🔐 Authentication

* Firebase Authentication
* User Registration
* User Login
* Persistent Login Session
* Logout Functionality

### 🏏 Live Cricket Scores

* Real-time cricket match data using REST API
* Upcoming Matches
* Live Matches
* Match Details
* Team Information
* Player Information

### 👤 Profile Management

* View User Profile
* Update Profile Information
* Manage Authentication State

### 🎨 UI Features

* Modern Material Design
* Dark Theme Support
* Animated Splash Screen
* Reusable Widgets
* Responsive Layout
* Centralized Color Management

### ⚙️ Configuration

* Separate file for API Token
* Separate file for Base URL
* Easy API configuration management

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
├── firebaseServices/
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

## 🛠 Technologies Used

* Flutter
* Dart
* Firebase Authentication
* REST API
* HTTP Package
* Material Design

---

## 🔥 Firebase Setup

1. Create a Firebase Project.
2. Enable Authentication.
3. Add Android/iOS Application.
4. Download configuration files.
5. Run:

```bash
flutterfire configure
```

6. Ensure `firebase_options.dart` is generated successfully.

---

## 🌐 API Configuration

Create a separate configuration file:

### `lib/config/secret.dart`

```dart
class Secret {
  static const String baseUrl =
      "https://restapi.entitysport.com/v2/";

  static const String token =
      "YOUR_API_TOKEN";
}
```

Example API Call:

```dart
final response = await http.get(
  Uri.parse(
    '${Secret.baseUrl}matches/?status=2&token=${Secret.token}',
  ),
);
```

---

## 🎨 Theme & Colors

All colors are managed from:

```text
lib/constants/colors.dart
```

Benefits:

* Easy Theme Management
* Reusable Colors
* Consistent UI Design
* Dark Theme Support

---

## 🚀 Getting Started

### Clone Repository

```bash
git clone <repository-url>
```

### Install Dependencies

```bash
flutter pub get
```

### Run Application

```bash
flutter run
```

---

## 📸 Application Flow

```text
Splash Screen
      ↓
Authentication Check
      ↓
Login / Register
      ↓
Home Screen
      ↓
Match List
      ↓
Match Details
      ↓
Player Details
```

---

## 🔒 Security

Add secret files to `.gitignore`:

```gitignore
lib/config/secret.dart
```

If using environment variables:

```gitignore
.env
```

Never upload API Tokens or private keys to GitHub.

---

## 📱 Screens

* Animated Splash Screen
* Login Screen
* Registration Screen
* Home Screen
* Match Details Screen
* Player Details Screen
* Profile Screen

---

## 👨‍💻 Developer

**Yogesh Makwana**

BCA Student | Flutter Developer

---

## 📄 License

This project is created for learning and portfolio purposes.
