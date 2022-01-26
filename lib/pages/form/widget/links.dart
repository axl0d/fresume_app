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

class LinksInfo extends ConsumerWidget {
  const LinksInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _pdfProvider = ref.watch(pdfProvider);
    final linksList = _pdfProvider.links!;
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
              l10n.yourLinks,
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
                  key: Key(linksList[index].linksId),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: LinksFullWidget(
                    link: linksList[index],
                    onPressed: () {
                      ref
                          .read(pdfProvider.notifier)
                          .removeLink(linksList[index]);
                    },
                  ),
                );
              },
              itemCount: linksList.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SimpleElevatedButton(
              buttonWidth: double.infinity,
              onPressed: () {
                ref.read(pdfProvider.notifier).addLink(Links.createEmpty());
              },
              text: l10n.addAnotherLink,
            ),
          )
        ],
      ),
    );
  }
}

class LinksFullWidget extends ConsumerStatefulWidget {
  const LinksFullWidget({
    Key? key,
    required this.link,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Links link;

  @override
  SectionFullWidgetState createState() => SectionFullWidgetState();
}

class SectionFullWidgetState extends ConsumerState<LinksFullWidget> {
  TextEditingController linkNameController = TextEditingController();

  TextEditingController linkUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      setState(() {
        if (checkChangeText(linkNameController.text, widget.link.linkName)) {
          linkNameController.text = widget.link.linkName ?? '';
        }
        if (checkChangeText(linkUrlController.text, widget.link.linkUrl)) {
          linkUrlController.text = widget.link.linkUrl ?? '';
        }
      });
    });

    return BorderedExpansionTile(
      title: widget.link.linkName ?? l10n.test,
      children: [
        Row(
          children: [
            Flexible(
              child: RectBorderFormField(
                textEditingController: linkNameController,
                labelText: l10n.linkName,
                hintText: l10n.linkNameHint,
                onTextChanged: (val) {
                  ref
                      .read(pdfProvider.notifier)
                      .editLink(widget.link.copyWith(linkName: val));
                },
              ),
            ),
            Flexible(
              child: RectBorderFormField(
                textEditingController: linkUrlController,
                labelText: l10n.linkUrl,
                hintText: l10n.linkUrlHint,
                onTextChanged: (val) {
                  ref
                      .read(pdfProvider.notifier)
                      .editLink(widget.link.copyWith(linkUrl: val));
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: SimpleOutlinedButton(
            color: Pallete.errorColor,
            buttonWidth: double.infinity,
            onPressed: () => widget.onPressed(),
            text: l10n.removeThisLink,
          ),
        )
      ],
    );
  }
}
