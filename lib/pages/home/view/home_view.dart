import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:fresume_app/apis/auth.dart';
import 'package:fresume_app/global/constants/constants.dart';
import 'package:fresume_app/global/models/pdf_model.dart';
import 'package:fresume_app/global/theme/pallete.dart';
import 'package:fresume_app/global/theme/theme.dart';
import 'package:fresume_app/global/widgets/buttons.dart';
import 'package:fresume_app/global/widgets/language_drop_down.dart';
import 'package:fresume_app/global/widgets/shape.dart';
import 'package:fresume_app/pages/form/controller/form_controller.dart';
import 'package:fresume_app/src/shared/shared.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeAuthView extends ConsumerWidget {
  const HomeAuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (context, size) {
            if (size.maxWidth > 750) {
              return Padding(
                padding: const EdgeInsets.all(24),
                child: SizedBox(
                  width: 850,
                  height: 600,
                  child: Card(
                    color: Pallete.primaryLightColor,
                    elevation: 8,
                    shape: Shape.roundedRectangleBorderAll(20),
                    shadowColor: Colors.black.withOpacity(0.4),
                    child: Column(
                      children: [
                        const SizedBox(height: 5),
                        const LanguageDropDown(),
                        const LogoAndTitleRow(),
                        Expanded(
                          child: Row(
                            children: const [
                              LoginButton(false),
                              ExampleImage(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }

            return Container(
              color: Pallete.primaryLightColor,
              child: Column(
                children: const [
                  SizedBox(height: 5),
                  LanguageDropDown(),
                  LogoAndTitleColumn(),
                  ExampleImage(),
                  SizedBox(height: 16),
                  LoginButton(true),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ExampleImage extends StatelessWidget {
  const ExampleImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        color: Pallete.primaryLightColor,
        child: Center(
          child: Image.network(
            exampleImage,
            height: 400,
          ),
        ),
      ),
    );
  }
}

class LoginButton extends ConsumerWidget {
  const LoginButton(
    this.useMobileLayout, {
    Key? key,
  }) : super(key: key);

  final bool useMobileLayout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = S.of(context);
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          color: Pallete.primaryColor,
          borderRadius: useMobileLayout
              ? Shape.roundedShapeOnly(topRight: 20, topLeft: 20)
              : Shape.roundedShapeOnly(topRight: 20, bottomRight: 20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthFlowBuilder<OAuthController>(
                flow: gConfig.createFlow(
                  ref.watch(authApiProvider).firebaseAuth,
                  AuthAction.signIn,
                ),
                auth: ref.watch(authApiProvider).firebaseAuth,
                config: const GoogleProviderConfiguration(clientId: clientId),
                listener: (oldState, newState, controller) async {
                  if (newState is SignedIn) {
                    final currentUser =
                        ref.watch(authApiProvider).firebaseAuth.currentUser;

                    await ref
                        .watch(firebaseFirestoreProvider)
                        .collection('user')
                        .doc(currentUser!.uid)
                        .set(<String, dynamic>{
                      'uid': currentUser.uid,
                      'lastLoggedIn': DateTime.now(),
                    });
                  }
                },
                builder: (context, state, controller, _) {
                  return SimpleElevatedButton(
                    color: Pallete.backgroundColor,
                    textColor: Pallete.primaryColor,
                    buttonHeight: 50,
                    buttonWidth: double.infinity,
                    roundedRadius: 5,
                    onPressed: () {
                      controller.signInWithProvider(TargetPlatform.android);
                    },
                    text: l10n.signInWithGoogle,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  l10n.or.toUpperCase(),
                  style: subtitle14.copyWith(
                    color: Pallete.primaryLightColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SimpleElevatedButton(
                color: Pallete.backgroundColor,
                textColor: Pallete.primaryColor,
                buttonHeight: 50,
                buttonWidth: double.infinity,
                roundedRadius: 5,
                onPressed: () {
                  ref.watch(pdfProvider.notifier).editPdf(
                        PdfModel.createEmpty().copyWith(pdfId: 'noSave'),
                      );

                  Get.toNamed<void>('/resume');
                },
                text: l10n.continueWithoutSignIn,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                l10n.signInDescription,
                style: caption12.copyWith(color: Pallete.backgroundColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LogoAndTitleRow extends StatelessWidget {
  const LogoAndTitleRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Container(
      color: Pallete.primaryLightColor,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(36),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: Shape.roundedShapeAll(20),
                  image: const DecorationImage(
                    image: NetworkImage(logo),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.createAFreeResumeNow.toUpperCase(),
                    style: headline34.copyWith(
                      color: Pallete.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        l10n.developedBy,
                        style: subtitle16.copyWith(color: Pallete.primaryColor),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await launch(
                            'https://www.linkedin.com/in/varun-bhalerao-677a48179/',
                          );
                        },
                        child: Text(
                          'Varun Bhalerao',
                          style: subtitle16.copyWith(
                            decoration: TextDecoration.underline,
                            color: Pallete.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class LogoAndTitleColumn extends StatelessWidget {
  const LogoAndTitleColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Container(
      color: Pallete.primaryLightColor,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(36),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: Shape.roundedShapeAll(20),
              image: const DecorationImage(
                image: NetworkImage(logo),
              ),
            ),
          ),
          Text(
            l10n.createAFreeResumeNow,
            style: headline20.copyWith(
              color: Pallete.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                l10n.developedBy,
                style: subtitle14.copyWith(color: Pallete.primaryColor),
              ),
              GestureDetector(
                onTap: () async {
                  await launch(
                    'https://www.linkedin.com/in/varun-bhalerao-677a48179/',
                  );
                },
                child: Text(
                  'Varun Bhalerao',
                  style: subtitle16.copyWith(
                    decoration: TextDecoration.underline,
                    color: Pallete.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
