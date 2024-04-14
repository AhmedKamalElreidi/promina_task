import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

FormFieldValidator<String>? emailValidator() {
  validator(value) {
    String pattern = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return "Email doesn't be empty!";
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  return validator;
}

FormFieldValidator<String>? passwordValidator() {
  validator(value) {
    if (value == null || value.isEmpty) {
      return "Password doesn't be empty!";
    }
    if (value.length < 8) {
      return "Password must be 8 char or more";
    } else {
      return null;
    }
  }

  return validator;
}

