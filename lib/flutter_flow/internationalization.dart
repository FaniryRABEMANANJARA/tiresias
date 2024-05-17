import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'de', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? deText = '',
    String? arText = '',
  }) =>
      [enText, esText, deText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // loginPage
  {
    'o07j3mgv': {
      'en': 'Bienvenue à nouveau',
      'ar': 'البدء',
      'de': 'Loslegen',
      'es': 'Empezar',
    },
    'fzxvw3mu': {
      'en': 'Connectez-vous pour accéder à votre compte.',
      'ar': 'قم بإنشاء حسابك أدناه.',
      'de': 'Erstellen Sie unten Ihr Konto.',
      'es': 'Crea tu cuenta a continuación.',
    },
    'a9j78va9': {
      'en': 'Adresse e-mail',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'i7f18cve': {
      'en': 'Saisissez votre email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'wztjmbn8': {
      'en': 'Mot de passe',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'es': 'Contraseña',
    },
    'lw1jpm1f': {
      'en': 'Saisissez votre mot de passe...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    'm2xyjvuf': {
      'en': 'Mot de passe oublié ?',
      'ar': 'هل نسيت كلمة السر؟',
      'de': 'Passwort vergessen?',
      'es': '¿Has olvidado tu contraseña?',
    },
    'qbmoi1av': {
      'en': 'Connexion',
      'ar': 'تسجيل الدخول',
      'de': 'Anmeldung',
      'es': 'Acceso',
    },
    'cjqb8ial': {
      'en': 'Vous n\'avez pas de compte ?',
      'ar': 'ليس لديك حساب؟',
      'de': 'Sie haben kein Konto?',
      'es': '¿No tienes una cuenta?',
    },
    'a0iimirx': {
      'en': 'Créer',
      'ar': 'ليس لديك حساب؟',
      'de': 'Sie haben kein Konto?',
      'es': '¿No tienes una cuenta?',
    },
    '1zqiw31h': {
      'en': 'Continuer en tant qu\'invité',
      'ar': 'تواصل كضيف',
      'de': 'Als Gast fortfahren',
      'es': 'Continua como invitado',
    },
    '2bb3vct7': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // registerAccount
  {
    'oitrrwgg': {
      'en': 'Créer votre compte ci-dessous.',
      'ar': 'قم بإنشاء حسابك أدناه.',
      'de': 'Erstellen Sie unten Ihr Konto.',
      'es': 'Crea tu cuenta a continuación.',
    },
    'gcwdqm4g': {
      'en': 'Adresse email',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'iam0xgwx': {
      'en': 'Entrez votre email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'bqv15dcf': {
      'en': 'Mot de passe',
      'ar': 'كلمة المرور',
      'de': 'Passwort',
      'es': 'Contraseña',
    },
    'joih97mn': {
      'en': 'Entrez votre mot de passe...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    'rzpiwq9p': {
      'en': 'Confirmer le mot de passe',
      'ar': 'تأكيد كلمة المرور',
      'de': 'Kennwort bestätigen',
      'es': 'Confirmar contraseña',
    },
    'eyfkffka': {
      'en': 'Entrez votre mot de passe...',
      'ar': 'ادخل رقمك السري...',
      'de': 'Geben Sie Ihr Passwort ein...',
      'es': 'Ingresa tu contraseña...',
    },
    '5kmjfwsk': {
      'en': 'Créer un compte',
      'ar': 'إنشاء حساب',
      'de': 'Benutzerkonto erstellen',
      'es': 'Crear una cuenta',
    },
    '3twynvfz': {
      'en': 'Se connecter',
      'ar': 'هل لديك حساب؟',
      'de': 'Sie haben bereits ein Konto?',
      'es': '¿Ya tienes una cuenta?',
    },
    '9ssznj0g': {
      'en': 'Vous avez déjà un compte ?',
      'ar': 'هل لديك حساب؟',
      'de': 'Sie haben bereits ein Konto?',
      'es': '¿Ya tienes una cuenta?',
    },
    '3ugmx2zp': {
      'en': 'Continuer en tant qu\'invité',
      'ar': 'تواصل كضيف',
      'de': 'Als Gast fortfahren',
      'es': 'Continua como invitado',
    },
    'momge5oj': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // completeProfile
  {
    'yhcaf7r2': {
      'en': 'Complete Profile',
      'ar': 'الملف الشخصي الكامل',
      'de': 'Vollständiges Profil',
      'es': 'Perfil completo',
    },
    'r6npjsue': {
      'en':
          'Téléchargez une photo pour que nous puissions vous identifier facilement.',
      'ar': 'قم بتحميل صورة لنا للتعرف عليك بسهولة.',
      'de':
          'Laden Sie ein Foto hoch, damit wir Sie leicht identifizieren können.',
      'es': 'Sube una foto para que te identifiquemos fácilmente.',
    },
    'sdptn7dd': {
      'en': 'Nom et prénom(s)',
      'ar': 'اسمك',
      'de': 'Dein Name',
      'es': 'Tu nombre',
    },
    'n636qnrx': {
      'en': 'Votre âge',
      'ar': 'عمرك',
      'de': 'Ihr Alter',
      'es': 'Su edad',
    },
    's7yvjzbs': {
      'en': 'i.e. 34',
      'ar': 'أي 34',
      'de': 'dh 34',
      'es': 'es decir, 34',
    },
    '72ii0waq': {
      'en': 'Bio',
      'ar': 'لقبك',
      'de': 'Dein Titel',
      'es': 'Tu título',
    },
    'pf8glhkg': {
      'en': '',
      'ar': 'ماهوموقعك؟',
      'de': 'Wo befinden Sie sich?',
      'es': '¿Cual es tu posicion?',
    },
    'hbhd3bdt': {
      'en': 'Valider',
      'ar': 'الملف الشخصي الكامل',
      'de': 'Vollständiges Profil',
      'es': 'Perfil completo',
    },
    'w75dikic': {
      'en': 'Sautez pour l\'instant',
      'ar': 'تخطي في الوقت الراهن',
      'de': 'Für jetzt überspringen',
      'es': 'Saltar por ahora',
    },
    '1eac148w': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ew7dbn3s': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jhhlgzk5': {
      'en': 'Field is required',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4k3jnl38': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // forgotPassword
  {
    'g416xg9f': {
      'en': 'Mot de passe oublié',
      'ar': 'هل نسيت كلمة السر',
      'de': 'Passwort vergessen',
      'es': 'Has olvidado tu contraseña',
    },
    'xaiad71o': {
      'en':
          'Saisissez l\'adresse électronique associée à votre compte et nous vous enverrons un code de vérification.',
      'ar': 'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رمز التحقق.',
      'de':
          'Geben Sie die mit Ihrem Konto verknüpfte E-Mail-Adresse ein und wir senden Ihnen einen Bestätigungscode.',
      'es':
          'Introduce el correo electrónico asociado a tu cuenta y te enviaremos un código de verificación.',
    },
    'u4nuk910': {
      'en': 'Adresse email',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    '37kotxi0': {
      'en': 'Saisissez votre email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'hiwpaze1': {
      'en': 'Envoyer le lien de réinitialisation',
      'ar': 'أرسل رابط إعادة التعيين',
      'de': 'Zurücksetzen-Link senden',
      'es': 'Enviar enlace de reinicio',
    },
    '598b8d3m': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // onboarding
  {
    'i8hl2uua': {
      'en': 'Création de budgets',
      'ar': 'إنشاء الميزانيات',
      'de': 'Erstellen Sie Budgets',
      'es': 'Crear presupuestos',
    },
    'hxtwax0y': {
      'en':
          'Créez des budgets auxquels vous pouvez rattacher les transactions afin d\'en faciliter le suivi.',
      'ar':
          'قم بإنشاء ميزانيات يمكنك ربط المعاملات بها أيضًا من أجل التتبع السهل.',
      'de':
          'Erstellen Sie Budgets, mit denen Sie auch Transaktionen verknüpfen können, um sie einfach nachverfolgen zu können.',
      'es':
          'Cree presupuestos en los que también pueda vincular transacciones para facilitar el seguimiento.',
    },
    'mjy3ljln': {
      'en': 'Suivre l\'évolution des dépenses',
      'ar': 'تتبع الإنفاق',
      'de': 'Behalten Sie die Ausgaben im Auge',
      'es': 'Mantenga un registro de los gastos',
    },
    'uf9k1spp': {
      'en':
          'Ajoutez facilement des transactions et associez-les aux budgets qui ont été créés.',
      'ar': 'أضف المعاملات بسهولة وربطها بالميزانيات التي تم إنشاؤها.',
      'de':
          'Fügen Sie ganz einfach Transaktionen hinzu und verknüpfen Sie sie mit erstellten Budgets.',
      'es':
          'Agregue fácilmente transacciones y asócielas con los presupuestos que se han creado.',
    },
    '9c4outzf': {
      'en': 'Analyse du budget',
      'ar': 'تحليل الميزانية',
      'de': 'Budgetanalyse',
      'es': 'Análisis de presupuesto',
    },
    'q30ina4f': {
      'en':
          'Sachez où en sont vos budgets et comment ils peuvent être ajustés.',
      'ar': 'تعرف على مكان ميزانياتك وكيف يمكن تعديلها.',
      'de': 'Wissen, wo Ihre Budgets sind und wie sie angepasst werden können.',
      'es': 'Sepa dónde están sus presupuestos y cómo se pueden ajustar.',
    },
    'ypt7b97g': {
      'en': 'Créez votre budget',
      'ar': 'إنشاء ميزانيتك',
      'de': 'Erstellen Sie Ihr Budget',
      'es': 'Crea tu presupuesto',
    },
    'oo0kk9qe': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // createBudgetBegin
  {
    'xod9iwab': {
      'en': 'Création du budget',
      'ar': 'إنشاء الميزانية',
      'de': 'Budget erstellen',
      'es': 'Crear presupuesto',
    },
    'wih71x51': {
      'en': 'Montant',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
    },
    'qk15nsmc': {
      'en': 'Nom du budget',
      'ar': 'اسم الميزانية',
      'de': 'Budgetname',
      'es': 'Nombre del presupuesto',
    },
    'iphvcuwc': {
      'en': 'Description',
      'ar': 'وصف',
      'de': 'Beschreibung',
      'es': 'Descripción',
    },
    'v2shqq3z': {
      'en': 'Établir un budget',
      'ar': 'إنشاء الميزانية',
      'de': 'Budget erstellen',
      'es': 'Crear presupuesto',
    },
    'knu0nxbp': {
      'en': 'Tapez ci-dessus pour compléter la demande',
      'ar': 'اضغط أعلاه لإكمال الطلب',
      'de': 'Tippen Sie oben, um die Anfrage abzuschließen',
      'es': 'Toque arriba para completar la solicitud',
    },
    '79au6dyg': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال مبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
    },
    'cs1cy7tg': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // MY_Card
  {
    'xn2so8km': {
      'en': 'My Card',
      'ar': 'بطاقتي',
      'de': 'Meine Karte',
      'es': 'Mi tarjeta',
    },
    '6t7n9ugd': {
      'en': 'Balance',
      'ar': 'الرصيد',
      'de': 'Gleichgewicht',
      'es': 'Equilibrio',
    },
    'h3086ma4': {
      'en': '\$',
      'ar': '7630 دولارًا',
      'de': '\$7.630',
      'es': '\$7,630',
    },
    'lr97k2rc': {
      'en': '**** 0149',
      'ar': '**** 0149',
      'de': '**** 0149',
      'es': '**** 0149',
    },
    'l9racj60': {
      'en': '05/25',
      'ar': '05/25',
      'de': '25.05',
      'es': '25/05',
    },
    '9b0j67se': {
      'en': 'Income',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'axrvkhrv': {
      'en': '+\$12,402',
      'ar': '+ 12402 دولار',
      'de': '+12.402 \$',
      'es': '+\$12,402',
    },
    '0d7w9e0i': {
      'en': '4.5% ',
      'ar': '4.5٪',
      'de': '4,5 %',
      'es': '4,5%',
    },
    'mggh8wu7': {
      'en': 'Spending',
      'ar': 'الإنفاق',
      'de': 'Ausgaben',
      'es': 'Gasto',
    },
    'c5bszisf': {
      'en': '-\$8,392',
      'ar': '- 8،392 دولارًا',
      'de': '-8.392 \$',
      'es': '-\$8,392',
    },
    '85pb8msl': {
      'en': '4.5% ',
      'ar': '4.5٪',
      'de': '4,5 %',
      'es': '4,5%',
    },
    'yet7zk5d': {
      'en': 'Quick Service',
      'ar': 'خدمة سريعة',
      'de': 'Schneller Service',
      'es': 'Servicio rapido',
    },
    '8bnd6lco': {
      'en': 'Transferts',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'roobc02h': {
      'en': 'Pause Card',
      'ar': 'بطاقة وقفة',
      'de': 'Pausenkarte',
      'es': 'Tarjeta de pausa',
    },
    '27pb7ji4': {
      'en': 'Transaction',
      'ar': 'عملية',
      'de': 'Transaktion',
      'es': 'Transacción',
    },
    'xs4cn7uk': {
      'en': 'Income',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'm8rhanhc': {
      'en': 'Carte',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // MY_Budgets
  {
    'cd0zp71n': {
      'en': 'Mon budget',
      'ar': 'ميزانيتي',
      'de': 'Mein Budget',
      'es': 'Mi presupuesto',
    },
    'hfwbiivj': {
      'en': 'Income',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'jjj3ydb1': {
      'en': '+\$12,402',
      'ar': '+ 12402 دولار',
      'de': '+12.402 \$',
      'es': '+\$12,402',
    },
    'ns4vt604': {
      'en': '4.5% ',
      'ar': '4.5٪',
      'de': '4,5 %',
      'es': '4,5%',
    },
    'wcsc04wg': {
      'en': 'Spending',
      'ar': 'الإنفاق',
      'de': 'Ausgaben',
      'es': 'Gasto',
    },
    'a5zzlh8f': {
      'en': '-\$8,392',
      'ar': '- 8،392 دولارًا',
      'de': '-8.392 \$',
      'es': '-\$8,392',
    },
    '8xnbsdnb': {
      'en': '4.5% ',
      'ar': '4.5٪',
      'de': '4,5 %',
      'es': '4,5%',
    },
    'c81i1ybg': {
      'en': 'Total Spent',
      'ar': 'إجمال الصرف',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    'ah4t7cpx': {
      'en': 'Advertising Budget',
      'ar': 'ميزانية الإعلان',
      'de': 'Werbebudget',
      'es': 'Presupuesto publicitario',
    },
    '0tsohlub': {
      'en': '\$3,000',
      'ar': '3000 دولار',
      'de': '3.000 \$',
      'es': '\$3,000',
    },
    '5y1u9kxg': {
      'en': '4 Days Left',
      'ar': 'باقي 4 ايام',
      'de': 'noch 4 Tage',
      'es': '4 días restantes',
    },
    '4jknsif6': {
      'en': 'Total Spent',
      'ar': 'إجمال الصرف',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    'o9rmbnd7': {
      'en': '\$2,502',
      'ar': '2،502 دولار',
      'de': '2.502 \$',
      'es': '\$2,502',
    },
    'fn6kvat8': {
      'en': 'Advertising Budget',
      'ar': 'ميزانية الإعلان',
      'de': 'Werbebudget',
      'es': 'Presupuesto publicitario',
    },
    '6uht91yb': {
      'en': '\$3,000',
      'ar': '3000 دولار',
      'de': '3.000 \$',
      'es': '\$3,000',
    },
    '1qm6rhod': {
      'en': '4 Days Left',
      'ar': 'باقي 4 ايام',
      'de': 'noch 4 Tage',
      'es': '4 días restantes',
    },
    '65tvvjcw': {
      'en': 'Total Spent',
      'ar': 'إجمال الصرف',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    'c03678eq': {
      'en': '\$2,502',
      'ar': '2،502 دولار',
      'de': '2.502 \$',
      'es': '\$2,502',
    },
    'ofz2zvlc': {
      'en': 'Wallet',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // paymentDetails
  {
    'j0yzgf4n': {
      'en': 'Details',
      'ar': 'تفاصيل',
      'de': 'Einzelheiten',
      'es': 'Detalles',
    },
    'zv72ekdw': {
      'en': 'Montant',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
    },
    '0rjyjwed': {
      'en': 'Vendeur',
      'ar': 'بائع',
      'de': 'Verkäufer',
      'es': 'Vendedor',
    },
    'eeyn6dk2': {
      'en': 'Date',
      'ar': 'متى',
      'de': 'Wann',
      'es': 'Cuándo',
    },
    'lccxx6eu': {
      'en': 'Raison',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
    },
    'jzyax4hn': {
      'en': 'Dépensé par',
      'ar': 'أنفقه',
      'de': 'Verbracht von',
      'es': 'gastado por',
    },
    'i4r9jqwn': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // MY_profilePage
  {
    'f1bvbey3': {
      'en': 'Mon compte',
      'ar': 'حسابي',
      'de': 'Mein Konto',
      'es': 'Mi cuenta',
    },
    'i61y9ibx': {
      'en': 'Modifier Profil',
      'ar': 'تعديل الملف الشخصي',
      'de': 'Profil bearbeiten',
      'es': 'Editar perfil',
    },
    '03k0vw86': {
      'en': 'Modifier le mot de passe',
      'ar': 'تغيير كلمة المرور',
      'de': 'Kennwort ändern',
      'es': 'Cambia la contraseña',
    },
    '6w6wv95p': {
      'en': 'Réglages de la notification',
      'ar': 'إعدادات الإشعار',
      'de': 'Benachrichtigungseinstellungen',
      'es': 'Configuración de las notificaciones',
    },
    '9aogde79': {
      'en': 'Mon portefeuille',
      'ar': 'درس تعليمي',
      'de': 'Lernprogramm',
      'es': 'Tutorial',
    },
    '7osgic41': {
      'en': 'Didacticiel',
      'ar': 'درس تعليمي',
      'de': 'Lernprogramm',
      'es': 'Tutorial',
    },
    'eojlfs66': {
      'en': 'Politique de confidentialité',
      'ar': 'سياسة الخصوصية',
      'de': 'Datenschutz-Bestimmungen',
      'es': 'Política de privacidad',
    },
    '2ll42t1u': {
      'en': 'Mode sombre',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8d386226': {
      'en': 'Light Mode',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8srr2k0j': {
      'en': 'Profil',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // budgetDetails
  {
    '92alvg49': {
      'en': '\$25,000',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p0gf1lfy': {
      'en': 'Par mois',
      'ar': 'كل شهر',
      'de': 'Pro Monat',
      'es': 'Por mes',
    },
    'ti7ipegi': {
      'en': 'Total ',
      'ar': 'إجمال الصرف',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    'ifi6fmsa': {
      'en': 'Transactions',
      'ar': 'المعاملات',
      'de': 'Transaktionen',
      'es': 'Actas',
    },
    'ak9m8szp': {
      'en': 'Income',
      'ar': 'دخل',
      'de': 'Einkommen',
      'es': 'Ingreso',
    },
    'l53kroui': {
      'en': '',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // transferComplete
  {
    'xf8d4sm8': {
      'en': 'Transfer Complete',
      'ar': 'نقل كامل',
      'de': 'Übertragung vollständig',
      'es': 'transferencia completa',
    },
    'iq9jjji8': {
      'en':
          'Great work, you successfully transferred funds. It may take a few days for the funds to leave your account.',
      'ar':
          'عمل رائع ، لقد قمت بتحويل الأموال بنجاح. قد يستغرق خروج الأموال من حسابك بضعة أيام.',
      'de':
          'Großartige Arbeit, Sie haben erfolgreich Geld überwiesen. Es kann einige Tage dauern, bis das Geld von Ihrem Konto abgebucht wird.',
      'es':
          'Buen trabajo, transfirió fondos con éxito. Los fondos pueden tardar unos días en salir de su cuenta.',
    },
    'wrbg19ed': {
      'en': 'Okay',
      'ar': 'تمام',
      'de': 'Okay',
      'es': 'Okey',
    },
    'ndkybnrt': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // transferFunds
  {
    'pe3o18oh': {
      'en': 'Transfer Funds',
      'ar': 'تحويل الأموال',
      'de': 'Geld überweisen',
      'es': 'Transferir fondos',
    },
    'kyzwrfh4': {
      'en': 'Balance',
      'ar': 'الرصيد',
      'de': 'Gleichgewicht',
      'es': 'Equilibrio',
    },
    'zq4ozx20': {
      'en': '\$7,630',
      'ar': '7630 دولارًا',
      'de': '\$7.630',
      'es': '\$7,630',
    },
    'qukh7yo1': {
      'en': '**** 0149',
      'ar': '**** 0149',
      'de': '**** 0149',
      'es': '**** 0149',
    },
    'n87hkr7d': {
      'en': '05/25',
      'ar': '05/25',
      'de': '25.05',
      'es': '25/05',
    },
    '3ct4fj7p': {
      'en': 'Change Account',
      'ar': 'تغير الحساب',
      'de': 'Account wechseln',
      'es': 'Cambiar cuenta',
    },
    'w4smsh2i': {
      'en': 'Internal Transfer',
      'ar': 'التحويل الداخلي',
      'de': 'Interner Transfer',
      'es': 'Transferencia interna',
    },
    '6uxty3hy': {
      'en': 'External Transfer',
      'ar': 'التحويل الخارجي',
      'de': 'Externe Übertragung',
      'es': 'Transferencia externa',
    },
    'p4ngma0d': {
      'en': 'ACH Payment',
      'ar': 'دفع ACH',
      'de': 'ACH-Zahlung',
      'es': 'Pago CCA',
    },
    'uxo87fjc': {
      'en': 'Transfer Type',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fddma8xl': {
      'en': 'Select Account',
      'ar': 'حدد حساب',
      'de': 'Konto auswählen',
      'es': 'Seleccionar cuenta',
    },
    '23l6kqgm': {
      'en': 'Account ****2010',
      'ar': 'الحساب **** 2010',
      'de': 'Konto ****2010',
      'es': 'Cuenta ****2010',
    },
    '3hwdfadf': {
      'en': 'Account ****2011',
      'ar': 'الحساب **** 2011',
      'de': 'Konto ****2011',
      'es': 'Cuenta ****2011',
    },
    'xvj00xg1': {
      'en': 'Account ****2012',
      'ar': 'الحساب **** 2012',
      'de': 'Konto ****2012',
      'es': 'Cuenta ****2012',
    },
    'ok5xluvk': {
      'en': 'Choose an Account',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ynie0pc5': {
      'en': '\$ Amount',
      'ar': 'المبلغ بالدولار',
      'de': '\$ Betrag',
      'es': '\$ Monto',
    },
    'wngoi0v4': {
      'en': 'Your new account balance is:',
      'ar': 'رصيد حسابك الجديد هو:',
      'de': 'Ihr neuer Kontostand beträgt:',
      'es': 'El nuevo saldo de su cuenta es:',
    },
    'g6bfec2g': {
      'en': '\$7,630',
      'ar': '7630 دولارًا',
      'de': '\$7.630',
      'es': '\$7,630',
    },
    'xaw2jdst': {
      'en': 'Send Transfer',
      'ar': 'أرسل حوالة',
      'de': 'Überweisung senden',
      'es': 'Enviar transferencia',
    },
    'xku4zxbe': {
      'en': 'Tap above to complete transfer',
      'ar': 'اضغط أعلاه لإكمال النقل',
      'de': 'Tippen Sie oben, um die Übertragung abzuschließen',
      'es': 'Toque arriba para completar la transferencia',
    },
    'imaejg7x': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // requestFunds
  {
    'wv1862li': {
      'en': 'Demande de fonds',
      'ar': 'طلب التمويل',
      'de': 'Geld anfordern',
      'es': 'Pedír fondos',
    },
    't2kyh5p5': {
      'en': '\$ Montant',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wwjahvpl': {
      'en': 'Office Budget',
      'ar': 'ميزانية المكتب',
      'de': 'Bürobudget',
      'es': 'Presupuesto de oficina',
    },
    'sx0vvzxd': {
      'en': 'External Transfer',
      'ar': 'التحويل الخارجي',
      'de': 'Externe Übertragung',
      'es': 'Transferencia externa',
    },
    'ai453kej': {
      'en': 'ACH Payment',
      'ar': 'دفع ACH',
      'de': 'ACH-Zahlung',
      'es': 'Pago CCA',
    },
    'wo9cebk7': {
      'en': 'Séléctionner Transfert',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rcevwwju': {
      'en': 'Raison',
      'ar': 'سبب',
      'de': 'Grund',
      'es': 'Razón',
    },
    'uvrt7im0': {
      'en': 'Demande de fonds',
      'ar': 'طلب التمويل',
      'de': 'Geld anfordern',
      'es': 'Pedír fondos',
    },
    '7y89msg9': {
      'en': 'Tapez ci-dessus pour compléter la demande',
      'ar': 'اضغط أعلاه لإكمال الطلب',
      'de': 'Tippen Sie oben, um die Anfrage abzuschließen',
      'es': 'Toque arriba para completar la solicitud',
    },
    'xk0bwox3': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // createBudget
  {
    'smbfunwu': {
      'en': 'Création du budget',
      'ar': 'إنشاء الميزانية',
      'de': 'Budget erstellen',
      'es': 'Crear presupuesto',
    },
    'fcgw57wj': {
      'en': 'Montant',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
    },
    'onjddqdc': {
      'en': 'Nom du budget',
      'ar': 'اسم الميزانية',
      'de': 'Budgetname',
      'es': 'Nombre del presupuesto',
    },
    'sqg52nmi': {
      'en': 'Description',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0iex13x2': {
      'en': 'Établir un budget',
      'ar': 'إنشاء الميزانية',
      'de': 'Budget erstellen',
      'es': 'Crear presupuesto',
    },
    'jy5q09h1': {
      'en': 'Tapez ci-dessus pour compléter la demande',
      'ar': 'اضغط أعلاه لإكمال الطلب',
      'de': 'Tippen Sie oben, um die Anfrage abzuschließen',
      'es': 'Toque arriba para completar la solicitud',
    },
    '8hzaiw1r': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال مبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
    },
    'mos068mm': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // transaction_ADD
  {
    'qywon4k1': {
      'en': 'Ajouter une transaction',
      'ar': 'أضف معاملة',
      'de': 'Transaktion hinzufügen',
      'es': 'Agregar transacción',
    },
    'bh9tad8e': {
      'en': 'Montant',
      'ar': 'مقدار',
      'de': 'Höhe',
      'es': 'Monto',
    },
    'c4h10pu3': {
      'en': 'Nom de la transaction ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ya31hond': {
      'en': 'Dépensé à',
      'ar': '',
      'de': '',
      'es': '',
    },
    '31lary2h': {
      'en': 'Motif',
      'ar': '',
      'de': '',
      'es': '',
    },
    'uqfgu088': {
      'en': 'Valider',
      'ar': 'أضف معاملة',
      'de': 'Transaktion hinzufügen',
      'es': 'Agregar transacción',
    },
    '9stmpsf0': {
      'en': 'Tapez ci-dessus pour compléter la demande',
      'ar': 'اضغط أعلاه لإكمال الطلب',
      'de': 'Tippen Sie oben, um die Anfrage abzuschließen',
      'es': 'Toque arriba para completar la solicitud',
    },
    'gzhmf1t6': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال مبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
    },
    '7trcsuiu': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // transaction_EDIT
  {
    's300dyxl': {
      'en': 'Edit Transaction',
      'ar': 'تحرير المعاملة',
      'de': 'Transaktion bearbeiten',
      'es': 'Editar transacción',
    },
    'df1ingy2': {
      'en': 'Office Budget',
      'ar': 'ميزانية المكتب',
      'de': 'Bürobudget',
      'es': 'Presupuesto de oficina',
    },
    '5kzmka3y': {
      'en': 'External Transfer',
      'ar': 'التحويل الخارجي',
      'de': 'Externe Übertragung',
      'es': 'Transferencia externa',
    },
    'nvtz0bpd': {
      'en': 'ACH Payment',
      'ar': 'دفع ACH',
      'de': 'ACH-Zahlung',
      'es': 'Pago CCA',
    },
    'l3bqo3oh': {
      'en': 'Select Budget',
      'ar': 'حدد الميزانية',
      'de': 'Wählen Sie Budget aus',
      'es': 'Seleccionar presupuesto',
    },
    '3eftlbxd': {
      'en': 'Mise à jour de la transaction',
      'ar': 'تحديث المعاملة',
      'de': 'Transaktion aktualisieren',
      'es': 'Actualizar transacción',
    },
    '4atjd0yh': {
      'en': 'Appuyez sur ci-dessus pour enregistrer vos modifications.',
      'ar': 'اضغط أعلاه لحفظ التغييرات الخاصة بك.',
      'de': 'Tippen Sie oben, um Ihre Änderungen zu speichern.',
      'es': 'Toca arriba para guardar tus cambios.',
    },
    'pg18rcyu': {
      'en': 'Please enter an amount',
      'ar': 'الرجاء إدخال مبلغ',
      'de': 'Bitte geben Sie einen Betrag ein',
      'es': 'Por favor ingrese una cantidad',
    },
    '12if11ss': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // editProfile
  {
    '4rzqov3y': {
      'en': 'Modification Profile',
      'ar': 'تعديل الملف الشخصي',
      'de': 'Profil bearbeiten',
      'es': 'Editar perfil',
    },
    'zoxan2gi': {
      'en': 'Changer de photo',
      'ar': 'غير الصوره',
      'de': 'Foto ändern',
      'es': 'Cambiar foto',
    },
    '3p9y21e2': {
      'en': 'Nom et prénom',
      'ar': 'اسمك',
      'de': 'Dein Name',
      'es': 'Tu nombre',
    },
    'dw9gmjdc': {
      'en': 'Please enter a valid number...',
      'ar': 'من فضلك أدخل رقما صالحا...',
      'de': 'Bitte geben Sie eine gültige Nummer ein...',
      'es': 'Por favor ingrese un número valido...',
    },
    'z4fstn5l': {
      'en': 'Adresse email',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'jozgvwyg': {
      'en': 'Your email',
      'ar': 'بريدك الالكتروني',
      'de': 'Deine E-Mail',
      'es': 'Tu correo electrónico',
    },
    '8h1cjk5a': {
      'en': 'Votre Âge',
      'ar': 'عمرك',
      'de': 'Ihr Alter',
      'es': 'Su edad',
    },
    '5v21r6gb': {
      'en': 'i.e. 34',
      'ar': 'أي 34',
      'de': 'dh 34',
      'es': 'es decir, 34',
    },
    'zvymbfia': {
      'en': 'Votre Bio',
      'ar': 'لقبك',
      'de': 'Dein Titel',
      'es': 'Tu título',
    },
    'i6edcl52': {
      'en': 'Modification',
      'ar': 'حفظ التغييرات',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
    },
    '59naq8ur': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // changePassword
  {
    'l5iggwaz': {
      'en': 'Change Password',
      'ar': 'تغيير كلمة المرور',
      'de': 'Kennwort ändern',
      'es': 'Cambia la contraseña',
    },
    '2b97u8y5': {
      'en':
          'Saisissez l\'adresse électronique associée à votre compte et nous vous enverrons un lien pour réinitialiser votre mot de passe.',
      'ar':
          'أدخل البريد الإلكتروني المرتبط بحسابك وسنرسل لك رابطًا لإعادة تعيين كلمة المرور الخاصة بك.',
      'de':
          'Geben Sie die mit Ihrem Konto verknüpfte E-Mail-Adresse ein und wir senden Ihnen einen Link zum Zurücksetzen Ihres Passworts.',
      'es':
          'Ingrese el correo electrónico asociado con su cuenta y le enviaremos un enlace para restablecer su contraseña.',
    },
    'ajy1c3r9': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'hsqfoxya': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'if4pz6lm': {
      'en': 'Envoyer un lien de réinitialisation',
      'ar': 'أرسل رابط إعادة التعيين',
      'de': 'Zurücksetzen-Link senden',
      'es': 'Enviar enlace de reinicio',
    },
    '5tvk9lv0': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // notificationsSettings
  {
    'sc4ff4ce': {
      'en': 'Notifications',
      'ar': 'إشعارات',
      'de': 'Benachrichtigungen',
      'es': 'Notificaciones',
    },
    'r72zvrv5': {
      'en':
          'Choisissez les notifications que vous souhaitez recevoir ci-dessous et nous mettrons à jour les paramètres.',
      'ar': 'اختر الإشعارات التي تريد تلقيها أدناه وسنقوم بتحديث الإعدادات.',
      'de':
          'Wählen Sie unten aus, welche Benachrichtigungen Sie erhalten möchten, und wir aktualisieren die Einstellungen.',
      'es':
          'Elija qué notificaciones desea recibir a continuación y actualizaremos la configuración.',
    },
    'gjygkr0n': {
      'en': 'Notifications en temps réel',
      'ar': 'دفع الإخطارات',
      'de': 'Mitteilungen',
      'es': 'Notificaciones push',
    },
    '3y3yhxbk': {
      'en':
          'Recevoir des notifications push de notre application de manière semi-régulière.',
      'ar': 'تلقي إشعارات من تطبيقنا على أساس شبه منتظم.',
      'de':
          'Erhalten Sie regelmäßig Push-Benachrichtigungen von unserer Anwendung.',
      'es':
          'Reciba notificaciones Push de nuestra aplicación de forma semi regular.',
    },
    '1ytebj35': {
      'en': 'Notifications par e-mail',
      'ar': 'اشعارات البريد الالكتروني',
      'de': 'E-Mail Benachrichtigungen',
      'es': 'Notificaciónes de Correo Electrónico',
    },
    '9lvh5nst': {
      'en':
          'Recevoir des notifications par courriel de notre équipe de marketing concernant les nouvelles fonctionnalités.',
      'ar':
          'تلقي إشعارات البريد الإلكتروني من فريق التسويق لدينا حول الميزات الجديدة.',
      'de':
          'Erhalten Sie E-Mail-Benachrichtigungen von unserem Marketingteam über neue Funktionen.',
      'es':
          'Reciba notificaciones por correo electrónico de nuestro equipo de marketing sobre nuevas funciones.',
    },
    'isgrgbfs': {
      'en': 'Modifier',
      'ar': 'حفظ التغييرات',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
    },
    'a96mlyeh': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // privacyPolicy
  {
    'alczfiiy': {
      'en': 'Politique de confidentialité',
      'ar': 'سياسة الخصوصية',
      'de': 'Datenschutz-Bestimmungen',
      'es': 'Política de privacidad',
    },
    'fvsfg5on': {
      'en': 'Comment utilisons-nous vos données ?',
      'ar': 'كيف نستخدم بياناتك',
      'de': 'Wie wir Ihre Daten verwenden',
      'es': 'Cómo usamos sus datos',
    },
    'nbiyrnzl': {
      'en':
          'Chez [Nom de l\'entreprise], nous accordons une grande importance à la protection de votre vie privée et à la sécurité de vos données. Nous recueillons certaines informations lorsque vous utilisez nos services pour améliorer votre expérience et fournir des fonctionnalités personnalisées. Voici comment nous utilisons vos données :\n\nFourniture de services : Nous utilisons vos données pour vous fournir les services que vous avez demandés, tels que la création de comptes, le traitement des paiements, la personnalisation de votre expérience utilisateur, et la fourniture de contenu pertinent.\n\nAmélioration des produits : Nous analysons les données collectées pour comprendre comment nos utilisateurs interagissent avec nos produits et services. Cela nous permet d\'identifier les domaines à améliorer et de développer de nouvelles fonctionnalités pour mieux répondre à vos besoins.\n\nCommunication avec vous : Nous utilisons vos coordonnées pour vous envoyer des notifications importantes concernant nos services, telles que les mises à jour du produit, les changements dans nos politiques ou les rappels de sécurité.\n\nMarketing et publicité : Nous pouvons utiliser vos données pour vous envoyer des communications marketing et des offres promotionnelles sur nos produits et services ou sur ceux de nos partenaires, si vous avez donné votre consentement pour le faire.\n\nSécurité et prévention de la fraude : Nous utilisons des mesures de sécurité pour protéger vos données contre tout accès non autorisé, ainsi que pour détecter et prévenir la fraude ou toute autre activité abusive.\n\nConformité aux lois et réglementations : Nous pouvons être tenus de partager vos données dans le cadre d\'une enquête légale ou réglementaire, ou pour nous conformer à une obligation légale.\n\nVotre confidentialité est notre priorité absolue, et nous nous engageons à utiliser vos données de manière responsable et transparente. Si vous avez des questions sur notre utilisation des données ou sur notre politique de confidentialité, n\'hésitez pas à nous contacter à tout moment.\n\n',
      'ar':
          'Lorem ipsum dolor sit amet، consectetur adipiscing elit، sed do eiusmod tempor incidunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. غير consectetur a erat nam. دونك ألتريسيس تينسيدونت قوس غير مخادع. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis في erat pellentesque adipiscing. موريس نونك كونيج سيرة ذاتية. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla. Euismod lacinia في quis risus sed vulputate odio. فيليت كريمينسيم sodales ut eu sem سيرة ذاتية صحيحة justo eget. Risus feugiat في ما قبل ميتوس. Leo vel orci porta non pulvinar neque laoreet suspension interdum. Suscipit Tellus mauris a Diam Maecenas Sed enim ut sem. SEM السيرة الذاتية الصحيحة justo eget magna fermentum iaculis eu. لاسينيا في quis risus sed. Faucibus purus في ماسا مؤقت. ليو بقطر سوليتودين معرف مؤقت الاتحاد الأوروبي. Nisi scelerisque eu ultrices السيرة الذاتية موصل. Vulputate كريم معلق في وقت مبكر. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus Préium quam vulputate. Elit pellentesque موطن morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. sit amet mattis vulputate enim nulla. Nisi lacus sed viverra Tellus في العادة السيئة. اجلس أميت ريسوس نولام إيجيت فيليس إيجيت نونك لوبورتيز. Pretium lectus quam id leo in vitae. Adipiscing Diam donec adipiscing tristique. كومودو سيد egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing النخبة pellentesque المعيشية morbi. مونتيس ناسيتور ريديكولوس موس موريس. Ut etiam sit amet nisl purus in. Arcu ac Ornare suspendisse sed nisi lacus sed viverra.',
      'de':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis bei erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla. Euismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem integer vitae justo eget magna fermentum iaculis eu. Lacinia bei quis risus sed. Faucibus purus in massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Commodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
      'es':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Accumsan sit amet nulla facilisi morbi tempus. Non consectetur a erat nam. Donec ultrices tincidunt arcu non sodales. Velit sed ullamcorper morbi tincidunt. Molestie a iaculis at erat pellentesque adipiscing. Mauris nunc congue nisi vitae. Nisl tincidunt eget nullam non nisi. Faucibus nisl tincidunt eget nullam non nisi est. Leo duis ut diam quam nulla. Euismod lacinia at quis risus sed vulputate odio. Velit dignissim sodales ut eu sem integer vitae justo eget. Risus feugiat in ante metus. Leo vel orci porta non pulvinar neque laoreet suspendisse interdum. Suscipit tellus mauris a diam maecenas sed enim ut sem. Sem entero vitae justo eget magna fermentum iaculis eu. Lacinia at quis risus sed. Faucibus purus en massa tempor. Leo a diam sollicitudin tempor id eu. Nisi scelerisque eu ultrices vitae auctor. Vulputate dignissim suspendisse in est ante in. Enim neque volutpat ac tincidunt vitae semper quis. Ipsum dolor sit amet consectetur adipiscing elit. Et malesuada fames ac turpis egestas maecenas pharetra convallis. Sed sed risus pretium quam vulputate. Elit pellentesque habitant morbi tristique senectus et. Viverra maecenas accumsan lacus vel facilisis volutpat est. Sit amet mattis vulputate enim nulla. Nisi lacus sed viverra tellus in hac habitasse. Sit amet risus nullam eget felis eget nunc lobortis. Pretium lectus quam id leo in vitae. Adipiscing diam donec adipiscing tristique. Cómodo sed egestas egestas fringilla. Ipsum dolor sit amet consectetur adipiscing. Ipsum dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Montes nascetur ridiculus mus mauris. Ut etiam sit amet nisl purus in. Arcu ac tortor dignissim convallis aenean et tortor at. Ornare suspendisse sed nisi lacus sed viverra.',
    },
    'oks4x95o': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // tutorial_PROFILE
  {
    '38wb3rix': {
      'en': 'Tutorial',
      'ar': 'درس تعليمي',
      'de': 'Lernprogramm',
      'es': 'Tutorial',
    },
    'o6prpb1q': {
      'en': 'Création de budgets',
      'ar': 'إنشاء الميزانيات',
      'de': 'Erstellen Sie Budgets',
      'es': 'Crear presupuestos',
    },
    '292pbdw7': {
      'en':
          'Créez des budgets auxquels vous pouvez rattacher les transactions afin d\'en faciliter le suivi.',
      'ar':
          'قم بإنشاء ميزانيات يمكنك ربط المعاملات بها أيضًا من أجل التتبع السهل.',
      'de':
          'Erstellen Sie Budgets, mit denen Sie auch Transaktionen verknüpfen können, um sie einfach nachverfolgen zu können.',
      'es':
          'Cree presupuestos en los que también pueda vincular transacciones para facilitar el seguimiento.',
    },
    'b10xvuf9': {
      'en': 'Suivi des dépenses',
      'ar': 'تتبع الإنفاق',
      'de': 'Behalten Sie die Ausgaben im Auge',
      'es': 'Mantenga un registro de los gastos',
    },
    't6k1smsm': {
      'en':
          'Ajoutez facilement des transactions et associez-les aux budgets qui ont été créés.',
      'ar': 'أضف المعاملات بسهولة وربطها بالميزانيات التي تم إنشاؤها.',
      'de':
          'Fügen Sie ganz einfach Transaktionen hinzu und verknüpfen Sie sie mit erstellten Budgets.',
      'es':
          'Agregue fácilmente transacciones y asócielas con los presupuestos que se han creado.',
    },
    'u8xxj427': {
      'en': 'Analyse du budget',
      'ar': 'تحليل الميزانية',
      'de': 'Budgetanalyse',
      'es': 'Análisis de presupuesto',
    },
    'iqi0pkmb': {
      'en':
          'Sachez où en sont vos budgets et comment ils peuvent être ajustés.',
      'ar': 'تعرف على مكان ميزانياتك وكيف يمكن تعديلها.',
      'de': 'Wissen, wo Ihre Budgets sind und wie sie angepasst werden können.',
      'es': 'Sepa dónde están sus presupuestos y cómo se pueden ajustar.',
    },
    'uydm0fnm': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // homePage
  {
    'ucqlrrlk': {
      'en': 'Bienvenue,',
      'ar': 'مرحبا،',
      'de': 'Herzlich willkommen,',
      'es': 'Bienvenidos,',
    },
    'c10wb3ot': {
      'en': 'Les détails de votre compte sont ci-dessous.',
      'ar': 'تفاصيل حسابك أدناه.',
      'de': 'Ihre Kontodetails sind unten.',
      'es': 'Los detalles de su cuenta se encuentran a continuación.',
    },
    '6z1sm34j': {
      'en': 'Total du solde',
      'ar': 'إجمالي الرصيد',
      'de': 'Gesamtsaldo',
      'es': 'Balance total',
    },
    'c0dls4u5': {
      'en': '\$',
      'ar': '25202 دولار',
      'de': '25.202 \$',
      'es': '\$25,202',
    },
    '30yef7fj': {
      'en': 'Payroll Due',
      'ar': 'الرواتب المستحقة',
      'de': 'Gehaltsabrechnung fällig',
      'es': 'Vencimiento de nómina',
    },
    'zrx9e6tv': {
      'en': '\$12,245',
      'ar': '12245 دولارًا',
      'de': '12.245 \$',
      'es': '\$12,245',
    },
    '1cjqanzg': {
      'en': 'Date',
      'ar': 'تاريخ الخصم',
      'de': 'Belastungsdatum',
      'es': 'Fecha de débito',
    },
    'n87v5tth': {
      'en': 'Marketing Budget',
      'ar': 'ميزانية التسويق',
      'de': 'Werbehaushalt, Werbebudget',
      'es': 'Presupuesto de marketing',
    },
    'l5pw5c8c': {
      'en': '\$4,000',
      'ar': '4000 دولار',
      'de': '4.000 \$',
      'es': '\$4,000',
    },
    '7i0a44qa': {
      'en': 'Total ',
      'ar': 'إجمال الصرف',
      'de': 'Gesamtausgaben',
      'es': 'Total gastado',
    },
    '9a2ya1la': {
      'en': '\$3,402',
      'ar': '3،402 دولار',
      'de': '\$3.402',
      'es': '\$3,402',
    },
    'lmo3ko2i': {
      'en': 'Services rapides',
      'ar': 'خدمات سريعة',
      'de': 'Schnelle Dienste',
      'es': 'Servicios rápidos',
    },
    '774itrkn': {
      'en': 'Ma banque',
      'ar': 'بنكي',
      'de': 'Meine Bank',
      'es': 'Mi banco',
    },
    'xs2as0vf': {
      'en': 'Cours Bitcoin',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    'g8yaaa7f': {
      'en': 'Activités',
      'ar': 'نشاط',
      'de': 'Aktivität',
      'es': 'Actividad',
    },
    'nb29ps2o': {
      'en': '1 Nouveau alerte',
      'ar': '1 تنبيه جديد',
      'de': '1 Neue Benachrichtigung',
      'es': '1 nueva alerta',
    },
    'vgt9s153': {
      'en': 'Voir',
      'ar': 'عرض الآن',
      'de': 'Jetzt ansehen',
      'es': 'Ver ahora',
    },
    'c805m53i': {
      'en': 'Acceuil',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // budget_DELETE
  {
    'pozov0xz': {
      'en': 'Supprimer Budget',
      'ar': 'حذف الميزانية',
      'de': 'Budget löschen',
      'es': 'Eliminar presupuesto',
    },
    'aptjmof0': {
      'en':
          'Si vous supprimez ce budget, vos transactions n\'y seront plus associées.',
      'ar': 'إذا حذفت هذه الميزانية ، فلن تكون معاملاتك مرتبطة بها بعد الآن.',
      'de':
          'Wenn Sie dieses Budget löschen, sind Ihre Transaktionen nicht mehr damit verknüpft.',
      'es':
          'Si elimina este presupuesto, sus transacciones ya no estarán asociadas a él.',
    },
    '9l7pbjcj': {
      'en': 'Supprimer Budget',
      'ar': 'حذف الميزانية',
      'de': 'Budget löschen',
      'es': 'Eliminar presupuesto',
    },
    'u0kr38at': {
      'en': 'Tap above to remove this bude',
      'ar': 'انقر فوق لإزالة هذا bude',
      'de': 'Tippen Sie oben, um diese Bude zu entfernen',
      'es': 'Toque arriba para eliminar este bude',
    },
    'b1xp801p': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // profilepage
  {
    'fgf8icmv': {
      'en': '\$',
      'ar': '23000 دولار',
      'de': '23.000 \$',
      'es': '\$23,000',
    },
    '2rrr446m': {
      'en': '3 devises',
      'ar': '3 عملات',
      'de': '3 Währungen',
      'es': '3 monedas',
    },
    'r04m9nxs': {
      'en': 'Ma Banque',
      'ar': 'بنكي',
      'de': 'Meine Bank',
      'es': 'Mi banco',
    },
    '8nac51xz': {
      'en': 'Cours Bitcoin',
      'ar': 'تحويل',
      'de': 'Transfer',
      'es': 'Transferir',
    },
    's56t3xya': {
      'en': 'Activités',
      'ar': 'نشاط',
      'de': 'Aktivität',
      'es': 'Actividad',
    },
    'vewa5op5': {
      'en': 'Bitcoin',
      'ar': 'بيتكوين',
      'de': 'Bitcoin',
      'es': 'Bitcoin',
    },
    '9oun2uok': {
      'en': '\$7,302',
      'ar': '7302 دولار',
      'de': '\$7.302',
      'es': '\$7,302',
    },
    'yla7uncg': {
      'en': '32% ',
      'ar': '32٪ من المحفظة',
      'de': '32 % des Portfolios',
      'es': '32% de la cartera',
    },
    '7hsm7t9z': {
      'en': ' ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'opob20j8': {
      'en': 'Solona',
      'ar': 'سولونا',
      'de': 'Solona',
      'es': 'Soloña',
    },
    'fi3cleyj': {
      'en': '\$7,302',
      'ar': '7302 دولار',
      'de': '\$7.302',
      'es': '\$7,302',
    },
    '606emxw1': {
      'en': '40% ',
      'ar': '40٪ من المحفظة',
      'de': '40 % des Portfolios',
      'es': '40% de la cartera',
    },
    'qx0ykpbm': {
      'en': ' ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l2io5lul': {
      'en': 'Dogecoin',
      'ar': 'دوجكوين',
      'de': 'Dogecoins',
      'es': 'dogecoin',
    },
    'krsyyttw': {
      'en': '\$7,302',
      'ar': '7302 دولار',
      'de': '\$7.302',
      'es': '\$7,302',
    },
    '4mvfe3pe': {
      'en': '50%',
      'ar': '40٪ من المحفظة',
      'de': '40 % des Portfolios',
      'es': '40% de la cartera',
    },
    '6cm4jjje': {
      'en': ' ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jajnfhsz': {
      'en': 'Solde du portefeuille',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vox9t1s0': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // Historique
  {
    '2upqxx8m': {
      'en': 'Historique des prix',
      'ar': '',
      'de': '',
      'es': '',
    },
    'g552jz68': {
      'en':
          'Sélectionnez une période pour afficher le graphique de l\'historique des prix.',
      'ar': '',
      'de': '',
      'es': '',
    },
    't65264mi': {
      'en': '1W',
      'ar': '',
      'de': '',
      'es': '',
    },
    'y9wtl0hb': {
      'en': '1M',
      'ar': '',
      'de': '',
      'es': '',
    },
    'v6262dkr': {
      'en': '3M',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6zcs9hx8': {
      'en': '1Y',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lgzox736': {
      'en': 'ALL',
      'ar': '',
      'de': '',
      'es': '',
    },
    '61ev4e2g': {
      'en': 'Graphique',
      'ar': '',
      'de': '',
      'es': '',
    },
    'h1j1lhlm': {
      'en': 'Transactions récentes',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0t0oh4cl': {
      'en': 'Présentation du budget',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // BitcoinPrice
  {
    '0iip5de2': {
      'en': 'Le prix actuel du bitcoin n\'est pas disponible pour le moment.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'me39i3pu': {
      'en': 'Actualiser',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ml7kkj9e': {
      'en': 'Cours du bitcoin',
      'ar': '',
      'de': '',
      'es': '',
    },
    '994zen92': {
      'en': 'BitCoin',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // NewsCrypto
  {
    'w23z925m': {
      'en': 'Actualités ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'u7hls9cd': {
      'en': 'Dernières mises à jour',
      'ar': '',
      'de': '',
      'es': '',
    },
    'x3n3uuib': {
      'en': 'Plus d\'informations',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l7evlzpd': {
      'en': 'Nouvelles sur les crypto-monnaies',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1ximboog': {
      'en': 'Acceuil',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // PortefeuilleBitcoin
  {
    '8ckdls7f': {
      'en': 'Total Balance',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hqsjm3ss': {
      'en': ' BTC',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2j4te0tl': {
      'en': 'Envoyer',
      'ar': '',
      'de': '',
      'es': '',
    },
    'i5280nbt': {
      'en': 'Recevoir',
      'ar': '',
      'de': '',
      'es': '',
    },
    'e5n4nkrm': {
      'en': 'Transactions récentes',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3bt48lnn': {
      'en': 'Envoi de bitcoins',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pb8yinjr': {
      'en': 'A :1BoatSLRHtKNngkdXEeobR76b53LETtpyT',
      'ar': '',
      'de': '',
      'es': '',
    },
    't2hf10mr': {
      'en': '-0.001 BTC',
      'ar': '',
      'de': '',
      'es': '',
    },
    'akvs7g3v': {
      'en': 'Bitcoin Wallet',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bfzlhhlg': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // AchatsBitcoin
  {
    '51ehbtdz': {
      'en': 'Montant en USD',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ahw9u4zz': {
      'en': 'Entrez le montant en USD...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hl04m8gf': {
      'en': 'Adresse Bitcoin',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zarg604d': {
      'en': 'Entrez votre adresse Bitcoin...',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0h31ywn7': {
      'en': 'Acheter',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yji8uiv0': {
      'en': 'Achat de Bitcoins',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // VendreBitcoin
  {
    '1useywrd': {
      'en': 'Saisissez le montant de bitcoins que vous souhaitez vendre.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '75oue0g1': {
      'en': 'Montant en BTC',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4fz7hsf8': {
      'en': 'Saisir le montant...',
      'ar': '',
      'de': '',
      'es': '',
    },
    '38zcdv1x': {
      'en': 'Prix par BTC (USD)',
      'ar': '',
      'de': '',
      'es': '',
    },
    'w3p7plwc': {
      'en': 'Saisir le prix...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qthx7lkt': {
      'en': 'Total (USD)',
      'ar': '',
      'de': '',
      'es': '',
    },
    'z7mbe2g7': {
      'en': 'Calculated total...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dxdh6tbm': {
      'en': 'Vendez maintenant',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yz9ysoe3': {
      'en': 'Vendre des bitcoins',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // PayementBitcoin
  {
    '4zitmkwd': {
      'en':
          'Choisissez votre méthode préférée pour une expérience de transaction transparente.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'f176ecy6': {
      'en': 'Credit/Debit Card',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nfidtoik': {
      'en': 'PayPal',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wuqxk91b': {
      'en': 'Bank Transfer',
      'ar': '',
      'de': '',
      'es': '',
    },
    'moo3ogdm': {
      'en': 'Cryptocurrency',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dt2h005l': {
      'en': 'Taux de change',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mjpgt3cf': {
      'en':
          'Obtenez les derniers taux de change pour des conversions précises.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'z3j4khq0': {
      'en': 'USD to EUR',
      'ar': '',
      'de': '',
      'es': '',
    },
    '313lw592': {
      'en': '0.92',
      'ar': '',
      'de': '',
      'es': '',
    },
    'as2o66wa': {
      'en': 'USD to GBP',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vf0i0pzj': {
      'en': '0.76',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9ud3qx11': {
      'en': 'USD to CAD',
      'ar': '',
      'de': '',
      'es': '',
    },
    '00lwsj18': {
      'en': '1.28',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rinimrgh': {
      'en': 'USD to AUD',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7dffiub3': {
      'en': '1.35',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dwraqepx': {
      'en': 'Instructions',
      'ar': '',
      'de': '',
      'es': '',
    },
    'y36ydsjm': {
      'en': '1. Sélectionnez votre méthode de paiement',
      'ar': '',
      'de': '',
      'es': '',
    },
    't3prcbws': {
      'en': '2. Saisissez le montant de la transaction.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lbz19adq': {
      'en': '3. Confirmez les détails et continuez.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'st7oc3x0': {
      'en': '4. Recevez une confirmation de la transaction effectuée.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'as4t2ij3': {
      'en': 'Acceuil',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qxvz1pd1': {
      'en': 'Modes de paiement',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // AlertePrix
  {
    'nbutloqp': {
      'en': 'Alertes aux prix',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nfj30ce5': {
      'en':
          'Créez des alertes pour être informé lorsque le cours du bitcoin atteint un certain seuil.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bmg7ph4c': {
      'en': 'Nom de l\'alerte',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ooiv1oze': {
      'en': 'Saisir un nom pour votre alerte',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1853culx': {
      'en': 'Fixer le seuil de prix',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1v18lb5g': {
      'en': 'Entrez le prix',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j6xs6ae7': {
      'en': 'Monnaie',
      'ar': '',
      'de': '',
      'es': '',
    },
    'sy7saojx': {
      'en': 'USD',
      'ar': '',
      'de': '',
      'es': '',
    },
    'juoqge44': {
      'en': 'Définir une alerte',
      'ar': '',
      'de': '',
      'es': '',
    },
    'sr11jn0f': {
      'en': 'Vos alertes',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a233ost0': {
      'en': 'Alerte Bitcoin',
      'ar': '',
      'de': '',
      'es': '',
    },
    'h2dq94w6': {
      'en': '\$40,000',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ivqud6l5': {
      'en': 'Alerte Ethereum',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jog02ao5': {
      'en': '\$2,500',
      'ar': '',
      'de': '',
      'es': '',
    },
    '65gk96vj': {
      'en': 'Alerte Litecoin',
      'ar': '',
      'de': '',
      'es': '',
    },
    '08ax2nln': {
      'en': '\$150',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ktda42mo': {
      'en': 'Alerte Ripple ',
      'ar': '',
      'de': '',
      'es': '',
    },
    'w416isek': {
      'en': '\$100',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // AjoutActualite
  {
    'vmex64qk': {
      'en': 'Titre',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9oev7gwn': {
      'en': 'Saisir le titre de l\'actualité',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nez4hmkd': {
      'en': 'Description',
      'ar': '',
      'de': '',
      'es': '',
    },
    'pzuj3w74': {
      'en': 'Saisir le contenu ici...',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3p8jhy4f': {
      'en': 'Télécharger une Photo',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ml8akupn': {
      'en': 'Ajouter',
      'ar': '',
      'de': '',
      'es': '',
    },
    'i39bg6s7': {
      'en': 'Ajouter une actualité',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Detailsactualite
  {
    'jex4zhw5': {
      'en': 'Date : ',
      'ar': '',
      'de': '',
      'es': '',
    },
    '66k8ft0u': {
      'en': 'Détail d\'une actualité',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2f2qnzvx': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // bookAppointment
  {
    'sfzj3riz': {
      'en': 'Book Appointment',
      'ar': 'موعد الكتاب',
      'de': 'Einen Termin verabreden',
      'es': 'Reservar una cita',
    },
    '4skzh9os': {
      'en':
          'Fill out the information below in order to book your appointment with our office.',
      'ar': 'املأ المعلومات أدناه من أجل حجز موعدك مع مكتبنا.',
      'de':
          'Füllen Sie die folgenden Informationen aus, um Ihren Termin in unserem Büro zu buchen.',
      'es':
          'Complete la información a continuación para reservar su cita con nuestra oficina.',
    },
    'b87tcas2': {
      'en': 'Emails will be sent to:',
      'ar': 'سيتم إرسال رسائل البريد الإلكتروني إلى:',
      'de': 'E-Mails werden gesendet an:',
      'es': 'Los correos electrónicos serán enviados a:',
    },
    'iicnw3dq': {
      'en': 'Booking For',
      'ar': 'الحجز لـ',
      'de': 'Buchung für',
      'es': 'reserva para',
    },
    '5tkkg4yu': {
      'en': 'Type of Appointment',
      'ar': 'نوع التعيين',
      'de': 'Art der Ernennung',
      'es': 'Tipo de cita',
    },
    '7w5m45zt': {
      'en': 'Doctors Visit',
      'ar': 'زيارة الأطباء',
      'de': 'Arztbesuch',
      'es': 'Visita de médicos',
    },
    'bmfmxg71': {
      'en': 'Routine Checkup',
      'ar': 'فحص روتيني حتى',
      'de': 'Routineuntersuchung',
      'es': 'Chequeo de rutina',
    },
    'prt95f0g': {
      'en': 'Scan/Update',
      'ar': 'مسح / تحديث',
      'de': 'Scannen/Aktualisieren',
      'es': 'Escanear/Actualizar',
    },
    '7ohalsg9': {
      'en': 'What\'s the problem?',
      'ar': 'ما هي المشكلة؟',
      'de': 'Was ist das Problem?',
      'es': '¿Cuál es el problema?',
    },
    'xukiv2ku': {
      'en': 'Choose Date',
      'ar': 'اختر موعدا',
      'de': 'Wählen Sie Datum',
      'es': 'Elija fecha',
    },
    'lpc88cht': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'de': 'Abbrechen',
      'es': 'Cancelar',
    },
    'b5umyycx': {
      'en': 'Book Now',
      'ar': 'احجز الآن',
      'de': 'buchen Sie jetzt',
      'es': 'Reservar ahora',
    },
  },
  // bookingOld
  {
    '8laf5zmk': {
      'en': 'Book Appointment',
      'ar': 'موعد الكتاب',
      'de': 'Einen Termin verabreden',
      'es': 'Reservar una cita',
    },
    'udwhsu8p': {
      'en':
          'Fill out the information below in order to book your appointment with our office.',
      'ar': 'املأ المعلومات أدناه من أجل حجز موعدك مع مكتبنا.',
      'de':
          'Füllen Sie die folgenden Informationen aus, um Ihren Termin in unserem Büro zu buchen.',
      'es':
          'Complete la información a continuación para reservar su cita con nuestra oficina.',
    },
    'm6f5lawq': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'yz52729g': {
      'en': 'Booking For',
      'ar': 'الحجز لـ',
      'de': 'Buchung für',
      'es': 'reserva para',
    },
    'hdmqdmzq': {
      'en': 'Type of Appointment',
      'ar': 'نوع التعيين',
      'de': 'Art der Ernennung',
      'es': 'Tipo de cita',
    },
    'stpxpct6': {
      'en': 'Doctors Visit',
      'ar': 'زيارة الأطباء',
      'de': 'Arztbesuch',
      'es': 'Visita de médicos',
    },
    'wvgk6obb': {
      'en': 'Routine Checkup',
      'ar': 'فحص روتيني حتى',
      'de': 'Routineuntersuchung',
      'es': 'Chequeo de rutina',
    },
    'xt7ujyt8': {
      'en': 'Scan/Update',
      'ar': 'مسح / تحديث',
      'de': 'Scannen/Aktualisieren',
      'es': 'Escanear/Actualizar',
    },
    'andpn0t0': {
      'en': 'What\'s the problem?',
      'ar': 'ما هي المشكلة؟',
      'de': 'Was ist das Problem?',
      'es': '¿Cuál es el problema?',
    },
    'ycaso9dc': {
      'en': 'Choose Date',
      'ar': 'اختر موعدا',
      'de': 'Wählen Sie Datum',
      'es': 'Elija fecha',
    },
    '2pmd2p3w': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'de': 'Abbrechen',
      'es': 'Cancelar',
    },
    '13j05r8j': {
      'en': 'Book Now',
      'ar': 'احجز الآن',
      'de': 'buchen Sie jetzt',
      'es': 'Reservar ahora',
    },
  },
  // editBooking
  {
    '6j668hma': {
      'en': 'Edit Appointment',
      'ar': 'تحرير موعد',
      'de': 'Termin bearbeiten',
      'es': 'Editar cita',
    },
    'cbp936ta': {
      'en': 'Edit the fields below in order to change your appointment.',
      'ar': 'قم بتحرير الحقول أدناه لتغيير موعدك.',
      'de': 'Bearbeiten Sie die Felder unten, um Ihren Termin zu ändern.',
      'es': 'Edite los campos a continuación para cambiar su cita.',
    },
    '6btfslje': {
      'en': 'Emails will be sent to:',
      'ar': 'سيتم إرسال رسائل البريد الإلكتروني إلى:',
      'de': 'E-Mails werden gesendet an:',
      'es': 'Los correos electrónicos serán enviados a:',
    },
    'mhko6q8p': {
      'en': 'Booking For',
      'ar': 'الحجز لـ',
      'de': 'Buchung für',
      'es': 'reserva para',
    },
    'shqcgjqe': {
      'en': 'Type of Appointment',
      'ar': 'نوع التعيين',
      'de': 'Art der Ernennung',
      'es': 'Tipo de cita',
    },
    '5ixhbnsd': {
      'en': 'Doctors Visit',
      'ar': 'زيارة الأطباء',
      'de': 'Arztbesuch',
      'es': 'Visita de médicos',
    },
    'db46hhfw': {
      'en': 'Routine Checkup',
      'ar': 'فحص روتيني حتى',
      'de': 'Routineuntersuchung',
      'es': 'Chequeo de rutina',
    },
    'e1zm6kzh': {
      'en': 'Scan/Update',
      'ar': 'مسح / تحديث',
      'de': 'Scannen/Aktualisieren',
      'es': 'Escanear/Actualizar',
    },
    'oy6qvd33': {
      'en': 'What\'s the problem?',
      'ar': 'ما هي المشكلة؟',
      'de': 'Was ist das Problem?',
      'es': '¿Cuál es el problema?',
    },
    '9emhgrhs': {
      'en': 'Choose Date',
      'ar': 'اختر موعدا',
      'de': 'Wählen Sie Datum',
      'es': 'Elija Fecha',
    },
    '2bzoinpy': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'de': 'Abbrechen',
      'es': 'Cancelar',
    },
    'gjnq0j86': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'de': 'Änderungen speichern',
      'es': 'Guardar cambios',
    },
  },
  // pauseCard
  {
    'dt7m486y': {
      'en': 'Pause Card',
      'ar': 'بطاقة وقفة',
      'de': 'Pausenkarte',
      'es': 'Tarjeta de pausa',
    },
    '6edae99k': {
      'en': 'Are you sure you want to pause your card?',
      'ar': 'هل أنت متأكد أنك تريد إيقاف بطاقتك مؤقتًا؟',
      'de': 'Möchten Sie Ihre Karte wirklich pausieren?',
      'es': '¿Seguro que quieres pausar tu tarjeta?',
    },
    'omtrfcm5': {
      'en': 'Nevermind',
      'ar': 'لا بأس',
      'de': 'egal',
      'es': 'No importa',
    },
    'hw07mkb9': {
      'en': 'Yes, Pause',
      'ar': 'نعم توقف',
      'de': 'Ja, Pause',
      'es': 'Sí, pausa',
    },
  },
  // Miscellaneous
  {
    'lzyb73wy': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kx9cdks4': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'efvtwj7k': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ec5hfa1e': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q5ljwvfo': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j4rmwb3h': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6ah1b18f': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2kos1hen': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vu2uo5mk': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1qy4hwf5': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'oc8ak6zn': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'b6cfhr3t': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xmpkn2ed': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'aox3s4fb': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l8hv5a7z': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4pjwb70a': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0xlokf4y': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8twlwiwt': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'qnw31z49': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'obsanhci': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '1c4kf7k6': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'p0tqd2n6': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'phjbjgp5': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tzjhst5a': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    't4xzlq9q': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '513nj4m0': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a1jxfgju': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
