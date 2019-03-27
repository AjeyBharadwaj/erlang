get_elem_string_FROM_bool(Tctx, HLKeyPath, Extra) -> 
    LLKey = dwFunc(HLKeyPath);  
    VAL = ec_getnet:get_elem(Tctx, [{LLKey}, #map.mappings.Extra],_). 
    transform_bool_TO_string(VAL)
set_elem_string_TO_bool(Tctx, HLKeyPath, Val, Extra) -> 
    Newval=transform_string_TO_bool(Val)
    LLKey = dwFunc(HLKeyPath); 
    ec_genet:set_elem(Tctx, [{LLKey}, #map.mappings.Extra, Newval). 
get_elem_int32_FROM_int16(Tctx, HLKeyPath, Extra) -> 
    LLKey = dwFunc(HLKeyPath);  
    VAL = ec_getnet:get_elem(Tctx, [{LLKey}, #map.mappings.Extra],_). 
    transform_int16_TO_int32(VAL)
set_elem_int32_TO_int16(Tctx, HLKeyPath, Val, Extra) -> 
    Newval=transform_int32_TO_int16(Val)
    LLKey = dwFunc(HLKeyPath); 
    ec_genet:set_elem(Tctx, [{LLKey}, #map.mappings.Extra, Newval). 
get_elem_card_type_enum_FROM_string(Tctx, HLKeyPath, Extra) -> 
    LLKey = dwFunc(HLKeyPath);  
    VAL = ec_getnet:get_elem(Tctx, [{LLKey}, #map.mappings.Extra],_). 
    transform_string_TO_card_type_enum(VAL)
set_elem_card_type_enum_TO_string(Tctx, HLKeyPath, Val, Extra) -> 
    Newval=transform_card_type_enum_TO_string(Val)
    LLKey = dwFunc(HLKeyPath); 
    ec_genet:set_elem(Tctx, [{LLKey}, #map.mappings.Extra, Newval). 
get_elem_bool_FROM_int64(Tctx, HLKeyPath, Extra) -> 
    LLKey = dwFunc(HLKeyPath);  
    VAL = ec_getnet:get_elem(Tctx, [{LLKey}, #map.mappings.Extra],_). 
    transform_int64_TO_bool(VAL)
set_elem_bool_TO_int64(Tctx, HLKeyPath, Val, Extra) -> 
    Newval=transform_bool_TO_int64(Val)
    LLKey = dwFunc(HLKeyPath); 
    ec_genet:set_elem(Tctx, [{LLKey}, #map.mappings.Extra, Newval). 
