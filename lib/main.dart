import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';
import 'services/auth_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const BharatSocialApp());
}

class BharatSocialApp extends StatelessWidget {
  const BharatSocialApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Bharat Social',
    theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
    home: StreamBuilder(
      stream: AuthService().authStateChanges,
      builder: (context, snapshot) => snapshot.hasData ? const HomeScreen() : const AuthScreen(),
    ),
  );
}
