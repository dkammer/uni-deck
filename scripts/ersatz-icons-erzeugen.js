// Erzeugt für jeden Link aus index.html ein Ersatz-Icon als SVG in icons/ersatz/.
// Aufruf im Ordner htw-hub:  node ersatz-icons-erzeugen.js
// Nach dem Hinzufügen neuer Links einfach erneut ausführen.
const fs = require("fs");
const path = require("path");

const dir = __dirname;
const html = fs.readFileSync(path.join(dir, "index.html"), "utf8");

// LINKS-Array und die Icon-Funktionen direkt aus index.html übernehmen,
// damit Dateien und Seite immer gleich aussehen.
const grab = re => { const m = html.match(re); if (!m) throw new Error("Nicht gefunden: " + re); return m[0]; };
const code = [
  grab(/const LINKS = \[[\s\S]*?\n\];/),
  grab(/const esc = [^\n]*/),
  grab(/function hash\(str\) \{[\s\S]*?\n\}/),
  grab(/function makeIcon\(name, url\) \{[\s\S]*?\n\}/),
  "module.exports = { LINKS, makeIcon };",
].join("\n");
const mod = { exports: {} };
new Function("module", code)(mod);
const { LINKS, makeIcon } = mod.exports;

const out = path.join(dir, "icons", "ersatz");
fs.mkdirSync(out, { recursive: true });

for (const l of LINKS) {
  if (!l.id) { console.log("übersprungen (keine id):", l.name); continue; }
  const svg = makeIcon(l.name, l.url)
    .replace(' aria-hidden="true"', ' width="48" height="48"')
    .replace(/\n\s*/g, "\n  ")
    .trim();
  fs.writeFileSync(path.join(out, l.id + ".svg"), svg + "\n");
  console.log("erzeugt  icons/ersatz/" + l.id + ".svg");
}
