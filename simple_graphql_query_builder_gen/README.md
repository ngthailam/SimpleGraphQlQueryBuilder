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
