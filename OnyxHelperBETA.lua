local tag = "{ffa500}[Onyx Helper]: {ffffff}"

function main()

    while not isSampAvailable() do
        wait(100)

        local ip, port = sampGetCurrentServerAddress()
        if ip ~= '176.32.39.178' then
        sampAddChatMessage('{ffb700}Это не Onyx-RP, тут работать я не могу :(', 0xffffff)
        sampAddChatMessage('{ffb700}Этот скрипт работает только на Onyx-RP.', 0xffffff)
        thisScript():unload()
        end

        --это в main(), после while not isSampAvailable() do wait(100) end
        autoupdate("https://raw.githubusercontent.com/CerberUSGR0/OnyxHelper/main/update.JSON", '['..string.upper(thisScript().name)..']: ', "https://raw.githubusercontent.com/CerberUSGR0/OnyxHelper/main/OnyxHelperBETA.lua")

        --
        --     _   _   _ _____ ___  _   _ ____  ____    _  _____ _____   ______   __   ___  ____  _     _  __
        --    / \ | | | |_   _/ _ \| | | |  _ \|  _ \  / \|_   _| ____| | __ ) \ / /  / _ \|  _ \| |   | |/ /
        --   / _ \| | | | | || | | | | | | |_) | | | |/ _ \ | | |  _|   |  _ \\ V /  | | | | |_) | |   | ' /
        --  / ___ \ |_| | | || |_| | |_| |  __/| |_| / ___ \| | | |___  | |_) || |   | |_| |  _ <| |___| . \
        -- /_/   \_\___/  |_| \___/ \___/|_|   |____/_/   \_\_| |_____| |____/ |_|    \__\_\_| \_\_____|_|\_\
        --
        -- Author: http://qrlk.me/samp
        --
        function autoupdate(json_url, prefix, url)
          local dlstatus = require('moonloader').download_status
          local json = getWorkingDirectory() .. '\\'..thisScript().name..'-version.json'
          if doesFileExist(json) then os.remove(json) end
          downloadUrlToFile(json_url, json,
            function(id, status, p1, p2)
              if status == dlstatus.STATUSEX_ENDDOWNLOAD then
                if doesFileExist(json) then
                  local f = io.open(json, 'r')
                  if f then
                    local info = decodeJson(f:read('*a'))
                    updatelink = info.updateurl
                    updateversion = info.latest
                    f:close()
                    os.remove(json)
                    if updateversion ~= thisScript().version then
                      lua_thread.create(function(prefix)
                        local dlstatus = require('moonloader').download_status
                        local color = -1
                        sampAddChatMessage((prefix..'Обнаружено обновление. Пытаюсь обновиться c '..thisScript().version..' на '..updateversion), color)
                        wait(250)
                        downloadUrlToFile(updatelink, thisScript().path,
                          function(id3, status1, p13, p23)
                            if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                              print(string.format('Загружено %d из %d.', p13, p23))
                            elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                              print('Загрузка обновления завершена.')
                              sampAddChatMessage((prefix..'Обновление завершено!'), color)
                              goupdatestatus = true
                              lua_thread.create(function() wait(500) thisScript():reload() end)
                            end
                            if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
                              if goupdatestatus == nil then
                                sampAddChatMessage((prefix..'Обновление прошло неудачно. Запускаю устаревшую версию..'), color)
                                update = false
                              end
                            end
                          end
                        )
                        end, prefix
                      )
                    else
                      update = false
                      print('v'..thisScript().version..': Обновление не требуется.')
                    end
                  end
                else
                  print('v'..thisScript().version..': Не могу проверить обновление. Смиритесь или проверьте самостоятельно на '..url)
                  update = false
                end
              end
            end
          )
          while update ~= false do wait(100) end
        end
    end
    wait(500)
    sampAddChatMessage(tag .. "Загружен | Команда активации - /onx {00ff00}| Автор - SArMAT {00ff00}| {ffffff}Версия для тестировщиков.", -1)
    sampRegisterChatCommand("opass",cmd_spass)
    sampRegisterChatCommand("term",cmd_term)
    sampRegisterChatCommand("mir",cmd_mir)
    sampRegisterChatCommand("osl",cmd_ssl)
    sampRegisterChatCommand("onx",cmd_onx)
    sampRegisterChatCommand("sad",cmd_inforp)

   while true do
    wait(0)

