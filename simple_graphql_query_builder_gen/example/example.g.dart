// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// QueryResultGenerator
// **************************************************************************

Map<String, dynamic> _ExampleToQueryResult(Example instance) => {
      'name': instance.name,
      'Test': instance.innerExample?.toQueryResult(),
    };

Map<String, dynamic> _InnerExampleToQueryResult(InnerExample instance) => {
      'innerField1': instance.innerField1,
    };
