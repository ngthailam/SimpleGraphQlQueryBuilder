A Simple Query builder for GraphQl API calls.

## Features

- A simple GraphQl Query builder

## Usage

### Sample usage

```dart
final query = QueryBuilder(
    queryName: 'HeroAndFriends',
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

Will result in the following query

```
query HeroNameAndFriends($episode: Episode = JEDI) {
  hero(episode: $episode) {
    name
    friends {
      name
    }
  }
}
```

### Usage with graphql package

`query` is derived from `QueryBuilder` from the example above

```dart
final QueryResult result = await client.query(query);
```

## Arguments

### QueryVariable

| Name | In Example Query         | Requirement | Note |
| ---- | ------------------------ | ----------- | ---- |
| name | $episode    | Must match GraphQl schema | |
| type | Episode    | Must match GraphQl schema | If required, use Episode! |
| schemaName | episode    | Must match GraphQl schema | Default value is derived from param `name` |
| defaultValue | JEDI    | None | If empty, nothing happens |

### QueryBuilderType

| Name     | Desc                     |
| -------- | ------------------------ |
| query    | Use for `query` calls    |
| mutation | Use for `mutation` calls |

### QueryBuilder

| Name      | In Example Query                                   | Requirement                   | Note                                          |
| --------- | -------------------------------------------------- | ----------------------------- | --------------------------------------------- |
| queryName | HeroNameAndFriends                                 | Can be anything you want      | Default value will be taken from param `name` |
| name      | hero                                               | Must match the GraphQl        |                                               |
| type      | query                                              | Must be type QueryBuilderType | Refer to QueryBuilderType                     |
| variables | ($episode: Episode = JEDI) and (episode: $episode) | Must be type QueryVariable    | Refer to QueryVariable                        |
| fields    | name friends { name }                              | Must be type QueryBuilderType | Refer to QueryBuilderType                     |
