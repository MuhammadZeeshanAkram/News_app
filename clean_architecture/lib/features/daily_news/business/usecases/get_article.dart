import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/core/usecase/usecase.dart';
import 'package:clean_architecture/features/daily_news/business/entities/article.dart';
import 'package:clean_architecture/features/daily_news/business/repository/article_repositor.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>,void>{
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call(void params) {
    return _articleRepository.getNewsArticles();
  }
}