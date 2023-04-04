import 'package:simple_graphql_query_builder/src/query_builder_type.dart';
import 'package:simple_graphql_query_builder/src/query_variable.dart';

class QueryBuilder {
  /// Name of the query, can be anything you want
  final String queryName;

  /// Name of the query, should match your GraphQl schema query name
  final String name;

  /// The type of the query
  final QueryBuilderType type;

  /// Query variables
  final List<QueryVariable> variables;

  /// Query fields
  ///
  /// @key(String) param name
  /// @value(dynamic) param value
  final Map<String, dynamic> fields;

  const QueryBuilder({
    String? queryName,
    required this.name,
    required this.type,
    this.variables = const [],
    this.fields = const {},
  }) : queryName = queryName ?? name;

  factory QueryBuilder.query({
    required String name,
    List<QueryVariable>? variables,
    Map<String, dynamic>? fields,
  }) {
    return QueryBuilder(
      name: name,
      type: QueryBuilderType.query,
      variables: variables ?? const [],
      fields: fields ?? const {},
    );
  }

  factory QueryBuilder.mutation({
    required String name,
    List<QueryVariable>? variables,
    Map<String, dynamic>? fields,
  }) {
    return QueryBuilder(
      name: name,
      type: QueryBuilderType.mutation,
      variables: variables ?? const [],
      fields: fields ?? const {},
    );
  }

  String build() {
    String query = '';

    /// Append query type + title
    query += '${type.name} $queryName';

    /// Append input parameters
    query += _buildInputParams();
    query += '{';

    /// Append query scheme name
    query += ' $name';

    /// Append query schema parameters
    query += _buildSchemaParams();

    // Append fields
    query += '{';
    query += _buildFields(inputFields: fields);
    query += '}';

    query += '}';
    return query;
  }

  String _buildInputParams() {
    if (variables.isEmpty) return '';

    String result = '';
    result += '(';
    for (QueryVariable variable in variables) {
      final defaultValue =
          variable.defaultValue != null ? '= ${variable.defaultValue}' : '';
      result += '\$${variable.name}: ${variable.type} $defaultValue,';
    }
    result = result.substring(0, result.length - 1); // Remove last comma
    result += ')';
    return result;
  }

  String _buildSchemaParams() {
    if (variables.isEmpty) return '';

    String result = '';
    result += '(';
    for (QueryVariable variable in variables) {
      result += '${variable.schemaName}: \$${variable.name},';
    }
    result = result.substring(0, result.length - 1); // Remove last comma
    result += ')';
    return result;
  }

  String _buildFields({Map<String, dynamic> inputFields = const {}}) {
    if (inputFields.isEmpty) return '';

    String result = '';
    inputFields.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        result += '$key { ${_buildFields(inputFields: value)} }';
      } else {
        result += '$key\n';
      }
    });
    return result;
  }
}
