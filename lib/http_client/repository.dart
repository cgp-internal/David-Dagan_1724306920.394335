import 'package:http/http.dart' as http;
import 'package:http_client/http_client.dart';

abstract class HttpClientRepository {
  Future<dynamic> getData(String endpoint);
  Future<dynamic> sendData(String endpoint, dynamic data);
}

class _HttpClientRepositoryImpl implements HttpClientRepository {
  final http.Client _httpClient;

  _HttpClientRepositoryImpl({required http.Client httpClient}) : _httpClient = httpClient;

  @override
  Future<dynamic> getData(String endpoint) async {
    final response = await _httpClient.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Future<dynamic> sendData(String endpoint, dynamic data) async {
    final response = await _httpClient.post(Uri.parse(endpoint), body: data);
    if (response.statusCode == 201) {
      return response.body;
    } else {
      throw Exception('Failed to send data');
    }
  }
}

Future<HttpClientRepository> getHttpClientRepository() async {
  final httpClient = await getHttpClient();
  return _HttpClientRepositoryImpl(httpClient: httpClient);
}

typedef HttpClientRepositoryFactory = Future<HttpClientRepository> Function(); 
HttpClientRepositoryFactory getHttpClientRepository;