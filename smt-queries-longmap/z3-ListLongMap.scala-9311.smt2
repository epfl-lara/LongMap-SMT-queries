; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111526 () Bool)

(assert start!111526)

(declare-fun b!1318458 () Bool)

(declare-fun e!752376 () Bool)

(declare-fun tp_is_empty!35779 () Bool)

(assert (=> b!1318458 (= e!752376 tp_is_empty!35779)))

(declare-fun mapIsEmpty!55316 () Bool)

(declare-fun mapRes!55316 () Bool)

(assert (=> mapIsEmpty!55316 mapRes!55316))

(declare-fun b!1318460 () Bool)

(declare-fun e!752373 () Bool)

(declare-fun e!752377 () Bool)

(assert (=> b!1318460 (= e!752373 (and e!752377 mapRes!55316))))

(declare-fun condMapEmpty!55316 () Bool)

(declare-datatypes ((V!52809 0))(
  ( (V!52810 (val!17964 Int)) )
))
(declare-datatypes ((ValueCell!16991 0))(
  ( (ValueCellFull!16991 (v!20589 V!52809)) (EmptyCell!16991) )
))
(declare-datatypes ((array!88581 0))(
  ( (array!88582 (arr!42760 (Array (_ BitVec 32) ValueCell!16991)) (size!43311 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88581)

(declare-fun mapDefault!55316 () ValueCell!16991)

(assert (=> b!1318460 (= condMapEmpty!55316 (= (arr!42760 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16991)) mapDefault!55316)))))

(declare-fun mapNonEmpty!55316 () Bool)

(declare-fun tp!105422 () Bool)

(assert (=> mapNonEmpty!55316 (= mapRes!55316 (and tp!105422 e!752376))))

(declare-fun mapValue!55316 () ValueCell!16991)

(declare-fun mapKey!55316 () (_ BitVec 32))

(declare-fun mapRest!55316 () (Array (_ BitVec 32) ValueCell!16991))

(assert (=> mapNonEmpty!55316 (= (arr!42760 _values!1337) (store mapRest!55316 mapKey!55316 mapValue!55316))))

(declare-fun b!1318461 () Bool)

(declare-fun e!752374 () Bool)

(assert (=> b!1318461 (= e!752374 false)))

(declare-fun lt!586799 () Bool)

(declare-datatypes ((array!88583 0))(
  ( (array!88584 (arr!42761 (Array (_ BitVec 32) (_ BitVec 64))) (size!43312 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88583)

(declare-datatypes ((List!30327 0))(
  ( (Nil!30324) (Cons!30323 (h!31541 (_ BitVec 64)) (t!43927 List!30327)) )
))
(declare-fun arrayNoDuplicates!0 (array!88583 (_ BitVec 32) List!30327) Bool)

(assert (=> b!1318461 (= lt!586799 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30324))))

(declare-fun b!1318462 () Bool)

(declare-fun res!874761 () Bool)

(assert (=> b!1318462 (=> (not res!874761) (not e!752374))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1318462 (= res!874761 (and (= (size!43311 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43312 _keys!1609) (size!43311 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1318463 () Bool)

(declare-fun res!874760 () Bool)

(assert (=> b!1318463 (=> (not res!874760) (not e!752374))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88583 (_ BitVec 32)) Bool)

(assert (=> b!1318463 (= res!874760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!874762 () Bool)

(assert (=> start!111526 (=> (not res!874762) (not e!752374))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111526 (= res!874762 (validMask!0 mask!2019))))

(assert (=> start!111526 e!752374))

(assert (=> start!111526 true))

(declare-fun array_inv!32567 (array!88581) Bool)

(assert (=> start!111526 (and (array_inv!32567 _values!1337) e!752373)))

(declare-fun array_inv!32568 (array!88583) Bool)

(assert (=> start!111526 (array_inv!32568 _keys!1609)))

(declare-fun b!1318459 () Bool)

(assert (=> b!1318459 (= e!752377 tp_is_empty!35779)))

(assert (= (and start!111526 res!874762) b!1318462))

(assert (= (and b!1318462 res!874761) b!1318463))

(assert (= (and b!1318463 res!874760) b!1318461))

(assert (= (and b!1318460 condMapEmpty!55316) mapIsEmpty!55316))

(assert (= (and b!1318460 (not condMapEmpty!55316)) mapNonEmpty!55316))

(get-info :version)

(assert (= (and mapNonEmpty!55316 ((_ is ValueCellFull!16991) mapValue!55316)) b!1318458))

(assert (= (and b!1318460 ((_ is ValueCellFull!16991) mapDefault!55316)) b!1318459))

(assert (= start!111526 b!1318460))

(declare-fun m!1206713 () Bool)

(assert (=> mapNonEmpty!55316 m!1206713))

(declare-fun m!1206715 () Bool)

(assert (=> b!1318461 m!1206715))

(declare-fun m!1206717 () Bool)

(assert (=> b!1318463 m!1206717))

(declare-fun m!1206719 () Bool)

(assert (=> start!111526 m!1206719))

(declare-fun m!1206721 () Bool)

(assert (=> start!111526 m!1206721))

(declare-fun m!1206723 () Bool)

(assert (=> start!111526 m!1206723))

(check-sat (not b!1318461) (not mapNonEmpty!55316) tp_is_empty!35779 (not start!111526) (not b!1318463))
(check-sat)
