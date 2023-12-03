import 'package:tik_tok_clone/domain/datasources/video_posts_datasource.dart';
import 'package:tik_tok_clone/domain/entities/video_post.dart';
import 'package:tik_tok_clone/domain/repositories/video_posts_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {
  final VideoPostDataSource videosPostDataSource;

  VideoPostsRepositoryImpl({required this.videosPostDataSource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByPage(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosPostDataSource.getTrendingVideosByPage(page);
  }
}
