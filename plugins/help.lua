do
function run(msg, matches)
  return [[ 
  لیست دستورات :) :

صاحب
صاحب گروه
______
لیست مدیران
لیست مدیران معمولی
______
اخراج [ایدی|ریپلای]
کیک کردن اعضا از گروه
______
ایدی
دریافت ایدی گروه
______
اخراجم کن
دستور خروج از گروه
______
تنظیم سازنده [ایدی|ریپلای]
انتخاب صاحب و خریدار گروه
______
ترفیع [ایدی|ریپلای]
مدیر کردن فردی درگروه
 ______
تنزل [ایدی|ریپلای]
از مدیری برداشتن کسی از گروه
______
تنظیم نام [نام]
انتخاب اسم گروه
______
تنظیم عکس
انتخاب عکس گروه
______
تنظیم قوانین [قوانین]
گذاشتن قوانین برای گروه
______
ساخت لینک
ساخت لینک جدید
______
time
دریافت ساعت دقیق به صورت استیکر
______
git [متن]
ساخت گیف جالب 
______
لینک
دریافت لینک گپ
______
قوانین
دریافت قوانین گروه
______
قفل [قفل مورد نظر]
قفل های گروه
______
بازکردن [قفل مورد نظر]
بازکردن قفل تنظیمات گپ
______
تنظیم فلود [مقدار]
تنظیم حساسیت اسپم
______
تنظیمات
دریافت تنظیمات گروه
______
لیست میوت
دریافت لیست میوت
______
میوت یوزر [ریپلای|ایدی]
سایلنت کردن کسی در گروه
______
پاک کردن [قوانین|درباره|ادمین ها|میوت لیست]
پاک کردن برخی امکانات
______
حذف [مقدار|ریپلای]
پاک کردن پیام
______
اطلاعات [ایدی]
دریافت شماره ایدی عضوی
______
*فقط خریدار میتواند در گروه ربات عضو کنه
__________

Sudo: @omid_ash77
Admin: @omid_ash77

@tgspeedbot  👈👈pls join
  ]]
end

return {
  patterns = {
    "^help$"
  },
  run = run 
}
end
