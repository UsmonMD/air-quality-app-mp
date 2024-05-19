import 'package:air_quality/app.dart';
import 'package:air_quality/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent,
      systemNavigationBarColor: AppColors.background,
    ),
  );
  runApp(const AppPage());
}
