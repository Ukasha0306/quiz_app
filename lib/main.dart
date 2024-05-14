import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/provider/view_provider.dart';
import 'package:quiz_app/utils/color.dart';
import 'package:quiz_app/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ViewProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quiz App',
        theme: ThemeData(
          textTheme: GoogleFonts.lexendTextTheme(),
          scaffoldBackgroundColor: whiteColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
