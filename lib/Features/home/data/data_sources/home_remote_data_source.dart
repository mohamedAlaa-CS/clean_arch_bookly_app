import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/functions/save_books_data.dart';

abstract class HomeRemoteDataSources {
  Future<List<BookEntity>> fechFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fechNewstBooks({int pageNumber = 0});
}

class HomeRemoteDataSourcesImpel extends HomeRemoteDataSources {
  @override
  Future<List<BookEntity>> fechFeaturedBooks({int pageNumber = 0}) async {
    var data = await ApiServices.get(
      endPoint: 'volumes',
      query: {
        'Filtering': 'free-ebooks',
        'q': 'programming',
        'startIndex': '${pageNumber * 10}'
      },
    );
    List<BookEntity> books = getBookList(data);
    saveBooksData(books, kFeatueredBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fechNewstBooks({int pageNumber = 0}) async {
    var data = await ApiServices.get(
      endPoint: 'volumes',
      query: {
        'Filtering': 'free-ebooks',
        'q': 'programming',
        'Sorting': 'newst',
        'startIndex': '${pageNumber * 10}'
      },
    );
    List<BookEntity> books = getBookList(data);
    saveBooksData(books, kNewestBox);

    return books;
  }

  List<BookEntity> getBookList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}
