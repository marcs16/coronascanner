class TemperatureDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      checked_by:     { source: 'Temperature.checked_by', cond: :like, searchable: true, orderable: true },
      full_name:        { source: 'Temperature.full_name', cond: :like, searchable: true, orderable: true },
      address:         { source: 'Temperature.address', searchable: false, orderable: true },
      phone:    { source: 'Temperature.phone', searchable: false, orderable: true },
      temperature:  {source: 'Temperature.temperature',searchable:false, orderable: true},
      status:        { source: 'Temperature.status', cond: :like, searchable: false, orderable: true },
      checked_at:         { source: 'Temperature.checked_at', searchable: false, orderable: true },
    }
  end

  def data
    records.map do |record|
      {
        checked_by: record.checked_by,
        full_name: record.full_name,
        address: record.address,
        phone: record.phone,
        temperature: record.temperature,
        status: record.status,
        checked_at: record.checked_at,
        links: actions(record).html_safe
      }
    end
  end

  def get_raw_records
    Temperature.all
         
  end

  private 
  def actions(record)
    sarta =  "<a href ='#{options[:edit].gsub('_',record.id.to_s)}'> <i class='fa fa-edit'></i></a>"
  end

end
