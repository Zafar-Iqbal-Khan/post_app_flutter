📱 Flutter Clean Architecture Example (Riverpod)
This project is a sample Flutter app that demonstrates Clean Architecture principles using Riverpod as the state management solution. It fetches posts from a public REST API and displays them in a beautiful list UI with card-based post previews and images.

🚀 Features
✅ Clean Architecture Structure

✅ Riverpod for state management

✅ Separation of concerns (Presentation, Domain, Data)

✅ Remote API integration with Dio

✅ Custom model mapping

✅ Modern UI with Material 3

✅ Error and loading states

✅ Refresh to reload posts

✅ Random image thumbnails for aesthetics

🧠 Architecture Overview

lib/
├── data/
│   ├── models/                # DTOs
│   ├── repositories/          # Concrete implementations
│   └── sources/               # API / Remote data access
├── domain/
│   ├── entities/              # Core business models
│   ├── repositories/          # Abstract repositories
│   └── usecases/              # Business logic
├── presentation/
│   ├── providers/             # Riverpod providers
│   ├── screens/               # UI Screens
│   └── widgets/               # Reusable widgets
└── main.dart                  # App entry

📦 Dependencies
Make sure your pubspec.yaml includes:


dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.4.0
  dio: ^5.0.0
  freezed_annotation: ^2.4.1
  json_annotation: ^4.8.0

🔗 API Used
Data is fetched from JSONPlaceholder.

🛠 Setup
Clone the repo:


git clone https://github.com/zafar-iqbal-khan/post_app_flutter.git
cd post_app
Get packages:


flutter pub get

Run the app:


flutter run


