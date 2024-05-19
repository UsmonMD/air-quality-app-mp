import 'package:air_quality/frontend/widgets/error_widget.dart';
import 'package:air_quality/logic/blocs/air_api_bloc_bloc.dart';
import 'package:air_quality/theme/app_colors.dart';
import 'package:air_quality/theme/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DaysWidget extends StatelessWidget {
  const DaysWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List cardNames = [
      'Температура',
      'Скорость ветра',
      'Влажность',
      'Давление',
      'Последнее обновление',
    ];
    final List cardColors = [
      AppColors.blue,
      AppColors.orange,
      AppColors.pink,
      AppColors.purple,
    ];

    return BlocBuilder<AirApiBlocBloc, AirApiBlocState>(
      builder: (context, state) {
        if (state is AirAqiLoadingState) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state is AirAqiLoadedState) {
dynamic convertMetersPerSecondToKmh(dynamic metersPerSecond) {
  var finalValue = metersPerSecond * 3.6;
  return finalValue;
}


          final List cardValues = [
            state.api.data?.current?.weather?.tp,
            convertMetersPerSecondToKmh(
                state.api.data?.current?.weather?.ws ?? 0), //исключение здесь
            state.api.data?.current?.weather?.hu,
            state.api.data?.current?.weather?.pr,
            state.api.data?.current?.weather?.ts,
          ];

          final List cardOtherValues = [
            'Градуса/ов',
            'км/ч',
            '%',
            'Норма 1013.25',
            null,
          ];

          return SizedBox(
            height: 540,
            width: 600,
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (index == 4) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.background,
                    ),
                    width: 600,
                    height: 90,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          cardNames[index],
                          style: AppStyle.textStyle.copyWith(
                            fontSize: 15,
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          cardValues[index].toString(),
                          style: AppStyle.textStyle.copyWith(
                            fontSize: 15,
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (cardOtherValues[index] != null)
                          Text(
                            cardOtherValues[index].toString(),
                            style: AppStyle.textStyle.copyWith(
                              fontSize: 15,
                              color: AppColors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                      ],
                    ),
                  );
                }
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: cardColors[index],
                  ),
                  width: 600,
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cardNames[index],
                        style: AppStyle.textStyle.copyWith(
                          fontSize: 15,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            cardValues[index].toString(),
                            style: AppStyle.textStyle.copyWith(
                              fontSize: 15,
                              color: AppColors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            cardOtherValues[index].toString(),
                            style: AppStyle.textStyle.copyWith(
                              fontSize: 15,
                              color: AppColors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20);
              },
              itemCount: 5,
            ),
          );
        }
        if (state is AirAqiErrorState) {
          return const MyErrorWidget();
        }
        return const SizedBox();
      },
    );
  }
}
