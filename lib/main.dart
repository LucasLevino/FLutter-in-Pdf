import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:project_pdf/page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final pdf = pw.Document();

  whiteOnPdf(){
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(20),

        build: (pw.Context context) {
          return <pw.Widget> [
            pw.Header(
              level: 0,
              child: pw.Text('Easy Approach Document')
            ),

            pw.Paragraph(
              text: 'Consequat qui commodo tempor incididunt aliquip qui ad non labore id anim magna. Fugiat amet aute ex cupidatat sit et amet. Laboris aliquip do ipsum do commodo commodo fugiat reprehenderit. Mollit sint fugiat velit Lorem pariatur ea occaecat aliquip exercitation ullamco proident sint. Culpa velit esse velit sunt ipsum cupidatat qui consectetur minim aute excepteur.'
            ),

            pw.Paragraph(
              text: 'Consequat qui commodo tempor incididunt aliquip qui ad non labore id anim magna. Fugiat amet aute ex cupidatat sit et amet. Laboris aliquip do ipsum do commodo commodo fugiat reprehenderit. Mollit sint fugiat velit Lorem pariatur ea occaecat aliquip exercitation ullamco proident sint. Culpa velit esse velit sunt ipsum cupidatat qui consectetur minim aute excepteur.'
            ),

            pw.Header(
              level: 1,
              child: pw.Text('Second Header')
            ),

            pw.Paragraph(
              text: 'Aliquip sit adipisicing Lorem adipisicing id adipisicing fugiat nulla nostrud ut irure. Ex deserunt nisi ea amet Lorem adipisicing ut laboris Lorem velit dolore officia officia. Occaecat ullamco proident tempor duis deserunt aliquip sint nisi Lorem ipsum.'
            ),

            pw.Paragraph(
              text: 'Aliquip sit adipisicing Lorem adipisicing id adipisicing fugiat nulla nostrud ut irure. Ex deserunt nisi ea amet Lorem adipisicing ut laboris Lorem velit dolore officia officia. Occaecat ullamco proident tempor duis deserunt aliquip sint nisi Lorem ipsum.'
            ),

          ];
        },


      )
    );
  }

  Future savePdf() async{ 
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String documentPath = documentDirectory.path;

    File file = File('$documentPath/example.pdf');

    file.writeAsBytesSync(pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Text(
              'PDF', 
              style: TextStyle( fontSize: 34 ),
            )
          ],
        ),      
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          whiteOnPdf();
          await savePdf();

          Directory documentDirectory = await getApplicationDocumentsDirectory();
          String documentPath = documentDirectory.path;

          String fullPath = '$documentPath/example.pdf';
          
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => PdfPreview(path: fullPath)
          ));


        }
      ),
    );
  }
}