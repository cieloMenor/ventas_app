// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart'; // Asegúrate de importar el paquete correctamente

// class HTMLViewPage extends StatefulWidget {
//   const HTMLViewPage({super.key});

//   @override
//   _HTMLViewPageState createState() => _HTMLViewPageState();
// }

// class _HTMLViewPageState extends State<HTMLViewPage> {
//   late WebViewController _controller;

//   @override
//   void initState() {
//     super.initState();
//     // Inicializa WebView para Android (si es necesario)
//     WebView.platform = SurfaceAndroidWebView();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Manual HTML'),
//       ),
//       body: WebView(
//         initialUrl: 'assets/manual/index.htm', // Ruta al archivo HTML
//         javascriptMode:
//             JavascriptMode.unrestricted, // Permite la ejecución de JavaScript
//         onWebViewCreated: (WebViewController webViewController) {
//           _controller = webViewController; // Guarda el controlador
//         },
//       ),
//     );
//   }
// }

//------------------------------------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart'; // Asegúrate de importar el paquete correctamente

// class HTMLViewPage extends StatefulWidget {
//   const HTMLViewPage({super.key});

//   @override
//   HTMLViewPageState createState() => HTMLViewPageState();
// }

// class HTMLViewPageState extends State<HTMLViewPage> {
//   late WebViewController controller;

//   @override
//   void initState() {
//     super.initState();
//     // Inicializa WebView para Android (si es necesario)
//     WebView.platform =
//         SurfaceAndroidWebView(); // Asegúrate de que esta línea sea correcta para tu plataforma y versión
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Manual HTML'),
//       ),
//       body: WebView(
//         initialUrl: 'assets/manual/index.htm', // Ruta al archivo HTML
//         javascriptMode:
//             JavascriptMode.unrestricted, // Permite la ejecución de JavaScript
//         onWebViewCreated: (WebViewController webViewController) {
//           controller = webViewController; // Guarda el controlador
//         },
//       ),
//     );
//   }
// }

// 4.10.00---------------------------------------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class HTMLViewPage extends StatefulWidget {
//   const HTMLViewPage({super.key});

//   @override
//   HTMLViewPageState createState() => HTMLViewPageState();
// }

// class HTMLViewPageState extends State<HTMLViewPage> {
//   late WebViewController controller;

//   @override
//   void initState() {
//     super.initState();
//     // Inicializa WebView para Android (sin la configuración explícita de la plataforma)
//     WebViewController().initialize();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Manual HTML'),
//       ),
//       body: WebView(
//         initialUrl: 'assets/manual/index.htm', // Ruta al archivo HTML
//         javascriptMode:
//             JavascriptMode.unrestricted, // Permite la ejecución de JavaScript
//         onWebViewCreated: (WebViewController webViewController) {
//           controller = webViewController; // Guarda el controlador
//         },
//       ),
//     );
//   }
// }

//------------------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class HTMLViewPage extends StatefulWidget {
//   const HTMLViewPage({super.key});

//   @override
//   HTMLViewPageState createState() => HTMLViewPageState();
// }

// class HTMLViewPageState extends State<HTMLViewPage> {
//   late final WebViewController controller;

//   @override
//   void initState() {
//     super.initState();
//     // Inicializa WebView para Android y iOS
//     WebViewPlatform.instance = SurfaceAndroidWebView();
//     // Habilitar la plataforma de WebView según la configuración de tu dispositivo
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Manual HTML'),
//       ),
//       body: WebViewWidget(
//           controller: controller), // Usamos WebViewWidget en lugar de WebView
//     );
//   }
// }

//----------------------------------------------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class HTMLViewPage extends StatefulWidget {
//   const HTMLViewPage({super.key});

//   @override
//   HTMLViewPageState createState() => HTMLViewPageState();
// }

// class HTMLViewPageState extends State<HTMLViewPage> {
//   late final WebViewController controller;

