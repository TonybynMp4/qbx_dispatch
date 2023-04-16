local automatics = {
    -95776620,
    970310034,
    1159398588,

}

local function VehicleTheft(vehicle)
    local vehdata = GetVehicleData(vehicle)
    local data = {
        tencodeid = "vehicletheft",
        tencode = Config.TenCodes["vehicletheft"].tencode,
        location = GetLocation(GetEntityCoords(vehicle)),
        model = vehdata.name,
        plate = vehdata.plate,
        type = 0,
        color = vehdata.color,
        heading = GetHeading(),
        coords = GetEntityCoords(vehicle),
        title = Lang:t('title.vehicletheft'),
        jobs = { "police", "sheriff" }
    }
    TriggerServerEvent("qbx-dispatch:server:AddCall", data)
end
exports('VehicleTheft', VehicleTheft)

local function CarJacking(vehicle)
    local vehdata = vehicleData(vehicle)
    local data = {
        tencodeid = "carjack",
        tencode = Config.TenCodes["carjack"].tencode,
        location = GetLocation(GetEntityCoords(cache.ped)),
        model = vehdata.name,
        plate = vehdata.plate,
        type = 0,
        color = vehdata.color,
        heading = GetHeading(),
        coords = GetEntityCoords(cache.vehicle),
        title = Lang:t('title.carjack'),
        jobs = {"police", "sheriff"}
    }
    TriggerServerEvent("qbx-dispatch:server:AddCall", data)
end
exports('CarJacking', CarJacking)

local function speedradar(vehicle)
    local vehdata = GetVehicleData(vehicle)
    local data = {
        tencodeid = "speedradar",
        tencode = Config.TenCodes["speedradar"].tencode,
        location = GetLocation(GetEntityCoords(cache.ped)),
        model = vehdata.name,
        plate = vehdata.plate,
        type = 0,
        color = vehdata.color,
        heading = GetHeading(),
        coords = GetEntityCoords(cache.ped),
        title = Config.TenCodes["speedradar"].title,
        jobs = {"police", "sheriff"}
    }
    TriggerServerEvent("qbx-dispatch:server:AddCall", data)
end exports('speedradar', speedradar)

local function DriveBy()
    local vehdata = vehicleData(cache.vehicle)
    local data =  {
        tencodeid = "driveby",
        tencode = Config.TenCodes["driveby"].tencode,
        location = GetLocation(GetEntityCoords(vehicle)),
        model = vehdata.name,
        plate = vehdata.plate,
        gender = GetGender(),
        weapon = GetWeapontypeModel(GetSelectedPedWeapon(cache.ped)) or GetSelectedPedWeapon(cache.ped) or Lang:t('general.unknown'),
        weaponclass = GetWeapontypeGroup(GetSelectedPedWeapon(cache.ped)) or nil,
        automatic = math.random() <= 0.5 and automatics[GetWeapontypeGroup(GetSelectedPedWeapon(cache.ped))] or false,
        doors = vehdata.doors,
        type = 0,
        color = vehdata.color,
        heading = GetHeading(),
        coords = GetEntityCoords(vehicle),
        title = Lang:t('title.driveby'),
        jobs = {"police", "sheriff"}
    }
    TriggerServerEvent("qbx-dispatch:server:AddCall", data)
end
exports('DriveBy', DriveBy)

local function Shooting()
    local data = {
        tencodeid = "shooting",
        tencode = Config.TenCodes["shooting"].tencode,
        location = GetEntityCoords(cache.ped),
        gender = GetGender(),
        weapon = GetWeapontypeModel(GetSelectedPedWeapon(cache.ped)) or GetSelectedPedWeapon(cache.ped) or Lang:t('general.unknown'),
        weaponclass = GetWeapontypeGroup(GetSelectedPedWeapon(cache.ped)) or nil,
        type = 0,
        automatic = math.random() <= 0.5 and automatics[GetWeapontypeGroup(GetSelectedPedWeapon(cache.ped))] or false,
        coords = GetEntityCoords(cache.ped),
        title = Lang:t('dispatch.shooting'),
        jobs = {"police", "sheriff"}
    }
    TriggerServerEvent("qbx-dispatch:server:AddCall", data)
end
exports('Shooting', Shooting)

local function Fight()
    local data = {
        tencodeid = "fight",
        tencode = Config.TenCodes["fight"].tencode,
        firstStreet = locationInfo,
        gender = GetGender(),
        type = 0,
        coords = GetEntityCoords(cache.ped),
        title = Lang:t('title.fight'),
        jobs = {"police", "sheriff"}
    }
    TriggerServerEvent("qbx-dispatch:server:AddCall", data)
