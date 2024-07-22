import 'package:e_commerce/uitls/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: const Text('Settings'),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Padding(
           padding: const EdgeInsets.only(left: 10),
           child: Text('General',style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.bold
           ),),
         ),
         const SizedBox(height: 18,),
         const CupertinoListTile(title: Text('Edit Profile'),
         leading: Icon(Icons.person),
         trailing: Icon(Icons.arrow_forward_ios),
         backgroundColor: AppColor.white,),
         const SizedBox(height: 5,),
          const CupertinoListTile(title: Text('Change Password'),
         leading: Icon(Icons.lock),
         trailing: Icon(Icons.arrow_forward_ios),
         backgroundColor: AppColor.white,),
         const SizedBox(height: 5,),
         const CupertinoListTile(title: Text('Notificitons'),
         leading: Icon(Icons.notifications),
         trailing: Icon(Icons.arrow_forward_ios),
         backgroundColor: AppColor.white,),
         const SizedBox(height: 5,),
         const CupertinoListTile(title: Text('security'),
         leading: Icon(Icons.security),
         trailing: Icon(Icons.arrow_forward_ios),
         backgroundColor: AppColor.white,),
         const SizedBox(height: 5,),
         const CupertinoListTile(title: Text('language'),
         leading: Icon(Icons.language),
         trailing: Icon(Icons.arrow_forward_ios),
         backgroundColor: AppColor.white,),
         const SizedBox(height: 5,),
         Padding(
           padding: const EdgeInsets.only(left: 10),
           child: Text('Perferemanc',style: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.bold
           ),),
         ),
         const CupertinoListTile(title: Text('Problem'),
         leading: Icon(Icons.sync_problem),
         trailing: Icon(Icons.arrow_forward_ios),
         backgroundColor: AppColor.white,),
         const SizedBox(height: 5,),
         const CupertinoListTile(title: Text('Help&Support'),
         leading: Icon(Icons.help),
         trailing: Icon(Icons.arrow_forward_ios),
         backgroundColor: AppColor.white,),
         const SizedBox(height: 15,),
          CupertinoListTile(title: Text('Log Out' ,style:  Theme.of(context).textTheme.labelMedium!.copyWith(
            color: AppColor.red
          ),),
         leading: const Icon(Icons.logout ,color: AppColor.red,),
         backgroundColor: AppColor.white,),
         const SizedBox(height: 5,),
        ],
      ),
    );
  }
}