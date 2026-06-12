import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'constants/app_colors.dart';
import 'screens/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MelakaExplorerApp());
}

class MelakaExplorerApp extends StatelessWidget {
  const MelakaExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Melaka Explorer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
        ),

        scaffoldBackgroundColor: AppColors.bg,

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.dark,
          ),
          iconTheme: IconThemeData(
            color: AppColors.dark,
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}