local function run(msg, matches) 
local text = matches[2]
if matches[1] == "Èæ" and is_momod(msg) then 
return text 
else 
return "Don\'t use it baby ğŸ˜" 
end 
end 

return { 
patterns = { 
   "^(Èæ) (.*)$", 
   }, 
    run = run 
  } 
--@Rezamnk Telegram Username