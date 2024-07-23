class AsignStoreJob < ApplicationJob
  queue_as :default

  def perform(repair_request_id)
    # Do something later
    request = RepairRequest.find(repair_request_id)
    available_stores = Store.joins(:categories).where(categories: { name: request.product_category })
    if request.repair_status == 'Pending'
      request.update(store_id: get_next_id(available_stores, request.store_id))
      puts 'Another store is going to attend this repair request'
    else
      puts 'The status of this request has been updated'
    end
  end

  def get_next_id(arr, search_id)
    if arr.last.id == search_id
      result_id = arr.last.id
    else
      arr.each_with_index do |elem, index|
        if elem.id == search_id && elem != arr.last.id
         result_id = arr[index + 1].id
        end
      end
    end
    result_id
  end
end
