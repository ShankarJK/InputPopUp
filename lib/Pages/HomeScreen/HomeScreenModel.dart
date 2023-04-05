import 'package:inputpop/Helpers/AppNavigations/NavigationMixin.dart';
import 'package:mobx/mobx.dart';

part 'HomeScreenModel.g.dart';

// Create a HomeScreenModel
class HomeScreenModel = _HomeScreenModelBase with _$HomeScreenModel;

abstract class _HomeScreenModelBase with Store, NavigationMixin {

  // Create a variable collectionofInputs with  List<String> datatype and assign the empty list to it and make the variable as observable
  @observable
  List<String> collectionofInputs = [];

  /* Declare a method setInputs with required parameter collectionofInputs to assign the value to this.collectionofInputs */
  @action
  void setInputs({required List<String> collectionofInputs}) {

    // Assign the value [] to this.collectionofInputs 
    this.collectionofInputs = [];
    
    // Assign the value of paramter collectionofInputs to  this.collectionofInputs
    this.collectionofInputs = collectionofInputs;
  }
}
