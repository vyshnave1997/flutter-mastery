# 🚀 Flutter Mastery - Complete Learning App

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

A comprehensive Flutter learning application covering everything from basic to advanced topics with interactive code examples, designed to help developers master Flutter development and ace technical interviews.

## ✨ Features

- 🎨 **Beautiful UI/UX** - Anime-themed splash screen with smooth animations
- 📚 **Comprehensive Topics** - 80+ topics covering all Flutter concepts
- 💻 **Code Examples** - Real-world code snippets for every topic
- 🔍 **Smart Search** - Quickly find topics you want to learn
- 🎯 **Interview Ready** - Dedicated section for common interview questions
- 📱 **Responsive Design** - Works perfectly on all screen sizes
- 🌙 **Dark Theme** - Easy on the eyes

## 📱 Screenshots

### Splash Screen
Stunning Naruto anime-themed splash screen with animated logo and smooth transitions.

### Main Dashboard
Browse through 8 major categories:
- Basics
- Interview Questions
- Layout Widgets
- UI Widgets
- Scrollable Widgets
- Navigation
- State Management
- Animations
- Advanced

### Topic Details
Each topic includes:
- Clear description
- Detailed code examples
- Copy-to-clipboard functionality
- Syntax-highlighted code

## 🎯 Topics Covered

### 📘 Basics (10 Topics)
- Introduction to Flutter
- What is Flutter?
- Dart Basics
- Widget Tree Concept
- StatelessWidget & StatefulWidget
- BuildContext
- Hot Reload vs Hot Restart
- MaterialApp vs CupertinoApp
- Keys in Flutter

### 💼 Interview Questions (10 Topics)
- StatelessWidget vs StatefulWidget
- Widget Lifecycle
- setState() Deep Dive
- Async in Flutter
- BuildContext Explained
- const vs final
- Keys - When and Why
- InheritedWidget
- Performance Optimization
- main() vs runApp()

### 🎨 Layout Widgets (4 Topics)
- Container
- Row & Column
- Stack
- Flexible & Expanded

### 🖼️ UI Widgets (5 Topics)
- Text & Styling
- Buttons (All Types)
- TextField
- Image
- Card

### 📜 Scrollable Widgets (4 Topics)
- ListView
- GridView
- SingleChildScrollView
- PageView

### 🧭 Navigation (4 Topics)
- Navigator Push/Pop
- Named Routes
- BottomNavigationBar
- Drawer

### 🔄 State Management (4 Topics)
- setState
- InheritedWidget
- Provider Pattern
- ValueNotifier

### 🎭 Animations (4 Topics)
- AnimationController
- Implicit Animations
- Hero Animation
- Custom Animations

### 🚀 Advanced (6 Topics)
- FutureBuilder
- StreamBuilder
- Custom Paint
- Platform Channels
- Isolates
- Themes & Dark Mode

## 🛠️ Installation

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio / VS Code
- Android Emulator / iOS Simulator

### Setup

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/flutter-mastery.git
cd flutter-mastery
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the app**
```bash
flutter run
```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0
```

## 🎨 Customization

### Change App Icon

1. Add your icon to `assets/icon/app_icon.png`

2. Add to `pubspec.yaml`:
```yaml
dev_dependencies:
  flutter_launcher_icons: ^0.13.1

flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/icon/app_icon.png"
```

3. Run:
```bash
flutter pub run flutter_launcher_icons
```

### Change Splash Background

Edit the background image URL in `main.dart`:
```dart
image: NetworkImage('YOUR_IMAGE_URL'),
```

### Modify Theme Colors

Update the theme in `main.dart`:
```dart
theme: ThemeData(
  primarySwatch: Colors.deepPurple, // Change color
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xFF0A0E21),
),
```

## 📂 Project Structure

```
lib/
├── main.dart                 # App entry point
├── splash_screen.dart        # Animated splash screen
├── main_page.dart           # Main dashboard
├── topics_list_page.dart    # Category topics list
├── topic_detail_page.dart   # Topic details with code
└── widgets/
    └── category_card.dart   # Reusable category card
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Your Name**
- GitHub: [@yourusername](https://github.com/yourusername)
- LinkedIn: [Your Name](https://linkedin.com/in/yourprofile)
- Email: your.email@example.com

## 🌟 Show Your Support

Give a ⭐️ if this project helped you learn Flutter!

## 📞 Support

For support, email your.email@example.com or join our Slack channel.

## 🙏 Acknowledgments

- Flutter Team for the amazing framework
- Unsplash for the beautiful images
- The Flutter community for inspiration

## 📱 Download

[Download APK](https://github.com/yourusername/flutter-mastery/releases)

## 🔮 Future Enhancements

- [ ] Add video tutorials
- [ ] Implement code playground
- [ ] Add quiz section
- [ ] Dark/Light theme toggle
- [ ] Bookmark favorite topics
- [ ] Offline mode
- [ ] Multi-language support
- [ ] Export notes as PDF

---

<div align="center">
  <p>Made with ❤️ and Flutter</p>
  <p>⭐ Star this repo if you like it!</p>
</div>
