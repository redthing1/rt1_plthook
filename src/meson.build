project('plthook', 'c',
  version : '0.1',
  default_options : ['warning_level=3']
)

cc = meson.get_compiler('c')
host_os = host_machine.system()

plthook_cflags = [
  '-Wno-unused-parameter',
]

# link everything statically
plthook_lflags = [
  '-static-libgcc',
  '-static-libstdc++',
  '-static',
]

plthook_sources = []
plthook_include = include_directories('.')

# system libraries
plthook_deps = []

plthook_sources_linux = './plthook_elf.c'
plthook_sources_darwin = './plthook_osx.c'
plthook_sources_windows = './plthook_win32.c'

if host_os == 'linux'
    plthook_sources += plthook_sources_linux
elif host_os == 'darwin'
    plthook_sources += plthook_sources_darwin
elif host_os == 'windows'
    plthook_sources += plthook_sources_windows
else
    error('unsupported host os: ' + host_os)
endif

plthook_stlib = static_library('plthook',
  plthook_sources,
  include_directories : plthook_include,
  c_args : plthook_cflags,
  gnu_symbol_visibility : 'default',
  dependencies : plthook_deps,
  link_args : plthook_lflags,
)

# make this library usable as a meson subproject.
plthook_dep = declare_dependency(
  include_directories: plthook_include,
  link_with : plthook_stlib,
)
