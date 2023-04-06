import 'package:analyzer/dart/element/type.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:simple_graphql_query_builder/simple_graphql_query_builder.dart';
import 'package:simple_graphql_query_builder_gen/src/field_settings.dart';
import 'package:simple_graphql_query_builder_gen/src/model_visitor.dart';
import 'package:simple_graphql_query_builder_gen/src/settings.dart';
import 'package:simple_graphql_query_builder_gen/src/utils/dart_type_ext.dart';
import 'package:simple_graphql_query_builder_gen/src/utils/general_utils.dart';
import 'package:source_gen/source_gen.dart';

const String instanceName = 'instance';

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

    classBuffer.write('class _\$${visitor.className} {');
    classBuffer.writeln(
        _generatedMethodHeader(className: visitor.className, element: element));

    // // Write method contents
    // visitor.fields.forEach((key, value) {
    //   final targetType = value.type;
    //   final fieldSettings = FieldSettings.fromFieldElement(value);

    //   if (!fieldSettings.ignore) {
    //     final interfaceType = targetType as InterfaceType;
    //     final toQueryResultMethod =
    //         targetType.getMethod(_settings.functionName);

    //     String fieldValue = '';
    //     if (toQueryResultMethod != null) {
    //       final elvisOperator = interfaceType.isNullableType ? '?' : '';
    //       fieldValue =
    //           '$instanceName.$key$elvisOperator.${_settings.functionName}()';
    //     } else {
    //       fieldValue = '$instanceName.$key';
    //     }

    //     final fieldKey = fieldSettings.name != null ? fieldSettings.name : key;
    //     classBuffer.writeln('\'$fieldKey\': $fieldValue,');
    //   }
    // });

    // // Close method
    classBuffer.writeln('};');

    // Close class
    classBuffer.writeln('}');
    return classBuffer.toString();
  }

  String _generatedMethodHeader({
    required InterfaceElement element,
    required String className,
  }) {
    final generatedMethodType = 'Map<String,dynamic> ';
    final generatedMethodName =
        '${className.lowerCaseFirstLetter()}${_settings.functionName}';
    return 'static $generatedMethodType $generatedMethodName() => {';
  }
}
