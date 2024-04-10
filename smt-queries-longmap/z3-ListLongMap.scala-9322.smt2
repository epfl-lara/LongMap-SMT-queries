; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111370 () Bool)

(assert start!111370)

(declare-fun b_free!30027 () Bool)

(declare-fun b_next!30027 () Bool)

(assert (=> start!111370 (= b_free!30027 (not b_next!30027))))

(declare-fun tp!105556 () Bool)

(declare-fun b_and!48247 () Bool)

(assert (=> start!111370 (= tp!105556 b_and!48247)))

(declare-fun res!874623 () Bool)

(declare-fun e!752042 () Bool)

(assert (=> start!111370 (=> (not res!874623) (not e!752042))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111370 (= res!874623 (validMask!0 mask!2019))))

(assert (=> start!111370 e!752042))

(declare-datatypes ((array!88646 0))(
  ( (array!88647 (arr!42797 (Array (_ BitVec 32) (_ BitVec 64))) (size!43347 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88646)

(declare-fun array_inv!32321 (array!88646) Bool)

(assert (=> start!111370 (array_inv!32321 _keys!1609)))

(assert (=> start!111370 true))

(declare-fun tp_is_empty!35847 () Bool)

(assert (=> start!111370 tp_is_empty!35847))

(declare-datatypes ((V!52899 0))(
  ( (V!52900 (val!17998 Int)) )
))
(declare-datatypes ((ValueCell!17025 0))(
  ( (ValueCellFull!17025 (v!20628 V!52899)) (EmptyCell!17025) )
))
(declare-datatypes ((array!88648 0))(
  ( (array!88649 (arr!42798 (Array (_ BitVec 32) ValueCell!17025)) (size!43348 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88648)

(declare-fun e!752040 () Bool)

(declare-fun array_inv!32322 (array!88648) Bool)

(assert (=> start!111370 (and (array_inv!32322 _values!1337) e!752040)))

(assert (=> start!111370 tp!105556))

(declare-fun b!1317844 () Bool)

(declare-fun e!752041 () Bool)

(assert (=> b!1317844 (= e!752041 tp_is_empty!35847)))

(declare-fun b!1317845 () Bool)

(declare-fun mapRes!55418 () Bool)

(assert (=> b!1317845 (= e!752040 (and e!752041 mapRes!55418))))

(declare-fun condMapEmpty!55418 () Bool)

(declare-fun mapDefault!55418 () ValueCell!17025)

(assert (=> b!1317845 (= condMapEmpty!55418 (= (arr!42798 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17025)) mapDefault!55418)))))

(declare-fun b!1317846 () Bool)

(declare-fun res!874625 () Bool)

(assert (=> b!1317846 (=> (not res!874625) (not e!752042))))

(declare-datatypes ((List!30322 0))(
  ( (Nil!30319) (Cons!30318 (h!31527 (_ BitVec 64)) (t!43930 List!30322)) )
))
(declare-fun arrayNoDuplicates!0 (array!88646 (_ BitVec 32) List!30322) Bool)

(assert (=> b!1317846 (= res!874625 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30319))))

(declare-fun b!1317847 () Bool)

(declare-fun res!874621 () Bool)

(assert (=> b!1317847 (=> (not res!874621) (not e!752042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88646 (_ BitVec 32)) Bool)

(assert (=> b!1317847 (= res!874621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317848 () Bool)

(declare-fun res!874624 () Bool)

(assert (=> b!1317848 (=> (not res!874624) (not e!752042))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1317848 (= res!874624 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43347 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1317849 () Bool)

(declare-fun res!874622 () Bool)

(assert (=> b!1317849 (=> (not res!874622) (not e!752042))))

(assert (=> b!1317849 (= res!874622 (and (= (size!43348 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43347 _keys!1609) (size!43348 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!55418 () Bool)

(declare-fun tp!105557 () Bool)

(declare-fun e!752043 () Bool)

(assert (=> mapNonEmpty!55418 (= mapRes!55418 (and tp!105557 e!752043))))

(declare-fun mapValue!55418 () ValueCell!17025)

(declare-fun mapRest!55418 () (Array (_ BitVec 32) ValueCell!17025))

(declare-fun mapKey!55418 () (_ BitVec 32))

(assert (=> mapNonEmpty!55418 (= (arr!42798 _values!1337) (store mapRest!55418 mapKey!55418 mapValue!55418))))

(declare-fun b!1317850 () Bool)

(assert (=> b!1317850 (= e!752043 tp_is_empty!35847)))

(declare-fun mapIsEmpty!55418 () Bool)

(assert (=> mapIsEmpty!55418 mapRes!55418))

(declare-fun b!1317851 () Bool)

(assert (=> b!1317851 (= e!752042 false)))

(declare-fun zeroValue!1279 () V!52899)

(declare-fun minValue!1279 () V!52899)

(declare-fun lt!586416 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23164 0))(
  ( (tuple2!23165 (_1!11593 (_ BitVec 64)) (_2!11593 V!52899)) )
))
(declare-datatypes ((List!30323 0))(
  ( (Nil!30320) (Cons!30319 (h!31528 tuple2!23164) (t!43931 List!30323)) )
))
(declare-datatypes ((ListLongMap!20821 0))(
  ( (ListLongMap!20822 (toList!10426 List!30323)) )
))
(declare-fun contains!8581 (ListLongMap!20821 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5439 (array!88646 array!88648 (_ BitVec 32) (_ BitVec 32) V!52899 V!52899 (_ BitVec 32) Int) ListLongMap!20821)

(assert (=> b!1317851 (= lt!586416 (contains!8581 (getCurrentListMap!5439 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(assert (= (and start!111370 res!874623) b!1317849))

(assert (= (and b!1317849 res!874622) b!1317847))

(assert (= (and b!1317847 res!874621) b!1317846))

(assert (= (and b!1317846 res!874625) b!1317848))

(assert (= (and b!1317848 res!874624) b!1317851))

(assert (= (and b!1317845 condMapEmpty!55418) mapIsEmpty!55418))

(assert (= (and b!1317845 (not condMapEmpty!55418)) mapNonEmpty!55418))

(get-info :version)

(assert (= (and mapNonEmpty!55418 ((_ is ValueCellFull!17025) mapValue!55418)) b!1317850))

(assert (= (and b!1317845 ((_ is ValueCellFull!17025) mapDefault!55418)) b!1317844))

(assert (= start!111370 b!1317845))

(declare-fun m!1205563 () Bool)

(assert (=> start!111370 m!1205563))

(declare-fun m!1205565 () Bool)

(assert (=> start!111370 m!1205565))

(declare-fun m!1205567 () Bool)

(assert (=> start!111370 m!1205567))

(declare-fun m!1205569 () Bool)

(assert (=> b!1317851 m!1205569))

(assert (=> b!1317851 m!1205569))

(declare-fun m!1205571 () Bool)

(assert (=> b!1317851 m!1205571))

(declare-fun m!1205573 () Bool)

(assert (=> b!1317846 m!1205573))

(declare-fun m!1205575 () Bool)

(assert (=> mapNonEmpty!55418 m!1205575))

(declare-fun m!1205577 () Bool)

(assert (=> b!1317847 m!1205577))

(check-sat (not b_next!30027) (not start!111370) b_and!48247 (not b!1317851) tp_is_empty!35847 (not b!1317847) (not b!1317846) (not mapNonEmpty!55418))
(check-sat b_and!48247 (not b_next!30027))
