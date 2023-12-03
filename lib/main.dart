import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tok_clone/config/theme/app_theme.dart';
import 'package:tik_tok_clone/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:tik_tok_clone/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:tik_tok_clone/presentation/providers/discovery_provider.dart';
import 'package:tik_tok_clone/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository = VideoPostsRepositoryImpl(
        videosPostDataSource: LocalVideoDatasourceImpl());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false,
            create: (_) =>
                DiscoverProvider(videoPostRepository: videoPostRepository)
                  ..loadNextPage()),
      ],
      child: MaterialApp(
        title: 'Tik Tok Clone',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getThemeData(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
