; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111222 () Bool)

(assert start!111222)

(declare-fun b_free!29833 () Bool)

(declare-fun b_next!29833 () Bool)

(assert (=> start!111222 (= b_free!29833 (not b_next!29833))))

(declare-fun tp!104821 () Bool)

(declare-fun b_and!48043 () Bool)

(assert (=> start!111222 (= tp!104821 b_and!48043)))

(declare-fun b!1315433 () Bool)

(declare-fun res!872947 () Bool)

(declare-fun e!750452 () Bool)

(assert (=> b!1315433 (=> (not res!872947) (not e!750452))))

(declare-datatypes ((array!88155 0))(
  ( (array!88156 (arr!42553 (Array (_ BitVec 32) (_ BitVec 64))) (size!43104 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88155)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88155 (_ BitVec 32)) Bool)

(assert (=> b!1315433 (= res!872947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun res!872948 () Bool)

(assert (=> start!111222 (=> (not res!872948) (not e!750452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111222 (= res!872948 (validMask!0 mask!2040))))

(assert (=> start!111222 e!750452))

(assert (=> start!111222 tp!104821))

(declare-fun array_inv!32407 (array!88155) Bool)

(assert (=> start!111222 (array_inv!32407 _keys!1628)))

(assert (=> start!111222 true))

(declare-fun tp_is_empty!35563 () Bool)

(assert (=> start!111222 tp_is_empty!35563))

(declare-datatypes ((V!52521 0))(
  ( (V!52522 (val!17856 Int)) )
))
(declare-datatypes ((ValueCell!16883 0))(
  ( (ValueCellFull!16883 (v!20478 V!52521)) (EmptyCell!16883) )
))
(declare-datatypes ((array!88157 0))(
  ( (array!88158 (arr!42554 (Array (_ BitVec 32) ValueCell!16883)) (size!43105 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88157)

(declare-fun e!750453 () Bool)

(declare-fun array_inv!32408 (array!88157) Bool)

(assert (=> start!111222 (and (array_inv!32408 _values!1354) e!750453)))

(declare-fun b!1315434 () Bool)

(declare-fun e!750451 () Bool)

(assert (=> b!1315434 (= e!750451 tp_is_empty!35563)))

(declare-fun b!1315435 () Bool)

(assert (=> b!1315435 (= e!750452 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52521)

(declare-fun zeroValue!1296 () V!52521)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!586235 () Bool)

(declare-datatypes ((tuple2!23050 0))(
  ( (tuple2!23051 (_1!11536 (_ BitVec 64)) (_2!11536 V!52521)) )
))
(declare-datatypes ((List!30201 0))(
  ( (Nil!30198) (Cons!30197 (h!31415 tuple2!23050) (t!43799 List!30201)) )
))
(declare-datatypes ((ListLongMap!20715 0))(
  ( (ListLongMap!20716 (toList!10373 List!30201)) )
))
(declare-fun contains!8535 (ListLongMap!20715 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5377 (array!88155 array!88157 (_ BitVec 32) (_ BitVec 32) V!52521 V!52521 (_ BitVec 32) Int) ListLongMap!20715)

(assert (=> b!1315435 (= lt!586235 (contains!8535 (getCurrentListMap!5377 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!54973 () Bool)

(declare-fun mapRes!54973 () Bool)

(assert (=> mapIsEmpty!54973 mapRes!54973))

(declare-fun b!1315436 () Bool)

(declare-fun res!872949 () Bool)

(assert (=> b!1315436 (=> (not res!872949) (not e!750452))))

(declare-datatypes ((List!30202 0))(
  ( (Nil!30199) (Cons!30198 (h!31416 (_ BitVec 64)) (t!43800 List!30202)) )
))
(declare-fun arrayNoDuplicates!0 (array!88155 (_ BitVec 32) List!30202) Bool)

(assert (=> b!1315436 (= res!872949 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30199))))

(declare-fun b!1315437 () Bool)

(declare-fun e!750455 () Bool)

(assert (=> b!1315437 (= e!750453 (and e!750455 mapRes!54973))))

(declare-fun condMapEmpty!54973 () Bool)

(declare-fun mapDefault!54973 () ValueCell!16883)

(assert (=> b!1315437 (= condMapEmpty!54973 (= (arr!42554 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16883)) mapDefault!54973)))))

(declare-fun b!1315438 () Bool)

(assert (=> b!1315438 (= e!750455 tp_is_empty!35563)))

(declare-fun mapNonEmpty!54973 () Bool)

(declare-fun tp!104820 () Bool)

(assert (=> mapNonEmpty!54973 (= mapRes!54973 (and tp!104820 e!750451))))

(declare-fun mapRest!54973 () (Array (_ BitVec 32) ValueCell!16883))

(declare-fun mapValue!54973 () ValueCell!16883)

(declare-fun mapKey!54973 () (_ BitVec 32))

(assert (=> mapNonEmpty!54973 (= (arr!42554 _values!1354) (store mapRest!54973 mapKey!54973 mapValue!54973))))

(declare-fun b!1315439 () Bool)

(declare-fun res!872950 () Bool)

(assert (=> b!1315439 (=> (not res!872950) (not e!750452))))

(assert (=> b!1315439 (= res!872950 (and (= (size!43105 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43104 _keys!1628) (size!43105 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315440 () Bool)

(declare-fun res!872951 () Bool)

(assert (=> b!1315440 (=> (not res!872951) (not e!750452))))

(assert (=> b!1315440 (= res!872951 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43104 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111222 res!872948) b!1315439))

(assert (= (and b!1315439 res!872950) b!1315433))

(assert (= (and b!1315433 res!872947) b!1315436))

(assert (= (and b!1315436 res!872949) b!1315440))

(assert (= (and b!1315440 res!872951) b!1315435))

(assert (= (and b!1315437 condMapEmpty!54973) mapIsEmpty!54973))

(assert (= (and b!1315437 (not condMapEmpty!54973)) mapNonEmpty!54973))

(get-info :version)

(assert (= (and mapNonEmpty!54973 ((_ is ValueCellFull!16883) mapValue!54973)) b!1315434))

(assert (= (and b!1315437 ((_ is ValueCellFull!16883) mapDefault!54973)) b!1315438))

(assert (= start!111222 b!1315437))

(declare-fun m!1204349 () Bool)

(assert (=> b!1315433 m!1204349))

(declare-fun m!1204351 () Bool)

(assert (=> start!111222 m!1204351))

(declare-fun m!1204353 () Bool)

(assert (=> start!111222 m!1204353))

(declare-fun m!1204355 () Bool)

(assert (=> start!111222 m!1204355))

(declare-fun m!1204357 () Bool)

(assert (=> b!1315436 m!1204357))

(declare-fun m!1204359 () Bool)

(assert (=> b!1315435 m!1204359))

(assert (=> b!1315435 m!1204359))

(declare-fun m!1204361 () Bool)

(assert (=> b!1315435 m!1204361))

(declare-fun m!1204363 () Bool)

(assert (=> mapNonEmpty!54973 m!1204363))

(check-sat (not b!1315436) b_and!48043 (not b!1315433) (not b!1315435) (not mapNonEmpty!54973) tp_is_empty!35563 (not start!111222) (not b_next!29833))
(check-sat b_and!48043 (not b_next!29833))
