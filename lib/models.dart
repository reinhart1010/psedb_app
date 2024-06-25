import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:xid/xid.dart';

part 'models.g.dart';

/// {
///   "5935": {
///     "registrationStatus": "DOMESTIK-TERDAFTAR",
///     "systemName": "REINHART1010.ID",
///     "systemUrl": "reinhart1010.id",
///     "operatorSector": "Sektor Teknologi Informasi dan Komunikasi",
///     "operatorName": "REINHART PREVIANO KOENTJORO",
///     "registrationDate": "2022-07-16",
///     "registrationID": "https://pse.kominfo.go.id/tdpse-detail/5935"
///   }
/// }
@JsonSerializable()
class PSEQuery {
  late String xid;
  String apiSource;
  List<String> reversedQuery;
  int? httpStatus;
  String rawResponse;
  Map<int, PSEQueryResult>? parsedResponse;

  PSEQuery({
    required this.apiSource,
    required this.reversedQuery,
    required this.httpStatus,
    required this.rawResponse,
    this.parsedResponse,
    String? xid,
  }) {
    this.xid = (xid ?? Xid()).toString();

    if (parsedResponse == null) parseRawResponse();
  }

  void parseRawResponse() {
    try {
      dynamic parsedJson = jsonDecode(rawResponse);
      if (parsedJson.runtimeType == Map<String, dynamic>) {
        parsedResponse = <int, PSEQueryResult>{};
        (parsedJson as Map<String, dynamic>).forEach((regNumber, data) {
          parsedResponse![int.parse(regNumber)] = PSEQueryResult.fromJson(data);
        });
      }
    } catch (_) {}
  }

  factory PSEQuery.fromJson(Map<String, dynamic> json) => _$PSEQueryFromJson(json);

  Map<String, dynamic> toJson() => _$PSEQueryToJson(this);
}

@JsonSerializable()
class PSEQueryResult{
  String registrationStatus;
  String systemName;
  String systemUrl;
  String operatorSector;
  String operatorName;
  String registrationDate;
  String registrationID;

  PSEQueryResult({
    required this.operatorName,
    required this.operatorSector,
    required this.registrationDate,
    required this.registrationID,
    required this.registrationStatus,
    required this.systemName,
    required this.systemUrl,
  });

  factory PSEQueryResult.fromJson(Map<String, dynamic> json) => _$PSEQueryResultFromJson(json);
  
  Map<String, dynamic> toJson() => _$PSEQueryResultToJson(this);
}
