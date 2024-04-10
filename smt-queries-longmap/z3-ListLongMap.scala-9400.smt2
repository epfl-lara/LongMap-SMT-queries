; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111896 () Bool)

(assert start!111896)

(declare-fun b_free!30495 () Bool)

(declare-fun b_next!30495 () Bool)

(assert (=> start!111896 (= b_free!30495 (not b_next!30495))))

(declare-fun tp!106965 () Bool)

(declare-fun b_and!49085 () Bool)

(assert (=> start!111896 (= tp!106965 b_and!49085)))

(declare-fun b!1325943 () Bool)

(declare-fun res!880020 () Bool)

(declare-fun e!755812 () Bool)

(assert (=> b!1325943 (=> (not res!880020) (not e!755812))))

(declare-datatypes ((array!89536 0))(
  ( (array!89537 (arr!43241 (Array (_ BitVec 32) (_ BitVec 64))) (size!43791 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89536)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun from!2000 () (_ BitVec 32))

(assert (=> b!1325943 (= res!880020 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43791 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325945 () Bool)

(declare-fun res!880019 () Bool)

(assert (=> b!1325945 (=> (not res!880019) (not e!755812))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89536 (_ BitVec 32)) Bool)

(assert (=> b!1325945 (= res!880019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1325946 () Bool)

(declare-fun res!880017 () Bool)

(assert (=> b!1325946 (=> (not res!880017) (not e!755812))))

(assert (=> b!1325946 (= res!880017 (not (= (select (arr!43241 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1325947 () Bool)

(declare-fun e!755811 () Bool)

(declare-fun tp_is_empty!36315 () Bool)

(assert (=> b!1325947 (= e!755811 tp_is_empty!36315)))

(declare-fun b!1325948 () Bool)

(declare-fun res!880023 () Bool)

(assert (=> b!1325948 (=> (not res!880023) (not e!755812))))

(declare-datatypes ((V!53523 0))(
  ( (V!53524 (val!18232 Int)) )
))
(declare-fun zeroValue!1279 () V!53523)

(declare-datatypes ((ValueCell!17259 0))(
  ( (ValueCellFull!17259 (v!20865 V!53523)) (EmptyCell!17259) )
))
(declare-datatypes ((array!89538 0))(
  ( (array!89539 (arr!43242 (Array (_ BitVec 32) ValueCell!17259)) (size!43792 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89538)

(declare-fun minValue!1279 () V!53523)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23518 0))(
  ( (tuple2!23519 (_1!11770 (_ BitVec 64)) (_2!11770 V!53523)) )
))
(declare-datatypes ((List!30657 0))(
  ( (Nil!30654) (Cons!30653 (h!31862 tuple2!23518) (t!44623 List!30657)) )
))
(declare-datatypes ((ListLongMap!21175 0))(
  ( (ListLongMap!21176 (toList!10603 List!30657)) )
))
(declare-fun contains!8760 (ListLongMap!21175 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5595 (array!89536 array!89538 (_ BitVec 32) (_ BitVec 32) V!53523 V!53523 (_ BitVec 32) Int) ListLongMap!21175)

(assert (=> b!1325948 (= res!880023 (contains!8760 (getCurrentListMap!5595 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapNonEmpty!56124 () Bool)

(declare-fun mapRes!56124 () Bool)

(declare-fun tp!106964 () Bool)

(assert (=> mapNonEmpty!56124 (= mapRes!56124 (and tp!106964 e!755811))))

(declare-fun mapRest!56124 () (Array (_ BitVec 32) ValueCell!17259))

(declare-fun mapValue!56124 () ValueCell!17259)

(declare-fun mapKey!56124 () (_ BitVec 32))

(assert (=> mapNonEmpty!56124 (= (arr!43242 _values!1337) (store mapRest!56124 mapKey!56124 mapValue!56124))))

(declare-fun b!1325949 () Bool)

(declare-fun res!880021 () Bool)

(assert (=> b!1325949 (=> (not res!880021) (not e!755812))))

(assert (=> b!1325949 (= res!880021 (and (= (size!43792 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43791 _keys!1609) (size!43792 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56124 () Bool)

(assert (=> mapIsEmpty!56124 mapRes!56124))

(declare-fun b!1325944 () Bool)

(declare-fun res!880022 () Bool)

(assert (=> b!1325944 (=> (not res!880022) (not e!755812))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1325944 (= res!880022 (validKeyInArray!0 (select (arr!43241 _keys!1609) from!2000)))))

(declare-fun res!880018 () Bool)

(assert (=> start!111896 (=> (not res!880018) (not e!755812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111896 (= res!880018 (validMask!0 mask!2019))))

(assert (=> start!111896 e!755812))

(declare-fun array_inv!32639 (array!89536) Bool)

(assert (=> start!111896 (array_inv!32639 _keys!1609)))

(assert (=> start!111896 true))

(assert (=> start!111896 tp_is_empty!36315))

(declare-fun e!755808 () Bool)

(declare-fun array_inv!32640 (array!89538) Bool)

(assert (=> start!111896 (and (array_inv!32640 _values!1337) e!755808)))

(assert (=> start!111896 tp!106965))

(declare-fun b!1325950 () Bool)

(declare-fun res!880024 () Bool)

(assert (=> b!1325950 (=> (not res!880024) (not e!755812))))

(declare-datatypes ((List!30658 0))(
  ( (Nil!30655) (Cons!30654 (h!31863 (_ BitVec 64)) (t!44624 List!30658)) )
))
(declare-fun arrayNoDuplicates!0 (array!89536 (_ BitVec 32) List!30658) Bool)

(assert (=> b!1325950 (= res!880024 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30655))))

(declare-fun b!1325951 () Bool)

(declare-fun e!755809 () Bool)

(assert (=> b!1325951 (= e!755809 tp_is_empty!36315)))

(declare-fun b!1325952 () Bool)

(assert (=> b!1325952 (= e!755812 (not true))))

(declare-fun lt!589880 () ListLongMap!21175)

(assert (=> b!1325952 (contains!8760 lt!589880 k0!1164)))

(declare-datatypes ((Unit!43680 0))(
  ( (Unit!43681) )
))
(declare-fun lt!589879 () Unit!43680)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!218 ((_ BitVec 64) (_ BitVec 64) V!53523 ListLongMap!21175) Unit!43680)

(assert (=> b!1325952 (= lt!589879 (lemmaInListMapAfterAddingDiffThenInBefore!218 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589880))))

(declare-fun lt!589878 () ListLongMap!21175)

(assert (=> b!1325952 (contains!8760 lt!589878 k0!1164)))

(declare-fun lt!589881 () Unit!43680)

(assert (=> b!1325952 (= lt!589881 (lemmaInListMapAfterAddingDiffThenInBefore!218 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589878))))

(declare-fun +!4626 (ListLongMap!21175 tuple2!23518) ListLongMap!21175)

(assert (=> b!1325952 (= lt!589878 (+!4626 lt!589880 (tuple2!23519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6264 (array!89536 array!89538 (_ BitVec 32) (_ BitVec 32) V!53523 V!53523 (_ BitVec 32) Int) ListLongMap!21175)

(declare-fun get!21785 (ValueCell!17259 V!53523) V!53523)

(declare-fun dynLambda!3565 (Int (_ BitVec 64)) V!53523)

(assert (=> b!1325952 (= lt!589880 (+!4626 (getCurrentListMapNoExtraKeys!6264 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23519 (select (arr!43241 _keys!1609) from!2000) (get!21785 (select (arr!43242 _values!1337) from!2000) (dynLambda!3565 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1325953 () Bool)

(assert (=> b!1325953 (= e!755808 (and e!755809 mapRes!56124))))

(declare-fun condMapEmpty!56124 () Bool)

(declare-fun mapDefault!56124 () ValueCell!17259)

(assert (=> b!1325953 (= condMapEmpty!56124 (= (arr!43242 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17259)) mapDefault!56124)))))

(assert (= (and start!111896 res!880018) b!1325949))

(assert (= (and b!1325949 res!880021) b!1325945))

(assert (= (and b!1325945 res!880019) b!1325950))

(assert (= (and b!1325950 res!880024) b!1325943))

(assert (= (and b!1325943 res!880020) b!1325948))

(assert (= (and b!1325948 res!880023) b!1325946))

(assert (= (and b!1325946 res!880017) b!1325944))

(assert (= (and b!1325944 res!880022) b!1325952))

(assert (= (and b!1325953 condMapEmpty!56124) mapIsEmpty!56124))

(assert (= (and b!1325953 (not condMapEmpty!56124)) mapNonEmpty!56124))

(get-info :version)

(assert (= (and mapNonEmpty!56124 ((_ is ValueCellFull!17259) mapValue!56124)) b!1325947))

(assert (= (and b!1325953 ((_ is ValueCellFull!17259) mapDefault!56124)) b!1325951))

(assert (= start!111896 b!1325953))

(declare-fun b_lambda!23773 () Bool)

(assert (=> (not b_lambda!23773) (not b!1325952)))

(declare-fun t!44622 () Bool)

(declare-fun tb!11769 () Bool)

(assert (=> (and start!111896 (= defaultEntry!1340 defaultEntry!1340) t!44622) tb!11769))

(declare-fun result!24595 () Bool)

(assert (=> tb!11769 (= result!24595 tp_is_empty!36315)))

(assert (=> b!1325952 t!44622))

(declare-fun b_and!49087 () Bool)

(assert (= b_and!49085 (and (=> t!44622 result!24595) b_and!49087)))

(declare-fun m!1214849 () Bool)

(assert (=> b!1325946 m!1214849))

(declare-fun m!1214851 () Bool)

(assert (=> mapNonEmpty!56124 m!1214851))

(declare-fun m!1214853 () Bool)

(assert (=> b!1325952 m!1214853))

(declare-fun m!1214855 () Bool)

(assert (=> b!1325952 m!1214855))

(declare-fun m!1214857 () Bool)

(assert (=> b!1325952 m!1214857))

(declare-fun m!1214859 () Bool)

(assert (=> b!1325952 m!1214859))

(assert (=> b!1325952 m!1214857))

(declare-fun m!1214861 () Bool)

(assert (=> b!1325952 m!1214861))

(declare-fun m!1214863 () Bool)

(assert (=> b!1325952 m!1214863))

(assert (=> b!1325952 m!1214861))

(declare-fun m!1214865 () Bool)

(assert (=> b!1325952 m!1214865))

(declare-fun m!1214867 () Bool)

(assert (=> b!1325952 m!1214867))

(assert (=> b!1325952 m!1214855))

(declare-fun m!1214869 () Bool)

(assert (=> b!1325952 m!1214869))

(declare-fun m!1214871 () Bool)

(assert (=> b!1325952 m!1214871))

(assert (=> b!1325952 m!1214849))

(declare-fun m!1214873 () Bool)

(assert (=> b!1325950 m!1214873))

(declare-fun m!1214875 () Bool)

(assert (=> start!111896 m!1214875))

(declare-fun m!1214877 () Bool)

(assert (=> start!111896 m!1214877))

(declare-fun m!1214879 () Bool)

(assert (=> start!111896 m!1214879))

(declare-fun m!1214881 () Bool)

(assert (=> b!1325948 m!1214881))

(assert (=> b!1325948 m!1214881))

(declare-fun m!1214883 () Bool)

(assert (=> b!1325948 m!1214883))

(assert (=> b!1325944 m!1214849))

(assert (=> b!1325944 m!1214849))

(declare-fun m!1214885 () Bool)

(assert (=> b!1325944 m!1214885))

(declare-fun m!1214887 () Bool)

(assert (=> b!1325945 m!1214887))

(check-sat tp_is_empty!36315 (not b!1325950) (not b!1325945) (not b!1325948) (not mapNonEmpty!56124) (not b_next!30495) (not b!1325944) (not b!1325952) (not start!111896) b_and!49087 (not b_lambda!23773))
(check-sat b_and!49087 (not b_next!30495))
