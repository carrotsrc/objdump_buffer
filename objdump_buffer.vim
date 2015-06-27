
function DisasmObjScratch()

	let fn = ""
	let tpath = expand('%:p:h')

	if &filetype == "netrw"
		let atoms = split(getline('.'), '\.')
		if atoms[1] != "o"
			echo "File type is incompatible: requires object file"
			return
		endif
		let fn = atoms[0]
	else		
		let tfile = expand('%:t')
		let atoms = split(tfile, '\.')
		if len(atoms) < 2
			echo "File name incompatible"
			return
		endif

		let fn = atoms[0]

	endif

	let in = tpath . "/" . fn . ".o"

	if !filereadable(in)
		echo "Object `" . fn . ".o` file not found!"
		return
	endif

	let cmd = "objdump -GD -r " . in
	let dump = system(cmd)

	execute "vsplit ".fn."__ASM"
	normal! ggdG
	setlocal buftype=nofile

	call append(0, split(dump,'\v\n'))
	normal! gg
endfunction
