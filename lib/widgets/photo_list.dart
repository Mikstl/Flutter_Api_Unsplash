import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_gallery_api/bloc/user_state.dart';

import '../bloc/user_block.dart';

class PhotoList extends StatefulWidget {
  const PhotoList({Key? key}) : super(key: key);

  @override
  State<PhotoList> createState() => _PhotoListState();
}

class _PhotoListState extends State<PhotoList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserEmptyState) {
          return Container(
            child: const Text('The list is empty',
                style: TextStyle(
                    color: Color(0xff111111),
                    fontSize: 30,
                    fontWeight: FontWeight.w400)),
            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
          );
        }

        if (state is UserLoadingState) {
          return Container(
            child: const Text('Please wait...',
                style: TextStyle(
                    color: Color(0xff111111),
                    fontSize: 30,
                    fontWeight: FontWeight.w400)),
            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
          );
        }

        if (state is UserLoadedState) {
          return ListView.builder(
              itemCount: state.loadedUser.length,
              itemBuilder: (context, index) => GestureDetector(
                    // GestureDetector - Позволяет делать разные жесты с виджетом
                    onTap: () {
                      // Передача нашего изображения через SendPictureToNextRout класс на другой слайд.
                      SendPictureToNextRout linkPicture = SendPictureToNextRout(
                          state.loadedUser[index].picture);
                      // Передача навигатору наших данных и ссылку на следующий слайд.
                      Navigator.pushNamed(context, '/second',
                          arguments: linkPicture);
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.loadedUser[index].user,
                              style: const TextStyle(
                                  color: Color(0xff111111),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400)),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.network(state.loadedUser[index].picture),
                        ],
                      ),
                      margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    ),
                  ));
        }

        if (state is UserLoadedSearchState) {
          return ListView.builder(
              itemCount: state.loadedSearchUser.length,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      // Передача нашего изображения через SendPictureToNextRout класс на другой слайд.
                      SendPictureToNextRout linkPicture = SendPictureToNextRout(
                          state.loadedSearchUser[index].picture);
                      // Передача навигатору наших данных и ссылку на следующий слайд.
                      Navigator.pushNamed(context, '/second',
                          arguments: linkPicture);
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.loadedSearchUser[index].user,
                              style: const TextStyle(
                                  color: Color(0xff111111),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400)),
                          const SizedBox(
                            height: 10,
                          ),
                          Image.network(state.loadedSearchUser[index].picture),
                        ],
                      ),
                      margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    ),
                  ));
        }

        if (state is UserErrorState) {
          return Container(
            child: const Text('Crash error',
                style: TextStyle(
                    color: Color(0xff111111),
                    fontSize: 30,
                    fontWeight: FontWeight.w400)),
            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
          );
        }
        return Container(
          child: const Text('Crash error',
              style: TextStyle(
                  color: Color(0xff111111),
                  fontSize: 30,
                  fontWeight: FontWeight.w400)),
          margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
        );
      },
    );
  }
}

class SendPictureToNextRout {
  String linkAdress;
  SendPictureToNextRout(this.linkAdress);
}
