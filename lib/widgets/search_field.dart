import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_gallery_api/bloc/user_event.dart';

import '../bloc/user_block.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);
  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final myController = TextEditingController();
  Color iconButtonClearColor = Colors.black54;

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //
    Color _iconColor = Colors.black54;
    // Иницализация нашего Bloc с UI пользователя
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    // Получение ширины и высоты с нашего устройства для установки динамических значений
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: (width * 0.7),
          height: 50,
          child: TextField(
            onEditingComplete: (() =>
                userBloc.add(UserPhotoSearchEvent(myController.text))),
            controller: myController,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(left: 15, top: 10),
              hintText: 'Enter to search',
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color(0xffF1F3F4),
          ),
          margin: const EdgeInsets.only(left: 10),
          child: IconButton(
              splashRadius: 10,
              iconSize: width * 0.08,
              icon: Icon(
                Icons.close,
                color: iconButtonClearColor,
              ),
              onPressed: () {
                userBloc.add(UserPhotoLoadEvent());
              }),
        ),
      ],
    );
  }
}
