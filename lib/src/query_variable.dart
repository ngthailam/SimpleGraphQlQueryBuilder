class QueryVariable {
  final String name;

  final String type;

  final String schemaName;

  final String? defaultValue;

  QueryVariable({
    required this.name,
    required this.type,
    String? schemaName,
    this.defaultValue,
  }) : schemaName = schemaName ?? name;
}
