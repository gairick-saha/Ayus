import 'dart:convert';
import 'package:ayus/constants/constants.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:http/http.dart' as http;

class Api {
  final String url;

  Api({
    required this.url,
  });

  final JsonDecoder _decoder = const JsonDecoder();
  final _baseUrl = G.baseUrl + "/";
  Map<String, String> userHeaders = {};

  Future<dynamic> get() async {
    userHeaders = {
      'Content-type': 'application/json',
    };
    return http
        .get(
      Uri.parse(_baseUrl + url),
      headers: userHeaders,
    )
        .then(
      (http.Response response) {
        final String res = response.body;
        final int statusCode = response.statusCode;
        if (statusCode < 200 || statusCode > 400) {
          BotToast.showText(text: "Internal Server Error");
          throw Exception("Error while fetching data");
        }
        return _decoder.convert(res);
      },
    );
  }
}
