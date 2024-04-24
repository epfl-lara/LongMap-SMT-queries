; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111282 () Bool)

(assert start!111282)

(declare-fun b_free!29893 () Bool)

(declare-fun b_next!29893 () Bool)

(assert (=> start!111282 (= b_free!29893 (not b_next!29893))))

(declare-fun tp!105000 () Bool)

(declare-fun b_and!48103 () Bool)

(assert (=> start!111282 (= tp!105000 b_and!48103)))

(declare-fun b!1316189 () Bool)

(declare-fun e!750903 () Bool)

(declare-fun tp_is_empty!35623 () Bool)

(assert (=> b!1316189 (= e!750903 tp_is_empty!35623)))

(declare-fun b!1316190 () Bool)

(declare-fun res!873435 () Bool)

(declare-fun e!750905 () Bool)

(assert (=> b!1316190 (=> (not res!873435) (not e!750905))))

(declare-datatypes ((array!88271 0))(
  ( (array!88272 (arr!42611 (Array (_ BitVec 32) (_ BitVec 64))) (size!43162 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88271)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1316190 (= res!873435 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43162 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1316191 () Bool)

(declare-fun res!873433 () Bool)

(assert (=> b!1316191 (=> (not res!873433) (not e!750905))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88271 (_ BitVec 32)) Bool)

(assert (=> b!1316191 (= res!873433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1316192 () Bool)

(assert (=> b!1316192 (= e!750905 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((V!52601 0))(
  ( (V!52602 (val!17886 Int)) )
))
(declare-fun minValue!1296 () V!52601)

(declare-datatypes ((ValueCell!16913 0))(
  ( (ValueCellFull!16913 (v!20508 V!52601)) (EmptyCell!16913) )
))
(declare-datatypes ((array!88273 0))(
  ( (array!88274 (arr!42612 (Array (_ BitVec 32) ValueCell!16913)) (size!43163 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88273)

(declare-fun zeroValue!1296 () V!52601)

(declare-fun lt!586325 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((tuple2!23094 0))(
  ( (tuple2!23095 (_1!11558 (_ BitVec 64)) (_2!11558 V!52601)) )
))
(declare-datatypes ((List!30242 0))(
  ( (Nil!30239) (Cons!30238 (h!31456 tuple2!23094) (t!43840 List!30242)) )
))
(declare-datatypes ((ListLongMap!20759 0))(
  ( (ListLongMap!20760 (toList!10395 List!30242)) )
))
(declare-fun contains!8557 (ListLongMap!20759 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5399 (array!88271 array!88273 (_ BitVec 32) (_ BitVec 32) V!52601 V!52601 (_ BitVec 32) Int) ListLongMap!20759)

(assert (=> b!1316192 (= lt!586325 (contains!8557 (getCurrentListMap!5399 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1316193 () Bool)

(declare-fun e!750902 () Bool)

(declare-fun mapRes!55063 () Bool)

(assert (=> b!1316193 (= e!750902 (and e!750903 mapRes!55063))))

(declare-fun condMapEmpty!55063 () Bool)

(declare-fun mapDefault!55063 () ValueCell!16913)

(assert (=> b!1316193 (= condMapEmpty!55063 (= (arr!42612 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16913)) mapDefault!55063)))))

(declare-fun mapNonEmpty!55063 () Bool)

(declare-fun tp!105001 () Bool)

(declare-fun e!750904 () Bool)

(assert (=> mapNonEmpty!55063 (= mapRes!55063 (and tp!105001 e!750904))))

(declare-fun mapValue!55063 () ValueCell!16913)

(declare-fun mapRest!55063 () (Array (_ BitVec 32) ValueCell!16913))

(declare-fun mapKey!55063 () (_ BitVec 32))

(assert (=> mapNonEmpty!55063 (= (arr!42612 _values!1354) (store mapRest!55063 mapKey!55063 mapValue!55063))))

(declare-fun mapIsEmpty!55063 () Bool)

(assert (=> mapIsEmpty!55063 mapRes!55063))

(declare-fun b!1316195 () Bool)

(assert (=> b!1316195 (= e!750904 tp_is_empty!35623)))

(declare-fun b!1316196 () Bool)

(declare-fun res!873434 () Bool)

(assert (=> b!1316196 (=> (not res!873434) (not e!750905))))

(assert (=> b!1316196 (= res!873434 (and (= (size!43163 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43162 _keys!1628) (size!43163 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!873437 () Bool)

(assert (=> start!111282 (=> (not res!873437) (not e!750905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111282 (= res!873437 (validMask!0 mask!2040))))

(assert (=> start!111282 e!750905))

(assert (=> start!111282 tp!105000))

(declare-fun array_inv!32451 (array!88271) Bool)

(assert (=> start!111282 (array_inv!32451 _keys!1628)))

(assert (=> start!111282 true))

(assert (=> start!111282 tp_is_empty!35623))

(declare-fun array_inv!32452 (array!88273) Bool)

(assert (=> start!111282 (and (array_inv!32452 _values!1354) e!750902)))

(declare-fun b!1316194 () Bool)

(declare-fun res!873436 () Bool)

(assert (=> b!1316194 (=> (not res!873436) (not e!750905))))

(declare-datatypes ((List!30243 0))(
  ( (Nil!30240) (Cons!30239 (h!31457 (_ BitVec 64)) (t!43841 List!30243)) )
))
(declare-fun arrayNoDuplicates!0 (array!88271 (_ BitVec 32) List!30243) Bool)

(assert (=> b!1316194 (= res!873436 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30240))))

(assert (= (and start!111282 res!873437) b!1316196))

(assert (= (and b!1316196 res!873434) b!1316191))

(assert (= (and b!1316191 res!873433) b!1316194))

(assert (= (and b!1316194 res!873436) b!1316190))

(assert (= (and b!1316190 res!873435) b!1316192))

(assert (= (and b!1316193 condMapEmpty!55063) mapIsEmpty!55063))

(assert (= (and b!1316193 (not condMapEmpty!55063)) mapNonEmpty!55063))

(get-info :version)

(assert (= (and mapNonEmpty!55063 ((_ is ValueCellFull!16913) mapValue!55063)) b!1316195))

(assert (= (and b!1316193 ((_ is ValueCellFull!16913) mapDefault!55063)) b!1316189))

(assert (= start!111282 b!1316193))

(declare-fun m!1204859 () Bool)

(assert (=> start!111282 m!1204859))

(declare-fun m!1204861 () Bool)

(assert (=> start!111282 m!1204861))

(declare-fun m!1204863 () Bool)

(assert (=> start!111282 m!1204863))

(declare-fun m!1204865 () Bool)

(assert (=> b!1316194 m!1204865))

(declare-fun m!1204867 () Bool)

(assert (=> mapNonEmpty!55063 m!1204867))

(declare-fun m!1204869 () Bool)

(assert (=> b!1316192 m!1204869))

(assert (=> b!1316192 m!1204869))

(declare-fun m!1204871 () Bool)

(assert (=> b!1316192 m!1204871))

(declare-fun m!1204873 () Bool)

(assert (=> b!1316191 m!1204873))

(check-sat (not b!1316192) (not start!111282) tp_is_empty!35623 (not b_next!29893) (not mapNonEmpty!55063) b_and!48103 (not b!1316194) (not b!1316191))
(check-sat b_and!48103 (not b_next!29893))
