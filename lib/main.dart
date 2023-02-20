import 'package:flutter/material.dart';
import 'screens/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: SignIn(),
    );
  }
}

// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Search Bar with List Example',
//       home: SearchList(),
//     );
//   }
// }
//
// class SearchList extends StatefulWidget {
//   @override
//   _SearchListState createState() => _SearchListState();
// }
//
// class _SearchListState extends State<SearchList> {
//   List<String> items = [    'Item 1',    'Item 2',    'Item 3',    'Item 4',    'Item 5',    'Item 6',  ];
//   List<String> filteredItems = [];
//
//   @override
//   void initState() {
//     super.initState();
//     filteredItems = items;
//   }
//
//   void filterList(String query) {
//     List<String> _filteredItems = [];
//     _filteredItems.addAll(items);
//     if (query.isNotEmpty) {
//       List<String> _tempList = [];
//       _filteredItems.forEach((item) {
//         if (item.toLowerCase().contains(query.toLowerCase())) {
//           _tempList.add(item);
//         }
//       });
//       _filteredItems = _tempList;
//     }
//     setState(() {
//       filteredItems = _filteredItems;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: TextField(
//           decoration: InputDecoration(
//             hintText: 'Search...',
//             border: InputBorder.none,
//           ),
//           onChanged: (value) {
//             filterList(value);
//           },
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: filteredItems.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             title: Text(filteredItems[index]),
//             onTap: () {
//               // do something when an item is tapped
//             },
//           );
//         },
//       ),
//     );
//   }
// }
