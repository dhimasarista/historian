
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   MyHomePageState createState() => MyHomePageState();
// }

// class MyHomePageState extends State<MyHomePage> {
//   String _response = "Push Fetch Button!";

//   Future<void> fetchData() async {
//     try {
//       final response = await http.get(Uri.parse('http://localhost:9999/'));
//       if (response.statusCode == 200) {
//         _response = "API Connected";
//       } else {
//         _response = "API Not Connected";
//       }
//     } catch (error) {
//       setState(() {
//         _response = 'Error: $error';
//       });
//     }
//   }

//   @override

//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Historian"),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Text(_response),
//             TextButton(onPressed: fetchData, child: const Text("Fetch"))
//           ],
//         ),
//       ),
//     );
//   }
// }
