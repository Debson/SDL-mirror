
project "SDL2"
language "C"

flags 
{
    "NoRuntimeChecks",
    "NoBufferSecurityCheck"
}

targetdir ("bin/" .. outputdir .. "/%{prj.name}")
objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

files {
        "include/*.h",									    
        "src/*.c",
        "src/SDL_dataqueue.h",						        
        "src/SDL_error_c.h",							    
        "src/audio/*.c",
        "src/audio/*.h",								    
        "src/audio/disk/*.c",
        "src/audio/disk/*.h",								    
        "src/audio/dummy/*.c",
        "src/audio/dummy/*.h",						        
        "src/atomic/*.c",
        "src/cpuinfo/*.c",
        "src/dynapi/*.c",
        "src/dynapi/*.h",								    
        "src/events/*.c",
        "src/events/*.h",				    
        "src/file/*.c",
        "src/haptic/*.c",
        "src/haptic/*.h",					    
        "src/joystick/*.c",
        "src/joystick/*.h",		        				    
        "src/joystick/hidapi/*.c",
        "src/joystick/hidapi/*.h",	
        "src/joystick/virtual/*.c",
        "src/joystick/virtual/*.h",					        
        "src/libm/*.c",
        "src/libm/*.h",		
        "src/locale/*.c",
        "src/locale/*.h",
        "src/power/*.c",
        "src/power/*.h",
        "src/render/opengl/*.c",
        "src/render/opengl/*.h",						    
        "src/render/opengles/*.c",	
        "src/render/opengles/*.h",					        
        "src/render/opengles2/*.c",
        "src/render/opengles2/*.h",
        "src/render/software/*.c",
        "src/render/software/*.h",					        
        "src/render/SDL_render.c",
        "src/render/SDL_sysrender.h",					    
        "src/render/SDL_yuv_sw.c",
        "src/render/SDL_yuv_sw_c.h",					    
        "src/sensor/*.c",
        "src/sensor/*.h",
        "src/sensor/dummy/*.c",
        "src/sensor/dummy/*.h",						        
        "src/stdlib/*.c",								    
        "src/thread/generic/SDL_syscond.c",
        "src/thread/*.c",
        "src/thread/*.h",								    
        "src/timer/*.c",
        "src/timer/*.h",
        "src/timer/dummy/*.c",
        "src/video/*.c",
        "src/video/*.h",
        "src/video/dummy/*.c",
        "src/video/dummy/*.h",
        "src/video/yuv2rgb/*.c",
    }

    includedirs
    {
        "include"
    }

    filter "system:linux"
        kind "StaticLib"
        staticruntime "on"
        systemversion "latest"

        files 
        {
            "src/core/linux/*.c",
            "src/core/linux/*.h",	
            "src/filesystem/unix/*.c",
            "src/haptic/linux/*.c",
            "src/hidapi/linux/*.c",
            "src/locale/linux/*.c",
            "src/power/linux/*.c",
            "src/thread/pthread/*.c",
            "src/thread/pthread/*.h",
            "src/timer/unix/*.c",
            "src/timer/unix/*.h",
            "src/video/x11/*.c",
            "src/video/x11/*.h",
        }

        defines
        {

        }

    filter "system:macosx"
        kind "StaticLib"
        staticruntime "on"
        systemversion "latest"

        files 
        {
            "src/power/macosx/*.c",
            "src/video/x11/*.c",
            "src/video/x11/*.h",
        }

        defines
        {
            
        }

    filter "system:windows"
        kind "SharedLib"
        staticruntime "off"
        systemversion "latest"

        files 
        {
            "include/SDL_config_windows.h",				    								    
            "src/audio/directsound/*.h",                    
            "src/audio/directsound/*.c",
            "src/audio/wasapi/*.h",						    
            "src/audio/winmm/*.c",
            "src/audio/winmm/*.h",						    
            "src/audio/wasapi/*.c",		   
            "src/core/windows/*.c",
            "src/core/windows/*.h",					    
            "src/filesystem/windows/*.c",
            "src/haptic/windows/*.c",
            "src/haptic/windows/*.h",					    
            "src/hidapi/windows/*.c",
            "src/joystick/windows/*.h",					    
            "src/joystick/windows/*.c",
            "src/loadso/windows/*.c",
            "src/locale/windows/*.c",
            "src/power/windows/*.c",
            "src/render/direct3d/*.c",
            "src/render/direct3d/*.h",					    
            "src/render/direct3d11/*.c",
            "src/render/direct3d11/*.h",    
            "src/render/SDL_d3dmath.c",
            "src/render/SDL_d3dmath.h",					    
            "src/sensor/windows/*.c",
            "src/sensor/windows/*.h",
            "src/thread/windows/*.c",	
            "src/thread/windows/*.h",	
            "src/timer/windows/*.c",				    
            "src/video/windows/*.c",
            "src/video/windows/*.h",
        }

        defines
        {
            "_WINDOWS",
            "_CRT_SECURE_NO_WARNINGS"
        }

        links 
        {
            "setupapi",
            "winmm",
            "imm32",
            "version",
        }
        
        -- include "SDL2main.lua"

    filter "configurations:Debug"
        defines "_DEBUG"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        defines "NDEBUG"
        runtime "Release"
        optimize "on"