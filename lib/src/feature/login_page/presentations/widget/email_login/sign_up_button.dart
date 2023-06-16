import 'package:firebase_study/src/core/page/err_page.dart';
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

            Future<EmailAuthState> emailAuthState = EmailAuth(ref.watch(firebaseAuthProvider)).signUp(email, passwd);
            emailAuthState.then(
              (EmailAuthState value) {
                if (value.isErr && value.errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        value.errorMessage!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  );
                }
              },
            );
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
