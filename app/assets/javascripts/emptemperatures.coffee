$ ->
  $('#emptemperatures-datatable').dataTable
    destroy: true
    processing: true
    serverSide: true
    language: {
        url: 'https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json'
    }
    ajax:
      url: $('#emptemperatures-datatable').data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'done_by'}
      {data: 'day_and_time'}
      {data: 'full_name'}
      {data: 'phone'}
      {data: 'adress'}
      {data: 'temperature'}
      {data: 'symptoms'}
      {data: 'links'}
    ]
  

