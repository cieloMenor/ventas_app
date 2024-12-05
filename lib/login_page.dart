// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'reports_menu_page.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isLoading = false;

//   Future<void> _login() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });

//       try {
//         final response = await http.post(
//           Uri.parse('https://tiptop.firetensor.com/api/login'),
//           body: {
//             'email': _emailController.text,
//             'password': _passwordController.text,
//           },
//         );

//         if (response.statusCode == 200) {
//           final data = json.decode(response.body);
//           if (data['success'] != null) {
//             final prefs = await SharedPreferences.getInstance();
//             await prefs.setBool('isLoggedIn', true);
//             Navigator.of(context).pushReplacement(
//               MaterialPageRoute(builder: (_) => const ReportsMenuPage()),
//             );
//           } else {
//             _showErrorMessage(data['error'] ?? 'Error al iniciar sesión');
//           }
//         } else {
//           _showErrorMessage('Error de conexión');
//         }
//       } catch (e) {
//         _showErrorMessage('Error: ${e.toString()}');
//       } finally {
//         setState(() {
//           _isLoading = false;
//         });
//       }
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
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset('assets/logo.png', height: 100),
//                 const SizedBox(height: 48),
//                 TextFormField(
//                   controller: _emailController,
//                   decoration: const InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(),
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Por favor ingrese su email';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 TextFormField(
//                   controller: _passwordController,
//                   decoration: const InputDecoration(
//                     labelText: 'Contraseña',
//                     border: OutlineInputBorder(),
//                   ),
//                   obscureText: true,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Por favor ingrese su contraseña';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 24),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _isLoading ? null : _login,
//                     child: _isLoading
//                         ? const CircularProgressIndicator()
//                         : const Text('Ingresar'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//con actualizacion por errores1----------------------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'reports_menu_page.dart';

// class LoginPage extends StatefulWidget {
//   //const LoginPage({Key? key}) : super(key: key);
//   const LoginPage({super.key});

//   @override
//   LoginPageState createState() => LoginPageState();
// }

// class LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isLoading = false;

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   Future<void> _login() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });

//       try {
//         final response = await http.post(
//           Uri.parse('https://tiptop.firetensor.com/api/login'),
//           body: {
//             'email': _emailController.text,
//             'password': _passwordController.text,
//           },
//         );

//         if (response.statusCode == 200) {
//           final data = json.decode(response.body);
//           if (data['success'] != null) {
//             final prefs = await SharedPreferences.getInstance();
//             await prefs.setBool('isLoggedIn', true);
//             // Navigator.of(context).pushReplacement(
//             //   MaterialPageRoute(builder: (_) => const ReportsMenuPage()),
//             // );
//             if (mounted) {
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (_) => const ReportsMenuPage()),
//               );
//             }
//           } else {
//             _showErrorMessage(data['error'] ?? 'Error al iniciar sesión');
//           }
//         } else {
//           _showErrorMessage('Error de conexión');
//         }
//       } catch (e) {
//         _showErrorMessage('Error: ${e.toString()}');
//       } finally {
//         setState(() {
//           _isLoading = false;
//         });
//       }
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
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset('assets/logo.png', height: 100),
//                 const SizedBox(height: 48),
//                 TextFormField(
//                   controller: _emailController,
//                   decoration: const InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(),
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Por favor ingrese su email';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 TextFormField(
//                   controller: _passwordController,
//                   decoration: const InputDecoration(
//                     labelText: 'Contraseña',
//                     border: OutlineInputBorder(),
//                   ),
//                   obscureText: true,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Por favor ingrese su contraseña';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 24),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _isLoading ? null : _login,
//                     child: _isLoading
//                         ? const CircularProgressIndicator()
//                         : const Text('Ingresar'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//con boton guia-------------------------------------------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'reports_menu_page.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key})
//       : super(
//             key: key); // Aquí pasamos el 'key' al constructor del widget padre

//   @override
//   LoginPageState createState() => LoginPageState();
// }

// class LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isLoading = false;

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   Future<void> _login() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });

//       try {
//         final response = await http.post(
//           Uri.parse('https://tiptop.firetensor.com/api/login'),
//           body: {
//             'email': _emailController.text,
//             'password': _passwordController.text,
//           },
//         );

//         if (response.statusCode == 200) {
//           final data = json.decode(response.body);
//           if (data['success'] != null) {
//             final prefs = await SharedPreferences.getInstance();
//             await prefs.setBool('isLoggedIn', true);
//             if (mounted) {
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (_) => const ReportsMenuPage()),
//               );
//             }
//           } else {
//             _showErrorMessage(data['error'] ?? 'Error al iniciar sesión');
//           }
//         } else {
//           _showErrorMessage('Error de conexión');
//         }
//       } catch (e) {
//         _showErrorMessage('Error: ${e.toString()}');
//       } finally {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }
//   }

