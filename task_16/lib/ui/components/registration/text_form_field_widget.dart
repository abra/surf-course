import 'package:flutter/material.dart';

import 'form_field_widget.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.label,
    this.validator,
  });

  final String label;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return FormFieldWidget(
      label: label,
      keyboardType: TextInputType.text,
      validator: validator ?? _defaultValidator,
      controller: TextEditingController(),
    );
  }

  String? _defaultValidator(String? value) {
    value = value!.trim();
    if (value.isEmpty || value.length < 3 || value.length >= 20) {
      return 'Укажите имя питомца от 3 до 20 символов';
    }
    return null;
  }
}
