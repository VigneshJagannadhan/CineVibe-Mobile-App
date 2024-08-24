import 'package:flutter/services.dart';

class MMYYInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    // Remove any non-digit characters
    text = text.replaceAll(RegExp(r'[^0-9]'), '');

    // Format as MM/YY
    if (text.length >= 3) {
      text = '${text.substring(0, 2)}/${text.substring(2)}';
    }

    if (text.length > 5) {
      text = text.substring(0, 5);
    }

    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    // Remove any non-digit characters
    text = text.replaceAll(RegExp(r'[^0-9]'), '');

    // Format as XXXX XXXX XXXX XXXX
    StringBuffer formattedText = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i > 0 && i % 4 == 0) {
        formattedText.write(' ');
      }
      formattedText.write(text[i]);
    }

    return TextEditingValue(
      text: formattedText.toString(),
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

DateTime? formatExpiryDateToUTC(String expiryDate) {
  // Ensure the input is in the correct format
  if (expiryDate.length != 5 || expiryDate[2] != '/') {
    return null; // or throw an error
  }

  // Extract the month and year
  final int month = int.tryParse(expiryDate.substring(0, 2)) ?? -1;
  final int year = int.tryParse(expiryDate.substring(3, 5)) ?? -1;

  // Validate the extracted month and year
  if (month < 1 || month > 12 || year < 0) {
    return null; // or throw an error
  }

  // Convert the 2-digit year to a 4-digit year
  final int fullYear = 2000 + year;

  // Return the DateTime object in UTC, setting the day to 1
  return DateTime.utc(fullYear, month, 1);
}

String capitalizeFirstLetterOfEachWord(String input) {
  return input.split(' ').map((word) {
    if (word.isEmpty) return word;
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }).join(' ');
}
