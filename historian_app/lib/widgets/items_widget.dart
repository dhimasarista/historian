import 'package:flutter/material.dart';
import 'package:historian_app/models/history.dart';
import 'package:historian_app/providers/histories.dart';
import 'package:provider/provider.dart';

class ItemGrid extends StatelessWidget {
  ItemGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final histories = Provider.of<Histories>(context, listen: false);
    final allHistory = histories.allHistory;
    return GridView.builder(
        itemCount: allHistory.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1 / 1.2),
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: allHistory[index],
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 230,
              width: 200,
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 5,
                child: InkWell(
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/img/undraw_writer_q06d.png"),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 5,
                        right: 5,
                        child: Column(
                          children: [
                            Text(
                              allHistory[index].title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 4,
                                      color: Colors.black,
                                      offset: Offset(0, 1),
                                    )
                                  ]),
                            )
                          ],
                        ),
                      ),
                      Consumer<History>(builder: ((context, value, child) {
                        return Positioned(
                          top: 5,
                          right: 5,
                          child: Container(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              icon: value.bookmarked
                                  ? const Icon(Icons.bookmark)
                                  : const Icon(Icons.bookmark_border),
                              color: Colors.grey,
                              onPressed: () {
                                value.updateBookmark();
                              },
                            ),
                          ),
                        );
                      }))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
