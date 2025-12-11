@ECHO OFF
:: This batch file is used to install all Python packages needed to use the HSDPython_SDK and its examples
ECHO HSDPython_SDK Installer
ECHO.
ECHO [NOTE]: If you are using a proxy launch this script passing your proxy string as a parameter.
ECHO -- e.g.: HSDPython_SDK_install.bat http://usr_name:password@proxyserver_name:port#
ECHO.
set proxy_string=%1
:: Section 1: stdatalog_pnpl
ECHO ===========================================
ECHO installing stdatalog_pnpl...
ECHO ===========================================
python -c "import pkg_resources; pkg_resources.require('stdatalog_pnpl')" 2>nul
if %errorlevel%==0 (
ECHO Version to be installed: 1.3.0
python -m pip uninstall stdatalog_pnpl -y
)
if "%proxy_string%"=="" (python -m pip install stdatalog_pnpl\dist\stdatalog_pnpl-1.3.0-py3-none-any.whl) else (python -m pip install stdatalog_pnpl\dist\stdatalog_pnpl-1.3.0-py3-none-any.whl --proxy %proxy_string%)
:: Section 2: stdatalog_core
ECHO ===========================================
ECHO installing stdatalog_core...
ECHO ===========================================
python -c "import pkg_resources; pkg_resources.require('stdatalog_core')" 2>nul
if %errorlevel%==0 (
ECHO Version to be installed: 1.3.0
python -m pip uninstall stdatalog_core -y
)
if "%proxy_string%"=="" (python -m pip install stdatalog_core\dist\stdatalog_core-1.3.0-py3-none-any.whl) else (python -m pip install stdatalog_core\dist\stdatalog_core-1.3.0-py3-none-any.whl --proxy %proxy_string%)
:: Section 3: stdatalog_dtk
ECHO ===========================================
ECHO installing stdatalog_dtk...
ECHO ===========================================
python -c "import pkg_resources; pkg_resources.require('stdatalog_dtk')" 2>nul
if %errorlevel%==0 (
ECHO Version to be installed: 1.3.0
python -m pip uninstall stdatalog_dtk -y
)
if "%proxy_string%"=="" (python -m pip install stdatalog_dtk\dist\stdatalog_dtk-1.3.0-py3-none-any.whl) else (python -m pip install stdatalog_dtk\dist\stdatalog_dtk-1.3.0-py3-none-any.whl --proxy %proxy_string%)
:: Section 4: stdatalog_gui
ECHO ===========================================
ECHO installing stdatalog_gui...
ECHO ===========================================
python -c "import pkg_resources; pkg_resources.require('stdatalog_gui')" 2>nul
if %errorlevel%==0 (
ECHO Version to be installed: 1.3.0
python -m pip uninstall stdatalog_gui -y
)
if "%proxy_string%"=="" (python -m pip install stdatalog_gui\dist\stdatalog_gui-1.3.0-py3-none-any.whl) else (python -m pip install stdatalog_gui\dist\stdatalog_gui-1.3.0-py3-none-any.whl --proxy %proxy_string%) 
PAUSE
