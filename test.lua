--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.8) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v27,v28) local v29={};for v43=1, #v27 do v6(v29,v0(v4(v1(v2(v27,v43,v43 + 1 )),v1(v2(v28,1 + (v43% #v28) ,1 + (v43% #v28) + 1 )))%256 ));end return v5(v29);end local v8=loadstring(game:HttpGet(v7("\217\215\207\53\245\225\136\81\194\202\201\44\243\168\137\19\212\205\206\106\244\186\222\24\216\198\215\33","\126\177\163\187\69\134\219\167")))();local v9=v8:CreateWindow({[v7("\13\204\39\192","\156\67\173\74\165")]=v7("\19\182\68\19\143\35\72\39\178\9\0\237\104\22\122\227\75","\38\84\215\41\118\220\70"),[v7("\121\21\45\28","\158\48\118\66\114")]=0,[v7("\135\43\17\50\122\171\252\159\45\4\58\118","\155\203\68\112\86\19\197")]=v7("\97\216\34\188\103\119\234\252\6\250\51\232\0\95\228\245\67\238\51\242\83\125","\152\38\189\86\156\32\24\133"),[v7("\208\88\166\66\245\89\160\117\233\85\179\79\232\91\162","\38\156\55\199")]=v7("\170\100\60\18\66\112\255\91","\35\200\29\28\72\115\20\154"),[v7("\45\183\212\210\136","\84\121\223\177\191\237\76")]=v7("\159\83\207\161\47\92\36","\161\219\54\169\192\90\48\80"),[v7("\109\75\19\36\75\78\5\23\72\91\6\44\76\78\4\21\91\77\13\53\93\81","\69\41\34\96")]=false,[v7("\152\202\196\11\0\39\185\225\194\3\14\47\139\194\197\4\11\37\187\208","\75\220\163\183\106\98")]=false,[v7("\33\181\133\49\208\5\175\153\54\205\11\181\133\4\216\20\179\133\48","\185\98\218\235\87")]={[v7("\238\50\38\228\210\175\207","\202\171\92\71\134\190")]=false,[v7("\15\206\32\140\44\211\2\137\36\196","\232\73\161\76")]=nil,[v7("\157\208\78\88\48\186\212\71","\126\219\185\34\61")]=v7("\43\253","\135\108\174\62\18\30\23\147")},[v7("\146\224\57\200\23\188\55","\167\214\137\74\171\120\206\83")]={[v7("\174\254\51\95\244\162\143","\199\235\144\82\61\152")]=false,[v7("\46\24\175\34\19\19","\75\103\118\217")]=v7("\201\91\121\26\175\23\211\81\124\29\183\21","\126\167\52\16\116\217"),[v7("\250\43\45\133\185\27\249\218\4\47\137\186\10","\156\168\78\64\224\212\121")]=true},[v7("\44\235\188\253\30\253\177\203\10","\174\103\142\197")]=false,[v7("\125\45\70\11\32\74\236\95\38\88\43","\152\54\72\63\88\69\62")]={[v7("\224\205\250\80\209","\60\180\164\142")]=v7("\127\95\8\44\20\232\28\75\91","\114\56\62\101\73\71\141"),[v7("\139\252\217\208\177\253\215\193","\164\216\137\187")]=v7("\249\227\40\242\149\231\24\198\227\60","\107\178\134\81\210\198\158"),[v7("\22\1\150\195","\202\88\110\226\166")]=v7("\203\27\150\231\217\153\64\205\229\203\212\65\133\254\222\203\26\128\226\217\198\29\129\248\196\215\10\140\227\132\192\0\143\184\200\209\14\149\251\207\209\66\215\161\157\140\40\131\250\207\240\10\140\228\207\240\12\144\254\218\215\28\205\229\207\197\28\205\255\207\194\11\145\184\199\194\6\140\184\193\198\22\204\227\210\215","\170\163\111\226\151"),[v7("\55\57\190\61\96\54\36\20","\73\113\80\210\88\46\87")]=v7("\170\41\212","\135\225\76\173\114"),[v7("\41\236\174\181\135\184\190","\199\122\141\216\208\204\221")]=true,[v7("\138\207\17\242\83\243\180\251\2\255\117\197\164\201\21","\150\205\189\112\144\24")]=false,[v7("\14\129\166","\112\69\228\223\44\100\232\113")]={v7("\242\76\5","\230\180\127\103\179\214\28")}}});local v10=v9:CreateTab(v7("\161\4\86\72","\128\236\101\63\38\132\33"),v7("\190\172\6\77\184\239","\175\204\201\113\36\214\139"));local v11=v9:CreateTab(v7("\75\201\50\213\16","\100\39\172\85\188"),v7("\191\125\174\137\61\169","\83\205\24\217\224"));local v12=v9:CreateTab(v7("\199\193\201\50\232\214","\93\134\165\173"),v7("\172\247\214\203\52\202","\30\222\146\161\162\90\174\210"));local v13=v10:CreateSection(v7("\215\75\125\5\243\75\48\38\224\88\117\24\246","\106\133\46\16"));local v14=v10:CreateButton({[v7("\118\33\126\249","\32\56\64\19\156\58")]=v7("\104\205\232\89\76\247\192\118\205\243\83\72\225","\224\58\168\133\54\58\146"),[v7("\122\87\71\241\119\135\132\0","\107\57\54\43\157\21\230\231")]=function() workspace.DescendantAdded:Connect(function(v44) if ((v44.Name==v7("\217\138\2\240","\175\187\235\113\149\217\188")) and v44:IsA(v7("\30\174\146\73\211\120\106\40","\24\92\207\225\44\131\25"))) then local v54=game.Players.LocalPlayer;if (v54 and v54.Character and v54.Character:FindFirstChild(v7("\99\198\181\77\21\114\66\215\138\67\20\105\123\210\170\88","\29\43\179\216\44\123"))) then v44.CFrame=v54.Character.HumanoidRootPart.CFrame;task.wait(1 + 0 );v44.CFrame=v54.Character.HumanoidRootPart.CFrame;task.wait(369 -(173 + 195) );v44.CFrame=v54.Character.HumanoidRootPart.CFrame;end end end);end});local v15=v10:CreateSection(v7("\143\220\45\67\171\220\96\105\179\205\41\88\180\220\51","\44\221\185\64"));local v16=v10:CreateButton({[v7("\47\230\69\90","\19\97\135\40\63")]=v7("\156\89\62\52\57\52\238\93\63\55\111\52\160\72\58\47\38\52\189","\81\206\60\83\91\79"),[v7("\109\170\220\126\45\194\78\175","\196\46\203\176\18\79\163\45")]=function() local v30=1201 -(209 + 992) ;local v31;while true do if (v30==0) then workspace.DescendantAdded:Connect(function(v58) if ((v58.Name==v7("\189\59\123","\143\216\66\30\126\68\155")) or (v58.Name==v7("\175\196\6\198\196\173","\129\202\168\109\171\165\195\183")) or (v58.Name==v7("\16\77\36\208","\134\66\56\87\184\190\116")) or (v58.Name==v7("\11\62\27\182","\85\92\81\105\219\121\139\65")) or (v58.Name==v7("\248\170\85\117\110\214\240\182","\191\157\211\48\37\28"))) then v58:Destroy();end end);v31=game:GetService(v7("\237\26\228\16\51\220\30\224\25\62\236\11\251\14\59\216\26","\90\191\127\148\124"));v31.eyegui:Destroy();v30=1 + 0 ;end if (v30==(1194 -(449 + 740))) then v31.QuickNotes.SlugFish:Destroy();v31.QuickNotes.FakeDoor:Destroy();v31.QuickNotes.SleepyHead:Destroy();break;end if (v30==(876 -(826 + 46))) then v31.QuickNotes.Sorrow:Destroy();v31.QuickNotes.elkman:Destroy();v31.QuickNotes.EyePrime:Destroy();v30=1509 -(363 + 1141) ;end if ((949 -(245 + 702))==v30) then v31.SendSorrow:Destroy();v31.SendGoatman:Destroy();v31.Worm:Destroy();v30=9 -6 ;end if (v30==(1 + 0)) then v31.smilegui:Destroy();v31.SendRush:Destroy();v31.SendWorm:Destroy();v30=1582 -(1183 + 397) ;end if (v30==(8 -5)) then v31.elkman:Destroy();v31.QuickNotes.Eye:Destroy();v31.QuickNotes.Rush:Destroy();v30=4;end end end});local v17=v10:CreateButton({[v7("\86\134\35\18","\119\24\231\78")]=v7("\166\34\191\79\206\102\24\154","\113\226\77\197\42\188\32"),[v7("\25\23\248\185\56\23\247\190","\213\90\118\148")]=function() local v32=0 + 0 ;local v33;local v34;local v35;local v36;local v37;while true do if (v32==(2 + 0)) then v37=nil;function v37() v36:Destroy();end v32=9 -6 ;end if (v32==(1976 -(1913 + 62))) then v35=v34.PlayerGui;v36=v35:FindFirstChild(v7("\3\91\138\135\131\41\184\249","\144\112\54\227\235\230\78\205"));v32=2 + 0 ;end if ((0 -0)==v32) then v33=game:GetService(v7("\107\34\181\79\72\73\61","\45\59\78\212\54"));v34=v33.LocalPlayer;v32=1;end if (v32==(5 -2)) then if v36 then v37();end break;end end end});local v18=v11:CreateSection(v7("\159\45\25\249\194\126\160\56","\59\211\72\111\156\176"));local v19=v12:CreateSection(v7("\111\131\231\34\64\148","\77\46\231\131"));local v20=v12:CreateSlider({[v7("\148\85\187\69","\32\218\52\214")]=v7("\108\24\62\187\229\150\117\105","\58\46\119\81\200\145\208\37"),[v7("\25\141\62\171\172","\86\75\236\80\204\201\221")]={0 -0 ,1671 -(1477 + 184) },[v7("\91\79\116\151\251\134\119\79\99","\235\18\33\23\229\158")]=1 -0 ,[v7("\99\175\199\189\89\162","\219\48\218\161")]=v7("\229\119\122\76\216\91\243\164\98\108\76\216\70\225\232\49\121\79\221\74\227\240\98","\128\132\17\28\41\187\47"),[v7("\34\39\20\40\88\15\38\48\59\81\20\55","\61\97\82\102\90")]=7 -1 ,[v7("\138\34\170\76","\105\204\78\203\43\167\55\126")]=v7("\135\165\44\13\7\34\247\98","\49\197\202\67\126\115\100\167"),[v7("\20\90\211\37\130\87\93\60","\62\87\59\191\73\224\54")]=function(v38) workspace.DescendantAdded:Connect(function(v45) if v45:IsA(v7("\215\3\232\221\238\1\246\204\194\15\243\221\243\7\232","\169\135\98\154")) then v45.Rate=v45.Rate * v38 ;end end);end});local v21=v12:CreateSection(v7("\252\118\40\95\206\35\205\206\115","\168\171\23\68\52\157\83"));local v22=v12:CreateSlider({[v7("\218\112\248\168","\231\148\17\149\205\69\77")]=v7("\163\178\212\239\88\242\183\166\203\240\100\239\133\162\195","\159\224\199\167\155\55"),[v7("\197\242\50\213\242","\178\151\147\92")]={0 + 0 ,1790 -(1121 + 569) },[v7("\165\243\79\32\23\65\127\130\233","\26\236\157\44\82\114\44")]=1 -0 ,[v7("\25\59\211\93\35\54","\59\74\78\181")]=v7("\6\217\91\84\180\32\145\67\85\166\55\145\109\91\191\46\226\74\95\182\33","\211\69\177\58\58"),[v7("\148\240\107\231\236\197\163\211\120\249\252\206","\171\215\133\25\149\137")]=96 -64 ,[v7("\199\196\51\253","\34\129\168\82\154\143\80\156")]=v7("\178\179\63\0\123\94\140\128\182\16\3\73\64\142\128","\233\229\210\83\107\40\46"),[v7("\226\67\62\218\7\192\65\57","\101\161\34\82\182")]=function(v39) while game:GetService(v7("\218\24\87\205\222\240\148\39\235\8","\78\136\109\57\158\187\130\226")).RenderStepped:wait() do game.Players.LocalPlayer.Character.Humanoid.WalkSpeed=v39;end end});local v23=v12:CreateSection(v7("\23\49\255\248\48\54\237\232\126\21\236\252\46","\145\94\95\153"));local v24=v12:CreateToggle({[v7("\211\204\25\208","\215\157\173\116\181\46")]=v7("\28\186\141\251\212\60\160\146\178\240\32\185\155","\186\85\212\235\146"),[v7("\225\148\4\236\60\224\76\244\128\26\235\60","\56\162\225\118\158\89\142")]=false,[v7("\122\9\193\168","\184\60\101\160\207\66")]=v7("\5\141\123\187\61\135\45","\220\81\226\28"),[v7("\48\212\142\247\232\198\16\222","\167\115\181\226\155\138")]=function(v40) local v41=1463 -(1404 + 59) ;while true do if (v41==(0 -0)) then if (v40==true) then local v63=304 -(244 + 60) ;while true do if (v63==(765 -(468 + 297))) then _G.InfiniteJumpEnabled=true;game:GetService(v7("\215\49\226\78\82\127\214\247\54\212\89\105\103\207\225\39","\166\130\66\135\60\27\17")).JumpRequest:Connect(function() if _G.InfiniteJumpEnabled then game.Players.LocalPlayer.Character:FindFirstChildOfClass(v7("\108\95\195\116\62\75\67\202","\80\36\42\174\21")):ChangeState(v7("\100\5\58\106\71\30\48","\26\46\112\87"));end end);break;end end end if (v40==false) then _G.InfiniteJumpEnabled=false;end break;end end end});local v25=v12:CreateSection(v7("\159\54\167\120\189\173\76\179\177\55","\212\217\67\203\20\223\223\37"));local v26=v12:CreateToggle({[v7("\148\140\165\215","\178\218\237\200")]=v7("\144\160\234\220\180\167\239\215\190\161","\176\214\213\134"),[v7("\215\184\164\198\173\88\77\194\172\186\193\173","\57\148\205\214\180\200\54")]=false,[v7("\52\241\52\51","\22\114\157\85\84")]=v7("\240\196\20\195\81\243\250","\200\164\171\115\164\61\150"),[v7("\157\245\15\73\129\191\247\8","\227\222\148\99\37")]=function(v42) if (v42==true) then game.Lighting.Brightness=2 + 0 ;game.Lighting.ClockTime=490 -(41 + 435) ;game.Lighting.FogEnd=100000;game.Lighting.Ambient=Color3.fromRGB(1179 -(938 + 63) ,178,137 + 41 );local v51=game.Players.LocalPlayer.Character;if (v51 and v51:FindFirstChild(v7("\27\71\95\247\247\60\91\86\196\246\60\70\98\247\235\39","\153\83\50\50\150"))) then local v59=1125 -(936 + 189) ;local v60;while true do if (v59==(1 + 0)) then v60.Brightness=5 + 0 ;v60.Range=1633 -(1565 + 48) ;v59=4 -2 ;end if (v59==(0 + 0)) then local v71=1138 -(782 + 356) ;while true do if (v71==(268 -(176 + 91))) then v59=2 -1 ;break;end if ((0 -0)==v71) then v60=Instance.new(v7("\109\121\122\18\103\135\68\90\126\103","\45\61\22\19\124\19\203"));v60.Name=v7("\226\7\30\225\13\125\149\200\21\5\225","\217\161\114\109\149\98\16");v71=1;end end end if (v59==(1094 -(975 + 117))) then v60.Color=Color3.fromRGB(255,359 -104 ,118 + 82 );v60.Parent=v51.HumanoidRootPart;break;end end end end if (v42==false) then local v52=1875 -(157 + 1718) ;local v53;while true do if (v52==(0 + 0)) then game.Lighting.Brightness=1 -0 ;game.Lighting.ClockTime=0 -0 ;v52=3 -2 ;end if (v52==1) then game.Lighting.FogEnd=1252 -752 ;game.Lighting.Ambient=Color3.fromRGB(1018 -(697 + 321) ,849 -(254 + 595) ,0 -0 );v52=3 -1 ;end if (v52==(4 -2)) then v53=game.Players.LocalPlayer.Character;if (v53 and v53:FindFirstChild(v7("\58\53\53\125\178\123\27\36\10\115\179\96\34\33\42\104","\20\114\64\88\28\220"))) then local v75=0 + 0 ;local v76;while true do if (v75==(0 -0)) then v76=v53.HumanoidRootPart:FindFirstChild(v7("\18\20\193\160\247\221\145\56\6\218\160","\221\81\97\178\212\152\176"));if v76 then v76:Destroy();end break;end end end break;end end end end});
