import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tik_tok_clone/config/theme/app_theme.dart';
import 'package:tik_tok_clone/presentation/providers/discovery_provider.dart';
import 'package:tik_tok_clone/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false, create: (_) => DiscoverProvider()..loadNextPage()),
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
