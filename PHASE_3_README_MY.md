# Phase 3 — Local Course Data နှင့် Sequential Lesson Unlocking

## ထည့်သွင်းထားသော feature များ

- `assets/data/courses.json` မှ Course list ဖတ်ခြင်း
- `assets/data/lessons_java.json` မှ Java lesson list ဖတ်ခြင်း
- `Java`, `HTML`, `Python`, `Dart` course cards
- Java lesson ၃ ခု
- ပထမ Lesson ကို အလိုအလျောက် unlock လုပ်ခြင်း
- ရှေ့ Lesson ပြီးမြောက်မှ နောက် Lesson unlock လုပ်ခြင်း
- Lesson progress ကို `shared_preferences` ဖြင့် local သိမ်းခြင်း
- ပြီးမြောက်သည့် Lesson count နှင့် progress bar
- Lesson detail တွင် explanation, code example နှင့် sample output
- Lesson ပြီးမြောက်ရန် button နှင့် next lesson unlocking
- Locked lesson ကိုနှိပ်လျှင် Myanmar error message ပြခြင်း
- Course/lesson data မရှိသည့်အခါ empty state ပြခြင်း

## Run လုပ်နည်း

```bash
cd java_mimo_app
flutter pub get
flutter run -d chrome
```

## Test လုပ်နည်း

1. `သင်တန်းများ` ကို ဖွင့်ပါ။
2. `Java` course ကို ရွေးပါ။
3. Lesson 1 ကို ဖွင့်ပါ။
4. Code example နှင့် Sample output ကို စစ်ပါ။
5. `သင်ခန်းစာပြီးမြောက်သည်ဟု မှတ်ပါ` ကို နှိပ်ပါ။
6. Lesson list သို့ပြန်ရောက်လျှင် Lesson 1 တွင် check icon ပြရမည်။
7. Lesson 2 သည် unlock ဖြစ်ရမည်။
8. Lesson 3 သည် Lesson 2 မပြီးသေးသရွေ့ lock ဖြစ်နေရမည်။
9. App ကို restart လုပ်ပြီး progress မပျောက်ကြောင်း စစ်ပါ။
10. Locked Lesson ကိုနှိပ်လျှင် `ရှေ့သင်ခန်းစာကို အရင်ပြီးမြောက်ပါ။` message ပြရမည်။

## Phase 3 တွင် မပါသေးသောအရာများ

- Quiz question နှင့် answer validation
- Energy points deduction
- Daily streak
- Achievement unlock
- Firebase sync
- HTML/Python/Dart lesson content

အဆိုပါအရာများကို နောက် Phase များတွင် ဆက်လက်ထည့်သွင်းမည်။
