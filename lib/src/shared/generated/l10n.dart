// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Fill`
  String get fill {
    return Intl.message(
      'Fill',
      name: 'fill',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get download {
    return Intl.message(
      'Download',
      name: 'download',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Preview`
  String get preview {
    return Intl.message(
      'Preview',
      name: 'preview',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `System language`
  String get systemLanguage {
    return Intl.message(
      'System language',
      name: 'systemLanguage',
      desc: '',
      args: [],
    );
  }

  /// `developed by `
  String get developedBy {
    return Intl.message(
      'developed by ',
      name: 'developedBy',
      desc: '',
      args: [],
    );
  }

  /// `Continue without sign in`
  String get continueWithoutSignIn {
    return Intl.message(
      'Continue without sign in',
      name: 'continueWithoutSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Using your Google account will allow you to save up to 3 resumes, you can still continue without signing in but your resume will not be saved once you leave/refresh the site.`
  String get signInDescription {
    return Intl.message(
      'Using your Google account will allow you to save up to 3 resumes, you can still continue without signing in but your resume will not be saved once you leave/refresh the site.',
      name: 'signInDescription',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message(
      'or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get signInWithGoogle {
    return Intl.message(
      'Sign in with Google',
      name: 'signInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Create a free resume now!`
  String get createAFreeResumeNow {
    return Intl.message(
      'Create a free resume now!',
      name: 'createAFreeResumeNow',
      desc: '',
      args: [],
    );
  }

  /// `Add another education`
  String get addAnotherEducation {
    return Intl.message(
      'Add another education',
      name: 'addAnotherEducation',
      desc: '',
      args: [],
    );
  }

  /// `Education History`
  String get educationHistory {
    return Intl.message(
      'Education History',
      name: 'educationHistory',
      desc: '',
      args: [],
    );
  }

  /// `Remove this employment`
  String get removeThisEmployment {
    return Intl.message(
      'Remove this employment',
      name: 'removeThisEmployment',
      desc: '',
      args: [],
    );
  }

  /// `Job Title`
  String get jobTitle {
    return Intl.message(
      'Job Title',
      name: 'jobTitle',
      desc: '',
      args: [],
    );
  }

  /// `Employer`
  String get employer {
    return Intl.message(
      'Employer',
      name: 'employer',
      desc: '',
      args: [],
    );
  }

  /// `Start Date`
  String get startDate {
    return Intl.message(
      'Start Date',
      name: 'startDate',
      desc: '',
      args: [],
    );
  }

  /// `End Date`
  String get endDate {
    return Intl.message(
      'End Date',
      name: 'endDate',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Employment History`
  String get employmentHistory {
    return Intl.message(
      'Employment History',
      name: 'employmentHistory',
      desc: '',
      args: [],
    );
  }

  /// `Add another employment`
  String get addAnotherEmployment {
    return Intl.message(
      'Add another employment',
      name: 'addAnotherEmployment',
      desc: '',
      args: [],
    );
  }

  /// `Extra-curricular activities`
  String get extracurricularActivities {
    return Intl.message(
      'Extra-curricular activities',
      name: 'extracurricularActivities',
      desc: '',
      args: [],
    );
  }

  /// `Add another activity`
  String get addAnotherActivity {
    return Intl.message(
      'Add another activity',
      name: 'addAnotherActivity',
      desc: '',
      args: [],
    );
  }

  /// `Your Languages`
  String get yourLanguages {
    return Intl.message(
      'Your Languages',
      name: 'yourLanguages',
      desc: '',
      args: [],
    );
  }

  /// `Add another language`
  String get addAnotherLanguage {
    return Intl.message(
      'Add another language',
      name: 'addAnotherLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Skill Name`
  String get skillName {
    return Intl.message(
      'Skill Name',
      name: 'skillName',
      desc: '',
      args: [],
    );
  }

  /// `Remove this language`
  String get removeThisLanguage {
    return Intl.message(
      'Remove this language',
      name: 'removeThisLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Your Links`
  String get yourLinks {
    return Intl.message(
      'Your Links',
      name: 'yourLinks',
      desc: '',
      args: [],
    );
  }

  /// `Add another link`
  String get addAnotherLink {
    return Intl.message(
      'Add another link',
      name: 'addAnotherLink',
      desc: '',
      args: [],
    );
  }

  /// `Link Name`
  String get linkName {
    return Intl.message(
      'Link Name',
      name: 'linkName',
      desc: '',
      args: [],
    );
  }

  /// `Link URL`
  String get linkUrl {
    return Intl.message(
      'Link URL',
      name: 'linkUrl',
      desc: '',
      args: [],
    );
  }

  /// `Remove this link`
  String get removeThisLink {
    return Intl.message(
      'Remove this link',
      name: 'removeThisLink',
      desc: '',
      args: [],
    );
  }

  /// `Personal Details`
  String get personalDetails {
    return Intl.message(
      'Personal Details',
      name: 'personalDetails',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Job Role`
  String get jobRole {
    return Intl.message(
      'Job Role',
      name: 'jobRole',
      desc: '',
      args: [],
    );
  }

  /// `eg. Software Developer`
  String get jobRoleHint {
    return Intl.message(
      'eg. Software Developer',
      name: 'jobRoleHint',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Summary`
  String get summary {
    return Intl.message(
      'Summary',
      name: 'summary',
      desc: '',
      args: [],
    );
  }

  /// `eg. I am a motivated IT graduate looking forward...`
  String get summaryHint {
    return Intl.message(
      'eg. I am a motivated IT graduate looking forward...',
      name: 'summaryHint',
      desc: '',
      args: [],
    );
  }

  /// `Your Skills`
  String get yourSkills {
    return Intl.message(
      'Your Skills',
      name: 'yourSkills',
      desc: '',
      args: [],
    );
  }

  /// `Add another skill`
  String get addAnotherSkill {
    return Intl.message(
      'Add another skill',
      name: 'addAnotherSkill',
      desc: '',
      args: [],
    );
  }

  /// `Remove this skill`
  String get removeThisSkill {
    return Intl.message(
      'Remove this skill',
      name: 'removeThisSkill',
      desc: '',
      args: [],
    );
  }

  /// `School`
  String get school {
    return Intl.message(
      'School',
      name: 'school',
      desc: '',
      args: [],
    );
  }

  /// `Degree`
  String get degree {
    return Intl.message(
      'Degree',
      name: 'degree',
      desc: '',
      args: [],
    );
  }

  /// `Remove this education`
  String get removeThisEducation {
    return Intl.message(
      'Remove this education',
      name: 'removeThisEducation',
      desc: '',
      args: [],
    );
  }

  /// `Test`
  String get test {
    return Intl.message(
      'Test',
      name: 'test',
      desc: '',
      args: [],
    );
  }

  /// `Function Title`
  String get functionTitle {
    return Intl.message(
      'Function Title',
      name: 'functionTitle',
      desc: '',
      args: [],
    );
  }

  /// `Remove this activity`
  String get removeThisActivity {
    return Intl.message(
      'Remove this activity',
      name: 'removeThisActivity',
      desc: '',
      args: [],
    );
  }

  /// `John`
  String get firstNameHint {
    return Intl.message(
      'John',
      name: 'firstNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Doe`
  String get lastNameHint {
    return Intl.message(
      'Doe',
      name: 'lastNameHint',
      desc: '',
      args: [],
    );
  }

  /// `(123) 234-5678`
  String get phoneNumberHint {
    return Intl.message(
      '(123) 234-5678',
      name: 'phoneNumberHint',
      desc: '',
      args: [],
    );
  }

  /// `johndoe@gmail.com`
  String get emailAddressHint {
    return Intl.message(
      'johndoe@gmail.com',
      name: 'emailAddressHint',
      desc: '',
      args: [],
    );
  }

  /// `Linkedin`
  String get linkNameHint {
    return Intl.message(
      'Linkedin',
      name: 'linkNameHint',
      desc: '',
      args: [],
    );
  }

  /// `https://www.linkedin.com/in/johndoe/`
  String get linkUrlHint {
    return Intl.message(
      'https://www.linkedin.com/in/johndoe/',
      name: 'linkUrlHint',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
