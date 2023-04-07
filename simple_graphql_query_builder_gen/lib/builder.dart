// User should never import anything from this package
library simple_graphql_query_builder_gen;

import 'package:build/build.dart';
import 'package:simple_graphql_query_builder/simple_graphql_query_builder.dart';
import 'package:simple_graphql_query_builder_gen/src/query_result_generator.dart';
import 'package:simple_graphql_query_builder_gen/src/settings/settings.dart';
import 'package:source_gen/source_gen.dart';

Builder queryResultBuilder(BuilderOptions options) {
  final result = QueryResult();

  return SharedPartBuilder(
    [
      QueryResultGenerator(Settings.fromQueryResult(result)),
    ],
    'query_result_generator',
  );
}
