; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111340 () Bool)

(assert start!111340)

(declare-fun b!1317501 () Bool)

(declare-fun e!751816 () Bool)

(assert (=> b!1317501 (= e!751816 false)))

(declare-fun lt!586380 () Bool)

(declare-datatypes ((array!88590 0))(
  ( (array!88591 (arr!42769 (Array (_ BitVec 32) (_ BitVec 64))) (size!43319 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88590)

(declare-datatypes ((List!30309 0))(
  ( (Nil!30306) (Cons!30305 (h!31514 (_ BitVec 64)) (t!43917 List!30309)) )
))
(declare-fun arrayNoDuplicates!0 (array!88590 (_ BitVec 32) List!30309) Bool)

(assert (=> b!1317501 (= lt!586380 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30306))))

(declare-fun mapIsEmpty!55373 () Bool)

(declare-fun mapRes!55373 () Bool)

(assert (=> mapIsEmpty!55373 mapRes!55373))

(declare-fun mapNonEmpty!55373 () Bool)

(declare-fun tp!105479 () Bool)

(declare-fun e!751819 () Bool)

(assert (=> mapNonEmpty!55373 (= mapRes!55373 (and tp!105479 e!751819))))

(declare-fun mapKey!55373 () (_ BitVec 32))

(declare-datatypes ((V!52859 0))(
  ( (V!52860 (val!17983 Int)) )
))
(declare-datatypes ((ValueCell!17010 0))(
  ( (ValueCellFull!17010 (v!20613 V!52859)) (EmptyCell!17010) )
))
(declare-datatypes ((array!88592 0))(
  ( (array!88593 (arr!42770 (Array (_ BitVec 32) ValueCell!17010)) (size!43320 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88592)

(declare-fun mapValue!55373 () ValueCell!17010)

(declare-fun mapRest!55373 () (Array (_ BitVec 32) ValueCell!17010))

(assert (=> mapNonEmpty!55373 (= (arr!42770 _values!1337) (store mapRest!55373 mapKey!55373 mapValue!55373))))

(declare-fun b!1317502 () Bool)

(declare-fun res!874413 () Bool)

(assert (=> b!1317502 (=> (not res!874413) (not e!751816))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88590 (_ BitVec 32)) Bool)

(assert (=> b!1317502 (= res!874413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317503 () Bool)

(declare-fun e!751815 () Bool)

(declare-fun e!751818 () Bool)

(assert (=> b!1317503 (= e!751815 (and e!751818 mapRes!55373))))

(declare-fun condMapEmpty!55373 () Bool)

(declare-fun mapDefault!55373 () ValueCell!17010)

(assert (=> b!1317503 (= condMapEmpty!55373 (= (arr!42770 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17010)) mapDefault!55373)))))

(declare-fun res!874414 () Bool)

(assert (=> start!111340 (=> (not res!874414) (not e!751816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111340 (= res!874414 (validMask!0 mask!2019))))

(assert (=> start!111340 e!751816))

(assert (=> start!111340 true))

(declare-fun array_inv!32303 (array!88592) Bool)

(assert (=> start!111340 (and (array_inv!32303 _values!1337) e!751815)))

(declare-fun array_inv!32304 (array!88590) Bool)

(assert (=> start!111340 (array_inv!32304 _keys!1609)))

(declare-fun b!1317504 () Bool)

(declare-fun tp_is_empty!35817 () Bool)

(assert (=> b!1317504 (= e!751819 tp_is_empty!35817)))

(declare-fun b!1317505 () Bool)

(assert (=> b!1317505 (= e!751818 tp_is_empty!35817)))

(declare-fun b!1317506 () Bool)

(declare-fun res!874415 () Bool)

(assert (=> b!1317506 (=> (not res!874415) (not e!751816))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1317506 (= res!874415 (and (= (size!43320 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43319 _keys!1609) (size!43320 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111340 res!874414) b!1317506))

(assert (= (and b!1317506 res!874415) b!1317502))

(assert (= (and b!1317502 res!874413) b!1317501))

(assert (= (and b!1317503 condMapEmpty!55373) mapIsEmpty!55373))

(assert (= (and b!1317503 (not condMapEmpty!55373)) mapNonEmpty!55373))

(get-info :version)

(assert (= (and mapNonEmpty!55373 ((_ is ValueCellFull!17010) mapValue!55373)) b!1317504))

(assert (= (and b!1317503 ((_ is ValueCellFull!17010) mapDefault!55373)) b!1317505))

(assert (= start!111340 b!1317503))

(declare-fun m!1205343 () Bool)

(assert (=> b!1317501 m!1205343))

(declare-fun m!1205345 () Bool)

(assert (=> mapNonEmpty!55373 m!1205345))

(declare-fun m!1205347 () Bool)

(assert (=> b!1317502 m!1205347))

(declare-fun m!1205349 () Bool)

(assert (=> start!111340 m!1205349))

(declare-fun m!1205351 () Bool)

(assert (=> start!111340 m!1205351))

(declare-fun m!1205353 () Bool)

(assert (=> start!111340 m!1205353))

(check-sat (not b!1317501) (not b!1317502) tp_is_empty!35817 (not start!111340) (not mapNonEmpty!55373))
(check-sat)
