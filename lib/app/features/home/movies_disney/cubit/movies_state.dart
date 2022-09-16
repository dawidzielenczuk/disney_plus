part of 'movies_cubit.dart';

@immutable
class MoviesState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;

  final bool isLoading;
  final String errorMessage;

  const MoviesState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
