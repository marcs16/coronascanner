class EmptemperatureDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      done_by:      { source: 'Emptemperature.done_by', cond: :like, searchable: true, orderable: true },
      day_and_time:        { source: 'Emptemperature.day_and_time', cond: :like, searchable: true, orderable: true },
      full_name:         { source: 'Emptemperature.full_name', searchable: true, orderable: true },
      phone:    { source: 'Emptemperature.phone', searchable: true, orderable: true },
      adress:  {source: 'Emptemperature.adress',searchable: true, orderable: true},
      temperature:       { source: 'Emptemperature.temperature', cond: :like, searchable: true, orderable: true },
      symptoms:         { source: 'Emptemperature.symptoms', searchable: false, orderable: true },
    }
  end

 
  
  

  def data
    records.map do |record|
      {
        done_by: record.done_by,
        day_and_time: record.day_and_time,
        full_name: record.full_name,
        phone: record.phone,
        adress: record.adress,
        temperature: record.temperature,
        symptoms: symptoms_format(record.symptoms),
        links: actions(record).html_safe
      }
    end
  end

  def get_raw_records
    Emptemperature.all  
  end
  def symptoms_format(record_symptoms)
    symptoms1 = JSON.parse(record_symptoms)
    symptoms = symptoms1.reject(&:empty?).join(", ")
    return symptoms
  end

  private 
  def actions(record)
    sarta = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp"
    sarta +=  " <a href ='#{options[:show].gsub('_',record.id.to_s)}'><i class='fa fa-eye'></i></a>"
  end

end
