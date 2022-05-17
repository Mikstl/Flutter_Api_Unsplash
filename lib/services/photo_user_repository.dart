import 'package:unsplash_gallery_api/services/photo_user_api_provider.dart';

import '../models/photo_user.dart';

//Хранилище

class PhotoUsersRepository {
  PhotoUserProvider _usersProvider = PhotoUserProvider();

  Future<List<PhotoUser>> getAllPhotoUsers() {
    return _usersProvider.getUser();
  }

  // Future<List<PhotoUser>> getAllPhotoSearchUsers(String? querySearch) =>
  //     _usersProvider.getSearchUser(querySearch);

  Future<List<PhotoUser>> getAllPhotoSearchUsers(String? querySearch) {
    print(querySearch);
    return _usersProvider.getSearchUser(querySearch);
  }
}
