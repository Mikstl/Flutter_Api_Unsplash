import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_gallery_api/pages/full_page_picture.dart';
import 'package:unsplash_gallery_api/pages/home_page.dart';
import 'package:unsplash_gallery_api/services/photo_user_repository.dart';

import 'bloc/user_block.dart';
import 'bloc/user_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final photoUsersRepository = PhotoUsersRepository();

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
