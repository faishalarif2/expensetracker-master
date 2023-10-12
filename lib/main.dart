import 'package:flutter/material.dart';
import 'package:expensetracker/presentation/pages/auth/login_page.dart';
import 'package:expensetracker/presentation/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'firebase_options.dart';

void main() async {
  // Memastikan Flutter telah diinisialisasi.
  WidgetsFlutterBinding.ensureInitialized();

  // Menghapus layar pembukaan dengan animasi setelah penundaan.
  await Future.delayed(const Duration(seconds: 1));
  FlutterNativeSplash.remove();

  // Inisialisasi Firebase menggunakan opsi konfigurasi.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Mendapatkan instance dari Shared Preferences.
  SharedPreferences.getInstance().then((instance) {
    String uid = '';
    if (instance.containsKey('uid')) {
      uid = instance.getString('uid') ?? '';
    }
    runApp(MyApp(hasSession: uid.isNotEmpty));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.hasSession,
  }) : super(key: key);

  final bool hasSession;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: hasSession ? const HomePage() : const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
