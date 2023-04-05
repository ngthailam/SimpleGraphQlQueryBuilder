// User should never import anything from this package
library simple_graphql_query_builder_gen;

import 'package:build/build.dart';
import 'package:simple_graphql_query_builder_gen/src/query_result_generator.dart';
import 'package:source_gen/source_gen.dart';

// 4
Builder queryResultBuilder(BuilderOptions options) =>
    SharedPartBuilder([QueryResultGenerator()], 'query_result_generator');
