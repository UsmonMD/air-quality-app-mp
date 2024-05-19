import 'package:air_quality/theme/app_colors.dart';
import 'package:air_quality/theme/app_style.dart';
import 'package:flutter/material.dart';

class WeatherTitleWidget extends StatelessWidget {
  const WeatherTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Погода',
          style: AppStyle.textStyle.copyWith(
            fontSize: 35,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 10),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.wb_sunny,
              color: AppColors.orange,
              size: 40,
            ),
            SizedBox(width: 3),
            Icon(
              Icons.umbrella_sharp,
              color: AppColors.blue,
              size: 40,
            ),
            SizedBox(width: 3),
            Icon(
              Icons.water_drop_rounded,
              color: Colors.blue,
              size: 40,
            ),
            SizedBox(width: 3),
            Icon(
              Icons.cloudy_snowing,
              color: Colors.white,
              size: 40,
            ),
          ],
        )
      ],
    );
  }
}
