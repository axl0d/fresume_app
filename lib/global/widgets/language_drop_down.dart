import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresume_app/global/theme/pallete.dart';
import 'package:fresume_app/main.dart';
import 'package:fresume_app/src/shared/shared.dart';

class LanguageDropDown extends ConsumerWidget {
  const LanguageDropDown({Key? key}) : super(key: key);

  String _localizeLocale(BuildContext context, Locale locale) {
    final localeString = LocaleNames.of(context)!.nameOf(locale.toString());
    return localeString![0].toUpperCase() + localeString.substring(1);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    return Card(
      shape: const Border(bottom: BorderSide(color: Pallete.primaryColor)),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.language),
            const SizedBox(width: 5),
            DropdownButton<Locale>(
              isDense: true,
              onChanged: (value) =>
                  ref.read(localeProvider.notifier).state = value,
              underline: const Offstage(),
              value: locale ?? S.delegate.supportedLocales.first,
              items: [
                for (final l in S.delegate.supportedLocales)
                  DropdownMenuItem(
                    value: l,
                    child: Text(_localizeLocale(context, l)),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
