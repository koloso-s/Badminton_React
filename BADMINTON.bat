@echo off
title Badminton - start projektu

echo Uruchamiam XAMPP...
start "" "C:\xampp\xampp_start.exe"

timeout /t 3 /nobreak >nul

echo Uruchamiam frontend...
start "Badminton Frontend" cmd /k "cd /d C:\Users\werte\Documents\Badminton_React\badminton && npm start"

echo Uruchamiam backend...
start "Badminton Backend" cmd /k "cd /d C:\Users\werte\Documents\Badminton_React\server && npm run dev"

exit