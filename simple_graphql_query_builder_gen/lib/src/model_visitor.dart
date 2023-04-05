import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/element/element.dart';

class ModelVisitor extends SimpleElementVisitor<void> {
  String className = '';
  final Map<String, dynamic> fields = {};

  @override
  void visitConstructorElement(ConstructorElement element) {
    final elementReturnType = element.type.returnType.toString();
    className = elementReturnType.replaceFirst('*', '');
  }

  @override
  void visitFieldElement(FieldElement element) {
    final elementType = element.type.toString();
    final visitor = ModelVisitor();
    final x = element;
    x.visitChildren(visitor);

    print('${element.name} - ${visitor.fields.length} - ${visitor.className}');

    fields[element.name] = elementType.replaceFirst('*', '');
  }
}
