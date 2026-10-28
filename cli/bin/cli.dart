import 'dart:io';
import 'package:http/http.dart' as http;

const version = '0.0.1';

void main(List<String> arguments){

  if(arguments.first == 'help' || arguments.isEmpty){
    printUsage();
    
  } else if(arguments.first == 'version'){
    print("Dart CLI version $version");

  } else if(arguments.first == 'wikipedia'){
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchArt(inputArgs);

  } else{
    printUsage();
  }

}

void printUsage(){
  print(
    "This commands are valid: 'help' , 'version' , 'wikipedia <ARTICLE-TITLE>'."
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

void searchArt(List<String>? arguments) async {
  final String artTiT;

  if(arguments == null || arguments.isEmpty){
    print("Please provide an article title.");

    final inputFromStdin = stdin.readLineSync();
    if(inputFromStdin == null || inputFromStdin.isEmpty){
      print('No article title provided. Exiting.');
      return;
    }

  artTiT = inputFromStdin;

  } else {
    artTiT = arguments.join(' '); 
  }

  print('Looking up articles about "$artTiT". Please wait.');
  var artContent = await getWiki(artTiT);
  print(artContent);
}

