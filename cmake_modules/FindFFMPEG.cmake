# - Try to find ffmpeg libraries (libavcodec, libavformat and libavutil)
# Once done this will define
#
#  FFMPEG_FOUND - system has ffmpeg or libav
#  FFMPEG_INCLUDE_DIR - the ffmpeg include directory
#  FFMPEG_LIBRARIES - Link these to use ffmpeg
#  FFMPEG_LIBAVCODEC
#  FFMPEG_LIBAVFORMAT
#  FFMPEG_LIBAVUTIL
#
#  Copyright (c) 2008 Andreas Schneider <mail@cynapses.org>
#  Modified for other libraries by Lasse Kärkkäinen <tronic>
#  Modified for Hedgewars by Stepik777
#
#  Redistribution and use is allowed according to the terms of the New
#  BSD license.
#

if (FFMPEG_LIBRARIES AND FFMPEG_INCLUDE_DIR)
  # in cache already
  set(FFMPEG_FOUND TRUE)
else (FFMPEG_LIBRARIES AND FFMPEG_INCLUDE_DIR)
  # use pkg-config to get the directories and then use these values
  # in the FIND_PATH() and FIND_LIBRARY() calls
  find_package(PkgConfig)
  if (PKG_CONFIG_FOUND)
    pkg_check_modules(_FFMPEG_AVCODEC libavcodec)
    pkg_check_modules(_FFMPEG_AVFORMAT libavformat)
    pkg_check_modules(_FFMPEG_AVUTIL libavutil)
  endif (PKG_CONFIG_FOUND)

  find_path(FFMPEG_AVCODEC_INCLUDE_DIR
    NAMES libavcodec/avcodec.h
    PATHS ${_FFMPEG_AVCODEC_INCLUDE_DIRS}
        /usr/include /usr/local/include #system level
        /opt/local/include #macports
        /sw/include #fink
    PATH_SUFFIXES ffmpeg libav
  )

  find_library(FFMPEG_LIBAVCODEC
    NAMES avcodec
    PATHS ${_FFMPEG_AVCODEC_LIBRARY_DIRS}
        /usr/lib /usr/local/lib #system level
        /opt/local/lib #macports
        /sw/lib #fink
  )

  find_library(FFMPEG_LIBAVFORMAT
    NAMES avformat
    PATHS ${_FFMPEG_AVFORMAT_LIBRARY_DIRS}
        /usr/lib /usr/local/lib #system level
        /opt/local/lib #macports
        /sw/lib #fink
  )

  find_library(FFMPEG_LIBAVUTIL
    NAMES avutil
    PATHS ${_FFMPEG_AVUTIL_LIBRARY_DIRS}
        /usr/lib /usr/local/lib #system level
        /opt/local/lib #macports
        /sw/lib #fink
  )

  if (FFMPEG_LIBAVCODEC AND FFMPEG_LIBAVFORMAT)
    set(FFMPEG_FOUND TRUE)
  endif()

  if (FFMPEG_FOUND)
    set(FFMPEG_INCLUDE_DIR ${FFMPEG_AVCODEC_INCLUDE_DIR})

    set(FFMPEG_LIBRARIES
      ${FFMPEG_LIBAVCODEC}
      ${FFMPEG_LIBAVFORMAT}
      ${FFMPEG_LIBAVUTIL}
    )
    if (APPLE)
      set(FFMPEG_LIBRARIES ${FFMPEG_LIBRARIES} "bz2" "-framework CoreVideo" "-framework VideoDecodeAcceleration")
    endif(APPLE)

  endif (FFMPEG_FOUND)

  if (FFMPEG_FOUND)
    if (NOT FFMPEG_FIND_QUIETLY)
      message(STATUS "Found FFMPEG/LibAV: ${FFMPEG_LIBRARIES}, ${FFMPEG_INCLUDE_DIR}")
    endif (NOT FFMPEG_FIND_QUIETLY)
  else (FFMPEG_FOUND)
    if (FFMPEG_FIND_REQUIRED)
      message(FATAL_ERROR "Could NOT find libavcodec or libavformat or libavutil")
    endif (FFMPEG_FIND_REQUIRED)
  endif (FFMPEG_FOUND)

endif (FFMPEG_LIBRARIES AND FFMPEG_INCLUDE_DIR)
