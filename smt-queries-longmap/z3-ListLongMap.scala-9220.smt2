; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110670 () Bool)

(assert start!110670)

(declare-fun b_free!29505 () Bool)

(declare-fun b_next!29505 () Bool)

(assert (=> start!110670 (= b_free!29505 (not b_next!29505))))

(declare-fun tp!103836 () Bool)

(declare-fun b_and!47713 () Bool)

(assert (=> start!110670 (= tp!103836 b_and!47713)))

(declare-fun b!1309523 () Bool)

(declare-fun res!869296 () Bool)

(declare-fun e!747150 () Bool)

(assert (=> b!1309523 (=> (not res!869296) (not e!747150))))

(declare-datatypes ((array!87460 0))(
  ( (array!87461 (arr!42210 (Array (_ BitVec 32) (_ BitVec 64))) (size!42760 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87460)

(declare-datatypes ((List!29926 0))(
  ( (Nil!29923) (Cons!29922 (h!31131 (_ BitVec 64)) (t!43532 List!29926)) )
))
(declare-fun arrayNoDuplicates!0 (array!87460 (_ BitVec 32) List!29926) Bool)

(assert (=> b!1309523 (= res!869296 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29923))))

(declare-fun b!1309524 () Bool)

(declare-fun e!747149 () Bool)

(declare-fun e!747151 () Bool)

(declare-fun mapRes!54481 () Bool)

(assert (=> b!1309524 (= e!747149 (and e!747151 mapRes!54481))))

(declare-fun condMapEmpty!54481 () Bool)

(declare-datatypes ((V!52083 0))(
  ( (V!52084 (val!17692 Int)) )
))
(declare-datatypes ((ValueCell!16719 0))(
  ( (ValueCellFull!16719 (v!20319 V!52083)) (EmptyCell!16719) )
))
(declare-datatypes ((array!87462 0))(
  ( (array!87463 (arr!42211 (Array (_ BitVec 32) ValueCell!16719)) (size!42761 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87462)

(declare-fun mapDefault!54481 () ValueCell!16719)

(assert (=> b!1309524 (= condMapEmpty!54481 (= (arr!42211 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16719)) mapDefault!54481)))))

(declare-fun b!1309525 () Bool)

(declare-fun e!747148 () Bool)

(declare-fun tp_is_empty!35235 () Bool)

(assert (=> b!1309525 (= e!747148 tp_is_empty!35235)))

(declare-fun b!1309526 () Bool)

(declare-fun res!869294 () Bool)

(assert (=> b!1309526 (=> (not res!869294) (not e!747150))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1309526 (= res!869294 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42760 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309527 () Bool)

(declare-fun res!869295 () Bool)

(assert (=> b!1309527 (=> (not res!869295) (not e!747150))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1309527 (= res!869295 (and (= (size!42761 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42760 _keys!1628) (size!42761 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309528 () Bool)

(assert (=> b!1309528 (= e!747150 false)))

(declare-fun lt!585276 () Bool)

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52083)

(declare-fun zeroValue!1296 () V!52083)

(declare-datatypes ((tuple2!22782 0))(
  ( (tuple2!22783 (_1!11402 (_ BitVec 64)) (_2!11402 V!52083)) )
))
(declare-datatypes ((List!29927 0))(
  ( (Nil!29924) (Cons!29923 (h!31132 tuple2!22782) (t!43533 List!29927)) )
))
(declare-datatypes ((ListLongMap!20439 0))(
  ( (ListLongMap!20440 (toList!10235 List!29927)) )
))
(declare-fun contains!8385 (ListLongMap!20439 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5248 (array!87460 array!87462 (_ BitVec 32) (_ BitVec 32) V!52083 V!52083 (_ BitVec 32) Int) ListLongMap!20439)

(assert (=> b!1309528 (= lt!585276 (contains!8385 (getCurrentListMap!5248 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun res!869297 () Bool)

(assert (=> start!110670 (=> (not res!869297) (not e!747150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110670 (= res!869297 (validMask!0 mask!2040))))

(assert (=> start!110670 e!747150))

(assert (=> start!110670 tp!103836))

(declare-fun array_inv!31897 (array!87460) Bool)

(assert (=> start!110670 (array_inv!31897 _keys!1628)))

(assert (=> start!110670 true))

(assert (=> start!110670 tp_is_empty!35235))

(declare-fun array_inv!31898 (array!87462) Bool)

(assert (=> start!110670 (and (array_inv!31898 _values!1354) e!747149)))

(declare-fun b!1309529 () Bool)

(assert (=> b!1309529 (= e!747151 tp_is_empty!35235)))

(declare-fun mapNonEmpty!54481 () Bool)

(declare-fun tp!103837 () Bool)

(assert (=> mapNonEmpty!54481 (= mapRes!54481 (and tp!103837 e!747148))))

(declare-fun mapKey!54481 () (_ BitVec 32))

(declare-fun mapRest!54481 () (Array (_ BitVec 32) ValueCell!16719))

(declare-fun mapValue!54481 () ValueCell!16719)

(assert (=> mapNonEmpty!54481 (= (arr!42211 _values!1354) (store mapRest!54481 mapKey!54481 mapValue!54481))))

(declare-fun mapIsEmpty!54481 () Bool)

(assert (=> mapIsEmpty!54481 mapRes!54481))

(declare-fun b!1309530 () Bool)

(declare-fun res!869298 () Bool)

(assert (=> b!1309530 (=> (not res!869298) (not e!747150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87460 (_ BitVec 32)) Bool)

(assert (=> b!1309530 (= res!869298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(assert (= (and start!110670 res!869297) b!1309527))

(assert (= (and b!1309527 res!869295) b!1309530))

(assert (= (and b!1309530 res!869298) b!1309523))

(assert (= (and b!1309523 res!869296) b!1309526))

(assert (= (and b!1309526 res!869294) b!1309528))

(assert (= (and b!1309524 condMapEmpty!54481) mapIsEmpty!54481))

(assert (= (and b!1309524 (not condMapEmpty!54481)) mapNonEmpty!54481))

(get-info :version)

(assert (= (and mapNonEmpty!54481 ((_ is ValueCellFull!16719) mapValue!54481)) b!1309525))

(assert (= (and b!1309524 ((_ is ValueCellFull!16719) mapDefault!54481)) b!1309529))

(assert (= start!110670 b!1309524))

(declare-fun m!1199575 () Bool)

(assert (=> b!1309530 m!1199575))

(declare-fun m!1199577 () Bool)

(assert (=> b!1309523 m!1199577))

(declare-fun m!1199579 () Bool)

(assert (=> b!1309528 m!1199579))

(assert (=> b!1309528 m!1199579))

(declare-fun m!1199581 () Bool)

(assert (=> b!1309528 m!1199581))

(declare-fun m!1199583 () Bool)

(assert (=> start!110670 m!1199583))

(declare-fun m!1199585 () Bool)

(assert (=> start!110670 m!1199585))

(declare-fun m!1199587 () Bool)

(assert (=> start!110670 m!1199587))

(declare-fun m!1199589 () Bool)

(assert (=> mapNonEmpty!54481 m!1199589))

(check-sat (not b!1309530) tp_is_empty!35235 (not b_next!29505) (not start!110670) b_and!47713 (not b!1309523) (not b!1309528) (not mapNonEmpty!54481))
(check-sat b_and!47713 (not b_next!29505))
