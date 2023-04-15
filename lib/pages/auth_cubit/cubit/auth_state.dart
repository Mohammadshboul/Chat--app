part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthCubitInitial extends AuthState {}

class RegseterLoading extends AuthState {}
class RegseterSuccess extends AuthState {}
class RegseterFailure extends AuthState {
  String? errMessage;
  RegseterFailure({required this.errMessage});
}

class LoginSuccess extends AuthState {}
class LoginLoding extends AuthState {}
class Loginfailure extends AuthState {
  String? errMessage;
  Loginfailure({required this.errMessage});
}




