do function run(msg, matches)
  if matches[1]:lower() == 'salam' then
  return "Salam"
  end
  if matches[1]:lower() == 'khobi' then
  return "Mersi to khobi?"
  end
  if matches[1]:lower() == 'سلام' then
  return "سلام"
 end
  if matches[1]:lower() == 'خوبی' then
  return "مرسی تو خوبی؟"
  end
  if matches[1]:lower() == 'خوبم' then
  return "خوشحالم که خوبی"
  end
  if matches[1]:lower() == 'ممنون' then
  return "خواهش میکنم"
  end
  if matches[1]:lower() == 'چه خبر' then
  return "سلامتی"
  end
  if matches[1]:lower() == 'اسمت چیه' then
  return "اسم من تیماسه اسم تو چیه؟"
  end
  if matches[1]:lower() == 'گروه' then
  return "هر گروه قیمتش 2 تومنه"
  end
  if matches[1]:lower() == 'مهرپویا' then
  return "خر است😁"
end
if matches[1]:lower() == 'هه' then
  return "کیره خر"
  end
if matches[1]:lower() == 'bk' then
  return "Be Kiram ke be Kiret"
end
if matches[1]:lower() == 'کیر' then
  return "تو کونت😐"
end
if matches[1]:lower() == 'kir' then
  return "تو کونت😐"
end
if matches[1]:lower() == 'چطورید' then
  return "مرسی تو چطوری؟"
end
if matches[1]:lower() == 'چطوری' then
  return "مرسی تو چطوری؟"
end
  if matches[1]:lower() == 'رضا' then
  return "خر است😁"
end
if matches[1]:lower() == 'gp' then
  return "گروه قیمتش 2 تومنه"
 end
  if matches[1]:lower() == 'چت نکنید' then
  return "چت نکنید دیگه چقد زر میزنید 😡"
 end
 if matches[1]:lower() == 'چت ممنوع' then
  return "آقا چت ممنوعه ساکت باشید!"
 end
 if matches[1]:lower() == 'کس نگو' then
  return " راست میگه دیگه کس نگو 😒"
 end
 if matches[1]:lower() == 'کس نگید' then
  return "کس نگید دیگه 😡"
 end
 if matches[1]:lower() == 'مهدیه' then
  return "عشقمه 💋"
 end
  if matches[1]:lower() == 'ban' then
  return "برو دیگه برنگردی 😂"
 end
 if matches[1]:lower() == 'gb' then
  return "اوه به فاک رفت 🙄"
 end
end
  return {
  patterns = {
    "^([Ss][Aa][Ll][Aa][Mm])$",
    "^([Kk][Hh][Oo][Bb][Ii])?$",
    "^(سلام)$",
    "^(شلام)$",
    "^(خوبی)$",
    "^(خوبی؟)$",
    "^(خوبم)$",
    "^(ممنون)$",
    "^(چه خبر)$",
    "^(اسمت چیه)$",
    "^(اسمت چیه؟)$",
    "^(گروه)$",
    "^(مهرپویا)$",
    "^(هه)$",
    "^([Bb][Kk])$",
    "^(کیر)$",
    "^([Kk][Ii][Rr])$",
    "^(چطورید؟)$",
    "^(چطورید)$",
    "^([Gg][Pp])$",
    "^(کس نگو)$",
    "^(کس نگید)$",
    "^(چت نکنید)$",
    "^(چت ممنوع)$",
    "^(مهدیه)$",
    "^(رضا)$",
    "^([Bb][Aa][Nn])?$",
    "^([Gg][Bb])?$"
  },
  run = run
}
end