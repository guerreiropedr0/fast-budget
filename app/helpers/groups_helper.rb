module GroupsHelper
  def group_amount(group)
    total_amount = 0

    group.operations.each do |operation|
      total_amount += operation.amount
    end
    total_amount
  end
end
