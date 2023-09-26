import 'package:flutter/material.dart';


class SizeDrawer extends StatelessWidget {
   SizeDrawer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Center(
                  child: UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage("https://scontent-fra3-2.xx.fbcdn.net/v/t39.30808-6/359829206_991548998557454_264841795033442363_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=a2f6c7&_nc_eui2=AeHJWtL8qtYFGKWq0ig6PxGeCVETf15sAEQJURN_XmwARMofswiTjOFiR0eb41TljGYji1DyDmf-6XW61djflMej&_nc_ohc=CNwYlUFZ5IsAX_sffkN&_nc_ht=scontent-fra3-2.xx&oh=00_AfD3VqhPlb0_AQTyTuBXc_UCuag-6FQNyFvwWjPM68a3Zw&oe=65154561"),
                    ),
                    accountName: Text("Moeen Uddin"),
                    accountEmail: Text("umoeen3@gmail.com"),

                  ),
                ),
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text("Add"),
                  onTap: () {
                  },
                ),
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text("Add"),
                  onTap: () {
                  },
                ),
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text("Add"),
                  onTap: () {
                  },
                ),



              ],

            ),
          ),
        ],
      ),
    );


  }
}
