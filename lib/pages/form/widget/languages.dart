import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresume_app/global/functions/return_correct_string.dart';
import 'package:fresume_app/global/models/pdf_model.dart';
import 'package:fresume_app/global/theme/pallete.dart';
import 'package:fresume_app/global/theme/theme.dart';
import 'package:fresume_app/global/widgets/buttons.dart';
import 'package:fresume_app/global/widgets/expansion.dart';
import 'package:fresume_app/global/widgets/textfield.dart';
import 'package:fresume_app/pages/form/controller/form_controller.dart';
import 'package:fresume_app/src/shared/shared.dart';

class LanguagesInfo extends ConsumerWidget {
  const LanguagesInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _pdfProvider = ref.watch(pdfProvider);
    final languagesList = _pdfProvider.languages!;
    final l10n = S.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
              top: 10,
            ),
            child: Text(
              l10n.yourLanguages,
              style: headline20.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  key: Key(languagesList[index].skillId),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: LanguageFullWidget(
                    language: languagesList[index],
                    onPressed: () {
                      ref
                          .read(pdfProvider.notifier)
                          .removeLanguage(languagesList[index]);
                    },
                  ),
                );
              },
              itemCount: languagesList.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SimpleElevatedButton(
              buttonWidth: double.infinity,
              onPressed: () {
                ref.read(pdfProvider.notifier).addLanguage(Skill.createEmpty());
              },
              text: l10n.addAnotherLanguage,
            ),
          )
        ],
      ),
    );
  }
}

class LanguageFullWidget extends ConsumerStatefulWidget {
  const LanguageFullWidget({
    Key? key,
    required this.language,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Skill language;

  @override
  SectionFullWidgetState createState() => SectionFullWidgetState();
}

class SectionFullWidgetState extends ConsumerState<LanguageFullWidget> {
  TextEditingController languageNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      setState(() {
        if (checkChangeText(
          languageNameController.text,
          widget.language.skillName,
        )) {
          languageNameController.text = widget.language.skillName ?? '';
        }
      });
    });

    return BorderedExpansionTile(
      title: widget.language.skillName ?? l10n.test,
      children: [
        RectBorderFormField(
          textEditingController: languageNameController,
          labelText: l10n.skillName,
          onTextChanged: (val) {
            ref
                .read(pdfProvider.notifier)
                .editLanguage(widget.language.copyWith(skillName: val));
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SimpleOutlinedButton(
            color: Pallete.errorColor,
            buttonWidth: double.infinity,
            onPressed: () => widget.onPressed(),
            text: l10n.removeThisLanguage,
          ),
        )
      ],
    );
  }
}
