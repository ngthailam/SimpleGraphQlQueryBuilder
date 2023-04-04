## Example 1:

```dart
final query = QueryBuilder(
    name: 'hero',
    type: QueryBuilderType.query,
    variables: [
        QueryVariable(name: 'episode', type: 'Episode!', defaultValue: 'JEDI'),
    ],
    fields: {
        'name': null,
        'friends': {
            'name': null,
        }
    },
).build();
```

### Result:

```dart
query hero($episode: Episode = JEDI) {
  hero(episode: $episode) {
    name
    friends {
      name
    }
  }
}
```


## Example 2:

```dart
final query = QueryBuilder(
    queryName: 'MyHeros',
    name: 'hero',
    type: QueryBuilderType.query,
    variables: [
        QueryVariable(name: 'episode', type: 'Episode!'),
    ],
    fields: {
        'name': null,
        'friends': {
            'name': null,
        }
    },
).build();
```

### Result:

```dart
query MyHeros($episode: Episode) {
  hero(episode: $episode) {
    name
    friends {
      name
    }
  }
}
```


## Example 3:

```dart
final query = QueryBuilder(
    queryName: 'MyHeros',
    name: 'hero',
    type: QueryBuilderType.query,
    variables: [
        QueryVariable(name: 'episode', type: 'Episode!', schemaName: 'myEpisode'),
    ],
    fields: {
        'name': null,
        'friends': {
            'name': null,
        }
    },
).build();
```

### Result:

```dart
query MyHeros($episode: Episode) {
  hero(myEpisode: $episode) {
    name
    friends {
      name
    }
  }
}
```

## Example 4:

```dart
final query = QueryBuilder(
    queryName: 'MyHeros',
    name: 'hero',
    type: QueryBuilderType.query,
).build();
```

### Result:

```dart
query MyHeros {
  hero
}
```


## Example 5:

```dart
final query = QueryBuilder(
    queryName: 'MyHeros',
    name: 'hero',
    type: QueryBuilderType.mutation,
    variables: [
        QueryVariable(name: 'episode', type: 'Episode!'),
    ],
    fields: {
        'name': null,
        'friends': {
            'name': null,
        }
    },
).build();
```

### Result:

```dart
mutation MyHeros($episode: Episode) {
  hero(episode: $episode) {
    name
    friends {
      name
    }
  }
}
```