CTX2VEP_TARGETS= `{find -L data/ -name '*.ctx' \
	| sed -e 's#^data/#results/for_vep/#g' \
		-e 's#\.ctx#.tsv#g'}

ctx2vep:V:	$CTX2VEP_TARGETS

results/for_vep/%.tsv:	data/%.ctx
	mkdir -p `dirname $target`
	./ctx2tsv $prereq \
	> $target

clean:V:
	rm -r results/for_vep/