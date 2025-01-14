import 'package:dartz/dartz.dart';
import '../../utils/Util.dart';
import '../data/models/common_models/base_response.dart';
import '../data/models/trending_repo_response_model.dart';
import '../repository/home_repository.dart';
import '../services/api_constants.dart';
import '../services/api_service.dart';
import '../services/error_handler.dart';
import '../services/failure.dart';

class HomeRepositoryImpl extends HomeRepository {

  final ApiService _apiService = ApiService();

  @override
  Future<Either<Failure, BaseResponse<List<TrendingRepoResponseModel>>>> getTrendingRepo(Map<String, dynamic> map) async {
    try {
      bool? isConnected =true;
      if (isConnected) {


        final response = await _apiService.get(
            endPoint: ApiConstants.repo, params: map,);



        if(response.data['status'] == 200){
          final data = BaseResponse.fromJson(
            response.data,
                (data) => (data as List<dynamic>)
                .map((item) => TrendingRepoResponseModel.fromJson(item))
                .toList(),
          );
          return Right(data);
        } else {
          return Left(await handleUnAuthorizedError(response));
        }
      } else {
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }
}