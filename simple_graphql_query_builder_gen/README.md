A helper package to support file generation for [simple_graphql_query_builder](https://pub.dev/packages/simple_graphql_query_builder)

## Usage

Annotate class with @QueryResult

```dart
@QueryResult
class User {
    final String name;

    const User({required this.name});
}
```

Add `part file_name.g.dart` to corresponding class.

Generate class using the following command:

```
flutter pub run build_runner build --delete-conflicting-outputs
```