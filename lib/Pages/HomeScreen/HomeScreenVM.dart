import 'package:inputpop/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:inputpop/Pages/HomeScreen/HomeScreenModel.dart';


// Create a class HomeScreenVM which extends HomeScreenModel
class HomeScreenVM extends HomeScreenModel{  

  /* Declare a method onshowTapped() to add the text values into the collectionofInputs */
  void onshowTapped({required String values}){

    // Using add() in collections, push the values into the collectionofInputs
    collectionofInputs.add(values);

    // Assign the value of collectionofInputs inputs using values paramter
    setInputs(collectionofInputs: collectionofInputs);
  }

  /* Declare a getback() to navigate to previous view */
  void getback(){

   // Using navigatorstream.add methods invoke the Navigatorpop
    navigationStream.add(NavigatorPop());
  }
}