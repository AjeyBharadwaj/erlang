import sys
import pdb


GET_ELEM = "get_elem_{0}_FROM_{1}(Tctx, HLKeyPath, Extra) -> \n\
    LLKey = {2}(HLKeyPath);  \n\
    VAL = ec_getnet:get_elem(Tctx, [{4}LLKey{5}, #map.mappings.Extra],_). \n\
    {3}(VAL)\n"


SET_ELEM = "set_elem_{0}_TO_{1}(Tctx, HLKeyPath, Val, Extra) -> \n\
    Newval={3}(Val)\n\
    LLKey = {2}(HLKeyPath); \n\
    ec_genet:set_elem(Tctx, [{4}LLKey{5}, #map.mappings.Extra, Newval). \n"

TRANSFORM_ELEM = "transform_{0}_TO_{1}(VAL) -> \n\
    VAL.\n"

def get_type(elem, content):
    for i in range(0, len(content)):
        line = content[i]
        if " {0} {1}".format(elem, "{") in line:
            #pdb.set_trace()
            type = line.strip().split(" ")[0]
            if 'leaf' in type:
                for j in range(i+1, len(content)):
                    next_line = content[j]
                    if "type" in next_line.strip().split(" ")[0]:
                        type = next_line.strip().split(" ")[1].replace(";","")
                        #pdb.set_trace()
                        return type                
            return type

def get_full_path(leafs, content, ns, root, key=None):
    full_path = []
    path_leafs = leafs.split("/")
    leaf_type = None
    for path_leaf in path_leafs:
        type = get_type(path_leaf, content)
        if 'grouping' in type:
            pass
        else:
            leaf_type = type
            full_path = ["'" + path_leaf + "'"] + [","] + full_path 
    #pdb.set_trace()
    if key is None:
        full_path.append("['" + ns + "'" + "|" + "'" + root + "']")
    else:
        #pdb.set_trace()
        full_path = [full_path[0]] + ["{0}{1}{2}".format(",{", key, "}")] + full_path[1:]
        full_path.append("['" + ns + "'" + "|" + "'" + root + "']")
    
    return leaf_type, full_path
    
    

file = open(sys.argv[1], 'r')

hl_yang_folder = file.readline().replace('\n','')
ll_yang_folder = file.readline().replace('\n','')
hl_file = file.readline().replace('\n','')
ll_file = file.readline().replace('\n','')
hl_ns, hl_root = file.readline().replace('\n','').split(",")
ll_ns, ll_root = file.readline().replace('\n','').split(",")
upkey_func = file.readline().replace('\n','')
dnkey_func = file.readline().replace('\n','')

hl_contents = open(hl_file, 'r').readlines()
ll_contents = open(ll_file, 'r').readlines()

fmapper = open("Mapper.erl", "w");
ffunctions = open("Functions.erl", "w");
fconversion = open("Conversion.erl", "w");
    
#MAPPER FOR CONTAINER
path = file.readline().replace('\n','')
if len(path) == 0:
    pass;
hl_list_path,ll_list_path = path.split(",")

_, hl_list_full_path = get_full_path(hl_list_path, hl_contents, hl_ns, hl_root);
_, ll_list_full_path = get_full_path(ll_list_path, ll_contents, ll_ns, ll_root);

fmapper.write("[{0}] ->".format(''.join(hl_list_full_path)));
fmapper.write("\n\t")
fmapper.write("#mappings{0}path=[{1}]{2}".format("{", ''.join(ll_list_full_path), "};"))
fmapper.write("\n")

#MAPPER FOR KEY
path = file.readline().replace('\n','')
hlkey,llkey = path.split(",")

hlkey = "HLKEY"
llkey = "LLKEY"

conversion_function_list = []

while 1:
    path = file.readline().replace('\n','')
    if len(path) == 0:
        break;
    hl_path,ll_path = path.split(",")
    
    #pdb.set_trace()
    
    hl_leaf_type, hl_full_path = get_full_path(hl_path, hl_contents, hl_ns, hl_root, hlkey);
    ll_leaf_type, ll_full_path = get_full_path(ll_path, ll_contents, ll_ns, ll_root, llkey);

    fmapper.write("[{0}] ->".format(''.join(hl_full_path)));
    fmapper.write("\n\t")
        
    if hl_leaf_type == ll_leaf_type:
        fmapper.write("#mappings{0}path=[{1}]{2}".format("{", ''.join(ll_full_path), "};"))
    else:
        hl_leaf_type = hl_leaf_type.replace("-","_")
        ll_leaf_type = ll_leaf_type.replace("-","_")
        
        function_name = "{0}_TO_{1}".format(hl_leaf_type, ll_leaf_type)
        
        #pdb.set_trace()
        fmapper.write("#mappings{0}path=[{1}]".format("{", ''.join(ll_full_path)))
        fmapper.write(",get_elem=fun get_elem_{0}_FROM_{1}/3".format(hl_leaf_type, ll_leaf_type))
        fmapper.write(",set_elem=fun set_elem_{0}_TO_{1}/3".format(hl_leaf_type, ll_leaf_type))
        fmapper.write(",extra=[{0}]".format(''.join(ll_full_path)))
        fmapper.write("{0};".format("}"))
                
        if function_name not in conversion_function_list:
            conversion_function_list.append(function_name)
            ffunctions.write(GET_ELEM.format(hl_leaf_type, ll_leaf_type, dnkey_func, "transform_"+ll_leaf_type+"_TO_"+hl_leaf_type, "{", "}"))
            ffunctions.write(SET_ELEM.format(hl_leaf_type, ll_leaf_type, dnkey_func, "transform_"+hl_leaf_type+"_TO_"+ll_leaf_type, "{", "}"))
            
            fconversion.write(TRANSFORM_ELEM.format(hl_leaf_type, ll_leaf_type))
            fconversion.write(TRANSFORM_ELEM.format(ll_leaf_type, hl_leaf_type))
        
    
    fmapper.write("\n")
    
    
print("DONE!!!")

fmapper.close()
ffunctions.close()
fconversion.close()


