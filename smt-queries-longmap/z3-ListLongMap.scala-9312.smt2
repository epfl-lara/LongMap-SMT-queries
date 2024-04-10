; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111310 () Bool)

(assert start!111310)

(declare-fun b!1317231 () Bool)

(declare-fun e!751594 () Bool)

(declare-fun tp_is_empty!35787 () Bool)

(assert (=> b!1317231 (= e!751594 tp_is_empty!35787)))

(declare-fun b!1317232 () Bool)

(declare-fun e!751593 () Bool)

(declare-fun mapRes!55328 () Bool)

(assert (=> b!1317232 (= e!751593 (and e!751594 mapRes!55328))))

(declare-fun condMapEmpty!55328 () Bool)

(declare-datatypes ((V!52819 0))(
  ( (V!52820 (val!17968 Int)) )
))
(declare-datatypes ((ValueCell!16995 0))(
  ( (ValueCellFull!16995 (v!20598 V!52819)) (EmptyCell!16995) )
))
(declare-datatypes ((array!88532 0))(
  ( (array!88533 (arr!42740 (Array (_ BitVec 32) ValueCell!16995)) (size!43290 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88532)

(declare-fun mapDefault!55328 () ValueCell!16995)

(assert (=> b!1317232 (= condMapEmpty!55328 (= (arr!42740 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16995)) mapDefault!55328)))))

(declare-fun b!1317233 () Bool)

(declare-fun res!874278 () Bool)

(declare-fun e!751591 () Bool)

(assert (=> b!1317233 (=> (not res!874278) (not e!751591))))

(declare-datatypes ((array!88534 0))(
  ( (array!88535 (arr!42741 (Array (_ BitVec 32) (_ BitVec 64))) (size!43291 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88534)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88534 (_ BitVec 32)) Bool)

(assert (=> b!1317233 (= res!874278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317234 () Bool)

(declare-fun e!751590 () Bool)

(assert (=> b!1317234 (= e!751590 tp_is_empty!35787)))

(declare-fun mapNonEmpty!55328 () Bool)

(declare-fun tp!105434 () Bool)

(assert (=> mapNonEmpty!55328 (= mapRes!55328 (and tp!105434 e!751590))))

(declare-fun mapRest!55328 () (Array (_ BitVec 32) ValueCell!16995))

(declare-fun mapKey!55328 () (_ BitVec 32))

(declare-fun mapValue!55328 () ValueCell!16995)

(assert (=> mapNonEmpty!55328 (= (arr!42740 _values!1337) (store mapRest!55328 mapKey!55328 mapValue!55328))))

(declare-fun b!1317235 () Bool)

(assert (=> b!1317235 (= e!751591 false)))

(declare-fun lt!586335 () Bool)

(declare-datatypes ((List!30297 0))(
  ( (Nil!30294) (Cons!30293 (h!31502 (_ BitVec 64)) (t!43905 List!30297)) )
))
(declare-fun arrayNoDuplicates!0 (array!88534 (_ BitVec 32) List!30297) Bool)

(assert (=> b!1317235 (= lt!586335 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30294))))

(declare-fun b!1317236 () Bool)

(declare-fun res!874279 () Bool)

(assert (=> b!1317236 (=> (not res!874279) (not e!751591))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1317236 (= res!874279 (and (= (size!43290 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43291 _keys!1609) (size!43290 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!874280 () Bool)

(assert (=> start!111310 (=> (not res!874280) (not e!751591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111310 (= res!874280 (validMask!0 mask!2019))))

(assert (=> start!111310 e!751591))

(assert (=> start!111310 true))

(declare-fun array_inv!32279 (array!88532) Bool)

(assert (=> start!111310 (and (array_inv!32279 _values!1337) e!751593)))

(declare-fun array_inv!32280 (array!88534) Bool)

(assert (=> start!111310 (array_inv!32280 _keys!1609)))

(declare-fun mapIsEmpty!55328 () Bool)

(assert (=> mapIsEmpty!55328 mapRes!55328))

(assert (= (and start!111310 res!874280) b!1317236))

(assert (= (and b!1317236 res!874279) b!1317233))

(assert (= (and b!1317233 res!874278) b!1317235))

(assert (= (and b!1317232 condMapEmpty!55328) mapIsEmpty!55328))

(assert (= (and b!1317232 (not condMapEmpty!55328)) mapNonEmpty!55328))

(get-info :version)

(assert (= (and mapNonEmpty!55328 ((_ is ValueCellFull!16995) mapValue!55328)) b!1317234))

(assert (= (and b!1317232 ((_ is ValueCellFull!16995) mapDefault!55328)) b!1317231))

(assert (= start!111310 b!1317232))

(declare-fun m!1205163 () Bool)

(assert (=> b!1317233 m!1205163))

(declare-fun m!1205165 () Bool)

(assert (=> mapNonEmpty!55328 m!1205165))

(declare-fun m!1205167 () Bool)

(assert (=> b!1317235 m!1205167))

(declare-fun m!1205169 () Bool)

(assert (=> start!111310 m!1205169))

(declare-fun m!1205171 () Bool)

(assert (=> start!111310 m!1205171))

(declare-fun m!1205173 () Bool)

(assert (=> start!111310 m!1205173))

(check-sat (not mapNonEmpty!55328) (not start!111310) (not b!1317233) tp_is_empty!35787 (not b!1317235))
(check-sat)
