import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

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
  var rating = 1.0;
  int currentValue = 3;
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
          Slider(
            value: rating,
            onChanged: (newValue) {
              setState(() {
                rating = newValue;
              });
            },
            min: 1.0,
            max: 10.0,
            divisions: 18,
            label: rating.toString(),
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('movies').add({
                'name': moviesName,
                'description': descriptionName,
                'rating': rating,
                'position': currentValue,
              });
            },
            child: Text('Dodaj'),
          ),
          NumberPicker(
            axis: Axis.horizontal,
            value: currentValue,
            minValue: 0,
            maxValue: 100,
            onChanged: (newValue) => setState(() => currentValue = newValue),
          ),
          Text('Current value: $currentValue'),
        ],
      ),
    );
  }
}
