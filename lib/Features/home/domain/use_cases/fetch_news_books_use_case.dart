import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchNewsBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo _homeRepo;

  FetchNewsBooksUseCase(this._homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call(int param) async {
    //chec permassion
    return await _homeRepo.fetchNewsBooks(pageNumber: param);
  }
}
