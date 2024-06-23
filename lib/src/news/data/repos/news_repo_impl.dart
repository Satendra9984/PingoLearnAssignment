import 'package:fpdart/fpdart.dart';
import 'package:pingolearn/core/errors/failure.dart';
import 'package:pingolearn/src/news/data/data_sources/remote_data_source.dart';
import 'package:pingolearn/src/news/data/models/news_model.dart';

class NewsRepoImpl {
  final NewsListRemoteDataSourceImpl _newsListRemoteDataSourceImpl;

  NewsRepoImpl({
    required NewsListRemoteDataSourceImpl newsListRemoteDataSourceImpl,
  }) : _newsListRemoteDataSourceImpl = newsListRemoteDataSourceImpl;

  Future<Either<Failure, List<NewsModel>>> getNewsList() async {
    try {
      List<NewsModel> newsList =
          await _newsListRemoteDataSourceImpl.getNewsList();

      return Right(newsList);
    } catch (e) {
      return Left(
          ServerFailure(message: 'Could Not Fetch Data', statusCode: 400));
    }
  }
}
