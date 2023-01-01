class BirdSound {

  // var map = {"BUFFLEHEAD": "https://www.bird-sounds.net/sounds/962.mp3"};
  var map = {
    "ALBATROSS":"https://www.bird-sounds.net/sounds/915.mp3","AMERICAN AVOCET":"https://www.bird-sounds.net/sounds/857.mp3",
    "AMERICAN BITTERN":"https://www.bird-sounds.net/sounds/687.mp3",
    "AMERICAN COOT":"https://www.bird-sounds.net/sounds/859.mp3",
    "AMERICAN GOLDFINCH":"https://www.bird-sounds.net/sounds/1638.mp3",
    "AMERICAN KESTREL":"https://www.bird-sounds.net/sounds/864.mp3",
    "AMERICAN PIPIT":"https://www.bird-sounds.net/sounds/866.mp3",
    "AMERICAN REDSTART":"https://www.bird-sounds.net/sounds/867.mp3",
    "AMERICAN WIGEON":"https://www.bird-sounds.net/american-wigeon/",
    "ANHINGA":"https://www.bird-sounds.net/sounds/875.mp3",
    "ANNAS HUMMINGBIRD":"https://www.bird-sounds.net/sounds/876.mp3",
    "BALD EAGLE":"https://www.bird-sounds.net/sounds/885.mp3",
    "BARN OWL":"https://www.bird-sounds.net/sounds/807.mp3",
    "BARN SWALLOW":"https://www.bird-sounds.net/sounds/790.mp3",
    "BAY-BREASTED WARBLER":"https://www.bird-sounds.net/sounds/892.mp3",
    "BLACK SKIMMER":"https://www.bird-sounds.net/sounds/906.mp3",
    "BOBOLINK":"https://www.bird-sounds.net/sounds/941.mp3",
    "BROWN CREPPER":"https://www.bird-sounds.net/sounds/954.mp3",
    "CALIFORNIA GULL":"https://www.bird-sounds.net/sounds/969.mp3",
    "CINNAMON TEAL":"https://www.bird-sounds.net/sounds/998.mp3",
    "DOWNY WOODPECKER":"https://www.bird-sounds.net/sounds/1032.mp3",
    "EASTERN BLUEBIRD":"https://www.bird-sounds.net/sounds/1640.mp3",
    "GOLDEN CHEEKED WARBLER":"https://www.bird-sounds.net/sounds/1067.mp3",
    "GREY PLOVER":"https://www.bird-sounds.net/sounds/911.mp3",
    "HORNED LARK":"https://www.bird-sounds.net/sounds/714.mp3",
    "KING EIDER":"https://www.bird-sounds.net/sounds/1124.mp3",
    "LOGGERHEAD SHRIKE":"https://www.bird-sounds.net/sounds/1152.mp3",
    "MALLARD DUCK":"https://www.bird-sounds.net/sounds/1605.mp3",
    "NORTHERN CARDINAL":"https://www.bird-sounds.net/sounds/1630.mp3",
    "OSPREY":"https://www.bird-sounds.net/sounds/760.mp3",
    "PEACOCK":"https://www.bird-sounds.net/sounds/1014.mp3",
    "ROBIN":"https://www.bird-sounds.net/sounds/1634.mp3",
    "SANDHILL CRANE":"https://www.bird-sounds.net/sounds/1290.mp3",
    "SKUA":"https://www.bird-sounds.net/sounds/1088.mp3",
    "SNOWY PLOVER":"https://www.bird-sounds.net/sounds/1313.mp3",
    "TROPICAL KINGBIRD":"https://www.bird-sounds.net/sounds/1343.mp3",
    "VEERY":"https://www.bird-sounds.net/sounds/1351.mp3",
    "WHITE TAILED TROPIC":"https://www.bird-sounds.net/sounds/1382.mp3",
    "WILD TURKEY":"https://www.bird-sounds.net/sounds/1388.mp3",
    "YELLOW HEADED BLACKBIRD":"https://www.bird-sounds.net/sounds/1411.mp3",
};

  String? sound(String name) {
    if (map.containsKey(name)) {
      return map[name];
    }
    else {
      return 'https://www.bird-sounds.net/sounds/1634.mp3';
    }
  }
}