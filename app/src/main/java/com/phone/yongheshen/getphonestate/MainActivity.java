package com.phone.yongheshen.getphonestate;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.telephony.TelephonyManager;
import android.view.WindowManager;
import android.widget.TextView;

public class MainActivity extends Activity
{

    private TextView textView;

    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        textView = (TextView) findViewById(R.id.tv_info);
        getInfo();
    }

    private void getWH(){
        WindowManager wm = (WindowManager) this.getSystemService(Context.WINDOW_SERVICE);
        int width = wm.getDefaultDisplay().getWidth();
        int height = wm.getDefaultDisplay().getHeight();
        textView.setText("宽度：" + width + "\n高度：" + height);
    }

    private void getInfo() {
        TelephonyManager mTm = (TelephonyManager) getSystemService(TELEPHONY_SERVICE);
        String imei = mTm.getDeviceId();//获取运营商sim卡imsi号
        String imsi = mTm.getSubscriberId();//手机唯一的标识
        String mtype = android.os.Build.MODEL; // 手机型号
        textView.setText("sim卡imsi号：" + imei + "\n手机唯一的标识：" + imsi+ "\n手机型号：" + mtype);
    }
}
