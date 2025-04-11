# 📱 Flutter Clean Architecture Example (Riverpod)

A sample Flutter app demonstrating **Clean Architecture principles** using **Riverpod** for state management. The app fetches posts from the JSONPlaceholder API and displays them in a beautifully designed list with card-based post previews and random image thumbnails.

---

## 🚀 Features

- ✅ Clean Architecture Structure  
- ✅ Riverpod for State Management  
- ✅ Layered Separation of Concerns  
  - Presentation  
  - Domain  
  - Data  
- ✅ Remote API Integration with Dio  
- ✅ Custom Model Mapping (DTOs to Entities)  
- ✅ Material 3 UI  
- ✅ Error & Loading States  
- ✅ Pull-to-Refresh Support  
- ✅ Random Thumbnails for Visual Appeal  

---

## 🧠 Architecture Overview

```
lib/
├── data/
│   ├── models/                # DTOs (Data Transfer Objects)
│   ├── repositories/          # Concrete implementations of repositories
│   └── sources/               # Remote data sources (API)
├── domain/
│   ├── entities/              # Core business models
│   ├── repositories/          # Abstract repository interfaces
│   └── usecases/              # Application-specific business rules
├── presentation/
│   ├── providers/             # Riverpod providers
│   ├── screens/               # UI screens
│   └── widgets/               # Reusable UI components
└── main.dart                  # App entry point
```

---

## 📦 Dependencies

Make sure your `pubspec.yaml` includes the following:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.4.0
  dio: ^5.0.0
  freezed_annotation: ^2.4.1
  json_annotation: ^4.8.0
```

---

## 🔗 API Used

This app uses the public [JSONPlaceholder](https://jsonplaceholder.typicode.com/) REST API to fetch post data.

---

## 🛠 Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/zafar-iqbal-khan/post_app_flutter.git
cd post_app_flutter
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the App

```bash
flutter run
```

---


