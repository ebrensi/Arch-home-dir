-- This is a general "plugin" for short snippets.

function init()
    linter.makeLinter("eslint-local", "javascript", "npx", {"eslint","-f","compact","%f"}, "%f: line %l, col %c, %m")
    linter.makeLinter("prettier-local", "javascript", "npx", {"prettier", "--write", "%f"}, "")
end
