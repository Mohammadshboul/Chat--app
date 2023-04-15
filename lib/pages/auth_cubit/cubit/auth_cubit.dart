import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthCubitInitial());
  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(RegseterLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegseterSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(RegseterFailure(errMessage: "weak password"));
      } else if (ex.code == 'email-already-in-use') {
        emit(RegseterFailure(errMessage: "email-already-in-use"));
      }
    } catch (ex) {
      emit(RegseterFailure(errMessage: "there was an error please try again"));
    }
  }
  Future<void> loginUser({required String email,required String password}) async {
    emit(LoginLoding());
    try {
  UserCredential user = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
} on FirebaseAuthException catch (ex) {
     if (ex.code == 'user-not-found') {
      emit(Loginfailure(errMessage: "user Not Found"));
   } else if (ex.code == 'wrong-password') {
    emit(Loginfailure(errMessage: "Wrong password"));
    }
    } catch (e) {
emit(Loginfailure(errMessage: "someting went wrong"));
}
  }
}
