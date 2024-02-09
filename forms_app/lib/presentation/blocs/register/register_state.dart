part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final String username;
  final String correo;
  final String password;

  const RegisterFormState(
      {this.formStatus = FormStatus.invalid,
      this.username = '',
      this.correo = '',
      this.password = ''});

  RegisterFormState copyWith({
    FormStatus? formStatus,
    String? username,
    String? correo,
    String? password,
  })=>RegisterFormState(
    formStatus: formStatus ?? this.formStatus,
    username: username ?? this.username,
    correo:  correo ?? this.correo,
    password: password ?? this.password
  );

  @override
  List<Object> get props => [formStatus, username, correo, password];
}
