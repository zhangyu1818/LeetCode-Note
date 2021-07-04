const { readdir } = require("fs").promises;

module.exports = (content) =>
  readdir("./").then((result) => {
    const swiftFiles = result
      .filter((file) => file.endsWith(".swift"))
      .sort((a, b) => {
        try {
          [a] = a.match(/^(\d+)/);
          [b] = b.match(/^(\d+)/);
          return a - b;
        } catch {
          return a > b;
        }
      })
      .map(
        (name) =>
          `[${name.replace(
            ".swift",
            ""
          )}](https://github.com/zhangyu1818/LeetCode-Note/blob/main/${name})`
      )
      .join("\n");
    [content] = content.split("---");
    return `${content}\n---\n\n${swiftFiles}`;
  });
