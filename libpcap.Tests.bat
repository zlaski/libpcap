setlocal EnableExtensions EnableDelayedExpansion

set /a "NUM_TESTS=0"
set /a "NUM_FAILURES=0"

for /f %%T in ('dir/s/b tests\code\%ProjectName%.*.bat 2^>nul') do (
    set "TT=%%~T"
    set "TT=!TT:%CD%\=!"
    echo __________ !TT!: START
    call !TT!
    set _r=!ERRORLEVEL!
    set /a "NUM_TESTS+=1"
    if [!_r!] equ [0] (
        echo __________ !TT!: PASS
    ) else (
        set /a "NUM_FAILURES+=1"
        echo __________ !TT!: FAIL [!_r!]
    )
)

echo _______ TESTS TOTAL: %NUM_TESTS%
echo _______ FAILURES TOTAL: %NUM_FAILURES%

exit /b %NUM_FAILURES%
