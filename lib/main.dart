import 'package:brycs_game/provider/provider_data.dart';
import 'package:brycs_game/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft
  ]
  );

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,overlays: [SystemUiOverlay.bottom,SystemUiOverlay.top]);
  runApp(ChangeNotifierProvider(create: (context)=>AppChangedData(),child: const BricsGame(),));
}
class BricsGame extends StatelessWidget {
  const BricsGame({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
