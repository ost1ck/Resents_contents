class Validators{

  static String? emailValidator(String? value){
    if(value == null || value.isEmpty){
      return "Please, enter email";
    }
    if(!value.contains('@')){
      return 'Plese, enter corrcect email(with \'@\')';
    }
    return null;
  }

  static String? passwordValidator (String? value){
    if(value == null || value.isEmpty){
      return 'Please, enter password';
    }
    if(value.length < 8 || value.length > 16){
      return 'Password lenght must be 8-16';
    }
    return null;
  }
}