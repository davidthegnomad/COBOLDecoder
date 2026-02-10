import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/app_theme.dart';
import 'home_screen.dart';
import 'error_decoder_screen.dart';
import 'performance_quest_screen.dart';
import '../widgets/scanline_effect.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ErrorDecoderScreen(),
    const PerformanceQuestScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              color: AppTheme.background,
              image: DecorationImage(
                image: NetworkImage("https://www.transparenttextures.com/patterns/carbon-fibre.png"), // Subtle texture if needed, but solid color is fine
                fit: BoxFit.cover,
                opacity: 0.1,
              ),
            ),
          ),
          
          // Content
          IndexedStack(
            index: _currentIndex,
            children: _screens,
          ),

          // Scanlines Overlay
          const Positioned.fill(
            child: IgnorePointer(
              child: ScanlineEffect(child: SizedBox.expand()),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppTheme.background.withOpacity(0.9),
          border: const Border(
            top: BorderSide(color: AppTheme.accentSuccess, width: 2),
          ),
          boxShadow: [
            BoxShadow(
              color: AppTheme.accentSuccess.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: AppTheme.accentSuccess,
          unselectedItemColor: AppTheme.textSecondary,
          selectedLabelStyle: AppTheme.theme.textTheme.labelLarge,
          unselectedLabelStyle: AppTheme.theme.textTheme.bodyMedium,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.code),
              label: 'DECODER HUB',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bug_report),
              label: 'ERROR LOG',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shield), // Quest/Shield icon
              label: 'QUEST LOG',
            ),
          ],
        ),
      ),
    );
  }
}
