import 'package:simple_graphql_query_builder/simple_graphql_query_builder.dart';

class Settings {
  final String functionName;

  Settings({required this.functionName});

  factory Settings.fromQueryResult(QueryResult result) =>
      Settings(functionName: 'toQueryResult');
}
