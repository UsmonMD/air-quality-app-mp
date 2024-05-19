import 'package:air_quality/theme/app_colors.dart';
import 'package:air_quality/theme/app_style.dart';
import 'package:flutter/cupertino.dart';

class MainInfoWidget extends StatelessWidget {
  const MainInfoWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: 400,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          color: AppColors.darkGrey),
      child: Column(
        children: [
          Text(
            'Качество воздуха превышает рекомендации ВОЗ в',
            textAlign: TextAlign.center,
            style: AppStyle.textStyle.copyWith(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
          Text(
            text.toString(),
            textAlign: TextAlign.center,
            style: AppStyle.textStyle.copyWith(
              fontSize: 90,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
          Text(
            'раз(а)',
            textAlign: TextAlign.center,
            style: AppStyle.textStyle.copyWith(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