end
exports('Fight', Fight)

local function InjuriedPerson()
    local data = {
        tencodeid = "death",
        tencode = Config.TenCodes["death"].tencode,
        location = GetEntityCoords(cache.ped),
        gender = GetGender(),
        type = 2,
        coords = GetEntityCoords(cache.ped),
        title = Lang:t('title.death'),
        jobs = {"ambulance", "ambulancebc"}
    }
    TriggerServerEvent("qbx-dispatch:server:AddCall", data)
end
exports('InjuriedPerson', InjuriedPerson)

local function Code99(servicetype)
    local service
    if servicetype == 'police' then
        service = 'pol99'
    elseif servicetype == 'ambulance' then
        service = 'ems99'
    end
    if not service then return end
    local PlayerData = QBCore.Functions.GetPlayerData()
    local data = {
        tencodeid = service,
        tencode = Config.TenCodes[service].tencode,
        location = GetLocation(GetEntityCoords(cache.ped)),
        name = PlayerData.charinfo.lastname .. " " .. PlayerData.charinfo.firstname,
        callsign = PlayerData.metadata.callsign,
        type = 1,
        coords = GetEntityCoords(cache.ped),
        title = Lang:t('title.'..service),
        jobs = {"police", "sheriff", "ambulance", "ambulancebc"}
    }
    TriggerServerEvent("qbx-dispatch:server:AddCall", data)
end
exports('Code99', Code99)

local function DrugRun(vehicle)
    local vehdata = GetVehicleData(vehicle)
    local data = {
        tencodeid = "DrugRun",
        tencode = Config.TenCodes["DrugRun"].tencode,
        location = GetLocation(GetEntityCoords(cache.ped)),
        gender = GetPedGender(),
        model = vehdata.name,
        plate = vehdata.plate,
        type = 0,
        color = vehdata.color,
        coords = GetEntityCoords(cache.ped),
        title = Config.TenCodes["DrugRun"].title,
        jobs = {"police", "sheriff"}
    }
    TriggerServerEvent("qbx-dispatch:server:AddCall", data)
end exports('DrugRun', DrugRun)

local function CornerSelling()
    local data = {
        tencodeid = "suspicioushandoff",
        tencode = Config.TenCodes["suspicioushandoff"].tencode,
        location = GetLocation(GetEntityCoords(cache.ped)),
        gender = GetGender(),
        type = 0,
        coords = GetEntityCoords(PlayerPedId()),
        title = Lang:t('title.suspicioushandoff'),
        jobs = {"police", "sheriff"}
    }
    TriggerServerEvent("qbx-dispatch:server:AddCall", data)
end
exports('CornerSelling', CornerSelling)

local function StoreRobbery(camId)
    local data = {
        tencodeid = "storerobbery",
        tencode = Config.TenCodes["storerobbery"].tencode,
        location = GetEntityCoords(cache.ped),
        gender = GetGender(),
        camId = camId,
        type = 0,
        coords = GetEntityCoords(cache.ped),
        title = Lang:t('title.storerobbery'),
        jobs = {"police", "sheriff"}
    }
    TriggerServerEvent("qbx-dispatch:server:AddCall", data)
end
exports('StoreRobbery', StoreRobbery)

local function TruckRobbery(coords)
    local data = {
        tencodeid = "TruckRobbery",
        tencode = Config.TenCodes["TruckRobbery"].tencode,
        location = GetLocation(coords),
        gender = GetGender(),
        type = 0,
        coords = coords,
        title = Config.TenCodes["TruckRobbery"].title,
        jobs = {"police", "sheriff"}
    }
    TriggerServerEvent("qbx-dispatch:server:AddCall", data)
end exports('TruckRobbery', TruckRobbery)

local function FleecaBankRobbery(camId)
    local data = {
        tencodeid = "bankrobbery",
        tencode = Config.TenCodes["bankrobbery"].tencode,
        location = GetEntityCoords(cache.ped),
        gender = GetGender(),
        camId = camId,
        type = 0,
        coords = GetEntityCoords(cache.ped),
        title = Lang:t('title.bankrobbery'),
        jobs = {"police", "sheriff"}
    }
    TriggerServerEvent("qbx-dispatch:server:AddCall", data)
end
exports('FleecaBankRobbery', FleecaBankRobbery)

local function PaletoBankRobbery(camId)
    TriggerServerEvent("qbx-dispatch:server:AddCall",{
        tencodeid = "paletobankrobbery",
        tencode = Config.TenCodes["paletobankrobbery"].tencode,
        location = GetEntityCoords(cache.ped),
        gender = GetGender(),
        camId = camId,
        type = 0,
        coords = GetEntityCoords(cache.ped),
        title = Lang:t('title.paletobankrobbery'),
        jobs = {"police", "sheriff"}
    })
