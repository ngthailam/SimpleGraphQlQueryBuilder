import 'package:meta/meta_meta.dart';

@Target({TargetKind.classType})
class QueryResult {
  //
}

@Target({TargetKind.field})
class QueryResultField {
  const QueryResultField({
    this.ignore = false,
  });

  final bool ignore;
}
