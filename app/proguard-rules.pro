# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in /Users/yongheshen/SDK/android-sdk-macosx/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

-optimizationpasses 5          # 指定代码的压缩级别
-dontusemixedcaseclassnames   # 是否使用大小写混合
-dontpreverify           # 混淆时是否做预校验
-verbose                # 混淆时是否记录日志

-keep public class * extends android.app.Fragment
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgentHe
-keep public class * extends android.support.v4.**
-keep public class * extends android.preference.Preference
-keep public class com.android.vending.licensing.ILicensingService

-keep class org.apache.http.** { *; }
-dontwarn org.apache.http.**
-dontwarn android.net.**

#一般model最好避免混淆（model无关紧要，不混淆也没多大关系）
-keep class com.xxx.xxx.model.** { *; }

-keepclasseswithmembernames class * {  # 保持 native 方法不被混淆
    native <methods>;
}
-keepclasseswithmembers class * {   # 保持自定义控件类不被混淆
    public <init>(android.content.Context, android.util.AttributeSet);
}
-keepclasseswithmembers class * {# 保持自定义控件类不被混淆
    public <init>(android.content.Context, android.util.AttributeSet, int);
}
-keepclassmembers class * extends android.app.Activity { # 保持自定义控件类不被混淆
    public void *(android.view.View);
}
-keepclassmembers enum * {     # 保持枚举 enum 类不被混淆
    public static **[] values();
    public static ** valueOf(java.lang.String);
}
-keep class * implements android.os.Parcelable { # 保持 Parcelable 不被混淆
    public static final android.os.Parcelable$Creator *;
}

#TD混淆配置
-keep public class com.tendcloud.tenddata.** {  public protected *;}
-dontwarn com.tendcloud.tenddata.**

#高德定位混淆配置(如果爆出warning，在报出warning的包加入类似的语句：-dontwarn 包名)
-keep class com.amap.api.location.**{*;}
-keep class com.amap.api.fence.**{*;}
-keep class com.autonavi.aps.amapapi.model.**{*;}

#webview与js交互  class <包名>.类名$*  这里的类名是你写js交互方法的类 内部类
#-keepclassmembers class 包名.类名$内部类名 {
#  public *;
#}
#webview与js交互  class <包名>.类名$*  这里的类名是你写js交互方法的类
-keepclassmembers class ccom.pingan.paces.ccms.html.TCJavaScriptInterface {
  public *;
}

#保护注解
-keepattributes *Annotation*
-keepattributes *JavascriptInterface*


#魔推
-keep class com.google.protobuf.** { *; }
-keep class com.mrocker.push.** { *; }

#shareSDK
-keep class cn.sharesdk.**{*;}
-keep class com.sina.**{*;}
-keep class **.R$* {*;}
-keep class **.R{*;}
-keep class com.mob.**{*;}
-dontwarn com.mob.**
-dontwarn cn.sharesdk.**
-dontwarn **.R$*
-keep class m.framework.**{*;}

#保留一个完整的包，如果有些类调用了jni也不需要混淆，不然会出错
#-keep class com.xxx.** {*;}

#这个是保持项目中的第三方jar不混淆
#-libraryjars libs/xxx.jar