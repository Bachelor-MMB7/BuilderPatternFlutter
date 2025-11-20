import 'dart:convert';
import 'package:http/http.dart' as http;

// API Client with Builder Pattern
class ApiClient {
  final String baseUrl;
  final Map<String, String> headers;
  final Duration timeout;
  final bool enableLogging;
  final http.Client httpClient;

  ApiClient._({
    required this.baseUrl,
    required this.headers,
    required this.timeout,
    required this.enableLogging,
    required this.httpClient,
  });

  Future<dynamic> get(String endpoint) async {
    final uri = Uri.parse('$baseUrl$endpoint');

    if (enableLogging) {
      print('GET: $uri');
      print('Headers: $headers');
    }

    try {
      final response = await httpClient
          .get(uri, headers: headers)
          .timeout(timeout);

      if (enableLogging) {
        print('Response: ${response.statusCode}');
      }

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw ApiException(
          'Request failed with status: ${response.statusCode}',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (enableLogging) {
        print('Error: $e');
      }
      rethrow;
    }
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    final uri = Uri.parse('$baseUrl$endpoint');

    if (enableLogging) {
      print('POST: $uri');
      print('Body: $body');
    }

    try {
      final response = await httpClient
          .post(
            uri,
            headers: {...headers, 'Content-Type': 'application/json'},
            body: jsonEncode(body),
          )
          .timeout(timeout);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(response.body);
      } else {
        throw ApiException(
          'Request failed with status: ${response.statusCode}',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (enableLogging) {
        print('Error: $e');
      }
      rethrow;
    }
  }
}

// Builder Class
class ApiClientBuilder {
  String _baseUrl = 'https://api.example.com';
  Map<String, String> _headers = {};
  Duration _timeout = Duration(seconds: 30);
  bool _enableLogging = false;
  http.Client? _httpClient;

  ApiClientBuilder setBaseUrl(String url) {
    _baseUrl = url;
    return this;
  }

  ApiClientBuilder addHeader(String key, String value) {
    _headers[key] = value;
    return this;
  }

  ApiClientBuilder setHeaders(Map<String, String> headers) {
    _headers = headers;
    return this;
  }

  ApiClientBuilder setTimeout(Duration timeout) {
    _timeout = timeout;
    return this;
  }

  ApiClientBuilder enableLogging() {
    _enableLogging = true;
    return this;
  }

  ApiClientBuilder setHttpClient(http.Client client) {
    _httpClient = client;
    return this;
  }

  ApiClientBuilder setBearerToken(String token) {
    _headers['Authorization'] = 'Bearer $token';
    return this;
  }

  ApiClientBuilder setApiKey(String apiKey) {
    _headers['X-API-Key'] = apiKey;
    return this;
  }

  ApiClient build() {
    if (!_baseUrl.startsWith('http')) {
      throw Exception('Base URL must start with http:// or https://');
    }

    return ApiClient._(
      baseUrl: _baseUrl,
      headers: _headers,
      timeout: _timeout,
      enableLogging: _enableLogging,
      httpClient: _httpClient ?? http.Client(),
    );
  }

  // Named constructor for common configurations
  static ApiClientBuilder production(String baseUrl) {
    return ApiClientBuilder()
      ..setBaseUrl(baseUrl)
      ..setTimeout(Duration(seconds: 30));
  }

  static ApiClientBuilder development(String baseUrl) {
    return ApiClientBuilder()
      ..setBaseUrl(baseUrl)
      ..setTimeout(Duration(seconds: 60))
      ..enableLogging();
  }
}

// Custom Exception
class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, {this.statusCode});

  @override
  String toString() => 'ApiException: $message (Status: $statusCode)';
}

// Usage Examples
void main() async {
  // Example 1: Simple API Client
  final simpleClient = ApiClientBuilder()
    .setBaseUrl('https://jsonplaceholder.typicode.com')
    .setTimeout(Duration(seconds: 15))
    .build();

  // Example 2: Authenticated API Client
  final authenticatedClient = ApiClientBuilder()
    .setBaseUrl('https://api.myservice.com')
    .setBearerToken('your-jwt-token-here')
    .setTimeout(Duration(seconds: 30))
    .enableLogging()
    .build();

  // Example 3: API Client with API Key
  final apiKeyClient = ApiClientBuilder()
    .setBaseUrl('https://api.openweathermap.org')
    .setApiKey('your-api-key-here')
    .addHeader('Accept', 'application/json')
    .build();

  // Example 4: Using named constructor
  final prodClient = ApiClientBuilder.production('https://api.production.com')
    .setBearerToken('prod-token')
    .build();

  final devClient = ApiClientBuilder.development('https://api.dev.com')
    .setBearerToken('dev-token')
    .build();

  // Make a request
  try {
    final data = await simpleClient.get('/posts/1');
    print('Response: $data');
  } catch (e) {
    print('Error: $e');
  }
}