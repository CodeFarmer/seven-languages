#! /usr/bin/env io

XmlBuilder := Object clone

XmlBuilder indent := 0
XmlBuilder forward := method(

  write("  " repeated(indent))
  writeln("<", call message name, ">")

  indent = indent + 2;
  call message arguments foreach(arg,
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
