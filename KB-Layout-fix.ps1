# Коды InputMethodTips для локалей можно посмотреть здесь: https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/default-input-locales-for-windows-language-packs?view=windows-10



# закрепить за переменной "List" значение "Get-WinUserLanguageList"
$List = Get-WinUserLanguageList

# очистить методы ввода у первого языка в списке (нумерация начинается с нуля)
$List[0].InputMethodTips.Clear()
# добавить английский "несуществующий" метод ввода
$List[0].InputMethodTips.Add('2000:00000409')

# очистить методы ввода у второго языка в списке 
$List[1].InputMethodTips.Clear()
# добавить русский "несуществующий" метод ввода
$List[1].InputMethodTips.Add('2000:00000419')

# удалить "несуществующие" методы ввода
$List[1].InputMethodTips.remove('2000:00000419')
$List[0].InputMethodTips.remove('2000:00000409')

# принудительно применить раскладки из $List
Set-WinUserLanguageList $List -Force
# принудительно закрепить только английскую и русскую раскладки
Set-WinUserLanguageList -languagelist "en-us", "ru" -force

#Высветить список локалей
Get-WinUserLanguageList