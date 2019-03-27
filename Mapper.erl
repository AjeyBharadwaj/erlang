['device',['http://tail-f.com/ns/example/hldevices'|'devices']] ->
	#mappings{path=['lldevice',['http://tail-f.com/ns/example/lldevices'|'lldevices']]};
['device-id',{HLKEY},'device',['http://tail-f.com/ns/example/hldevices'|'devices']] ->
	#mappings{path=['device-id',{LLKEY},'lldevice',['http://tail-f.com/ns/example/lldevices'|'lldevices']]};
['PID',{HLKEY},'device',['http://tail-f.com/ns/example/hldevices'|'devices']] ->
	#mappings{path=['ProductID',{LLKEY},'lldevice',['http://tail-f.com/ns/example/lldevices'|'lldevices']]};
['SERIAL',{HLKEY},'device',['http://tail-f.com/ns/example/hldevices'|'devices']] ->
	#mappings{path=['SERIAL',{LLKEY},'lldevice',['http://tail-f.com/ns/example/lldevices'|'lldevices']],get_elem=fun get_elem_string_FROM_bool/3,set_elem=fun set_elem_string_TO_bool/3,extra=['SERIAL',{LLKEY},'lldevice',['http://tail-f.com/ns/example/lldevices'|'lldevices']]};
['slot-id',{HLKEY},'device',['http://tail-f.com/ns/example/hldevices'|'devices']] ->
	#mappings{path=['slot-id',{LLKEY},'lldevice',['http://tail-f.com/ns/example/lldevices'|'lldevices']],get_elem=fun get_elem_int32_FROM_int16/3,set_elem=fun set_elem_int32_TO_int16/3,extra=['slot-id',{LLKEY},'lldevice',['http://tail-f.com/ns/example/lldevices'|'lldevices']]};
['card-type',{HLKEY},'device',['http://tail-f.com/ns/example/hldevices'|'devices']] ->
	#mappings{path=['card-type',{LLKEY},'lldevice',['http://tail-f.com/ns/example/lldevices'|'lldevices']],get_elem=fun get_elem_card_type_enum_FROM_string/3,set_elem=fun set_elem_card_type_enum_TO_string/3,extra=['card-type',{LLKEY},'lldevice',['http://tail-f.com/ns/example/lldevices'|'lldevices']]};
['speed',{HLKEY},'device',['http://tail-f.com/ns/example/hldevices'|'devices']] ->
	#mappings{path=['fullspeed',{LLKEY},'lldevice',['http://tail-f.com/ns/example/lldevices'|'lldevices']],get_elem=fun get_elem_bool_FROM_int64/3,set_elem=fun set_elem_bool_TO_int64/3,extra=['fullspeed',{LLKEY},'lldevice',['http://tail-f.com/ns/example/lldevices'|'lldevices']]};
