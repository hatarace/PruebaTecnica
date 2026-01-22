create procedure crudClientes
  @operacion char(1),
  @idCliente int,
  @primerNombre varchar(25),
  @segundoNombre varchar(25),
  @tercerNombre varchar(25),
  @PrimerApellido varchar(25),
  @SegundoApellido varchar(25),
  @ApellidoCasada varchar(25),
  @FechaNacimiento datetime,
  @EstadoCivil char(1),
  @Domicilio varchar(200)
as 
begin
  if @operacion = 'C'
  begin
	  insert into Cliente 
	  values (@primerNombre,@segundoNombre,@tercerNombre,@PrimerApellido,@SegundoApellido,@ApellidoCasada,@FechaNacimiento,@EstadoCivil,@Domicilio)
  end
  if @operacion = 'R'
  begin
  select * from Cliente
  end
  if @operacion = 'U'
  begin
	  update Cliente 
	  set primerNombre=@primerNombre,segundoNombre=@segundoNombre,tercerNombre=@tercerNombre,PrimerApellido=@PrimerApellido,SegundoApellido=@SegundoApellido,ApellidoCasada=@ApellidoCasada,FechaNacimiento=@FechaNacimiento,EstadoCivil=@EstadoCivil,Domicilio=@Domicilio
	  where id=@idCliente
  end
  if @operacion = 'D'
  begin
	  delete from Cliente
	  where id=@idCliente
  end
end
