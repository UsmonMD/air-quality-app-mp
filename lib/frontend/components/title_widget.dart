import 'package:air_quality/frontend/widgets/error_widget.dart';
import 'package:air_quality/logic/blocs/air_api_bloc_bloc.dart';
import 'package:air_quality/theme/app_colors.dart';
import 'package:air_quality/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<AirApiBlocBloc>(context).add(AqiLoadingEvent());
        },
        backgroundColor: AppColors.darkGrey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppStyle.textStyle.copyWith(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Нажмите для обновления',
                    style: AppStyle.textStyle.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      color: AppColors.lightGrey,
                    ),
                  ),
                  const Icon(
                    Icons.restart_alt_sharp,
                    color: Colors.blue,
                    size: 15,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarTitleWidget extends StatelessWidget {
  const AppBarTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final counterTextStyle = GoogleFonts.poppins(
      fontStyle: FontStyle.normal,
      textStyle: Theme.of(context).textTheme.displaySmall,
    );
    return BlocBuilder<AirApiBlocBloc, AirApiBlocState>(
      builder: (context, state) {
        if (state is AirAqiLoadedState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${state.api.data?.city}',
                        style: counterTextStyle.copyWith(
                          fontSize: 22.5,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '${state.api.data?.state}',
                        style: counterTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        '${state.api.data?.country}',
                        style: counterTextStyle.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  )
                ]),
          );
        }
        if (state is AirAqiErrorState) {
          return const MyErrorWidget();
        }
        return Container(
          color: AppColors.background,
        );
      },
    );
  }
}
