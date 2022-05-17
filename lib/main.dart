import 'package:flutter/material.dart';
import 'package:unsplash_gallery_api/pages/full_page_picture.dart';
import 'package:unsplash_gallery_api/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      // Прописывание путей для навигатора
      routes: {
        '/first': (context) => HomePage(),
        '/second': (context) => const FullPagePicture(),
      },
    );
  }
}
