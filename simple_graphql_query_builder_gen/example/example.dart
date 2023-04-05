import 'package:simple_graphql_query_builder/simple_graphql_query_builder.dart';

part 'example.g.dart';

@queryResult
class Example {
  final String? name;
  final InnerExample? innerExample;

  const Example({this.name, this.innerExample});
}

@queryResult
class InnerExample {
  final bool? innerField1;

  InnerExample({this.innerField1});
}
