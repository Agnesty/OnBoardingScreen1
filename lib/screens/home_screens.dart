import 'package:flutter/material.dart';
import 'package:on_boarding_screen1/screens/on_boarding_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "HomeScreen",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const OnBoardingScreen()));
                },
                child: const Text(
                  "<<-Back to on boarding screen",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ))
          ],
        )),
      ),
    );
  }
}
