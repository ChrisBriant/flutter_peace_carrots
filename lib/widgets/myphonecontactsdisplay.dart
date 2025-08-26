import 'package:flutter/material.dart';
import 'package:fast_contacts/fast_contacts.dart'; 
import 'package:provider/provider.dart';
import '../providers/dataprovider.dart';

class MyPhoneContactsDisplay extends StatelessWidget {
  final List<Contact> myContacts;
  final Function onTap;

  const MyPhoneContactsDisplay({
    required this.myContacts,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 320,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
        
      // ),
      child: Column(
        children: [
          const Text('Tap a contact to add their details.'),
          const SizedBox(height: 10,),
          Container(
            height: 300,
            width: 300,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: myContacts.length,
              itemBuilder: (ctx,idx) => Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: ListTile(
                  onTap: () {
                    DataProvider dataProvider = Provider.of(ctx,listen: false);
                    dataProvider.setSelectedContact(myContacts[idx]);
                    Navigator.of(ctx).pop();
                  },
                  key: ValueKey(myContacts[idx].id),
                  title : Text(myContacts[idx].displayName),
                ),
              )
              
            ),
          ),
        ],
      )
    );
  }
}