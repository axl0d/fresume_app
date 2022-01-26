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

class SkillsInfo extends ConsumerWidget {
  const SkillsInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _pdfProvider = ref.watch(pdfProvider);
    final skillsList = _pdfProvider.skills!;
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
              l10n.yourSkills,
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
                  key: Key(skillsList[index].skillId),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SkillFullWidget(
                    skill: skillsList[index],
                    onPressed: () {
                      ref
                          .read(pdfProvider.notifier)
                          .removeSkill(skillsList[index]);
                    },
                  ),
                );
              },
              itemCount: skillsList.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SimpleElevatedButton(
              buttonWidth: double.infinity,
              onPressed: () {
                ref.read(pdfProvider.notifier).addSkill(Skill.createEmpty());
              },
              text: l10n.addAnotherSkill,
            ),
          )
        ],
      ),
    );
  }
}

class SkillFullWidget extends ConsumerStatefulWidget {
  const SkillFullWidget({
    Key? key,
    required this.skill,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Skill skill;

  @override
  SectionFullWidgetState createState() => SectionFullWidgetState();
}

class SectionFullWidgetState extends ConsumerState<SkillFullWidget> {
  TextEditingController skillNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      setState(() {
        if (checkChangeText(skillNameController.text, widget.skill.skillName)) {
          skillNameController.text = widget.skill.skillName ?? '';
        }
      });
    });

    return BorderedExpansionTile(
      title: widget.skill.skillName ?? l10n.test,
      children: [
        RectBorderFormField(
          textEditingController: skillNameController,
          labelText: l10n.skillName,
          onTextChanged: (val) {
            ref
                .read(pdfProvider.notifier)
                .editSkill(widget.skill.copyWith(skillName: val));
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SimpleOutlinedButton(
            color: Pallete.errorColor,
            buttonWidth: double.infinity,
            onPressed: () => widget.onPressed(),
            text: l10n.removeThisSkill,
          ),
        )
      ],
    );
  }
}
