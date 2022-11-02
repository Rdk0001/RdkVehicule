ESX = nil


local openMenu = false

local porteavantgauche = false




local vehicule = RageUI.CreateMenu("Gestion Vehicule", " ")


vehicule.Closed = function()
    openMenu = false
end

function OpenMenuvehicule()
    if not openMenu then
        openMenu = true
        RageUI.Visible(vehicule, true)

        while openMenu do
            Wait(1)

            RageUI.IsVisible(vehicule, function()


                Id = GetPlayerPed(-1)
                vehicle = GetVehiclePedIsIn(Id, false)
                vievehicule = GetVehicleEngineHealth(vehicle) / 10
                local vievehicule = math.floor(vievehicule)
                local label = "~s~%"
                RageUI.Separator("Etat du Vehicule : ~g~" ..vievehicule.. label)


                RageUI.Button("Allumer/Eteindre le ~b~Moteur ", nil, {RightLabel =">>>"}, true,{
                    onSelected = function()
                        Id = GetPlayerPed(-1)
                        vehicle = GetVehiclePedIsIn(Id, false)
                        if GetIsVehicleEngineRunning(vehicle) then
                            SetVehicleEngineOn(vehicle, false, false, true)
                            SetVehicleUndriveable(vehicle, true)
                        elseif not GetIsVehicleEngineRunning(vehicle) then
                            SetVehicleEngineOn(vehicle, true, false, true)
                            SetVehicleUndriveable(vehicle, false)
                        end
                    end
                })

                RageUI.Separator("↓ ~b~Gestion Porte ~s~↓")

                RageUI.Checkbox("Porte Avant Gauche", nil, porteavantgauche, {}, {
                    onChecked = function()
                        print("tests")
                        porteavantgauche = true
                        local Id = PlayerPedId()
                        local vehicle = GetVehiclePedIsIn(Id, false)
                        SetVehicleDoorOpen(vehicle, 0, false, false)
                    end,
                    onUnChecked = function()
                        porteavantgauche = false
                        local Id = GetPlayerPed(-1)
                        local vehicle = GetVehiclePedIsIn(Id, false)
                        SetVehicleDoorShut(vehicle, 0, false, false)
                    end
                })
                RageUI.Checkbox("Porte Avant Droite", nil, porteavantgauche, {}, {
                    onChecked = function()
                        porteavantgauche = true
                        local Id = PlayerPedId()
                        local vehicle = GetVehiclePedIsIn(Id, false)
                        SetVehicleDoorOpen(vehicle, 1, false, false)
                    end,
                    onUnChecked = function()
                        porteavantgauche = false
                        local Id = GetPlayerPed(-1)
                        local vehicle = GetVehiclePedIsIn(Id, false)
                        SetVehicleDoorShut(vehicle, 1, false, false)
                    end
                })
                RageUI.Checkbox("Porte Arriere Gauche", nil, portearrieregauche, {}, {
                    onChecked = function()
                        portearrieregauche = true
                        local Id = PlayerPedId()
                        local vehicle = GetVehiclePedIsIn(Id, false)
                        SetVehicleDoorOpen(vehicle, 2, false, false)
                    end,
                    onUnChecked = function()
                        portearrieregauche = false
                        local Id = GetPlayerPed(-1)
                        local vehicle = GetVehiclePedIsIn(Id, false)
                        SetVehicleDoorShut(vehicle, 2, false, false)
                    end
                })
                RageUI.Checkbox("Porte Arriere Droite", nil, portearrieredroite, {}, {
                    onChecked = function()
                        portearrieredroite = true
                        local Id = PlayerPedId()
                        local vehicle = GetVehiclePedIsIn(Id, false)
                        SetVehicleDoorOpen(vehicle, 3, false, false)
                    end,
                    onUnChecked = function()
                        portearrieredroite = false
                        local Id = GetPlayerPed(-1)
                        local vehicle = GetVehiclePedIsIn(Id, false)
                        SetVehicleDoorShut(vehicle, 3, false, false)
                    end
                })
                RageUI.Checkbox("Capot", nil, capot, {}, {
                    onChecked = function()
                        capot = true
                        local Id = PlayerPedId()
                        local vehicle = GetVehiclePedIsIn(Id, false)
                        SetVehicleDoorOpen(vehicle, 4, false, false)
                    end,
                    onUnChecked = function()
                        capot = false
                        local Id = GetPlayerPed(-1)
                        local vehicle = GetVehiclePedIsIn(Id, false)
                        SetVehicleDoorShut(vehicle, 4, false, false)
                    end
                })
                RageUI.Checkbox("Coffre", nil, coffre, {}, {
                    onChecked = function()
                        coffre = true
                        local Id = PlayerPedId()
                        local vehicle = GetVehiclePedIsIn(Id, false)
                        SetVehicleDoorOpen(vehicle, 5, false, false)
                    end,
                    onUnChecked = function()
                        coffre = false
                        local Id = GetPlayerPed(-1)
                        local vehicle = GetVehiclePedIsIn(Id, false)
                        SetVehicleDoorShut(vehicle, 5, false, false)
                    end
                })




                RageUI.Separator("↓ ~b~Gestion Fenetre ~s~↓")

                RageUI.Checkbox("Fenetre Avant Gauche", nil, fenetreavantgauche, {}, {
                    onChecked = function()
                        fenetreavantgauche = true
                        local Id = PlayerPedId()
                        local vehicle = GetVehiclePedIsIn(Id, false)
                        RollDownWindow(vehicle, 0)
                    end,
                    onUnChecked = function()
                        fenetreavantgauche = false
                        local Id = GetPlayerPed(-1)
                        local vehicle = GetVehiclePedIsIn(Id, false)
                        RollUpWindow(vehicle, 0)
                    end
                })

                RageUI.Checkbox("Fenetre Avant Droite", nil, fenetreavantdroite, {}, {
                    onChecked = function()
                        fenetreavantdroite = true
                        local Id = PlayerPedId()
                        local vehicle = GetVehiclePedIsIn(Id, false)
                        RollDownWindow(vehicle, 1)
                    end,
                    onUnChecked = function()
                        fenetreavantdroite = false
                        local Id = GetPlayerPed(-1)
                        local vehicle = GetVehiclePedIsIn(Id, false)
                        RollUpWindow(vehicle, 1)
                    end
                })
        
            end)
        end
    end
end
            








RegisterCommand('vehicule', function(source, args)
    OpenMenuvehicule()
end)
            

Keys.Register("f1", "RdkVehicule", "Ouvrir le menu vehicule", function()
    OpenMenuvehicule()
end)
            