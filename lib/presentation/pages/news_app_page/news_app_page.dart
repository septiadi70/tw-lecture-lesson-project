import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NewsAppPage extends StatefulWidget {
  const NewsAppPage({super.key});

  @override
  State<NewsAppPage> createState() => _NewsAppPageState();
}

class _NewsAppPageState extends State<NewsAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News App',
        ),
      ),
    );
  }
}