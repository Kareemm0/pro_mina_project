class AppValidator {
  static String? displayNameValidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return "Please Enter Your User Name ";
    }
    return null;
  }

  static String? passwordVaildtor(String? vlaue) {
    if (vlaue!.isEmpty) {
      return "Please Enter Your Password";
    }
    if (vlaue.length < 8) {
      return "Password Must Not be less Than 8 charachter";
    }
    return null;
  }
}
