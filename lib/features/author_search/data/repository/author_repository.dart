import '../models/author_model.dart';

abstract class AuthorRepository {
  Future<List<AuthorModel>> searchAuthors(String authorName);
}
