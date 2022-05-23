module OperationsHelper
  def create_groups_operations(operation, array)
    i = 1

    while i < array.length
      group = Group.find_by(id: array[i])
      operation.groups << group
      i += 1
    end
  end
end
