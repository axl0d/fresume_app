import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresume_app/global/functions/return_correct_string.dart';
import 'package:fresume_app/global/theme/theme.dart';
import 'package:fresume_app/global/widgets/textfield.dart';
import 'package:fresume_app/pages/form/controller/form_controller.dart';
import 'package:fresume_app/src/shared/shared.dart';

class PersonalDetails extends ConsumerStatefulWidget {
  const PersonalDetails({
    Key? key,
  }) : super(key: key);

  @override
  PersonalDetailsState createState() => PersonalDetailsState();
}

class PersonalDetailsState extends ConsumerState<PersonalDetails> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController jobRoleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _pdfProvider = ref.watch(pdfProvider);
    final personal = _pdfProvider.resumePersonal!;
    final l10n = S.of(context);

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      setState(() {
        if (checkChangeText(emailController.text, personal.email)) {
          emailController.text = personal.email ?? '';
        }
        if (checkChangeText(phoneController.text, personal.phoneNumber)) {
          phoneController.text = personal.phoneNumber ?? '';
        }
        if (checkChangeText(firstNameController.text, personal.firstName)) {
          firstNameController.text = personal.firstName ?? '';
        }
        if (checkChangeText(lastNameController.text, personal.lastName)) {
          lastNameController.text = personal.lastName ?? '';
        }
        if (checkChangeText(jobRoleController.text, personal.jobTitle)) {
          jobRoleController.text = personal.jobTitle ?? '';
        }
      });
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              l10n.personalDetails,
              style: headline20.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          RectBorderFormField(
            textEditingController: emailController,
            initialValue: _pdfProvider.resumePersonal!.email,
            labelText: l10n.emailAddress,
            hintText: l10n.emailAddressHint,
            onTextChanged: (val) {
              ref
                  .read(pdfProvider.notifier)
                  .editPersonal(personal.copyWith(email: val));
            },
          ),
          Row(
            children: [
              Flexible(
                child: RectBorderFormField(
                  textEditingController: firstNameController,
                  initialValue: returnCorrectStringString(personal.firstName),
                  labelText: l10n.firstName,
                  hintText: l10n.firstNameHint,
                  onTextChanged: (val) {
                    ref
                        .read(pdfProvider.notifier)
                        .editPersonal(personal.copyWith(firstName: val));
                  },
                ),
              ),
              Flexible(
                child: RectBorderFormField(
                  textEditingController: lastNameController,
                  initialValue: returnCorrectStringString(personal.lastName),
                  labelText: l10n.lastName,
                  hintText: l10n.lastNameHint,
                  onTextChanged: (val) {
                    ref
                        .read(pdfProvider.notifier)
                        .editPersonal(personal.copyWith(lastName: val));
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                child: RectBorderFormField(
                  textEditingController: jobRoleController,
                  initialValue: returnCorrectStringString(personal.jobTitle),
                  labelText: l10n.jobRole,
                  hintText: l10n.jobRoleHint,
                  onTextChanged: (val) {
                    ref
                        .read(pdfProvider.notifier)
                        .editPersonal(personal.copyWith(jobTitle: val));
                  },
                ),
              ),
              Flexible(
                child: RectBorderFormField(
                  textEditingController: phoneController,
                  initialValue: returnCorrectStringString(personal.email),
                  labelText: l10n.phoneNumber,
                  hintText: l10n.phoneNumberHint,
                  onTextChanged: (val) {
                    ref
                        .read(pdfProvider.notifier)
                        .editPersonal(personal.copyWith(phoneNumber: val));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
