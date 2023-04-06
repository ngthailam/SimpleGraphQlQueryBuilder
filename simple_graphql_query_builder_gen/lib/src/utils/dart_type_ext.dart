import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:collection/collection.dart';

extension DartTypeExtension on DartType {
  bool get isNullableType =>
      isDynamic || nullabilitySuffix == NullabilitySuffix.question;

  /// Returns all of the [DartType] types that `this` implements, mixes-in, and
  /// extends, starting with `this` itself.
  Iterable<DartType> get typeImplementations sync* {
    yield this;

    final myType = this;

    if (myType is InterfaceType) {
      yield* myType.interfaces.expand((e) => e.typeImplementations);
      yield* myType.mixins.expand((e) => e.typeImplementations);

      if (myType.superclass != null) {
        yield* myType.superclass!.typeImplementations;
      }
    }
  }

  MethodElement? getMethod(String functionName) => this
      .typeImplementations
      .map((dt) => dt is InterfaceType ? dt.getMethod(functionName) : null)
      .firstWhereOrNull((me) => me != null);
}
