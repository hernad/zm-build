#!/build/toolchain/lin32/python-2.6.1/bin/python
# 
# ***** BEGIN LICENSE BLOCK *****
# 
# Zimbra Collaboration Suite Server
# Copyright (C) 2010 Zimbra, Inc.
# 
# The contents of this file are subject to the Zimbra Public License
# Version 1.3 ("License"); you may not use this file except in
# compliance with the License.  You may obtain a copy of the License at
# http://www.zimbra.com/license.
# 
# Software distributed under the License is distributed on an "AS IS"
# basis, WITHOUT WARRANTY OF ANY KIND, either express or implied.
# 
# ***** END LICENSE BLOCK *****
# 
"""
Read a series of lines from standard input. Ignore all lines that do not start
with the @ character. For each line that starts with the @ character, assume it
has the form `@componentname,path'.  Print out this line to stdout in the
format given on the command line.
"""
import optparse
import sys


PRINTERS = ['make', 'ant']
PROGRAM_NAME = 'create-specinfo.py'


def main(args):
   """
   Main entry point.
   """
   parser = optparse.OptionParser()
   parser.add_option('--format', type='choice', choices=PRINTERS,
                     help="the output format to use.")
   options, args = parser.parse_args(args)

   if not options.format:
      parser.error("the --format flag is required")

   components = []
   for line in sys.stdin:
      if line.startswith('@'):
         data = line[1:].strip()
      else:
         continue
      try:
         name, path = data.split(',', 1)
      except ValueError:
         print >>sys.stderr, ('%s: invalid input line: %s'
                              % (PROGRAM_NAME, line))
         return 1
      components.append((name, path))

   return {
      'make': _print_make_format,
      'ant': _print_ant_format,
   }[options.format](components)


def _print_make_format(components):
   print ('# WARNING: This file is auto-generated by %s. Do not edit!'
          % PROGRAM_NAME)
   for name, path in components:
      print 'export GOBUILD_%s_ROOT := %s' % (name.upper().replace('-', '_'), path)
   return 0


def _print_ant_format(components):
   print ('# WARNING: This file is auto-generated by %s. Do not edit!'
          % PROGRAM_NAME)
   for name, path in components:
      print 'GOBUILD_%s_ROOT=%s' % (name.upper().replace('-', '_'), path)


if __name__ == '__main__':
   sys.exit(main(sys.argv[1:]))
