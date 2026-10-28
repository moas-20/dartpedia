import 'dart:io';
import 'package:http/http.dart' as http;

const version = '0.0.1';

void main(List<String> arguments){

  if(arguments.first == 'help' || arguments.isEmpty){
    printUsage();
    
  } else if(arguments.first == 'version'){
    print("Dart CLI version $version");

  } else if(arguments.first == 'search'){

  }

}

void printUsage(){
  print(
    "This commands are valid: 'help' , 'version' , 'search <ARTICLE-TITLE>'."
  );
}

Future<String> getWiki(String article) async{
  final url = Uri.http(
    'en.wikipedia.org',
    '/api/rest_v1/page/summary/$article',
  );

  final response = await http.get(url);

  if(response.statusCode == 200){
    return response.body;
  }

  return 'Error: Failed to fetch article "$article". Status code: ${response.statusCode}';
}

void searchArt(List<String>? arguments){
  final String artTiT;

  if(arguments == null || arguments.isEmpty){
    print("Please write artical name: ");
    artTiT = stdin.readLineSync() ?? '';

  } else {
    artTiT = arguments.join(' '); 
  }
}

