; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111850 () Bool)

(assert start!111850)

(declare-fun b_free!30283 () Bool)

(declare-fun b_next!30283 () Bool)

(assert (=> start!111850 (= b_free!30283 (not b_next!30283))))

(declare-fun tp!106324 () Bool)

(declare-fun b_and!48727 () Bool)

(assert (=> start!111850 (= tp!106324 b_and!48727)))

(declare-fun b!1323469 () Bool)

(declare-fun res!878091 () Bool)

(declare-fun e!754804 () Bool)

(assert (=> b!1323469 (=> (not res!878091) (not e!754804))))

(declare-datatypes ((array!89211 0))(
  ( (array!89212 (arr!43075 (Array (_ BitVec 32) (_ BitVec 64))) (size!43626 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89211)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53241 0))(
  ( (V!53242 (val!18126 Int)) )
))
(declare-fun zeroValue!1279 () V!53241)

(declare-datatypes ((ValueCell!17153 0))(
  ( (ValueCellFull!17153 (v!20751 V!53241)) (EmptyCell!17153) )
))
(declare-datatypes ((array!89213 0))(
  ( (array!89214 (arr!43076 (Array (_ BitVec 32) ValueCell!17153)) (size!43627 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89213)

(declare-fun minValue!1279 () V!53241)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((tuple2!23396 0))(
  ( (tuple2!23397 (_1!11709 (_ BitVec 64)) (_2!11709 V!53241)) )
))
(declare-datatypes ((List!30546 0))(
  ( (Nil!30543) (Cons!30542 (h!31760 tuple2!23396) (t!44370 List!30546)) )
))
(declare-datatypes ((ListLongMap!21061 0))(
  ( (ListLongMap!21062 (toList!10546 List!30546)) )
))
(declare-fun contains!8713 (ListLongMap!21061 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5536 (array!89211 array!89213 (_ BitVec 32) (_ BitVec 32) V!53241 V!53241 (_ BitVec 32) Int) ListLongMap!21061)

(assert (=> b!1323469 (= res!878091 (contains!8713 (getCurrentListMap!5536 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1323470 () Bool)

(declare-fun res!878097 () Bool)

(assert (=> b!1323470 (=> (not res!878097) (not e!754804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89211 (_ BitVec 32)) Bool)

(assert (=> b!1323470 (= res!878097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323471 () Bool)

(declare-fun res!878094 () Bool)

(assert (=> b!1323471 (=> (not res!878094) (not e!754804))))

(assert (=> b!1323471 (= res!878094 (and (= (size!43627 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43626 _keys!1609) (size!43627 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323473 () Bool)

(declare-fun res!878092 () Bool)

(assert (=> b!1323473 (=> (not res!878092) (not e!754804))))

(declare-datatypes ((List!30547 0))(
  ( (Nil!30544) (Cons!30543 (h!31761 (_ BitVec 64)) (t!44371 List!30547)) )
))
(declare-fun arrayNoDuplicates!0 (array!89211 (_ BitVec 32) List!30547) Bool)

(assert (=> b!1323473 (= res!878092 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30544))))

(declare-fun b!1323474 () Bool)

(declare-fun res!878096 () Bool)

(assert (=> b!1323474 (=> (not res!878096) (not e!754804))))

(assert (=> b!1323474 (= res!878096 (not (= (select (arr!43075 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1323475 () Bool)

(declare-fun e!754806 () Bool)

(declare-fun e!754807 () Bool)

(declare-fun mapRes!55802 () Bool)

(assert (=> b!1323475 (= e!754806 (and e!754807 mapRes!55802))))

(declare-fun condMapEmpty!55802 () Bool)

(declare-fun mapDefault!55802 () ValueCell!17153)

(assert (=> b!1323475 (= condMapEmpty!55802 (= (arr!43076 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17153)) mapDefault!55802)))))

(declare-fun mapIsEmpty!55802 () Bool)

(assert (=> mapIsEmpty!55802 mapRes!55802))

(declare-fun b!1323476 () Bool)

(declare-fun res!878093 () Bool)

(assert (=> b!1323476 (=> (not res!878093) (not e!754804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323476 (= res!878093 (validKeyInArray!0 (select (arr!43075 _keys!1609) from!2000)))))

(declare-fun b!1323477 () Bool)

(declare-fun e!754805 () Bool)

(declare-fun tp_is_empty!36103 () Bool)

(assert (=> b!1323477 (= e!754805 tp_is_empty!36103)))

(declare-fun b!1323478 () Bool)

(declare-fun res!878095 () Bool)

(assert (=> b!1323478 (=> (not res!878095) (not e!754804))))

(assert (=> b!1323478 (= res!878095 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43626 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323479 () Bool)

(assert (=> b!1323479 (= e!754807 tp_is_empty!36103)))

(declare-fun mapNonEmpty!55802 () Bool)

(declare-fun tp!106325 () Bool)

(assert (=> mapNonEmpty!55802 (= mapRes!55802 (and tp!106325 e!754805))))

(declare-fun mapRest!55802 () (Array (_ BitVec 32) ValueCell!17153))

(declare-fun mapValue!55802 () ValueCell!17153)

(declare-fun mapKey!55802 () (_ BitVec 32))

(assert (=> mapNonEmpty!55802 (= (arr!43076 _values!1337) (store mapRest!55802 mapKey!55802 mapValue!55802))))

(declare-fun b!1323472 () Bool)

(assert (=> b!1323472 (= e!754804 (not true))))

(declare-fun lt!588438 () ListLongMap!21061)

(declare-fun lt!588436 () tuple2!23396)

(declare-fun +!4621 (ListLongMap!21061 tuple2!23396) ListLongMap!21061)

(assert (=> b!1323472 (contains!8713 (+!4621 lt!588438 lt!588436) k0!1164)))

(declare-datatypes ((Unit!43529 0))(
  ( (Unit!43530) )
))
(declare-fun lt!588443 () Unit!43529)

(declare-fun addStillContains!1133 (ListLongMap!21061 (_ BitVec 64) V!53241 (_ BitVec 64)) Unit!43529)

(assert (=> b!1323472 (= lt!588443 (addStillContains!1133 lt!588438 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1323472 (contains!8713 lt!588438 k0!1164)))

(declare-fun lt!588441 () Unit!43529)

(declare-fun lt!588437 () V!53241)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!176 ((_ BitVec 64) (_ BitVec 64) V!53241 ListLongMap!21061) Unit!43529)

(assert (=> b!1323472 (= lt!588441 (lemmaInListMapAfterAddingDiffThenInBefore!176 k0!1164 (select (arr!43075 _keys!1609) from!2000) lt!588437 lt!588438))))

(declare-fun lt!588439 () ListLongMap!21061)

(assert (=> b!1323472 (contains!8713 lt!588439 k0!1164)))

(declare-fun lt!588435 () Unit!43529)

(assert (=> b!1323472 (= lt!588435 (lemmaInListMapAfterAddingDiffThenInBefore!176 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588439))))

(declare-fun lt!588442 () ListLongMap!21061)

(assert (=> b!1323472 (contains!8713 lt!588442 k0!1164)))

(declare-fun lt!588440 () Unit!43529)

(assert (=> b!1323472 (= lt!588440 (lemmaInListMapAfterAddingDiffThenInBefore!176 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588442))))

(assert (=> b!1323472 (= lt!588442 (+!4621 lt!588439 lt!588436))))

(assert (=> b!1323472 (= lt!588436 (tuple2!23397 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323472 (= lt!588439 (+!4621 lt!588438 (tuple2!23397 (select (arr!43075 _keys!1609) from!2000) lt!588437)))))

(declare-fun get!21710 (ValueCell!17153 V!53241) V!53241)

(declare-fun dynLambda!3575 (Int (_ BitVec 64)) V!53241)

(assert (=> b!1323472 (= lt!588437 (get!21710 (select (arr!43076 _values!1337) from!2000) (dynLambda!3575 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6260 (array!89211 array!89213 (_ BitVec 32) (_ BitVec 32) V!53241 V!53241 (_ BitVec 32) Int) ListLongMap!21061)

(assert (=> b!1323472 (= lt!588438 (getCurrentListMapNoExtraKeys!6260 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun res!878098 () Bool)

(assert (=> start!111850 (=> (not res!878098) (not e!754804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111850 (= res!878098 (validMask!0 mask!2019))))

(assert (=> start!111850 e!754804))

(declare-fun array_inv!32795 (array!89211) Bool)

(assert (=> start!111850 (array_inv!32795 _keys!1609)))

(assert (=> start!111850 true))

(assert (=> start!111850 tp_is_empty!36103))

(declare-fun array_inv!32796 (array!89213) Bool)

(assert (=> start!111850 (and (array_inv!32796 _values!1337) e!754806)))

(assert (=> start!111850 tp!106324))

(assert (= (and start!111850 res!878098) b!1323471))

(assert (= (and b!1323471 res!878094) b!1323470))

(assert (= (and b!1323470 res!878097) b!1323473))

(assert (= (and b!1323473 res!878092) b!1323478))

(assert (= (and b!1323478 res!878095) b!1323469))

(assert (= (and b!1323469 res!878091) b!1323474))

(assert (= (and b!1323474 res!878096) b!1323476))

(assert (= (and b!1323476 res!878093) b!1323472))

(assert (= (and b!1323475 condMapEmpty!55802) mapIsEmpty!55802))

(assert (= (and b!1323475 (not condMapEmpty!55802)) mapNonEmpty!55802))

(get-info :version)

(assert (= (and mapNonEmpty!55802 ((_ is ValueCellFull!17153) mapValue!55802)) b!1323477))

(assert (= (and b!1323475 ((_ is ValueCellFull!17153) mapDefault!55802)) b!1323479))

(assert (= start!111850 b!1323475))

(declare-fun b_lambda!23603 () Bool)

(assert (=> (not b_lambda!23603) (not b!1323472)))

(declare-fun t!44369 () Bool)

(declare-fun tb!11627 () Bool)

(assert (=> (and start!111850 (= defaultEntry!1340 defaultEntry!1340) t!44369) tb!11627))

(declare-fun result!24317 () Bool)

(assert (=> tb!11627 (= result!24317 tp_is_empty!36103)))

(assert (=> b!1323472 t!44369))

(declare-fun b_and!48729 () Bool)

(assert (= b_and!48727 (and (=> t!44369 result!24317) b_and!48729)))

(declare-fun m!1211939 () Bool)

(assert (=> b!1323473 m!1211939))

(declare-fun m!1211941 () Bool)

(assert (=> mapNonEmpty!55802 m!1211941))

(declare-fun m!1211943 () Bool)

(assert (=> start!111850 m!1211943))

(declare-fun m!1211945 () Bool)

(assert (=> start!111850 m!1211945))

(declare-fun m!1211947 () Bool)

(assert (=> start!111850 m!1211947))

(declare-fun m!1211949 () Bool)

(assert (=> b!1323470 m!1211949))

(declare-fun m!1211951 () Bool)

(assert (=> b!1323474 m!1211951))

(declare-fun m!1211953 () Bool)

(assert (=> b!1323469 m!1211953))

(assert (=> b!1323469 m!1211953))

(declare-fun m!1211955 () Bool)

(assert (=> b!1323469 m!1211955))

(declare-fun m!1211957 () Bool)

(assert (=> b!1323472 m!1211957))

(declare-fun m!1211959 () Bool)

(assert (=> b!1323472 m!1211959))

(declare-fun m!1211961 () Bool)

(assert (=> b!1323472 m!1211961))

(declare-fun m!1211963 () Bool)

(assert (=> b!1323472 m!1211963))

(declare-fun m!1211965 () Bool)

(assert (=> b!1323472 m!1211965))

(assert (=> b!1323472 m!1211951))

(declare-fun m!1211967 () Bool)

(assert (=> b!1323472 m!1211967))

(declare-fun m!1211969 () Bool)

(assert (=> b!1323472 m!1211969))

(declare-fun m!1211971 () Bool)

(assert (=> b!1323472 m!1211971))

(declare-fun m!1211973 () Bool)

(assert (=> b!1323472 m!1211973))

(declare-fun m!1211975 () Bool)

(assert (=> b!1323472 m!1211975))

(assert (=> b!1323472 m!1211973))

(declare-fun m!1211977 () Bool)

(assert (=> b!1323472 m!1211977))

(declare-fun m!1211979 () Bool)

(assert (=> b!1323472 m!1211979))

(assert (=> b!1323472 m!1211965))

(declare-fun m!1211981 () Bool)

(assert (=> b!1323472 m!1211981))

(declare-fun m!1211983 () Bool)

(assert (=> b!1323472 m!1211983))

(assert (=> b!1323472 m!1211951))

(assert (=> b!1323472 m!1211977))

(declare-fun m!1211985 () Bool)

(assert (=> b!1323472 m!1211985))

(assert (=> b!1323476 m!1211951))

(assert (=> b!1323476 m!1211951))

(declare-fun m!1211987 () Bool)

(assert (=> b!1323476 m!1211987))

(check-sat (not b!1323469) (not mapNonEmpty!55802) (not b_next!30283) (not b!1323473) b_and!48729 (not b!1323472) (not start!111850) (not b!1323470) (not b!1323476) tp_is_empty!36103 (not b_lambda!23603))
(check-sat b_and!48729 (not b_next!30283))