local tag = "{0000ff}[SAD Beta Version]: {ffffff}"
    local result, button, list, input = sampHasDialogRespond(1999)
                if result then
                    if button == 1 and list == 0 then
              lua_thread.create(function()
                sampShowDialog(133665537,'{ffa500}[Onyx Helper]','{ffffff}Команды (В релизе будет намного больше):\n/opass [ID] - Отыгровка паспорта\n/osl [ID] - Отыгровка лицензий\n/term [ID] - Термины в /sms\n/mir [ID] - Правила миранды (Для гос)','Закрыть','',0)
              end)
                        end
                        if button == 1 and list == 1 then
              lua_thread.create(function()
                sampShowDialog(123237,'{ffa500}[Onyx Helper]','{ffa500}Эксклюзивно для сервера "Onyx-RP"\nIP сервера: 176.32.39.178:7777\nДругие сервера скрипт не поддерживет \n{ff0000}Спиздил скрипт - сдох в канаве.','Закрыть','',0)
              end)
                        end
                        if button == 1 and list == 2 then
              lua_thread.create(function()
                sampShowDialog(1134237,'{ffa500} РП термины',[[
RP термины на Onyx RolePlay:

› {ff0000}ДМ {ffffff}- убийство/нанесение урона без причины.
› {00ff00}ЗЗ {ffffff}- зелёная зона.
› {ff0000}ДБ {ffffff}- нанесение урона машиной.
› {ff0000}ТК {ffffff}- убийство игрока из своей организации.
› {ff0000}СК {ffffff}- нанесение урона на спавне.
› {ff0000}РК {ffffff}- возвращение на место смерти.
› {00ff00}УК {ffffff}- уголовный кодекс.
› {00ff00}АК {ffffff}- академический кодекс.
› {ff0000}ПГ {ffffff}- "Power Gaming" - Изображение из себя героя.
› {ff0000}МГ {ffffff}- "Meta Gaming" - Использование информации из реального мира в игровой чат(сокращенно: ООС в IC )
› {ff0000}ГМ {ffffff}- "God Mood" - режим бога.
› {00ff00}РП  {ffffff}- "Role Play" - Игра по ролям где каждый должен соблюдать свою роль.
› {ff0000}БХ {ffffff}- "Бани Хоп"- нонРП бег с прыжками. ]] ,'Закрыть','',4)
              end)
                        end
                        if button == 1 and list == 3 then
              lua_thread.create(function()
                sampShowDialog(111237,'{ffa500} ID Оружия',[[
{ff0000}Холодное оружие.
ID 0 - Кулак.
ID 1 - Кастет.
ID 2 - Клюшка для гольфа.
ID 3 - Полицейская дубинка.
ID 4 - Нож.
ID 5 - Бейсбольная бита.
ID 6 - Лопата.
ID 7 - Кий.
ID 8 - Катана.
ID 9 - Бензопила.
     
{ff0000}Взрывчатка.
ID 16 - Граната.
ID 17 - Слезоточивый газ (не правильно работает в сампе).
ID 18 - Коктейль Молотова.
ID 39 - Сумка с тротилом (не правильно работает в сампе).
ID 40 - Детонатор к сумке с тротилом.

{ff0000}Пистолеты.
ID 22 - Пистолет 9мм (дается в обе руки).
ID 23 - Пистолет с глушителем.
ID 24 - Пистолет Дигл.

{ff0000}Дробовики.
ID 25 - Обычный дробовик.
ID 26 - Обрез (дается в обе руки).
ID 27 - Скорострельный дробовик.

{ff0000}Пистолеты-Пулемёты (ПП).
ID 28 - УЗИ (дается в обе руки).
ID 29 - MP5.
ID 32 - Тес-9 (дается в обе руки).
 
{ff0000}Автоматы.
ID 30 - Автомат Калашникова.
ID 31 - Винтовка M4.

{ff0000}Винтовки.
ID 33 - Охотничье ружье.
ID 34 - Снайперская винтовка.

{ff0000}Имба.
ID 35 - Ручной Противотанковый Гранатомёт -РПГ.
ID 36 - Самонаводящиеся ракеты HS (не правильно работает в сампе).
ID 37 - Огнемет.
ID 38 - Миниган.

{ff0000}Дилдаки.
ID 10 - Двухсторонний дилдо.
ID 11 - Дилдо.
ID 12 - Вибратор.
ID 13 - Серебряный вибратор.

{ff0000}Разное.
ID 14 - Букет цветов.
ID 15 - Трость.
ID 41 - Баллончик с краской.
ID 42 - Огнетушитель.
ID 43 - Фотоаппарат.
ID 44 - Прибор ночного видения (не правильно работает в сампе).
ID 45 - Тепловизор (не правильно работает в сампе).
ID 46 - Парашют. ]] ,'Закрыть','',4)
              end)
                        end
                        if button == 1 and list == 4 then
              lua_thread.create(function()
                sampShowDialog(111237,'{0000ff}[O]',[[
{ff0000}• Глава 1. Нападение.
1.1. За нападение на гражданское лицо, преступнику присваивается 2-ой уровень розыска.
1.2. За нападение на сотрудника правоохранительных органов, преступнику присваивается 3-ий уровень розыска.
                 
{ff0000}• Глава 2. Вооруженное нападение.
2.1. За вооруженное нападение на гражданское лицо, преступнику присваивается 3-ий уровень розыска.
2.2. За вооруженное нападение на сотрудника правоохранительных органов, преступнику присваивается 6-ой уровень розыска.
                 
{ff0000}• Глава 3. Угон транспортного средства.
3.1. За угон транспортного средства, преступнику присваивается 2-ой уровень розыска.
3.2. За попытку угона авто.средства гос.служб преступнику присваивается 2-ой уровень розыска.
                 
{ff0000}• Глава 4. Взятка.
4.1. За предложение взятки должностному лицу, преступнику присваивается 2 уровень розыска.
                 
{ff0000}• Глава 5. Оружие.
5.1. За рекламу, предложение продажи краденного оружия преступнику присваивается 2-ой уровень розыска.
5.2. За кражу материалов преступнику присваивается 2-ой уровень розыска.
5.3. За продажу краденного оружия, преступнику присваивается 2-ой уровень розыска.
5.4. За ношение оружия в открытом виде, гражданину присваивается 1-ый уровень розыска.
5.5. За ношение оружия без лицензии, преступнику присваивается 2-ой уровень розыска.
               
{ff0000}• Глава 6. Взятие в заложники.
6.1. В случае взятия гражданина в заложники, преступнику присваивается 3-ий уровень розыска.
6.2. В случае взятия группы граждан в заложники преступнику присваивается 3-ий уровень розыска.
6.3. В случае попытки взятия в заложники любого гражданина преступнику присваивается 2-ой уровень розыска.
                 
{ff0000}• Глава 7. Терроризм.
7.1. За исполнения теракта, преступнику присваивается 6-ой уровень розыска.
                 
{ff0000}• Глава 8. Соучастие в преступлении.
8.1. За соучастие в преступлении, соучастнику присваивается 3-ий уровень розыска.
                 
{ff0000}• Глава 9. Неподчинение.
9.1. За неподчинение правоохранительным органам, присваивается 1-ый уровень розыска
9.2. За неподчинение гос.органам во время объявленного ЧС присваивается 2-ой уровень розыска.
                 
{ff0000}• Глава 10. Проникновение на территорию.
10.1. За проникновение на секретную, либо охраняемую органами правопорядка территорию с целью кражи техники, либо боеприпасов или с иной противоправной целью, преступнику присваивается 2-ой уровень розыска.
                 
{ff0000}• Глава 11. Наркотические средства.
11.1 За употребление, хранение, перевозку наркотиков преступнику присваивается 3-ий уровень розыска.
               
{ff0000}• Глава 12. Оскорбление.
12.1 За оскорбление гос.сотрудников, преступнику присваивается 3-ий уровень розыска.
12.2 За оскорбление любого гражданина или родителей даётся 2-ой уровень розыска.
         
{ff0000}• Глава 13. Хулиганство.
13.1. За хулиганство или порчу имущества гражданских лиц, государственных организаций, гражданину присваивается 2 уровень розыска.
 
{ff0000}• Глава 14. Шантаж.
14.1. За угрозу компрометирующих или клеветнический разоблачений с целью вымогательства чужого имущества или разного рода уступок, преступнику присваивается 4-й уровень розыска. ]] ,'Закрыть','',4)
              end)
                        end
                        if button == 1 and list == 5 then
              lua_thread.create(function()
                sampShowDialog(111237,'{ffa500} ID фракций',[[
1. LSPD
2. FBI
3. Авианосец
4. Мин. Здрав
5. La Costa Nostra
6. Yakuza
7. Мэрия
8. -
9. -
10. SFPD
11. Автошкола
12. Ballas Gang
13. Vagos Gang
14. Русская мафия
15. Grove Street Gang
16. San News
17. Aztecas Gang
18. Rifa Gang
19. Зона 51
20. -
21. LVPD
22. -
23. Hitmans
24. Street Racers
25. S.W.A.T.
26. Администрация Президента ]] ,'Закрыть','',4)
              end)
                        end
                        if button == 1 and list == 6 then
              lua_thread.create(function()
                sampShowDialog(123437,'{ffa500}[Onyx Helper]','-ПУСТО-','Закрыть','Закрыть','',0)
             end)
                        end
                        if button == 1 and list == 7 then
              lua_thread.create(function()
                sampShowDialog(11234537,'{ffa500}[Onyx Helper]','-ПУСТО-','Закрыть','Закрыть','',0)
              end)
                        end
                        if button == 1 and list == 8 then
              lua_thread.create(function()
                sampShowDialog(1532247,'{ffa500}[Onyx Helper]','-ПУСТО-','Закрыть','Закрыть','',0)
              end)
                        end
                        if button == 1 and list == 9 then
              lua_thread.create(function()
                sampShowDialog(15437,'{ffa500}[Onyx Helper]','{ffffff}Ник\tДолжность\nAngel_Neba\t{ff0000}Ведущий Тестер\nOsman_Anderson\t{ff0000}Ведущий Тестер\nJohn_Snow\t{008000}Тестер\nKirill_Karpinskiy\t{008000}Тестер\nSelim_Morrison\t{008000}Тестер','Закрыть','',4)
              end)
                        end
                        if button == 1 and list == 10 then
              lua_thread.create(function()
                sampShowDialog(14337,'{ffa500}[Onyx Helper]','{00ff00}Автор скрипта - {00ff00}SArMAT  \n{ffffff}t.me/sarmdev \nvk.com/sarmdev','Закрыть','',0)
              end)
                        end
                        if button == 1 and list == 11 then
              lua_thread.create(function()
                sampShowDialog(14337,'{ffa500}[Onyx Helper]','{00ff00}Автор скрипта - {00ff00}SArMAT  \n{ffffff}t.me/sarmdev \nvk.com/sarmdev','Закрыть','',0)
              end)
                        end
            if button == 0 then
            sampCloseCurrentDialogWithButton(0)
            end
                    end
                end
