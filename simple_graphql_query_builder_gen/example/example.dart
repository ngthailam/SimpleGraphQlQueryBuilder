import 'package:simple_graphql_query_builder/simple_graphql_query_builder.dart';

part 'example.g.dart';

@queryResult
class Example {
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

  Map<String, dynamic> toQueryResult() => _ExampleToQueryResult(this);
}

@queryResult
class InnerExample {
  final bool? innerField1;

  InnerExample({this.innerField1});

  Map<String, dynamic> toQueryResult() => _InnerExampleToQueryResult(this);
}
