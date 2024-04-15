; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111350 () Bool)

(assert start!111350)

(declare-fun b_free!30007 () Bool)

(declare-fun b_next!30007 () Bool)

(assert (=> start!111350 (= b_free!30007 (not b_next!30007))))

(declare-fun tp!105497 () Bool)

(declare-fun b_and!48209 () Bool)

(assert (=> start!111350 (= tp!105497 b_and!48209)))

(declare-fun res!874444 () Bool)

(declare-fun e!751859 () Bool)

(assert (=> start!111350 (=> (not res!874444) (not e!751859))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111350 (= res!874444 (validMask!0 mask!2019))))

(assert (=> start!111350 e!751859))

(declare-datatypes ((array!88525 0))(
  ( (array!88526 (arr!42737 (Array (_ BitVec 32) (_ BitVec 64))) (size!43289 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88525)

(declare-fun array_inv!32457 (array!88525) Bool)

(assert (=> start!111350 (array_inv!32457 _keys!1609)))

(assert (=> start!111350 true))

(declare-fun tp_is_empty!35827 () Bool)

(assert (=> start!111350 tp_is_empty!35827))

(declare-datatypes ((V!52873 0))(
  ( (V!52874 (val!17988 Int)) )
))
(declare-datatypes ((ValueCell!17015 0))(
  ( (ValueCellFull!17015 (v!20617 V!52873)) (EmptyCell!17015) )
))
(declare-datatypes ((array!88527 0))(
  ( (array!88528 (arr!42738 (Array (_ BitVec 32) ValueCell!17015)) (size!43290 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88527)

(declare-fun e!751857 () Bool)

(declare-fun array_inv!32458 (array!88527) Bool)

(assert (=> start!111350 (and (array_inv!32458 _values!1337) e!751857)))

(assert (=> start!111350 tp!105497))

(declare-fun b!1317534 () Bool)

(assert (=> b!1317534 (= e!751859 false)))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!52873)

(declare-fun minValue!1279 () V!52873)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun lt!586200 () Bool)

(declare-datatypes ((tuple2!23234 0))(
  ( (tuple2!23235 (_1!11628 (_ BitVec 64)) (_2!11628 V!52873)) )
))
(declare-datatypes ((List!30374 0))(
  ( (Nil!30371) (Cons!30370 (h!31579 tuple2!23234) (t!43974 List!30374)) )
))
(declare-datatypes ((ListLongMap!20891 0))(
  ( (ListLongMap!20892 (toList!10461 List!30374)) )
))
(declare-fun contains!8544 (ListLongMap!20891 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5356 (array!88525 array!88527 (_ BitVec 32) (_ BitVec 32) V!52873 V!52873 (_ BitVec 32) Int) ListLongMap!20891)

(assert (=> b!1317534 (= lt!586200 (contains!8544 (getCurrentListMap!5356 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1317535 () Bool)

(declare-fun res!874443 () Bool)

(assert (=> b!1317535 (=> (not res!874443) (not e!751859))))

(declare-datatypes ((List!30375 0))(
  ( (Nil!30372) (Cons!30371 (h!31580 (_ BitVec 64)) (t!43975 List!30375)) )
))
(declare-fun arrayNoDuplicates!0 (array!88525 (_ BitVec 32) List!30375) Bool)

(assert (=> b!1317535 (= res!874443 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30372))))

(declare-fun mapIsEmpty!55388 () Bool)

(declare-fun mapRes!55388 () Bool)

(assert (=> mapIsEmpty!55388 mapRes!55388))

(declare-fun b!1317536 () Bool)

(declare-fun e!751860 () Bool)

(assert (=> b!1317536 (= e!751860 tp_is_empty!35827)))

(declare-fun b!1317537 () Bool)

(declare-fun e!751858 () Bool)

(assert (=> b!1317537 (= e!751858 tp_is_empty!35827)))

(declare-fun b!1317538 () Bool)

(declare-fun res!874446 () Bool)

(assert (=> b!1317538 (=> (not res!874446) (not e!751859))))

(assert (=> b!1317538 (= res!874446 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43289 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1317539 () Bool)

(declare-fun res!874442 () Bool)

(assert (=> b!1317539 (=> (not res!874442) (not e!751859))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88525 (_ BitVec 32)) Bool)

(assert (=> b!1317539 (= res!874442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317540 () Bool)

(declare-fun res!874445 () Bool)

(assert (=> b!1317540 (=> (not res!874445) (not e!751859))))

(assert (=> b!1317540 (= res!874445 (and (= (size!43290 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43289 _keys!1609) (size!43290 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1317541 () Bool)

(assert (=> b!1317541 (= e!751857 (and e!751860 mapRes!55388))))

(declare-fun condMapEmpty!55388 () Bool)

(declare-fun mapDefault!55388 () ValueCell!17015)

(assert (=> b!1317541 (= condMapEmpty!55388 (= (arr!42738 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17015)) mapDefault!55388)))))

(declare-fun mapNonEmpty!55388 () Bool)

(declare-fun tp!105498 () Bool)

(assert (=> mapNonEmpty!55388 (= mapRes!55388 (and tp!105498 e!751858))))

(declare-fun mapKey!55388 () (_ BitVec 32))

(declare-fun mapRest!55388 () (Array (_ BitVec 32) ValueCell!17015))

(declare-fun mapValue!55388 () ValueCell!17015)

(assert (=> mapNonEmpty!55388 (= (arr!42738 _values!1337) (store mapRest!55388 mapKey!55388 mapValue!55388))))

(assert (= (and start!111350 res!874444) b!1317540))

(assert (= (and b!1317540 res!874445) b!1317539))

(assert (= (and b!1317539 res!874442) b!1317535))

(assert (= (and b!1317535 res!874443) b!1317538))

(assert (= (and b!1317538 res!874446) b!1317534))

(assert (= (and b!1317541 condMapEmpty!55388) mapIsEmpty!55388))

(assert (= (and b!1317541 (not condMapEmpty!55388)) mapNonEmpty!55388))

(get-info :version)

(assert (= (and mapNonEmpty!55388 ((_ is ValueCellFull!17015) mapValue!55388)) b!1317537))

(assert (= (and b!1317541 ((_ is ValueCellFull!17015) mapDefault!55388)) b!1317536))

(assert (= start!111350 b!1317541))

(declare-fun m!1204887 () Bool)

(assert (=> mapNonEmpty!55388 m!1204887))

(declare-fun m!1204889 () Bool)

(assert (=> b!1317539 m!1204889))

(declare-fun m!1204891 () Bool)

(assert (=> b!1317535 m!1204891))

(declare-fun m!1204893 () Bool)

(assert (=> start!111350 m!1204893))

(declare-fun m!1204895 () Bool)

(assert (=> start!111350 m!1204895))

(declare-fun m!1204897 () Bool)

(assert (=> start!111350 m!1204897))

(declare-fun m!1204899 () Bool)

(assert (=> b!1317534 m!1204899))

(assert (=> b!1317534 m!1204899))

(declare-fun m!1204901 () Bool)

(assert (=> b!1317534 m!1204901))

(check-sat (not mapNonEmpty!55388) tp_is_empty!35827 (not b!1317535) (not b_next!30007) (not b!1317539) (not start!111350) (not b!1317534) b_and!48209)
(check-sat b_and!48209 (not b_next!30007))
