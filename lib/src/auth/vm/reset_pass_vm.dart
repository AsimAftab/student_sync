
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:student_sync/src/auth/model/states.dart';

part 'reset_pass_vm.g.dart';

@riverpod

class ResetPassViewModel extends _$ResetPassViewModel{
  @override
  ResetPassState build()
  {
  return ResetPassState(password: TextEditingController(), confirmPass: TextEditingController(),);
  }

}