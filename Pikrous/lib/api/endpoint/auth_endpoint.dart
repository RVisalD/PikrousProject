class AuthEndPoint {
  static String register = '/register';
  static String login = "/login";
  static String deleteAccount(int id) => "/deleteAccount/$id";
  static String editAccount(int id) => "/editAccount/$id";
}
