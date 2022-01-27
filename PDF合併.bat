@echo off
rem quality 成像品質
rem alaph png透明效果
rem gsq ghostscript功能
rem val1 很普通的變數
rem fileinput 檔案輸入
rem fileouput 檔案輸出
rem doagain 是否再來一次
:START
	echo 1.PDF轉PNG
	echo 2.PDF轉JPG
	echo 3.PDF合併
	echo 4.PDF分割
	echo 5.PDF壓縮
	SET /P gsq=請輸入你想要執行的功能代碼(1-4)：
	if %gsq% == 1 GOTO Fu1
	if %gsq% == 2 SET val1=jpeg&&GOTO quality
	if %gsq% == 3 GOTO Fu2
	if %gsq% == 4 GOTO Fu3
	if %gsq% == 5 GOTO Fu4
:Fu1
	SET /P alaph=設定PNG是否帶有透明效果(y/N)：
	echo %alaph%|findstr /ix "[Y]" >nul && SET val1=pngalpha
rem 若裡面有Y(不分大小寫)則設定val1為pngalpha
	echo %alaph%|findstr /iv "[Y]" >nul && SET val1=png16m
rem 若裡面沒有Y(不分大小寫)則設定val1為png16m
rem echo val1
:quality
	SET /P quality=請輸入輸出的dpi品質為(預設300)：
	echo %quality%|findstr /iv "[100-600]" >nul && SET quality=300
	echo %quality%
	SET /P fileinput=請輸入PDF位置(ex:C:\source.pdf)：
	SET /P fileouput=請輸入檔案存檔位置(ex:C:\destination.png)：
	SET code=gs -sDEVICE=%val1% -o "%fileouput%" -r%quality% "%fileinput%"
	echo %code%
	gs -dNOPAUSE -dBATCH -dQUITE -sDEVICE=%val1% -dTextAlphaBits=4 -o "%fileouput%" -r%quality% "%fileinput%"
	pause
	SET /P doagain=是否再做一次？(y/N)：
	echo %doagain% |findstr /ix "[Y]" >nul && goto START
	echo %doagain% |findstr /iv "[Y]" >nul && exit
