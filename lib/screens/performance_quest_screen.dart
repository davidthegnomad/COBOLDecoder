import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/data_provider.dart';
import '../models/cobol_data.dart';
import '../widgets/glass_container.dart';
import '../theme/app_theme.dart';

class PerformanceQuestScreen extends ConsumerWidget {
  const PerformanceQuestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsync = ref.watch(dataProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'PERFORMANCE QUEST',
                style: AppTheme.theme.textTheme.displayMedium,
              ),
            ),
            Expanded(
              child: dataAsync.when(
                data: (data) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: data.performanceTips.length,
                    itemBuilder: (context, index) {
                      final tip = data.performanceTips[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: _buildQuestCard(tip, index),
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(child: Text('Error: $err')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestCard(PerformanceTip tip, int index) {
    return GlassContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.accentSuccess.withOpacity(0.2),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppTheme.accentSuccess),
                ),
                child: Text(
                  'Q${index + 1}',
                  style: GoogleFonts.firaCode(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.accentSuccess,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Quest: Optimization',
                  style: AppTheme.theme.textTheme.labelLarge,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'AVOID: ${tip.avoid}',
            style: AppTheme.theme.textTheme.bodyLarge?.copyWith(
              color: AppTheme.accentError,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.check_circle_outline, color: AppTheme.accentSuccess, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  tip.recommendation,
                  style: AppTheme.theme.textTheme.bodyLarge,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppTheme.accentSuccess.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Icon(Icons.bolt, color: Colors.yellow, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    tip.impact,
                    style: AppTheme.theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.yellow.shade100,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
