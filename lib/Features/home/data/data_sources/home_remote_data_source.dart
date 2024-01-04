import 'package:bookly/Features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSources {
  Future<List<BookEntity>> fechFeaturedBooks();
  Future<List<BookEntity>> fechNewstBooks();
}

class HomeRemoteDataSourcesImpel extends HomeRemoteDataSources {
  @override
  Future<List<BookEntity>> fechFeaturedBooks() {
    // TODO: implement fechFeaturedBooks
    throw UnimplementedError();
  }

  @override
  Future<List<BookEntity>> fechNewstBooks() {
    // TODO: implement fechNewstBooks
    throw UnimplementedError();
  }
}
