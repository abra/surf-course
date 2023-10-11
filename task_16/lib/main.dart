import 'package:flutter/material.dart';

import 'ui/pages/pet_registration_page_widget.dart';
import 'ui/themes/app_theme.dart';

void main() {
  runApp(const PetHealthApp());
}

class PetHealthApp extends StatelessWidget {
  const PetHealthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: const Scaffold(
        body: Center(
          child: PetRegistrationPageWidget(),
        ),
      ),
    );
  }
}
