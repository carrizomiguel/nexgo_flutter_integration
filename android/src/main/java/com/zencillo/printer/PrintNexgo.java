package com.zencillo.printer;

import android.content.Context;
import android.widget.Toast;

import com.nexgo.oaf.apiv3.APIProxy;
import com.nexgo.oaf.apiv3.DeviceEngine;
import com.nexgo.oaf.apiv3.device.printer.AlignEnum;
import com.nexgo.oaf.apiv3.device.printer.DotMatrixFontEnum;
import com.nexgo.oaf.apiv3.device.printer.FontEntity;
import com.nexgo.oaf.apiv3.device.printer.OnPrintListener;
import com.nexgo.oaf.apiv3.device.printer.Printer;

public class PrintNexgo {
    private DeviceEngine deviceEngine;
    private Printer printer;
    private String sTextToPrint;

    private FontEntity fontNormal = new FontEntity(
        DotMatrixFontEnum.CH_SONG_24X24,
        DotMatrixFontEnum.ASC_SONG_12X24
    );

    public PrintNexgo(String sTextToPrint, Context context) {
        try {
            this.sTextToPrint = sTextToPrint;
            deviceEngine = APIProxy.getDeviceEngine(context);
            printer = deviceEngine.getPrinter();
            String isPrinterNull = "Printer is null ==> " + String.valueOf(printer == null);
            Toast.makeText(context, isPrinterNull, Toast.LENGTH_LONG).show();
        } catch (Exception e) {
            Toast.makeText(context, String.valueOf(e), Toast.LENGTH_LONG).show();
        }
    }

    public void initPrint(Context context) {
        try {
            printer.initPrinter();
            printer.setLetterSpacing(0);
            printer.appendPrnStr(sTextToPrint, fontNormal, AlignEnum.CENTER);

            printer.startPrint(true, new OnPrintListener() {
                @Override
                public void onPrintResult(int i) {
                    // skip.
                }
            });
        } catch (Exception e) {
            Toast.makeText(context, String.valueOf(e), Toast.LENGTH_LONG).show();
        }
    }
}
