import 'package:firebase_study/src/core/resource/padding.dart';
import 'package:firebase_study/src/core/widget/custom_text_form_field.dart';
import 'package:firebase_study/src/feature/login_page/presentations/provider/email_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailTextForm extends ConsumerWidget {
  final FormFieldValidator<String?>? validator;
  const EmailTextForm({required this.validator, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FullPadding(
      child: CustomTextFormField(
        title: "Email",
        onTap: () {},
        validator: validator,
        onSaved: (newValue) {
          ref.read(emailModelProvider).email = newValue!;
        },
      ),
    );
  }
}
