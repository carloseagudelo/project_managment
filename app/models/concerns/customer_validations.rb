module CustomerValidations

  # Metodo que valida la unicidad de cliente
  def validate_unique_customer
    if Customer.select(:name).where(name: name).count > 0
      errors.add(:name, 'YA EXISTE EL CLIENTE')
    end
  end

  # Metodo que valida el tamaño del nombre
  def validate_size_name
  	if name.length > 250
  	  errors.add(:name, 'EL NOMBRE CONTIENE MAS DE LA CANTIDAD DE CARACTERES PERMITIDOS')
  	end
  end

  # Metodo que valida el tamaño de la descripcion
  def validate_size_description
  	if description.length > 250
  	  errors.add(:description, 'LA DESCRIPCIÓN CONTIENE MAS DE LOS CARACTERES PERMITIDOS')
  	end
  end

end