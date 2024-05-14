import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/view_provider.dart';
import '../utils/color.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            height: size.height * 0.4,
            fit: BoxFit.cover,
            image: const AssetImage(
              'assets/logo.jpg',
            ),
          ),
          SizedBox(
            height: size.height * 0.15,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: blackColor,
                foregroundColor: whiteColor,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
                Provider.of<ViewProvider>(context, listen: false).startTimer(context);
              },
              child: const Text(
                'Start Quiz',
                style: TextStyle(fontWeight: FontWeight.w600),
              )),
        ],
      ),
    );
  }
}
