import 'package:flutter/foundation.dart';
import '../models/history.dart';

class Histories with ChangeNotifier {
  final List<History> _allHistory =
      List.generate(History().histories().length, (index) {
    final history = History().histories()[index];
    return History(
        id: history.id,
        image: history.image,
        title: history.title,
        year: history.year,
        involved: history.involved,
        location: history.location,
        description: history.description);
  });

  List<History> get allHistory {
    return _allHistory;
  }

  // void updateBookmark() {
  //   notifyListeners();
  // }
}
