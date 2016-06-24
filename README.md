# bngl-jed
[BioNetGen](http://bionetgen.org/) syntax highlighting for the [JED editor](http://www.jedsoft.org/jed/)

#Instructions
Place this file in the jed/lib directory. In my case this was:
```
/opt/local/share/jed/lib
```
If you want this file to be used for every .bngl file you must put the following line in your .jedrc file which is in your home directory:
```
() = evalfile("bnglmode");
```
