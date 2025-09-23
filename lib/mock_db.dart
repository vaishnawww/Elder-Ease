// lib/mock_db.dart
class MockDB {
  // phone -> { "password": "...", "role": "user"|"service_provider", "name": "..." }
  static final Map<String, Map<String, String>> _users = {
    // sample accounts for quick testing:
    "9876543210": {"password": "user123", "role": "user", "name": "Test User"},
    "9998887777": {"password": "provider123", "role": "service_provider", "name": "Test Provider"},
  };

  /// Registers a new user/provider.
  /// Returns true if registration succeeded, false if phone already exists.
  static bool registerUser({
    required String phone,
    required String password,
    required String role, // "user" or "service_provider"
    String name = "",
  }) {
    if (_users.containsKey(phone)) return false;
    _users[phone] = {"password": password, "role": role, "name": name};
    return true;
  }

  /// Returns the user map or null if not found.
  static Map<String, String>? getUser(String phone) => _users[phone];
}