//   @override
//   void initState() {
//     super.initState();
//     // Inicializa el WebViewController cuando se inicia la página
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             // Aquí puedes actualizar la barra de carga si es necesario
//           },
//           onPageStarted: (String url) {
//             // Lógica para cuando se inicia la carga de la página
//           },
//           onPageFinished: (String url) {
//             // Lógica para cuando se termina de cargar la página
//           },
//           onHttpError: (HttpResponseError error) {
//             // Lógica para manejar errores HTTP
//           },
//           onWebResourceError: (WebResourceError error) {
//             // Lógica para manejar errores de recursos web
//           },
//           onNavigationRequest: (NavigationRequest request) {
//             // Lógica para manejar solicitudes de navegación
//             if (request.url.startsWith('https://www.youtube.com/')) {
//               return NavigationDecision
//                   .prevent; // Prevenir navegación a YouTube, por ejemplo
//             }
//             return NavigationDecision.navigate; // Continuar navegación
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse(
//           'assets/manual/index.htm')); // Cargar el archivo HTML localmente
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Manual HTML'),
//       ),
//       body: WebViewWidget(
//           controller: controller), // Usamos WebViewWidget con el controlador
//     );
//   }
// }

//-------------------------------------------------------------------------------

// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class HTMLViewPage extends StatefulWidget {
//   const HTMLViewPage({super.key});

//   @override
//   HTMLViewPageState createState() => HTMLViewPageState();
// }

// class HTMLViewPageState extends State<HTMLViewPage> {
//   late final WebViewController controller;

//   @override
//   void initState() {
//     super.initState();

//     // Inicializa el WebViewController
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             debugPrint('Progreso de carga: $progress%');
//           },
//           onPageStarted: (String url) {
//             debugPrint('Carga iniciada en: $url');
//           },
//           onPageFinished: (String url) {
//             debugPrint('Carga finalizada en: $url');
//           },
//           onWebResourceError: (WebResourceError error) {
//             debugPrint(
//                 'Error de recurso: ${error.errorCode}, ${error.description}');
//           },
//           onNavigationRequest: (NavigationRequest request) {
//             if (request.url.startsWith('https://www.youtube.com/')) {
//               debugPrint('Navegación bloqueada hacia: ${request.url}');
//               return NavigationDecision.prevent;
//             }
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..loadRequest(
//         Uri.parse(
//             'file:///android_asset/flutter_assets/assets/manual/index.htm'),
//       );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Manual HTML'),
//       ),
//       body: WebViewWidget(
//         controller:
//             controller, // Usamos WebViewWidget con el controlador configurado
//       ),
//     );
//   }
// }

//..........................................................................................

// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart'; // Asegúrate de importar webview_flutter

// class HTMLViewPage extends StatefulWidget {
//   const HTMLViewPage({super.key});

//   @override
//   HTMLViewPageState createState() => HTMLViewPageState();
// }

// class HTMLViewPageState extends State<HTMLViewPage> {
//   late final WebViewController controller;

//   @override
//   void initState() {
//     super.initState();

//     // Inicializa el WebViewController
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted) // Habilitar JavaScript
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             debugPrint('Progreso de carga: $progress%');
//           },
//           onPageStarted: (String url) {
//             debugPrint('Carga iniciada en: $url');
//           },
//           onPageFinished: (String url) {
//             debugPrint('Carga finalizada en: $url');
//           },
//           onWebResourceError: (WebResourceError error) {
//             debugPrint(
//                 'Error de recurso: ${error.errorCode}, ${error.description}');
//           },
//           onNavigationRequest: (NavigationRequest request) {
//             if (request.url.startsWith('https://www.youtube.com/')) {
//               debugPrint('Navegación bloqueada hacia: ${request.url}');
//               return NavigationDecision.prevent;
//             }
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..loadRequest(Uri.parse(
//           'file:///android_asset/flutter_assets/assets/manual/index.htm')); // URL local, ajusta según tus necesidades
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Manual HTML'),
//       ),
//       body: WebViewWidget(
//         controller: controller, // Usamos WebViewWidget con el controlador
//       ),
//     );
//   }
// }

//------------------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HTMLViewPage extends StatefulWidget {
  const HTMLViewPage({super.key});

  @override
  HTMLViewPageState createState() => HTMLViewPageState();
}

class HTMLViewPageState extends State<HTMLViewPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    // Inicializa el WebViewController
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // Habilitar JavaScript
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('Progreso de carga: $progress%');
          },
          onPageStarted: (String url) {
            debugPrint('Carga iniciada en: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Carga finalizada en: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint(
                'Error de recurso: ${error.errorCode}, ${error.description}');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('Navegación bloqueada hacia: ${request.url}');
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      );

    // Carga el archivo HTML local desde los assets
    controller.loadFlutterAsset('assets/manual/index.htm');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manual HTML'),
      ),
      body: WebViewWidget(
        controller: controller, // Usamos WebViewWidget con el controlador
      ),
    );
  }
}
