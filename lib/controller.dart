import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import 'package:psedb_app/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PSEDBController extends GetxController {
  Uri? baseUrl;
  dio.Dio? httpClient;
  SharedPreferences? sharedPreferences;

  PSEDBController() {
    _initializeSharedPreferences();
  }

  Future<void> _initializeHTTPSession() async {
    if (sharedPreferences == null || baseUrl == null) {
      await _initializeSharedPreferences();
    }

    httpClient = dio.Dio();
    if (!kIsWeb) {
      // Add cookie management
      final cookieJar = DefaultCookieJar();
      httpClient!.interceptors.add(CookieManager(cookieJar));
    }

    // Contact the main URL
    httpClient!.getUri(baseUrl!);
  }

  Future<void> _initializeSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    baseUrl = Uri.parse(sharedPreferences!.getString("api_base_url") ?? "https://psedb.reinhart1010.id");
    SharedPreferences.getInstance();
  }

  Future<PSEQuery?> getPSEInfo(String domain) async {
    try {
      Uri parsedUri = Uri.parse(domain);
      domain = parsedUri.host;
    } catch (e) {
      // Pass: Use the [domain] value as-is
    }
    List<String> reversedQuery = domain.split(".").reversed.toList();

    if (baseUrl == null) {
      await _initializeSharedPreferences();
    }
    if (httpClient == null) {
      await _initializeHTTPSession();
    }
    dio.Response response = await httpClient!.get(
      baseUrl!.resolve("data/${reversedQuery.join("/")}.json").toString(),
      options: dio.Options(
        receiveDataWhenStatusError: true,
        responseType: dio.ResponseType.plain, // Use the inbuilt JSON parser in PSEQuery
      ),
    );
    return PSEQuery(
      apiSource: baseUrl!.toString(),
      reversedQuery: reversedQuery,
      httpStatus: response.statusCode,
      rawResponse: response.data,
    );
  }
}