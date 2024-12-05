// import 'package:flutter/material.dart';
// import 'detailed_sales_report_page.dart';
// import 'stock_report_page.dart';

// class ReportsMenuPage extends StatelessWidget {
//   //const ReportsMenuPage({Key? key}) : super(key: key);
//   const ReportsMenuPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Ver Reportes'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (_) => const StockReportPage()),
//                 );
//               },
//               child: const Text('Stock de Productos'),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (_) => const DetailedSalesReportPage()),
//                 );
//               },
//               child: const Text('Venta Detallada'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//con boton cerrar sesion -----------------------------------------------------------

import 'package:flutter/material.dart';
import 'detailed_sales_report_page.dart';
import 'stock_report_page.dart';
import 'login_page.dart';

class ReportsMenuPage extends StatelessWidget {
  const ReportsMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ver Reportes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const StockReportPage()),
                );
              },
              child: const Text('Stock de Productos'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const DetailedSalesReportPage()),
                );
              },
              child: const Text('Venta Detallada'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Redirige a la página de Login
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                );
              },
              child: const Text('Cerrar sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
