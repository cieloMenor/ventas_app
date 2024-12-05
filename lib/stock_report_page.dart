// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:fl_chart/fl_chart.dart';

// class StockReportPage extends StatefulWidget {
//   const StockReportPage({Key? key}) : super(key: key);

//   @override
//   _StockReportPageState_StockReportPageState createState() =>
//       _StockReportPageState();
// }

// class _StockReportPageState extends State<StockReportPage> {
//   List<Map<String, dynamic>> _products = [];
//   bool _isLoading = false;
//   List<String> _categories = [];
//   List<double> _stockData = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchStockReport();
//   }

//   Future<void> _fetchStockReport() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final response = await http.get(
//         Uri.parse('https://tiptop.firetensor.com/api/reporteStock'),
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           _products = List<Map<String, dynamic>>.from(data['data']);
//           _categories = List<String>.from(data['nombres']);
//           _stockData =
//               List<double>.from(data['valores'].map((v) => v.toDouble()));
//         });
//       } else {
//         _showErrorMessage('Error al cargar el reporte');
//       }
//     } catch (e) {
//       _showErrorMessage('Error: ${e.toString()}');
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   void _showErrorMessage(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Stock de Productos'),
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : Column(
//               children: [
//                 SizedBox(
//                   height: 200,
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: BarChart(
//                       BarChartData(
//                         alignment: BarChartAlignment.spaceAround,
//                         maxY: _stockData.isNotEmpty
//                             ? _stockData.reduce((a, b) => a > b ? a : b) * 1.2
//                             : 100,
//                         titlesData: FlTitlesData(
//                           show: true,
//                           bottomTitles: AxisTitles(
//                             sideTitles: SideTitles(
//                               showTitles: true,
//                               getTitlesWidget: (value, meta) {
//                                 final index = value.toInt();
//                                 if (index >= 0 && index < _categories.length) {
//                                   return Text(_categories[index],
//                                       style: const TextStyle(fontSize: 10));
//                                 }
//                                 return const Text('');
//                               },
//                             ),
//                           ),
//                         ),
//                         borderData: FlBorderData(show: false),
//                         barGroups: List.generate(
//                           _categories.length,
//                           (index) => BarChartGroupData(
//                             x: index,
//                             barRods: [
//                               BarChartRodData(
//                                 toY: _stockData[index],
//                                 color: Theme.of(context).primaryColor,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: _products.length,
//                     itemBuilder: (context, index) {
//                       final product = _products[index];
//                       return ListTile(
//                         title: Text(product['nombre']),
//                         subtitle: Text('Categoría: ${product['categoria']}'),
//                         trailing: Text('Stock: ${product['stock']}'),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }

//actualizado por errores-------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:fl_chart/fl_chart.dart';

// class StockReportPage extends StatefulWidget {
//   const StockReportPage({super.key});

//   @override
//   StockReportPageState createState() => StockReportPageState();
// }

// class StockReportPageState extends State<StockReportPage> {
//   List<Map<String, dynamic>> _products = [];
//   bool _isLoading = false;
//   List<String> _categories = [];
//   List<double> _stockData = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchStockReport();
//   }

//   Future<void> _fetchStockReport() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final response = await http.get(
//         Uri.parse('https://tiptop.firetensor.com/api/reporteStock'),
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           _products = List<Map<String, dynamic>>.from(data['data']);
//           _categories = List<String>.from(data['nombres']);
//           _stockData =
//               List<double>.from(data['valores'].map((v) => v.toDouble()));
//         });
//       } else {
//         _showErrorMessage('Error al cargar el reporte');
//       }
//     } catch (e) {
//       _showErrorMessage('Error: ${e.toString()}');
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   void _showErrorMessage(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Stock de Productos'),
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : Column(
//               children: [
//                 SizedBox(
//                   height: 200,
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: BarChart(
//                       BarChartData(
//                         alignment: BarChartAlignment.spaceAround,
//                         maxY: _stockData.isNotEmpty
//                             ? _stockData.reduce((a, b) => a > b ? a : b) * 1.2
//                             : 100,
//                         titlesData: FlTitlesData(
//                           show: true,
//                           bottomTitles: AxisTitles(
//                             sideTitles: SideTitles(
//                               showTitles: true,
//                               getTitlesWidget: (value, meta) {
//                                 final index = value.toInt();
//                                 if (index >= 0 && index < _categories.length) {
//                                   return Text(_categories[index],
//                                       style: const TextStyle(fontSize: 10));
//                                 }
//                                 return const Text('');
//                               },
//                             ),
//                           ),
//                         ),
//                         borderData: FlBorderData(show: false),
//                         barGroups: List.generate(
//                           _categories.length,
//                           (index) => BarChartGroupData(
//                             x: index,
//                             barRods: [
//                               BarChartRodData(
//                                 toY: _stockData[index],
//                                 color: Theme.of(context).primaryColor,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: _products.length,
//                     itemBuilder: (context, index) {
//                       final product = _products[index];
//                       return ListTile(
//                         title: Text(product['nombre']),
//                         subtitle: Text('Categoría: ${product['categoria']}'),
//                         trailing: Text('Stock: ${product['stock']}'),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }

//tabla y grafico por nombres y valores:----------------------------------------
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:fl_chart/fl_chart.dart';

// class StockReportPage extends StatefulWidget {
//   const StockReportPage({super.key});

//   @override
//   StockReportPageState createState() => StockReportPageState();
// }

// class StockReportPageState extends State<StockReportPage> {
//   List<String> _categories = []; // Nombres de las categorías
//   List<double> _stockData = []; // Datos de stock por categoría
//   bool _isLoading = false; // Estado de carga

//   @override
//   void initState() {
//     super.initState();
//     _fetchStockReport();
//   }

//   // Función para obtener los datos del reporte
//   Future<void> _fetchStockReport() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final response = await http.get(
//         Uri.parse('https://tiptop.firetensor.com/api/reporteStock'),
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);

//         // Actualizamos las categorías y los valores de stock
//         setState(() {
//           _categories = List<String>.from(data['data']['nombres']);
//           _stockData = List<double>.from(
//             data['data']['valores'].map((v) => double.tryParse(v) ?? 0),
//           );
//         });
//       } else {
//         _showErrorMessage('Error al cargar el reporte');
//       }
//     } catch (e) {
//       _showErrorMessage('Error: ${e.toString()}');
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   // Función para mostrar mensaje de error
//   void _showErrorMessage(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Reporte de Stock por Categoría'),
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Column(
//                 children: [
//                   // Gráfico de barras
//                   SizedBox(
//                     height: 250,
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: BarChart(
//                         BarChartData(
//                           alignment: BarChartAlignment.spaceAround,
//                           maxY: _stockData.isNotEmpty
//                               ? _stockData.reduce((a, b) => a > b ? a : b) * 1.2
//                               : 100,
//                           titlesData: FlTitlesData(
//                             show: true,
//                             bottomTitles: AxisTitles(
//                               sideTitles: SideTitles(
//                                 showTitles: true,
//                                 getTitlesWidget: (value, meta) {
//                                   final index = value.toInt();
//                                   if (index >= 0 &&
//                                       index < _categories.length) {
//                                     return Text(
//                                       _categories[index],
//                                       style: const TextStyle(fontSize: 10),
//                                     );
//                                   }
//                                   return const Text('');
//                                 },
//                               ),
//                             ),
//                           ),
//                           borderData: FlBorderData(show: false),
//                           barGroups: List.generate(
//                             _categories.length,
//                             (index) => BarChartGroupData(
//                               x: index,
//                               barRods: [
//                                 BarChartRodData(
//                                   toY: _stockData[index],
//                                   color: Theme.of(context).primaryColor,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Tabla de categorías y stock
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: DataTable(
//                       columns: const [
//                         DataColumn(label: Text('Categoría')),
//                         DataColumn(label: Text('Stock')),
//                       ],
//                       rows: List.generate(
//                         _categories.length,
//                         (index) => DataRow(cells: [
//                           DataCell(Text(_categories[index])),
//                           DataCell(Text(_stockData[index].toString())),
//                         ]),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }

//con leyenda, cambio de colores en grafico y 2k 3k 4k....-----------------------------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:fl_chart/fl_chart.dart';

// class StockReportPage extends StatefulWidget {
//   const StockReportPage({super.key});

//   @override
//   StockReportPageState createState() => StockReportPageState();
// }

// class StockReportPageState extends State<StockReportPage> {
//   List<String> _categories = []; // Nombres de las categorías
//   List<double> _stockData = []; // Datos de stock por categoría
//   bool _isLoading = false; // Estado de carga
//   List<Color> _colors = []; // Colores para cada categoría

//   @override
//   void initState() {
//     super.initState();
//     _fetchStockReport();
//   }

//   // Función para obtener los datos del reporte
//   Future<void> _fetchStockReport() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final response = await http.get(
//         Uri.parse('https://tiptop.firetensor.com/api/reporteStock'),
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);

//         setState(() {
//           _categories = List<String>.from(data['data']['nombres']);
//           _stockData = List<double>.from(
//             data['data']['valores'].map((v) => double.tryParse(v) ?? 0),
//           );

//           // Generar una lista de colores
//           _colors = List<Color>.generate(
//             _categories.length,
//             (index) => Colors.primaries[index % Colors.primaries.length],
//           );
//         });
//       } else {
//         _showErrorMessage('Error al cargar el reporte');
//       }
//     } catch (e) {
//       _showErrorMessage('Error: ${e.toString()}');
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   // Función para mostrar mensaje de error
//   void _showErrorMessage(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Reporte de Stock por Categoría'),
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Column(
//                 children: [
//                   // Título del gráfico
//                   const Padding(
//                     padding: EdgeInsets.only(top: 16.0),
//                     child: Text(
//                       'Stock por Categoría (en miles)',
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   // Gráfico de barras
//                   SizedBox(
//                     height: 300,
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: BarChart(
//                         BarChartData(
//                           alignment: BarChartAlignment.spaceAround,
//                           maxY: _stockData.isNotEmpty
//                               ? (_stockData.reduce((a, b) => a > b ? a : b) /
//                                       1000)
//                                   .ceilToDouble()
//                               : 1,
//                           titlesData: FlTitlesData(
//                             show: true,
//                             bottomTitles: AxisTitles(
//                               sideTitles: SideTitles(
//                                 showTitles: true,
//                                 getTitlesWidget: (value, meta) {
//                                   final index = value.toInt();
//                                   if (index >= 0 &&
//                                       index < _categories.length) {
//                                     return Text(
//                                       _categories[index],
//                                       style: const TextStyle(fontSize: 10),
//                                     );
//                                   }
//                                   return const Text('');
//                                 },
//                               ),
//                             ),
//                             leftTitles: AxisTitles(
//                               sideTitles: SideTitles(
//                                 showTitles: true,
//                                 getTitlesWidget: (value, meta) {
//                                   return Text(
//                                     value.toInt().toString(),
//                                     style: const TextStyle(fontSize: 10),
//                                   );
//                                 },
//                               ),
//                             ),
//                           ),
//                           borderData: FlBorderData(show: false),
//                           barGroups: List.generate(
//                             _categories.length,
//                             (index) => BarChartGroupData(
//                               x: index,
//                               barRods: [
//                                 BarChartRodData(
//                                   toY: _stockData[index] /
//                                       1000, // Convertir a miles
//                                   color: _colors[index],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Leyenda
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Wrap(
//                       spacing: 10.0,
//                       runSpacing: 5.0,
//                       children: List.generate(
//                         _categories.length,
//                         (index) => Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Container(
//                               width: 12,
//                               height: 12,
//                               color: _colors[index],
//                             ),
//                             const SizedBox(width: 5),
//                             Text(_categories[index]),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Tabla de categorías y stock
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: DataTable(
//                       columns: const [
//                         DataColumn(label: Text('Categoría')),
//                         DataColumn(label: Text('Stock')),
//                       ],
//                       rows: List.generate(
//                         _categories.length,
//                         (index) => DataRow(cells: [
//                           DataCell(Text(_categories[index])),
//                           DataCell(Text(_stockData[index].toString())),
//                         ]),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }

//grafico sin nombres de categoria---------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';

class StockReportPage extends StatefulWidget {
  const StockReportPage({super.key});

  @override
  StockReportPageState createState() => StockReportPageState();
}

class StockReportPageState extends State<StockReportPage> {
  List<String> _categories = []; // Nombres de las categorías
  List<double> _stockData = []; // Datos de stock por categoría
  bool _isLoading = false; // Estado de carga
  List<Color> _colors = []; // Colores para cada categoría

  @override
  void initState() {
    super.initState();
    _fetchStockReport();
  }

  // Función para obtener los datos del reporte
  Future<void> _fetchStockReport() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.get(
        Uri.parse('https://tiptop.firetensor.com/api/reporteStock'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          _categories = List<String>.from(data['data']['nombres']);
          _stockData = List<double>.from(
            data['data']['valores'].map((v) => double.tryParse(v) ?? 0),
          );

          // Generar una lista de colores
          _colors = List<Color>.generate(
            _categories.length,
            (index) => Colors.primaries[index % Colors.primaries.length],
          );
        });
      } else {
        _showErrorMessage('Error al cargar el reporte');
      }
    } catch (e) {
      _showErrorMessage('Error: ${e.toString()}');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Función para mostrar mensaje de error
  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reporte de Stock por Categoría'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  // Título del gráfico
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Stock por Categoría (en miles)',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Gráfico de barras
                  SizedBox(
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          maxY: _stockData.isNotEmpty
                              ? (_stockData.reduce((a, b) => a > b ? a : b) /
                                      1000)
                                  .ceilToDouble()
                              : 1,
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles:
                                    false, // Ocultar nombres en el eje X
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toInt().toString(),
                                    style: const TextStyle(fontSize: 10),
                                  );
                                },
                              ),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          barGroups: List.generate(
                            _categories.length,
                            (index) => BarChartGroupData(
                              x: index,
                              barRods: [
                                BarChartRodData(
                                  toY: _stockData[index] /
                                      1000, // Convertir a miles
                                  color: _colors[index],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Leyenda
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      spacing: 10.0,
                      runSpacing: 5.0,
                      children: List.generate(
                        _categories.length,
                        (index) => Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              color: _colors[index],
                            ),
                            const SizedBox(width: 5),
                            Text(_categories[index]),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Tabla de categorías y stock
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Categoría')),
                        DataColumn(label: Text('Stock')),
                      ],
                      rows: List.generate(
                        _categories.length,
                        (index) => DataRow(cells: [
                          DataCell(Text(_categories[index])),
                          DataCell(Text(_stockData[index].toString())),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
