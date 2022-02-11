import 'package:counter_app/home/bloc/home_bloc.dart';
import 'package:counter_app/home/repository/home_repository.dart';
import 'package:counter_app/services/connectivityservice/connectivity_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
          RepositoryProvider.of<HomeRepository>(context),
          RepositoryProvider.of<ConnectivityService>(context))
        ..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('BoredActivities'),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is HomeLoadedState) {
              return SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 54,
                        ),
                        Text('Activity : ${state.activityName}'),
                        SizedBox(
                          height: 24,
                        ),
                        Text('Type of Activity : ${state.activityType}'),
                        SizedBox(
                          height: 24,
                        ),
                        Text('Number of participants : ${state.participants}'),
                        SizedBox(
                          height: 24,
                        ),
                        ElevatedButton(
                            onPressed: () => BlocProvider.of<HomeBloc>(context)
                                .add(LoadApiEvent()),
                            child: Text('Next'))
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is HomeErrorState) {
              return Center(
                child: Container(
                  color: Colors.purple,
                  // height: 50,
                  child: ElevatedButton(
                      onPressed: () =>
                          context.read<HomeBloc>().add(LoadApiEvent()),
                      child: Text('Retry')),
                ),
              );
            } else {
              return Center(
                child: Text('No Internet :('),
              );
            }
          },
        ),
      ),
    );
  }
}
