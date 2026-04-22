def bubble_sort(items)
  last_sorted_index = nil
  while last_sorted_index == nil || last_sorted_index > 0
    last_to_check = (last_sorted_index == nil ? items.length : last_sorted_index) - 1
    for i in 0...last_to_check
      if items[i] > items[i + 1]
        temp = items[i]
        items[i] = items[i + 1]
        items[i + 1] = temp
      end
    end
    last_sorted_index = last_to_check
  end
  items
end
