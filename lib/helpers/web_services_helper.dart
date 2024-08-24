import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../features/common/widgets/generla_snackbar.dart';

Future<void> handleResponseHelper({
  required BuildContext context,
  required Future<void> Function() function,
}) async {
  try {
    return await function();
  } on SocketException {
    showGeneralSnackbar(context, 'No Internet! Please try again later.');
  } on DioException catch (e) {
    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout) {
      showGeneralSnackbar(context, 'No Internet! Please try again later.');
    } else {
      showGeneralSnackbar(context, ((e.response)?.data["error"]).toString());
    }
  } catch (e) {
    showGeneralSnackbar(context, e);
  }
}
