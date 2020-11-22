class Iso3166Code {
  static final Map<String, String> isoCodes = {
    "Andorra": "ad",
    "Albania": "al",
    "Austria": "at",
    "Bosnia-and-Herzegovina": "ba",
    "Belarus": "by",
    "Belgium": "be",
    "Bulgaria": "bg",
    "Switzerland": "ch",
    "Czechia": "cz",
    "Germany": "de",
    "Denmark": "dk",
    "Estonia": "ee",
    "Spain": "es",
    "Finland": "fi",
    "Faeroe-Islands": "fo",
    "France": "fr",
    "UK": "gb",
    "Channel-Islands": "gg",
    "Gibraltar": "gi",
    "Greece": "gr",
    "Croatia": "hr",
    "Hungary": "hu",
    "Ireland": "ie",
    "Isle-of-Man": "im",
    "Iceland": "is",
    "Italy": "it",
    "Liechtenstein": "li",
    "Lithuania": "lt",
    "Luxembourg": "lu",
    "Latvia": "lv",
    "Monaco": "mc",
    "Moldova": "md",
    "Montenegro": "me",
    "North-Macedonia": "mk",
    "Malta": "mt",
    "Netherlands": "nl",
    "Norway": "no",
    "Poland": "pl",
    "Portugal": "pt",
    "Romania": "ro",
    "Serbia": "rs",
    "Russia": "ru",
    "Ukraine": "ua",
    "Sweden": "se",
    "Slovenia": "si",
    "Slovakia": "sk",
    "San-Marino": "sm",
    "Vatican-City": "va",
    "Kosovo": "xk"
  };
  static String getCode(String country) {
    if (isoCodes.containsKey(country)) {
      return isoCodes[country];
    } else {
      return null;
    }
  }
}
