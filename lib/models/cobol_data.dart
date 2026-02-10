class SqlMapping {
  final String standardSql;
  final String db2Equivalent;
  final String logic;
  final String example;

  SqlMapping({
    required this.standardSql,
    required this.db2Equivalent,
    required this.logic,
    required this.example,
  });

  factory SqlMapping.fromJson(Map<String, dynamic> json) {
    return SqlMapping(
      standardSql: json['standard_sql'] ?? '',
      db2Equivalent: json['db2_equivalent'] ?? '',
      logic: json['logic'] ?? '',
      example: json['example'] ?? '',
    );
  }
}

class ErrorCode {
  final String code;
  final String description;
  final String cause;
  final String fix;

  ErrorCode({
    required this.code,
    required this.description,
    required this.cause,
    required this.fix,
  });

  factory ErrorCode.fromJson(Map<String, dynamic> json) {
    return ErrorCode(
      code: json['code'] ?? '',
      description: json['description'] ?? '',
      cause: json['cause'] ?? '',
      fix: json['fix'] ?? '',
    );
  }
}

class PerformanceTip {
  final String avoid;
  final String recommendation;
  final String impact;

  PerformanceTip({
    required this.avoid,
    required this.recommendation,
    required this.impact,
  });

  factory PerformanceTip.fromJson(Map<String, dynamic> json) {
    return PerformanceTip(
      avoid: json['avoid'] ?? '',
      recommendation: json['recommendation'] ?? '',
      impact: json['impact'] ?? '',
    );
  }
}

class CobolData {
  final List<SqlMapping> sqlMappings;
  final List<ErrorCode> errorCodes;
  final List<PerformanceTip> performanceTips;

  CobolData({
    required this.sqlMappings,
    required this.errorCodes,
    required this.performanceTips,
  });

  factory CobolData.fromJson(Map<String, dynamic> json) {
    return CobolData(
      sqlMappings: (json['sql_mappings'] as List?)
              ?.map((e) => SqlMapping.fromJson(e))
              .toList() ??
          [],
      errorCodes: (json['error_codes'] as List?)
              ?.map((e) => ErrorCode.fromJson(e))
              .toList() ??
          [],
      performanceTips: (json['performance_tips'] as List?)
              ?.map((e) => PerformanceTip.fromJson(e))
              .toList() ??
          [],
    );
  }
}
