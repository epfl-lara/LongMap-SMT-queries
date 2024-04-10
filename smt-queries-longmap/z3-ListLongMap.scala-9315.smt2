; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111328 () Bool)

(assert start!111328)

(declare-fun mapIsEmpty!55355 () Bool)

(declare-fun mapRes!55355 () Bool)

(assert (=> mapIsEmpty!55355 mapRes!55355))

(declare-fun b!1317393 () Bool)

(declare-fun e!751726 () Bool)

(assert (=> b!1317393 (= e!751726 false)))

(declare-fun lt!586362 () Bool)

(declare-datatypes ((array!88566 0))(
  ( (array!88567 (arr!42757 (Array (_ BitVec 32) (_ BitVec 64))) (size!43307 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88566)

(declare-datatypes ((List!30304 0))(
  ( (Nil!30301) (Cons!30300 (h!31509 (_ BitVec 64)) (t!43912 List!30304)) )
))
(declare-fun arrayNoDuplicates!0 (array!88566 (_ BitVec 32) List!30304) Bool)

(assert (=> b!1317393 (= lt!586362 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30301))))

(declare-fun b!1317394 () Bool)

(declare-fun e!751725 () Bool)

(declare-fun tp_is_empty!35805 () Bool)

(assert (=> b!1317394 (= e!751725 tp_is_empty!35805)))

(declare-fun mapNonEmpty!55355 () Bool)

(declare-fun tp!105461 () Bool)

(declare-fun e!751728 () Bool)

(assert (=> mapNonEmpty!55355 (= mapRes!55355 (and tp!105461 e!751728))))

(declare-datatypes ((V!52843 0))(
  ( (V!52844 (val!17977 Int)) )
))
(declare-datatypes ((ValueCell!17004 0))(
  ( (ValueCellFull!17004 (v!20607 V!52843)) (EmptyCell!17004) )
))
(declare-fun mapValue!55355 () ValueCell!17004)

(declare-fun mapKey!55355 () (_ BitVec 32))

(declare-datatypes ((array!88568 0))(
  ( (array!88569 (arr!42758 (Array (_ BitVec 32) ValueCell!17004)) (size!43308 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88568)

(declare-fun mapRest!55355 () (Array (_ BitVec 32) ValueCell!17004))

(assert (=> mapNonEmpty!55355 (= (arr!42758 _values!1337) (store mapRest!55355 mapKey!55355 mapValue!55355))))

(declare-fun b!1317396 () Bool)

(declare-fun e!751727 () Bool)

(assert (=> b!1317396 (= e!751727 (and e!751725 mapRes!55355))))

(declare-fun condMapEmpty!55355 () Bool)

(declare-fun mapDefault!55355 () ValueCell!17004)

(assert (=> b!1317396 (= condMapEmpty!55355 (= (arr!42758 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17004)) mapDefault!55355)))))

(declare-fun res!874359 () Bool)

(assert (=> start!111328 (=> (not res!874359) (not e!751726))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111328 (= res!874359 (validMask!0 mask!2019))))

(assert (=> start!111328 e!751726))

(assert (=> start!111328 true))

(declare-fun array_inv!32291 (array!88568) Bool)

(assert (=> start!111328 (and (array_inv!32291 _values!1337) e!751727)))

(declare-fun array_inv!32292 (array!88566) Bool)

(assert (=> start!111328 (array_inv!32292 _keys!1609)))

(declare-fun b!1317395 () Bool)

(declare-fun res!874361 () Bool)

(assert (=> b!1317395 (=> (not res!874361) (not e!751726))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1317395 (= res!874361 (and (= (size!43308 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43307 _keys!1609) (size!43308 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1317397 () Bool)

(declare-fun res!874360 () Bool)

(assert (=> b!1317397 (=> (not res!874360) (not e!751726))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88566 (_ BitVec 32)) Bool)

(assert (=> b!1317397 (= res!874360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317398 () Bool)

(assert (=> b!1317398 (= e!751728 tp_is_empty!35805)))

(assert (= (and start!111328 res!874359) b!1317395))

(assert (= (and b!1317395 res!874361) b!1317397))

(assert (= (and b!1317397 res!874360) b!1317393))

(assert (= (and b!1317396 condMapEmpty!55355) mapIsEmpty!55355))

(assert (= (and b!1317396 (not condMapEmpty!55355)) mapNonEmpty!55355))

(get-info :version)

(assert (= (and mapNonEmpty!55355 ((_ is ValueCellFull!17004) mapValue!55355)) b!1317398))

(assert (= (and b!1317396 ((_ is ValueCellFull!17004) mapDefault!55355)) b!1317394))

(assert (= start!111328 b!1317396))

(declare-fun m!1205271 () Bool)

(assert (=> b!1317393 m!1205271))

(declare-fun m!1205273 () Bool)

(assert (=> mapNonEmpty!55355 m!1205273))

(declare-fun m!1205275 () Bool)

(assert (=> start!111328 m!1205275))

(declare-fun m!1205277 () Bool)

(assert (=> start!111328 m!1205277))

(declare-fun m!1205279 () Bool)

(assert (=> start!111328 m!1205279))

(declare-fun m!1205281 () Bool)

(assert (=> b!1317397 m!1205281))

(check-sat tp_is_empty!35805 (not b!1317393) (not mapNonEmpty!55355) (not b!1317397) (not start!111328))
(check-sat)
