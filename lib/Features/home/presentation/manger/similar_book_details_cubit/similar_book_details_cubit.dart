// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';

part 'similar_book_details_state.dart';

class SimilarBookDetailsCubit extends Cubit<SimilarBookDetailsState> {
  SimilarBookDetailsCubit(
    this.homeRepo,
  ) : super(SimilarBookDetailsInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBookDetails({required String category}) async {
    emit(SimilarBookDetailsLoading());

    var result = await homeRepo.fetchSimilarBookDetails(category: category);

    result.fold((failure) {
      emit(SimilarBookDetailsFailure(failure.erroMessage));
    }, (books) {
      emit(SimilarBookDetailsSuccess(books));
    });
  }
}
