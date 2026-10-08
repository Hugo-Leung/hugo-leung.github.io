const fs = require("node:fs");

const timestamp = new Date().toISOString();

for (const filePath of process.argv.slice(2)) {
	const source = fs.readFileSync(filePath, "utf8");
	const newline = source.includes("\r\n") ? "\r\n" : "\n";
	const frontMatterMatch = source.match(/^(---|\+\+\+)\r?\n([\s\S]*?)\r?\n\1(?=\r?\n|$)/);
	const delimiter = frontMatterMatch?.[1] ?? "---";
	const metadata = frontMatterMatch?.[2] ?? "";
	const key = delimiter === "+++" ? "lastmod = " : "lastmod: ";
	const updatedMetadata = /^([ \t]*lastmod[ \t]*[:=][ \t]*)[^\r\n]*$/im.test(metadata)
		? metadata.replace(/^([ \t]*lastmod[ \t]*[:=][ \t]*)[^\r\n]*$/im, `$1"${timestamp}"`)
		: [metadata, `${key}"${timestamp}"`].filter(Boolean).join(newline);
	const updated = frontMatterMatch
		? `${delimiter}${newline}${updatedMetadata}${newline}${delimiter}${source.slice(frontMatterMatch[0].length)}`
		: `${delimiter}${newline}${updatedMetadata}${newline}${delimiter}${newline}${source}`;

	if (updated !== source) {
		fs.writeFileSync(filePath, updated);
	}
}