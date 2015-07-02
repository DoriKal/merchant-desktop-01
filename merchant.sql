-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-07-2015 a las 20:52:00
-- Versión del servidor: 5.6.21-log
-- Versión de PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `merchant`
--
CREATE DATABASE IF NOT EXISTS `merchant` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `merchant`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `sprGetUserPassword`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sprGetUserPassword`(IN userName VARCHAR(45),IN userPassword varchar(50))
BEGIN
 
		SELECT CONCAT(e.nombreEmpleado," ",e.apellidosEmpleado) AS 'usuario',u.passwordUsuario AS 'contrasenia', te.tipoEmpleado AS 'tipo',e.mailEmpleado AS 'email',s.nombreSucursal AS 'sucursal'
		FROM ((usuario u INNER JOIN empleado e ON u.idUsuario=e.usuario_idUsuario)INNER JOIN tipoempleado te ON e.tipoEmpleado_idtipoEmpleado=te.idtipoEmpleado)INNER JOIN sucursal s ON e.sucursal_idSucursal=s.idSucursal
		WHERE u.nombreUsuario = userName AND u.passwordUsuario = userPassword AND e.statusEmpleado = 1 AND u.statusUsuario = 1;


END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
`idCliente` int(11) NOT NULL,
  `rfcCliente` varchar(15) NOT NULL,
  `nombreCliente` varchar(145) NOT NULL,
  `telCliente` varchar(15) NOT NULL,
  `tel2Cliente` varchar(15) DEFAULT NULL,
  `mailCliente` varchar(45) NOT NULL,
  `altaCliente` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `statusCliente` tinyint(4) DEFAULT NULL,
  `domicilioFiscal_idDomicilioFiscal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