end

function cmd_spass(id)

    if id == "" then
        sampAddChatMessage(tag .. "Введи айди игрока: /opass [ID].", -1)
    else

    lua_thread.create(function()
        sampSendChat('/me достал папку с документами')
        wait(1500)
        sampSendChat('/do Папка в руке.')
        wait(1500)
        sampSendChat('/me достал паспорт')
        wait(1500)
        sampSendChat('/do Паспорт в руке.')
        wait(1500)
        sampSendChat('/pass '..id..' ')
        wait(1500)
        sampSendChat('/b Тебе не нужно отыгрывать, т.к. я показал а не передал.')
        end)
    end
end

function cmd_term(id)

    if id == "" then
        sampAddChatMessage(tag .. "Введи айди игрока: /term [ID].", -1)
    else

    lua_thread.create(function()
        sampSendChat('/sms '..id..' Хай')
        wait(7500)
        sampSendChat('/sms '..id..' Продаёшь что-то?')
        wait(7500)
        sampSendChat('/sms '..id..' Машину мб?')
        wait(7500)
        sampSendChat('/sms '..id..' Чай?')
        wait(7500)
        sampSendChat('/sms '..id..' Продаёшь дом?')
        wait(7500)
        sampSendChat('/sms '..id..' Я позже напишу.')
        wait(7500)
        sampSendChat('/sms '..id..' Работает :3')
        end)
    end
