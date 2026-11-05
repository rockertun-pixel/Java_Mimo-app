# Phase 2 — Flutter Foundation

ဤ Phase တွင် Flutter project foundation၊ Myanmar Unicode font configuration၊ local theme persistence နှင့် responsive navigation ကို တည်ဆောက်ထားသည်။

## Project path

```text
/home/ubuntu/java_mimo_app
```

သင့် Flutter computer တွင် project folder ကို copy လုပ်ပြီး အောက်ပါ command များကို project root မှ run ပါ။

ဤ environment တွင် Flutter SDK မရှိသောကြောင့် `android/`, `ios/`, `web/` platform-generated folders များကို မဖန်တီးနိုင်သေးပါ။ Project ကို copy လုပ်ပြီး ပထမဆုံးအကြိမ် အောက်ပါ command ကို run ပါ။

```bash
cd java_mimo_app
flutter create --platforms=android,ios,web .
```

ထို့နောက် project ထဲရှိ `pubspec.yaml`, `lib/` နှင့် `assets/` ဖိုင်များသည် Phase 2 ဖိုင်များအတိုင်း ရှိနေကြောင်း စစ်ပါ။

## အရင်စစ်ဆေးရန်

```bash
flutter --version
flutter doctor
```

Flutter SDK ကို သင့် computer တွင် install မလုပ်ရသေးပါက Flutter official installation အတိုင်း install ပြီး `flutter doctor` ဖြင့် Android/iOS/Web toolchain ကို စစ်ပါ။

## Run လုပ်နည်း

```bash
cd java_mimo_app
flutter pub get
flutter run -d chrome
```

Android emulator သို့မဟုတ် physical Android device အတွက်:

```bash
flutter devices
flutter run -d <device-id>
```

iOS အတွက် macOS နှင့် Xcode လိုအပ်ပါသည်။

```bash
flutter run -d ios
```

## Test လုပ်ရမည့်အချက်များ

1. App ဖွင့်လျှင် `ကုဒ်လေ့လာမယ်` app shell ပေါ်လာရမည်။
2. Mobile width တွင် အောက်ဘက် `NavigationBar` ပေါ်ရမည်။
3. Tablet/Desktop width တွင် ဘယ်ဘက် `NavigationRail` ပေါ်ရမည်။
4. `ပင်မစာမျက်နှာ`, `သင်တန်းများ`, `အောင်မြင်မှုများ`, `ပရိုဖိုင်`, `ဆက်တင်များ` ကိုနှိပ်လျှင် screen ပြောင်းရမည်။
5. `ဆက်တင်များ` တွင် `စနစ်အတိုင်း`, `အလင်းရောင်ပုံစံ`, `အမှောင်ပုံစံ` ရွေးချယ်နိုင်ရမည်။
6. Theme ပြောင်းပြီး App ကို restart လုပ်လျှင် ရွေးထားသော theme ပြန်ရရမည်။
7. Myanmar Unicode စာသားများသည် စာလုံးပျက်ခြင်းမရှိဘဲ ပြရမည်။
8. Chrome browser window ကို resize လုပ်သောအခါ mobile/tablet/desktop navigation ပြောင်းရမည်။

## Static analysis နှင့် formatting

```bash
flutter analyze
 dart format lib
```

`dart format lib` command တွင် ရှေ့က space မပါစေရန် အောက်ပါပုံစံဖြင့်လည်း run နိုင်ပါသည်။

```bash
dart format lib
```

## Myanmar font

`assets/fonts/NotoSansMyanmar-Regular.ttf` တွင် `Noto Sans Myanmar` font ကို ထည့်ပြီး `pubspec.yaml` တွင် `NotoSansMyanmar` family အဖြစ် register လုပ်ထားသည်။ `flutter pub get` ပြီးနောက် asset ကို bundle လုပ်မည်။

## Phase 2 တွင် မပါသေးသောအရာများ

- Course JSON loading
- Lesson unlocking
- Quiz logic
- XP, Energy, Daily Streak
- Achievements data
- Firebase Authentication/Firestore

အဆိုပါ feature များကို နောက် Phase များတွင်သာ ထည့်သွင်းမည်။
