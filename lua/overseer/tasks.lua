local overseer = require("overseer")
overseer.setup({
    strategy = "jobstart",
    templates = { "builtin" },
})

local task = overseer.new_task({
    name = "Echo Test",
    strategy = {
        "orchestrator",
        tasks = {
            {
                "shell",
                cmd = "echo 1 &&\
            echo 2 &&\
            echo 3",
            },
        },
    },
})
