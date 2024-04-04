import 'package:dio/dio.dart';

class ServerExecptions implements Exception {}

void handleException(DioException e) {
  switch (e.type) {
    //! Request Not Arrive to Database
    case DioExceptionType.connectionTimeout:
      throw ServerExecptions();
    case DioExceptionType.sendTimeout:
      throw ServerExecptions();
    case DioExceptionType.receiveTimeout:
      throw ServerExecptions();
    case DioExceptionType.badCertificate:
      throw ServerExecptions();
    case DioExceptionType.cancel:
      throw ServerExecptions();
    case DioExceptionType.connectionError:
      throw ServerExecptions();
    case DioExceptionType.unknown:
      throw ServerExecptions();

    //! Request Arrive to Database but data is not corect

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        //!Bad Request
        case 400:
          throw ServerExecptions();
        //! unauthorized
        case 401:
          throw ServerExecptions();
        //! Forbidden
        case 403:
          throw ServerExecptions();
        //! Not Found
        case 404:
          throw ServerExecptions();
        //! Cofficient
        case 409:
          throw ServerExecptions();
        //! unprocessable Entity
        case 422:
          throw ServerExecptions();
        //! Server Exception
        case 504:
          throw ServerExecptions();
      }
  }
}
