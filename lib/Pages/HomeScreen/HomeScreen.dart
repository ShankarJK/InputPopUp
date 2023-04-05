import 'package:flutter/material.dart';
import 'package:inputpop/Helpers/AppNavigations/NavigationHelpers.dart';

import 'package:inputpop/Pages/HomeScreen/HomeScreenVM.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../Helpers/AppNavigations/NavigationMixin.dart';

// Create a statefulwidget for HomeScreen

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // Create a instance of HomeScreenVM 
  final HomeScreenVM instance = HomeScreenVM();

  // Create a instance _userinput for TextEditingController 
  final TextEditingController _userinput = TextEditingController();

  /* Invoke the initState() */
  @override
  void initState() {
    
    // Invoke super.initState() 
    super.initState();

    //Using navigationstream and create a lister event
    instance.navigationStream.stream.listen((event) {

      // Checks for the condition event is NavigatorPush
      if (event is NavigatorPop) {
        
        // Using context.Push() pass the pageconfig and data
        context.pop(pageConfig: event.data, checkMounted: false);
      }
    });
  }

  /* Declare a  dialogbox() with parameter index and which is used display the dialog box */
  void dialogbox(int index) {
    showDialog(
        barrierDismissible: false,
        //barrierColor: Colors.transparent,
        barrierLabel: "Show Message",
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: const EdgeInsets.all(30),
            
            // Consume the collectionofInputs[index] variable with parameter index 
            content: Text(instance.collectionofInputs[index]),
            
            actions: [
              ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red),
                  ),
                  onPressed: () {
                    
                    // Invoke the getback()
                    instance.getback();
                  },
                  child: const Center(child: Text("Close")))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input & Popup"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter Your Name",
                    contentPadding: const EdgeInsets.only(
                        left: 30, right: 10, top: 5, bottom: 5),
                    hintStyle: const TextStyle(color: Colors.grey),
                    label: const Text("Name"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    constraints:
                        const BoxConstraints(maxHeight: 60, maxWidth: 300)),
               
                // Set the instance _userinput to the controller 
                controller: _userinput,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    
                    // Invoke the onshowTapped() and pass the paramter of values as _userinput.text
                    instance.onshowTapped(values: _userinput.text);
                  },
                  child: const Text("Show Input")),
              const SizedBox(
                height: 10,
              ),
              Observer(builder: (context) {
                return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                  
                    // Set the itemCount by collectionofInputs.length
                    itemCount: instance.collectionofInputs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: const BoxDecoration(
                          border: BorderDirectional(bottom: BorderSide(color: Color.fromARGB(255, 211, 206, 206),width: 1))
                        ),
                        child: ListTile(
                          title: Observer(builder: (context) {
                           
                            // Consume the values of variable collectionofInputs[index]
                            return Text(instance.collectionofInputs[index]);
                          }),
                          trailing: CircleAvatar(
                              child: InkWell(
                                  child: const Icon(
                                    Icons.mode_edit_outlined,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    
                                    // Invoke the dialogbox() and pass the parameter as index
                                    dialogbox(index);
                                  })),
                        ),
                      );
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }

  /* Invoke the dispose() */
  @override
  void dispose() {

    // Using navigationStream.Close() close the stream
    instance.navigationStream.close();

    // Invoke super.dispose()
    super.dispose();
  }
}
