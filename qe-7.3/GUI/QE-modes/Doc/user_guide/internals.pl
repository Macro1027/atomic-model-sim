# LaTeX2HTML 2021.2 (Released July 1, 2021)
# Associate internals original text with physical files.


$key = q/fig:example/;
$ref_files{$key} = "$dir".q|user_guide.html|; 
$noresave{$key} = "$nosave";

$key = q/fig:insert-template/;
$ref_files{$key} = "$dir".q|user_guide.html|; 
$noresave{$key} = "$nosave";

1;

