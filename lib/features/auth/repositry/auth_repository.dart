import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:fpdart/fpdart.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:reddit/core/failure.dart";
import "package:reddit/core/providers/storage_repository_provider.dart";

import "../../../core/constants/constants.dart";
import "../../../core/constants/firebase_constants.dart";
import "../../../core/providers/firebase_providers.dart";
import "../../../models/community_model.dart";
import "../../../models/user_model.dart";

final AuthRepositoryProvider = Provider(
  (ref) => AuthRepository(
    firestore: ref.read(firestoreProvider),
    auth: ref.read(authProvider),
    googleSignIn: ref.read(googleSignInProvider),
  ),
);

class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  AuthRepository({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
    required GoogleSignIn googleSignIn,
  })  : _auth = auth,
        _firestore = firestore,
        _googleSignIn = googleSignIn;
  CollectionReference get _user =>
      _firestore.collection(FirebaseConstants.usersCollection);

  Stream<User?> get authStateChange => _auth.authStateChanges();

  Future<Either<String, UserModel>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      //_firestore.collection('users').doc(userCredential.user!.uid).set({
      //''
      //});
      UserModel userModel;
      if (userCredential.additionalUserInfo!.isNewUser) {
        userModel = UserModel(
            name: userCredential.user!.displayName ?? "No Name",
            awards: [
              'awesomeAns',
              'gold',
              'platinum',
              'helpful',
              'plusone',
              'rocket',
              'thankyou',
              'til',
            ],
            uid: userCredential.user!.uid,
            profilePic:
                userCredential.user!.photoURL ?? Constants.avatarDefault,
            isAuthenticated: true,
            banner: Constants.bannerDefault,
            karma: 0);
        _user.doc(userCredential.user!.uid).set(userModel.toMap());
      } else {
        userModel = await getUserData(userCredential.user!.uid).first;
      }
      return right(userModel);
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      return left(Failure(e.toString()) as String);
    }
    //ScaffoldMessenger(child: child)
  }

  Stream<UserModel> getUserData(String uid) {
    return _user.doc(uid).snapshots().map(
        (event) => UserModel.fromMap(event.data() as Map<String, dynamic>));
  }

  void logOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
