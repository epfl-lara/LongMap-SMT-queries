; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111276 () Bool)

(assert start!111276)

(declare-fun b_free!29887 () Bool)

(declare-fun b_next!29887 () Bool)

(assert (=> start!111276 (= b_free!29887 (not b_next!29887))))

(declare-fun tp!104983 () Bool)

(declare-fun b_and!48097 () Bool)

(assert (=> start!111276 (= tp!104983 b_and!48097)))

(declare-fun b!1316117 () Bool)

(declare-fun e!750857 () Bool)

(declare-fun tp_is_empty!35617 () Bool)

(assert (=> b!1316117 (= e!750857 tp_is_empty!35617)))

(declare-fun b!1316118 () Bool)

(declare-fun res!873392 () Bool)

(declare-fun e!750860 () Bool)

(assert (=> b!1316118 (=> (not res!873392) (not e!750860))))

(declare-datatypes ((array!88261 0))(
  ( (array!88262 (arr!42606 (Array (_ BitVec 32) (_ BitVec 64))) (size!43157 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88261)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88261 (_ BitVec 32)) Bool)

(assert (=> b!1316118 (= res!873392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!55054 () Bool)

(declare-fun mapRes!55054 () Bool)

(declare-fun tp!104982 () Bool)

(assert (=> mapNonEmpty!55054 (= mapRes!55054 (and tp!104982 e!750857))))

(declare-fun mapKey!55054 () (_ BitVec 32))

(declare-datatypes ((V!52593 0))(
  ( (V!52594 (val!17883 Int)) )
))
(declare-datatypes ((ValueCell!16910 0))(
  ( (ValueCellFull!16910 (v!20505 V!52593)) (EmptyCell!16910) )
))
(declare-fun mapValue!55054 () ValueCell!16910)

(declare-fun mapRest!55054 () (Array (_ BitVec 32) ValueCell!16910))

(declare-datatypes ((array!88263 0))(
  ( (array!88264 (arr!42607 (Array (_ BitVec 32) ValueCell!16910)) (size!43158 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88263)

(assert (=> mapNonEmpty!55054 (= (arr!42607 _values!1354) (store mapRest!55054 mapKey!55054 mapValue!55054))))

(declare-fun b!1316119 () Bool)

(declare-fun res!873391 () Bool)

(assert (=> b!1316119 (=> (not res!873391) (not e!750860))))

(declare-datatypes ((List!30239 0))(
  ( (Nil!30236) (Cons!30235 (h!31453 (_ BitVec 64)) (t!43837 List!30239)) )
))
(declare-fun arrayNoDuplicates!0 (array!88261 (_ BitVec 32) List!30239) Bool)

(assert (=> b!1316119 (= res!873391 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30236))))

(declare-fun b!1316120 () Bool)

(declare-fun e!750856 () Bool)

(assert (=> b!1316120 (= e!750856 tp_is_empty!35617)))

(declare-fun b!1316121 () Bool)

(assert (=> b!1316121 (= e!750860 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52593)

(declare-fun lt!586316 () Bool)

(declare-fun zeroValue!1296 () V!52593)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!23092 0))(
  ( (tuple2!23093 (_1!11557 (_ BitVec 64)) (_2!11557 V!52593)) )
))
(declare-datatypes ((List!30240 0))(
  ( (Nil!30237) (Cons!30236 (h!31454 tuple2!23092) (t!43838 List!30240)) )
))
(declare-datatypes ((ListLongMap!20757 0))(
  ( (ListLongMap!20758 (toList!10394 List!30240)) )
))
(declare-fun contains!8556 (ListLongMap!20757 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5398 (array!88261 array!88263 (_ BitVec 32) (_ BitVec 32) V!52593 V!52593 (_ BitVec 32) Int) ListLongMap!20757)

(assert (=> b!1316121 (= lt!586316 (contains!8556 (getCurrentListMap!5398 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1316122 () Bool)

(declare-fun res!873388 () Bool)

(assert (=> b!1316122 (=> (not res!873388) (not e!750860))))

(assert (=> b!1316122 (= res!873388 (and (= (size!43158 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43157 _keys!1628) (size!43158 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1316123 () Bool)

(declare-fun e!750859 () Bool)

(assert (=> b!1316123 (= e!750859 (and e!750856 mapRes!55054))))

(declare-fun condMapEmpty!55054 () Bool)

(declare-fun mapDefault!55054 () ValueCell!16910)

(assert (=> b!1316123 (= condMapEmpty!55054 (= (arr!42607 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16910)) mapDefault!55054)))))

(declare-fun res!873389 () Bool)

(assert (=> start!111276 (=> (not res!873389) (not e!750860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111276 (= res!873389 (validMask!0 mask!2040))))

(assert (=> start!111276 e!750860))

(assert (=> start!111276 tp!104983))

(declare-fun array_inv!32447 (array!88261) Bool)

(assert (=> start!111276 (array_inv!32447 _keys!1628)))

(assert (=> start!111276 true))

(assert (=> start!111276 tp_is_empty!35617))

(declare-fun array_inv!32448 (array!88263) Bool)

(assert (=> start!111276 (and (array_inv!32448 _values!1354) e!750859)))

(declare-fun mapIsEmpty!55054 () Bool)

(assert (=> mapIsEmpty!55054 mapRes!55054))

(declare-fun b!1316124 () Bool)

(declare-fun res!873390 () Bool)

(assert (=> b!1316124 (=> (not res!873390) (not e!750860))))

(assert (=> b!1316124 (= res!873390 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43157 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111276 res!873389) b!1316122))

(assert (= (and b!1316122 res!873388) b!1316118))

(assert (= (and b!1316118 res!873392) b!1316119))

(assert (= (and b!1316119 res!873391) b!1316124))

(assert (= (and b!1316124 res!873390) b!1316121))

(assert (= (and b!1316123 condMapEmpty!55054) mapIsEmpty!55054))

(assert (= (and b!1316123 (not condMapEmpty!55054)) mapNonEmpty!55054))

(get-info :version)

(assert (= (and mapNonEmpty!55054 ((_ is ValueCellFull!16910) mapValue!55054)) b!1316117))

(assert (= (and b!1316123 ((_ is ValueCellFull!16910) mapDefault!55054)) b!1316120))

(assert (= start!111276 b!1316123))

(declare-fun m!1204811 () Bool)

(assert (=> b!1316121 m!1204811))

(assert (=> b!1316121 m!1204811))

(declare-fun m!1204813 () Bool)

(assert (=> b!1316121 m!1204813))

(declare-fun m!1204815 () Bool)

(assert (=> b!1316118 m!1204815))

(declare-fun m!1204817 () Bool)

(assert (=> mapNonEmpty!55054 m!1204817))

(declare-fun m!1204819 () Bool)

(assert (=> start!111276 m!1204819))

(declare-fun m!1204821 () Bool)

(assert (=> start!111276 m!1204821))

(declare-fun m!1204823 () Bool)

(assert (=> start!111276 m!1204823))

(declare-fun m!1204825 () Bool)

(assert (=> b!1316119 m!1204825))

(check-sat (not mapNonEmpty!55054) (not b!1316119) (not b!1316118) tp_is_empty!35617 (not b_next!29887) b_and!48097 (not b!1316121) (not start!111276))
(check-sat b_and!48097 (not b_next!29887))
