create procedure crudPrestamoProducto
  @operacion char(2),
  @idProducto int,
  @idPrestamo int,
  @nombreProducto varchar(20),
  @descripcion varchar(100),
  @estadoProducto char(1),
  @moneda int,
  @FechaFinaliza datetime,
  @monto money,
  @estadoPrestamo char(1)

as
begin
  if @operacion = 'CA'
  begin
	  insert into Producto 
	  values (@nombreProducto,@descripcion,'A')
  end
  if @operacion = 'RA'
  begin
  select id as 'Codigo Producto', nombre as 'Nombre', descripcion as 'Desc. Producto' from Producto
  end
  if @operacion = 'UA'
  begin
	  update Producto 
	  set nombre=@nombreProducto, descripcion=@descripcion
	  where id=@idProducto
  end
  if @operacion = 'DA'
  begin
	  update Producto
	  set estado = 'I'
    where id=@idProducto
  end
  begin
  if @operacion = 'CB'
  begin
	  insert into Prestamo 
	  values (@idProducto,@moneda,GETDATE(),@FechaFinaliza,@monto,@monto,'A')
  end
  if @operacion = 'RB'
  begin
  select idProducto = 'Tipo Producto', moneda as 'Moneda', FechaCrea as 'Fecha Creaciòn', FechaFinaliza as 'Fecha Finaliza', case when estado = 'A' then 'Activo' else 'Inactivo' end as 'Estado Prestamo'
  from Prestamo
  end
  if @operacion = 'UB'
  begin
	  update Prestamo 
	  set montoPendiente=monto-@monto
	  where id=@idPrestamo
  end
  if @operacion = 'DB'
  begin
	  update Prestamo 
	  set estado=@estadoPrestamo
	  where id=@idPrestamo
  end
end
end
