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
  String get todo_not_found => 'المهمة غير موجودة';

  @override
  String get mark_as_done => 'وضع علامة كمكتملة';

  @override
  String get mark_as_undone => 'وضع علامة كغير مكتملة';

  @override
  String id_param(Object id) {
    return 'المعرف: $id';
  }

  @override
  String title_param(Object title) {
    return 'العنوان: $title';
  }

  @override
  String status_param(Object status) {
    return 'الحالة: $status';
  }

  @override
  String get done => 'مكتملة';

  @override
  String get undone => 'غير مكتملة';

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
      'استخدم الألوان الديناميكية على الأجهزة المدعومة';

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
