local setup, comment = pcall(require, "Comment")
if not setup then
    print("Comment not found.")
    return
end

comment.setup()
