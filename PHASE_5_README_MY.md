# Phase 5 — Code Viewer နှင့် Sample Output

## ထည့်သွင်းထားသော feature များ

- Code ကို line number နှင့် ပြခြင်း
- Code အရှည်များအတွက် horizontal scroll
- Code ကို select လုပ်၍ copy ပြုလုပ်ခြင်း
- Code copy ပြီးကြောင်း Myanmar SnackBar message
- Sample output ကို show/hide ပြုလုပ်ခြင်း
- Sample output ကို copy ပြုလုပ်ခြင်း
- Code နှင့် output နှစ်ခုလုံးကို selectable text အဖြစ် ပြခြင်း
- Dark/Light theme အလိုက် code/output card color ပြောင်းခြင်း
- Reusable `CodeViewer` နှင့် `SampleOutputCard` widgets

## သက်ဆိုင်သော File များ

```text
lib/core/widgets/code_viewer.dart
lib/core/widgets/sample_output_card.dart
lib/features/courses/presentation/lesson_detail_screen.dart
```

## Run လုပ်နည်း

```bash
cd java_mimo_app
flutter pub get
flutter run -d chrome
```

## Test လုပ်နည်း

1. `သင်တန်းများ` → `Java` → Lesson 1 ကို ဖွင့်ပါ။
2. Code example အပေါ်တွင် line number များ ပြနေကြောင်း စစ်ပါ။
3. Code အရှည်ကို ဘယ်/ညာ scroll လုပ်ကြည့်ပါ။
4. Copy icon ကိုနှိပ်ပြီး Code ကို paste လုပ်ကြည့်ပါ။
5. `Sample output` ကို ဖျောက်ပြီး ပြန်ပြပါ။
6. Sample output copy icon ကိုနှိပ်ပြီး paste လုပ်ကြည့်ပါ။
7. Code နှင့် output text ကို long press သို့မဟုတ် mouse select လုပ်ကြည့်ပါ။
8. Light/Dark theme နှစ်မျိုးလုံးတွင် contrast ကောင်းမွန်ကြောင်း စစ်ပါ။

## အရေးကြီးသော ကန့်သတ်ချက်

ဤ Phase တွင် Java code ကို အမှန်တကယ် compile/run မလုပ်သေးပါ။ `Sample output` သည် lesson JSON ထဲတွင် ကြိုတင်သတ်မှတ်ထားသော expected output ကို ပြခြင်းဖြစ်သည်။ Java execution engine ထည့်သွင်းခြင်းကို နောက်ပိုင်း server သို့မဟုတ် sandbox architecture ဖြင့် သီးခြားလုပ်ဆောင်ရမည်။
