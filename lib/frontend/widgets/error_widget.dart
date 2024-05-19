import 'package:air_quality/logic/blocs/air_api_bloc_bloc.dart';
import 'package:air_quality/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: 500,
        child: Padding(
          padding: const EdgeInsets.only(top: 300.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.network_wifi_2_bar_rounded,
                size: 40,
              ),
              const Text('Check your internet'),
              const SizedBox(height: 10),
              FloatingActionButton(
                onPressed: () {
                  BlocProvider.of<AirApiBlocBloc>(context)
                      .add(AqiLoadingEvent());
                },
                backgroundColor: AppColors.blue,
                child: const Icon(
                  Icons.restart_alt_rounded,
                  color: AppColors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
