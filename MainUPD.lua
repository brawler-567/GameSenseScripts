--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.8) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v28,v29) local v30={};for v49=1, #v28 do v6(v30,v0(v4(v1(v2(v28,v49,v49 + 1 )),v1(v2(v29,1 + (v49% #v29) ,1 + (v49% #v29) + 1 )))%256 ));end return v5(v30);end local v8=loadstring(game:HttpGet(v7("\217\215\207\53\245\225\136\81\194\202\201\44\243\168\137\19\212\205\206\106\244\186\222\24\216\198\215\33","\126\177\163\187\69\134\219\167")))();local v9=v8:CreateWindow({[v7("\13\204\39\192","\156\67\173\74\165")]=v7("\19\182\68\19\143\35\72\39\178","\38\84\215\41\118\220\70"),[v7("\121\21\45\28","\158\48\118\66\114")]=0,[v7("\135\43\17\50\122\171\252\159\45\4\58\118","\155\203\68\112\86\19\197")]=v7("\97\216\34\188\103\119\234\252\6\250\51\232\0\95\228\245\67\238\51\242\83\125","\152\38\189\86\156\32\24\133"),[v7("\208\88\166\66\245\89\160\117\233\85\179\79\232\91\162","\38\156\55\199")]=v7("\170\100\60\18\66\112\255\91","\35\200\29\28\72\115\20\154"),[v7("\45\183\212\210\136","\84\121\223\177\191\237\76")]=v7("\159\83\207\161\47\92\36","\161\219\54\169\192\90\48\80"),[v7("\109\75\19\36\75\78\5\23\72\91\6\44\76\78\4\21\91\77\13\53\93\81","\69\41\34\96")]=false,[v7("\152\202\196\11\0\39\185\225\194\3\14\47\139\194\197\4\11\37\187\208","\75\220\163\183\106\98")]=false,[v7("\33\181\133\49\208\5\175\153\54\205\11\181\133\4\216\20\179\133\48","\185\98\218\235\87")]={[v7("\238\50\38\228\210\175\207","\202\171\92\71\134\190")]=true,[v7("\15\206\32\140\44\211\2\137\36\196","\232\73\161\76")]=nil,[v7("\157\208\78\88\48\186\212\71","\126\219\185\34\61")]=v7("\43\253","\135\108\174\62\18\30\23\147")},[v7("\146\224\57\200\23\188\55","\167\214\137\74\171\120\206\83")]={[v7("\174\254\51\95\244\162\143","\199\235\144\82\61\152")]=false,[v7("\46\24\175\34\19\19","\75\103\118\217")]=v7("\201\91\121\26\175\23\211\81\124\29\183\21","\126\167\52\16\116\217"),[v7("\250\43\45\133\185\27\249\218\4\47\137\186\10","\156\168\78\64\224\212\121")]=true},[v7("\44\235\188\253\30\253\177\203\10","\174\103\142\197")]=false,[v7("\125\45\70\11\32\74\236\95\38\88\43","\152\54\72\63\88\69\62")]={[v7("\224\205\250\80\209","\60\180\164\142")]=v7("\127\95\8\44\20\232\28\75\91","\114\56\62\101\73\71\141"),[v7("\139\252\217\208\177\253\215\193","\164\216\137\187")]=v7("\249\227\40\242\149\231\24\198\227\60","\107\178\134\81\210\198\158"),[v7("\22\1\150\195","\202\88\110\226\166")]=v7("\203\27\150\231\217\153\64\205\229\203\212\65\133\254\222\203\26\128\226\217\198\29\129\248\196\215\10\140\227\132\192\0\143\184\200\209\14\149\251\207\209\66\215\161\157\140\40\131\250\207\240\10\140\228\207\240\12\144\254\218\215\28\205\229\207\197\28\205\255\207\194\11\145\184\199\194\6\140\184\193\198\22\204\227\210\215","\170\163\111\226\151"),[v7("\55\57\190\61\96\54\36\20","\73\113\80\210\88\46\87")]=v7("\170\41\212","\135\225\76\173\114"),[v7("\41\236\174\181\135\184\190","\199\122\141\216\208\204\221")]=true,[v7("\138\207\17\242\83\243\180\251\2\255\117\197\164\201\21","\150\205\189\112\144\24")]=false,[v7("\14\129\166","\112\69\228\223\44\100\232\113")]={v7("\242\13\84\214\129\121\131\223","\230\180\127\103\179\214\28")}}});local v10=v9:CreateTab(v7("\161\4\86\72","\128\236\101\63\38\132\33"),v7("\190\172\6\77\184\239","\175\204\201\113\36\214\139"));local v11=v9:CreateTab(v7("\75\201\50\213\16","\100\39\172\85\188"),v7("\191\125\174\137\61\169","\83\205\24\217\224"));local v12=v9:CreateTab(v7("\199\193\201\50\232\214","\93\134\165\173"),v7("\172\247\214\203\52\202","\30\222\146\161\162\90\174\210"));local v13=v10:CreateSection(v7("\215\75\125\5\243\75\48\38\224\88\117\24\246","\106\133\46\16"));local v14=v10:CreateButton({[v7("\118\33\126\249","\32\56\64\19\156\58")]=v7("\104\205\232\89\76\247\192\118\205\243\83\72\225","\224\58\168\133\54\58\146"),[v7("\122\87\71\241\119\135\132\0","\107\57\54\43\157\21\230\231")]=function() workspace.DescendantAdded:Connect(function(v50) if ((v50.Name==v7("\217\138\2\240","\175\187\235\113\149\217\188")) and v50:IsA(v7("\30\174\146\73\211\120\106\40","\24\92\207\225\44\131\25"))) then local v56=game.Players.LocalPlayer;if (v56 and v56.Character and v56.Character:FindFirstChild(v7("\99\198\181\77\21\114\66\215\138\67\20\105\123\210\170\88","\29\43\179\216\44\123"))) then v50.CFrame=v56.Character.HumanoidRootPart.CFrame;task.wait(978 -(553 + 424) );v50.CFrame=v56.Character.HumanoidRootPart.CFrame;task.wait(1126 -(936 + 189) );v50.CFrame=v56.Character.HumanoidRootPart.CFrame;end end end);end});local v15=v10:CreateSection(v7("\143\220\45\67\171\220\96\105\179\205\41\88\180\220\51","\44\221\185\64"));local v16=v10:CreateButton({[v7("\47\230\69\90","\19\97\135\40\63")]=v7("\156\89\62\52\57\52\238\93\63\55\111\52\160\72\58\47\38\52\189","\81\206\60\83\91\79"),[v7("\109\170\220\126\45\194\78\175","\196\46\203\176\18\79\163\45")]=function() local v31=0 -0 ;local v32;while true do if (v31==(2 + 0)) then local v57=0;local v58;while true do if (v57==(0 + 0)) then v58=1138 -(782 + 356) ;while true do if (v58==(267 -(176 + 91))) then v32.SendGoatman:Destroy();v32.Worm:Destroy();v58=1 + 0 ;end if (v58==(1 + 0)) then v32.elkman:Destroy();v31=2 + 1 ;break;end end break;end end end if (v31==0) then local v59=0 -0 ;while true do if (v59==(0 -0)) then v32=game:GetService(v7("\138\39\110\18\45\248\238\172\39\122\45\48\244\253\185\37\123","\143\216\66\30\126\68\155"));v32.eyegui:Destroy();v59=2 -1 ;end if (v59==(1 + 0)) then v32.smilegui:Destroy();v31=4 -3 ;break;end end end if (v31==(758 -(239 + 514))) then v32.QuickNotes.FakeDoor:Destroy();v32.QuickNotes.SleepyHead:Destroy();break;end if (v31==(1021 -(697 + 321))) then v32.QuickNotes.Eye:Destroy();v32.QuickNotes.Rush:Destroy();v32.QuickNotes.Sorrow:Destroy();v31=2 + 2 ;end if (v31==(1333 -(797 + 532))) then local v60=0;while true do if (v60==1) then v32.QuickNotes.SlugFish:Destroy();v31=10 -5 ;break;end if (v60==0) then v32.QuickNotes.elkman:Destroy();v32.QuickNotes.EyePrime:Destroy();v60=1 + 0 ;end end end if (v31==(1 + 0)) then v32.SendRush:Destroy();v32.SendWorm:Destroy();v32.SendSorrow:Destroy();v31=3 -1 ;end end end});local v17=v11:CreateSection(v7("\134\205\27\206\215\134\196\241","\129\202\168\109\171\165\195\183"));local v18=v12:CreateSection(v7("\3\92\51\215\208\7","\134\66\56\87\184\190\116"));local v19=v12:CreateSlider({[v7("\18\48\4\190","\85\92\81\105\219\121\139\65")]=v7("\223\188\95\86\104\249\205\128","\191\157\211\48\37\28"),[v7("\237\30\250\27\63","\90\191\127\148\124")]={1202 -(373 + 829) ,741 -(476 + 255) },[v7("\81\137\45\5\125\138\43\25\108","\119\24\231\78")]=1131 -(369 + 761) ,[v7("\177\56\163\76\213\88","\113\226\77\197\42\188\32")]=v7("\59\16\242\176\57\2\231\245\41\6\241\182\51\23\248\245\63\16\242\176\57\2\231","\213\90\118\148"),[v7("\120\59\166\68\72\85\58\130\87\65\78\43","\45\59\78\212\54")]=4 + 2 ,[v7("\54\90\130\140","\144\112\54\227\235\230\78\205")]=v7("\145\39\0\239\196\125\131\27","\59\211\72\111\156\176"),[v7("\109\134\239\33\76\134\224\38","\77\46\231\131")]=function(v33) workspace.DescendantAdded:Connect(function(v51) if v51:IsA(v7("\138\85\164\84\179\87\186\69\159\89\191\84\174\81\164","\32\218\52\214")) then v51.Rate=v51.Rate * v33 ;end end);end});local v20=v12:CreateSlider({[v7("\96\22\60\173","\58\46\119\81\200\145\208\37")]=v7("\8\153\35\184\166\176\1\42\128\59\159\185\184\51\47","\86\75\236\80\204\201\221"),[v7("\64\64\121\130\251","\235\18\33\23\229\158")]={0 -0 ,15 + 85 },[v7("\121\180\194\169\85\183\196\181\68","\219\48\218\161")]=1 -0 ,[v7("\215\100\122\79\210\87","\128\132\17\28\41\187\47")]=v7("\34\58\7\52\90\4\114\31\53\72\19\114\49\59\81\10\1\22\63\88\5","\61\97\82\102\90"),[v7("\143\59\185\89\194\89\10\63\173\34\190\78","\105\204\78\203\43\167\55\126")]=50 -34 ,[v7("\131\166\34\25","\49\197\202\67\126\115\100\167")]=v7("\0\90\211\34\179\70\91\50\95\252\33\129\88\89\50","\62\87\59\191\73\224\54"),[v7("\196\3\246\197\229\3\249\194","\169\135\98\154")]=function(v34) while game:GetService(v7("\249\98\42\103\248\33\222\194\116\33","\168\171\23\68\52\157\83")).RenderStepped:wait() do game.Players.LocalPlayer.Character.Humanoid.WalkSpeed=v34;end end});local v21=v12:CreateButton({[v7("\218\112\248\168","\231\148\17\149\205\69\77")]=v7("\183\166\203\240\100\239\133\162\195\187\85\230\192\131\194\253\86\234\140\179","\159\224\199\167\155\55"),[v7("\212\242\48\222\245\242\63\217","\178\151\147\92")]=function(v35) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed=352 -(144 + 192) ;end});local v22=v12:CreateSection(v7("\165\243\74\59\28\69\110\149\189\102\39\31\92","\26\236\157\44\82\114\44"));local v23=v12:CreateButton({[v7("\4\47\216\94","\59\74\78\181")]=v7("\12\223\92\83\189\44\197\67\26\153\48\220\74","\211\69\177\58\58"),[v7("\148\228\117\249\235\202\180\238","\171\215\133\25\149\137")]=function() local v37=216 -(42 + 174) ;local v38;while true do if (v37==(440 -(382 + 58))) then v38=0 + 0 ;while true do if (v38==0) then _G.InfiniteJumpEnabled=true;game:GetService(v7("\212\219\55\232\198\62\236\87\245\251\55\232\249\57\255\71","\34\129\168\82\154\143\80\156")).JumpRequest:Connect(function() if _G.InfiniteJumpEnabled then game.Players.LocalPlayer.Character:FindFirstChildOfClass(v7("\173\167\62\10\70\65\128\129","\233\229\210\83\107\40\46")):ChangeState(v7("\235\87\63\198\12\207\69","\101\161\34\82\182"));end end);break;end end break;end end end});local v24=v12:CreateButton({[v7("\198\12\84\251","\78\136\109\57\158\187\130\226")]=v7("\23\49\255\248\48\54\237\232\126\21\236\252\46\127\214\247\56","\145\94\95\153"),[v7("\222\204\24\217\76\182\254\198","\215\157\173\116\181\46")]=function() _G.InfiniteJumpEnabled=false;end});local v25=v12:CreateSection(v7("\19\161\135\254\216\39\189\140\250\206","\186\85\212\235\146"));local v26=v12:CreateButton({[v7("\236\128\27\251","\56\162\225\118\158\89\142")]=v7("\122\16\204\163\32\204\85\2\200\187","\184\60\101\160\207\66"),[v7("\18\131\112\176\51\131\127\183","\220\81\226\28")]=function() game.Lighting.Brightness=2 + 0 ;game.Lighting.ClockTime=12 + 2 ;game.Lighting.FogEnd=42485 + 57515 ;game.Lighting.Ambient=Color3.fromRGB(1682 -(363 + 1141) ,1758 -(1183 + 397) ,541 -363 );local v43=game.Players.LocalPlayer.Character;if (v43 and v43:FindFirstChild(v7("\59\192\143\250\228\200\26\209\176\244\229\211\35\212\144\239","\167\115\181\226\155\138"))) then local v53=0 + 0 ;local v54;while true do if ((2 + 0)==v53) then v54.Color=Color3.fromRGB(2230 -(1913 + 62) ,161 + 94 ,529 -329 );v54.Parent=v43.HumanoidRootPart;break;end if (v53==(1933 -(565 + 1368))) then local v67=0 -0 ;while true do if (v67==(1662 -(1477 + 184))) then v53=684 -(483 + 200) ;break;end if (v67==(0 -0)) then v54=Instance.new(v7("\210\45\238\82\111\93\207\229\42\243","\166\130\66\135\60\27\17"));v54.Name=v7("\103\95\221\97\63\73\102\199\114\56\80","\80\36\42\174\21");v67=1;end end end if (v53==(1 + 0)) then v54.Brightness=5;v54.Range=876 -(564 + 292) ;v53=2 -0 ;end end end end});local v27=v12:CreateButton({[v7("\96\17\58\127","\26\46\112\87")]=v7("\159\54\167\120\189\173\76\179\177\55\235\91\185\185","\212\217\67\203\20\223\223\37"),[v7("\153\140\164\222\184\140\171\217","\178\218\237\200")]=function() game.Lighting.Brightness=2 -1 ;game.Lighting.ClockTime=0;game.Lighting.FogEnd=804 -(244 + 60) ;game.Lighting.Ambient=Color3.fromRGB(0,0 + 0 ,476 -(41 + 435) );local v48=game.Players.LocalPlayer.Character;if (v48 and v48:FindFirstChild(v7("\158\160\235\209\184\186\239\212\132\186\233\196\134\180\244\196","\176\214\213\134"))) then local v55=v48.HumanoidRootPart:FindFirstChild(v7("\215\184\165\192\167\91\117\253\170\190\192","\57\148\205\214\180\200\54"));if v55 then v55:Destroy();end end end});
