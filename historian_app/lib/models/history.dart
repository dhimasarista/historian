import 'package:flutter/foundation.dart';

class History with ChangeNotifier {
  int id;
  String image;
  String title;
  String involved;
  String location;
  String year;
  String description;
  bool bookmarked;

  History({
    this.id = 0,
    this.image = "",
    this.title = "",
    this.year = "",
    this.involved = "",
    this.location = "",
    this.description = "",
    this.bookmarked = false,
  });

  void updateBookmark() {
    bookmarked = !bookmarked;
    notifyListeners();
  }

  List<History> histories() {
    return List.generate(11, (index) {
      return History(
          id: index,
          image: "assets/img/undraw_writer_q06d.png",
          title: "Title $index",
          year: "751 AD",
          involved: "Tang Empire(China), Abbasid Caliphate(Arab)",
          location: "China",
          description:
              "The Battle of Talas or Battle of Artlakh (Chinese: 怛羅斯戰役; pinyin: Dáluósī Zhànyì; Arabic: معركة نهر طلاس, romanized: Maʿrakat nahr Ṭalās, Persian: نبرد طراز Nabard-i Tarāz) was a military encounter and engagement between the Abbasid Caliphate along with its ally, the Tibetan Empire, against the Chinese Tang dynasty. In July 751 AD, Tang and Abbasid forces met in the valley of the Talas River to vie for control over the Syr Darya region of central Asia. According to Chinese sources, after several days of stalemate, the Karluk Turks, originally allied to the Tang Dynasty, defected to the Abbasid Army and tipped the balance of power, resulting in a Tang rout. The defeat marked the end of the Tang westward expansion and resulted in Islamic control of Transoxiana for the next 400 years. However, direct Muslim Arab control ended in 821 when power shifted to the Tahirid dynasty, a culturally Arabized Sunni Muslim dynasty of Persian Dehqan origin. Then the Turkic Ghaznavids took power in 977. Islamic control ended in 1124 when the non-Muslim Qara Khitai conquered Transoxania. Control of the region was economically beneficial for the Abbasid Arabs because it was on the Silk Road. Chinese prisoners captured in the aftermath of the battle are said to have brought paper-making technology to West Asia.");
    });
  }
}
