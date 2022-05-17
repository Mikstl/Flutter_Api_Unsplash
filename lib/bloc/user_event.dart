abstract class UserEvent {}

class UserPhotoLoadEvent extends UserEvent {}

class UserPhotoSearchEvent extends UserEvent {
  String? search;
  UserPhotoSearchEvent(this.search);
}

class UserClearEvent extends UserEvent {}
