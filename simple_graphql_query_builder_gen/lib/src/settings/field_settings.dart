import 'package:analyzer/dart/element/element.dart';
import 'package:simple_graphql_query_builder/simple_graphql_query_builder.dart';
import 'package:source_gen/source_gen.dart';

class FieldSettings {
  final bool ignore;

  final String? name;

  final bool isCustomType;

  FieldSettings({
    this.ignore = false,
    this.name,
    this.isCustomType = false,
  });

  factory FieldSettings.fromQueryResultField(QueryResultField field) =>
      FieldSettings(
        ignore: field.ignore,
        name: field.name,
        isCustomType: field.isCustomType,
      );

  factory FieldSettings.fromReader(ConstantReader reader) => FieldSettings(
        ignore: reader.peek('ignore')?.boolValue ?? false,
        name: reader.peek('name')?.stringValue,
        isCustomType: reader.peek('isCustomType')?.boolValue ?? false,
      );

  factory FieldSettings.fromFieldElement(FieldElement element) {
    if (element.metadata.isEmpty) return FieldSettings();

    final checker = TypeChecker.fromRuntime(QueryResultField);
    final annotation = checker.firstAnnotationOf(element);
    final reader = ConstantReader(annotation);
    return FieldSettings.fromReader(reader);
  }
}
