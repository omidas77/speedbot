function run(msg, matches)
local help [[Commands list :
⚓️!kick [username|id]
اخراج افراد
⚓️!ban [ username|id]
تحریم افراد از گروه
⚓️!unban [id]
حذف تحریم
⚓️لیست مدیران
مشاهده لیست مدیران
⚓️!note text
ذخیره کردن یک یادداشت
⚓️!mynote
مشاهده یادداشت
⚓️ترفیع [username]
ترفیع یک فرد
⚓️تنزل [username]
تنزل درجه
⚓️!kickme
خروج از گروه
⚓️درباره
توضیحات گروه
⚓️تنظیم عکس
تنظیم عکس گروه
⚓️تنظیم نام [name]
تنظیم نام گروه
⚓️قوانین
قوانین گروه
⚓️ایدی
مشاهده آیدی گروه
⚓️!help
متن راهنما
⚓️قفل [لینک|فلود|اسپم|آر تی ال|استیکر|مخاطب|ورود|خروج]
قفل کردن موارد بالا
⚓️بازکردن [لینک|فلود|اسپم|آر تی ال|استیکر|مخاطب|ورود|خروج]
بازکردن قفل موارد بالا
⚓️میوت [همه|صدا|گیف|عکس|فیلم]
ساکت کردن یکی از موارد(میوت)
⚓️آنمیوت [همه|صدا|گیف|عکس|فیلم]
خروج از سکوت(آنمیوت)
⚓️تنظیم قوانین text
تنظیم قوانین گروه
⚓️تنظیم درباره text
تنظیم توضیحات گروه
⚓️تنظیمات
مشاهده تنظیمات
⚓️لیست میوت ها
لیست چیز های میوت شده
⚓️میوت یوزر [username]
ساکت کردن یک فرد
⚓️لیست میوت
لیست افراد میوت شده
⚓️لینک جدید
لینک جدید
⚓️لینک
لینک گروه
⚓️سازنده
سازنده کیست؟
⚓️تنظیم سازنده [id]
تنظیم سازنده گروه
⚓️تنظیم فلود [value]
تنظیم مقدار فلود
⚓️پاک کردن [لیست مدیران|قوانین|درباره]
پاک کردن کلی موارد بالا
⚓️!banlist
لیست تحریم شدگان
]]
return help
return {
advan = "http://github.com/janlou/AdvanSource",
patterns = {"^راهنما$"},
run = run,
}
