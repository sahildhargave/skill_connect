import 'dart:io';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/models/user_model.dart';
import 'package:routemaster/routemaster.dart';

import '../../../core/providers/storage_repository_provider.dart';
import '../../../models/post_model.dart';
import '../../auth/controller/auth_controller.dart';
import '../repository/user_profile_repository.dart';

final userProfileControllerProvider =
    StateNotifierProvider<UserProfileController, bool>((ref) {
  final userProfileRepository = ref.watch(userProfileRepositoryProvider);
  final storageRepository = ref.watch(storageRepositoryProvider);
  return UserProfileController(
      userProfileRepository: userProfileRepository,
      storageRepository: storageRepository,
      ref: ref);
});

final getUserPostsProvider = StreamProvider.family((ref, String uid) {
  return ref.read(userProfileControllerProvider.notifier).getUserPosts(uid);
});

class UserProfileController extends StateNotifier<bool> {
  final UserProfileRepository _userProfileRepository;
  final Ref _ref;
  final StorageRepository _storageRepository;
  UserProfileController({
    required UserProfileRepository userProfileRepository,
    required Ref ref,
    required StorageRepository storageRepository,
  })  : _userProfileRepository = userProfileRepository,
        _ref = ref,
        _storageRepository = storageRepository,
        super(false);

  void editCommunity({
    required File? profileFile,
    required File? bannerFile,
    required BuildContext context,
    required String name,
  }) async {
    state = true;
    UserModel user = _ref.read(userProvider)!;
    if (profileFile != null) {
      final res = await _storageRepository.storeFile(
        // communities/getStore/name
        path: 'users/profile',
        id: user.uid,
        file: profileFile,
      );
      res.fold(
        (l) => showSnackbar(context, l.message as Widget),
        (r) => user.copyWith(profilePic: r),
      );
    }
    if (bannerFile != null) {
      final res = await _storageRepository.storeFile(
        // communities/getStore/name
        path: 'users/banner',
        id: user.uid,
        file: bannerFile,
      );
      res.fold(
        (l) => showSnackbar(context, l.message as Widget),
        (r) => user.copyWith(banner: r),
      );
    }

    user = user.copyWith(name: name);

    final res = await _userProfileRepository.editProfile(user);
    state = false;
    res.fold((l) => showSnackbar(context, l.message as Widget), (r) {
      _ref.read(userProvider.notifier).update((state) => user);
      Routemaster.of(context).pop();
    });
  }

  Stream<List<Post>> getUserPosts(String uid) {
    return _userProfileRepository.getUserPosts(uid);
  }
}
