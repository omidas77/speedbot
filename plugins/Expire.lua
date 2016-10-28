local function is_channel_disabled( receiver )
	if not _config.disabled_channels then
		return false
	end

	if _config.disabled_channels[receiver] == nil then
		return false
	end

  return _config.disabled_channels[receiver]
end

local function enable_channel(receiver)
	if not _config.disabled_channels then
		_config.disabled_channels = {}
	end

	if _config.disabled_channels[receiver] == nil then
		return 'Robot is Online'
	end
	
	_config.disabled_channels[receiver] = false

	save_config()
	return "Robot is Online"
end

local function disable_channel( receiver )
	if not _config.disabled_channels then
		_config.disabled_channels = {}
	end
	
	_config.disabled_channels[receiver] = true

	save_config()
	return "Robot is Offline"
end

local function pre_process(msg)
	local receiver = get_receiver(msg)
	
	-- If sender is moderator then re-enable the channel
	--if is_sudo(msg) then
	if is_momod(msg) then
	  if msg.text == "[!/]bot on" then
	    enable_channel(receiver)
	  end
	end

  if is_channel_disabled(receiver) then
  	msg.text = ""
  end

	return msg
end
-----------------------------------------------
local function pre_process(msg)
  local receiver = get_receiver(msg)
  local timetoexpire = 'unknown'
  local expiretime = redis:hget ('expiretime', get_receiver(msg))
  local now = tonumber(os.time())
  if expiretime then    
    timetoexpire = math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1
    if tonumber("0") > tonumber(timetoexpire) then
    if msg.text:match('/') or msg.text:match('!') then 
      disable_channel(receiver)
    else
      enable_channel(receiver)
    end
end
  if tonumber(timetoexpire) == 0 then
    if redis:hget('expires0',msg.to.id) then return msg end
    disable_channel(receiver)
    send_large_msg(get_receiver(msg), expired)
    redis:hset('expires0',msg.to.id,'5')
  end
  if tonumber(timetoexpire) == 1 then
    if redis:hget('expires1',msg.to.id) then return msg end
    send_large_msg(get_receiver(msg), 'اعتبار گروه شما به اتمام رسید ! \n ربات فردا دیگر در گروه شما کار نخواهد کرد تا گروه شما شارژ شود !')
    redis:hset('expires1',msg.to.id,'5')
  end
  if tonumber(timetoexpire) == 2 then
    if redis:hget('expires2',msg.to.id) then return msg end
    send_large_msg(get_receiver(msg), '2 روز تا پایان تاریخ انقضای گروه باقی مانده است\nنسبت به تمدید اقدام کنید.')
    redis:hset('expires2',msg.to.id,'5')
  end
  if tonumber(timetoexpire) == 3 then
    if redis:hget('expires3',msg.to.id) then return msg end
    send_large_msg(get_receiver(msg), '3 روز تا پایان تاریخ انقضای گروه باقی مانده است\nنسبت به تمدید اقدام کنید.')
    redis:hset('expires3',msg.to.id,'5')
  end
  if tonumber(timetoexpire) == 4 then
    if redis:hget('expires4',msg.to.id) then return msg end
    send_large_msg(get_receiver(msg), '4 روز تا پایان تاریخ انقضای گروه باقی مانده است\nنسبت به تمدید اقدام کنید.')
    redis:hset('expires4',msg.to.id,'5')
  end
  if tonumber(timetoexpire) == 5 then
    if redis:hget('expires5',msg.to.id) then return msg end
    send_large_msg(get_receiver(msg), '5 روز تا پایان تاریخ انقضای گروه باقی مانده است\nنسبت به تمدید اقدام کنید.')
    redis:hset('expires5',msg.to.id,'5')
  end
end
return msg
end
function run(msg, matches)
  if matches[1]:lower() == 'setexpire' then
    if not is_sudo(msg) then return end
    local time = os.time()
    local buytime = tonumber(os.time())
    local timeexpire = tonumber(buytime) + (tonumber(matches[2]) * 86400)
    redis:hset('expiretime',get_receiver(msg),timeexpire)
    return "تاریخ انقضای گروه:\nبه "..matches[2].. " روز دیگر تنظیم شد."
  end
  if matches[1]:lower() == 'setexpireid' then
    if not is_sudo(msg) then return end
    local time = os.time()
    local buytime = tonumber(os.time())
    local chatid = matches[3]
    local timeexpire = tonumber(buytime) + (tonumber(matches[2]) * 86400)
    redis:hset('expiretime',chatid,timeexpire)
    send_large_msg(chatid, 'گروه شما با موفقیت شارژ شد !\nتعداد روز شارژ شده : '..matches[2]..'\n\nخیلی ممنون از انتخاب شما !')
    enable_channel(chatid)
		send_large_msg(get_receiver(msg), 'گروه مورد نظر با موفقیت شارژ شد')
end
  if matches[1]:lower() == 'expire' then
    local expiretime = redis:hget ('expiretime', get_receiver(msg))
    if not expiretime then return 'تاریخ ست نشده است' else
      local now = tonumber(os.time())
      return (math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1) .. " روز دیگر"
    end
end

end
return {
  patterns = {
    "^[!/]([Ss]etexpire) (.*)$",
    "^[!/]([Ss]etexpireid) (.*) (.*)$",
  "^[!/]([Ee]xpire)$",
  },
  run = run,
  pre_process = pre_process
}