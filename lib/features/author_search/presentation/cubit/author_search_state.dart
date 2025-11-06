part of 'author_search_cubit.dart';

abstract class AuthorSearchState {}

class AuthorSearchInitial extends AuthorSearchState {}

class AuthorSearchLoading extends AuthorSearchState {}

class AuthorSearchLoaded extends AuthorSearchState {
  final List<Author> authors;
  AuthorSearchLoaded({required this.authors});
}

class AuthorSearchEmpty extends AuthorSearchState {}

class AuthorSearchError extends AuthorSearchState {
  final String? errorMessage;
  AuthorSearchError({this.errorMessage});
}
