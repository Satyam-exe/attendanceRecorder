String? isEmptyValidator(value) {
  if (value.isEmpty || value == null) {
    return 'This is a required field.';
  } else {
    return null;
  }
}

String? emailRegexValidator(value) {
  final regexSource = r"^[a-z0-9]+(.[a-z0-9]+)*@springdaleeducation\.com$";
  RegExp regExp = RegExp(regexSource);
  if (regExp.hasMatch(value.toString().toLowerCase()) == false) {
    return 'Please enter a valid Spring Dale Educational Society email.';
  }
  return null;
}

String? emailFieldValidator(value) {
  if (isEmptyValidator(value) != null) {
    return isEmptyValidator(value);
  } else {
    return emailRegexValidator(value);
  }
}

String? passwordFieldValidator(value) {
  return isEmptyValidator(value);
}
