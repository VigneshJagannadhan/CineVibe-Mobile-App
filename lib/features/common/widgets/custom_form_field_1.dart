import 'package:flutter/material.dart';
import '../../../utils/themes.dart';

class CustomTextFormField1 extends StatelessWidget {
  const CustomTextFormField1({
    super.key,
    required this.nameController,
    required this.label,
    this.validator,
  });

  final TextEditingController nameController;
  final String label;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: getTextformfieldDecoration(label: label),
      controller: nameController,
      validator: validator,
    );
  }
}
