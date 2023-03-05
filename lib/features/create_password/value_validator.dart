class MatchValidator {
  static bool isMatch(String value, String password) {
    if (password == value && value.isNotEmpty) {
      return true;
    }
    return false;
  }
}

class PasswordValidator {
  static bool validateUpperCaseLowerCase(String value) {
    if (value.contains(RegExp(r'[A-Z]')) && value.contains(RegExp(r'[a-z]'))) {
      return true;
    }
    return false;
    ;
  }

  static bool validateNumber(String value) {
    if (value.contains(RegExp(r'[0-9]'))) {
      return true;
    }
    return false;
  }

  static bool validateLength(String value) {
    if (value.length >= 6) {
      return true;
    }
    return false;
  }

  static bool validateSpecial(String value) {
    if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return true;
    }
    return false;
  }
}
