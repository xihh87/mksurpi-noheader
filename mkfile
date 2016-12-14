all:V:
	./targets | xargs mk

'results/noheader/%.noheader.sam':	'data/%.sam'
	mkdir -p `dirname "$target"`
	grep -vE '^@' "$prereq" > "$target".build \
	&& mv "$target"'.build' "$target"

'results/noheader/%.noheader.sorted.sam':	'results/noheader/%.noheader.sam'
	mkdir -p `dirname "$target"`
	sort "$prereq" > "$target"'.build' \
	&& mv "$target"'.build' "$target" \
	&& rm "$prereq"
