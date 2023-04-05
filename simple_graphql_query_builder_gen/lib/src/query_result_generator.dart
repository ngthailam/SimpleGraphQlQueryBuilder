import 'package:build/src/builder/build_step.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:simple_graphql_query_builder/simple_graphql_query_builder.dart';
import 'package:simple_graphql_query_builder_gen/src/model_visitor.dart';
import 'package:source_gen/source_gen.dart';

class QueryResultGenerator extends GeneratorForAnnotation<QueryResult> {
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

    // Write into map
    final classBuffer = StringBuffer();
    classBuffer.writeln(
      'final Map<String,dynamic> ${visitor.className}QueryResult = {',
    );

    visitor.fields.forEach((key, value) {
      classBuffer.writeln(_fieldToMapString(element: value));
    });

    classBuffer.writeln('};');
    // Final output
    return classBuffer.toString();
  }

  String _fieldToMapString({FieldElement? element}) {
    if (element == null) return '';

    print('zzll running for ${element.name} - ${element.children.length}');

    if (element.children.isEmpty) return '\'${element.name}\': null, \n';

    String result = '';
    element.children.forEach((childElement) {
      final hasChildren = childElement.children.isNotEmpty;
      if (hasChildren) {
        result += '{';
      }
      result += _fieldToMapString(element: childElement as FieldElement);
      if (hasChildren) {
        result += '},';
      }
    });

    return result;
  }
}
