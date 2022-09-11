import 'package:disney_plus/app/cubit/root_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Jesteś zalogowany jako $email'),
          ElevatedButton(
            onPressed: () {
              context.read<RootCubit>().signOut();
            },
            child: Text('Wyloguj'),
          ),
        ],
      ),
    );
  }
}
