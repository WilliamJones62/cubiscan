class ScanListsController < ApplicationController
  def new
    partmstr = Partmstr.find_by part_code: $part_code
    if partmstr.blank?
      #should never get here
      redirect_to new_scan_lists_path, notice: 'Part not in Partmstr'
    end
    @part_code = partmstr.part_code
    @part_desc = partmstr.part_desc
    @uom = partmstr.uom
    @scanlist = ScanList.new
  end

  def create
    @scanlist = ScanList.new
    @scanlist.part_code = $part_code
    respond_to do |format|
      if @scanlist.save
        format.html { redirect_to scan_lists_search_path, notice: 'Record was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def find
    @scanlist = ScanList.find_by part_code: params[:part_code].upcase
    if !@scanlist.blank?
      redirect_to scan_lists_search_path, notice: 'Part already scanned'
    else
      $part_code = params[:part_code].upcase
      redirect_to action: "new"
    end
  end

end