//   void _showErrorMessage(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }

//   void _openPDF() {
//     // Abre el PDF
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => PDFViewPage()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset('assets/logo.png', height: 100),
//                 const SizedBox(height: 48),
//                 TextFormField(
//                   controller: _emailController,
//                   decoration: const InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(),
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Por favor ingrese su email';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 TextFormField(
//                   controller: _passwordController,
//                   decoration: const InputDecoration(
//                     labelText: 'Contraseña',
//                     border: OutlineInputBorder(),
//                   ),
//                   obscureText: true,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Por favor ingrese su contraseña';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 24),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _isLoading ? null : _login,
//                     child: _isLoading
//                         ? const CircularProgressIndicator()
//                         : const Text('Ingresar'),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _openPDF, // Acción para abrir el PDF
//                     child: const Text('Guía'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class PDFViewPage extends StatelessWidget {
//   const PDFViewPage({Key? key})
//       : super(
//             key: key); // Aquí pasamos el 'key' al constructor del widget padre

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Manual PDF'),
//       ),
//       body: PDFView(
//         filePath: 'assets/manual/manual.pdf', // Ruta al archivo PDF
//       ),
//     );
//   }
// }

//sin error-----------------------------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'reports_menu_page.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage(
//       {super.key}); // Aquí se pasa el 'key' al widget padre correctamente

//   @override
//   LoginPageState createState() => LoginPageState();
// }

// class LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isLoading = false;

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   Future<void> _login() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });

//       try {
//         final response = await http.post(
//           Uri.parse('https://tiptop.firetensor.com/api/login'),
//           body: {
//             'email': _emailController.text,
//             'password': _passwordController.text,
//           },
//         );

//         if (response.statusCode == 200) {
//           final data = json.decode(response.body);
//           if (data['success'] != null) {
//             final prefs = await SharedPreferences.getInstance();
//             await prefs.setBool('isLoggedIn', true);
//             if (mounted) {
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (_) => const ReportsMenuPage()),
//               );
//             }
//           } else {
//             _showErrorMessage(data['error'] ?? 'Error al iniciar sesión');
//           }
//         } else {
//           _showErrorMessage('Error de conexión');
//         }
//       } catch (e) {
//         _showErrorMessage('Error: ${e.toString()}');
//       } finally {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }
//   }

//   void _showErrorMessage(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }

//   void _openPDF() {
//     // Abre el PDF
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const PDFViewPage()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset('assets/logo.png', height: 100),
//                 const SizedBox(height: 48),
//                 TextFormField(
//                   controller: _emailController,
//                   decoration: const InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(),
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Por favor ingrese su email';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 TextFormField(
//                   controller: _passwordController,
//                   decoration: const InputDecoration(
//                     labelText: 'Contraseña',
//                     border: OutlineInputBorder(),
//                   ),
//                   obscureText: true,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Por favor ingrese su contraseña';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 24),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _isLoading ? null : _login,
//                     child: _isLoading
//                         ? const CircularProgressIndicator()
//                         : const Text('Ingresar'),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _openPDF, // Acción para abrir el PDF
//                     child: const Text('Guía'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class PDFViewPage extends StatelessWidget {
//   const PDFViewPage(
//       {super.key}); // Aquí se pasa el 'key' al widget padre correctamente

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Manual PDF'),
//       ),
//       body: const PDFView(
//         filePath: 'assets/manual/manual.pdf', // Ruta al archivo PDF
//       ),
//     );
//   }
// }

//con boton guia con pdfx---------------------------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'reports_menu_page.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   LoginPageState createState() => LoginPageState();
// }

// class LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isLoading = false;

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   Future<void> _login() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });

//       try {
//         final response = await http.post(
//           Uri.parse('https://tiptop.firetensor.com/api/login'),
//           body: {
//             'email': _emailController.text,
//             'password': _passwordController.text,
//           },
//         );

//         if (response.statusCode == 200) {
//           final data = json.decode(response.body);
//           if (data['success'] != null) {
//             final prefs = await SharedPreferences.getInstance();
//             await prefs.setBool('isLoggedIn', true);
//             if (mounted) {
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (_) => const ReportsMenuPage()),
//               );
//             }
//           } else {
//             _showErrorMessage(data['error'] ?? 'Error al iniciar sesión');
//           }
//         } else {
//           _showErrorMessage('Error de conexión');
//         }
//       } catch (e) {
//         _showErrorMessage('Error: ${e.toString()}');
//       } finally {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }
//   }

