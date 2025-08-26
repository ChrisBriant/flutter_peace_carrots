import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:peacecarrots/widgets/buttonwithicon.dart';
import 'package:peacecarrots/widgets/myphonecontactsdisplay.dart';
import '../widgets/textboxwidget.dart';
import '../widgets/boxcontent.dart';
import '../widgets/addcontactform.dart';
import 'package:fast_contacts/fast_contacts.dart';  
import 'package:permission_handler/permission_handler.dart';

class AddPersonScreen extends StatelessWidget {
  static const String routeName = "/addpersonscreen";
  const AddPersonScreen({super.key});

  Future<List<Contact>> getContacts() async {
   //List contacts = [];
    final status = await Permission.contacts.request();

    if (status.isGranted) {
      // Get all contacts on the device
      final List<Contact> contacts = await FastContacts.getAllContacts();
      return contacts;
    } else {
      // Handle the case if permissions are not granted
      throw Exception('Permission not granted');
    }
    
  }

  @override
  Widget build(BuildContext context) {

    // testContacts() async {
    //   List<Contact> myContacts = await getContacts();
    //   logInfo("My Contacts ${myContacts[0].displayName}");
    // }

    // testContacts();
    

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Person",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextBoxWidget(
              backgroundColor: Colors.red.shade400,
              textColor: Colors.white,
              borderColor: Colors.green,
              size: 16,
              text: "Enter the details of someone you are feel anger towards or select from your contacts.",
            ),
            const SizedBox(height: 10,),
            BoxContent(
              backgroundColor: Colors.red.shade400, 
              borderColor: Colors.green,
              child: const AddContactForm(),
              //child: const Text("HELLO"),
            ),
            const SizedBox(height: 10,),
            FutureBuilder<List<Contact>>(
              future: getContacts(),
              builder: (ctx,sn) {
                logInfo("CONNECTION STATES ${sn.connectionState} ${sn.hasData} ${sn.hasError} ");
                if(sn.hasError) {
                  logError(sn.error);
                }

                if (sn.connectionState == ConnectionState.done && sn.hasData) {
                  return ButtonWithIcon(
                    onTap: () => showDialog(
                      context: ctx, 
                      builder: (ctx) => AlertDialog(
                        title: const Text("My Contacts", textAlign: TextAlign.center,),
                        content: MyPhoneContactsDisplay(myContacts: sn.data!, onTap: () {},),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
                          ElevatedButton(
                            onPressed: () => {}, 
                            child: const Text('Add')
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.of(ctx).pop(), 
                            child: const Text('Cancel')
                          )
                        ],
                      )
                    ),
                    waiting: ConnectionState.waiting == sn.connectionState, 
                    backgroundColor: Colors.white54, 
                    borderColor: Colors.white, 
                    textColor: Colors.white, 
                    label: "Add From Contacts", 
                    icon: Icon(Icons.person, color: Colors.white,)
                  );
                } else {
                  return const CircularProgressIndicator();
                }

                

              },
              // builder: (ctx,sn) => sn.connectionState == ConnectionState.waiting
              // // ? CircularProgressIndicator()
              // // : Text('LLLLLLLL',style: TextStyle(color: Colors.white)),
              // //builder: (ctx,sn) => 
              // ? ButtonWithIcon(
              //   onTap: () => {},
              //   waiting: ConnectionState.waiting == sn.connectionState, 
              //   backgroundColor: Colors.white54, 
              //   borderColor: Colors.white, 
              //   textColor: Colors.white, 
              //   label: "Add From Contacts", 
              //   icon: Icon(Icons.person, color: Colors.white,)
              // )
              // : ButtonWithIcon(
              //   onTap: () => showDialog(
              //     context: ctx, 
              //     builder: (ctx) => AlertDialog(
              //       title: const Text("My Contacts", textAlign: TextAlign.center,),
              //       content: sn.connectionState == ConnectionState.waiting
              //       ? CircularProgressIndicator()
              //       : MyPhoneContactsDisplay(myContacts: sn.data!),
              //       actionsAlignment: MainAxisAlignment.center,
              //       actions: [
              //         ElevatedButton(
              //           onPressed: () => {}, 
              //           child: const Text('Add')
              //         ),
              //         ElevatedButton(
              //           onPressed: () => Navigator.of(ctx).pop(), 
              //           child: const Text('Cancel')
              //         )
              //       ],
              //     )
              //   ),
              //   waiting: ConnectionState.waiting == sn.connectionState, 
              //   backgroundColor: Colors.white54, 
              //   borderColor: Colors.white, 
              //   textColor: Colors.white, 
              //   label: "Add From Contacts", 
              //   icon: Icon(Icons.person, color: Colors.white,)
              // ),
            )
            // BoxContent(
            //   backgroundColor: Colors.red.shade400, 
            //   borderColor: Colors.green,
            //   child: Container(
            //     child: Row(

            //     ),
            //   ),
            //   //child: const Text("HELLO"),
            // ),

          ],
        ),
      ),
    );
  }
}