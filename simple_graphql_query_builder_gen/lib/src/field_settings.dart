import 'package:analyzer/dart/element/element.dart';
import 'package:simple_graphql_query_builder/simple_graphql_query_builder.dart';
import 'package:source_gen/source_gen.dart';

class FieldSettings {
  final bool ignore;

  final String? name;

  FieldSettings({
    this.ignore = false,
    this.name,
  });

  factory FieldSettings.fromQueryResultField(QueryResultField field) =>
      FieldSettings(
        ignore: field.ignore,
        name: field.name,
      );

  factory FieldSettings.fromReader(ConstantReader reader) => FieldSettings(
        ignore: reader.peek('ignore')?.boolValue ?? false,
        name: reader.peek('name')?.stringValue,
      );

  factory FieldSettings.fromFieldElement(FieldElement element) {
    if (element.metadata.isEmpty) return FieldSettings();

    final checker = TypeChecker.fromRuntime(QueryResultField);
    final annotation = checker.firstAnnotationOf(element);
    final reader = ConstantReader(annotation);
    return FieldSettings.fromReader(reader);
  }
}
