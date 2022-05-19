import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_gallery_api/bloc/user_event.dart';
import 'package:unsplash_gallery_api/bloc/user_state.dart';
import 'package:unsplash_gallery_api/models/photo_user.dart';

import '../services/photo_user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  PhotoUsersRepository photoUsersRepository;

  UserBloc(this.photoUsersRepository) : super(UserEmptyState()) {
    // Load default pictures4
    on<UserPhotoLoadEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final List<PhotoUser> _loadedUserList =
            await photoUsersRepository.getAllPhotoUsers();

        emit(UserLoadedState(loadedUser: _loadedUserList));
      } catch (_) {
        emit(UserErrorState());
      }
    });

    // Search
    on<UserPhotoSearchEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final List<PhotoUser> _loadedUserSearchList =
            await photoUsersRepository.getAllPhotoSearchUsers(event.search);

        emit(UserLoadedSearchState(loadedSearchUser: _loadedUserSearchList));
      } catch (_) {
        emit(UserErrorState());
      }
    });

    // @override
    // // TODO: implement initialState
    // UserState get initialState => throw UserEmptyState();

    // @override
    // Stream<UserState> mapEventToState(UserEvent event) async* {
    //   if (event is UserPhotoLoadEvent) {
    //     yield UserLoadingState();
    //     try {
    //       final List<PhotoUser> _loadedUserList =
    //           await photoUsersRepository.getAllPhotoUsers();
    //       yield UserLoadedState(loadedUser: _loadedUserList);
    //     } catch (_) {
    //       yield UserEmptyState();
    //     }
    //   } else if (event is UserClearEvent) {
    //     yield UserEmptyState();
    //   }
    // }
  }
}
