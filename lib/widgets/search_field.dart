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

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Иницализация нашего Bloc с UI пользователя
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    // Получение ширины и высоты с нашего устройства для установки динамических значений
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: (width * 0.8),
          child: TextField(
            onEditingComplete: (() =>
                userBloc.add(UserPhotoSearchEvent(myController.text))),
            controller: myController,
            decoration: const InputDecoration(
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
        // const SizedBox(
        //   height: 15,
        // ),
        // OutlinedButton(
        //   onPressed: () {},
        //   child: Text(
        //     "Search",
        //     style: TextStyle(fontSize: 20, color: Colors.black87),
        //   ),
        //   style: OutlinedButton.styleFrom(
        //     minimumSize: const Size(200, 50),
        //     backgroundColor: Colors.white,
        //     side: BorderSide(width: 1, color: Colors.black45),
        //     shape: StadiumBorder(),
        //   ),
        // ),
      ],
    );
  }
}
