import 'package:firebase_study/src/core/resource/padding.dart';
import 'package:firebase_study/src/core/widget/custom_text_form_field.dart';
import 'package:firebase_study/src/feature/login_page/presentations/provider/email_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PassTextFormField extends ConsumerWidget {
  final FormFieldValidator<String?>? validator;
  final bool isVerify;
  const PassTextFormField ({this.validator,
    this.isVerify = false,
  super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FullPadding(
      child: CustomTextFormField(
        isPassword: true,
        title: isVerify ? "Verify Password" :  "Password",
        onTap: () {},
        onChanged: (value) {
          ref.read(emailModelProvider).password = value;
        },
        onSaved: (newValue) {
          ref.read(emailModelProvider).password = newValue!;
        },
        validator: isVerify ? _verifyValidator(ref) : validator,
      ),
    );
  }

  FormFieldValidator _verifyValidator(WidgetRef ref) {
    return (value) {
          if (ref.read(emailModelProvider).getPassword != value) {
            return "Password is not match";
          }
          return null;
        };
  }
}
