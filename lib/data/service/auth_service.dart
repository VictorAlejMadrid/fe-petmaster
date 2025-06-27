import 'package:dio/dio.dart';
import 'package:fe_petmaster/data/utils/constants.dart';
import 'package:fe_petmaster/data/utils/session_data.dart';

abstract interface class AuthServiceImpl {
  Future<void> signInWithRegistrationAndPassword(
    String registrationNumber,
    String password,
  );
  Future<void> signInFirstAccess(String registrationNumber, String password);
  void signOut();
}

class AuthService implements AuthServiceImpl {
  AuthService({required SessionData sessionData}) : _sessionData = sessionData {
    _configService();
  }
  late final Dio _client;
  final SessionData _sessionData;

  void _configService() {
    _client = Dio(
      BaseOptions(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        baseUrl: "${Constants.apiBaseUrl}/usuarios",
        connectTimeout: const Duration(milliseconds: Constants.defaultTimeout),
        receiveTimeout: const Duration(milliseconds: Constants.defaultTimeout),
      ),
    );

    _client.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
  }

  @override
  Future<dynamic> signInFirstAccess(
    String registrationNumber,
    String password,
  ) async {
    final data = {
      "registrationNumber": registrationNumber,
      "password": password,
    };

    final response = await _client.put("/primeiroAcesso", data: data);

    return response.data;
  }

  @override
  Future<dynamic> signInWithRegistrationAndPassword(
    String registrationNumber,
    String password,
  ) async {
    try {
      final data = {
        "registrationNumber": registrationNumber,
        "password": password,
      };

      final response = await _client.put("/login", data: data);

      if (response.data is DioException) { 
        return response.data;
      } else {
        _sessionData.name = response.data["data"]["username"];
      }

      return response.data;
    } catch (e) {
      return e;
    }
  }

  @override
  void signOut() {
    _sessionData.registrationNumber = "";
  }
}
