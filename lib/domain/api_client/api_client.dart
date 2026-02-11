import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:io';
import 'package:flutter/foundation.dart';

const _pauseOnJsonForDebugger = true;

enum ApiClientExceptionType {
  network,
  auth,
  other,
}

class ApiClientException implements Exception {
  final ApiClientExceptionType type;

  ApiClientException(this.type);
}

class ApiClient {
  final _client = HttpClient();
  static const _host = 'https://api.themoviedb.org/3';
  static const _imageUrl = 'https://image.tmdb.org/t/p/w500';
  static const _apiKey = '0a2a46b5593a0978cc8e87ba34037430';

  Future<String> auth({
    required String username,
    required String password,
  }) async {
    final token = await _makeToken();
    final validToken = await _validateUser(
      username: username,
      password: password,
      requestToken: token,
    );
    final sessionId = await _makeSession(requestToken: validToken);
    return sessionId;
  }

  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.parse('$_host$path');
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  Future<String> _makeToken() async {
    final url = _makeUri(
      '/authentication/token/new',
      <String, dynamic>{'api_key': _apiKey},
    );
    try {
      final request = await _client.getUrl(url);
      final response = await request.close();
      final json = await response.readJson('token/new');
      final token = json['request_token'] as String;
      return token;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    }
  }

  Future<String> _validateUser({
    required String username,
    required String password,
    required String requestToken,
  }) async {
    final url = _makeUri(
      '/authentication/token/validate_with_login',
      <String, dynamic>{'api_key': _apiKey},
    );
    final parameters = <String, dynamic>{
      'username': username,
      'password': password,
      'request_token': requestToken,
    };
    final request = await _client.postUrl(url);

    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));
    final response = await request.close();
    final json = await response.readJson('validate_with_login');

    final token = json['request_token'] as String;
    return token;
  }

  Future<String> _makeSession({
    required String requestToken,
  }) async {
    final url = _makeUri(
      '/authentication/session/new',
      <String, dynamic>{'api_key': _apiKey},
    );
    final parameters = <String, dynamic>{
      'request_token': requestToken,
    };
    final request = await _client.postUrl(url);

    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));
    final response = await request.close();
    final json = await response.readJson('session/new');

    final sessionId = json['session_id'] as String;
    return sessionId;
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<Map<String, dynamic>> readJson(String label) async {
    final body = await transform(utf8.decoder).join();
    final decodedJson = json.decode(body) as Map<String, dynamic>;
    final prettyJson = const JsonEncoder.withIndent('  ').convert(decodedJson);
    developer.log('statusCode=$statusCode', name: 'ApiClient/$label');
    developer.log('body=$body', name: 'ApiClient/$label');
    developer.log('json=$prettyJson', name: 'ApiClient/$label');
    if (kDebugMode && _pauseOnJsonForDebugger) {
      developer.debugger(
        message: 'Inspect body/decodedJson/prettyJson in Variables',
      );
    }
    return decodedJson;
  }
}
