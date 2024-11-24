import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

/// A class for app constants.
class AppConstants {
  static const String appTitle = 'Login Dashboard App';
  static const String fontFamily = 'DM Sans';
}

/// A class for app colors.
class AppColors {
  static const MaterialColor primarySwatch = Colors.red;
  static const Color scaffoldBackgroundColor = Colors.white;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appTitle,
      theme: _buildAppTheme(),
      home: ThemedScaffold(
        child: LoginPage(), // Set LoginPage sebagai layar utama
      ),
    );
  }

  /// Builds the theme for the application.
  ThemeData _buildAppTheme() {
    return ThemeData(
      primarySwatch: AppColors.primarySwatch,
      scaffoldBackgroundColor: const Color.fromARGB(255, 223, 210, 210),
      fontFamily: AppConstants.fontFamily,
    );
  }
}

/// A widget with themed background and decorative shapes
class ThemedScaffold extends StatelessWidget {
  final Widget child;

  const ThemedScaffold({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with shapes and lines
          CustomPaint(
            size: MediaQuery.of(context).size,
            painter: ShapePainter(),
          ),
          // Content over the background
          child,
        ],
      ),
    );
  }
}

/// A painter for creating decorative shapes and lines on the background
class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Draw large red circle at the top-left corner
    paint.color = Colors.red.withOpacity(0.7);
    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.2), 100, paint);

    // Draw overlapping semi-transparent circle
    paint.color = Colors.red.withOpacity(0.3);
    canvas.drawCircle(Offset(size.width * 0.35, size.height * 0.25), 80, paint);

    // Draw curved red path at the bottom
    paint.color = Colors.red.withOpacity(0.5);
    final path = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.85,
        size.width,
        size.height,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);

    // Draw diagonal lines across the screen
    paint.color = Colors.red.withOpacity(0.15);
    paint.strokeWidth = 1.5;
    for (double i = -size.width; i < size.width * 2; i += 30) {
      canvas.drawLine(Offset(i, 0), Offset(i - size.height, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
