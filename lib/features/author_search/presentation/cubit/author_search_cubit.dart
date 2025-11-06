import 'package:book_author_search_app/core/extensions/task_excuter.dart';
import 'package:book_author_search_app/features/author_search/domain/entities/author.dart';
import 'package:book_author_search_app/features/author_search/domain/service/author_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'author_search_state.dart';

class AuthorSearchCubit extends Cubit<AuthorSearchState> {
  AuthorSearchCubit(this._authorService) : super(AuthorSearchInitial());

  final AuthorService _authorService;

  Future<void> searchForAuthors(String authorName) async {
    emit(AuthorSearchLoading());
    final result = _authorService.searchForAuthor(authorName);
    await result.execute(
      onFailed: (failed) =>
          emit(AuthorSearchError(errorMessage: failed.message)),
      onSuccess: (authors) async {
        if (authors.isEmpty) {
          emit(AuthorSearchEmpty());
        } else {
          emit(AuthorSearchLoaded(authors: authors));
        }
      },
    );
  }
}
