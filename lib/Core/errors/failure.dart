// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

abstract class Failure {
  final String erroMessage;
  const Failure(
    this.erroMessage,
  );
}

class ServerFailure extends Failure {
  ServerFailure(super.erroMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connetion Timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send Timeout with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive Timeout with ApiServer");
      case DioExceptionType.badCertificate:
        return ServerFailure("This Site can't provide a secure connetion");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResonse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');
      case DioExceptionType.connectionError:
        return ServerFailure("No Internet Connection, Please try later");
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }
  factory ServerFailure.fromResonse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response["error"]["message"]);
    } else if (statusCode == 404) {
      return ServerFailure("Your request not found, Please try later ");
    } else if (statusCode == 500) {
      return ServerFailure("Internal Server Error, Please try later ");
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}
