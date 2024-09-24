---
-- nvim-cmp (autocomplete setup)
---

local cmp = require("cmp")
local luasnip = require("luasnip")
local select_opts = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	formatting = {
		fields = { "menu", "abbr", "kind" },
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = "λ",
				luasnip = "⋗",
				buffer = "Ω",
				path = "🖫",
			}

			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
	mapping = {
		["<Up>"] = cmp.mapping.select_prev_item(select_opts),
		["<Down>"] = cmp.mapping.select_next_item(select_opts),
		["<C-p>"] = cmp.mapping.select_prev_item(select_opts),
		["<C-n>"] = cmp.mapping.select_next_item(select_opts),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-f>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-b>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
})

---
-- LSP Configuration using nvim-lspconfig
---

local lspconfig = require("lspconfig")

-- Extend LSP capabilities for nvim-cmp
local lsp_defaults = lspconfig.util.default_config
lsp_defaults.capabilities =
vim.tbl_deep_extend("force", lsp_defaults.capabilities, require("cmp_nvim_lsp").default_capabilities())

---
-- Custom Diagnostic Sign and Configurations
---

local sign = function(opts)
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		text = opts.text,
		numhl = "",
	})
end

sign({ name = "DiagnosticSignError", text = "✘" })
sign({ name = "DiagnosticSignWarn", text = "▲" })
sign({ name = "DiagnosticSignHint", text = "⚑" })
sign({ name = "DiagnosticSignInfo", text = "»" })

vim.diagnostic.config({
	virtual_text = true,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

---
-- LSP Keybindings on LSP Attach
---

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function()
		local bufmap = function(mode, lhs, rhs)
			local opts = { buffer = true }
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>") -- show documentation
		bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>") -- go to definition
		bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>") -- go to declaration
		bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>") -- go to implementation
		bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>") -- go to references
		bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>") -- show diagnostics
		bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>") -- go to previous diagnostic
		bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>") -- go to next diagnostic
	end,
})

---
-- LSP servers using Mason and LSPConfig
---

-- Setup Mason for managing LSP servers
require("mason").setup({
	ui = { border = "rounded" },
})

-- Setup Mason-LSPConfig for automatic LSP server installation
require("mason-lspconfig").setup({
	handlers = {
		function(server)
			lspconfig[server].setup({})
		end,
		["ts_ls"] = function()
			lspconfig.ts_ls.setup({
				settings = {
					completions = {
						completeFunctionCalls = true,
					},
				},
			})
		end,
	},
})
-- Setup lspkind to show icons in completion
require('lspkind').init({
  mode = 'symbol_text', -- Show symbol and text
  preset = 'default',   -- Use default icon set
})
