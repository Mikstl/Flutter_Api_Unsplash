import '../models/photo_user.dart';
import '../services/photo_user_repository.dart';

abstract class UserState {}

class UserEmptyState extends UserState {
}

class UserNotFoundPicture extends UserState {}

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
