-- Build configuration for {{cookiecutter.module_name}}
-- {{cookiecutter.author_name}}, {{ cookiecutter.date }}

module = "{{cookiecutter.module_name}}"

typesetfiles = {"*.tex"}


-- The "luatex" engine produces some very minor differences (like, a single
-- space in a \kern line).  One way around that is to disable the luatex engine:
-- (uncomment to activate)
--
--     checkengines = {"pdftex", "xetex"}
--
-- Another way is to save test logs twice (on command line)
--
--     $ l3build save test
--     $ l3build save -e luatex test
--
-- This creates both "test.tlg" and "test.luatex.ltg" in testfiles.
-- Engine-specific tlg files are only compared with the specific engines.

-- capture the output from a shell command
-- Thanks Norman Ramsey https://stackoverflow.com/a/326715/297797
-- there is also the shell() function from l3build-upload.lua
-- it doesn't trim leading/training whitespace.
function os.capture(cmd, raw)
    local f = assert(io.popen(cmd, 'r'))
    local s = assert(f:read('*a'))
    f:close()
    if raw then return s end
    s = string.gsub(s, '^%s+', '')
    s = string.gsub(s, '%s+$', '')
    s = string.gsub(s, '[\n\r]+', ' ')
    return s
end

--decorator to only run if repo is clean
function only_if_clean(f)
    return function(x)
        if os.capture("git status --porcelain") ~= "" then
            print("Error: Repository is dirty.  Aborted.")
            os.exit(1)
        else
            print("Repository is clean")
            return f(x)
        end
    end 
end

-- tag = only_if_clean(tag)
target_list.tag.pre = only_if_clean(target_list.tag.pre)

function update_tag(file,content,tagname,tagdate)
    -- TeX dates are in yyyy/mm/dd format.  tagdate is in yyyy-mm-dd format.
    tagdate_tex = string.gsub(tagdate,'-','/')
    if string.match(file, "%.dtx$") then
        content = string.gsub(content,
            "\n\\ProvidesPackage{" .. module .. "}%[%d%d%d%d/%d%d/%d%d v.- ",
            "\n\\ProvidesPackage{" .. module .. "}[" .. tagdate_tex .. " " .. tagname .. " "
    )
        content = string.gsub(content,
            "\n%% \\changes{unreleased}",
            "\n%% \\changes{" .. tagname .. "}"
        )
        return content
    end
end


function tag_hook(tagname,tagdate)
    -- handle version control
    os.execute("git add .")
    os.execute("git commit -m \"Log changes for version " .. tagname .. "\"")
    return os.execute("git tag -a -m \"Tag version " .. tagname .. "\" " .. tagname)
end


kpse.set_program_name("texlua")
if not release_date then
   dofile(kpse.lookup("l3build.lua"))
end
