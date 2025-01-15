import 'package:dartz/dartz.dart';
import '../data/models/trending_repo_response_model.dart';
import '../services/failure.dart';

abstract class HomeRepository {

  Future<Either<Failure,List<TrendingRepoResponseModel>>> getTrendingRepo(Map<String, dynamic> map);

}