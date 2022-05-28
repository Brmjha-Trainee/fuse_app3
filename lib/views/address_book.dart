import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fuseapp/theme/theme_constants.dart';
import 'package:fuseapp/view_model/address_book_vm.dart';
import 'package:fuseapp/views/edit_book.dart';

import 'package:provider/provider.dart';

import '../providers/address_provider.dart';

import '../routers/routing_constants.dart';

class AddressBook extends StatefulWidget {
  @override
  _AddressBookState createState() => _AddressBookState();
}

class _AddressBookState extends State<AddressBook> {
  @override

  Widget build(BuildContext context) {
  Provider.of<AddressProvider>(context, listen: false).fetchAdress(context);   
  var obj = Provider.of<AddressProvider>(context, listen: true);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        //done-RAWABI Use the appbar in theme_constant.dart
        appBar: myAppBar(context, title: 'Shipping Address'),
        body: Container(
            padding: const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
           child: obj.useraddress != null ? widget1(obj.useraddress ) :widget2()
            ));
  }
  Widget widget1(Adress1? A){
    
    return Container(
         child: ListView(children: <Widget> [
        SizedBox(
                 height:90,
                 width: 400 ,
                child: Card(          
                    elevation: 10,
                    shadowColor: Colors.black,   
                      child: ListTile(
                        title: Text(A!.street.toString()+" - "+A.district.toString()+" - "+A.city.toString()+ " - "+A.zipCode.toString()),
                        leading: Icon(
                          Icons. location_on_outlined,
                          color: COLOR_PRIMARY,
                        ),
                        trailing:
                                 Column(
                                    
                          children: [
                            IconButton(
                                onPressed: () {
                                    //  Navigator.pushReplacementNamed(context, EditBookViewRoute ,arguments:EditAdressBook(A.city.toString()) ); 
                                     Navigator.push( context,MaterialPageRoute(builder: (context) =>  EditAdressBook(A)),);
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: COLOR_PRIMARY,
                                )),
                            IconButton(
                                onPressed: () {
                    Provider.of<AddressProvider>(context, listen: false).deleteAddress(context);   
                                },
                                icon: Icon(
                                  Icons.delete_outlined,
                                  color: COLOR_PRIMARY,
                                ))
                          ],
                        ),
                      ),
                    ))]),
   

    );  
    
  }
  Widget widget2(){
    return Column(
  children: <Widget> [
    SizedBox(
      width: double.infinity,
      height: 50,
    ),
    Text(
      'No Address',
      style: h1,
    ),
    SizedBox(height: 30),
     darkBtn(
                  label: ' Add Adress',
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AddBookViewRoute);
                  })
          

  ],
);  
       
  }
 }


