//
// mkdirp.h
//
// Copyright (c) 2013 Stephen Mathieson
// MIT licensed
//

#ifndef MKDIRP
#define MKDIRP

#include <sys/types.h>
#include <sys/stat.h>

/*
 * Recursively `mkdir(path, mode)`
 */

int mkdirp_mkdirp(char *, mode_t );

#endif
