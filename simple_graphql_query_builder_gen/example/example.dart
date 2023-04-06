import 'package:simple_graphql_query_builder/simple_graphql_query_builder.dart';

part 'example.g.dart';

@queryResult
class Example with _$Example {
  final String? name;
  @QueryResultField(ignore: false, name: 'Test')
  final InnerExample? innerExample;
  @QueryResultField(ignore: true)
  final InnerExample innerExample2;

  const Example({
    this.name,
    this.innerExample,
    required this.innerExample2,
  });
}

@queryResult
class InnerExample with _$InnerExample {
  final bool? innerField1;

  InnerExample({this.innerField1});
}

void abc() {
  Example.ExampletoQueryResult();
}
