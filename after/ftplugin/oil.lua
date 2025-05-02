local CPP_TEMPLATE= [[
/044 rwxr-xr-x 0   Apr 02 12:36   build/
/045 rwxr-xr-x 0   Apr 02 12:36   include/
/043 rwxr-xr-x 0   Apr 02 12:36   src/
/069 rw-r--r-- 511 Apr 02 12:37   CMakeLists.txt
/068 rwxr-xr-x 104 Apr 02 12:37   build.sh
/070 rw-r--r-- 0   Apr 02 12:37   main.cpp
]]

local opts = { noremap = true, silent = true, buffer = 0 }

vim.keymap.set("n","<leader>T", string.format("o%s",CPP_TEMPLATE), opts)
