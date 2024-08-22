import 'package:riverpod/riverpod.dart';
import 'package:http_client/repository.dart';

class AppProvider with ChangeNotifier {
  final HttpClientRepository _httpClientRepository;

  AppProvider({required HttpClientRepository httpClientRepository}) : _httpClientRepository = httpClientRepository;

  Future<dynamic> getData(String endpoint) async {
    return await _httpClientRepository.getData(endpoint);
  }

  Future<dynamic> sendData(String endpoint, dynamic data) async {
    return await _httpClientRepository.sendData(endpoint, data);
  }
}

Future<HttpClientRepository> getHttpClientRepository() async => HttpClientRepository();

final appProvider = Provider<AppProvider>((ref) async {
  final httpClientRepository = await getHttpClientRepository();
  return AppProvider(httpClientRepository: httpClientRepository);
});

export 'package:http_client/repository.dart' show HttpClientRepository;