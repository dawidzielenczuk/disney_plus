import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddMoviesPage extends StatefulWidget {
  const AddMoviesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddMoviesPage> createState() => _AddMoviesPageState();
}

class _AddMoviesPageState extends State<AddMoviesPage> {
  var moviesName = '';
  var descriptionName = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Podaj nazwę filmu',
            ),
            onChanged: (newValue) {
              setState(() {
                moviesName = newValue;
              });
            },
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Opis filmu',
            ),
            onChanged: (newValue) {
              setState(() {
                descriptionName = newValue;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('movies').add({
                'name': moviesName,
                'description': descriptionName,
                'rating': 3.5,
                'position': 2,
              });
            },
            child: Text('Dodaj'),
          ),
        ],
      ),
    );
  }
}
