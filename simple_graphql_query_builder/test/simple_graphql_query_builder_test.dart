import 'package:simple_graphql_query_builder/simple_graphql_query_builder.dart';
import 'package:simple_graphql_query_builder/src/query_builder_type.dart';
import 'package:simple_graphql_query_builder/src/query_variable.dart';

void main() {
  final query = QueryBuilder(
    queryName: 'HeroAndFriends',
    name: 'hero',
    type: QueryBuilderType.query,
    variables: [
      QueryVariable(name: 'episode', type: 'Episode!', defaultValue: 'JEDI'),
    ],
    fields: {
      'name': null,
      'friends': {
        'name': null,
      }
    },
  ).build();

  // ignore: avoid_print
  print(query);
}
