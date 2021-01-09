" Shows recently opened files and saves session
Plug 'mhinz/vim-startify'

let g:startify_custom_header = [
	\ '        __                    __           ___              ',
	\ '       /\ \__                /\ \__  __  /''___\            ',
	\ '   ____\ \ ,_\    __     _ __\ \ ,_\/\_\/\ \__/  __  __     ',
	\ '  /'',__\\ \ \/  /''__`\  /\`''__\ \ \/\/\ \ \ ,__\/\ \/\ \ ',
	\ ' /\__, `\\ \ \_/\ \L\.\_\ \ \/ \ \ \_\ \ \ \ \_/\ \ \_\ \   ',
	\ ' \/\____/ \ \__\ \__/.\_\\ \_\  \ \__\\ \_\ \_\  \/`____ \  ',
	\ '  \/___/   \/__/\/__/\/_/ \/_/   \/__/ \/_/\/_/   `/___/> \ ',
	\ '                                                     /\___/ ',
	\ '                                                     \/__/  ',
	\ ]

let g:startify_lists = [
	\ { 'type': 'files',     'header': ['   Recently Opened']},
	\ { 'type': 'sessions',  'header': ['   Sessions']       },
	\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
	\ { 'type': 'commands',  'header': ['   Commands']       },
	\ ]

let g:startify_commands = [
	\ {'n': ['Edit Neovim config', 'edit $HOME/.config/nvim/init.vim']},
	\ {'pd': ['Update plugins', 'PlugUpdate']},
	\ {'pc': ['Clean plugins', 'PlugClean']},
	\ {'ps': ['Plugin status', 'PlugStatus']},
	\ {'pg': ['Update vim-plug', 'PlugUpgrade']},
	\ ]
