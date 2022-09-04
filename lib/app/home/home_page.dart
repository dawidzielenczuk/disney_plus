import 'package:disney_plus/app/home/add_movie/add_movies_page.dart';
import 'package:disney_plus/app/home/movies_disney/movies_page.dart';
import 'package:disney_plus/app/home/my_account/my_account_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disney+'),
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
        return MyAccountPage(email: widget.user.email);
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
            label: 'Moje konto',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Moje konto',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Moje konto',
          ),
        ],
      ),
    );
  }
}
