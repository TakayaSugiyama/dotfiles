
Generate the autocompletion script for owari for the specified shell.
See each sub-command's help for details on how to use the generated script.

Usage:
  owari completion [command]

Available Commands:
  bash        generate the autocompletion script for bash
  fish        generate the autocompletion script for fish
  powershell  generate the autocompletion script for powershell
  zsh         generate the autocompletion script for zsh

Flags:
  -h, --help   help for completion

Global Flags:
  -c, --colorful            カラフルにします
  -C, --colorful-always     colorfulフラグが有効なとき、パイプやリダイレクト時にもCOLOR_CODEが適用されるよう強制します
  -n, --count string        指定回数出力します。負数かinfを指定すると無限になります (default "1")
  -d, --duration duration   複数回出力のインターバルです (default 500ms)
  -E, --insert-empty        出力の1行目に必ず空白行を挿入します (default true)
      --offset int          左からアスキーアートまでの距離です
  -o, --overwrite           複数回出力するときに同じ場所に上書きし続けます

Use "owari completion [command] --help" for more information about a command.
