import 'package:http/http.dart' as http;

http.Client _httpClient;

Future<http.Client> get getHttpClient async {
  _httpClient ??= http.Client();
  return _httpClient;
}