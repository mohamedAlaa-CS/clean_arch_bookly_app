import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class FetchFeatueredBooksUseCase {
  final HomeRepo _homeRepo;

  FetchFeatueredBooksUseCase(this._homeRepo);
  Future<Either<Failure, List<BookEntity>>> fetchFeatueredBooks() {

    //check permssion
    return _homeRepo.fetchFeatueredBooks();
  }
}
