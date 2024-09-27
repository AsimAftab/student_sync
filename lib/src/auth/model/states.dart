import 'package:flutter/cupertino.dart';

class ResetPassState{
  final TextEditingController password;
  final TextEditingController confirmPass;

  ResetPassState({
    required this.password,
    required this.confirmPass,

});

  ResetPassState copyWith({
    TextEditingController? password,
    TextEditingController? confirmPass,

}){
    return ResetPassState(password: password?? this.password, confirmPass: confirmPass?? this.confirmPass);
  }
}