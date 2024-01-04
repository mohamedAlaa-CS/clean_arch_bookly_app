import 'package:bookly/Features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeatueredBooks();
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImple extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeatueredBooks() {
    // TODO: implement fetchFeatueredBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}
