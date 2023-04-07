A helper package to support file generation for [simple_graphql_query_builder](https://pub.dev/packages/simple_graphql_query_builder)

## Usage

Add dependency to your `dev_dependencies`:

```dart
dev_dependencies:
    simple_graphql_query_builder_gen: ^0.1.0
```

Annotate class with @QueryResult

```dart
@QueryResult
class User {
    @QueryResultField({name: 'username'})
    final String name;
    @QueryResultField({ignore: true})
    final int age;

    const User({required this.name, required this.age,});
}
```

Add `part file_name.g.dart` to corresponding class.

Generate class using the following command:

```
flutter pub run build_runner build --delete-conflicting-outputs
```

or

```
dart pub run build_runner build --delete-conflicting-outputs
```

## Annotation

### QueryResult

To annotate the object whose fields who what to be used for `QueryBuilder.fields`

</br>

Example usage, the 2 below generates the same result

```dart
@QueryResult
class MyClass {
    final String? name;

    const MyClass({required this.name});
}
```

```dart
@queryResult
class MyClass {
    final String? name;

    const MyClass({required this.name});
}
```

### QueryResultField

To annotate the object's individual field whose fields who what to be used for `QueryBuilder.fields`

</br>

Example usage, the 2 below generates the same result

```dart
@queryResult
class Example {
  final String? name;
  @QueryResultField(ignore: false, name: 'Test', isCustomType: true)
  final InnerExample? innerExample;
  @QueryResultField(isCustomType: true)
  final InnerExample innerExample2;

  const Example({
    this.name,
    this.innerExample,
    required this.innerExample2,
  });
}
```

Will have the folowwing result, you can use the functions to provide to `QueryBuilder` parameter `fields`

```dart
final Map<String, dynamic> exampletoQueryResult = {
  'name': null,
  'Test2': innerExampletoQueryResult,
  'innerExample2': innerExampletoQueryResult,
};

final Map<String, dynamic> innerExampletoQueryResult = {
  'innerField1': null,
};
```

#### Arguments

</br>


| Name         | Default Value | Is required             | Description                                                 |
| ------------ | ------------- | ----------------------- | ----------------------------------------------------------- |
| name         | name of field | false                   | To change the name of the field in the genrated method      |
| isCustomType | false         | if type is user created | If type is user created type, MUST mark as `true`           |
| ignore       | false         | false                   | Set to `true` to remove the field from the generated method |
