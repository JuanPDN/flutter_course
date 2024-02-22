import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:teslo_shop/features/auth/presentation/providers/auth_provider.dart';
import 'package:teslo_shop/features/shared/infrastructure/inputs/inputs.dart';

final loginFormProvider =
    StateNotifierProvider.autoDispose<LoginFormNotifier, LoginFormSate>((ref) {
  final loginUserCallBack = ref.watch(authProvider.notifier).loginUser;

  return LoginFormNotifier(loginUserCallBack: loginUserCallBack);
});

class LoginFormSate {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Email email;
  final Password password;

  LoginFormSate(
      {this.isPosting = false,
      this.isFormPosted = false,
      this.isValid = false,
      this.email = const Email.pure(),
      this.password = const Password.pure()});

  LoginFormSate copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Email? email,
    Password? password,
  }) =>
      LoginFormSate(
          isPosting: isPosting ?? this.isPosting,
          isFormPosted: isFormPosted ?? this.isFormPosted,
          isValid: isValid ?? this.isValid,
          email: email ?? this.email,
          password: password ?? this.password);

  @override
  String toString() {
    return '''
LoginFormSatate:
  isPosting: $isPosting
  isFormPosted: $isFormPosted
  isValid: $isValid
  email: $email
  password: $password
    ''';
  }
}

class LoginFormNotifier extends StateNotifier<LoginFormSate> {
  final Function(String, String) loginUserCallBack;

  LoginFormNotifier({required this.loginUserCallBack}) : super(LoginFormSate());

  onEmailChange(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
        email: newEmail, isValid: Formz.validate([newEmail, state.password]));
  }

  onPasswordChange(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
        password: newPassword,
        isValid: Formz.validate([newPassword, state.email]));
  }

  onFormSubmit() async {
    _touchEveryField();
    if (!state.isValid) return;
    state = state.copyWith(isPosting: true);
    await loginUserCallBack(state.email.value, state.password.value);
    state = state.copyWith(isPosting: false);
  }

  _touchEveryField() {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    state = state.copyWith(
        isFormPosted: true,
        email: email,
        password: password,
        isValid: Formz.validate([email, password]));
  }
}
