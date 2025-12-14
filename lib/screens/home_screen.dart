import 'package:flutter/material.dart';
import 'package:shared_preference/logic/shared_pref.dart';
import 'package:shared_preference/widgets/button_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final formKey =GlobalKey<FormState>();
  String? name;
  int? age;

  

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)),
                  label: Text("Name",),
                ),
              
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Name is required";
                  }else{
                    return null;
                  }
                },
              ),
        
              const SizedBox(height: 20,),
        
               TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)),
                  label: Text("Age",),
                ),
        
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Age is required";
                  }else{
                    return null;
                  }
                }
              ),
        
              const SizedBox(height: 20,),
        
               ButtonScreen(
                onPressed: ()async{
                  if(formKey.currentState!.validate()){}
                  await SharedPref.saveStringData("name", 
                  nameController.text);
                  await SharedPref.saveIntData("age",
                   int.parse(ageController.text));

                   setState(() {}); 
                   print("wes");
                   print(20);       
                },
                 txt: "Save"),
        
               const SizedBox(height: 20,),
        
              ButtonScreen(
                onPressed: ()async{
                  
                  name= await SharedPref.getString("name");
                  age= await SharedPref.getInt("age");
                  setState(() {});
                  print(name);
                  print(age);
                 
                 

                  showModalBottomSheet(
                    context: context,
                     builder: (context){
                      return Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(children: [
                          Text("Name : ${name?? ""}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),),
                          Text("Age : ${age?.toString()?? ""}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),),

                        ],),
                      );
                     });
                },
                 txt: "Get"),
        
               const SizedBox(height: 20,),
        
               ButtonScreen(
                onPressed: (){
                  SharedPref.removeData("name");
                   SharedPref.removeData("age");
                   setState(() {});
                },
                 txt: "Delete"),

                 Text("Name : ${name?? ""}"),
                 Text("Age : ${age?.toString()?? ""}"),
           ],
          
          ),
        ),
      ),
    );
  }
}