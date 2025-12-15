const chokidar = require("chokidar");
const { exec } = require("child_process");

let commitTimer = null;
const COMMIT_DELAY = 5000; // ⏱️ 5 seconds (change if you want)

const watcher = chokidar.watch(".", {
  ignored: [
    /(^|[\/\\])\../,
    "build/**",
    "node_modules/**",
    ".dart_tool/**",
    ".git/**",
  ],
  persistent: true,
  ignoreInitial: true,
});

watcher.on("change", (path) => {
  console.log(`✏️ Change detected: ${path}`);

  // Reset timer if more changes happen
  if (commitTimer) clearTimeout(commitTimer);

  commitTimer = setTimeout(() => {
    const message = `Auto commit after delay`;

    exec(`git add . && git commit -m "${message}"`, (error) => {
      if (error) {
        console.log("⚠️ Nothing to commit");
      } else {
        console.log("✅ Auto commit done");
      }
    });
  }, COMMIT_DELAY);
});

console.log("👀 Watching files (commit after delay)...");
