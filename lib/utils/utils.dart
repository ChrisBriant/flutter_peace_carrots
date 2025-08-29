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
      "text": "To counter the **outburst**, cultivate **calm** by taking a moment to breathe deeply and consciously slowing down your reaction.",
      "image": "red_carrot.png"
    },
    "orange": {
      "text": "To counter **agitation**, practice **patience** by accepting that some things are beyond your control.",
      "image": "orange_carrot.png"
    },
    "yellow": {
      "text": "To counter **frustration**, choose **acceptance** by letting go of the need for things to be different.",
      "image": "yellow_carrot.png"
    },
    "green": {
      "text": "To counter **resentment**, embrace **gratitude** by focusing on the blessings you already have.",
      "image": "green_carrot.png"
    },
    "blue": {
      "text": "To counter **suppressed anger**, allow for healthy **expression** by communicating your feelings instead of holding them in.",
      "image": "blue_carrot.png"
    },
    "indigo": {
      "text": "To counter **deep-seated bitterness**, foster **empathy** by trying to understand the other person's perspective.",
      "image": "indigo_carrot.png"
    },
    "violet": {
      "text": "To counter **contempt**, practice **humility** by recognizing a shared humanity rather than seeking dominance.",
      "image": "violet_carrot.png"
    },
    "white": {
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
  
} 