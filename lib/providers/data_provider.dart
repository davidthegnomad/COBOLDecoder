import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/cobol_data.dart';

final dataProvider = FutureProvider<CobolData>((ref) async {
  final jsonString = await rootBundle.loadString('assets/data.json');
  final jsonMap = json.decode(jsonString);
  return CobolData.fromJson(jsonMap);
});
