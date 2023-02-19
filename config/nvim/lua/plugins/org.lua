local status, orgmode = pcall(require, "orgmode")
if not status then
	print("orgmode error")
	return
end

orgmode.setup_ts_grammar()
orgmode.setup({
	org_agenda_files = { "~/zk-notes/org/**/*" },
	org_default_notes_file = "~/zk-notes/org",
})
