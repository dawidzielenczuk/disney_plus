import 'package:disney_plus/app/home/movies_disney/cubit/movies_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesCubit()..start(),
      child: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                'Something went wrong: ${state.errorMessage}',
              ),
            );
          }
          if (state.isLoading) {
            //==true
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final documents = state.documents;

          return Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/disney.png"),
                fit: BoxFit.fitHeight,
                opacity: 0.8,
              ),
            ),
            child: ListView(
              children: [
                for (final document in documents) ...[
                  Container(
                    margin: const EdgeInsets.all(35.0),
                    color: Colors.blue[100],
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    document['position'].toString(),
                                    style: const TextStyle(fontSize: 25.0),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    document['name'],
                                  ),
                                ],
                              ),
                              Text(
                                document['rating'].toString(),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              document['description'],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
