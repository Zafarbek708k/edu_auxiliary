import "dart:async";
import "package:edu_auxiliary/setup.dart";
import "package:edu_auxiliary/src/core/constants/all_library.dart";
import "package:flutter/services.dart";
import "package:l/l.dart";
import "package:edu_auxiliary/src/app.dart";

void run()=> l.capture<void>(
    ()=> runZonedGuarded<void>(
        ()async{
          debugPrint("App Running");
          await setup();
          await SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp],
          ).then(
              (_)=> App.run(),
          );
        },
        (final error, final stackTree){
          l.e(
            "io_top_level_error: $error && $stackTree",
            stackTree,
          );
        },
    ),
  const LogOptions(
    printColors: true,
    handlePrint: true,
    outputInRelease: true,
  ),
);


