import 'package:firebase_study/src/core/resource/padding.dart';
import 'package:firebase_study/src/feature/firebase_auth/data/model/email_model.dart';
import 'package:firebase_study/src/feature/firebase_auth/services/email_auth.dart';
import 'package:firebase_study/src/feature/firebase_auth/services/firebase_auth.dart';
import 'package:firebase_study/src/feature/login_page/presentations/provider/email_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpButton extends ConsumerWidget {
  final GlobalKey<FormState> formKey;
  const SignUpButton({required this.formKey, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final EmailModel emailModel = ref.watch(emailModelProvider);
    return FullPadding(
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            final (email, passwd) = emailModel.get;
            debugPrint('[*] Save Success : $email, $passwd');
            EmailAuth(ref.watch(firebaseAuthProvider)).signUp(email, passwd);
          }
        },
        child: Text(
          "Sign Up",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
        ),
      ),
    );
  }
}
