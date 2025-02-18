import 'package:agri_connect/custom.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class AgriDetectionPage extends StatefulWidget {
  const AgriDetectionPage({super.key});

  @override
  State<AgriDetectionPage> createState() => _AgriDetectionPageState();
}

class _AgriDetectionPageState extends State<AgriDetectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.greenTextColor,
        title: Text("Agri Detection",style:TextStyle(color: CustomColor.mintForestTextColor),),
        actions: [
          IconButton(onPressed: (){

          },
              icon: Icon(FontAwesomeIcons.lightbulb,color: CustomColor.mintForestTextColor,)),
          IconButton(onPressed: (){
            openQRScanner(context);
          }, icon: Icon(FontAwesomeIcons.camera,color: CustomColor.mintForestTextColor,)),
        ],
      ),
      body: Column(
        mainAxisAlignment:MainAxisAlignment.start ,
        children: [
          SizedBox(height: 20,),
          Center(
            child: Container(
              child: Text("Place the plant in designated area",style: TextStyle(
                  color: CustomColor.ashgrey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),),
            ),
          )
        ],
      )
    );
  }

  void openQRScanner(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SizedBox(
            width: 300,
            height: 400,
            child: MobileScanner(
              onDetect: (BarcodeCapture capture) {
                final List<Barcode> barcodes = capture.barcodes;

                if (barcodes.isNotEmpty) {
                  final String? code = barcodes.first.rawValue;
                  Navigator.pop(context); // Close the scanner dialog
                  if (code != null) {
                    print('Scanned Code: $code'); // Handle the scanned QR code
                  } else {
                    print('Failed to retrieve the QR code value.');
                  }
                }
              },
            ),
          ),
        );
      },
    );
  }
}