DROP TABLE IF EXISTS `compra`;
CREATE TABLE IF NOT EXISTS `compra` (
`idCompra` int(11) NOT NULL,
  `fechaCompra` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `totalCompra` float NOT NULL,
  `tipoPagoCompra` varchar(10) NOT NULL,
  `statusCompra` varchar(10) NOT NULL,
  `statusLiquidezCompra` tinyint(4) NOT NULL,
  `fechaPagoLimiteCompra` date DEFAULT NULL,
  `numeroPagos` int(11) DEFAULT NULL,
  `proveedor_idProveedor` int(11) NOT NULL,
  `empleado_idEmpleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecompra`
--

DROP TABLE IF EXISTS `detallecompra`;
CREATE TABLE IF NOT EXISTS `detallecompra` (
  `producto_idCodigoBarraProducto` varchar(20) NOT NULL,
  `compra_idCompra` int(11) NOT NULL,
  `costoUnitarioProducto` float DEFAULT NULL,
  `cantidad` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleproducto`
--

DROP TABLE IF EXISTS `detalleproducto`;
CREATE TABLE IF NOT EXISTS `detalleproducto` (
  `proveedor_idProveedor` int(11) NOT NULL,
  `producto_idCodigoBarraProducto` varchar(20) NOT NULL,
  `precioCompra` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

DROP TABLE IF EXISTS `detalleventa`;
CREATE TABLE IF NOT EXISTS `detalleventa` (
  `producto_idCodigoBarraProducto` varchar(20) NOT NULL,
  `venta_idVenta` int(11) NOT NULL,
  `cantidad` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domiciliofiscal`
--

DROP TABLE IF EXISTS `domiciliofiscal`;
CREATE TABLE IF NOT EXISTS `domiciliofiscal` (
`idDomicilioFiscal` int(11) NOT NULL,
  `calle` varchar(45) NOT NULL,
  `numExt` varchar(45) DEFAULT NULL,
  `numInt` varchar(5) DEFAULT NULL,
  `colonia` varchar(45) DEFAULT NULL,
  `codigoPostal` varchar(45) DEFAULT NULL,
  `localidad` varchar(45) DEFAULT NULL,
  `municipio` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `domiciliofiscal`
--

INSERT INTO `domiciliofiscal` (`idDomicilioFiscal`, `calle`, `numExt`, `numInt`, `colonia`, `codigoPostal`, `localidad`, `municipio`, `estado`, `pais`) VALUES
(1, 'Av. Principal', '1903', '10', 'Zona Industrial Mercantil', '91000', 'Distrito Federal', 'Distrito Federal', 'México', 'México'),
(2, 'Diana Laura ', '19', NULL, '23 de Marzo', '91153', 'Xalapa', 'Xalapa', 'Veracruz', 'Mexico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
`idEmpleado` int(11) NOT NULL,
  `rfcEmpleado` varchar(25) NOT NULL,
  `tipoEmpleado_idtipoEmpleado` int(2) NOT NULL,
  `nombreEmpleado` varchar(45) NOT NULL,
  `apellidosEmpleado` varchar(60) NOT NULL,
  `telefonoEmpleado` varchar(45) DEFAULT NULL,
  `mailEmpleado` varchar(45) DEFAULT NULL,
  `salarioDiarioEmpleado` float NOT NULL DEFAULT '0',
  `diasLaboralesEmpleado` int(11) DEFAULT NULL,
  `altaEmpleado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario_idUsuario` int(11) NOT NULL,
  `domicilioFiscal_idDomicilioFiscal` int(11) NOT NULL,
  `sucursal_idSucursal` int(11) NOT NULL,
  `bajaEmpleado` timestamp NULL DEFAULT NULL,
  `statusEmpleado` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `rfcEmpleado`, `tipoEmpleado_idtipoEmpleado`, `nombreEmpleado`, `apellidosEmpleado`, `telefonoEmpleado`, `mailEmpleado`, `salarioDiarioEmpleado`, `diasLaboralesEmpleado`, `altaEmpleado`, `usuario_idUsuario`, `domicilioFiscal_idDomicilioFiscal`, `sucursal_idSucursal`, `bajaEmpleado`, `statusEmpleado`) VALUES
(1, '', 1, 'Eleazar', 'Fernández Ramírez', '2288462124', 'evi_skorpion@hotmail.com', 0, NULL, '2015-06-29 05:00:00', 1, 2, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
`idEmpresa` int(11) NOT NULL,
  `nombreEmpresa` varchar(45) NOT NULL,
  `rfcEmpresa` varchar(15) NOT NULL,
  `logoEmpresa` varchar(45) DEFAULT NULL,
  `telEmpresa` varchar(15) DEFAULT NULL,
  `tel2Empresa` varchar(15) DEFAULT NULL,
  `mailEmpresa` varchar(45) DEFAULT NULL,
  `webEmpresa` varchar(45) DEFAULT NULL,
  `altaEmpresa` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `regimenFiscal_idregimenFiscal` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`idEmpresa`, `nombreEmpresa`, `rfcEmpresa`, `logoEmpresa`, `telEmpresa`, `tel2Empresa`, `mailEmpresa`, `webEmpresa`, `altaEmpresa`, `regimenFiscal_idregimenFiscal`) VALUES
(1, 'Empresa Merchant', 'FERERAOR1993', NULL, '2288462124', '2282023056', 'ferandbet@gmail.com', 'http://www.merchant.com', '2015-06-29 20:57:48', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impuesto`
--

DROP TABLE IF EXISTS `impuesto`;
CREATE TABLE IF NOT EXISTS `impuesto` (
`idImpuesto` int(2) NOT NULL,
  `codigoImpuesto` varchar(8) DEFAULT NULL,
  `descripcionImpuesto` varchar(50) DEFAULT NULL,
  `valorImpuesto` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea`
--

DROP TABLE IF EXISTS `linea`;
CREATE TABLE IF NOT EXISTS `linea` (
`idLinea` int(2) NOT NULL,
  `codigoLinea` varchar(8) DEFAULT NULL,
  `descripcionLinea` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagoscompra`
--

DROP TABLE IF EXISTS `pagoscompra`;
CREATE TABLE IF NOT EXISTS `pagoscompra` (
`idPagosCompra` int(11) NOT NULL,
  `montoPago` varchar(45) DEFAULT NULL,
  `fechaPagoCompra` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `compra_idCompra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `idCodigoBarraProducto` varchar(20) NOT NULL,
  `descripcionProducto` varchar(95) DEFAULT NULL,
  `existenciaProducto` float NOT NULL,
  `stockMinimoProducto` float NOT NULL,
  `precioVenta` float NOT NULL,
  `tipoUnidad_idtipoUnidad` int(2) NOT NULL,
  `impuesto_idImpuesto` int(2) NOT NULL,
  `statusProducto` tinyint(4) DEFAULT NULL,
  `linea_idLinea` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE IF NOT EXISTS `proveedor` (
`idProveedor` int(11) NOT NULL,
  `rfcProveedor` varchar(15) NOT NULL,
  `nombreProveedor` varchar(45) NOT NULL,
  `telProveedor` varchar(15) DEFAULT NULL,
  `tel2Proveedor` varchar(15) DEFAULT NULL,
  `mailProveedor` varchar(45) DEFAULT NULL,
  `domicilioFiscal_idDomicilioFiscal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regimenfiscal`
--

DROP TABLE IF EXISTS `regimenfiscal`;
CREATE TABLE IF NOT EXISTS `regimenfiscal` (
`idregimenFiscal` int(11) NOT NULL,
  `descripcionRegimenFiscal` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `regimenfiscal`
--

INSERT INTO `regimenfiscal` (`idregimenFiscal`, `descripcionRegimenFiscal`) VALUES
(1, 'Régimen de Incorporación Fiscal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
CREATE TABLE IF NOT EXISTS `sucursal` (
`idSucursal` int(11) NOT NULL,
  `nombreSucursal` varchar(45) DEFAULT NULL,
  `empresa_idEmpresa` int(11) NOT NULL,
  `domiciliofiscal_idDomicilioFiscal` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`idSucursal`, `nombreSucursal`, `empresa_idEmpresa`, `domiciliofiscal_idDomicilioFiscal`) VALUES
(1, 'Sucursal Principal', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocomprobante`
--

DROP TABLE IF EXISTS `tipocomprobante`;
CREATE TABLE IF NOT EXISTS `tipocomprobante` (
`idTipoComprobante` int(2) NOT NULL,
  `codigoTipo` varchar(8) DEFAULT NULL,
  `descripcionComprobante` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoempleado`
--

DROP TABLE IF EXISTS `tipoempleado`;
CREATE TABLE IF NOT EXISTS `tipoempleado` (
`idtipoEmpleado` int(2) NOT NULL,
  `tipoEmpleado` varchar(25) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoempleado`
--

INSERT INTO `tipoempleado` (`idtipoEmpleado`, `tipoEmpleado`) VALUES
(1, 'Administrador'),
(2, 'Contador'),
(3, 'Recursos Humanos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipounidad`
--

DROP TABLE IF EXISTS `tipounidad`;
CREATE TABLE IF NOT EXISTS `tipounidad` (
`idtipoUnidad` int(2) NOT NULL,
  `codigoUnidad` varchar(8) DEFAULT NULL,
  `descripcionUnidad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
`idUsuario` int(11) NOT NULL,
  `nombreUsuario` varchar(45) NOT NULL,
  `passwordUsuario` varchar(45) NOT NULL,
  `statusUsuario` tinyint(4) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nombreUsuario`, `passwordUsuario`, `statusUsuario`) VALUES
(1, 'admin', 'admin', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

DROP TABLE IF EXISTS `venta`;
CREATE TABLE IF NOT EXISTS `venta` (
`idVenta` int(11) NOT NULL,
  `fechaVenta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `subTotalVenta` float NOT NULL,
  `ivaVenta` float NOT NULL,
  `totalVenta` float NOT NULL,
  `estatusVenta` varchar(10) NOT NULL,
  `tipoVenta` varchar(10) DEFAULT NULL,
  `cliente_idCliente` int(11) NOT NULL,
  `empleado_idEmpleado` int(11) NOT NULL,
  `tipoComprobante_idTipoComprobante` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
 ADD PRIMARY KEY (`idCliente`), ADD KEY `fk_cliente_domicilioFiscal1_idx` (`domicilioFiscal_idDomicilioFiscal`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
 ADD PRIMARY KEY (`idCompra`), ADD KEY `fk_compra_proveedor1_idx` (`proveedor_idProveedor`), ADD KEY `fk_compra_empleado1_idx` (`empleado_idEmpleado`);

--
-- Indices de la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
 ADD PRIMARY KEY (`producto_idCodigoBarraProducto`,`compra_idCompra`), ADD KEY `fk_producto_has_compra_compra1_idx` (`compra_idCompra`), ADD KEY `fk_producto_has_compra_producto1_idx` (`producto_idCodigoBarraProducto`);

--
-- Indices de la tabla `detalleproducto`
--
ALTER TABLE `detalleproducto`
 ADD PRIMARY KEY (`proveedor_idProveedor`,`producto_idCodigoBarraProducto`), ADD KEY `fk_proveedor_has_producto_producto1_idx` (`producto_idCodigoBarraProducto`), ADD KEY `fk_proveedor_has_producto_proveedor1_idx` (`proveedor_idProveedor`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
 ADD PRIMARY KEY (`producto_idCodigoBarraProducto`,`venta_idVenta`), ADD KEY `fk_venta_has_producto_producto1_idx` (`producto_idCodigoBarraProducto`), ADD KEY `fk_venta_has_producto_venta1_idx` (`venta_idVenta`);

--
-- Indices de la tabla `domiciliofiscal`
--
ALTER TABLE `domiciliofiscal`
 ADD PRIMARY KEY (`idDomicilioFiscal`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
 ADD PRIMARY KEY (`idEmpleado`,`sucursal_idSucursal`), ADD KEY `fk_empleado_usuario1_idx` (`usuario_idUsuario`), ADD KEY `fk_empleado_domicilioFiscal1_idx` (`domicilioFiscal_idDomicilioFiscal`), ADD KEY `fk_empleado_sucursal1_idx` (`sucursal_idSucursal`), ADD KEY `fk_empleado_tipoEmpleado1_idx` (`tipoEmpleado_idtipoEmpleado`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
 ADD PRIMARY KEY (`idEmpresa`,`regimenFiscal_idregimenFiscal`), ADD KEY `fk_empresa_regimenFiscal1_idx` (`regimenFiscal_idregimenFiscal`);

--
-- Indices de la tabla `impuesto`
--
ALTER TABLE `impuesto`
 ADD PRIMARY KEY (`idImpuesto`);

--
-- Indices de la tabla `linea`
--
ALTER TABLE `linea`
 ADD PRIMARY KEY (`idLinea`);

--
-- Indices de la tabla `pagoscompra`
--
ALTER TABLE `pagoscompra`
 ADD PRIMARY KEY (`idPagosCompra`,`compra_idCompra`), ADD KEY `fk_pagosCompra_compra1_idx` (`compra_idCompra`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
 ADD PRIMARY KEY (`idCodigoBarraProducto`,`tipoUnidad_idtipoUnidad`,`impuesto_idImpuesto`,`linea_idLinea`), ADD KEY `fk_producto_tipoUnidad1_idx` (`tipoUnidad_idtipoUnidad`), ADD KEY `fk_producto_impuesto1_idx` (`impuesto_idImpuesto`), ADD KEY `fk_producto_linea1_idx` (`linea_idLinea`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
 ADD PRIMARY KEY (`idProveedor`), ADD KEY `fk_proveedor_domicilioFiscal1_idx` (`domicilioFiscal_idDomicilioFiscal`);

--
-- Indices de la tabla `regimenfiscal`
--
ALTER TABLE `regimenfiscal`
 ADD PRIMARY KEY (`idregimenFiscal`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
 ADD PRIMARY KEY (`idSucursal`,`empresa_idEmpresa`,`domiciliofiscal_idDomicilioFiscal`), ADD KEY `fk_sucursal_empresa1_idx` (`empresa_idEmpresa`), ADD KEY `fk_sucursal_domiciliofiscal1_idx` (`domiciliofiscal_idDomicilioFiscal`);

--
-- Indices de la tabla `tipocomprobante`
--
ALTER TABLE `tipocomprobante`
 ADD PRIMARY KEY (`idTipoComprobante`);

--
-- Indices de la tabla `tipoempleado`
--
ALTER TABLE `tipoempleado`
 ADD PRIMARY KEY (`idtipoEmpleado`);

--
-- Indices de la tabla `tipounidad`
--
ALTER TABLE `tipounidad`
 ADD PRIMARY KEY (`idtipoUnidad`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
 ADD PRIMARY KEY (`idUsuario`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
 ADD PRIMARY KEY (`idVenta`,`tipoComprobante_idTipoComprobante`), ADD KEY `fk_venta_cliente1_idx` (`cliente_idCliente`), ADD KEY `fk_venta_empleado1_idx` (`empleado_idEmpleado`), ADD KEY `fk_venta_tipoComprobante1_idx` (`tipoComprobante_idTipoComprobante`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
MODIFY `idCompra` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `domiciliofiscal`
--
ALTER TABLE `domiciliofiscal`
MODIFY `idDomicilioFiscal` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
MODIFY `idEmpresa` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `impuesto`
--
ALTER TABLE `impuesto`
MODIFY `idImpuesto` int(2) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `linea`
--
ALTER TABLE `linea`
MODIFY `idLinea` int(2) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pagoscompra`
--
ALTER TABLE `pagoscompra`
MODIFY `idPagosCompra` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `regimenfiscal`
--
ALTER TABLE `regimenfiscal`
MODIFY `idregimenFiscal` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `sucursal`
--
ALTER TABLE `sucursal`
MODIFY `idSucursal` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tipocomprobante`
--
ALTER TABLE `tipocomprobante`
MODIFY `idTipoComprobante` int(2) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tipoempleado`
--
ALTER TABLE `tipoempleado`
MODIFY `idtipoEmpleado` int(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tipounidad`
--
ALTER TABLE `tipounidad`
MODIFY `idtipoUnidad` int(2) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
MODIFY `idVenta` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
ADD CONSTRAINT `fk_cliente_domicilioFiscal1` FOREIGN KEY (`domicilioFiscal_idDomicilioFiscal`) REFERENCES `domiciliofiscal` (`idDomicilioFiscal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
ADD CONSTRAINT `fk_compra_empleado1` FOREIGN KEY (`empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_compra_proveedor1` FOREIGN KEY (`proveedor_idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
ADD CONSTRAINT `fk_producto_has_compra_compra1` FOREIGN KEY (`compra_idCompra`) REFERENCES `compra` (`idCompra`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_producto_has_compra_producto1` FOREIGN KEY (`producto_idCodigoBarraProducto`) REFERENCES `producto` (`idCodigoBarraProducto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalleproducto`
--
ALTER TABLE `detalleproducto`
ADD CONSTRAINT `fk_proveedor_has_producto_producto1` FOREIGN KEY (`producto_idCodigoBarraProducto`) REFERENCES `producto` (`idCodigoBarraProducto`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_proveedor_has_producto_proveedor1` FOREIGN KEY (`proveedor_idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
ADD CONSTRAINT `fk_venta_has_producto_producto1` FOREIGN KEY (`producto_idCodigoBarraProducto`) REFERENCES `producto` (`idCodigoBarraProducto`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_venta_has_producto_venta1` FOREIGN KEY (`venta_idVenta`) REFERENCES `venta` (`idVenta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
ADD CONSTRAINT `fk_empleado_domicilioFiscal1` FOREIGN KEY (`domicilioFiscal_idDomicilioFiscal`) REFERENCES `domiciliofiscal` (`idDomicilioFiscal`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_empleado_sucursal1` FOREIGN KEY (`sucursal_idSucursal`) REFERENCES `sucursal` (`idSucursal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_empleado_tipoEmpleado1` FOREIGN KEY (`tipoEmpleado_idtipoEmpleado`) REFERENCES `tipoempleado` (`idtipoEmpleado`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_empleado_usuario1` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
ADD CONSTRAINT `fk_empresa_regimenFiscal1` FOREIGN KEY (`regimenFiscal_idregimenFiscal`) REFERENCES `regimenfiscal` (`idregimenFiscal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pagoscompra`
--
ALTER TABLE `pagoscompra`
ADD CONSTRAINT `fk_pagosCompra_compra1` FOREIGN KEY (`compra_idCompra`) REFERENCES `compra` (`idCompra`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
ADD CONSTRAINT `fk_producto_impuesto1` FOREIGN KEY (`impuesto_idImpuesto`) REFERENCES `impuesto` (`idImpuesto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_producto_linea1` FOREIGN KEY (`linea_idLinea`) REFERENCES `linea` (`idLinea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_producto_tipoUnidad1` FOREIGN KEY (`tipoUnidad_idtipoUnidad`) REFERENCES `tipounidad` (`idtipoUnidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
ADD CONSTRAINT `fk_proveedor_domicilioFiscal1` FOREIGN KEY (`domicilioFiscal_idDomicilioFiscal`) REFERENCES `domiciliofiscal` (`idDomicilioFiscal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sucursal`
--
ALTER TABLE `sucursal`
ADD CONSTRAINT `fk_sucursal_domiciliofiscal1` FOREIGN KEY (`domiciliofiscal_idDomicilioFiscal`) REFERENCES `domiciliofiscal` (`idDomicilioFiscal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_sucursal_empresa1` FOREIGN KEY (`empresa_idEmpresa`) REFERENCES `empresa` (`idEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
ADD CONSTRAINT `fk_venta_cliente1` FOREIGN KEY (`cliente_idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_venta_empleado1` FOREIGN KEY (`empleado_idEmpleado`) REFERENCES `empleado` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_venta_tipoComprobante1` FOREIGN KEY (`tipoComprobante_idTipoComprobante`) REFERENCES `tipocomprobante` (`idTipoComprobante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
