import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;
import '../data/database.dart';

class AppUtils {
  
  static Map<String, dynamic> angerCarrots = {
    "red": {
      "text": "To find peace from **outburst**, try **calm** by taking a moment to breathe deeply and consciously slowing down your reaction.",
      "image": "red_carrot.png"
    },
    "orange": {
      "text": "To find peace from **agitation**, practice **patience** by accepting that some things are beyond your control.",
      "image": "orange_carrot.png"
    },
    "yellow": {
      "text": "To find peace from **frustration**, find **acceptance** by letting go of the need for things to be different.",
      "image": "yellow_carrot.png"
    },
    "green": {
      "text": "To find peace from **resentment**, feel **gratitude** by focusing on the blessings you already have.",
      "image": "green_carrot.png"
    },
    "blue": {
      "text": "To find peace from **suppressed anger**, find healthy **expression** by communicating your feelings instead of holding them in.",
      "image": "blue_carrot.png"
    },
    "indigo": {
      "text": "To find peace from **deep-seated bitterness**, practice **empathy** by trying to understand the other person's perspective.",
      "image": "indigo_carrot.png"
    },
    "violet": {
      "text": "To find peace from **contempt**, find **humility** by recognizing a shared humanity rather than seeking dominance.",
      "image": "violet_carrot.png"
    },
    "white": {
      "text": "To find peace from **pure anger**, achieve true **inner peace** by addressing every facet of your anger.",
      "image": "white_carrot.png"
    }
  };

  static Map<String, dynamic> peaceCarrots = {
    "red": {
      "name" : "red carrot of outbust",
      "text": "To counter the **outburst**, cultivate **calm** by taking a moment to breathe deeply and consciously slowing down your reaction.",
      "image": "red_carrot.png"
    },
    "orange": {
      "name": "orange carrot of agitation",
      "text": "To counter **agitation**, practice **patience** by accepting that some things are beyond your control.",
      "image": "orange_carrot.png"
    },
    "yellow": {
      "name": "yellow carrot of frustration",
      "text": "To counter **frustration**, choose **acceptance** by letting go of the need for things to be different.",
      "image": "yellow_carrot.png"
    },
    "green": {
      "name": "green carrot of resentment",
      "text": "To counter **resentment**, embrace **gratitude** by focusing on the blessings you already have.",
      "image": "green_carrot.png"
    },
    "blue": {
      "name": "blue carrot of suppressed anger",
      "text": "To counter **suppressed anger**, allow for healthy **expression** by communicating your feelings instead of holding them in.",
      "image": "blue_carrot.png"
    },
    "indigo": {
      "name": "indigo carrot of deep seated bitterness",
      "text": "To counter **deep-seated bitterness**, foster **empathy** by trying to understand the other person's perspective.",
      "image": "indigo_carrot.png"
    },
    "violet": {
      "name": "violet carrot of contept",
      "text": "To counter **contempt**, practice **humility** by recognizing a shared humanity rather than seeking dominance.",
      "image": "violet_carrot.png"
    },
    "white": {
      "name": "white carrot of pure anger",
      "text": "To counter **pure anger**, pursue true **inner peace** by addressing every facet of your anger.",
      "image": "white_carrot.png"
    }
  };


  static String capitalize(String text) {
    if (text.isEmpty) {
      return '';
    }
    return text[0].toUpperCase() + text.substring(1);
  }


  static Future<void> onShareImage(BuildContext context, Carrot carrot) async {
    // Path to the image asset. Make sure you have an image in the assets folder
    // and that it's listed in pubspec.yaml.
    final ByteData bytes = await rootBundle.load('assets/${carrot.carrotColor}_carrot.png');

    // Decode the image to an Image object
    final img.Image? originalImage = img.decodeImage(bytes.buffer.asUint8List());
    
    if (originalImage == null) {
      // Handle error: could not decode image
      return;
    }

     // Create a new image with a white background.
    final img.Image whiteBackground = img.Image(
      width: originalImage.width,
      height: originalImage.height,
      format: img.Format.uint8,
      numChannels: 4,
    );
    img.fill(whiteBackground, color: img.ColorRgba8(255, 255, 255, 255));
    // Composite the original image onto the white background.
    img.compositeImage(whiteBackground, originalImage);



    // Resize the new image to 200x200 pixels
    final img.Image iamgeWithBg = img.copyResize(whiteBackground, width: 200, height: 200);

    // Get the temporary directory to save the file
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/white_background_carrot.png');
    final Uint8List whiteBgList = Uint8List.fromList(img.encodePng(iamgeWithBg));
    await file.writeAsBytes(whiteBgList);

    String messageBody = peaceCarrots[carrot.carrotColor]["text"];
    String carrotName = peaceCarrots[carrot.carrotColor]["name"];

    await SharePlus.instance.share(ShareParams(
        text: 'Hi ${carrot.contact.name}, this is the $carrotName. \n\n$messageBody',
        files: [XFile(file.path)]
      )
    );
  }

  static String capitalizeFirstOfEach(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input.split(' ').map((word) {
      if (word.isEmpty) {
        return '';
      }
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }
  
} 