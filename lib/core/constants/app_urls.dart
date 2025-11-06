class AppUrl {
  static const String searchAuthors = '/search/authors.json';
  static String getAuthorImageUrl(String authorKey) {
    // Extract author ID from key (e.g., "/authors/OL23919A" -> "OL23919A")
    final authorId = authorKey.split('/').last;
    return 'https://covers.openlibrary.org/a/olid/$authorId-M.jpg';
  }
}
