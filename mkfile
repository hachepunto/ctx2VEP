CTX2VEP_TARGETS= `{find -L data/ -name '*.ctx' \
	| sed -e 's#^data/#results/for_vep/#g' \
		-e 's#\.ctx#.tsv#g'}

ctx2vep:V:	$CTX2VEP_TARGETS

results/for_vep/%.tsv:	data/%.ctx
	mkdir -p `dirname $target`
	cut -f1,2,5,7 $prereq \
	| grep -v -E "#|hs37d5" \
	| grep -E "DEL|INS|INV" \
	> $target \
	|| true