end
exports('PaletoBankRobbery', PaletoBankRobbery)

local function PacificBankRobbery(camId)
    local data = {
        tencodeid = "pacificbankrobbery",
        tencode = Config.TenCodes["pacificbankrobbery"].tencode,
        location = GetLocation(GetEntityCoords(cache.ped)),
        gender = GetGender(),
        camId = camId,
        type = 0,
        coords = GetEntityCoords(cache.ped),
        title = Lang:t('title.pacificbankrobbery'),
        jobs = {"police", "sheriff"}
    }
    TriggerServerEvent("qbx-dispatch:server:AddCall", data)
end
exports('PacificBankRobbery', PacificBankRobbery)

local function JewelryRobbery(camId)
    local data = {
        tencodeid = "jewelryrobbery",
        tencode = Config.TenCodes["JewelryRobbery"].tencode,
        location = GetLocation(GetEntityCoords(cache.ped)),
        gender = GetGender(),
        camId = camId,
        type = 0,
        coords = GetEntityCoords(cache.ped),
        title = Lang:t('title.jewelryrobbery'),
        jobs = {"police", "sheriff"}
    }
    TriggerServerEvent("qbx-dispatch:server:AddCall", data)
end
exports('JewelryRobbery', JewelryRobbery)

local function HouseRobbery()
    local data = {
        tencodeid = "houserobbery",
        tencode = Config.TenCodes["houserobbery"].tencode,
        location = GetLocation(GetEntityCoords(cache.ped)),
        gender = GetGender(),
        type = 0,
        coords = GetEntityCoords(cache.ped),
        title = Lang:t('title.houserobbery'),
        jobs = {"police", "sheriff"}
    }
    TriggerServerEvent("qbx-dispatch:server:AddCall", data)
end
exports('HouseRobbery', HouseRobbery)

local function Explosion(coords)
    TriggerServerEvent("qbx-dispatch:server:AddCall",{
        tencodeid = "explosion",
        tencode = Config.TenCodes["explosion"].tencode,
        location = GetLocation(coords),
        type = 0,
        coords = coords,
        title = Config.TenCodes["explosion"].title,
        jobs = {"police", "sheriff", "ambulance", "ambulancebc"}
    })
end
exports('Explosion', Explosion)

local function CarBoosting(vehicle)
    local vehData = GetVehicleData(vehicle)
    if not vehData then return end
    local Data = {
        tencode = Config.TenCodes["carboosting"].tencode,
        tencodeid = "carboosting",
        location = GetLocation(GetEntityCoords(cache.ped)),
        heading = GetHeading(),
        gender = GetGender(),
        model = vehData.name,
        plate = vehData.plate,
        type = 0,
        color = vehData.color,
        coords = GetEntityCoords(cache.ped),
        title = Config.TenCodes["carboosting"].title,
        jobs = {"police", "sheriff"}
    }
    TriggerServerEvent("qbx-dispatch:server:AddCall", Data)
end
exports('CarBoosting', CarBoosting)

-- Defaults to a normal police call
local function CustomCall(data)
    local coords = data.coords or vec3(0.0, 0.0, 0.0)
    local jobs = data.job or { 'police' }

    TriggerServerEvent("qbx-dispatch:server:AddCall", {
        data = {
            tencode = data.tencode or "NONE",
            tencodeid = data.tencodeid or nil,
            location = GetLocation(coords),
            gender = data.gender and GetPedGender() or nil,
            model = data.model or nil,
            plate = data.plate or nil,
            type = data.type or 0,
            color = data.color or nil,
            camId = data.camId or nil,
            callsign = data.callsign or nil,
            name = data.name or nil,
            doors = data.doors or nil,
            heading = data.heading or nil,
            weapon = data.weapon or nil,
            weaponclass = data.weaponclass or nil,
            automatic = data.automatic or false,
            coords = {
                x = coords.x,
                y = coords.y,
                z = coords.z
            },
            title = data.title or "",
            jobs = jobs,
        },
        TenCode = {
            tencode = data.tencode or "NONE",
            description = data.description or "",
            jobs = jobs,
            blip = {
                radius = data.radius or 0,
                sprite = data.sprite or 1,
                color = data.color or 1,
                scale = data.scale or 0.5,
                length = data.length or 2,
                offset = data.offset or "false",
                flash = data.flash or "false"
            },
            sound = {
                name = data.sound.name or "Lose_1st",
                ref = data.sound.ref or "GTAO_FM_Events_Soundset"
    }}})
end
exports('CustomCall', CustomCall)