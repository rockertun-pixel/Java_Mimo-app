# Settings နှင့် Light/Dark Theme Guide

## သက်ဆိုင်သော File များ

```text
lib/app/theme/app_theme.dart
lib/app/theme/theme_controller.dart
lib/features/settings/presentation/settings_screen.dart
lib/core/localization/myanmar_text.dart
```

## Theme flow

```text
SettingsScreen
    ↓
ThemeController.setTheme(ThemeMode)
    ↓
Riverpod state ချက်ချင်းပြောင်း
    ↓
MaterialApp.themeMode ပြောင်း
    ↓
SharedPreferences တွင် theme_mode သိမ်း
```

App စတင်ချိန်တွင် `ThemeController.build()` သည် `ThemeMode.system` ကို default အဖြစ်ပြပြီး local storage မှ သိမ်းထားသော value ရှိလျှင် restore လုပ်သည်။

သိမ်းသည့် key:

```text
theme_mode
```

သိမ်းနိုင်သော value များ:

```text
system
light
dark
```

## Theme behavior

### စနစ်အတိုင်း

- Android system dark mode ကို လိုက်နာသည်။
- iOS system appearance ကို လိုက်နာသည်။
- Browser တွင် `prefers-color-scheme` ကို Flutter Web က လိုက်နာသည်။
- User သည် device setting ပြောင်းလျှင် App ၏ effective brightness သည် ပြောင်းနိုင်သည်။

### အလင်းရောင်ပုံစံ

- App ကို အမြဲ Light theme ဖြင့်ပြသည်။
- Device dark mode ဖြစ်နေလည်း App သည် Light theme အတိုင်းပြသည်။

### အမှောင်ပုံစံ

- App ကို အမြဲ Dark theme ဖြင့်ပြသည်။
- Device light mode ဖြစ်နေလည်း App သည် Dark theme အတိုင်းပြသည်။

## UI behavior

Settings screen တွင်:

- လက်ရှိရွေးထားသော Theme ကို အပေါ်က summary card တွင် ပြသည်။
- လက်ရှိ effective brightness ကို `လက်ရှိအရောင်: အလင်း` သို့မဟုတ် `လက်ရှိအရောင်: အမှောင်` ဖြင့်ပြသည်။
- Option တစ်ခုလုံးကို နှိပ်၍ ရွေးနိုင်သည်။
- Radio button မှလည်း ရွေးနိုင်သည်။
- ရွေးချယ်ပြီးသည်နှင့် App UI သည် ချက်ချင်းပြောင်းသည်။

## Run လုပ်နည်း

```bash
cd java_mimo_app
flutter pub get
flutter run -d chrome
```

## Manual test checklist

1. `ဆက်တင်များ` သို့ ဝင်ပါ။
2. `အလင်းရောင်ပုံစံ` ကို ရွေးပါ။ App သည် ချက်ချင်း အလင်းပြောင်းရမည်။
3. `အမှောင်ပုံစံ` ကို ရွေးပါ။ App သည် ချက်ချင်း အမှောင်ပြောင်းရမည်။
4. `စနစ်အတိုင်း` ကို ရွေးပါ။ Device/browser setting အတိုင်း ပြရမည်။
5. App ကို stop လုပ်ပြီး ပြန် run ပါ။ ရွေးထားသော Theme မပျောက်ရပါ။
6. Chrome DevTools သို့မဟုတ် browser system appearance ကို ပြောင်းပြီး `စနစ်အတိုင်း` behavior ကို စစ်ပါ။
7. Mobile width နှင့် Desktop width နှစ်မျိုးလုံးတွင် Settings UI ဖတ်ရလွယ်ကူရမည်။
8. Dark theme တွင် text နှင့် card contrast ကောင်းမွန်ရမည်။

## နောက်ပိုင်း တိုးချဲ့နိုင်သည့် Settings

- Font size preference
- Myanmar/English language preference
- Sound effect toggle
- Daily reminder setting
- Progress reset confirmation
- Notification permission
