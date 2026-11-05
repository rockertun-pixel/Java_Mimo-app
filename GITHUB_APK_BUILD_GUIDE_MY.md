# GitHub Actions ဖြင့် APK ထုတ်နည်း

ဤနည်းလမ်းသည် Android Studio မလိုဘဲ GitHub ၏ cloud runner ပေါ်တွင် Flutter APK build လုပ်ပေးသည်။ Workflow ဖိုင်သည် `flutter create --platforms=android .` ဖြင့် မရှိသေးသော Android platform files များကို CI အတွင်း ဖန်တီးပြီး `app-release.apk` ကို artifact အဖြစ် upload လုပ်သည်။

## အခမဲ့အသုံးပြုမှု

Public GitHub repository တွင် GitHub-hosted standard runner အသုံးပြုမှုသည် အခမဲ့ဖြစ်သည်။ Private repository အတွက် GitHub plan ပေါ်မူတည်သည့် Actions minutes/limits ရှိနိုင်သည်။ Public repository သုံးလျှင် သင့် source code နှင့် lesson content များကို အများမြင်နိုင်ကြောင်း သတိပြုပါ။ Private repository သုံးလိုလျှင် GitHub account plan ၏ included minutes ကို စစ်ပါ။

## အဆင့် ၁ — GitHub repository ဖန်တီးခြင်း

1. `https://github.com` သို့ဝင်ပါ။
2. `New repository` ကိုနှိပ်ပါ။
3. Repository name ကို `java-mimo-app` ဟုရေးပါ။
4. GitHub Actions အခမဲ့ run လုပ်လိုလျှင် `Public` ကိုရွေးနိုင်သည်။
5. `Add a README file` ကို မရွေးဘဲ repository ကို ဖန်တီးပါ။

## အဆင့် ၂ — Project ကို upload လုပ်ခြင်း

ZIP ကို ဖြည်ပြီး project root ထဲတွင် `pubspec.yaml`, `lib/`, `assets/` နှင့် `.github/workflows/build-apk.yml` ရှိရမည်။ ထို့နောက် terminal မှ:

```bash
cd java_mimo_app
git init
git add .
git commit -m "Add Flutter Java learning app"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/java-mimo-app.git
git push -u origin main
```

`YOUR_USERNAME` ကို ကိုယ့် GitHub username ဖြင့် အစားထိုးပါ။ GitHub က login တောင်းလျှင် browser login သို့မဟုတ် GitHub personal access token ကို အသုံးပြုရနိုင်သည်။ Password အစား token လိုနိုင်သည်။

## အဆင့် ၃ — Workflow run လုပ်ခြင်း

1. GitHub repository ၏ `Actions` tab ကို ဖွင့်ပါ။
2. `Build Android APK` workflow ကို ရွေးပါ။
3. `Run workflow` ကိုနှိပ်ပါ။
4. `main` branch ကို ရွေးပြီး `Run workflow` ကို နှိပ်ပါ။
5. Job ပြီးသည်အထိ စောင့်ပါ။ ပထမဆုံး build တွင် package download ကြောင့် အချိန်ပိုကြာနိုင်သည်။

`flutter analyze` အမှားရှိလျှင် workflow သည် APK မထုတ်ဘဲ ရပ်မည်။ အမှားကို workflow log ထဲမှ ဖတ်ပြီး code ပြင်ကာ commit/push ပြန်လုပ်ပါ။

## အဆင့် ၄ — APK download လုပ်ခြင်း

1. ပြီးဆုံးသွားသော workflow run ကို ဖွင့်ပါ။
2. အောက်ခြေရှိ `Artifacts` အပိုင်းတွင် `java-mimo-release-apk` ကို တွေ့ရမည်။
3. Artifact ကို download လုပ်ပါ။
4. ZIP ဖြည်ပြီး `app-release.apk` ကို Android ဖုန်းထဲ ကူးပါ။
5. APK ကို ဖွင့်ပြီး install လုပ်ပါ။

ဖုန်းက unknown source install ခွင့်တောင်းလျှင် browser/file manager အတွက် ခွင့်ပြုချက်ပေးရနိုင်သည်။ ကိုယ့်ကိုယ်ပိုင် build ဖြစ်သောကြောင့် APK ကို ယုံကြည်ရသည့် source မှသာ install လုပ်ပါ။

## နောက်ပိုင်း code ပြင်ပြီး APK ပြန်ထုတ်နည်း

```bash
git add .
git commit -m "Update Java lessons"
git push
```

`main` branch သို့ push တိုင်း workflow အလိုအလျောက် run မည်။ သို့မဟုတ် `Actions` → `Build Android APK` → `Run workflow` မှ ကိုယ်တိုင် run နိုင်သည်။

## Release APK နှင့် Play Store အတွက် သတိပြုရန်

ဤ workflow သည် စမ်းသပ်ရန်နှင့် ကိုယ်ပိုင်ဖုန်းတွင် install လုပ်ရန် release APK ထုတ်ပေးသည်။ Google Play Store တင်ရန် app ကို release signing key ဖြင့် sign လုပ်ရမည်။ Signing key ကို GitHub repository ထဲသို့ မတင်ရပါ။ နောက်ပိုင်း GitHub Secrets နှင့် Android signing setup သီးခြားထည့်ရမည်။

## Workflow file

```text
.github/workflows/build-apk.yml
```

ဤ workflow သည်:

- Java 17 setup လုပ်သည်
- Flutter stable setup လုပ်သည်
- Android platform files generate လုပ်သည်
- `flutter pub get` run လုပ်သည်
- `flutter analyze` run လုပ်သည်
- `flutter build apk --release` run လုပ်သည်
- APK ကို ၇ ရက်ကြာ artifact အဖြစ် သိမ်းသည်
