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

class EmploymentHistory extends ConsumerWidget {
  const EmploymentHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _pdfProvider = ref.watch(pdfProvider);
    final employmentList = _pdfProvider.employment!;
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
              l10n.employmentHistory,
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
                  key: Key(employmentList[index].sectionId),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: EmploymentFullWidget(
                    section: employmentList[index],
                    onPressed: () {
                      ref.read(pdfProvider.notifier).removeEmploymentSection(
                            employmentList[index],
                          );
                    },
                  ),
                );
              },
              itemCount: employmentList.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SimpleElevatedButton(
              buttonWidth: double.infinity,
              onPressed: () {
                ref.read(pdfProvider.notifier).addEmploymentSection(
                      Section.createEmpty(),
                    );
              },
              text: l10n.addAnotherEmployment,
            ),
          )
        ],
      ),
    );
  }
}

class EmploymentFullWidget extends ConsumerStatefulWidget {
  const EmploymentFullWidget({
    Key? key,
    required this.section,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Section section;

  @override
  SectionFullWidgetState createState() => SectionFullWidgetState();
}

class SectionFullWidgetState extends ConsumerState<EmploymentFullWidget> {
  TextEditingController jobController = TextEditingController();
  TextEditingController employerController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      setState(() {
        if (checkChangeText(jobController.text, widget.section.textOne)) {
          jobController.text = widget.section.textOne ?? '';
        }
        if (checkChangeText(employerController.text, widget.section.textTwo)) {
          employerController.text = widget.section.textTwo ?? '';
        }
        if (checkChangeText(cityController.text, widget.section.textThree)) {
          cityController.text = widget.section.textThree ?? '';
        }
        if (checkChangeText(
          startDateController.text,
          widget.section.startDate,
        )) {
          startDateController.text = widget.section.startDate ?? '';
        }
        if (checkChangeText(endDateController.text, widget.section.endDate)) {
          endDateController.text = widget.section.endDate ?? '';
        }
        if (checkChangeText(
          descriptionController.text,
          widget.section.description,
        )) {
          descriptionController.text = widget.section.description ?? '';
        }
      });
    });

    return BorderedExpansionTile(
      title: widget.section.textOne ?? l10n.test,
      children: [
        Row(
          children: [
            Flexible(
              child: RectBorderFormField(
                textEditingController: jobController,
                labelText: l10n.jobTitle,
                onTextChanged: (val) {
                  ref.read(pdfProvider.notifier).editEmploymentSection(
                        widget.section.copyWith(textOne: val),
                      );
                },
              ),
            ),
            Flexible(
              child: RectBorderFormField(
                textEditingController: employerController,
                labelText: l10n.employer,
                onTextChanged: (val) {
                  ref.read(pdfProvider.notifier).editEmploymentSection(
                        widget.section.copyWith(textTwo: val),
                      );
                },
              ),
            ),
          ],
        ),
        Row(
          children: [
            Flexible(
              child: Row(
                children: [
                  Flexible(
                    child: RectBorderFormField(
                      textEditingController: startDateController,
                      labelText: l10n.startDate,
                      onTextChanged: (val) {
                        ref.read(pdfProvider.notifier).editEmploymentSection(
                              widget.section.copyWith(startDate: val),
                            );
                      },
                    ),
                  ),
                  Flexible(
                    child: RectBorderFormField(
                      textEditingController: endDateController,
                      labelText: l10n.endDate,
                      onTextChanged: (val) {
                        ref.read(pdfProvider.notifier).editEmploymentSection(
                              widget.section.copyWith(endDate: val),
                            );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: RectBorderFormField(
                textEditingController: cityController,
                labelText: l10n.city,
                onTextChanged: (val) {
                  ref.read(pdfProvider.notifier).editEmploymentSection(
                        widget.section.copyWith(textThree: val),
                      );
                },
              ),
            ),
          ],
        ),
        RectBorderFormField(
          maxLines: 9,
          maxLength: 500,
          labelText: l10n.description,
          textEditingController: descriptionController,
          onTextChanged: (val) {
            ref.read(pdfProvider.notifier).editEmploymentSection(
                  widget.section.copyWith(description: val),
                );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SimpleOutlinedButton(
            color: Pallete.errorColor,
            buttonWidth: double.infinity,
            onPressed: () => widget.onPressed(),
            text: l10n.removeThisEmployment,
          ),
        )
      ],
    );
  }
}
