import 'package:meta/meta_meta.dart';

@Target({TargetKind.classType})
class QueryResult {
  const QueryResult();
}

const queryResult = QueryResult();

@Target({TargetKind.field})
class QueryResultField {
  // Custom name for query result field
  final String? name;
  // Should this field be omitted from the query fields
  final bool ignore;

  const QueryResultField({
    this.name,
    this.ignore = false,
  });
}
