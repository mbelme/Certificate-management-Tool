::::::::::::::::::::::::::::::::::
:
: Rocket Software Confidential
: OCO Source Materials
: Copyright (C) Rocket Software. 2009, 2010, 2011, 2012, 2013
: 
:
: @(:) $0 : script for importing a microsoft pfx file to a JKS store
:           for a U2 DB system
:	by : Nik Kesic
:	   : U2 Support Denver - USA
: Synopsis:
:
:     pfxconv4
:
:         for Windows 2008, 7, - 64 bit
:           
:
:
::::::::::::::::::::::::::::::::::
@ECHO OFF
:
cls
:
echo. ++++++++++++++++++++++++++++++++++++++++
echo.  PFX Import into NEW/OLD Java Key Store
echo. ++++++++++++++++++++++++++++++++++++++++
echo.      
:
::set OPENSSL_CONF=c:\OpenSSL-Win32\openssl.cnf


::
set /p INP4=Enter name for the PFX file :  
IF  NOT (%INP4%)==() (
set rootfile=%INP1%
) ELSE (
echo " bad input"
)
set /p INP5=Enter name for the Java Key Store :  
IF  NOT (%INP5%)==() (
set pfxfile=%INPUT%
) ELSE (
echo " bad input"
)
keytool -v -importkeystore -srckeystore %INP4% -srcstoretype PKCS12 -destkeystore %INP5%.jks -deststoretype JKS
echo.
dir /B %INP5%*
SET /P M= Any key to exit : 
IF %M%== GOTO EOF
:EOF
exit