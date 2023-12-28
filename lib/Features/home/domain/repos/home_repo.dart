import 'package:bookly/Features/home/domain/entities/book_entity.dart';

abstract class HomeRepo {
  Future<List<BookEntity>> fetchFeatueredBooks();
  Future<List<BookEntity>> fetchNewsBooks();
}
