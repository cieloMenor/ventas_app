// // // import 'package:flutter/material.dart';

// // // void main() {
// // //   runApp(const MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   const MyApp({super.key});

// // //   // This widget is the root of your application.
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Flutter Demo',
// // //       theme: ThemeData(
// // //         // This is the theme of your application.
// // //         //
// // //         // TRY THIS: Try running your application with "flutter run". You'll see
// // //         // the application has a purple toolbar. Then, without quitting the app,
// // //         // try changing the seedColor in the colorScheme below to Colors.green
// // //         // and then invoke "hot reload" (save your changes or press the "hot
// // //         // reload" button in a Flutter-supported IDE, or press "r" if you used
// // //         // the command line to start the app).
// // //         //
// // //         // Notice that the counter didn't reset back to zero; the application
// // //         // state is not lost during the reload. To reset the state, use hot
// // //         // restart instead.
// // //         //
// // //         // This works for code too, not just values: Most code changes can be
// // //         // tested with just a hot reload.
// // //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// // //         useMaterial3: true,
// // //       ),
// // //       home: const MyHomePage(title: 'Flutter Demo Home Page'),
// // //     );
// // //   }
// // // }

// // // class MyHomePage extends StatefulWidget {
// // //   const MyHomePage({super.key, required this.title});

// // //   // This widget is the home page of your application. It is stateful, meaning
// // //   // that it has a State object (defined below) that contains fields that affect
// // //   // how it looks.

// // //   // This class is the configuration for the state. It holds the values (in this
// // //   // case the title) provided by the parent (in this case the App widget) and
// // //   // used by the build method of the State. Fields in a Widget subclass are
// // //   // always marked "final".

// // //   final String title;

// // //   @override
// // //   State<MyHomePage> createState() => _MyHomePageState();
// // // }

// // // class _MyHomePageState extends State<MyHomePage> {
// // //   int _counter = 0;

