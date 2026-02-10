import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/data_provider.dart';
import '../models/cobol_data.dart';
import '../widgets/glass_container.dart';
import '../theme/app_theme.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final dataAsync = ref.watch(dataProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GlassContainer(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: TextField(
                    style: AppTheme.theme.textTheme.bodyLarge,
                    decoration: InputDecoration(
                      hintText: 'Search SQL or Error Codes...',
                      hintStyle: AppTheme.theme.textTheme.bodyMedium,
                      border: InputBorder.none,
                      icon: Icon(Icons.search, color: AppTheme.accentSuccess),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value.toLowerCase();
                      });
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: dataAsync.when(
                data: (data) {
                  final filteredMappings = data.sqlMappings.where((m) {
                    return m.standardSql.toLowerCase().contains(_searchQuery) ||
                        m.db2Equivalent.toLowerCase().contains(_searchQuery) ||
                        m.logic.toLowerCase().contains(_searchQuery);
                  }).toList();

                  if (filteredMappings.isEmpty) {
                    return Center(
                      child: Text(
                        'No mappings found.',
                        style: AppTheme.theme.textTheme.bodyLarge,
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredMappings.length,
                    itemBuilder: (context, index) {
                      final mapping = filteredMappings[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: _buildSplitViewCard(mapping),
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(
                    child: Text('Error: $err',
                        style: TextStyle(color: AppTheme.accentError))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSplitViewCard(SqlMapping mapping) {
    return GlassContainer(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          // Top Half: Standard SQL
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppTheme.glassBorder,
                  width: 1,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('STANDARD SQL', style: AppTheme.theme.textTheme.labelLarge?.copyWith(color: AppTheme.accentSuccess)),
                const SizedBox(height: 8),
                Text(
                  mapping.standardSql,
                  style: GoogleFonts.firaCode(
                    fontSize: 16,
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Bottom Half: z/OS Equivalent
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('z/OS EQUIVALENT', style: AppTheme.theme.textTheme.labelLarge?.copyWith(color: AppTheme.accentError)),
                const SizedBox(height: 8),
                Text(
                  mapping.db2Equivalent,
                  style: GoogleFonts.firaCode(
                    fontSize: 16,
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    mapping.logic,
                    style: AppTheme.theme.textTheme.bodyMedium,
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
