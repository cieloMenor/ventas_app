// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:intl/intl.dart';
// import 'package:fl_chart/fl_chart.dart';

// class DetailedSalesReportPage extends StatefulWidget {
//   const DetailedSalesReportPage({super.key});

//   @override
//   DetailedSalesReportPageState createState() => DetailedSalesReportPageState();
// }

// class DetailedSalesReportPageState extends State<DetailedSalesReportPage> {
//   List<Map<String, dynamic>> _sales = [];
//   bool _isLoading = false;
//   DateTime _startDate = DateTime.now().subtract(const Duration(days: 30));
//   DateTime _endDate = DateTime.now();
//   List<String> _months = [];
//   List<double> _salesData = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchSalesReport();
//   }

//   Future<void> _fetchSalesReport() async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final response = await http.get(
//         Uri.parse(
//           'https://tiptop.firetensor.com/api/reporteVentaDetallada?fechaInicio=${DateFormat('yyyy-MM-dd').format(_startDate)}&fechaFin=${DateFormat('yyyy-MM-dd').format(_endDate)}',
//         ),
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           _sales = List<Map<String, dynamic>>.from(data['data']);
//           _months = List<String>.from(data['nombresMeses']);
//           _salesData =
//               List<double>.from(data['montosTotales'].map((v) => v.toDouble()));
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
//         title: const Text('Venta Detallada'),
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: TextFormField(
//                           decoration: const InputDecoration(
//                             labelText: 'Fecha Inicio',
//                             border: OutlineInputBorder(),
//                           ),
//                           readOnly: true,
//                           controller: TextEditingController(
//                             text: DateFormat('dd/MM/yyyy').format(_startDate),
//                           ),
//                           onTap: () async {
//                             final date = await showDatePicker(
//                               context: context,
//                               initialDate: _startDate,
//                               firstDate: DateTime(2020),
//                               lastDate: DateTime.now(),
//                             );
//                             if (date != null) {
//                               setState(() {
//                                 _startDate = date;
//                               });
//                               _fetchSalesReport();
//                             }
//                           },
//                         ),
//                       ),
//                       const SizedBox(width: 16),
//                       Expanded(
//                         child: TextFormField(
//                           decoration: const InputDecoration(
//                             labelText: 'Fecha Fin',
//                             border: OutlineInputBorder(),
//                           ),
//                           readOnly: true,
//                           controller: TextEditingController(
//                             text: DateFormat('dd/MM/yyyy').format(_endDate),
//                           ),
//                           onTap: () async {
//                             final date = await showDatePicker(
//                               context: context,
//                               initialDate: _endDate,
//                               firstDate: DateTime(2020),
//                               lastDate: DateTime.now(),
//                             );
//                             if (date != null) {
//                               setState(() {
//                                 _endDate = date;
//                               });
//                               _fetchSalesReport();
//                             }
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 200,
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: BarChart(
//                       BarChartData(
//                         alignment: BarChartAlignment.spaceAround,
//                         maxY: _salesData.isNotEmpty
//                             ? _salesData.reduce((a, b) => a > b ? a : b) * 1.2
//                             : 100,
//                         titlesData: FlTitlesData(
//                           show: true,
//                           bottomTitles: AxisTitles(
//                             sideTitles: SideTitles(
//                               showTitles: true,
//                               getTitlesWidget: (value, meta) {
//                                 final index = value.toInt();
//                                 if (index >= 0 && index < _months.length) {
//                                   return Text(_months[index],
//                                       style: const TextStyle(fontSize: 10));
//                                 }
//                                 return const Text('');
//                               },
//                             ),
//                           ),
//                         ),
//                         borderData: FlBorderData(show: false),
//                         barGroups: List.generate(
//                           _months.length,
//                           (index) => BarChartGroupData(
//                             x: index,
//                             barRods: [
//                               BarChartRodData(
//                                 toY: _salesData[index],
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
//                     itemCount: _sales.length,
//                     itemBuilder: (context, index) {
//                       final sale = _sales[index];
//                       return ListTile(
//                         title: Text('Boleta: ${sale['boleta']}'),
//                         subtitle: Text('Cliente: ${sale['cliente']}'),
//                         trailing: Text('S/ ${sale['importe']}'),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }

//grafico y tabla de ventas detalladas -----------------------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:fl_chart/fl_chart.dart';

// class DetailedSalesReportPage extends StatefulWidget {
//   const DetailedSalesReportPage({super.key});

//   @override
//   DetailedSalesReportPageState createState() => DetailedSalesReportPageState();
// }

// class DetailedSalesReportPageState extends State<DetailedSalesReportPage> {
//   List<Map<String, dynamic>> _tableData = []; // Datos para la tabla
//   List<String> _months = []; // Nombres de los meses
//   List<int> _salesNumbers = []; // Número de ventas
//   List<double> _totalAmounts = []; // Montos totales
//   bool _isLoading = false; // Estado de carga
//   DateTimeRange? _selectedDateRange; // Rango de fechas seleccionado

//   @override
//   void initState() {
//     super.initState();
//     _fetchSalesReport(); // Cargar datos iniciales
//   }

//   // Función para obtener el reporte desde la API
//   Future<void> _fetchSalesReport({String? startDate, String? endDate}) async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final queryParameters = {
//         if (startDate != null) 'fechaInicio': startDate,
//         if (endDate != null) 'fechaFin': endDate,
//       };

//       final uri =
//           Uri.parse('https://tiptop.firetensor.com/api/reporteVentaDetallada')
//               .replace(queryParameters: queryParameters);

//       final response = await http.get(uri);

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);

//         setState(() {
//           _tableData = List<Map<String, dynamic>>.from(data['tabla']);
//           _months = List<String>.from(data['grafico']['meses']);
//           _salesNumbers = List<int>.from(data['grafico']['numVentas']);
//           _totalAmounts = List<double>.from(
//               data['grafico']['montosTotales'].map((e) => e.toDouble()));
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

//   // Mostrar mensaje de error
//   void _showErrorMessage(String message) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(message)));
//   }

//   // Abrir el selector de rango de fechas
//   Future<void> _selectDateRange() async {
//     final DateTimeRange? picked = await showDateRangePicker(
//       context: context,
//       firstDate: DateTime(2020), // Rango inicial
//       lastDate: DateTime.now(), // Hasta la fecha actual
//     );

//     if (picked != null) {
//       setState(() {
//         _selectedDateRange = picked;
//       });
//       await _fetchSalesReport(
//         startDate: picked.start.toIso8601String().split('T').first,
//         endDate: picked.end.toIso8601String().split('T').first,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Reporte de Ventas Detalladas'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.date_range),
//             onPressed: _selectDateRange,
//           ),
//         ],
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Column(
//                 children: [
//                   // Gráfico Lineal
//                   SizedBox(
//                     height: 300,
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: LineChart(
//                         LineChartData(
//                           titlesData: FlTitlesData(
//                             leftTitles: AxisTitles(
//                               sideTitles: SideTitles(
//                                 showTitles: true,
//                                 getTitlesWidget: (value, meta) {
//                                   return Text(value.toInt().toString());
//                                 },
//                               ),
//                             ),
//                             bottomTitles: AxisTitles(
//                               sideTitles: SideTitles(
//                                 showTitles: true,
//                                 getTitlesWidget: (value, meta) {
//                                   final index = value.toInt();
//                                   return index >= 0 && index < _months.length
//                                       ? Text(_months[index])
//                                       : const Text('');
//                                 },
//                               ),
//                             ),
//                           ),
//                           gridData: FlGridData(show: true),
//                           borderData: FlBorderData(show: true),
//                           lineBarsData: [
//                             LineChartBarData(
//                               isCurved: true,
//                               spots: List.generate(
//                                 _months.length,
//                                 (index) => FlSpot(
//                                   index.toDouble(),
//                                   _salesNumbers[index].toDouble(),
//                                 ),
//                               ),
//                               belowBarData: BarAreaData(show: true),
//                               colors: [Colors.blue],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Tabla de ventas detalladas
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: DataTable(
//                       columns: const [
//                         DataColumn(label: Text('Fecha')),
//                         DataColumn(label: Text('Cliente')),
//                         DataColumn(label: Text('Producto')),
//                         DataColumn(label: Text('Cantidad')),
//                         DataColumn(label: Text('Importe')),
//                       ],
//                       rows: List.generate(
//                         _tableData.length,
//                         (index) => DataRow(
//                           cells: [
//                             DataCell(Text(_tableData[index]['fecha'] ?? '')),
//                             DataCell(Text(_tableData[index]['cliente'] ?? '')),
//                             DataCell(Text(_tableData[index]['producto'] ?? '')),
//                             DataCell(
//                                 Text(_tableData[index]['cantidad'].toString())),
//                             DataCell(
//                                 Text(_tableData[index]['importe'].toString())),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }

//con actualizacion de error color ------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:fl_chart/fl_chart.dart';

// class DetailedSalesReportPage extends StatefulWidget {
//   const DetailedSalesReportPage({super.key});

//   @override
//   DetailedSalesReportPageState createState() => DetailedSalesReportPageState();
// }

// class DetailedSalesReportPageState extends State<DetailedSalesReportPage> {
//   List<Map<String, dynamic>> _tableData = []; // Datos para la tabla
//   List<String> _months = []; // Nombres de los meses
//   List<int> _salesNumbers = []; // Número de ventas
//   List<double> _totalAmounts = []; // Montos totales
//   bool _isLoading = false; // Estado de carga
//   DateTimeRange? _selectedDateRange; // Rango de fechas seleccionado

//   @override
//   void initState() {
//     super.initState();
//     _fetchSalesReport(); // Cargar datos iniciales
//   }

//   // Función para obtener el reporte desde la API
//   Future<void> _fetchSalesReport({String? startDate, String? endDate}) async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final queryParameters = {
//         if (startDate != null) 'fechaInicio': startDate,
//         if (endDate != null) 'fechaFin': endDate,
//       };

//       final uri =
//           Uri.parse('https://tiptop.firetensor.com/api/reporteVentaDetallada')
//               .replace(queryParameters: queryParameters);

//       final response = await http.get(uri);

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);

//         setState(() {
//           _tableData = List<Map<String, dynamic>>.from(data['tabla']);
//           _months = List<String>.from(data['grafico']['meses']);
//           _salesNumbers = List<int>.from(data['grafico']['numVentas']);
//           _totalAmounts = List<double>.from(
//               data['grafico']['montosTotales'].map((e) => e.toDouble()));
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

//   // Mostrar mensaje de error
//   void _showErrorMessage(String message) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(message)));
//   }

//   // Abrir el selector de rango de fechas
//   Future<void> _selectDateRange() async {
//     final DateTimeRange? picked = await showDateRangePicker(
//       context: context,
//       firstDate: DateTime(2020), // Rango inicial
//       lastDate: DateTime.now(), // Hasta la fecha actual
//     );

//     if (picked != null) {
//       setState(() {
//         _selectedDateRange = picked;
//       });
//       await _fetchSalesReport(
//         startDate: picked.start.toIso8601String().split('T').first,
//         endDate: picked.end.toIso8601String().split('T').first,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Reporte de Ventas Detalladas'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.date_range),
//             onPressed: _selectDateRange,
//           ),
//         ],
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Column(
//                 children: [
//                   // Gráfico Lineal
//                   SizedBox(
//                     height: 300,
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: LineChart(
//                         LineChartData(
//                           titlesData: FlTitlesData(
//                             leftTitles: AxisTitles(
//                               sideTitles: SideTitles(
//                                 showTitles: true,
//                                 getTitlesWidget: (value, meta) {
//                                   return Text(value.toInt().toString());
//                                 },
//                               ),
//                             ),
//                             bottomTitles: AxisTitles(
//                               sideTitles: SideTitles(
//                                 showTitles: true,
//                                 getTitlesWidget: (value, meta) {
//                                   final index = value.toInt();
//                                   return index >= 0 && index < _months.length
//                                       ? Text(_months[index])
//                                       : const Text('');
//                                 },
//                               ),
//                             ),
//                           ),
//                           gridData: FlGridData(show: true),
//                           borderData: FlBorderData(show: true),
//                           lineBarsData: [
//                             LineChartBarData(
//                               isCurved: true,
//                               spots: List.generate(
//                                 _months.length,
//                                 (index) => FlSpot(
//                                   index.toDouble(),
//                                   _salesNumbers[index].toDouble(),
//                                 ),
//                               ),
//                               belowBarData: BarAreaData(show: true),
//                               color:
//                                   Colors.blue, // Cambiado de 'colors' a 'color'
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Tabla de ventas detalladas
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: DataTable(
//                       columns: const [
//                         DataColumn(label: Text('Fecha')),
//                         DataColumn(label: Text('Cliente')),
//                         DataColumn(label: Text('Producto')),
//                         DataColumn(label: Text('Cantidad')),
//                         DataColumn(label: Text('Importe')),
//                       ],
//                       rows: List.generate(
//                         _tableData.length,
//                         (index) => DataRow(
//                           cells: [
//                             DataCell(Text(_tableData[index]['fecha'] ?? '')),
//                             DataCell(Text(_tableData[index]['cliente'] ?? '')),
//                             DataCell(Text(_tableData[index]['producto'] ?? '')),
//                             DataCell(
//                                 Text(_tableData[index]['cantidad'].toString())),
//                             DataCell(
//                                 Text(_tableData[index]['importe'].toString())),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }

//sin 2errores----------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:fl_chart/fl_chart.dart';

// class DetailedSalesReportPage extends StatefulWidget {
//   const DetailedSalesReportPage({super.key});

//   @override
//   DetailedSalesReportPageState createState() => DetailedSalesReportPageState();
// }

// class DetailedSalesReportPageState extends State<DetailedSalesReportPage> {
//   List<Map<String, dynamic>> _tableData = []; // Datos para la tabla
//   List<String> _months = []; // Nombres de los meses
//   List<int> _salesNumbers = []; // Número de ventas
//   bool _isLoading = false; // Estado de carga

//   @override
//   void initState() {
//     super.initState();
//     _fetchSalesReport(); // Cargar datos iniciales
//   }

//   // Función para obtener el reporte desde la API
//   Future<void> _fetchSalesReport({String? startDate, String? endDate}) async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final queryParameters = {
//         if (startDate != null) 'fechaInicio': startDate,
//         if (endDate != null) 'fechaFin': endDate,
//       };

//       final uri =
//           Uri.parse('https://tiptop.firetensor.com/api/reporteVentaDetallada')
//               .replace(queryParameters: queryParameters);

//       final response = await http.get(uri);

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);

//         setState(() {
//           _tableData = List<Map<String, dynamic>>.from(data['tabla']);
//           _months = List<String>.from(data['grafico']['meses']);
//           _salesNumbers = List<int>.from(data['grafico']['numVentas']);
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

//   // Mostrar mensaje de error
//   void _showErrorMessage(String message) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(message)));
//   }

//   // Abrir el selector de rango de fechas
//   Future<void> _selectDateRange() async {
//     final DateTimeRange? picked = await showDateRangePicker(
//       context: context,
//       firstDate: DateTime(2020), // Rango inicial
//       lastDate: DateTime.now(), // Hasta la fecha actual
//     );

//     if (picked != null) {
//       await _fetchSalesReport(
//         startDate: picked.start.toIso8601String().split('T').first,
//         endDate: picked.end.toIso8601String().split('T').first,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Reporte de Ventas Detalladas'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.date_range),
//             onPressed: _selectDateRange,
//           ),
//         ],
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Column(
//                 children: [
//                   // Gráfico Lineal
//                   SizedBox(
//                     height: 300,
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: LineChart(
//                         LineChartData(
//                           titlesData: FlTitlesData(
//                             leftTitles: AxisTitles(
//                               sideTitles: SideTitles(
//                                 showTitles: true,
//                                 getTitlesWidget: (value, meta) {
//                                   return Text(value.toInt().toString());
//                                 },
//                               ),
//                             ),
//                             bottomTitles: AxisTitles(
//                               sideTitles: SideTitles(
//                                 showTitles: true,
//                                 getTitlesWidget: (value, meta) {
//                                   final index = value.toInt();
//                                   return index >= 0 && index < _months.length
//                                       ? Text(_months[index])
//                                       : const Text('');
//                                 },
//                               ),
//                             ),
//                           ),
//                           gridData: FlGridData(show: true),
//                           borderData: FlBorderData(show: true),
//                           lineBarsData: [
//                             LineChartBarData(
//                               isCurved: true,
//                               spots: List.generate(
//                                 _months.length,
//                                 (index) => FlSpot(
//                                   index.toDouble(),
//                                   _salesNumbers[index].toDouble(),
//                                 ),
//                               ),
//                               belowBarData: BarAreaData(show: true),
//                               color:
//                                   Colors.blue, // Cambiado de 'colors' a 'color'
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Tabla de ventas detalladas
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: DataTable(
//                       columns: const [
//                         DataColumn(label: Text('Fecha')),
//                         DataColumn(label: Text('Cliente')),
//                         DataColumn(label: Text('Producto')),
//                         DataColumn(label: Text('Cantidad')),
//                         DataColumn(label: Text('Importe')),
//                       ],
//                       rows: List.generate(
//                         _tableData.length,
//                         (index) => DataRow(
//                           cells: [
//                             DataCell(Text(_tableData[index]['fecha'] ?? '')),
//                             DataCell(Text(_tableData[index]['cliente'] ?? '')),
//                             DataCell(Text(_tableData[index]['producto'] ?? '')),
//                             DataCell(
//                                 Text(_tableData[index]['cantidad'].toString())),
//                             DataCell(
//                                 Text(_tableData[index]['importe'].toString())),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }

// codigo despues del error de rangeError:
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:fl_chart/fl_chart.dart';

// class DetailedSalesReportPage extends StatefulWidget {
//   const DetailedSalesReportPage({super.key});

//   @override
//   DetailedSalesReportPageState createState() => DetailedSalesReportPageState();
// }

// class DetailedSalesReportPageState extends State<DetailedSalesReportPage> {
//   List<Map<String, dynamic>> _tableData = []; // Datos para la tabla
//   List<String> _months = []; // Nombres de los meses
//   List<int> _salesNumbers = []; // Número de ventas
//   bool _isLoading = false; // Estado de carga

//   @override
//   void initState() {
//     super.initState();
//     _fetchSalesReport(); // Cargar datos iniciales
//   }

//   // Función para obtener el reporte desde la API
//   Future<void> _fetchSalesReport({String? startDate, String? endDate}) async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final queryParameters = {
//         if (startDate != null) 'fechaInicio': startDate,
//         if (endDate != null) 'fechaFin': endDate,
//       };

//       final uri =
//           Uri.parse('https://tiptop.firetensor.com/api/reporteVentaDetallada')
//               .replace(queryParameters: queryParameters);

//       final response = await http.get(uri);

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);

//         setState(() {
//           _tableData = List<Map<String, dynamic>>.from(data['tabla'] ?? []);
//           _months = List<String>.from(data['grafico']['meses'] ?? []);
//           _salesNumbers = List<int>.from(data['grafico']['numVentas'] ?? []);
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

//   // Mostrar mensaje de error
//   void _showErrorMessage(String message) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(message)));
//   }

//   // Abrir el selector de rango de fechas
//   Future<void> _selectDateRange() async {
//     final DateTimeRange? picked = await showDateRangePicker(
//       context: context,
//       firstDate: DateTime(2020), // Rango inicial
//       lastDate: DateTime.now(), // Hasta la fecha actual
//     );

//     if (picked != null) {
//       await _fetchSalesReport(
//         startDate: picked.start.toIso8601String().split('T').first,
//         endDate: picked.end.toIso8601String().split('T').first,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Reporte de Ventas Detalladas'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.date_range),
//             onPressed: _selectDateRange,
//           ),
//         ],
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Column(
//                 children: [
//                   // Gráfico Lineal
//                   SizedBox(
//                     height: 300,
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: _months.isNotEmpty && _salesNumbers.isNotEmpty
//                           ? LineChart(
//                               LineChartData(
//                                 titlesData: FlTitlesData(
//                                   leftTitles: AxisTitles(
//                                     sideTitles: SideTitles(
//                                       showTitles: true,
//                                       getTitlesWidget: (value, meta) {
//                                         return Text(value.toInt().toString());
//                                       },
//                                     ),
//                                   ),
//                                   bottomTitles: AxisTitles(
//                                     sideTitles: SideTitles(
//                                       showTitles: true,
//                                       getTitlesWidget: (value, meta) {
//                                         final index = value.toInt();
//                                         return index >= 0 &&
//                                                 index < _months.length
//                                             ? Text(_months[index])
//                                             : const Text('');
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                                 gridData: FlGridData(show: true),
//                                 borderData: FlBorderData(show: true),
//                                 lineBarsData: [
//                                   LineChartBarData(
//                                     isCurved: true,
//                                     spots: List.generate(
//                                       _months.length,
//                                       (index) => FlSpot(
//                                         index.toDouble(),
//                                         _salesNumbers[index].toDouble(),
//                                       ),
//                                     ),
//                                     belowBarData: BarAreaData(show: true),
//                                     color: Colors.blue,
//                                   ),
//                                 ],
//                               ),
//                             )
//                           : const Center(
//                               child: Text('No hay datos para mostrar.')),
//                     ),
//                   ),
//                   // Tabla de ventas detalladas
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: DataTable(
//                       columns: const [
//                         DataColumn(label: Text('Fecha')),
//                         DataColumn(label: Text('Cliente')),
//                         DataColumn(label: Text('Producto')),
//                         DataColumn(label: Text('Cantidad')),
//                         DataColumn(label: Text('Importe')),
//                       ],
//                       rows: List.generate(
//                         _tableData.length,
//                         (index) => DataRow(
//                           cells: [
//                             DataCell(Text(_tableData[index]['fecha'] ?? '')),
//                             DataCell(Text(_tableData[index]['cliente'] ?? '')),
//                             DataCell(Text(_tableData[index]['producto'] ?? '')),
//                             DataCell(
//                                 Text(_tableData[index]['cantidad'].toString())),
//                             DataCell(
//                                 Text(_tableData[index]['importe'].toString())),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }

//codigo despues de error de no aprece el grafico y la tabla si-----------------------------------------
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:logging/logging.dart';

// class DetailedSalesReportPage extends StatefulWidget {
//   const DetailedSalesReportPage({super.key});

//   @override
//   DetailedSalesReportPageState createState() => DetailedSalesReportPageState();
// }

// class DetailedSalesReportPageState extends State<DetailedSalesReportPage> {
//   List<Map<String, dynamic>> _tableData = []; // Datos para la tabla
//   List<String> _months = []; // Nombres de los meses
//   List<double> _salesNumbers = []; // Número de ventas
//   bool _isLoading = false; // Estado de carga
//   final Logger _logger = Logger('DetailedSalesReportPage'); // Logger

//   @override
//   void initState() {
//     super.initState();
//     _fetchSalesReport(); // Cargar datos iniciales
//   }

//   // Función para obtener el reporte desde la API
//   Future<void> _fetchSalesReport({String? startDate, String? endDate}) async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final queryParameters = {
//         if (startDate != null) 'fechaInicio': startDate,
//         if (endDate != null) 'fechaFin': endDate,
//       };

//       final uri =
//           Uri.parse('https://tiptop.firetensor.com/api/reporteVentaDetallada')
//               .replace(queryParameters: queryParameters);

//       final response = await http.get(uri);

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);

//         // Uso de logger en vez de print para depuración
//         _logger.info('Datos recibidos de la API: $data');

//         setState(() {
//           _tableData = List<Map<String, dynamic>>.from(data['tabla'] ?? []);
//           _months = List<String>.from(data['grafico']['meses'] ?? []);

//           // Convertir 'numVentas' a lista de enteros (o dobles si es necesario)
//           _salesNumbers = List<double>.from(data['grafico']['numVentas']
//                   ?.map((item) => double.tryParse(item) ?? 0.0) ??
//               []);
//         });
//       } else {
//         _showErrorMessage('Error al cargar el reporte');
//       }
//     } catch (e) {
//       _logger.severe(
//           'Error al obtener el reporte: ${e.toString()}'); // Error con logging
//       _showErrorMessage('Error: ${e.toString()}');
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   // Mostrar mensaje de error
//   void _showErrorMessage(String message) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(message)));
//   }

//   // Abrir el selector de rango de fechas
//   Future<void> _selectDateRange() async {
//     final DateTimeRange? picked = await showDateRangePicker(
//       context: context,
//       firstDate: DateTime(2020), // Rango inicial
//       lastDate: DateTime.now(), // Hasta la fecha actual
//     );

//     if (picked != null) {
//       await _fetchSalesReport(
//         startDate: picked.start.toIso8601String().split('T').first,
//         endDate: picked.end.toIso8601String().split('T').first,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Reporte de Ventas Detalladas'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.date_range),
//             onPressed: _selectDateRange,
//           ),
//         ],
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Column(
//                 children: [
//                   // Gráfico Lineal
//                   SizedBox(
//                     height: 300,
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: LineChart(
//                         LineChartData(
//                           titlesData: FlTitlesData(
//                             leftTitles: AxisTitles(
//                               sideTitles: SideTitles(
//                                 showTitles: true,
//                                 getTitlesWidget: (value, meta) {
//                                   return Text(value.toInt().toString());
//                                 },
//                               ),
//                             ),
//                             bottomTitles: AxisTitles(
//                               sideTitles: SideTitles(
//                                 showTitles: true,
//                                 getTitlesWidget: (value, meta) {
//                                   final index = value.toInt();
//                                   return index >= 0 && index < _months.length
//                                       ? Text(_months[index])
//                                       : const Text('');
//                                 },
//                               ),
//                             ),
//                           ),
//                           gridData: FlGridData(show: true),
//                           borderData: FlBorderData(show: true),
//                           lineBarsData: [
//                             LineChartBarData(
//                               isCurved: true,
//                               spots: List.generate(
//                                 _months.length,
//                                 (index) => FlSpot(
//                                   index.toDouble(),
//                                   _salesNumbers[
//                                       index], // Usamos el valor de ventas
//                                 ),
//                               ),
//                               belowBarData: BarAreaData(show: true),
//                               color:
//                                   Colors.blue, // Cambiado de 'colors' a 'color'
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Tabla de ventas detalladas
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: DataTable(
//                       columns: const [
//                         DataColumn(label: Text('Fecha')),
//                         DataColumn(label: Text('Cliente')),
//                         DataColumn(label: Text('Producto')),
//                         DataColumn(label: Text('Cantidad')),
//                         DataColumn(label: Text('Importe')),
//                       ],
//                       rows: List.generate(
//                         _tableData.length,
//                         (index) => DataRow(
//                           cells: [
//                             DataCell(Text(_tableData[index]['fecha'] ?? '')),
//                             DataCell(Text(_tableData[index]['cliente'] ?? '')),
//                             DataCell(Text(_tableData[index]['producto'] ?? '')),
//                             DataCell(
//                                 Text(_tableData[index]['cantidad'].toString())),
//                             DataCell(
//                                 Text(_tableData[index]['importe'].toString())),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }

// grafico actualizado de dos lineas y tabla -------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:logging/logging.dart';

// class DetailedSalesReportPage extends StatefulWidget {
//   const DetailedSalesReportPage({super.key});

//   @override
//   DetailedSalesReportPageState createState() => DetailedSalesReportPageState();
// }

// class DetailedSalesReportPageState extends State<DetailedSalesReportPage> {
//   List<String> _months = [];
//   List<double> _salesNumbers = [];
//   List<double> _totalAmounts = [];
//   List<Map<String, dynamic>> _tableData = [];
//   bool _isLoading = false;
//   final Logger _logger = Logger('DetailedSalesReportPage');

//   @override
//   void initState() {
//     super.initState();
//     _fetchSalesReport();
//   }

//   Future<void> _fetchSalesReport({String? startDate, String? endDate}) async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final queryParameters = {
//         if (startDate != null) 'fechaInicio': startDate,
//         if (endDate != null) 'fechaFin': endDate,
//       };

//       final uri =
//           Uri.parse('https://tiptop.firetensor.com/api/reporteVentaDetallada')
//               .replace(queryParameters: queryParameters);

//       final response = await http.get(uri);

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);

//         _logger.info('Datos recibidos de la API: $data');

//         setState(() {
//           _months = List<String>.from(data['grafico']['meses'] ?? []);
//           _salesNumbers = List<double>.from(data['grafico']['numVentas']
//                   ?.map((item) => double.tryParse(item) ?? 0.0) ??
//               []);
//           _totalAmounts = List<double>.from(data['grafico']['montosTotales']
//                   ?.map((item) => double.tryParse(item) ?? 0.0) ??
//               []);
//           _tableData = List<Map<String, dynamic>>.from(data['tabla'] ?? []);
//         });
//       } else {
//         _showErrorMessage('Error al cargar el reporte');
//       }
//     } catch (e) {
//       _logger.severe('Error al obtener el reporte: ${e.toString()}');
//       _showErrorMessage('Error: ${e.toString()}');
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   void _showErrorMessage(String message) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(message)));
//   }

//   Future<void> _selectDateRange() async {
//     final DateTimeRange? picked = await showDateRangePicker(
//       context: context,
//       firstDate: DateTime(2020),
//       lastDate: DateTime.now(),
//     );

//     if (picked != null) {
//       await _fetchSalesReport(
//         startDate: picked.start.toIso8601String().split('T').first,
//         endDate: picked.end.toIso8601String().split('T').first,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Reporte de Ventas Detalladas'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.date_range),
//             onPressed: _selectDateRange,
//           ),
//         ],
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Column(
//                 children: [
//                   // Gráfico Lineal
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: SizedBox(
//                       height: 300,
//                       child: LineChart(
//                         LineChartData(
//                           titlesData: FlTitlesData(
//                             leftTitles: AxisTitles(
//                               sideTitles: SideTitles(
//                                 showTitles: true,
//                                 getTitlesWidget: (value, meta) {
//                                   return Text(value.toInt().toString());
//                                 },
//                               ),
//                             ),
//                             bottomTitles: AxisTitles(
//                               sideTitles: SideTitles(
//                                 showTitles: true,
//                                 getTitlesWidget: (value, meta) {
//                                   final index = value.toInt();
//                                   return index >= 0 && index < _months.length
//                                       ? Text(_months[index])
//                                       : const Text('');
//                                 },
//                               ),
//                             ),
//                           ),
//                           gridData: FlGridData(show: true),
//                           borderData: FlBorderData(show: true),
//                           lineBarsData: [
//                             LineChartBarData(
//                               isCurved: true,
//                               spots: List.generate(
//                                 _months.length,
//                                 (index) => FlSpot(
//                                   index.toDouble(),
//                                   _salesNumbers[index],
//                                 ),
//                               ),
//                               belowBarData: BarAreaData(show: true),
//                               color: Colors.blue,
//                             ),
//                             LineChartBarData(
//                               isCurved: true,
//                               spots: List.generate(
//                                 _months.length,
//                                 (index) => FlSpot(
//                                   index.toDouble(),
//                                   _totalAmounts[index],
//                                 ),
//                               ),
//                               belowBarData: BarAreaData(show: true),
//                               color: Colors.green,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16.0),
//                   // Tabla de datos
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: DataTable(
//                       columns: const [
//                         DataColumn(label: Text('ID')),
//                         DataColumn(label: Text('Fecha')),
//                         DataColumn(label: Text('Boleta')),
//                         DataColumn(label: Text('Cliente')),
//                         DataColumn(label: Text('RUC/DNI')),
//                         DataColumn(label: Text('Producto')),
//                         DataColumn(label: Text('Código Producto')),
//                         DataColumn(label: Text('Cantidad')),
//                         DataColumn(label: Text('Importe')),
//                         DataColumn(label: Text('IGV')),
//                         DataColumn(label: Text('Ganancia')),
//                       ],
//                       rows: _tableData.map((row) {
//                         return DataRow(cells: [
//                           DataCell(Text(row['id'] ?? '')),
//                           DataCell(Text(row['fecha'] ?? '')),
//                           DataCell(Text(row['boleta'] ?? '')),
//                           DataCell(Text(row['cliente'] ?? '')),
//                           DataCell(Text(row['ruc_dni'] ?? '')),
//                           DataCell(Text(row['producto'] ?? '')),
//                           DataCell(Text(row['codigoproducto'] ?? '')),
//                           DataCell(Text(row['cantidad'] ?? '')),
//                           DataCell(Text(row['importe'] ?? '')),
//                           DataCell(Text(row['igv'] ?? '')),
//                           DataCell(Text(row['ganancia'] ?? '')),
//                         ]);
//                       }).toList(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }

//con detalles:

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:logging/logging.dart';

// class DetailedSalesReportPage extends StatefulWidget {
//   const DetailedSalesReportPage({super.key});

//   @override
//   DetailedSalesReportPageState createState() => DetailedSalesReportPageState();
// }

// class DetailedSalesReportPageState extends State<DetailedSalesReportPage> {
//   List<String> _months = [];
//   List<double> _salesNumbers = [];
//   List<double> _totalAmounts = [];
//   List<Map<String, dynamic>> _tableData = [];
//   bool _isLoading = false;
//   final Logger _logger = Logger('DetailedSalesReportPage');

//   @override
//   void initState() {
//     super.initState();
//     _fetchSalesReport();
//   }

//   Future<void> _fetchSalesReport({String? startDate, String? endDate}) async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final queryParameters = {
//         if (startDate != null) 'fechaInicio': startDate,
//         if (endDate != null) 'fechaFin': endDate,
//       };

//       final uri =
//           Uri.parse('https://tiptop.firetensor.com/api/reporteVentaDetallada')
//               .replace(queryParameters: queryParameters);

//       final response = await http.get(uri);

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);

//         _logger.info('Datos recibidos de la API: $data');

//         setState(() {
//           _months = List<String>.from(data['grafico']['meses'] ?? []);
//           _salesNumbers = List<double>.from(data['grafico']['numVentas']
//                   ?.map((item) => double.tryParse(item) ?? 0.0) ??
//               []);
//           _totalAmounts = List<double>.from(data['grafico']['montosTotales']
//                   ?.map((item) => double.tryParse(item) ?? 0.0) ??
//               []);
//           _tableData = List<Map<String, dynamic>>.from(data['tabla'] ?? []);
//         });
//       } else {
//         _showErrorMessage('Error al cargar el reporte');
//       }
//     } catch (e) {
//       _logger.severe('Error al obtener el reporte: ${e.toString()}');
//       _showErrorMessage('Error: ${e.toString()}');
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   void _showErrorMessage(String message) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(message)));
//   }

//   Future<void> _selectDateRange() async {
//     final DateTimeRange? picked = await showDateRangePicker(
//       context: context,
//       firstDate: DateTime(2020),
//       lastDate: DateTime.now(),
//     );

//     if (picked != null) {
//       await _fetchSalesReport(
//         startDate: picked.start.toIso8601String().split('T').first,
//         endDate: picked.end.toIso8601String().split('T').first,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Reporte de Ventas Detalladas'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.date_range),
//             onPressed: _selectDateRange,
//           ),
//         ],
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Column(
//                 children: [
//                   // Gráfico Lineal
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 300,
//                           child: LineChart(
//                             LineChartData(
//                               titlesData: FlTitlesData(
//                                 leftTitles: AxisTitles(
//                                   axisNameWidget: const Text('Miles'),
//                                   sideTitles: SideTitles(
//                                     showTitles: true,
//                                     getTitlesWidget: (value, meta) {
//                                       return Text(
//                                           (value / 1000).toStringAsFixed(1));
//                                     },
//                                   ),
//                                 ),
//                                 bottomTitles: AxisTitles(
//                                   sideTitles: SideTitles(
//                                     showTitles: true,
//                                     getTitlesWidget: (value, meta) {
//                                       final index = value.toInt();
//                                       return index >= 0 &&
//                                               index < _months.length
//                                           ? Text(_months[index])
//                                           : const Text('');
//                                     },
//                                   ),
//                                 ),
//                               ),
//                               gridData: FlGridData(show: true),
//                               borderData: FlBorderData(show: true),
//                               lineBarsData: [
//                                 LineChartBarData(
//                                   isCurved: true,
//                                   spots: List.generate(
//                                     _months.length,
//                                     (index) => FlSpot(
//                                       index.toDouble(),
//                                       _salesNumbers[index],
//                                     ),
//                                   ),
//                                   belowBarData: BarAreaData(show: true),
//                                   color: Colors.blue,
//                                 ),
//                                 LineChartBarData(
//                                   isCurved: true,
//                                   spots: List.generate(
//                                     _months.length,
//                                     (index) => FlSpot(
//                                       index.toDouble(),
//                                       _totalAmounts[index],
//                                     ),
//                                   ),
//                                   belowBarData: BarAreaData(show: true),
//                                   color: Colors.green,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 16.0),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Row(
//                               children: [
//                                 Container(
//                                     width: 10, height: 10, color: Colors.blue),
//                                 const SizedBox(width: 4),
//                                 const Text('Número de Ventas'),
//                               ],
//                             ),
//                             const SizedBox(width: 16),
//                             Row(
//                               children: [
//                                 Container(
//                                     width: 10, height: 10, color: Colors.green),
//                                 const SizedBox(width: 4),
//                                 const Text('Monto Total'),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 16.0),
//                   // Tabla de datos
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: DataTable(
//                       columns: const [
//                         DataColumn(label: Text('Fecha')),
//                         DataColumn(label: Text('Cliente')),
//                         DataColumn(label: Text('Producto')),
//                         DataColumn(label: Text('Importe')),
//                       ],
//                       rows: _tableData.map((row) {
//                         return DataRow(cells: [
//                           DataCell(Text(row['fecha'] ?? '')),
//                           DataCell(Text(row['cliente'] ?? '')),
//                           DataCell(Text(row['producto'] ?? '')),
//                           DataCell(Text(row['importe'] ?? '')),
//                         ]);
//                       }).toList(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }

//tabla scroll--------------------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:logging/logging.dart';

// class DetailedSalesReportPage extends StatefulWidget {
//   const DetailedSalesReportPage({super.key});

//   @override
//   DetailedSalesReportPageState createState() => DetailedSalesReportPageState();
// }

// class DetailedSalesReportPageState extends State<DetailedSalesReportPage> {
//   List<String> _months = [];
//   List<double> _salesNumbers = [];
//   List<double> _totalAmounts = [];
//   List<Map<String, dynamic>> _tableData = [];
//   bool _isLoading = false;
//   final Logger _logger = Logger('DetailedSalesReportPage');

//   @override
//   void initState() {
//     super.initState();
//     _fetchSalesReport();
//   }

//   Future<void> _fetchSalesReport({String? startDate, String? endDate}) async {
//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final queryParameters = {
//         if (startDate != null) 'fechaInicio': startDate,
//         if (endDate != null) 'fechaFin': endDate,
//       };

//       final uri =
//           Uri.parse('https://tiptop.firetensor.com/api/reporteVentaDetallada')
//               .replace(queryParameters: queryParameters);

//       final response = await http.get(uri);

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);

//         _logger.info('Datos recibidos de la API: $data');

//         setState(() {
//           _months = List<String>.from(data['grafico']['meses'] ?? []);
//           _salesNumbers = List<double>.from(data['grafico']['numVentas']
//                   ?.map((item) => double.tryParse(item) ?? 0.0) ??
//               []);
//           _totalAmounts = List<double>.from(data['grafico']['montosTotales']
//                   ?.map((item) => double.tryParse(item) ?? 0.0) ??
//               []);
//           _tableData = List<Map<String, dynamic>>.from(data['tabla'] ?? []);
//         });
//       } else {
//         _showErrorMessage('Error al cargar el reporte');
//       }
//     } catch (e) {
//       _logger.severe('Error al obtener el reporte: ${e.toString()}');
//       _showErrorMessage('Error: ${e.toString()}');
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   void _showErrorMessage(String message) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(message)));
//   }

//   Future<void> _selectDateRange() async {
//     final DateTimeRange? picked = await showDateRangePicker(
//       context: context,
//       firstDate: DateTime(2020),
//       lastDate: DateTime.now(),
//     );

//     if (picked != null) {
//       await _fetchSalesReport(
//         startDate: picked.start.toIso8601String().split('T').first,
//         endDate: picked.end.toIso8601String().split('T').first,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Reporte de Ventas Detalladas'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.date_range),
//             onPressed: _selectDateRange,
//           ),
//         ],
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Column(
//                 children: [
//                   // Gráfico Lineal
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 300,
//                           child: LineChart(
//                             LineChartData(
//                               titlesData: FlTitlesData(
//                                 leftTitles: AxisTitles(
//                                   axisNameWidget: const Text('Miles'),
//                                   sideTitles: SideTitles(
//                                     showTitles: true,
//                                     getTitlesWidget: (value, meta) {
//                                       return Text(
//                                           (value / 1000).toStringAsFixed(1));
//                                     },
//                                   ),
//                                 ),
//                                 bottomTitles: AxisTitles(
//                                   sideTitles: SideTitles(
//                                     showTitles: true,
//                                     getTitlesWidget: (value, meta) {
//                                       final index = value.toInt();
//                                       return index >= 0 &&
//                                               index < _months.length
//                                           ? Text(_months[index])
//                                           : const Text('');
//                                     },
//                                   ),
//                                 ),
//                               ),
//                               gridData: FlGridData(show: true),
//                               borderData: FlBorderData(show: true),
//                               lineBarsData: [
//                                 LineChartBarData(
//                                   isCurved: true,
//                                   spots: List.generate(
//                                     _months.length,
//                                     (index) => FlSpot(
//                                       index.toDouble(),
//                                       _salesNumbers[index],
//                                     ),
//                                   ),
//                                   belowBarData: BarAreaData(show: true),
//                                   color: Colors.blue,
//                                 ),
//                                 LineChartBarData(
//                                   isCurved: true,
//                                   spots: List.generate(
//                                     _months.length,
//                                     (index) => FlSpot(
//                                       index.toDouble(),
//                                       _totalAmounts[index],
//                                     ),
//                                   ),
//                                   belowBarData: BarAreaData(show: true),
//                                   color: Colors.green,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 16.0),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Row(
//                               children: [
//                                 Container(
//                                     width: 10, height: 10, color: Colors.blue),
//                                 const SizedBox(width: 4),
//                                 const Text('Número de Ventas'),
//                               ],
//                             ),
//                             const SizedBox(width: 16),
//                             Row(
//                               children: [
//                                 Container(
//                                     width: 10, height: 10, color: Colors.green),
//                                 const SizedBox(width: 4),
//                                 const Text('Monto Total'),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 16.0),
//                   // Tabla de datos con scroll horizontal
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: DataTable(
//                       columns: const [
//                         DataColumn(label: Text('Fecha')),
//                         DataColumn(label: Text('Cliente')),
//                         DataColumn(label: Text('Producto')),
//                         DataColumn(label: Text('Importe')),
//                       ],
//                       rows: _tableData.map((row) {
//                         return DataRow(cells: [
//                           DataCell(Text(row['fecha'] ?? '')),
//                           DataCell(Text(row['cliente'] ?? '')),
//                           DataCell(Text(row['producto'] ?? '')),
//                           DataCell(Text(row['importe'] ?? '')),
//                         ]);
//                       }).toList(),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }

//scroll de verdad---------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:logging/logging.dart';

class DetailedSalesReportPage extends StatefulWidget {
  const DetailedSalesReportPage({super.key});

  @override
  DetailedSalesReportPageState createState() => DetailedSalesReportPageState();
}

class DetailedSalesReportPageState extends State<DetailedSalesReportPage> {
  List<String> _months = [];
  List<double> _salesNumbers = [];
  List<double> _totalAmounts = [];
  List<Map<String, dynamic>> _tableData = [];
  bool _isLoading = false;
  final Logger _logger = Logger('DetailedSalesReportPage');

  @override
  void initState() {
    super.initState();
    _fetchSalesReport();
  }

  Future<void> _fetchSalesReport({String? startDate, String? endDate}) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final queryParameters = {
        if (startDate != null) 'fechaInicio': startDate,
        if (endDate != null) 'fechaFin': endDate,
      };

      final uri =
          Uri.parse('https://tiptop.firetensor.com/api/reporteVentaDetallada')
              .replace(queryParameters: queryParameters);

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        _logger.info('Datos recibidos de la API: $data');

        setState(() {
          _months = List<String>.from(data['grafico']['meses'] ?? []);
          _salesNumbers = List<double>.from(data['grafico']['numVentas']
                  ?.map((item) => double.tryParse(item) ?? 0.0) ??
              []);
          _totalAmounts = List<double>.from(data['grafico']['montosTotales']
                  ?.map((item) => double.tryParse(item) ?? 0.0) ??
              []);
          _tableData = List<Map<String, dynamic>>.from(data['tabla'] ?? []);
        });
      } else {
        _showErrorMessage('Error al cargar el reporte');
      }
    } catch (e) {
      _logger.severe('Error al obtener el reporte: ${e.toString()}');
      _showErrorMessage('Error: ${e.toString()}');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _selectDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      await _fetchSalesReport(
        startDate: picked.start.toIso8601String().split('T').first,
        endDate: picked.end.toIso8601String().split('T').first,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reporte de Ventas Detalladas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.date_range),
            onPressed: _selectDateRange,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  // Gráfico Lineal
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 300,
                      child: LineChart(
                        LineChartData(
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                              axisNameWidget: const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Text('Miles',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black)),
                              ),
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    '${(value / 1000).toStringAsFixed(1)}k',
                                    style: const TextStyle(fontSize: 10),
                                  );
                                },
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  final index = value.toInt();
                                  return index >= 0 && index < _months.length
                                      ? Text(_months[index])
                                      : const Text('');
                                },
                              ),
                            ),
                          ),
                          gridData: FlGridData(show: true),
                          borderData: FlBorderData(show: true),
                          lineBarsData: [
                            LineChartBarData(
                              isCurved: true,
                              spots: List.generate(
                                _months.length,
                                (index) => FlSpot(
                                  index.toDouble(),
                                  _salesNumbers[index],
                                ),
                              ),
                              belowBarData: BarAreaData(show: true),
                              color: Colors.blue,
                            ),
                            LineChartBarData(
                              isCurved: true,
                              spots: List.generate(
                                _months.length,
                                (index) => FlSpot(
                                  index.toDouble(),
                                  _totalAmounts[index],
                                ),
                              ),
                              belowBarData: BarAreaData(show: true),
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Leyenda del gráfico
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Row(
                          children: [
                            Icon(Icons.circle, color: Colors.blue, size: 12),
                            SizedBox(width: 5),
                            Text('Núm. Ventas'),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.circle, color: Colors.green, size: 12),
                            SizedBox(width: 5),
                            Text('Monto Total'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  // Tabla de datos con scroll horizontal
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Fecha')),
                        DataColumn(label: Text('Producto')),
                        DataColumn(label: Text('Importe')),
                      ],
                      rows: _tableData.map((row) {
                        return DataRow(cells: [
                          DataCell(Text(row['fecha'] ?? '')),
                          DataCell(Text(row['producto'] ?? '')),
                          DataCell(Text(row['importe'] ?? '')),
                        ]);
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
