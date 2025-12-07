# Universal Extensions for Flutter

A lightweight, powerful Flutter package providing **universal extension methods** for Widgets, Strings, Numbers, BuildContext, and more. Designed to reduce boilerplate and make UI development clean, readable, and fast.

---

## ✨ Features

### 🧩 Widget Extensions

* Add padding: `.padAll()`, `.padSymmetric()`, `.padOnly()`
* Add margin: `.marginAll()`, `.marginSymmetric()`
* Alignment helpers: `.center()`, `.align()`
* Tap handler: `.onTap()`
* Layout helpers: `.sized()`, `.expanded()`, `.flexible()`
* SafeArea wrapper: `.safeAre()`

### 🔤 String Extensions

* Convert directly to `Text` widget: `"Hello".txt()`
* `capitalize()`
* Safe parsing: `toInt()`, `toDouble()`

### 🔢 Num Extensions

* Quick space widgets: `10.w`, `20.h`
* EdgeInsets: `10.all`, `10.horizontal`, `10.vertical`

### 🧭 BuildContext Extensions

* Size: `context.width`, `context.height`
* Themes: `context.theme`, `context.textTheme`
* Safe pop: `context.safePop()`

---

## 🚀 Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  universal_extensions: ^1.0.0
```

Then import it:

```dart
import 'package:universal_extensions/universal_extensions.dart';
```

---

## 📌 Usage Examples

### Padding & Margin

```dart
Text("Hello World")
    .padAll(16)
    .marginSymmetric(horizontal: 20);
```

### Centering a widget

```dart
Icon(Icons.star).center();
```

### Making any widget clickable

```dart
Container(width: 100, height: 50)
    .onTap(() => print("Tapped!"));
```

### String to Text Widget

```dart
"Welcome".txt(style: context.textTheme.titleLarge);
```

### Number spacing helpers

```dart
Column(
  children: [
    20.h,
    Text("Item 1"),
    10.h,
    Text("Item 2"),
  ],
);
```

### BuildContext utilities

```dart
SizedBox(
  width: context.width * 0.5,
  height: context.height * 0.2,
);
```

---

## 📚 Why Use Universal Extensions?

* Cleaner widget trees
* Less nesting (Padding → Container → GestureDetector → SizedBox)
* Faster UI development
* Reusable, consistent code across projects
* Minimal, dependency-free

---

## 🧪 Example Project

See the `/example` folder for a full Flutter demo.

---

## 🤝 Contributing

Pull requests are welcome!
If you want to add more extensions (animations, colors, lists, dates, async helpers), feel free to open an issue.

---

## 📄 License

This package is open-source and available under the MIT License.
