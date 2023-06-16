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

            Future<EmailAuthState> emailAuthState =
                EmailAuth(ref.watch(firebaseAuthProvider))
                    .signUp(email, passwd);

            emailAuthState.then(
              (EmailAuthState state) {
                if (state is FailedAuthState) {
                  _errAlert(state: state, context: context);
                } else {
                  _signUpSuccess(context, ref);
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

  Future<void> _signUpSuccess(BuildContext context, WidgetRef ref) {
    return showDialog(
      context: context,
      builder: (context) {
        _sendVerifyEmail(ref);

        return AlertDialog(
          backgroundColor: Theme.of(context).cardColor,
          content: Text(
            "I sent an authentication mail to the email address you entered. Please check your email",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"))
          ],
        );
      },
    );
  }

  void _sendVerifyEmail(WidgetRef ref) {
    try {
      EmailAuth(ref.watch(firebaseAuthProvider)).sendEmailVerification();
    } catch (e) {
      debugPrint("[!] sendSingInLink Error : ${e.toString}");
    }
  }

  void _errAlert(
      {required BuildContext context, required FailedAuthState state}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          state.errMsg,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
