import 'dart:async';
import 'dart:convert';
import 'dart:io';

enum ApiClientExceptionType {
  network,
  auth,
  other,
}

class ApiClientAuthResult {
  final String? sessionId;
  final ApiClientExceptionType? errorType;
  final String? errorMessage;

  bool get isSuccess => sessionId != null && sessionId!.isNotEmpty;

  const ApiClientAuthResult.success(this.sessionId)
      : errorType = null,
        errorMessage = null;
  const ApiClientAuthResult.failure(this.errorType, {this.errorMessage})
      : sessionId = null;
}

class _ApiStepResult<T> {
  final T? value;
  final ApiClientExceptionType? errorType;
  final String? errorMessage;

  bool get isSuccess => value != null;

  const _ApiStepResult.success(this.value)
      : errorType = null,
        errorMessage = null;
  const _ApiStepResult.failure(this.errorType, {this.errorMessage})
      : value = null;
}

class ApiClient {
  final _client = HttpClient();
  static const _host = 'https://api.themoviedb.org/3';
  static const _apiKey = '0a2a46b5593a0978cc8e87ba34037430';
  static const _requestTimeout = Duration(seconds: 15);

  Future<ApiClientAuthResult> auth({
    required String username,
    required String password,
  }) async {
    final tokenResult = await _makeToken();
    if (!tokenResult.isSuccess) {
      return ApiClientAuthResult.failure(
        tokenResult.errorType,
        errorMessage: tokenResult.errorMessage,
      );
    }
    final validTokenResult = await _validateUser(
      username: username,
      password: password,
      requestToken: tokenResult.value!,
    );
    if (!validTokenResult.isSuccess) {
      return ApiClientAuthResult.failure(
        validTokenResult.errorType,
        errorMessage: validTokenResult.errorMessage,
      );
    }
    final sessionResult = await _makeSession(requestToken: validTokenResult.value!);
    if (!sessionResult.isSuccess) {
      return ApiClientAuthResult.failure(
        sessionResult.errorType,
        errorMessage: sessionResult.errorMessage,
      );
    }
    return ApiClientAuthResult.success(sessionResult.value!);
  }

  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.parse('$_host$path');
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  Future<_ApiStepResult<String>> _makeToken() async {
    final url = _makeUri(
      '/authentication/token/new',
      <String, dynamic>{'api_key': _apiKey},
    );
    try {
      final request = await _client.getUrl(url).timeout(_requestTimeout);
      final response = await request.close().timeout(_requestTimeout);
      final responseMap = await response.readMap();
      if (response.statusCode < 200 || response.statusCode >= 300) {
        return _ApiStepResult.failure(
          ApiClientExceptionType.other,
          errorMessage: _extractTmdbError(responseMap),
        );
      }
      final token = _readRequiredStringOrNull(
        responseMap,
        'request_token',
      );
      if (token == null) {
        return _ApiStepResult.failure(
          ApiClientExceptionType.other,
          errorMessage: _extractTmdbError(responseMap),
        );
      }
      return _ApiStepResult.success(token);
    } on SocketException {
      return const _ApiStepResult.failure(ApiClientExceptionType.network);
    } on HandshakeException {
      return const _ApiStepResult.failure(ApiClientExceptionType.network);
    } on HttpException {
      return const _ApiStepResult.failure(ApiClientExceptionType.network);
    } on TimeoutException {
      return const _ApiStepResult.failure(ApiClientExceptionType.network);
    } on FormatException {
      return const _ApiStepResult.failure(ApiClientExceptionType.other);
    } catch (_) {
      return const _ApiStepResult.failure(ApiClientExceptionType.other);
    }
  }

  Future<_ApiStepResult<String>> _validateUser({
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
    final request = await _client.postUrl(url).timeout(_requestTimeout);

    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));
    try {
      final response = await request.close().timeout(_requestTimeout);
      final responseMap = await response.readMap();
      if (response.statusCode == 401) {
        return _ApiStepResult.failure(
          ApiClientExceptionType.auth,
          errorMessage: _extractTmdbError(responseMap),
        );
      }
      if (response.statusCode < 200 || response.statusCode >= 300) {
        return _ApiStepResult.failure(
          ApiClientExceptionType.other,
          errorMessage: _extractTmdbError(responseMap),
        );
      }
      final token = _readRequiredStringOrNull(
        responseMap,
        'request_token',
      );
      if (token == null) {
        return _ApiStepResult.failure(
          ApiClientExceptionType.auth,
          errorMessage: _extractTmdbError(responseMap),
        );
      }
      return _ApiStepResult.success(token);
    } on SocketException {
      return const _ApiStepResult.failure(ApiClientExceptionType.network);
    } on HandshakeException {
      return const _ApiStepResult.failure(ApiClientExceptionType.network);
    } on HttpException {
      return const _ApiStepResult.failure(ApiClientExceptionType.network);
    } on TimeoutException {
      return const _ApiStepResult.failure(ApiClientExceptionType.network);
    } on FormatException {
      return const _ApiStepResult.failure(ApiClientExceptionType.other);
    } catch (_) {
      return const _ApiStepResult.failure(ApiClientExceptionType.other);
    }
  }

  Future<_ApiStepResult<String>> _makeSession({
    required String requestToken,
  }) async {
    final url = _makeUri(
      '/authentication/session/new',
      <String, dynamic>{'api_key': _apiKey},
    );
    final parameters = <String, dynamic>{
      'request_token': requestToken,
    };
    final request = await _client.postUrl(url).timeout(_requestTimeout);

    request.headers.contentType = ContentType.json;
    request.write(jsonEncode(parameters));
    try {
      final response = await request.close().timeout(_requestTimeout);
      final responseMap = await response.readMap();
      if (response.statusCode < 200 || response.statusCode >= 300) {
        return _ApiStepResult.failure(
          ApiClientExceptionType.other,
          errorMessage: _extractTmdbError(responseMap),
        );
      }
      final sessionId = _readRequiredStringOrNull(
        responseMap,
        'session_id',
      );
      if (sessionId == null) {
        return _ApiStepResult.failure(
          ApiClientExceptionType.other,
          errorMessage: _extractTmdbError(responseMap),
        );
      }
      return _ApiStepResult.success(sessionId);
    } on SocketException {
      return const _ApiStepResult.failure(ApiClientExceptionType.network);
    } on HandshakeException {
      return const _ApiStepResult.failure(ApiClientExceptionType.network);
    } on HttpException {
      return const _ApiStepResult.failure(ApiClientExceptionType.network);
    } on TimeoutException {
      return const _ApiStepResult.failure(ApiClientExceptionType.network);
    } on FormatException {
      return const _ApiStepResult.failure(ApiClientExceptionType.other);
    } catch (_) {
      return const _ApiStepResult.failure(ApiClientExceptionType.other);
    }
  }

  String? _readRequiredStringOrNull(
    Map<String, dynamic> json,
    String key,
  ) {
    final value = json[key];
    if (value is String && value.isNotEmpty) {
      return value;
    }
    return null;
  }

  String? _extractTmdbError(Map<String, dynamic> json) {
    final statusMessage = json['status_message'];
    final statusCode = json['status_code'];
    if (statusMessage is String && statusMessage.isNotEmpty) {
      if (statusCode is int) {
        return '$statusMessage (code: $statusCode)';
      }
      return statusMessage;
    }
    return null;
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<Map<String, dynamic>> readMap() async {
    final body = await transform(utf8.decoder).join();
    final decoded = json.decode(body);
    if (decoded is! Map<String, dynamic>) {
      throw const FormatException('Invalid API response');
    }
    return decoded;
  }
}
