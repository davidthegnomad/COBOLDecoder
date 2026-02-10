import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/data_provider.dart';
import '../models/cobol_data.dart';
import '../widgets/glass_container.dart';
import '../theme/app_theme.dart';

class ErrorDecoderScreen extends ConsumerStatefulWidget {
  const ErrorDecoderScreen({super.key});

  @override
  ConsumerState<ErrorDecoderScreen> createState() => _ErrorDecoderScreenState();
}

class _ErrorDecoderScreenState extends ConsumerState<ErrorDecoderScreen> {
  String _codeQuery = '';
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dataAsync = ref.watch(dataProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'ERROR DECODER',
                style: AppTheme.theme.textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              GlassContainer(
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.numberWithOptions(signed: true),
                  style: GoogleFonts.firaCode(
                    fontSize: 24,
                    color: AppTheme.accentError,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: '-911',
                    hintStyle: GoogleFonts.firaCode(
                      fontSize: 24,
                      color: AppTheme.textSecondary.withOpacity(0.3),
                    ),
                    border: InputBorder.none,
                    helperText: 'Enter 3 or 4 digit SQLCODE',
                    helperStyle: AppTheme.theme.textTheme.bodyMedium,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _codeQuery = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: dataAsync.when(
                  data: (data) {
                    if (_codeQuery.isEmpty) {
                      return Center(
                        child: Text(
                          'Waiting for input...',
                          style: AppTheme.theme.textTheme.bodyMedium,
                        ),
                      );
                    }

                    final match = data.errorCodes.firstWhere(
                      (e) => e.code == _codeQuery || e.code == _codeQuery.padLeft(4, '0'),
                      orElse: () => ErrorCode(code: '', description: '', cause: '', fix: ''),
                    );

                    if (match.code.isEmpty) {
                       // Try fuzzy match if partial
                       final partials = data.errorCodes.where((e) => e.code.contains(_codeQuery)).toList();
                       if (partials.isNotEmpty && _codeQuery.length >= 2) {
                         return ListView.builder(
                           itemCount: partials.length,
                           itemBuilder: (context, index) => _buildErrorCard(partials[index]),
                         );
                       }
                       return Center(
                        child: Text(
                          'Code not found.',
                          style: AppTheme.theme.textTheme.bodyLarge?.copyWith(color: AppTheme.accentError),
                        ),
                      );
                    }

                    return SingleChildScrollView(child: _buildErrorCard(match, isDetailed: true));
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, stack) => Center(child: Text('Error: $err')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorCard(ErrorCode error, {bool isDetailed = false}) {
    return GlassContainer(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                error.code,
                style: GoogleFonts.firaCode(
                  fontSize: 32,
                  color: AppTheme.accentError,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.warning_amber_rounded, color: AppTheme.accentError, size: 32),
            ],
          ),
          const Divider(color: AppTheme.glassBorder),
          const SizedBox(height: 8),
          Text(
            error.description,
            style: AppTheme.theme.textTheme.displaySmall?.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 16),
          _buildSection('PRIMARY CAUSE', error.cause),
          const SizedBox(height: 16),
          _buildSection('SUGGESTED FIX', error.fix, isFix: true),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String content, {bool isFix = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTheme.theme.textTheme.labelLarge?.copyWith(
            color: isFix ? AppTheme.accentSuccess : AppTheme.textSecondary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          content,
          style: AppTheme.theme.textTheme.bodyLarge?.copyWith(
            color: isFix ? AppTheme.accentSuccess : AppTheme.textPrimary,
          ),
        ),
      ],
    );
  }
}
