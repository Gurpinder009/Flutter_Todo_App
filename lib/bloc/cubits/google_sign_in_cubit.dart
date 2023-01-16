import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoogleSignInState {
  GoogleSignIn googleSignIn;
  GoogleSignInAccount? googleSignInAccount;
  GoogleSignInState({required this.googleSignIn, this.googleSignInAccount});
}

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  GoogleSignInCubit() : super(GoogleSignInState(googleSignIn: GoogleSignIn()));

  signIn() async {
    try {
      state.googleSignInAccount = await state.googleSignIn.signIn();
      if (state.googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await state.googleSignInAccount!.authentication;
        final credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);

        await FirebaseAuth.instance.signInWithCredential(credential);
      }
    }on PlatformException catch (e) {
      print("----------------${e.message}");
    }catch(e){
      print(e);
    }
  }

  signOut() async {
    await state.googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
    emit(state);
  }

  @override
  void onChange(Change<GoogleSignInState> change) {
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {

    super.onError(error, stackTrace);
  }
}
