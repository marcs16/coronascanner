$ ->
  $('#temperatures-datatable').dataTable
    destroy: true
    processing: true
    serverSide: true
    language: {
        url: 'https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json'
    }
    ajax:
      url: $('#temperatures-datatable').data('source')
    pagingType: 'full_numbers'
    columns: [
      {data: 'checked_by'}
      {data: 'full_name'}
      {data: 'address'}
      {data: 'phone'}
      {data: 'temperature'}
      {data: 'status'}
      {data: 'checked_at'}
      {data: 'links'}
    ]
  

