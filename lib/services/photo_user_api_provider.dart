import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/photo_user.dart';

//Этот файл предназначен для получения данных с API Unslplash
// Поставщик данных

class PhotoUserProvider {
  Future<List<PhotoUser>> getUser() async {
    var response = await http.get(Uri.parse(
        'https://api.unsplash.com/photos/?client_id=UBPojQdIhdS3iUyC4H4ztBYW5gppfope3q7z0kpE2bY'));
    //Получаем наш Json
    if (response.statusCode == 200) {
      // Если код ответа 200 (успешный)
      // print(response.body);
      List<dynamic> userJson = json.decode(response.body);
      //конвертирует в динамический лист из Стринг типа (response.body)
      // print("_-------------------------------");
      // print(userJson);
      //Разбиваем наш полученный запрос на юзеров и помещаем временно в лист.
      return userJson.map((json) => PhotoUser.fromJson(json)).toList();

      // Переделываем временный лист в словарь с нашими пользователями.
    } else {
      throw Exception("Error fetching users");
    }
  }

  Future<List<PhotoUser>> getSearchUser(String? querySearch) async {
    querySearch as String;
    var response = await http.get(Uri.parse(
        'https://api.unsplash.com/search/photos?query=$querySearch&client_id=UBPojQdIhdS3iUyC4H4ztBYW5gppfope3q7z0kpE2bY'));
    //Получаем наш Json
    if (response.statusCode == 200) {
      // Если код ответа 200 (успешный)
      // print('Response body: ${response.body}');

      SearchListUser userJsonSearch =
          SearchListUser.fromJson(json.decode(response.body));
      return userJsonSearch.resultSearch;

      // print(userJsonSearch);
      //Разбиваем наш полученный запрос на юзеров и помещаем временно в лист.

      // Переделываем временный лист в словарь с нашими пользователями.
    } else {
      throw Exception("Error fetching users");
    }
  }
}
