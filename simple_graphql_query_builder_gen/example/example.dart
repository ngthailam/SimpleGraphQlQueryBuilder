import 'package:simple_graphql_query_builder/simple_graphql_query_builder.dart';

part 'example.g.dart';

@queryResult
class Example {
  final String? name;
  final int? age;
  final InnerExample? innerExample;

  const Example({this.name, this.age, this.innerExample});
}

// @queryResult
class InnerExample {
  final bool? inner1;
  final String? inner2;

  InnerExample({this.inner1, this.inner2});
}
