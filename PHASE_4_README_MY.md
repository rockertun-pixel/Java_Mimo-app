# Phase 4 — Multiple-choice Quiz နှင့် XP Reward

## ထည့်သွင်းထားသော feature များ

- Java lesson တစ်ခုချင်းစီအတွက် local Quiz JSON
- Multiple-choice answer ရွေးချယ်မှု
- အဖြေစစ်ဆေးခြင်း
- Correct / Incorrect feedback
- Myanmar explanation ပြခြင်း
- Quiz progress indicator
- Quiz result screen
- အောင်မြင်ရန် အနည်းဆုံး ၇၀% စည်းမျဉ်း
- Quiz pass ဖြစ်မှသာ Lesson completion သိမ်းခြင်း
- Lesson ၏ `xpReward` အတိုင်း XP တိုးခြင်း
- XP နှင့် completed lesson data ကို local storage တွင် သိမ်းခြင်း
- Quiz မအောင်လျှင် ပြန်ဖြေနိုင်ခြင်း

## Run လုပ်နည်း

```bash
cd java_mimo_app
flutter pub get
flutter run -d chrome
```

## Test လုပ်နည်း

1. `သင်တန်းများ` → `Java` → Lesson 1 ကို ဖွင့်ပါ။
2. `Quiz စတင်ရန်` ကိုနှိပ်ပါ။
3. Option တစ်ခုရွေးပြီး `အဖြေစစ်မည်` ကိုနှိပ်ပါ။
4. အဖြေမှန်/မမှန်နှင့် Myanmar explanation ကို စစ်ပါ။
5. မေးခွန်းအားလုံး ဖြေပြီး `ရလဒ်ကြည့်မည်` ကိုနှိပ်ပါ။
6. ၇၀% နှင့်အထက်ရလျှင် `အောင်မြင်ပါသည်။` ပြရမည်။
7. `သင်ခန်းစာပြီးမြောက်ကြောင်း သိမ်းမည်` ကိုနှိပ်ပါ။
8. Lesson list သို့ ပြန်ရောက်လျှင် Lesson complete ဖြစ်ပြီး နောက် Lesson unlock ဖြစ်ရမည်။
9. ၇၀% မပြည့်လျှင် `ထပ်မံကြိုးစားပါ။` ပြရမည်။
10. မအောင်မြင်သော result တွင် Lesson completion နှင့် XP မတိုးရပါ။

## Quiz data format

```json
{
  "id": "java-001-q1",
  "lessonId": "java-001",
  "questionMyanmar": "မေးခွန်းစာသား",
  "options": ["Option A", "Option B"],
  "correctOptionIndex": 0,
  "explanationMyanmar": "ရှင်းလင်းချက်"
}
```

Question, explanation နှင့် UI message များကို Myanmar Unicode ဖြင့်ထားပြီး code နှင့် technical terms များကို English အတိုင်းထားသည်။

## Phase 4 တွင် မပါသေးသောအရာများ

- Energy points ဖြတ်တောက်ခြင်း
- Daily streak
- Quiz history
- Random question order
- Server-side result validation
- Firebase sync
