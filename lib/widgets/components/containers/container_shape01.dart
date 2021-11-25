import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:shop_list/widgets/design/design_widgets.dart';

class ContainerShape01 extends StatelessWidget {
  const ContainerShape01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipPath(
        clipper: WaveClipperTwo(),
        child: Container(
          height: MediaQuery.of(context).size.height * .15,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: DesignWidgets.linearGradientMain(context)),
        ),
      ),
    );
  }
}
