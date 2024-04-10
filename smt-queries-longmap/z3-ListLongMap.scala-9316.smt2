; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111334 () Bool)

(assert start!111334)

(declare-fun mapIsEmpty!55364 () Bool)

(declare-fun mapRes!55364 () Bool)

(assert (=> mapIsEmpty!55364 mapRes!55364))

(declare-fun b!1317447 () Bool)

(declare-fun e!751771 () Bool)

(declare-fun tp_is_empty!35811 () Bool)

(assert (=> b!1317447 (= e!751771 tp_is_empty!35811)))

(declare-fun b!1317449 () Bool)

(declare-fun e!751770 () Bool)

(assert (=> b!1317449 (= e!751770 tp_is_empty!35811)))

(declare-fun b!1317450 () Bool)

(declare-fun e!751774 () Bool)

(assert (=> b!1317450 (= e!751774 false)))

(declare-fun lt!586371 () Bool)

(declare-datatypes ((array!88578 0))(
  ( (array!88579 (arr!42763 (Array (_ BitVec 32) (_ BitVec 64))) (size!43313 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88578)

(declare-datatypes ((List!30307 0))(
  ( (Nil!30304) (Cons!30303 (h!31512 (_ BitVec 64)) (t!43915 List!30307)) )
))
(declare-fun arrayNoDuplicates!0 (array!88578 (_ BitVec 32) List!30307) Bool)

(assert (=> b!1317450 (= lt!586371 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30304))))

(declare-fun b!1317451 () Bool)

(declare-fun res!874387 () Bool)

(assert (=> b!1317451 (=> (not res!874387) (not e!751774))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!52851 0))(
  ( (V!52852 (val!17980 Int)) )
))
(declare-datatypes ((ValueCell!17007 0))(
  ( (ValueCellFull!17007 (v!20610 V!52851)) (EmptyCell!17007) )
))
(declare-datatypes ((array!88580 0))(
  ( (array!88581 (arr!42764 (Array (_ BitVec 32) ValueCell!17007)) (size!43314 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88580)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1317451 (= res!874387 (and (= (size!43314 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43313 _keys!1609) (size!43314 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55364 () Bool)

(declare-fun tp!105470 () Bool)

(assert (=> mapNonEmpty!55364 (= mapRes!55364 (and tp!105470 e!751770))))

(declare-fun mapRest!55364 () (Array (_ BitVec 32) ValueCell!17007))

(declare-fun mapKey!55364 () (_ BitVec 32))

(declare-fun mapValue!55364 () ValueCell!17007)

(assert (=> mapNonEmpty!55364 (= (arr!42764 _values!1337) (store mapRest!55364 mapKey!55364 mapValue!55364))))

(declare-fun b!1317452 () Bool)

(declare-fun res!874388 () Bool)

(assert (=> b!1317452 (=> (not res!874388) (not e!751774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88578 (_ BitVec 32)) Bool)

(assert (=> b!1317452 (= res!874388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!874386 () Bool)

(assert (=> start!111334 (=> (not res!874386) (not e!751774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111334 (= res!874386 (validMask!0 mask!2019))))

(assert (=> start!111334 e!751774))

(assert (=> start!111334 true))

(declare-fun e!751773 () Bool)

(declare-fun array_inv!32297 (array!88580) Bool)

(assert (=> start!111334 (and (array_inv!32297 _values!1337) e!751773)))

(declare-fun array_inv!32298 (array!88578) Bool)

(assert (=> start!111334 (array_inv!32298 _keys!1609)))

(declare-fun b!1317448 () Bool)

(assert (=> b!1317448 (= e!751773 (and e!751771 mapRes!55364))))

(declare-fun condMapEmpty!55364 () Bool)

(declare-fun mapDefault!55364 () ValueCell!17007)

(assert (=> b!1317448 (= condMapEmpty!55364 (= (arr!42764 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17007)) mapDefault!55364)))))

(assert (= (and start!111334 res!874386) b!1317451))

(assert (= (and b!1317451 res!874387) b!1317452))

(assert (= (and b!1317452 res!874388) b!1317450))

(assert (= (and b!1317448 condMapEmpty!55364) mapIsEmpty!55364))

(assert (= (and b!1317448 (not condMapEmpty!55364)) mapNonEmpty!55364))

(get-info :version)

(assert (= (and mapNonEmpty!55364 ((_ is ValueCellFull!17007) mapValue!55364)) b!1317449))

(assert (= (and b!1317448 ((_ is ValueCellFull!17007) mapDefault!55364)) b!1317447))

(assert (= start!111334 b!1317448))

(declare-fun m!1205307 () Bool)

(assert (=> b!1317450 m!1205307))

(declare-fun m!1205309 () Bool)

(assert (=> mapNonEmpty!55364 m!1205309))

(declare-fun m!1205311 () Bool)

(assert (=> b!1317452 m!1205311))

(declare-fun m!1205313 () Bool)

(assert (=> start!111334 m!1205313))

(declare-fun m!1205315 () Bool)

(assert (=> start!111334 m!1205315))

(declare-fun m!1205317 () Bool)

(assert (=> start!111334 m!1205317))

(check-sat tp_is_empty!35811 (not b!1317450) (not mapNonEmpty!55364) (not start!111334) (not b!1317452))
(check-sat)
