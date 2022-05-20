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
  IconData _icontype = Icons.favorite_border;
  Color _iconColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserEmptyState) {
          return Container(
            child: Text("state.zalupa",
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
            margin: EdgeInsets.only(bottom: 35, left: 20, right: 20),
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
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 19, // Image radius
                                  backgroundImage: NetworkImage(
                                      state.loadedUser[index].pictureAvatar),
                                ),
                                SizedBox(
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
                          Image.network(state.loadedUser[index].picture),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                        splashRadius: 10,
                                        iconSize: 25,
                                        icon:
                                            Icon(_icontype, color: _iconColor),
                                        onPressed: () {
                                          setState(() {
                                            if (_icontype ==
                                                Icons.favorite_border) {
                                              _icontype = Icons.favorite;
                                              _iconColor = Color.fromARGB(
                                                  255, 185, 17, 5);
                                            } else if (_icontype ==
                                                Icons.favorite) {
                                              IconData _icontype =
                                                  Icons.favorite_border;
                                              Color _iconColor = Colors.black;
                                            }
                                          });
                                        }),
                                    Icon(Icons.messenger_outline, size: 25),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(Icons.share_outlined, size: 25)
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
                      margin: EdgeInsets.only(bottom: 30),
                    ),
                  ));
        }

        if (state is UserLoadedSearchState) {
          return ListView.builder(
              itemCount: state.loadedSearchUser.length,
              itemBuilder: (context, index) => GestureDetector(
                    // GestureDetector - Позволяет делать разные жесты с виджетом
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
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 19, // Image radius
                                backgroundImage: NetworkImage(state
                                    .loadedSearchUser[index].pictureAvatar),
                              ),
                              SizedBox(
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
                          const SizedBox(
                            height: 10,
                          ),
                          Image.network(state.loadedSearchUser[index].picture),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      splashRadius: 10,
                                      iconSize: 30,
                                      icon: Icon(_icontype, color: _iconColor),
                                      onPressed: () {
                                        setState(() {
                                          if (_icontype ==
                                              Icons.favorite_border) {
                                            _icontype = Icons.favorite;
                                            _iconColor =
                                                Color.fromARGB(255, 185, 17, 5);
                                          } else if (_icontype ==
                                              Icons.favorite) {
                                            IconData _icontype =
                                                Icons.favorite_border;
                                            Color _iconColor = Colors.black;
                                          }
                                        });
                                      }),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(Icons.messenger_outline, size: 30),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(Icons.share_outlined, size: 30)
                                ],
                              ),
                              const Icon(
                                Icons.bookmark_border,
                                size: 30,
                              )
                            ],
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(bottom: 30, left: 20, right: 20),
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
