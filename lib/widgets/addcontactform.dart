import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:provider/provider.dart';
import '../providers/dataprovider.dart';

class AddContactForm extends StatefulWidget {
  const AddContactForm({super.key});

  @override
  State<AddContactForm> createState() => _AddContactFormState();
}

class _AddContactFormState extends State<AddContactForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController numberContoller = TextEditingController();


  @override
  void dispose() {
    nameController.dispose();
    emailAddressController.dispose();
    numberContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (ctx,dataProvider,_) {
        if(dataProvider.selectedContact != null) {
          logInfo("Selected Contact updated");
          nameController.text = dataProvider.selectedContact!.displayName;
          if(dataProvider.selectedContact!.emails.isNotEmpty) {
            emailAddressController.text = dataProvider.selectedContact!.emails[0].address;
          } else {
            emailAddressController.text = "";
          }
          if(dataProvider.selectedContact!.phones.isNotEmpty) {
            numberContoller.text = dataProvider.selectedContact!.phones[0].number;
          } else {
            numberContoller.text = "";
          }
          
          
        }

        return Column(
          children: [
            SizedBox(height: 20,),
            TextField(
              controller: nameController,
              decoration: customFormDecoration(labelText: "Name")
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: emailAddressController,
              keyboardType: TextInputType.emailAddress,
              decoration: customFormDecoration(labelText: "Email Address"),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: numberContoller,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: customFormDecoration(labelText: "Phone Number"),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {}, 
              style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87, // Transparent button background
                    foregroundColor: Colors.white, // White text color
                    side: const BorderSide(color: Colors.white, width: 4), // White border
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded corners
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Spacious padding
                    elevation: 0, // No shadow for a flat, modern look
              ),
              child: const Text(
                'Create',
                style: TextStyle(
                  fontSize: 20
                ),
              )
            )
          ],
        );
      }
    );
  }
}

InputDecoration customFormDecoration({
  required String labelText,// Default background color
  Color borderColor = Colors.green, // Default border color
  Color focusedBorderColor = Colors.green, // Default focused border color
  double borderRadius = 10.0, // Default border radius
  double borderWidth = 2.0, // Default border width
}) {
  return InputDecoration(
    labelText: labelText,
    filled: true,
    fillColor: Colors.grey.shade100, // Using opacity for a subtle fill
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: borderColor, width: borderWidth),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: focusedBorderColor, width: borderWidth),
    ),
    // You can add more default properties here if needed
    // hintStyle: TextStyle(color: Colors.grey),
    // labelStyle: TextStyle(color: Colors.blue),
  );
}