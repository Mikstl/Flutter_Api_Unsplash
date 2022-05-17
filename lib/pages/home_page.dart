import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_block.dart';
import '../services/photo_user_repository.dart';
import '../widgets/search_field.dart';
import '../widgets/photo_list.dart';

class HomePage extends StatelessWidget {
  final photoUsersRepository = PhotoUsersRepository();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return BlocProvider<UserBloc>(
        create: (context) => UserBloc(photoUsersRepository),
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              //
              children: [
                SizedBox(
                  height: (height * 0.10),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: 20, left: 20),
                  child: const Text("Unsplash API",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xff111111),
                          fontSize: 40,
                          fontWeight: FontWeight.w500)),
                ),
                Container(
                  child: SearchField(),
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: PhotoList(),
                )
              ],
            )));
  }
}
// Это наша главная страница для показа изображений
