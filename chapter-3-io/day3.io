#! /usr/bin/env io

XmlBuilder := Object clone

XmlBuilder indent := 0
XmlBuilder forward := method(

  write("  " repeated(indent))
  write("<", call message name)

  argListStart := 0;
  firstArg := call message arguments first
  if ((firstArg isNil not) and (firstArg name == "curlyBrackets"),
    argListStart = 1;
    attribs := self doMessage(firstArg)
    attribs keys foreach(k,
      write(" ", k, "=\"", attribs at(k), "\"")
    )
  )

  writeln(">")

  indent = indent + 2;
  call message arguments slice(argListStart) foreach(arg,
    content := self doMessage(arg);
    if (content type == "Sequence",
      write("  " repeated(indent + 1))
      writeln(content)
    )
  )
  indent = indent - 2;

  write("  " repeated(indent))
  writeln("</", call message name, ">");

)

# XmlBuilder ul(li("Io"), li("Lua"), li("JavaScript"))

Object squareBrackets := method(
  l := List clone
  call message arguments foreach(arg, l append(arg))
  l
)

# [1, 2, 3, 4, 5]

OperatorTable addAssignOperator(":", "atPut")
Object curlyBrackets := method(
  m := Map clone
  call message arguments foreach(arg, m doMessage(arg))
  m
)