import 'package:flutter/material.dart';
import 'package:unsplash_gallery_api/widgets/photo_list.dart';

class FullPagePicture extends StatelessWidget {
  const FullPagePicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Подключение настройки путей и получения аргументов из них, переданных через класс.
    RouteSettings settings = ModalRoute.of(context)!.settings;
    var adressPicture = settings.arguments as SendPictureToNextRout;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 140),
          Image.network(adressPicture.linkAdress),
        ],
      ),
    );
  }
}
