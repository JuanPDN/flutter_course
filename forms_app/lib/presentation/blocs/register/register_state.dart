part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Username username;
  final Email correo;
  final Password password;

  const RegisterFormState(
      {this.formStatus = FormStatus.invalid,
      this.isValid = false, 
      this.username = const Username.pure(),
      this.correo = const Email.pure(),
      this.password = const Password.pure()});

  RegisterFormState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Username? username,
    Email? correo,
    Password? password,
  })=>RegisterFormState(
    formStatus: formStatus ?? this.formStatus,
    isValid: isValid ?? this.isValid,
    username: username ?? this.username,
    correo:  correo ?? this.correo,
    password: password ?? this.password
  );

  @override
  List<Object> get props => [formStatus, isValid, username, correo, password];
}
