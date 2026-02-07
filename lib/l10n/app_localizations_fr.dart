// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get home => 'Accueil';

  @override
  String get todo_list => 'Liste des tâches';

  @override
  String get add_todo => 'Ajouter une tâche';

  @override
  String get edit_todo => 'Modifier la tâche';

  @override
  String get title => 'Titre';

  @override
  String get title_cant_be_empty => 'Le titre ne peut pas être vide';

  @override
  String get cancel => 'Annuler';

  @override
  String get ok => 'OK';

  @override
  String get save => 'Enregistrer';

  @override
  String get profile => 'Profil';

  @override
  String get settings => 'Paramètres';

  @override
  String get theme => 'Thème';

  @override
  String get theme_description => 'Sélectionnez le thème de l\'application';

  @override
  String get light => 'Clair';

  @override
  String get dark => 'Sombre';

  @override
  String get system => 'Système';

  @override
  String get dynamic_colors => 'Couleurs dynamiques';

  @override
  String get dynamic_colors_description =>
      'Utilisez des couleurs dynamiques sur les appareils compatibles';

  @override
  String get language => 'Langue';

  @override
  String get language_description => 'Sélectionnez la langue de l\'application';

  @override
  String get system_default => 'Par défaut du système';

  @override
  String get english => 'Anglais';

  @override
  String get french => 'Français';

  @override
  String get arabic => 'Arabe';
}
