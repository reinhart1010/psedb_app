// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PSEQuery _$PSEQueryFromJson(Map<String, dynamic> json) => PSEQuery(
      apiSource: json['apiSource'] as String,
      reversedQuery: (json['reversedQuery'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      httpStatus: (json['httpStatus'] as num).toInt(),
      rawResponse: json['rawResponse'] as String,
      parsedResponse: (json['parsedResponse'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            int.parse(k), PSEQueryResult.fromJson(e as Map<String, dynamic>)),
      ),
      xid: json['xid'] as String?,
    );

Map<String, dynamic> _$PSEQueryToJson(PSEQuery instance) => <String, dynamic>{
      'xid': instance.xid,
      'apiSource': instance.apiSource,
      'reversedQuery': instance.reversedQuery,
      'httpStatus': instance.httpStatus,
      'rawResponse': instance.rawResponse,
      'parsedResponse':
          instance.parsedResponse?.map((k, e) => MapEntry(k.toString(), e)),
    };

PSEQueryResult _$PSEQueryResultFromJson(Map<String, dynamic> json) =>
    PSEQueryResult(
      operatorName: json['operatorName'] as String,
      operatorSector: json['operatorSector'] as String,
      registrationDate: json['registrationDate'] as String,
      registrationID: json['registrationID'] as String,
      registrationStatus: json['registrationStatus'] as String,
      systemName: json['systemName'] as String,
      systemUrl: json['systemUrl'] as String,
    );

Map<String, dynamic> _$PSEQueryResultToJson(PSEQueryResult instance) =>
    <String, dynamic>{
      'registrationStatus': instance.registrationStatus,
      'systemName': instance.systemName,
      'systemUrl': instance.systemUrl,
      'operatorSector': instance.operatorSector,
      'operatorName': instance.operatorName,
      'registrationDate': instance.registrationDate,
      'registrationID': instance.registrationID,
    };
