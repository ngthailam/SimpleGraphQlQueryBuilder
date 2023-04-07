import 'package:simple_graphql_query_builder/simple_graphql_query_builder.dart';

part 'example.g.dart';

@queryResult
class Example {
  final String? name;
  @QueryResultField(ignore: false, name: 'Test2', isCustomType: true)
  final InnerExample? innerExample;
  @QueryResultField(isCustomType: true)
  final InnerExample innerExample2;

  const Example({
    this.name,
    this.innerExample,
    required this.innerExample2,
  });
}

@queryResult
class InnerExample {
  final bool? innerField1;

  InnerExample({this.innerField1});
}
