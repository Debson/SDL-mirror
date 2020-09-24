
project "SDL2main"
    language "C"
    kind "StaticLib"
    staticruntime "On"
    systemversion "latest"

    flags 
    {
        "NoRuntimeChecks",
        "NoBufferSecurityCheck"
    }

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files 
    {
        "src/main/windows/*.c",
    }

    includedirs
    {
        "include"
    }

    defines
    {
        "_WINDOWS",
        "_CRT_SECURE_NO_WARNINGS"
    }

    filter "configurations:Debug"
        defines "_DEBUG"
        buildoptions "/MDd"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        defines "NDEBUG"
        buildoptions "/MD"
        runtime "Release"
        optimize "on"