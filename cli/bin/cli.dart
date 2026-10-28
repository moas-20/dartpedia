import 'dart:io';

const version = '0.0.1';

void main(List<String> arguments){

  if(arguments.first == 'help' || arguments.isEmpty){
    printUsage();
    
  } else if(arguments.first == 'version'){
    print("Dart CLI version $version");

  } 

}

void printUsage(){
  print(
    "This commands are valid: 'help' , 'version' , 'search <ARTICLE-TITLE>'."
  );
}