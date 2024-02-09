import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeatueredBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImple extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeatueredBooks({int pageNumber = 0}) {
    var startIndex = pageNumber * 10;
    var endindex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kFeatueredBox);
    var listLenght = box.values.length;
    if (startIndex >= listLenght || endindex > listLenght) {
      return [];
    }
    //! to list() to convert from iterable (same collection) to List ..!
    return box.values.toList().sublist(startIndex, endindex);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