// // //   void _incrementCounter() {
// // //     setState(() {
// // //       // This call to setState tells the Flutter framework that something has
// // //       // changed in this State, which causes it to rerun the build method below
// // //       // so that the display can reflect the updated values. If we changed
// // //       // _counter without calling setState(), then the build method would not be
// // //       // called again, and so nothing would appear to happen.
// // //       _counter++;
// // //     });
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     // This method is rerun every time setState is called, for instance as done
// // //     // by the _incrementCounter method above.
// // //     //
// // //     // The Flutter framework has been optimized to make rerunning build methods
// // //     // fast, so that you can just rebuild anything that needs updating rather
// // //     // than having to individually change instances of widgets.
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         // TRY THIS: Try changing the color here to a specific color (to
// // //         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
// // //         // change color while the other colors stay the same.
// // //         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// // //         // Here we take the value from the MyHomePage object that was created by
// // //         // the App.build method, and use it to set our appbar title.
// // //         title: Text(widget.title),
// // //       ),
// // //       body: Center(
// // //         // Center is a layout widget. It takes a single child and positions it
// // //         // in the middle of the parent.
// // //         child: Column(
// // //           // Column is also a layout widget. It takes a list of children and
// // //           // arranges them vertically. By default, it sizes itself to fit its
// // //           // children horizontally, and tries to be as tall as its parent.
// // //           //
// // //           // Column has various properties to control how it sizes itself and
// // //           // how it positions its children. Here we use mainAxisAlignment to
// // //           // center the children vertically; the main axis here is the vertical
// // //           // axis because Columns are vertical (the cross axis would be
// // //           // horizontal).
// // //           //
// // //           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
// // //           // action in the IDE, or press "p" in the console), to see the
// // //           // wireframe for each widget.
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: <Widget>[
// // //             const Text(
// // //               'You have pushed the button this many times:',
// // //             ),
// // //             Text(
// // //               '$_counter',
// // //               style: Theme.of(context).textTheme.headlineMedium,
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //       floatingActionButton: FloatingActionButton(
// // //         onPressed: _incrementCounter,
// // //         tooltip: 'Increment',
// // //         child: const Icon(Icons.add),
// // //       ), // This trailing comma makes auto-formatting nicer for build methods.
// // //     );
// // //   }
// // // }

// // // import 'dart:convert';
// // // import 'package:flutter/material.dart';
// // // import 'package:http/http.dart' as http;

// // // void main() {
// // //   runApp(const MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   const MyApp({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Ventas App',
// // //       theme: ThemeData(
// // //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// // //         useMaterial3: true,
// // //       ),
// // //       home: const ReportesPage(),
// // //     );
// // //   }
// // // }

// // // class ReportesPage extends StatefulWidget {
// // //   const ReportesPage({super.key});

// // //   @override
// // //   _ReportesPageState createState() => _ReportesPageState();
// // // }

// // // class _ReportesPageState extends State<ReportesPage> {
// // //   List<dynamic> reportes = [];

// // //   // Función para obtener los reportes desde la API
// // //   Future<void> obtenerReportes() async {
// // //     try {
// // //       final response = await http
// // //           .get(Uri.parse('https://tiptop.firetensor.com/api/reportes'));

// // //       if (response.statusCode == 200) {
// // //         setState(() {
// // //           reportes = json.decode(response.body);
// // //         });
// // //       } else {
// // //         throw Exception('Error al cargar los reportes');
// // //       }
// // //     } catch (e) {
// // //       print('Error: $e');
// // //     }
// // //   }

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     obtenerReportes();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// // //         title: const Text('Reportes'),
// // //       ),
// // //       body: reportes.isEmpty
// // //           ? const Center(child: CircularProgressIndicator())
// // //           : ListView.builder(
// // //               itemCount: reportes.length,
// // //               itemBuilder: (context, index) {
// // //                 return ListTile(
// // //                   title: Text('Reporte: ${reportes[index]['nombre']}'),
// // //                   subtitle: Text('Monto: ${reportes[index]['monto']}'),
// // //                 );
// // //               },
// // //             ),
// // //     );
// // //   }
// // // }

// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:logging/logging.dart'; // Importa el paquete logging

// // void main() {
// //   // Configura el logger
// //   Logger.root.level = Level.ALL; // Configura el nivel de log
// //   Logger.root.onRecord.listen((record) {
// //     // Muestra el log en la consola
// //     print('${record.level.name}: ${record.time}: ${record.message}');
// //   });

// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Ventas App',
// //       theme: ThemeData(
// //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// //         useMaterial3: true,
// //       ),
// //       home: const ReportesPage(),
// //     );
// //   }
// // }

// // class ReportesPage extends StatefulWidget {
// //   const ReportesPage({super.key});

// //   @override
// //   ReportesPageState createState() => ReportesPageState();
// // }

// // class ReportesPageState extends State<ReportesPage> {
// //   List<dynamic> reportes = [];
// //   final Logger _logger =
// //       Logger('ReportesPage'); // Crea una instancia del logger

// //   // Función para obtener los reportes desde la API
// //   Future<void> obtenerReportes() async {
// //     try {
// //       final response = await http
// //           .get(Uri.parse('https://tiptop.firetensor.com/api/reportes'));

// //       if (response.statusCode == 200) {
// //         setState(() {
// //           reportes = json.decode(response.body);
// //         });
// //       } else {
// //         throw Exception('Error al cargar los reportes');
// //       }
// //     } catch (e) {
// //       _logger.severe('Error al obtener los reportes: $e'); // Usa el logger
// //     }
// //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     obtenerReportes();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// //         title: const Text('Reportes'),
// //       ),
// //       body: reportes.isEmpty
// //           ? const Center(child: CircularProgressIndicator())
// //           : ListView.builder(
// //               itemCount: reportes.length,
// //               itemBuilder: (context, index) {
// //                 return ListTile(
// //                   title: Text('Reporte: ${reportes[index]['nombre']}'),
// //                   subtitle: Text('Monto: ${reportes[index]['monto']}'),
// //                 );
// //               },
// //             ),
// //     );
// //   }
// // }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:logging/logging.dart'; // Importa el paquete logging

// void main() {
//   // Configura el logger
//   Logger.root.level = Level.ALL; // Configura el nivel de log
//   Logger.root.onRecord.listen((record) {
//     // Aquí se pueden guardar los registros de log, por ejemplo, en un archivo o enviar a un servidor.
//     // Ya no se usa 'print'.
//     // Puedes usar otras soluciones para almacenamiento de logs según tus necesidades.
//     // Ejemplo (en lugar de 'print', usa un sistema de almacenamiento adecuado):
//     // logToFile('${record.level.name}: ${record.time}: ${record.message}');
//   });

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Ventas App',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const ReportesPage(),
//     );
//   }
// }

// class ReportesPage extends StatefulWidget {
//   const ReportesPage({super.key});

//   @override
//   ReportesPageState createState() => ReportesPageState();
// }

// class ReportesPageState extends State<ReportesPage> {
//   List<dynamic> reportes = [];
//   final Logger _logger =
//       Logger('ReportesPage'); // Crea una instancia del logger

//   // Función para obtener los reportes desde la API
//   Future<void> obtenerReportes() async {
//     try {
//       final response = await http
//           .get(Uri.parse('https://tiptop.firetensor.com/api/reportes'));

//       if (response.statusCode == 200) {
//         setState(() {
//           reportes = json.decode(response.body);
//         });
//       } else {
//         throw Exception('Error al cargar los reportes');
//       }
//     } catch (e) {
//       _logger.severe(
//           'Error al obtener los reportes: $e'); // Usa el logger para los errores
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     obtenerReportes();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Text('Reportes'),
//       ),
//       body: reportes.isEmpty
//           ? const Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: reportes.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text('IdVenta: ${reportes[index]['id']}'),
//                   subtitle: Text('Monto: ${reportes[index]['total_pagar']}'),
//                 );
//               },
//             ),
//     );
//   }
// }

//contbla

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:logging/logging.dart';

// void main() {
//   // Configuración del logger
//   Logger.root.level = Level
//       .ALL; // Define el nivel de logging (puedes ajustar esto a Level.INFO para producción)
//   Logger.root.onRecord.listen((record) {
//     // Mostrar los registros en la consola con un formato adecuado
//     print('${record.level.name}: ${record.time}: ${record.message}');
//   });

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Ventas App',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const ReportesPage(),
//     );
//   }
// }

// class ReportesPage extends StatefulWidget {
//   const ReportesPage({super.key});

//   @override
//   ReportesPageState createState() => ReportesPageState();
// }

// class ReportesPageState extends State<ReportesPage> {
//   List<dynamic> reportes = [];
//   final Logger _logger =
//       Logger('ReportesPageState'); // Logger específico para esta clase

//   // Función para obtener los reportes desde la API
//   Future<void> obtenerReportes() async {
//     try {
//       final response = await http
//           .get(Uri.parse('https://tiptop.firetensor.com/api/reportes'));

//       if (response.statusCode == 200) {
//         setState(() {
//           reportes = json.decode(response.body);
//         });
//       } else {
//         _logger.severe(
//             'Error al cargar los reportes. Código de estado: ${response.statusCode}');
//         throw Exception('Error al cargar los reportes');
//       }
//     } catch (e) {
//       _logger.severe(
//           'Error al obtener reportes: $e'); // Uso del logger para registrar el error
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     obtenerReportes();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Text('Reportes'),
//       ),
//       body: reportes.isEmpty
//           ? const Center(child: CircularProgressIndicator())
//           : Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: DataTable(
//                 columns: const <DataColumn>[
//                   DataColumn(
//                     label: Text(
//                       'Nombre',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   DataColumn(
//                     label: Text(
//                       'Monto',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   DataColumn(
//                     label: Text(
//                       'Fecha',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//                 rows: reportes.map<DataRow>((report) {
//                   return DataRow(
//                     cells: [
//                       DataCell(Text(report['nombre'] ?? 'N/A')),
//                       DataCell(Text('\$${report['monto']}')),
//                       DataCell(Text(report['fecha'] ?? 'N/A')),
//                     ],
//                   );
//                 }).toList(),
//               ),
//             ),
//     );
//   }
// }

// contabla sin nada de print

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:logging/logging.dart';
// import 'package:intl/intl.dart'; // Importar correctamente la librería

// void main() {
//   // Configuración del logger
//   Logger.root.level = Level
//       .ALL; // Define el nivel de logging (puedes ajustar esto a Level.INFO para producción)
//   Logger.root.onRecord.listen((record) {
//     // Mostrar los registros en la consola con un formato adecuado
//     // Usamos el logger para evitar el uso de 'print'
//     // Usamos logger en lugar de print
//     debugPrint('${record.level.name}: ${record.time}: ${record.message}');
//   });

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Ventas App',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const ReportesPage(),
//     );
//   }
// }

// class ReportesPage extends StatefulWidget {
//   const ReportesPage({super.key});

//   @override
//   ReportesPageState createState() => ReportesPageState();
// }

// class ReportesPageState extends State<ReportesPage> {
//   List<dynamic> reportes = [];
//   final Logger _logger =
//       Logger('ReportesPageState'); // Logger específico para esta clase

//   // Función para obtener los reportes desde la API
//   Future<void> obtenerReportes() async {
//     try {
//       final response = await http
//           .get(Uri.parse('https://tiptop.firetensor.com/api/reportes'));

//       if (response.statusCode == 200) {
//         setState(() {
//           reportes = json.decode(response.body);
//         });
//       } else {
//         _logger.severe(
//             'Error al cargar los reportes. Código de estado: ${response.statusCode}');
//         throw Exception('Error al cargar los reportes');
//       }
//     } catch (e) {
//       _logger.severe(
//           'Error al obtener reportes: $e'); // Uso del logger para registrar el error
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     obtenerReportes();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Text('Reportes'),
//       ),
//       body: reportes.isEmpty
//           ? const Center(child: CircularProgressIndicator())
//           : Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: DataTable(
//                 columns: const <DataColumn>[
//                   DataColumn(
//                     label: Text(
//                       'ID',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   DataColumn(
//                     label: Text(
//                       'Monto',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   DataColumn(
//                     label: Text(
//                       'Fecha',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//                 rows: reportes.map<DataRow>((report) {
//                   return DataRow(
//                     cells: [
//                       // DataCell(Text(report['id'] ?? 'N/A')),
//                       // DataCell(Text('\$${report['total_pagar']}')),
//                       // DataCell(Text(report['created_at'] ?? 'N/A')),
//                       DataCell(Text(report['id']?.toString() ?? 'N/A')),
//                       DataCell(Text(
//                           '\$${report['total_pagar']?.toString() ?? '0'}')),

//                       // Formatear la fecha 'created_at' con DateFormat
//                       DataCell(Text(report['created_at'] != null
//                           ? DateFormat('dd-MM-yyyy')
//                               .format(DateTime.parse(report['created_at']))
//                           : 'N/A')),
//                     ],
//                   );
//                 }).toList(),
//               ),
//             ),
//     );
//   }
// }

// con scrollbar ------------------------------------------------------------------------------------------

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:logging/logging.dart';
// import 'package:intl/intl.dart'; // Importar correctamente la librería

// void main() {
//   // Configuración del logger
//   Logger.root.level = Level
//       .ALL; // Define el nivel de logging (puedes ajustar esto a Level.INFO para producción)
//   Logger.root.onRecord.listen((record) {
//     // Mostrar los registros en la consola con un formato adecuado
//     // Usamos el logger para evitar el uso de 'print'
//     // Usamos logger en lugar de print
//     debugPrint('${record.level.name}: ${record.time}: ${record.message}');
//   });

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Ventas App',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const ReportesPage(),
//     );
//   }
// }

// class ReportesPage extends StatefulWidget {
//   const ReportesPage({super.key});

//   @override
//   ReportesPageState createState() => ReportesPageState();
// }

// class ReportesPageState extends State<ReportesPage> {
//   List<dynamic> reportes = [];
//   final Logger _logger =
//       Logger('ReportesPageState'); // Logger específico para esta clase

//   // Función para obtener los reportes desde la API
//   Future<void> obtenerReportes() async {
//     try {
//       final response = await http
//           .get(Uri.parse('https://tiptop.firetensor.com/api/reportes'));

//       if (response.statusCode == 200) {
//         setState(() {
//           reportes = json.decode(response.body);
//         });
//       } else {
//         _logger.severe(
//             'Error al cargar los reportes. Código de estado: ${response.statusCode}');
//         throw Exception('Error al cargar los reportes');
//       }
//     } catch (e) {
//       _logger.severe(
//           'Error al obtener reportes: $e'); // Uso del logger para registrar el error
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     obtenerReportes();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Text('Reportes'),
//       ),
//       body: reportes.isEmpty
//           ? const Center(child: CircularProgressIndicator())
//           : Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Scrollbar(
//                 // Añadido Scrollbar para mostrar barra de desplazamiento
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal, // Desplazamiento horizontal
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.vertical, // Desplazamiento vertical
//                     child: DataTable(
//                       columns: const <DataColumn>[
//                         DataColumn(
//                           label: Text(
//                             'ID',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Text(
//                             'Monto',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Text(
//                             'Fecha',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                       rows: reportes.map<DataRow>((report) {
//                         return DataRow(
//                           cells: [
//                             DataCell(Text(report['id']?.toString() ?? 'N/A')),
//                             DataCell(Text(
//                                 'S/ ${report['total_pagar']?.toString() ?? '0'}')),

//                             // Formatear la fecha 'created_at' con DateFormat
//                             DataCell(Text(report['created_at'] != null
//                                 ? DateFormat('dd-MM-yyyy').format(
//                                     DateTime.parse(report['created_at']))
//                                 : 'N/A')),
//                           ],
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//     );
//   }
// }

//actualizado para logueo y botones -----------------------------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'login_page.dart';
// import 'reports_menu_page.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   //const MyApp({Key? key}) : super(key: key);
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Ventas App',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//         useMaterial3: true,
//       ),
//       home: const AuthWrapper(),
//     );
//   }
// }

// class AuthWrapper extends StatefulWidget {
//   //const AuthWrapper({Key? key}) : super(key: key);
//   const AuthWrapper({super.key});

//   @override
//   AuthWrapperState createState() => AuthWrapperState();
// }

// class AuthWrapperState extends State<AuthWrapper> {
//   bool _isLoggedIn = false;

//   @override
//   void initState() {
//     super.initState();
//     _checkLoginStatus();
//   }

//   Future<void> _checkLoginStatus() async {
//     final prefs = await SharedPreferences.getInstance();
//     final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
//     setState(() {
//       _isLoggedIn = isLoggedIn;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_isLoggedIn) {
//       return const ReportsMenuPage();
//     } else {
//       return const LoginPage();
//     }
//   }
// }

//para htm de guia---------------------------------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:webview_flutter/webview_flutter.dart'; // Importa WebView

// import 'login_page.dart';
// import 'reports_menu_page.dart';

// void main() {
//   // Inicializa la plataforma de WebView antes de ejecutar la app
//   WidgetsFlutterBinding.ensureInitialized();
//   WebViewPlatform.instance =
//       SurfaceAndroidWebView(); // Configura WebView para Android

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Ventas App',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//         useMaterial3: true,
//       ),
//       home: const AuthWrapper(),
//     );
//   }
// }

// class AuthWrapper extends StatefulWidget {
//   const AuthWrapper({super.key});

//   @override
//   AuthWrapperState createState() => AuthWrapperState();
// }

// class AuthWrapperState extends State<AuthWrapper> {
//   bool _isLoggedIn = false;

//   @override
//   void initState() {
//     super.initState();
//     _checkLoginStatus();
//   }

//   Future<void> _checkLoginStatus() async {
//     final prefs = await SharedPreferences.getInstance();
//     final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
//     setState(() {
//       _isLoggedIn = isLoggedIn;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_isLoggedIn) {
//       return const ReportsMenuPage();
//     } else {
//       return const LoginPage();
//     }
//   }
// }

//sin 1error--------------------------------------------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// //import 'package:webview_flutter/webview_flutter.dart'; // Importa WebView

// import 'login_page.dart';
// import 'reports_menu_page.dart';

// void main() {
//   // Inicializa la plataforma de WebView si es necesario
//   WidgetsFlutterBinding.ensureInitialized();

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Ventas App',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//         useMaterial3: true,
//       ),
//       home: const AuthWrapper(),
//     );
//   }
// }

// class AuthWrapper extends StatefulWidget {
//   const AuthWrapper({super.key});

//   @override
//   AuthWrapperState createState() => AuthWrapperState();
// }

// class AuthWrapperState extends State<AuthWrapper> {
//   bool _isLoggedIn = false;

//   @override
//   void initState() {
//     super.initState();
//     _checkLoginStatus();
//   }

//   Future<void> _checkLoginStatus() async {
//     final prefs = await SharedPreferences.getInstance();
//     final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
//     setState(() {
//       _isLoggedIn = isLoggedIn;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_isLoggedIn) {
//       return const ReportsMenuPage();
//     } else {
//       return const LoginPage();
//     }
//   }
// }

//-------------------------------------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// // No es necesario importar `webview_flutter` si no estás utilizando `WebView` directamente aquí.

// import 'login_page.dart';
// import 'reports_menu_page.dart';

// void main() async {
//   // Asegúrate de inicializar el WebView antes de usar cualquier widget si lo vas a utilizar
//   WidgetsFlutterBinding.ensureInitialized();

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Ventas App',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//         useMaterial3: true,
//       ),
//       home: const AuthWrapper(),
//     );
//   }
// }

// class AuthWrapper extends StatefulWidget {
//   const AuthWrapper({super.key});

//   @override
//   AuthWrapperState createState() => AuthWrapperState();
// }

// class AuthWrapperState extends State<AuthWrapper> {
//   bool _isLoggedIn = false;

//   @override
//   void initState() {
//     super.initState();
//     _checkLoginStatus();
//   }

//   Future<void> _checkLoginStatus() async {
//     final prefs = await SharedPreferences.getInstance();
//     final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
//     setState(() {
//       _isLoggedIn = isLoggedIn;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_isLoggedIn) {
//       return const ReportsMenuPage();
//     } else {
//       return const LoginPage();
//     }
//   }
// }

//-----------------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'reports_menu_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ventas App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  AuthWrapperState createState() => AuthWrapperState();
}

class AuthWrapperState extends State<AuthWrapper> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    setState(() {
      _isLoggedIn = isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoggedIn) {
      return const ReportsMenuPage();
    } else {
      return const LoginPage();
    }
  }
}
