local tag = "{ffa500}[Onyx Helper]: {ffffff}"

function main()

    while not isSampAvailable() do
        wait(100)

        local ip, port = sampGetCurrentServerAddress()
        if ip ~= '176.32.39.178' then
        sampAddChatMessage('{ffb700}��� �� Onyx-RP, ��� �������� � �� ���� :(', 0xffffff)
        sampAddChatMessage('{ffb700}���� ������ �������� ������ �� Onyx-RP.', 0xffffff)
        thisScript():unload()
        end

        --��� � main(), ����� while not isSampAvailable() do wait(100) end
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
                        sampAddChatMessage((prefix..'���������� ����������. ������� ���������� c '..thisScript().version..' �� '..updateversion), color)
                        wait(250)
                        downloadUrlToFile(updatelink, thisScript().path,
                          function(id3, status1, p13, p23)
                            if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                              print(string.format('��������� %d �� %d.', p13, p23))
                            elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                              print('�������� ���������� ���������.')
                              sampAddChatMessage((prefix..'���������� ���������!'), color)
                              goupdatestatus = true
                              lua_thread.create(function() wait(500) thisScript():reload() end)
                            end
                            if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
                              if goupdatestatus == nil then
                                sampAddChatMessage((prefix..'���������� ������ ��������. �������� ���������� ������..'), color)
                                update = false
                              end
                            end
                          end
                        )
                        end, prefix
                      )
                    else
                      update = false
                      print('v'..thisScript().version..': ���������� �� ���������.')
                    end
                  end
                else
                  print('v'..thisScript().version..': �� ���� ��������� ����������. ��������� ��� ��������� �������������� �� '..url)
                  update = false
                end
              end
            end
          )
          while update ~= false do wait(100) end
        end
    end
    wait(500)
    sampAddChatMessage(tag .. "�������� | ������� ��������� - /onx {00ff00}| ����� - SArMAT {00ff00}| {ffffff}������ ��� �������������.", -1)
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
                sampShowDialog(133665537,'{ffa500}[Onyx Helper]','{ffffff}������� (� ������ ����� ������� ������):\n/opass [ID] - ��������� ��������\n/osl [ID] - ��������� ��������\n/term [ID] - ������� � /sms\n/mir [ID] - ������� ������� (��� ���)','�������','',0)
              end)
                        end
                        if button == 1 and list == 1 then
              lua_thread.create(function()
                sampShowDialog(123237,'{ffa500}[Onyx Helper]','{ffa500}����������� ��� ������� "Onyx-RP"\nIP �������: 176.32.39.178:7777\n������ ������� ������ �� ����������� \n{ff0000}������� ������ - ���� � ������.','�������','',0)
              end)
                        end
                        if button == 1 and list == 2 then
              lua_thread.create(function()
                sampShowDialog(1134237,'{ffa500} �� �������',[[
RP ������� �� Onyx RolePlay:

� {ff0000}�� {ffffff}- ��������/��������� ����� ��� �������.
� {00ff00}�� {ffffff}- ������ ����.
� {ff0000}�� {ffffff}- ��������� ����� �������.
� {ff0000}�� {ffffff}- �������� ������ �� ����� �����������.
� {ff0000}�� {ffffff}- ��������� ����� �� ������.
� {ff0000}�� {ffffff}- ����������� �� ����� ������.
� {00ff00}�� {ffffff}- ��������� ������.
� {00ff00}�� {ffffff}- ������������� ������.
� {ff0000}�� {ffffff}- "Power Gaming" - ����������� �� ���� �����.
� {ff0000}�� {ffffff}- "Meta Gaming" - ������������� ���������� �� ��������� ���� � ������� ���(����������: ��� � IC )
� {ff0000}�� {ffffff}- "God Mood" - ����� ����.
� {00ff00}��  {ffffff}- "Role Play" - ���� �� ����� ��� ������ ������ ��������� ���� ����.
� {ff0000}�� {ffffff}- "���� ���"- ����� ��� � ��������. ]] ,'�������','',4)
              end)
                        end
                        if button == 1 and list == 3 then
              lua_thread.create(function()
                sampShowDialog(111237,'{ffa500} ID ������',[[
{ff0000}�������� ������.
ID 0 - �����.
ID 1 - ������.
ID 2 - ������ ��� ������.
ID 3 - ����������� �������.
ID 4 - ���.
ID 5 - ����������� ����.
ID 6 - ������.
ID 7 - ���.
ID 8 - ������.
ID 9 - ���������.
    �
{ff0000}����������.
ID 16 - �������.
ID 17 - ������������ ��� (�� ��������� �������� � �����).
ID 18 - �������� ��������.
ID 39 - ����� � �������� (�� ��������� �������� � �����).
ID 40 - ��������� � ����� � ��������.

{ff0000}���������.
ID 22 - �������� 9�� (������ � ��� ����).
ID 23 - �������� � ����������.
ID 24 - �������� ����.

{ff0000}���������.
ID 25 - ������� ��������.
ID 26 - ����� (������ � ��� ����).
ID 27 - �������������� ��������.

{ff0000}���������-������� (��).
ID 28 - ��� (������ � ��� ����).
ID 29 - MP5.
ID 32 - ���-9 (������ � ��� ����).
�
{ff0000}��������.
ID 30 - ������� �����������.
ID 31 - �������� M4.

{ff0000}��������.
ID 33 - ��������� �����.
ID 34 - ����������� ��������.

{ff0000}����.
ID 35 - ������ ��������������� ��������� -���.
ID 36 - ��������������� ������ HS (�� ��������� �������� � �����).
ID 37 - �������.
ID 38 - �������.

{ff0000}�������.
ID 10 - ������������� �����.
ID 11 - �����.
ID 12 - ��������.
ID 13 - ���������� ��������.

{ff0000}������.
ID 14 - ����� ������.
ID 15 - ������.
ID 41 - ��������� � �������.
ID 42 - ������������.
ID 43 - �����������.
ID 44 - ������ ������� ������� (�� ��������� �������� � �����).
ID 45 - ���������� (�� ��������� �������� � �����).
ID 46 - �������. ]] ,'�������','',4)
              end)
                        end
                        if button == 1 and list == 4 then
              lua_thread.create(function()
                sampShowDialog(111237,'{0000ff}[O]',[[
{ff0000}� ����� 1. ���������.
1.1. �� ��������� �� ����������� ����, ����������� ������������� 2-�� ������� �������.
1.2. �� ��������� �� ���������� ������������������ �������, ����������� ������������� 3-�� ������� �������.
                �
{ff0000}� ����� 2. ����������� ���������.
2.1. �� ����������� ��������� �� ����������� ����, ����������� ������������� 3-�� ������� �������.
2.2. �� ����������� ��������� �� ���������� ������������������ �������, ����������� ������������� 6-�� ������� �������.
                �
{ff0000}� ����� 3. ���� ������������� ��������.
3.1. �� ���� ������������� ��������, ����������� ������������� 2-�� ������� �������.
3.2. �� ������� ����� ����.�������� ���.����� ����������� ������������� 2-�� ������� �������.
                �
{ff0000}� ����� 4. ������.
4.1. �� ����������� ������ ������������ ����, ����������� ������������� 2 ������� �������.
                �
{ff0000}� ����� 5. ������.
5.1. �� �������, ����������� ������� ���������� ������ ����������� ������������� 2-�� ������� �������.
5.2. �� ����� ���������� ����������� ������������� 2-�� ������� �������.
5.3. �� ������� ���������� ������, ����������� ������������� 2-�� ������� �������.
5.4. �� ������� ������ � �������� ����, ���������� ������������� 1-�� ������� �������.
5.5. �� ������� ������ ��� ��������, ����������� ������������� 2-�� ������� �������.
              �
{ff0000}� ����� 6. ������ � ���������.
6.1. � ������ ������ ���������� � ���������, ����������� ������������� 3-�� ������� �������.
6.2. � ������ ������ ������ ������� � ��������� ����������� ������������� 3-�� ������� �������.
6.3. � ������ ������� ������ � ��������� ������ ���������� ����������� ������������� 2-�� ������� �������.
                �
{ff0000}� ����� 7. ���������.
7.1. �� ���������� �������, ����������� ������������� 6-�� ������� �������.
                �
{ff0000}� ����� 8. ��������� � ������������.
8.1. �� ��������� � ������������, ����������� ������������� 3-�� ������� �������.
                �
{ff0000}� ����� 9. ������������.
9.1. �� ������������ ������������������ �������, ������������� 1-�� ������� �������
9.2. �� ������������ ���.������� �� ����� ������������ �� ������������� 2-�� ������� �������.
                �
{ff0000}� ����� 10. ������������� �� ����������.
10.1. �� ������������� �� ���������, ���� ���������� �������� ������������ ���������� � ����� ����� �������, ���� ����������� ��� � ���� �������������� �����, ����������� ������������� 2-�� ������� �������.
                �
{ff0000}� ����� 11. ������������� ��������.
11.1 �� ������������, ��������, ��������� ���������� ����������� ������������� 3-�� ������� �������.
              �
{ff0000}� ����� 12. �����������.
12.1 �� ����������� ���.�����������, ����������� ������������� 3-�� ������� �������.
12.2 �� ����������� ������ ���������� ��� ��������� ����� 2-�� ������� �������.
        �
{ff0000}� ����� 13. �����������.
13.1. �� ����������� ��� ����� ��������� ����������� ���, ��������������� �����������, ���������� ������������� 2 ������� �������.
�
{ff0000}� ����� 14. ������.
14.1. �� ������ ���������������� ��� �������������� ������������ � ����� �������������� ������ ��������� ��� ������� ���� �������, ����������� ������������� 4-� ������� �������. ]] ,'�������','',4)
              end)
                        end
                        if button == 1 and list == 5 then
              lua_thread.create(function()
                sampShowDialog(111237,'{ffa500} ID �������',[[
1. LSPD
2. FBI
3. ���������
4. ���. �����
5. La Costa Nostra
6. Yakuza
7. �����
8. -
9. -
10. SFPD
11. ���������
12. Ballas Gang
13. Vagos Gang
14. ������� �����
15. Grove Street Gang
16. San News
17. Aztecas Gang
18. Rifa Gang
19. ���� 51
20. -
21. LVPD
22. -
23. Hitmans
24. Street Racers
25. S.W.A.T.
26. ������������� ���������� ]] ,'�������','',4)
              end)
                        end
                        if button == 1 and list == 6 then
              lua_thread.create(function()
                sampShowDialog(123437,'{ffa500}[Onyx Helper]','-�����-','�������','�������','',0)
             end)
                        end
                        if button == 1 and list == 7 then
              lua_thread.create(function()
                sampShowDialog(11234537,'{ffa500}[Onyx Helper]','-�����-','�������','�������','',0)
              end)
                        end
                        if button == 1 and list == 8 then
              lua_thread.create(function()
                sampShowDialog(1532247,'{ffa500}[Onyx Helper]','-�����-','�������','�������','',0)
              end)
                        end
                        if button == 1 and list == 9 then
              lua_thread.create(function()
                sampShowDialog(15437,'{ffa500}[Onyx Helper]','{ffffff}���\t���������\nAngel_Neba\t{ff0000}������� ������\nOsman_Anderson\t{ff0000}������� ������\nJohn_Snow\t{008000}������\nKirill_Karpinskiy\t{008000}������\nSelim_Morrison\t{008000}������','�������','',4)
              end)
                        end
                        if button == 1 and list == 10 then
              lua_thread.create(function()
                sampShowDialog(14337,'{ffa500}[Onyx Helper]','{00ff00}����� ������� - {00ff00}SArMAT  \n{ffffff}t.me/sarmdev \nvk.com/sarmdev','�������','',0)
              end)
                        end
                        if button == 1 and list == 11 then
              lua_thread.create(function()
                sampShowDialog(14337,'{ffa500}[Onyx Helper]','{00ff00}����� ������� - {00ff00}SArMAT  \n{ffffff}t.me/sarmdev \nvk.com/sarmdev','�������','',0)
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
        sampAddChatMessage(tag .. "����� ���� ������: /opass [ID].", -1)
    else

    lua_thread.create(function()
        sampSendChat('/me ������ ����� � �����������')
        wait(1500)
        sampSendChat('/do ����� � ����.')
        wait(1500)
        sampSendChat('/me ������ �������')
        wait(1500)
        sampSendChat('/do ������� � ����.')
        wait(1500)
        sampSendChat('/pass '..id..' ')
        wait(1500)
        sampSendChat('/b ���� �� ����� ����������, �.�. � ������� � �� �������.')
        end)
    end
end

function cmd_term(id)

    if id == "" then
        sampAddChatMessage(tag .. "����� ���� ������: /term [ID].", -1)
    else

    lua_thread.create(function()
        sampSendChat('/sms '..id..' ���')
        wait(7500)
        sampSendChat('/sms '..id..' ������� ���-��?')
        wait(7500)
        sampSendChat('/sms '..id..' ������ ��?')
        wait(7500)
        sampSendChat('/sms '..id..' ���?')
        wait(7500)
        sampSendChat('/sms '..id..' ������� ���?')
        wait(7500)
        sampSendChat('/sms '..id..' � ����� ������.')
        wait(7500)
        sampSendChat('/sms '..id..' �������� :3')
        end)
    end
end

function cmd_mir(id)

    if id == "" then
        sampAddChatMessage(tag .. "����� ���� ������: /mir [ID].", -1)
    else

    lua_thread.create(function()
        sampSendChat('��������� � ��������� "'..id..'" � ������� ��� ���� �����.')
        wait(1500)
        sampSendChat('��, ��� �� �������, ����� ���� ������������ ������ ��� � ����.')
        wait(1500)
        sampSendChat('����� �� ������ ����� �� ��������.')
        wait(1500)
        sampSendChat('���� � ��� ��� ����� �� ��������, ��� ��� ����������� ���.')
        wait(1500)
        sampSendChat('/w ���� �� ������� ���������... ')
        wait(1500)
        sampSendChat('���� �� �� ��������� ���, �� ������ ��������� � �������� ����� ������.')
        wait(1500)
        sampSendChat('��� �� �������?')
        end)
    end
end

function cmd_ssl(id)

    if id == "" then
        sampAddChatMessage(tag .. "����� ���� ������: /osl [ID].", -1)
    else

    lua_thread.create(function()
        sampSendChat('/me ������ ����� � �����������')
        wait(1500)
        sampSendChat('/do ����� � ����.')
        wait(1500)
        sampSendChat('/me ������ ��������')
        wait(1500)
        sampSendChat('/do �������� � ����.')
        wait(1500)
        sampSendChat('/sl '..id..' ')
        wait(1500)
        sampSendChat('/b ���� �� ����� ����������, �.�. � ������� � �� �������.')
        end)
    end
end

function cmd_onx()
    sampShowDialog(1999, "{ffa500}[Onyx Helper]", string.format("{FFFFFF}1. �������.\n2. ����������.\n3. �� �������.\n4. ID ������.\n5. ��������� ������.\n6. ID �������.\n7. -�����.\n8. -�����-.\n9. -�����-.\n10. ���� �������.\n{00ff00}Script by SArMAT."), "�������", "������", 2)
	end

function cmd_inforp()
    sampShowDialog(13223137,'{fff000}You ����������','{ffffff}����� ��� ��� ���-�� �����? � ���, ��� �����','������ ���','',0)
    lua_thread.create(function()
        while sampIsDialogActive() do
            wait(0)
            local __, button, list, input = sampHasDialogRespond(13223137)
            if __ and button == 1 then
                sampAddChatMessage(tag .. "������, ����� ����� :3", -1)
            end
        end
    end)
end
