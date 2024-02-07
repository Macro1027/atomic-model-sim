# LaTeX2HTML 2021.2 (Released July 1, 2021)
# Associate labels original text with physical files.


$key = q/fig:example/;
$external_labels{$key} = "$URL/" . q|user_guide.html|; 
$noresave{$key} = "$nosave";

$key = q/fig:insert-template/;
$external_labels{$key} = "$URL/" . q|user_guide.html|; 
$noresave{$key} = "$nosave";

1;


# LaTeX2HTML 2021.2 (Released July 1, 2021)
# labels from external_latex_labels array.


$key = q/fig:example/;
$external_latex_labels{$key} = q|1 A <TT>pw.x</TT> input file opened with <FONT COLOR="#8a2be2"><TT>pw-mode</TT></FONT> in Emacs. Note the highlighted elements: namelists and their variables (blue and brown), cards and their flags (purple and green), comments (red), string and logical variable values (burgundy and cyan, respectively). Note that mistyped variable (i.e. <TT>ibrv</TT> instead of <TT>ibrav</TT>) is not highlighted|; 
$noresave{$key} = "$nosave";

$key = q/fig:insert-template/;
$external_latex_labels{$key} = q|2 The result of executing the <FONT COLOR="#8a2be2"><TT>M-x pp-insert-template</TT></FONT> command, which insert a template for the <TT>pp.x</TT> input file into the current buffer|; 
$noresave{$key} = "$nosave";

1;

