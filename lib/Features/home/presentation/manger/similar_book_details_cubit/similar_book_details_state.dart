part of 'similar_book_details_cubit.dart';

sealed class SimilarBookDetailsState extends Equatable {
  const SimilarBookDetailsState();

  @override
  List<Object> get props => [];
}

final class SimilarBookDetailsInitial extends SimilarBookDetailsState {}

final class SimilarBookDetailsLoading extends SimilarBookDetailsState {}

final class SimilarBookDetailsSuccess extends SimilarBookDetailsState {
  final List<BookModel> books;

  const SimilarBookDetailsSuccess(this.books);
}

final class SimilarBookDetailsFailure extends SimilarBookDetailsState {
  final String errorMessage;

  const SimilarBookDetailsFailure(this.errorMessage);
}
