project('plthook_test', 'c',
  version : '0.1',
  default_options : [
    'warning_level=3',
  ],
)

host_os = host_machine.system()

# depend on plthook
plthook_proj = subproject('plthook')
plthook_dep = plthook_proj.get_variable('plthook_dep')

plthook_libtest_sources = [
    './libtest.c',
]
plthook_libtest_include = include_directories('.')
plthook_libtest_lflags = []

plthook_libtest_lib = shared_library('plthook_libtest',
  plthook_libtest_sources,
  include_directories : plthook_libtest_include,
  dependencies : [plthook_dep],
  link_args : plthook_libtest_lflags,
)

plthook_test_sources = [
  './testprog.c',
]
plthook_test_include = include_directories('.')
plthook_test_lflags = []

plthook_test_exe = executable('plthook_test',
  plthook_test_sources,
  include_directories : plthook_test_include,
  link_with : [plthook_libtest_lib],
  dependencies : [plthook_dep],
  link_args : plthook_test_lflags,
)
