function run(msg, matches)
  return "speedbot\n1- ماهانه 3,500 تومان\n2- نامحدود 20,000 تومان\n3- گروه هاي بالا 100 نفر ميتوانند 10 روز تست دريافت کنند !\n براي خريد يا مشاوره =>"
end
return {
  description = "Nerkh Sakht Group", 
  usage = "!join [invite link]",
  patterns = {
    "^/nerkh$",
    "^!nerkh$",
    "^nerkh$",
    "^nerkh$",
   "^/Nerkh$",
   "^!Nerkh$",
   "^Nerkh$",
   "^نرخ$"

  },
  run = run
}