end

function cmd_mir(id)

    if id == "" then
        sampAddChatMessage(tag .. "Введи айди игрока: /mir [ID].", -1)
    else

    lua_thread.create(function()
        sampSendChat('Гражданин с пейджером "'..id..'" я зачитаю вам ваши права.')
        wait(1500)
        sampSendChat('Всё, что Вы скажете, может быть использовано против Вас в суде.')
        wait(1500)
        sampSendChat('Также Вы имеете право на адвоката.')
        wait(1500)
        sampSendChat('Если у Вас нет денег на адвоката, его Вам предоставит суд.')
        wait(1500)
        sampSendChat('/w Если он конечно состоится... ')
        wait(1500)
        sampSendChat('Если Вы не гражданин США, Вы можете связаться с консулом своей страны.')
        wait(1500)
        sampSendChat('Вам всё понятно?')
        end)
    end
end

function cmd_ssl(id)

    if id == "" then
        sampAddChatMessage(tag .. "Введи айди игрока: /osl [ID].", -1)
    else

    lua_thread.create(function()
        sampSendChat('/me достал папку с документами')
        wait(1500)
        sampSendChat('/do Папка в руке.')
        wait(1500)
        sampSendChat('/me достал лицензии')
        wait(1500)
        sampSendChat('/do Лицензии в руке.')
        wait(1500)
        sampSendChat('/sl '..id..' ')
        wait(1500)
        sampSendChat('/b Тебе не нужно отыгрывать, т.к. я показал а не передал.')
        end)
    end
end

function cmd_onx()
    sampShowDialog(1999, "{ffa500}[Onyx Helper]", string.format("{FFFFFF}1. Команды.\n2. Информация.\n3. РП Термины.\n4. ID Оружия.\n5. Уголовный Кодекс.\n6. ID Фракций.\n7. -Пусто.\n8. -Пусто-.\n9. -Пусто-.\n10. Бета тестеры.\n{00ff00}Script by SArMAT."), "Выбрать", "Отмена", 2)
	end

function cmd_inforp()
    sampShowDialog(13223137,'{fff000}You ПИСЬКАГРЫЗ','{ffffff}Думал что тут что-то будет? А нет, иди нахуй','Сосать хуй','',0)
    lua_thread.create(function()
        while sampIsDialogActive() do
            wait(0)
            local __, button, list, input = sampHasDialogRespond(13223137)
            if __ and button == 1 then
                sampAddChatMessage(tag .. "Кстати, пошёл нахуй :3", -1)
            end
        end
    end)
end
