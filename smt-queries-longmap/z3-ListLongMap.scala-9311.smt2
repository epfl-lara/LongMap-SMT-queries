; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111302 () Bool)

(assert start!111302)

(declare-fun b!1317089 () Bool)

(declare-fun e!751501 () Bool)

(declare-fun e!751499 () Bool)

(declare-fun mapRes!55316 () Bool)

(assert (=> b!1317089 (= e!751501 (and e!751499 mapRes!55316))))

(declare-fun condMapEmpty!55316 () Bool)

(declare-datatypes ((V!52809 0))(
  ( (V!52810 (val!17964 Int)) )
))
(declare-datatypes ((ValueCell!16991 0))(
  ( (ValueCellFull!16991 (v!20593 V!52809)) (EmptyCell!16991) )
))
(declare-datatypes ((array!88435 0))(
  ( (array!88436 (arr!42692 (Array (_ BitVec 32) ValueCell!16991)) (size!43244 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88435)

(declare-fun mapDefault!55316 () ValueCell!16991)

(assert (=> b!1317089 (= condMapEmpty!55316 (= (arr!42692 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16991)) mapDefault!55316)))))

(declare-fun mapIsEmpty!55316 () Bool)

(assert (=> mapIsEmpty!55316 mapRes!55316))

(declare-fun b!1317090 () Bool)

(declare-fun res!874213 () Bool)

(declare-fun e!751497 () Bool)

(assert (=> b!1317090 (=> (not res!874213) (not e!751497))))

(declare-datatypes ((array!88437 0))(
  ( (array!88438 (arr!42693 (Array (_ BitVec 32) (_ BitVec 64))) (size!43245 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88437)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88437 (_ BitVec 32)) Bool)

(assert (=> b!1317090 (= res!874213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317091 () Bool)

(declare-fun e!751498 () Bool)

(declare-fun tp_is_empty!35779 () Bool)

(assert (=> b!1317091 (= e!751498 tp_is_empty!35779)))

(declare-fun mapNonEmpty!55316 () Bool)

(declare-fun tp!105423 () Bool)

(assert (=> mapNonEmpty!55316 (= mapRes!55316 (and tp!105423 e!751498))))

(declare-fun mapValue!55316 () ValueCell!16991)

(declare-fun mapRest!55316 () (Array (_ BitVec 32) ValueCell!16991))

(declare-fun mapKey!55316 () (_ BitVec 32))

(assert (=> mapNonEmpty!55316 (= (arr!42692 _values!1337) (store mapRest!55316 mapKey!55316 mapValue!55316))))

(declare-fun b!1317092 () Bool)

(assert (=> b!1317092 (= e!751497 false)))

(declare-fun lt!586137 () Bool)

(declare-datatypes ((List!30358 0))(
  ( (Nil!30355) (Cons!30354 (h!31563 (_ BitVec 64)) (t!43958 List!30358)) )
))
(declare-fun arrayNoDuplicates!0 (array!88437 (_ BitVec 32) List!30358) Bool)

(assert (=> b!1317092 (= lt!586137 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30355))))

(declare-fun res!874215 () Bool)

(assert (=> start!111302 (=> (not res!874215) (not e!751497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111302 (= res!874215 (validMask!0 mask!2019))))

(assert (=> start!111302 e!751497))

(assert (=> start!111302 true))

(declare-fun array_inv!32423 (array!88435) Bool)

(assert (=> start!111302 (and (array_inv!32423 _values!1337) e!751501)))

(declare-fun array_inv!32424 (array!88437) Bool)

(assert (=> start!111302 (array_inv!32424 _keys!1609)))

(declare-fun b!1317093 () Bool)

(declare-fun res!874214 () Bool)

(assert (=> b!1317093 (=> (not res!874214) (not e!751497))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1317093 (= res!874214 (and (= (size!43244 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43245 _keys!1609) (size!43244 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1317094 () Bool)

(assert (=> b!1317094 (= e!751499 tp_is_empty!35779)))

(assert (= (and start!111302 res!874215) b!1317093))

(assert (= (and b!1317093 res!874214) b!1317090))

(assert (= (and b!1317090 res!874213) b!1317092))

(assert (= (and b!1317089 condMapEmpty!55316) mapIsEmpty!55316))

(assert (= (and b!1317089 (not condMapEmpty!55316)) mapNonEmpty!55316))

(get-info :version)

(assert (= (and mapNonEmpty!55316 ((_ is ValueCellFull!16991) mapValue!55316)) b!1317091))

(assert (= (and b!1317089 ((_ is ValueCellFull!16991) mapDefault!55316)) b!1317094))

(assert (= start!111302 b!1317089))

(declare-fun m!1204599 () Bool)

(assert (=> b!1317090 m!1204599))

(declare-fun m!1204601 () Bool)

(assert (=> mapNonEmpty!55316 m!1204601))

(declare-fun m!1204603 () Bool)

(assert (=> b!1317092 m!1204603))

(declare-fun m!1204605 () Bool)

(assert (=> start!111302 m!1204605))

(declare-fun m!1204607 () Bool)

(assert (=> start!111302 m!1204607))

(declare-fun m!1204609 () Bool)

(assert (=> start!111302 m!1204609))

(check-sat (not start!111302) (not b!1317090) (not b!1317092) tp_is_empty!35779 (not mapNonEmpty!55316))
(check-sat)
