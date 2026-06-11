import 'package:flutter/material.dart';

/// Central colour palette for the museum app.
/// Tones follow the gold + dark-brown museum theme used in the quiz screens.
class AppColors {
  AppColors._(); // prevent instantiation

  static const Color primary = Color(0xFFD4AF37); // gold accent
  static const Color dark = Color(0xFF2C1B18); // deep brown
  static const Color bg = Color(0xFFF5F0E6); // warm cream background
  static const Color red = Color(0xFFC0392B); // error / fail
  static const Color blue = Color(0xFF1565C0); // map accent
  static const Color blueLight = Color(0xFFE3F2FD); // map container fill
}
