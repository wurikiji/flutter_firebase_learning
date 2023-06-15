import 'package:firebase_study/src/feature/firebase_auth/data/model/email_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'email_provider.g.dart';

@Riverpod(keepAlive: true)
EmailModel emailModel(EmailModelRef model)  {
  return EmailModel(email: "", password:"");
}