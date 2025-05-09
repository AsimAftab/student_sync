class AppConfig {
  final String baseUrl;

  // Private constructor to prevent external instantiation
  AppConfig._internal({required this.baseUrl});

  // Static instance of AppConfig
  static final AppConfig _instance = AppConfig._internal(baseUrl: 'http://localhost:8080');  // Set your base URL here

  // Factory constructor to return the instance
  factory AppConfig() => _instance;
}
