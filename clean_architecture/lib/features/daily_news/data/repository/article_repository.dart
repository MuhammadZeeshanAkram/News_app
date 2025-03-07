import 'package:clean_architecture/core/constants/constants.dart';
import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/features/daily_news/business/entities/article.dart';
import 'package:clean_architecture/features/daily_news/business/repository/article_repositor.dart';
import'package:clean_architecture/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:dio/dio.dart';



class ArticleRepositoryImpl implements ArticleRepository{
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles()async{
    try{
    final httpResponse = await _newsApiService.getNewsArticles(
      apiKey:newsAPIKey,
      country: countryQuery,
      category: categoryQuery,
    );
    if(httpResponse.response.statusCode == 200){
      return DataSuccess(httpResponse.data);
    }else{
      return DataFailed(
        DioException(
          response: httpResponse.response,
          error: httpResponse.response.statusMessage,
          type: DioExceptionType.badResponse,
          requestOptions:httpResponse.response.requestOptions
        )
      );
    }
    } on DioException catch(e){
      return DataFailed(e);
    }
  }
}