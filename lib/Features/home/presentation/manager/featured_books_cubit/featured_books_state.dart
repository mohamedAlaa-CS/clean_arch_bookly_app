abstract class FeaturedBooksState {}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksLoading extends FeaturedBooksState {}

final class FeaturedBooksFailuer extends FeaturedBooksState {
  final String errorMessage;

  FeaturedBooksFailuer({required this.errorMessage});
}

final class FeaturedBooksSuccess extends FeaturedBooksState {}
