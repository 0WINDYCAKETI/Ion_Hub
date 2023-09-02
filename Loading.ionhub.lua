workspace.FallenPartsDestroyHeight = -50000
local placeId = game.PlaceId

if placeId == 6152116144 or placeId == 13883279773 then
    loadstring(game:HttpGet("https://gitlab.com/ion-hub/Ion_Hub/-/raw/main/map1.lua"))()
elseif placeId == 11468159863 or placeId == 13881804983 or placeId == 13883059853 then
    loadstring(game:HttpGet("https://gitlab.com/ion-hub/Ion_Hub/-/raw/main/map2.lua"))()
elseif placeId == 5956785391 then 
    loadstring(game:HttpGet("https://gitlab.com/ion-hub/Ion_Hub/-/raw/main/menu.lua"))()
elseif placeId == 11468034852 then -- MUGEN
    loadstring(game:HttpGet("https://gitlab.com/ion-hub/Ion_Hub/-/raw/main/mugen.lua"))()
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NovazUwU/SharkHub/main/Ouw"))()
end
