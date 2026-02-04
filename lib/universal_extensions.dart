import 'package:flutter/material.dart';

/// ------------------------------
/// WIDGET EXTENSIONS
/// ------------------------------
extension UniversalWidgetExtensions on Widget {
  /// Add padding
  Widget padAll(double value) => Padding(
    padding: EdgeInsets.all(value),
    child: this,
  );

  Widget padSymmetric({double vertical = 0, double horizontal = 0}) => Padding(
    padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
    child: this,
  );

  Widget padOnly({double left = 0, double top = 0, double right = 0, double bottom = 0}) => Padding(
    padding: EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
    child: this,
  );

  /// Add margin using Container
  Widget marginAll(double value) => Container(margin: EdgeInsets.all(value), child: this);

  Widget marginSymmetric({double vertical = 0, double horizontal = 0}) => Container(
    margin: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
    child: this,
  );

  /// Center widget
  Widget center() => Center(child: this);

  /// Align widget
  Widget align(Alignment alignment) => Align(alignment: alignment, child: this);

  /// Make widget clickable
  Widget onTap(VoidCallback fn) => GestureDetector(onTap: fn, child: this);

  /// Add sized constraints
  Widget sized({double? width, double? height}) => SizedBox(width: width, height: height, child: this);

  /// Expanded shortcut
  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);

  /// Flexible shortcut
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) => Flexible(flex: flex, fit: fit, child: this);

  /// Safe Area widget
  Widget safeArea({bool left = true, bool top = true, bool right = true, bool bottom = true, EdgeInsets minimum = EdgeInsets.zero, bool maintainBottomViewPadding = false}) => SafeArea(left: left, right: right, top: top, bottom: bottom, minimum: minimum, maintainBottomViewPadding: maintainBottomViewPadding, child: this);
}

/// ------------------------------
/// STRING EXTENSIONS
/// ------------------------------
extension UniversalStringExtensions on String {
  /// Quick to Text widget
  Text txt({TextStyle? style, TextAlign? align, int? maxLines}) => Text(
    this,
    style: style,
    textAlign: align,
    maxLines: maxLines,
  );

  /// Capitalize first letter
  String capitalize() => isEmpty ? this : this[0].toUpperCase() + substring(1);

  /// Convert to integer safely
  int toInt({int fallback = 0}) => int.tryParse(this) ?? fallback;

  /// Convert to double safely
  double toDouble({double fallback = 0.0}) => double.tryParse(this) ?? fallback;

  /// Check if the string is a valid email
  bool isEmail() {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(this);
  }
}

/// ------------------------------
/// NUM EXTENSIONS
/// ------------------------------
extension UniversalNumExtensions on num {
  /// Convert to sized box width
  SizedBox get w => SizedBox(width: toDouble());

  /// Convert to sized box height
  SizedBox get h => SizedBox(height: toDouble());

  /// EdgeInsets helpers
  EdgeInsets get all => EdgeInsets.all(toDouble());
  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: toDouble());
}

/// ------------------------------
/// CONTEXT EXTENSIONS
/// ------------------------------
extension UniversalContextExtensions on BuildContext {
  Size get size => MediaQuery.of(this).size;

  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Safe navigation pop
  void safePop() {
    if (Navigator.canPop(this)) Navigator.pop(this);
  }
}

/// ------------------------------
/// DATE EXTENSIONS
/// ------------------------------
extension UniversalDateExtensions on DateTime {
  /// Check if the date is today
  bool isToday() {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }
}