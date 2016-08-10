App.spread_sheet_cells = App.cable.subscriptions.create "SpreadSheetCellsChannel",
  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    App.spreadsheet.update_cell(data.new_val)

  set_cell_value: (location, value) ->
    location = [location['r'], location['c']]
    @perform('set_cell_value', location: location, value: value)
