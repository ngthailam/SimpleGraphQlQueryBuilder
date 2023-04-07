import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:simple_graphql_query_builder/simple_graphql_query_builder.dart';
import 'package:simple_graphql_query_builder_gen/src/settings/field_settings.dart';
import 'package:simple_graphql_query_builder_gen/src/utils/model_visitor.dart';
import 'package:simple_graphql_query_builder_gen/src/settings/settings.dart';
import 'package:simple_graphql_query_builder_gen/src/utils/general_utils.dart';
import 'package:source_gen/source_gen.dart';

class QueryResultGenerator extends GeneratorForAnnotation<QueryResult> {
  final Settings _settings;

  QueryResultGenerator(this._settings);

  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
        'Only classes can be annotated with "QueryResult". "$element" is not a ClassElement.',
        element: element,
      );
    }
    final visitor = ModelVisitor();
    element.visitChildren(visitor);

    // Write method header
    final classBuffer = StringBuffer();

    classBuffer.writeln(
      _generatedMethodHeader(className: visitor.className, element: element),
    );
    // Open method field map
    classBuffer.writeln('{');

    // Write method contents
    visitor.fields.forEach((String key, FieldElement value) {
      final fieldSettings = FieldSettings.fromFieldElement(value);
      if (!fieldSettings.ignore) {
        final isCustomType = fieldSettings.isCustomType;
        // Write individual fields
        final fieldKey = fieldSettings.name != null ? fieldSettings.name : key;
        if (isCustomType) {
          final valueType = value.type;
          final className = valueType.toString().replaceAll('?', '');
          classBuffer.writeln(
            '\'$fieldKey\': ${_generateFunctionName(className: className)},',
          );
        } else {
          classBuffer.writeln('\'$fieldKey\': null,');
        }
      }
    });

    // Close method field map
    classBuffer.writeln('};');
    return classBuffer.toString();
  }

  String _generatedMethodHeader({
    required InterfaceElement element,
    required String className,
  }) {
    final generatedMethodType = 'Map<String,dynamic> ';
    return 'final $generatedMethodType${_generateFunctionName(className: className)}=';
  }

  String _generateFunctionName({required String className}) {
    return '${className.lowerCaseFirstLetter()}${_settings.functionName}';
  }
}
