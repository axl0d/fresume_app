import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fresume_app/apis/auth.dart';
import 'package:fresume_app/apis/resume.dart';
import 'package:fresume_app/global/models/pdf_model.dart';

final resumeApi = Provider<PdfModelApi?>((ref) {
  return ref.watch(authStateChangeProvider).when(
    data: (data) {
      if (data != null) {
        return PdfModelApi(data.uid, ref.read(firebaseFirestoreProvider));
      }

      return null;
    },
    loading: () {
      return null;
    },
    error: (e, s) {
      throw UnimplementedError();
    },
  );
});

final tempPdfProvider = StateProvider<PdfModel>((ref) {
  return PdfModel.createEmpty().copyWith(pdfId: 'noSave');
});

final pdfProvider = StateNotifierProvider<PdfStateNotifier, PdfModel>((ref) {
  return PdfStateNotifier();
});

class PdfStateNotifier extends StateNotifier<PdfModel> {
  PdfStateNotifier() : super(PdfModel.createEmpty().copyWith(pdfId: 'noSave'));

  void editPdf(PdfModel pdfModel) {
    state = pdfModel;
  }

  void editPersonal(Personal personal) {
    state = state.copyWith(resumePersonal: personal);
  }

  void editSummary(Summary summary) {
    state = state.copyWith(resumeSummary: summary);
  }

  void addEmploymentSection(Section section) {
    final sections = state.employment!;

    state = state.copyWith(employment: sections..add(section));
  }

  void removeEmploymentSection(Section section) {
    final sections = state.employment!;

    state = state.copyWith(employment: sections..remove(section));
  }

  void editEmploymentSection(Section section) {
    final sections = state.employment!;

    for (var i = 0; i < sections.length; i++) {
      if (sections[i].sectionId == section.sectionId) {
        sections[i] = section;
        break;
      }
    }

    state = state.copyWith(employment: sections);
  }

  void addEducationSection(Section section) {
    final sections = state.education!;

    state = state.copyWith(education: sections..add(section));
  }

  void removeEducationSection(Section section) {
    final sections = state.education!;

    state = state.copyWith(education: sections..remove(section));
  }

  void editEducationSection(Section section) {
    final sections = state.education!;

    for (var i = 0; i < sections.length; i++) {
      if (sections[i].sectionId == section.sectionId) {
        sections[i] = section;
        break;
      }
    }
    state = state.copyWith(education: sections);
  }

  void addActivitySection(Section section) {
    final sections = state.activities!;

    state = state.copyWith(activities: sections..add(section));
  }

  void removeActivitySection(Section section) {
    final sections = state.activities!;

    state = state.copyWith(activities: sections..remove(section));
  }

  void editActivitySection(Section section) {
    final sections = state.activities!;

    for (var i = 0; i < sections.length; i++) {
      if (sections[i].sectionId == section.sectionId) {
        sections[i] = section;
        break;
      }
    }
    state = state.copyWith(activities: sections);
  }

  void addSkill(Skill skill) {
    final skills = state.skills!;

    state = state.copyWith(skills: skills..add(skill));
  }

  void removeSkill(Skill skill) {
    final skills = state.skills!;

    state = state.copyWith(skills: skills..remove(skill));
  }

  void editSkill(Skill skill) {
    final skills = state.skills!;

    for (var i = 0; i < skills.length; i++) {
      if (skills[i].skillId == skill.skillId) {
        skills[i] = skill;
        break;
      }
    }

    state = state.copyWith(skills: skills);
  }

  void addLanguage(Skill skill) {
    final languages = state.languages!;

    state = state.copyWith(languages: languages..add(skill));
  }

  void removeLanguage(Skill skill) {
    final languages = state.languages!;

    state = state.copyWith(languages: languages..remove(skill));
  }

  void editLanguage(Skill skill) {
    final languages = state.languages!;

    for (var i = 0; i < languages.length; i++) {
      if (languages[i].skillId == skill.skillId) {
        languages[i] = skill;
        break;
      }
    }

    state = state.copyWith(languages: languages);
  }

  void addLink(Links link) {
    final links = state.links!;

    state = state.copyWith(links: links..add(link));
  }

  void removeLink(Links link) {
    final links = state.links!;

    state = state.copyWith(links: links..remove(link));
  }

  void editLink(Links link) {
    final links = state.links!;

    for (var i = 0; i < links.length; i++) {
      if (links[i].linksId == link.linksId) {
        links[i] = link;
        break;
      }
    }

    state = state.copyWith(links: links);
  }
}
