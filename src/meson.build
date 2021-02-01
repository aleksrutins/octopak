octopak_sources = [
  'main.vala',
  'install.vala',
  'mkdirp/mkdirp.c',
  'mkdirp.vapi'
]

octopak_deps = [
  dependency('glib-2.0'),
  dependency('gobject-2.0'),
  dependency('libsoup-2.4'),
  dependency('json-glib-1.0'),
  meson.get_compiler('vala').find_library('posix')
]

executable('octopak', octopak_sources,
  vala_args: '--target-glib=2.58',  dependencies: octopak_deps,
  install: true,
)
