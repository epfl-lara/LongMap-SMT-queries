; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20138 () Bool)

(assert start!20138)

(declare-fun b_free!4797 () Bool)

(declare-fun b_next!4797 () Bool)

(assert (=> start!20138 (= b_free!4797 (not b_next!4797))))

(declare-fun tp!17423 () Bool)

(declare-fun b_and!11543 () Bool)

(assert (=> start!20138 (= tp!17423 b_and!11543)))

(declare-fun res!93437 () Bool)

(declare-fun e!129959 () Bool)

(assert (=> start!20138 (=> (not res!93437) (not e!129959))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20138 (= res!93437 (validMask!0 mask!1149))))

(assert (=> start!20138 e!129959))

(declare-datatypes ((V!5851 0))(
  ( (V!5852 (val!2371 Int)) )
))
(declare-datatypes ((ValueCell!1983 0))(
  ( (ValueCellFull!1983 (v!4341 V!5851)) (EmptyCell!1983) )
))
(declare-datatypes ((array!8559 0))(
  ( (array!8560 (arr!4030 (Array (_ BitVec 32) ValueCell!1983)) (size!4355 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8559)

(declare-fun e!129955 () Bool)

(declare-fun array_inv!2627 (array!8559) Bool)

(assert (=> start!20138 (and (array_inv!2627 _values!649) e!129955)))

(assert (=> start!20138 true))

(declare-fun tp_is_empty!4653 () Bool)

(assert (=> start!20138 tp_is_empty!4653))

(declare-datatypes ((array!8561 0))(
  ( (array!8562 (arr!4031 (Array (_ BitVec 32) (_ BitVec 64))) (size!4356 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8561)

(declare-fun array_inv!2628 (array!8561) Bool)

(assert (=> start!20138 (array_inv!2628 _keys!825)))

(assert (=> start!20138 tp!17423))

(declare-fun b!197504 () Bool)

(declare-fun e!129957 () Bool)

(assert (=> b!197504 (= e!129957 tp_is_empty!4653)))

(declare-fun b!197505 () Bool)

(declare-fun res!93433 () Bool)

(assert (=> b!197505 (=> (not res!93433) (not e!129959))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!197505 (= res!93433 (= (select (arr!4031 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8048 () Bool)

(declare-fun mapRes!8048 () Bool)

(declare-fun tp!17422 () Bool)

(assert (=> mapNonEmpty!8048 (= mapRes!8048 (and tp!17422 e!129957))))

(declare-fun mapRest!8048 () (Array (_ BitVec 32) ValueCell!1983))

(declare-fun mapKey!8048 () (_ BitVec 32))

(declare-fun mapValue!8048 () ValueCell!1983)

(assert (=> mapNonEmpty!8048 (= (arr!4030 _values!649) (store mapRest!8048 mapKey!8048 mapValue!8048))))

(declare-fun b!197506 () Bool)

(declare-fun res!93435 () Bool)

(assert (=> b!197506 (=> (not res!93435) (not e!129959))))

(assert (=> b!197506 (= res!93435 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4356 _keys!825))))))

(declare-fun b!197507 () Bool)

(declare-fun res!93439 () Bool)

(assert (=> b!197507 (=> (not res!93439) (not e!129959))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197507 (= res!93439 (validKeyInArray!0 k0!843))))

(declare-fun b!197508 () Bool)

(declare-fun res!93434 () Bool)

(assert (=> b!197508 (=> (not res!93434) (not e!129959))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!197508 (= res!93434 (and (= (size!4355 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4356 _keys!825) (size!4355 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197509 () Bool)

(declare-fun res!93438 () Bool)

(assert (=> b!197509 (=> (not res!93438) (not e!129959))))

(declare-datatypes ((List!2514 0))(
  ( (Nil!2511) (Cons!2510 (h!3152 (_ BitVec 64)) (t!7445 List!2514)) )
))
(declare-fun arrayNoDuplicates!0 (array!8561 (_ BitVec 32) List!2514) Bool)

(assert (=> b!197509 (= res!93438 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2511))))

(declare-fun b!197510 () Bool)

(declare-fun res!93436 () Bool)

(assert (=> b!197510 (=> (not res!93436) (not e!129959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8561 (_ BitVec 32)) Bool)

(assert (=> b!197510 (= res!93436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197511 () Bool)

(assert (=> b!197511 (= e!129959 false)))

(declare-datatypes ((tuple2!3602 0))(
  ( (tuple2!3603 (_1!1812 (_ BitVec 64)) (_2!1812 V!5851)) )
))
(declare-datatypes ((List!2515 0))(
  ( (Nil!2512) (Cons!2511 (h!3153 tuple2!3602) (t!7446 List!2515)) )
))
(declare-datatypes ((ListLongMap!2515 0))(
  ( (ListLongMap!2516 (toList!1273 List!2515)) )
))
(declare-fun lt!97731 () ListLongMap!2515)

(declare-fun v!520 () V!5851)

(declare-fun zeroValue!615 () V!5851)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5851)

(declare-fun getCurrentListMapNoExtraKeys!238 (array!8561 array!8559 (_ BitVec 32) (_ BitVec 32) V!5851 V!5851 (_ BitVec 32) Int) ListLongMap!2515)

(assert (=> b!197511 (= lt!97731 (getCurrentListMapNoExtraKeys!238 _keys!825 (array!8560 (store (arr!4030 _values!649) i!601 (ValueCellFull!1983 v!520)) (size!4355 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97730 () ListLongMap!2515)

(assert (=> b!197511 (= lt!97730 (getCurrentListMapNoExtraKeys!238 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8048 () Bool)

(assert (=> mapIsEmpty!8048 mapRes!8048))

(declare-fun b!197512 () Bool)

(declare-fun e!129958 () Bool)

(assert (=> b!197512 (= e!129958 tp_is_empty!4653)))

(declare-fun b!197513 () Bool)

(assert (=> b!197513 (= e!129955 (and e!129958 mapRes!8048))))

(declare-fun condMapEmpty!8048 () Bool)

(declare-fun mapDefault!8048 () ValueCell!1983)

(assert (=> b!197513 (= condMapEmpty!8048 (= (arr!4030 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1983)) mapDefault!8048)))))

(assert (= (and start!20138 res!93437) b!197508))

(assert (= (and b!197508 res!93434) b!197510))

(assert (= (and b!197510 res!93436) b!197509))

(assert (= (and b!197509 res!93438) b!197506))

(assert (= (and b!197506 res!93435) b!197507))

(assert (= (and b!197507 res!93439) b!197505))

(assert (= (and b!197505 res!93433) b!197511))

(assert (= (and b!197513 condMapEmpty!8048) mapIsEmpty!8048))

(assert (= (and b!197513 (not condMapEmpty!8048)) mapNonEmpty!8048))

(get-info :version)

(assert (= (and mapNonEmpty!8048 ((_ is ValueCellFull!1983) mapValue!8048)) b!197504))

(assert (= (and b!197513 ((_ is ValueCellFull!1983) mapDefault!8048)) b!197512))

(assert (= start!20138 b!197513))

(declare-fun m!224363 () Bool)

(assert (=> b!197509 m!224363))

(declare-fun m!224365 () Bool)

(assert (=> b!197510 m!224365))

(declare-fun m!224367 () Bool)

(assert (=> mapNonEmpty!8048 m!224367))

(declare-fun m!224369 () Bool)

(assert (=> b!197511 m!224369))

(declare-fun m!224371 () Bool)

(assert (=> b!197511 m!224371))

(declare-fun m!224373 () Bool)

(assert (=> b!197511 m!224373))

(declare-fun m!224375 () Bool)

(assert (=> start!20138 m!224375))

(declare-fun m!224377 () Bool)

(assert (=> start!20138 m!224377))

(declare-fun m!224379 () Bool)

(assert (=> start!20138 m!224379))

(declare-fun m!224381 () Bool)

(assert (=> b!197507 m!224381))

(declare-fun m!224383 () Bool)

(assert (=> b!197505 m!224383))

(check-sat (not b!197509) (not b_next!4797) (not b!197511) (not mapNonEmpty!8048) (not start!20138) (not b!197507) tp_is_empty!4653 b_and!11543 (not b!197510))
(check-sat b_and!11543 (not b_next!4797))
