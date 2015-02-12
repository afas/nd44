#encoding: utf-8
class House < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  default_scope { order('address') }

  FILE_NAME = "houses"
  ROW_DATA_BEGIN = 2
  NUMBERPP = 1
  HOUSE_ADDRESS = 2
  YEARBUILT = 3
  WALLMATERIAL = 4
  ROOFINGMATERIAL = 5
  NUMBEROFSTOREYS = 6
  NUMBEROFENTRANCES = 7
  NUMBEROFAPARTMENTS = 8
  TYPEOFOVERLAP = 9
  NUMBEROFLIFTS = 10
  TOTALUSABLEAREA = 11
  LIVINGSPACE = 12
  NONRESIDENTIALAREA = 13
  PLOTAREA = 14
  AREAOFTERRITORY = 15
  INVENTORYNUMBER = 16
  CADASTRALPARCELNUMBER = 17
  ROOFAREA = 18
  THEAREAOFTHEBASEMENT = 19
  AREAOFCOMMONAREAS = 20
  CHUTE = 21
  HEATINGSYSTEM = 22
  HEATINGSYSTEMSERVICEPROVIDER = 23
  HOTWATERSUPPLY = 24
  HOTWATERSUPPLYSERVICEPROVIDER = 25
  ELECTRICPOWERSUPPLY = 26
  ELECTRICPOWERSUPPLYSERVICEPROVIDER = 27
  GASSUPPLY = 28
  GASSUPPLYSERVICEPROVIDER = 29
  COLDWATER = 30
  COLDWATERSERVICEPROVIDER = 31
  WASTEWATER = 32
  WASTEWATERSERVICEPROVIDER = 33
  INFORMATIONABOUTSUPPLIERSANDTARIFFSFORUTILITIES = 34
  INFORMATIONABOUTTHECOSTOFWORKPERFORMED = 35
  INFORMATIONABOUTTHEMEANSTOOVERHAUL = 36
  INFORMATIONONCONDUCTINGMEETINGS = 37
  TARIFFS = 38
  CONTRACTSFORTHEUSEOFCOMMONPROPERTY = 39

  def self.load_from_xlsx
    House.delete_all
    
    table_houses = Roo::Excelx.new("public/#{FILE_NAME}.xlsx")
    row_num = ROW_DATA_BEGIN
    max_row_num = table_houses.last_row
    loop do

      attr_address = 'Кострома, ' + table_houses.cell(row_num, HOUSE_ADDRESS)
      attr_info = ''
      attr_info += "<b>#{I18n.t('house_attribute.yearbuilt')}:</b> #{table_houses.cell(row_num, YEARBUILT)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.wallmaterial')}:</b> #{table_houses.cell(row_num, WALLMATERIAL)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.roofingmaterial')}:</b> #{table_houses.cell(row_num, ROOFINGMATERIAL)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.numberofstoreys')}:</b> #{table_houses.cell(row_num, NUMBEROFSTOREYS)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.numberofentrances')}:</b> #{table_houses.cell(row_num, NUMBEROFENTRANCES)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.numberofapartments')}:</b> #{table_houses.cell(row_num, NUMBEROFAPARTMENTS)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.typeofoverlap')}:</b> #{table_houses.cell(row_num, TYPEOFOVERLAP)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.numberoflifts')}:</b> #{table_houses.cell(row_num, NUMBEROFLIFTS)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.totalusablearea')}:</b> #{table_houses.cell(row_num, TOTALUSABLEAREA)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.livingspace')}:</b> #{table_houses.cell(row_num, LIVINGSPACE)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.nonresidentialarea')}:</b> #{table_houses.cell(row_num, NONRESIDENTIALAREA)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.plotarea')}:</b> #{table_houses.cell(row_num, PLOTAREA)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.areaofterritory')}:</b> #{table_houses.cell(row_num, AREAOFTERRITORY)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.inventorynumber')}:</b> #{table_houses.cell(row_num, INVENTORYNUMBER)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.cadastralparcelnumber')}:</b> #{table_houses.cell(row_num, CADASTRALPARCELNUMBER)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.roofarea')}:</b> #{table_houses.cell(row_num, ROOFAREA)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.theareaofthebasement')}:</b> #{table_houses.cell(row_num, THEAREAOFTHEBASEMENT)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.areaofcommonareas')}:</b> #{table_houses.cell(row_num, AREAOFCOMMONAREAS)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.chute')}:</b> #{table_houses.cell(row_num, CHUTE)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.heatingsystem')}:</b> #{table_houses.cell(row_num, HEATINGSYSTEM)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.heatingsystemserviceprovider')}:</b> #{table_houses.cell(row_num, HEATINGSYSTEMSERVICEPROVIDER)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.hotwatersupply')}:</b> #{table_houses.cell(row_num, HOTWATERSUPPLY)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.hotwatersupplyserviceprovider')}:</b> #{table_houses.cell(row_num, HOTWATERSUPPLYSERVICEPROVIDER)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.electricpowersupply')}:</b> #{table_houses.cell(row_num, ELECTRICPOWERSUPPLY)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.electricpowersupplyserviceprovider')}:</b> #{table_houses.cell(row_num, ELECTRICPOWERSUPPLYSERVICEPROVIDER)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.gassupply')}:</b> #{table_houses.cell(row_num, GASSUPPLY)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.gassupplyserviceprovider')}:</b> #{table_houses.cell(row_num, GASSUPPLYSERVICEPROVIDER)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.coldwater')}:</b> #{table_houses.cell(row_num, COLDWATER)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.coldwaterserviceprovider')}:</b> #{table_houses.cell(row_num, COLDWATERSERVICEPROVIDER)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.wastewater')}:</b> #{table_houses.cell(row_num, WASTEWATER)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.wastewaterserviceprovider')}:</b> #{table_houses.cell(row_num, WASTEWATERSERVICEPROVIDER)}<br/>"
      attr_info += "<b>#{I18n.t('house_attribute.informationaboutsuppliersandtariffsforutilities')}:</b> <a target='_blank' href='#{table_houses.cell(row_num, INFORMATIONABOUTSUPPLIERSANDTARIFFSFORUTILITIES)}'>смотреть/скачать</a><br/>"
      attr_info += "<b>#{I18n.t('house_attribute.informationaboutthecostofworkperformed')}:</b> <a target='_blank' href='#{table_houses.cell(row_num, INFORMATIONABOUTTHECOSTOFWORKPERFORMED)}'>смотреть/скачать</a><br/>"
      attr_info += "<b>#{I18n.t('house_attribute.informationaboutthemeanstooverhaul')}:</b> <a target='_blank' href='#{table_houses.cell(row_num, INFORMATIONABOUTTHEMEANSTOOVERHAUL)}'>смотреть/скачать</a><br/>"
      attr_info += "<b>#{I18n.t('house_attribute.informationonconductingmeetings')}:</b> <a target='_blank' href='#{table_houses.cell(row_num, INFORMATIONONCONDUCTINGMEETINGS)}'>смотреть/скачать</a><br/>"
      attr_info += "<b>#{I18n.t('house_attribute.tariffs')}:</b> <a target='_blank' href='#{table_houses.cell(row_num, TARIFFS)}'>смотреть/скачать</a><br/>"
      attr_info += "<b>#{I18n.t('house_attribute.contractsfortheuseofcommonproperty')}:</b> <a target='_blank' href='#{table_houses.cell(row_num, CONTRACTSFORTHEUSEOFCOMMONPROPERTY)}'>смотреть/скачать</a>"

      House.create(address: attr_address, info: attr_info)

      sleep 2

      if row_num >= max_row_num
        break
      else
        row_num += 1
      end
    end
  end


end
