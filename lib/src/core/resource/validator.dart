import 'package:flutter/material.dart';

class CustomValidator {
  static FormFieldValidator<String?>? basic(String errMsg) {
    return (value) {
      if (value == null || value.isEmpty) {
        return errMsg;
      }
      return null;
    };
  }
}
