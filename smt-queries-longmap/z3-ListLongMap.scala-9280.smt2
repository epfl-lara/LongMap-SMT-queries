; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111028 () Bool)

(assert start!111028)

(declare-fun b_free!29863 () Bool)

(declare-fun b_next!29863 () Bool)

(assert (=> start!111028 (= b_free!29863 (not b_next!29863))))

(declare-fun tp!104911 () Bool)

(declare-fun b_and!48053 () Bool)

(assert (=> start!111028 (= tp!104911 b_and!48053)))

(declare-fun b!1314460 () Bool)

(declare-fun e!749802 () Bool)

(declare-fun e!749803 () Bool)

(declare-fun mapRes!55018 () Bool)

(assert (=> b!1314460 (= e!749802 (and e!749803 mapRes!55018))))

(declare-fun condMapEmpty!55018 () Bool)

(declare-datatypes ((V!52561 0))(
  ( (V!52562 (val!17871 Int)) )
))
(declare-datatypes ((ValueCell!16898 0))(
  ( (ValueCellFull!16898 (v!20497 V!52561)) (EmptyCell!16898) )
))
(declare-datatypes ((array!88063 0))(
  ( (array!88064 (arr!42512 (Array (_ BitVec 32) ValueCell!16898)) (size!43064 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88063)

(declare-fun mapDefault!55018 () ValueCell!16898)

(assert (=> b!1314460 (= condMapEmpty!55018 (= (arr!42512 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16898)) mapDefault!55018)))))

(declare-fun b!1314461 () Bool)

(declare-fun e!749804 () Bool)

(assert (=> b!1314461 (= e!749804 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!88065 0))(
  ( (array!88066 (arr!42513 (Array (_ BitVec 32) (_ BitVec 64))) (size!43065 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88065)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun lt!585618 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52561)

(declare-fun zeroValue!1296 () V!52561)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23136 0))(
  ( (tuple2!23137 (_1!11579 (_ BitVec 64)) (_2!11579 V!52561)) )
))
(declare-datatypes ((List!30251 0))(
  ( (Nil!30248) (Cons!30247 (h!31456 tuple2!23136) (t!43849 List!30251)) )
))
(declare-datatypes ((ListLongMap!20793 0))(
  ( (ListLongMap!20794 (toList!10412 List!30251)) )
))
(declare-fun contains!8489 (ListLongMap!20793 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5307 (array!88065 array!88063 (_ BitVec 32) (_ BitVec 32) V!52561 V!52561 (_ BitVec 32) Int) ListLongMap!20793)

(assert (=> b!1314461 (= lt!585618 (contains!8489 (getCurrentListMap!5307 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!55018 () Bool)

(assert (=> mapIsEmpty!55018 mapRes!55018))

(declare-fun b!1314463 () Bool)

(declare-fun res!872663 () Bool)

(assert (=> b!1314463 (=> (not res!872663) (not e!749804))))

(assert (=> b!1314463 (= res!872663 (and (= (size!43064 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43065 _keys!1628) (size!43064 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314464 () Bool)

(declare-fun res!872661 () Bool)

(assert (=> b!1314464 (=> (not res!872661) (not e!749804))))

(assert (=> b!1314464 (= res!872661 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43065 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1314465 () Bool)

(declare-fun res!872665 () Bool)

(assert (=> b!1314465 (=> (not res!872665) (not e!749804))))

(declare-datatypes ((List!30252 0))(
  ( (Nil!30249) (Cons!30248 (h!31457 (_ BitVec 64)) (t!43850 List!30252)) )
))
(declare-fun arrayNoDuplicates!0 (array!88065 (_ BitVec 32) List!30252) Bool)

(assert (=> b!1314465 (= res!872665 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30249))))

(declare-fun b!1314466 () Bool)

(declare-fun res!872664 () Bool)

(assert (=> b!1314466 (=> (not res!872664) (not e!749804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88065 (_ BitVec 32)) Bool)

(assert (=> b!1314466 (= res!872664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314462 () Bool)

(declare-fun e!749801 () Bool)

(declare-fun tp_is_empty!35593 () Bool)

(assert (=> b!1314462 (= e!749801 tp_is_empty!35593)))

(declare-fun res!872662 () Bool)

(assert (=> start!111028 (=> (not res!872662) (not e!749804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111028 (= res!872662 (validMask!0 mask!2040))))

(assert (=> start!111028 e!749804))

(assert (=> start!111028 tp!104911))

(declare-fun array_inv!32299 (array!88065) Bool)

(assert (=> start!111028 (array_inv!32299 _keys!1628)))

(assert (=> start!111028 true))

(assert (=> start!111028 tp_is_empty!35593))

(declare-fun array_inv!32300 (array!88063) Bool)

(assert (=> start!111028 (and (array_inv!32300 _values!1354) e!749802)))

(declare-fun b!1314467 () Bool)

(assert (=> b!1314467 (= e!749803 tp_is_empty!35593)))

(declare-fun mapNonEmpty!55018 () Bool)

(declare-fun tp!104912 () Bool)

(assert (=> mapNonEmpty!55018 (= mapRes!55018 (and tp!104912 e!749801))))

(declare-fun mapRest!55018 () (Array (_ BitVec 32) ValueCell!16898))

(declare-fun mapValue!55018 () ValueCell!16898)

(declare-fun mapKey!55018 () (_ BitVec 32))

(assert (=> mapNonEmpty!55018 (= (arr!42512 _values!1354) (store mapRest!55018 mapKey!55018 mapValue!55018))))

(assert (= (and start!111028 res!872662) b!1314463))

(assert (= (and b!1314463 res!872663) b!1314466))

(assert (= (and b!1314466 res!872664) b!1314465))

(assert (= (and b!1314465 res!872665) b!1314464))

(assert (= (and b!1314464 res!872661) b!1314461))

(assert (= (and b!1314460 condMapEmpty!55018) mapIsEmpty!55018))

(assert (= (and b!1314460 (not condMapEmpty!55018)) mapNonEmpty!55018))

(get-info :version)

(assert (= (and mapNonEmpty!55018 ((_ is ValueCellFull!16898) mapValue!55018)) b!1314462))

(assert (= (and b!1314460 ((_ is ValueCellFull!16898) mapDefault!55018)) b!1314467))

(assert (= start!111028 b!1314460))

(declare-fun m!1202505 () Bool)

(assert (=> b!1314466 m!1202505))

(declare-fun m!1202507 () Bool)

(assert (=> mapNonEmpty!55018 m!1202507))

(declare-fun m!1202509 () Bool)

(assert (=> start!111028 m!1202509))

(declare-fun m!1202511 () Bool)

(assert (=> start!111028 m!1202511))

(declare-fun m!1202513 () Bool)

(assert (=> start!111028 m!1202513))

(declare-fun m!1202515 () Bool)

(assert (=> b!1314461 m!1202515))

(assert (=> b!1314461 m!1202515))

(declare-fun m!1202517 () Bool)

(assert (=> b!1314461 m!1202517))

(declare-fun m!1202519 () Bool)

(assert (=> b!1314465 m!1202519))

(check-sat (not b!1314461) (not b!1314466) (not b_next!29863) (not b!1314465) tp_is_empty!35593 b_and!48053 (not mapNonEmpty!55018) (not start!111028))
(check-sat b_and!48053 (not b_next!29863))
