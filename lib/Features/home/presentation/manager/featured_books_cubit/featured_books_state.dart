import 'package:bookly/Features/home/domain/entities/book_entity.dart';

abstract class FeaturedBooksState {}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksFailuer extends FeaturedBooksState {
  final String errorMessage;

  FeaturedBooksFailuer({required this.errorMessage});
}

final class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;

  FeaturedBooksSuccess({required this.books});
}
