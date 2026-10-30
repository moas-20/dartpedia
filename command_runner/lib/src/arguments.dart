enum OptionType { flag , option }

class Option {
  Option(this.name , {
    required this.type,
    this.help,
    this.abbr,
    this.defualtValue,
    this.valueHlep,
    });

  final String name;
  final OptionType type;
  final String? help;
  final String? abbr;
  final Object? defualtValue;
  final String? valueHlep;

  String get usage {
    if(abbr != null){
      return '-$abbr, --$name: $help';
    }
    return '--$name: $help';
  }
}


class ArgResult {
  String? command;
  String? commandArg;
  Map<Option , Object?> options = {};


  bool flag(String name){
    for(var option in options.keys.where(
      (option) => option.type == OptionType.flag,

    )) {
      if(option.name == name){
        return options[option] as bool;
      }
    }

    return false;
  }

  bool hasOption(String name){
    return options.keys.any((option) => option.name == name);
  }

  ({Option option , Object? input}) getOption(String name){
    var mapEntry = options.entries.firstWhere(
      (entry) => entry.key.name == name || entry.key.abbr == name,
    );

    return (option: mapEntry.key , input: mapEntry.value);
  }
}