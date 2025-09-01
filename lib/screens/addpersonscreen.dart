import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:peacecarrots/widgets/buttonwithicon.dart';
import 'package:peacecarrots/widgets/myphonecontactsdisplay.dart';
import '../widgets/textboxwidget.dart';
import '../widgets/boxcontent.dart';
import '../widgets/addcontactform.dart';
import 'package:fast_contacts/fast_contacts.dart';  
import 'package:permission_handler/permission_handler.dart';

class AddPersonScreen extends StatefulWidget {
  static const String routeName = "/addpersonscreen";

  const AddPersonScreen({super.key});

  @override
  State<AddPersonScreen> createState() => _AddPersonScreenState();
}

class _AddPersonScreenState extends State<AddPersonScreen> {
  // Declare a late final variable to hold the Future instance.
  late final Future<List<Contact>> _contactsFuture;

  // Initialize the Future in initState(), which runs only once.
  @override
  void initState() {
    super.initState();
    _contactsFuture = getContacts();
  }

  Future<List<Contact>> getContacts() async {
    final status = await Permission.contacts.request();

    if (status.isGranted) {
      final List<Contact> contacts = await FastContacts.getAllContacts();
      return contacts;
    } else {
      throw Exception('Permission not granted');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Person", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/clouds_thunder_bg.jpg'),
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Image.asset('assets/rabbit_mascot_head_and_torso.png', height: 200,),
              TextBoxWidget(
                backgroundColor: Colors.red.shade400,
                textColor: Colors.white,
                borderColor: Colors.green,
                size: 16,
                text: "Enter the details of someone you are feel anger towards or select from your contacts.",
              ),
              const SizedBox(height: 10),
              BoxContent(
                backgroundColor: Colors.red.shade400,
                borderColor: Colors.green,
                child: const AddContactForm(),
              ),
              const SizedBox(height: 10),
              FutureBuilder<List<Contact>>(
                // Pass the single, pre-initialized Future instance.
                future: _contactsFuture,
                builder: (ctx, sn) {
                  if (sn.connectionState == ConnectionState.done) {
                    if (sn.hasError) {
                      return Text('Error: ${sn.error}');
                    } else if (sn.hasData && sn.data!.isNotEmpty) {
                      return ButtonWithIcon(
                        onTap: () => showDialog(
                          context: ctx,
                          builder: (ctx) => AlertDialog(
                            title: const Text("My Contacts", textAlign: TextAlign.center),
                            content: MyPhoneContactsDisplay(
                              myContacts: sn.data!,
                              onTap: () {},
                              
                            ),
                            actionsAlignment: MainAxisAlignment.center,
                            actions: [
                              ElevatedButton(
                                onPressed: () => {},
                                child: const Text('Add'),
                              ),
                              ElevatedButton(
                                onPressed: () => Navigator.of(ctx).pop(),
                                child: const Text('Cancel'),
                              ),
                            ],
                          ),
                        ),
                        waiting: false,
                        backgroundColor: Colors.black87,
                        borderColor: Colors.white,
                        textColor: Colors.white,
                        label: "Add From Contacts",
                        icon: Icon(Icons.person, color: Colors.white),
                      );
                    } else {
                      return const Text('No contacts found on device.');
                    }
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}