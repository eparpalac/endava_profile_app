import 'package:endava_profile_app/data/user_repository.dart';
import 'package:endava_profile_app/modules/auth/bloc/authentication_state.dart';
import 'package:endava_profile_app/modules/contributors/contributors_screen.dart';
import 'package:endava_profile_app/modules/core_skills/core_skills_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/constants.dart';
import 'modules/auth/bloc/authentication_bloc.dart';
import 'modules/auth/bloc/authentication_event.dart';
import 'modules/home/home_screen.dart';
import 'modules/login/login_screen.dart';

void main() {
  final userRepository = UserRepository();
  runApp(BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AppStartedEvent());
      },
      child: EndavaProfileApp()));
}

class EndavaProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Endava Profile',
      routes: {
        AppRoute.of(AppScreen.login): (c) => LoginScreen(),
        AppRoute.of(AppScreen.contributors): (c) =>
            ContributorsScreen(repository: 'stpopa/endava_profile_app'),
        AppRoute.of(AppScreen.coreSkills): (c) => CoreSkillsScreen(),
      },
//      initialRoute: AppRoute.of(AppScreen.home),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticatedState) {
            return HomeScreen();
          }
          return LoginScreen();
        },
      ),
    );
  }
}
