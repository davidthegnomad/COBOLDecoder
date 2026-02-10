import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'theme/app_theme.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const ProviderScope(child: CobolDecoderApp()));
}

class CobolDecoderApp extends StatelessWidget {
  const CobolDecoderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COBOL Decoder',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const MainScreen(),
    );
  }
}
