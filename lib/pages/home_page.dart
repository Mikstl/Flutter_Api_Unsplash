import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_gallery_api/services/photo_user_repository.dart';

import '../bloc/user_block.dart';
import '../bloc/user_event.dart';
import '../widgets/search_field.dart';
import '../widgets/photo_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    PhotoUsersRepository photoUsersRepository = PhotoUsersRepository();

    return BlocProvider<UserBloc>(
        create: (context) =>
            UserBloc(photoUsersRepository)..add(UserPhotoLoadEvent()),
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              //
              children: [
                SizedBox(
                  height: (height * 0.08),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: 10, left: 20),
                  child: Text("Unsplash API",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xff111111),
                          fontSize: width * 0.09,
                          fontWeight: FontWeight.w500)),
                ),
                Container(
                  child: const SearchField(),
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: PhotoList(),
                )
              ],
            )));
  }
}
// Это наша главная страница для показа изображений
