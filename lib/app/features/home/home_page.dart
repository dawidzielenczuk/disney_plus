import 'package:disney_plus/app/cubit/root_cubit.dart';
import 'package:disney_plus/app/features/home/add_movie/add_movies_page.dart';
import 'package:disney_plus/app/features/home/movies_disney/movies_page.dart';
import 'package:disney_plus/app/features/home/my_account/my_account_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit()..start(),
      child: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Disney+'),
              elevation: 0,
            ),
            body: Builder(builder: (context) {
              if (currentIndex == 0) {
                return const MoviesPage();
              }
              if (currentIndex == 1) {
                return AddMoviesPage(onSave: () {
                  setState(
                    () {
                      currentIndex = 0;
                    },
                  );
                });
              }
              return MyAccountPage(email: state.user?.email);
            }),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (newIndex) {
                setState(() {
                  currentIndex = newIndex;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.reviews),
                  label: 'Filmy',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: 'Dodaj',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Moje konto',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
