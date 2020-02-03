import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LoginState extends Equatable {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isFormSubmitted;

  bool get isFormValid => isEmailValid && isPasswordValid;

  const LoginState({
    @required this.isEmailValid,
    @required this.isPasswordValid,
    @required this.isFormSubmitted,
  });

  factory LoginState.initial() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isFormSubmitted: false,
    );
  }

  LoginState copyWith({
    bool isEmailValid,
    bool isPasswordValid,
    bool formSubmittedSuccessfully,
  }) {
    return LoginState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isFormSubmitted: isFormSubmitted ?? this.isFormSubmitted,
    );
  }

  @override
  List<Object> get props => [isEmailValid, isPasswordValid, isFormSubmitted];

  @override
  String toString() {
    return '''LoginState{
      isEmailValid: $isEmailValid,
      isPasswordValid: $isPasswordValid,
      isFormSubmitted: $isFormSubmitted
    }''';
  }
}
