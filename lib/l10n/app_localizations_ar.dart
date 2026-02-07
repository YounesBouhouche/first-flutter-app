// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get home => 'الرئيسية';

  @override
  String get todo_list => 'قائمة المهام';

  @override
  String get add_todo => 'إضافة مهمة';

  @override
  String get edit_todo => 'تعديل المهمة';

  @override
  String get title => 'العنوان';

  @override
  String get title_cant_be_empty => 'العنوان لا يمكن أن يكون فارغًا';

  @override
  String get cancel => 'إلغاء';

  @override
  String get ok => 'موافق';

  @override
  String get save => 'حفظ';

  @override
  String get profile => 'الملف الشخصي';

  @override
  String get settings => 'الإعدادات';

  @override
  String get theme => 'السمة';

  @override
  String get theme_description => 'اختر سمة التطبيق';

  @override
  String get light => 'فاتح';

  @override
  String get dark => 'داكن';

  @override
  String get system => 'النظام';

  @override
  String get dynamic_colors => 'ألوان ديناميكية';

  @override
  String get dynamic_colors_description =>
      'استخدم ألوانًا ديناميكية على الأجهزة المدعومة';

  @override
  String get language => 'اللغة';

  @override
  String get language_description => 'اختر لغة التطبيق';

  @override
  String get system_default => 'افتراضي النظام';

  @override
  String get english => 'الإنجليزية';

  @override
  String get french => 'الفرنسية';

  @override
  String get arabic => 'العربية';
}
