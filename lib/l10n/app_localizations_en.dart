// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get todo_list => 'Todo List';

  @override
  String get add_todo => 'Add Todo';

  @override
  String get edit_todo => 'Edit Todo';

  @override
  String get title => 'Title';

  @override
  String get title_cant_be_empty => 'Title can\'t be empty';

  @override
  String get cancel => 'Cancel';

  @override
  String get ok => 'OK';

  @override
  String get save => 'Save';

  @override
  String get todo_not_found => 'Todo not found';

  @override
  String get mark_as_done => 'Mark as Done';

  @override
  String get mark_as_undone => 'Mark as Undone';

  @override
  String id_param(Object id) {
    return 'ID: $id';
  }

  @override
  String title_param(Object title) {
    return 'Title: $title';
  }

  @override
  String status_param(Object status) {
    return 'Status: $status';
  }

  @override
  String get done => 'Done';

  @override
  String get undone => 'Undone';

  @override
  String get profile => 'Profile';

  @override
  String get settings => 'Settings';

  @override
  String get theme => 'Theme';

  @override
  String get theme_description => 'Select app theme';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get system => 'System';

  @override
  String get dynamic_colors => 'Dynamic Colors';

  @override
  String get dynamic_colors_description =>
      'Use dynamic colors on supported devices';

  @override
  String get language => 'Language';

  @override
  String get language_description => 'Select app language';

  @override
  String get system_default => 'System Default';

  @override
  String get english => 'English';

  @override
  String get french => 'French';

  @override
  String get arabic => 'Arabic';
}
