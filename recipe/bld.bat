md python\src
copy src\*.* python\src
cd python
"%PYTHON%" -m pip install .
:: "%PYTHON%" setup.py install --single-version-externally-managed --record record.txt 
if errorlevel 1 exit 1

:: No library build on windows!
