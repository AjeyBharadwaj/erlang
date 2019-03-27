get_elem_card_type_enum_TO_string(Tctx, HLKeyPath, Extra) -> 
    LLKey = dwFunc(HLKeyPath);  
    VAL = ec_getnet:get_elem(Tctx, [LLKey, #map.mappings.Extra],_). 
    transform_card_type_enum_TO_string(VAL)
set_elem_card_type_enum_TO_string(Tctx, HLKeyPath, Val, Extra) -> 
    Newval=transform_string_TO_card_type_enum(Val)
    LLKey = dwFunc(HLKeyPath); 
    ec_genet:set_elem(Tctx, [LLKey, #map.mappings.Extra, Newval). 
