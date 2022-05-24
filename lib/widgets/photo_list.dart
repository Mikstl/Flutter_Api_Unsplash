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
  //
  IconData _icontype = Icons.favorite_border;
  Color _iconColor = Colors.black;
  //
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserEmptyState) {
          return Container(
            child: const Text("Empty",
                style: TextStyle(
                    color: Color(0xff111111),
                    fontSize: 30,
                    fontWeight: FontWeight.w400)),
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          );
        }

        if (state is UserLoadingState) {
          return Container(
            child: const Text('Please wait...',
                style: TextStyle(
                    color: Color(0xff111111),
                    fontSize: 30,
                    fontWeight: FontWeight.w400)),
            margin: const EdgeInsets.only(bottom: 35, left: 20, right: 20),
          );
        }

        if (state is UserLoadedState) {
          return ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.only(bottom: 30),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 19, // Image radius
                          backgroundImage: NetworkImage(
                              state.loadedUser[index].pictureAvatar),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(state.loadedUser[index].user,
                                style: const TextStyle(
                                    color: Color(0xff111111),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500)),
                            //
                            Row(
                              children: [
                                Text(state.loadedUser[index].likes,
                                    style: const TextStyle(
                                        color: Color(0xff656565),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      // GestureDetector - Позволяет делать разные жесты с виджетом
                      onTap: () {
                        // Передача нашего изображения через SendPictureToNextRout класс на другой слайд.
                        SendPictureToNextRout linkPicture =
                            SendPictureToNextRout(
                                state.loadedUser[index].picture);
                        // Передача навигатору наших данных и ссылку на следующий слайд.
                        Navigator.pushNamed(context, '/second',
                            arguments: linkPicture);
                      },
                      child: Image.network(state.loadedUser[index].picture)),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                splashRadius: 10,
                                iconSize: width * 0.08,
                                icon: Icon(_icontype, color: _iconColor),
                                onPressed: () {
                                  setState(() {
                                    if (_icontype == Icons.favorite_border) {
                                      _icontype = Icons.favorite;
                                      _iconColor =
                                          const Color.fromARGB(255, 185, 17, 5);
                                    } else if (_icontype == Icons.favorite) {
                                      _icontype = Icons.favorite_border;
                                      _iconColor = const Color(0xff111111);
                                    }
                                  });
                                }),
                            const SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.messenger_outline,
                              size: width * 0.08,
                              color: const Color(0xff111111),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.share_outlined,
                              size: width * 0.08,
                              color: const Color(0xff111111),
                            )
                          ],
                        ),
                        const Icon(
                          Icons.bookmark_border,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        if (state is UserLoadedSearchState) {
          return ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            itemCount: state.loadedSearchUser.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.only(bottom: 30),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 19, // Image radius
                          backgroundImage: NetworkImage(
                              state.loadedSearchUser[index].pictureAvatar),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(state.loadedSearchUser[index].user,
                                style: const TextStyle(
                                    color: Color(0xff111111),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500)),
                            //
                            Row(
                              children: [
                                Text(state.loadedSearchUser[index].likes,
                                    style: const TextStyle(
                                        color: Color(0xff656565),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400))
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      // GestureDetector - Позволяет делать разные жесты с виджетом
                      onTap: () {
                        // Передача нашего изображения через SendPictureToNextRout класс на другой слайд.
                        SendPictureToNextRout linkPicture =
                            SendPictureToNextRout(
                                state.loadedSearchUser[index].picture);
                        // Передача навигатору наших данных и ссылку на следующий слайд.
                        Navigator.pushNamed(context, '/second',
                            arguments: linkPicture);
                      },
                      child:
                          Image.network(state.loadedSearchUser[index].picture)),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                splashRadius: 10,
                                iconSize: width * 0.08,
                                icon: Icon(_icontype, color: _iconColor),
                                onPressed: () {
                                  setState(() {
                                    if (_icontype == Icons.favorite_border) {
                                      _icontype = Icons.favorite;
                                      _iconColor =
                                          const Color.fromARGB(255, 185, 17, 5);
                                    } else if (_icontype == Icons.favorite) {
                                      _icontype = Icons.favorite_border;
                                      _iconColor = const Color(0xff111111);
                                    }
                                  });
                                }),
                            const SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.messenger_outline,
                              size: width * 0.08,
                              color: const Color(0xff111111),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.share_outlined,
                              size: width * 0.08,
                              color: const Color(0xff111111),
                            )
                          ],
                        ),
                        const Icon(
                          Icons.bookmark_border,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
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

        if (state is UserNotFoundPicture) {
          return Container(
            child: const Text('No pictures found',
                style: TextStyle(
                    color: Color(0xff111111),
                    fontSize: 30,
                    fontWeight: FontWeight.w400)),
            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
          );
        }

        return Container(
          child: const Text('How you did this?',
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
