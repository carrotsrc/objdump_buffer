# objdump_buffer

This function can take the name of the current file buffer and use that to display the assembly of the respective object file in its own separate vertically split off buffer, but only if the file is already compiled and in the same directly.

Alternative use is performing the same action on the source file or object file under the cursor in a netrw :Ex or :Vex window. If it is an x86 object file, it will disassemble otherwise if it is a source file it will look for the respective object file in the source files directory and dissassembly.
