import 'package:flutter/material.dart';
import 'package:peacecarrots/utils/utils.dart';
import '../data/database.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:flutter/services.dart';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:image/image.dart' as img;
// import '../utils/utils.dart';

class CarrotList extends StatelessWidget {
  final List<Carrot> carrots;

  const CarrotList({
    required this.carrots,
    super.key
  });

  // Future<void> _onShareImage(BuildContext context, Carrot carrot) async {
  //   // Path to the image asset. Make sure you have an image in the assets folder
  //   // and that it's listed in pubspec.yaml.
  //   final ByteData bytes = await rootBundle.load('assets/${carrot.carrotColor}_carrot.png');
  //   final Uint8List list = bytes.buffer.asUint8List();

  //   // Decode the image to an Image object
  //   final img.Image? originalImage = img.decodeImage(bytes.buffer.asUint8List());
    
  //   if (originalImage == null) {
  //     // Handle error: could not decode image
  //     return;
  //   }
    
  //   // Resize the image to 200x200 pixels
  //   // final img.Image resizedImage = img.copyResize(originalImage, width: 100, height: 200);

    
  //   // // Encode the resized image back to PNG format
  //   // final Uint8List resizedList = Uint8List.fromList(img.encodePng(resizedImage));
  //   //final tempDir = await getTemporaryDirectory();
  //   //final file = File('${tempDir.path}/${carrot.carrotColor}_carrot.png');

  //    // Create a new image with a white background.
  //   final img.Image whiteBackground = img.Image(
  //     width: originalImage.width,
  //     height: originalImage.height,
  //     format: img.Format.uint8,
  //     numChannels: 4,
  //   );
  //   img.fill(whiteBackground, color: img.ColorRgba8(255, 255, 255, 255));
  //   // Composite the original image onto the white background.
  //   img.compositeImage(whiteBackground, originalImage);



  //   // Resize the new image to 200x200 pixels
  //   final img.Image iamgeWithBg = img.copyResize(whiteBackground, width: 200, height: 200);

  //   // Get the temporary directory to save the file
  //   final tempDir = await getTemporaryDirectory();
  //   final file = File('${tempDir.path}/white_background_carrot.png');
  //   final Uint8List whiteBgList = Uint8List.fromList(img.encodePng(iamgeWithBg));
  //   await file.writeAsBytes(whiteBgList);

  //   String messageBody = AppUtils.peaceCarrots[carrot.carrotColor]["text"];
  //   String carrotName = AppUtils.peaceCarrots[carrot.carrotColor]["name"];

  //   await SharePlus.instance.share(ShareParams(
  //       text: 'Hi ${carrot.contact.name}, this is the $carrotName. \n\n$messageBody',
  //       files: [XFile(file.path)]
  //     )
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: carrots.length,
        itemBuilder: (ctx, idx) {
          String carrotColor = carrots[idx].carrotColor;
          String contactName = carrots[idx].contact.name;

          return Container(
            key: ValueKey(carrots[idx].id),
            margin: EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: ListTile(
              onTap: () => AppUtils.onShareImage(ctx,carrots[idx]),
              leading: Image.asset('assets/${carrotColor}_carrot.png', height: 30,),
              title: Text(contactName),
            ),
          );
        } 
      ),
    );
  }
}