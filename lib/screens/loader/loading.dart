import 'package:flutter/material.dart';
import 'dart:async';
import 'package:brojac_glasova/spacing.dart';
import 'package:brojac_glasova/theme.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var hasSkipped = false;
    // Timer(const Duration(seconds: 3), () {
    //   String? currentRoute = ModalRoute.of(context)?.settings.name;
    //   if (!hasSkipped && currentRoute == '/loading') {
    //     Navigator.pushNamed(context, '/landing');
    //   }
    // });
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/landing');
      },
      child: Scaffold(
        backgroundColor: CustomTheme.darkerBlue,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/text.png'),
            CircularProgressIndicator(
              color: CustomTheme.white,
              strokeWidth: 2,
            ),
            VerticalSpacing.L(),
            Image.asset('images/logo.png'),
            VerticalSpacing.XXL(),
            Text(
              'design/idea/coding:\nDavid Kalabic',
              style: CustomTheme.titleTextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