//   void _showErrorMessage(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }

//   void _openPDF() {
//     // Abre el PDF
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const PDFViewPage()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset('assets/logo.png', height: 100),
//                 const SizedBox(height: 48),
//                 TextFormField(
//                   controller: _emailController,
//                   decoration: const InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(),
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Por favor ingrese su email';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 TextFormField(
//                   controller: _passwordController,
//                   decoration: const InputDecoration(
//                     labelText: 'Contraseña',
//                     border: OutlineInputBorder(),
//                   ),
//                   obscureText: true,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Por favor ingrese su contraseña';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 24),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _isLoading ? null : _login,
//                     child: _isLoading
//                         ? const CircularProgressIndicator()
//                         : const Text('Ingresar'),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _openPDF, // Acción para abrir el PDF
//                     child: const Text('Guía'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class PDFViewPage extends StatelessWidget {
//   const PDFViewPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Manual PDF'),
//       ),
//       body: const PDFView(
//         filePath: 'assets/manual/manual.pdf', // Ruta al archivo PDF
//       ),
//     );
//   }
// }

// boton guia con archivo html ------------------------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'reports_menu_page.dart';
// import 'html_view_page.dart'; // Asegúrate de importar el archivo HTMLViewPage

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   LoginPageState createState() => LoginPageState();
// }

// class LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isLoading = false;

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   Future<void> _login() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });

//       try {
//         final response = await http.post(
//           Uri.parse('https://tiptop.firetensor.com/api/login'),
//           body: {
//             'email': _emailController.text,
//             'password': _passwordController.text,
//           },
//         );

//         if (response.statusCode == 200) {
//           final data = json.decode(response.body);
//           if (data['success'] != null) {
//             final prefs = await SharedPreferences.getInstance();
//             await prefs.setBool('isLoggedIn', true);
//             if (mounted) {
//               Navigator.of(context).pushReplacement(
//                 MaterialPageRoute(builder: (_) => const ReportsMenuPage()),
//               );
//             }
//           } else {
//             _showErrorMessage(data['error'] ?? 'Error al iniciar sesión');
//           }
//         } else {
//           _showErrorMessage('Error de conexión');
//         }
//       } catch (e) {
//         _showErrorMessage('Error: ${e.toString()}');
//       } finally {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }
//   }

//   void _showErrorMessage(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(message)),
//     );
//   }

//   void _openHTML() {
//     // Abre el HTML en un WebView
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: (context) =>
//               const HTMLViewPage()), // Aquí se abre la página HTML
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset('assets/logo.png', height: 100),
//                 const SizedBox(height: 48),
//                 TextFormField(
//                   controller: _emailController,
//                   decoration: const InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(),
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Por favor ingrese su email';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16),
//                 TextFormField(
//                   controller: _passwordController,
//                   decoration: const InputDecoration(
//                     labelText: 'Contraseña',
//                     border: OutlineInputBorder(),
//                   ),
//                   obscureText: true,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Por favor ingrese su contraseña';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 24),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _isLoading ? null : _login,
//                     child: _isLoading
//                         ? const CircularProgressIndicator()
//                         : const Text('Ingresar'),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _openHTML, // Acción para abrir el archivo HTML
//                     child: const Text('Guía'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//......................................................................

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'reports_menu_page.dart';
import 'html_view_page.dart'; // Importa el archivo HTMLViewPage

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final response = await http.post(
          Uri.parse('https://tiptop.firetensor.com/api/login'),
          body: {
            'email': _emailController.text,
            'password': _passwordController.text,
          },
        );

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          if (data['success'] != null) {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool('isLoggedIn', true);
            if (mounted) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => const ReportsMenuPage()),
              );
            }
          } else {
            _showErrorMessage(data['error'] ?? 'Error al iniciar sesión');
          }
        } else {
          _showErrorMessage('Error de conexión');
        }
      } catch (e) {
        _showErrorMessage('Error: ${e.toString()}');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _openHTML() {
    // Abre el HTML en un WebView
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const HTMLViewPage(), // Aquí se abre la página HTML
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', height: 100),
                const SizedBox(height: 48),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su contraseña';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _login,
                    child: _isLoading
                        ? const CircularProgressIndicator()
                        : const Text('Ingresar'),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _openHTML, // Acción para abrir el archivo HTML
                    child: const Text('Guía'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
