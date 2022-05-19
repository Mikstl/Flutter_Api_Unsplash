import '../models/photo_user.dart';
import '../services/photo_user_repository.dart';

abstract class UserState {}

class UserEmptyState extends UserState {
  // var zalupa;
  // PhotoUsersRepository photoUsersRepository = PhotoUsersRepository();

  // UserEmptyState() {
  //   var futureList = getEarlyPhotoUsersList();
  //   print(futureList);
  // }

  // Future<List<PhotoUser>> getEarlyPhotoUsersList() async {
  //   final List<PhotoUser> loadedUserList =
  //       await photoUsersRepository.getAllPhotoUsers();

  //   zalupa = loadedUserList;
  //   print(zalupa);
  //   return loadedUserList;
  // }
}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  List<dynamic> loadedUser;
  UserLoadedState({required this.loadedUser});
}

class UserLoadedSearchState extends UserState {
  List<dynamic> loadedSearchUser;
  UserLoadedSearchState({required this.loadedSearchUser});
}

class UserErrorState extends UserState {}
