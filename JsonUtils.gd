extends Node

func custom_json_stringify(data: Dictionary) -> String:
    var result = "{\n"
    var keys = data.keys()
    keys.sort()
    for key in keys:
        var string_values = []
        for value in data[key]:
            string_values.append(str(value))
        
        var formatted_value = "\t[" + ", ".join(string_values) + "]"
        result += "\t\"%s\": %s,\n" % [key, formatted_value]
    
    result = result.rstrip(",\n") + "\n}"
    return result