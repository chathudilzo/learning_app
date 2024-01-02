class SignInState{
  final String email;
  final String password;

  const SignInState({
    this.email="",this.password=""
  });

//can be anything copywith  //optioonal nullable parameters 
////copy with create new objects while keeping not changing variables same bcs class is immutable

  SignInState copyWith({String? email,String? password}){
    return SignInState(
      email:email??this.email,
    password:password??this.password
    );
  }
}