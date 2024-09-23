import 'package:bookly_app/Core/errors/failure.dart';
import 'package:bookly_app/Core/utils/api_services.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var date = await apiServices.get(
          endPoint: "volumes?Filtering=free-ebooks&q=Programming");

      List<BookModel> books = [];
      for (var item in date["items"]) {
        books.add(
          BookModel.fromJson(item),
        );
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioError(e),
        );
      }
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var date = await apiServices.get(
          endPoint: "volumes?Filtering=free-ebooks&q=computer science");

      List<BookModel> books = [];
      for (var item in date["items"]) {
        books.add(
          BookModel.fromJson(item),
        );
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioError(e),
        );
      }
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBookDetails(
      {required String category}) async {
    try {
      var date = await apiServices.get(
          endPoint:
              "volumes?Sorting=relevance&Filtering=free-ebooks&q=programming");

      List<BookModel> books = [];
      for (var item in date["items"]) {
        books.add(
          BookModel.fromJson(item),
        );
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(
          ServerFailure.fromDioError(e),
        );
      }
      return Left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
