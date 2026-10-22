-- Vim's default 'comments' contains "mb:*" (middle of a C comment), so with
-- formatoptions r/o every org headline ("* ...") gets continued with "* " on
-- Enter. Org only has "# " comments; "fb:-" keeps continuation lines of a
-- "- " list item aligned under its text.
vim.opt_local.comments = "b:#,fb:-"
