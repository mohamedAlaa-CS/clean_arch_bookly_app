import 'package:bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImplement extends HomeRepo {
  final HomeRemoteDataSources homeRemoteDataSources;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImplement({
    required this.homeRemoteDataSources,
    required this.homeLocalDataSource,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeatueredBooks() async {
    try {
      var listBooks = homeLocalDataSource.fetchFeatueredBooks();
      if (listBooks.isNotEmpty) {
        return right(listBooks);
      }

      var books = await homeRemoteDataSources.fechFeaturedBooks();
      return right(books);
    } catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewsBooks() async {
    try {
      var listBooks = homeLocalDataSource.fetchNewestBooks();
      if (listBooks.isNotEmpty) {
        return right(listBooks);
      }

      var books = await homeRemoteDataSources.fechNewstBooks();
      return right(books);
    } catch (e) {
      return left(Failure());
    }
  }
}
