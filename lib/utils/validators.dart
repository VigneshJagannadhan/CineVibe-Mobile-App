/// VALIDATOR FUNCTION FOR EMAIL TEXT FIELDS
String? validateMobileNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Mobile Number is required.';
  }
  if (value.length < 10) {
    return 'Enter a valid mobile number';
  }
  return null;
}

/// VALIDATOR FUNCTION FOR REGISTRATION PASSWORD TEXT FIELDS
String? validatePasswordRegistration(String? value) {
  RegExp regexA = RegExp(
    r'^(?=.*?[A-Z])',
  );
  RegExp regexB = RegExp(
    r'^(?=.*?[a-z])',
  );
  RegExp regexC = RegExp(
    r'^(?=.*?[0-9])',
  );
  if (value == null || value.isEmpty) {
    return 'Enter a valid password';
  } else if (!regexA.hasMatch(value)) {
    return 'Password must contain an upper case letter';
  } else if (!regexB.hasMatch(value)) {
    return 'Password must contain a lower case letter';
  } else if (!regexC.hasMatch(value)) {
    return 'Password must contain a number';
  } else if (value.toString().length < 8) {
    return 'Password must be atleast 8 characters';
  } else {
    return null;
  }
}

/// VALIDATOR FUNCTION FOR PASSWORD TEXT FIELDS
String? validatePasswordLogin(String? value) {
  if ((value?.length ?? 0) < 8) {
    return 'Password must be atleast 8 charachters';
  } else {
    return null;
  }
}

/// VALIDATOR FUNCTION FOR NAME TEXT FIELDS
String? validateName(String? value) {
  if (value == null || value == '') {
    return 'Enter your name';
  }
  return null;
}

/// VALIDATOR FUNCTION FOR NAME TEXT FIELDS
String? validateCompanyName(String? value) {
  if (value == null || value == '') {
    return 'Enter your company name';
  }
  return null;
}

/// VALIDATOR FUNCTION FOR EMAIL TEXT FIELDS
String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required.';
  }
  const pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-z]{2,7}$';
  final regExp = RegExp(pattern);
  if (!regExp.hasMatch(value.trim())) {
    return 'Enter a valid email address.';
  }
  return null;
}
