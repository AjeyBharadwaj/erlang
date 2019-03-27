['device',['http://tail-f.com/ns/example/hldevices'|'devices']] ->
	#mappings{path=['lldevice',['http://tail-f.com/ns/example/lldevices'|'lldevices']]};
['device-id',{HLKEY},'device',['http://tail-f.com/ns/example/hldevices'|'devices']] ->
	#mappings{path=['device-id',{LLKEY},'lldevice',['http://tail-f.com/ns/example/lldevices'|'lldevices']]};
['PID',{HLKEY},'device',['http://tail-f.com/ns/example/hldevices'|'devices']] ->
	#mappings{path=['PID',{LLKEY},'lldevice',['http://tail-f.com/ns/example/lldevices'|'lldevices']]};
['SERIAL',{HLKEY},'device',['http://tail-f.com/ns/example/hldevices'|'devices']] ->
	#mappings{path=['SERIAL',{LLKEY},'lldevice',['http://tail-f.com/ns/example/lldevices'|'lldevices']]};
['slot-id',{HLKEY},'device',['http://tail-f.com/ns/example/hldevices'|'devices']] ->
	#mappings{path=['slot-id',{LLKEY},'lldevice',['http://tail-f.com/ns/example/lldevices'|'lldevices']],get_elem=fun get_elem_int32_FROM_int16/3,set_elem=fun set_elem_int32_TO_int16/3};
['card-type',{HLKEY},'device',['http://tail-f.com/ns/example/hldevices'|'devices']] ->
	#mappings{path=['card-type',{LLKEY},'lldevice',['http://tail-f.com/ns/example/lldevices'|'lldevices']],get_elem=fun get_elem_card_type_enum_FROM_string/3,set_elem=fun set_elem_card_type_enum_TO_string/3};
