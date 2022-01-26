import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresume_app/global/functions/return_correct_string.dart';
import 'package:fresume_app/global/theme/theme.dart';
import 'package:fresume_app/global/widgets/textfield.dart';
import 'package:fresume_app/pages/form/controller/form_controller.dart';
import 'package:fresume_app/src/shared/shared.dart';

class ProfileSummary extends ConsumerStatefulWidget {
  const ProfileSummary({
    Key? key,
  }) : super(key: key);

  @override
  ProfileSummaryState createState() => ProfileSummaryState();
}

class ProfileSummaryState extends ConsumerState<ProfileSummary> {
  TextEditingController summaryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _pdfProvider = ref.watch(pdfProvider);
    final summary = _pdfProvider.resumeSummary!;
    final l10n = S.of(context);

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      setState(() {
        if (checkChangeText(
          summaryController.text,
          summary.professionalSummary,
        )) {
          summaryController.text = summary.professionalSummary ?? '';
        }
      });
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 10,
              top: 10,
            ),
            child: Text(
              l10n.profile,
              style: headline20.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          RectBorderFormField(
            textEditingController: summaryController,
            maxLines: 9,
            maxLength: 500,
            labelText: l10n.summary,
            hintText: l10n.summaryHint,
            onTextChanged: (val) {
              ref
                  .read(pdfProvider.notifier)
                  .editSummary(summary.copyWith(professionalSummary: val));
            },
          ),
        ],
      ),
    );
  }
}
