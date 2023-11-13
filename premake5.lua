-- Count_MHM
-- 2023/11/13

project "raylib"
	kind "StaticLib"
	language "C"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	vpaths
    {
        ["Header Files"] = { "src/**.h"},
        ["Source Files/*"] = { "src/**.c"},
    }

	files
	{
		"src/*.h",
		"src/*.c"
	}
	removefiles
	{
		"src/rcore_*.c"
	}

	includedirs
	{
		"src",
		"src/external/glfw/include"
	}
	
	defines
	{
		"_CRT_SECURE_NO_WARNINGS",
		"PLATFORM_DESKTOP",
		"GRAPHICS_API_OPENGL_33"
	}

	-- filter "action:vs*"
	-- 	defines{"_WINSOCK_DEPRECATED_NO_WARNINGS", "_CRT_SECURE_NO_WARNINGS"}
	-- 	characterset ("MBCS")

	-- filter {"system:macosx"}
	-- 	disablewarnings {"deprecated-declarations"}

	filter "system:linux"
		pic "On"

		systemversion "latest"

		defines
		{
			"_GNU_SOURCE"
		}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	