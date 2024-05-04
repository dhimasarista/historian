import 'package:flutter/material.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text("Popular: "),
      Row(
        children: List.generate(3, (index) {
          List<String> arr = ["East Asia", "WW2", "Southeast Asia"];
          return Row(
            children: [
              const SizedBox(
                width: double.minPositive,
              ),
              TextButton(
                child: Text(
                  arr[index],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Alert"),
                          content: Text(arr[index]),
                          actions: [
                            OutlinedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Close"))
                          ],
                        );
                      });
                },
              )
            ],
          );
        }),
      ),
    ]));
  }
}
