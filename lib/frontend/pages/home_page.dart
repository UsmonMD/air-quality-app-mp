import 'package:air_quality/frontend/components/days_widget.dart';
import 'package:air_quality/frontend/components/main_info_widget.dart';
import 'package:air_quality/frontend/components/title_widget.dart';
import 'package:air_quality/frontend/components/weather_title_widget.dart';
import 'package:air_quality/frontend/widgets/error_widget.dart';
import 'package:air_quality/logic/api/api_repositoryes.dart';
import 'package:air_quality/logic/blocs/air_api_bloc_bloc.dart';
import 'package:air_quality/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AirApiBlocBloc(
        apiRepositoory: ApiRepository(),
      )..add(AqiLoadingEvent()),
      child: const Scaffold(
        body: HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return BlocBuilder<AirApiBlocBloc, AirApiBlocState>(
      builder: (context, state) {
        if (state is AirAqiLoadingState) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state is AirAqiLoadedState) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(color: AppColors.background),
            width: mq.width,
            height: mq.height,
            child: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const AppBarTitleWidget(),
                const SizedBox(height: 30),
                const TitleWidget(
                  title: "Качество воздуха",
                ),
                const SizedBox(height: 30),
                MainInfoWidget(
                  text:
                      '${state.api.data?.current?.pollution?.aqius != null ? state.api.data!.current!.pollution!.aqius! / 50 : ""}',
                ),
                const SizedBox(height: 50),
                const WeatherTitleWidget(),
                const SizedBox(height: 50),
                const DaysWidget(),
              ],
            ),
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
