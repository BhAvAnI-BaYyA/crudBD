@echo off
set /p "datapk=Enter dataPk needed : "

del /p ..\FrontEndByVite\ColumnSchema\*.json
del /p ..\FrontEndByVite\TableSchema\*.json
del /p ..\FrontEndByVite\src\AllTables\WithSSR\SubTableSideBar\SourceCode\HtmlFiles\*.html
del /p ..\FrontEndByVite\src\AllTables\WithSSR\SubTableSideBar\SourceCode\Js\pages\*.*

xcopy ".\KCode\DataSchema\%datapk%\*.json" ..\FrontEndByVite\ColumnSchema
xcopy ".\KCode\TableSchema\%datapk%\*.json" ..\FrontEndByVite\TableSchema

cd ..\FrontEndByVite
call npm run buildATSubTableSideBar
xcopy .\publicDir\binATSubTableSideBar ..\crudBD\public\binATSubTableSideBar /h /i /c /k /e /r /y
cd ..\crudBD
