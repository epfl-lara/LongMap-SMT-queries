; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111626 () Bool)

(assert start!111626)

(declare-fun b_free!30283 () Bool)

(declare-fun b_next!30283 () Bool)

(assert (=> start!111626 (= b_free!30283 (not b_next!30283))))

(declare-fun tp!106325 () Bool)

(declare-fun b_and!48707 () Bool)

(assert (=> start!111626 (= tp!106325 b_and!48707)))

(declare-fun b!1322100 () Bool)

(declare-fun res!877548 () Bool)

(declare-fun e!753931 () Bool)

(assert (=> b!1322100 (=> (not res!877548) (not e!753931))))

(declare-datatypes ((array!89059 0))(
  ( (array!89060 (arr!43004 (Array (_ BitVec 32) (_ BitVec 64))) (size!43556 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89059)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1322100 (= res!877548 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43556 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1322101 () Bool)

(declare-fun res!877546 () Bool)

(assert (=> b!1322101 (=> (not res!877546) (not e!753931))))

(declare-datatypes ((V!53241 0))(
  ( (V!53242 (val!18126 Int)) )
))
(declare-fun zeroValue!1279 () V!53241)

(declare-datatypes ((ValueCell!17153 0))(
  ( (ValueCellFull!17153 (v!20755 V!53241)) (EmptyCell!17153) )
))
(declare-datatypes ((array!89061 0))(
  ( (array!89062 (arr!43005 (Array (_ BitVec 32) ValueCell!17153)) (size!43557 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89061)

(declare-fun minValue!1279 () V!53241)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23428 0))(
  ( (tuple2!23429 (_1!11725 (_ BitVec 64)) (_2!11725 V!53241)) )
))
(declare-datatypes ((List!30562 0))(
  ( (Nil!30559) (Cons!30558 (h!31767 tuple2!23428) (t!44386 List!30562)) )
))
(declare-datatypes ((ListLongMap!21085 0))(
  ( (ListLongMap!21086 (toList!10558 List!30562)) )
))
(declare-fun contains!8641 (ListLongMap!21085 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5443 (array!89059 array!89061 (_ BitVec 32) (_ BitVec 32) V!53241 V!53241 (_ BitVec 32) Int) ListLongMap!21085)

(assert (=> b!1322101 (= res!877546 (contains!8641 (getCurrentListMap!5443 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1322102 () Bool)

(assert (=> b!1322102 (= e!753931 (not true))))

(declare-fun lt!587777 () ListLongMap!21085)

(declare-fun lt!587780 () tuple2!23428)

(declare-fun +!4599 (ListLongMap!21085 tuple2!23428) ListLongMap!21085)

(assert (=> b!1322102 (contains!8641 (+!4599 lt!587777 lt!587780) k0!1164)))

(declare-datatypes ((Unit!43381 0))(
  ( (Unit!43382) )
))
(declare-fun lt!587779 () Unit!43381)

(declare-fun addStillContains!1123 (ListLongMap!21085 (_ BitVec 64) V!53241 (_ BitVec 64)) Unit!43381)

(assert (=> b!1322102 (= lt!587779 (addStillContains!1123 lt!587777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1322102 (contains!8641 lt!587777 k0!1164)))

(declare-fun lt!587781 () Unit!43381)

(declare-fun lt!587776 () V!53241)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!164 ((_ BitVec 64) (_ BitVec 64) V!53241 ListLongMap!21085) Unit!43381)

(assert (=> b!1322102 (= lt!587781 (lemmaInListMapAfterAddingDiffThenInBefore!164 k0!1164 (select (arr!43004 _keys!1609) from!2000) lt!587776 lt!587777))))

(declare-fun lt!587773 () ListLongMap!21085)

(assert (=> b!1322102 (contains!8641 lt!587773 k0!1164)))

(declare-fun lt!587775 () Unit!43381)

(assert (=> b!1322102 (= lt!587775 (lemmaInListMapAfterAddingDiffThenInBefore!164 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587773))))

(declare-fun lt!587774 () ListLongMap!21085)

(assert (=> b!1322102 (contains!8641 lt!587774 k0!1164)))

(declare-fun lt!587778 () Unit!43381)

(assert (=> b!1322102 (= lt!587778 (lemmaInListMapAfterAddingDiffThenInBefore!164 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587774))))

(assert (=> b!1322102 (= lt!587774 (+!4599 lt!587773 lt!587780))))

(assert (=> b!1322102 (= lt!587780 (tuple2!23429 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322102 (= lt!587773 (+!4599 lt!587777 (tuple2!23429 (select (arr!43004 _keys!1609) from!2000) lt!587776)))))

(declare-fun get!21652 (ValueCell!17153 V!53241) V!53241)

(declare-fun dynLambda!3529 (Int (_ BitVec 64)) V!53241)

(assert (=> b!1322102 (= lt!587776 (get!21652 (select (arr!43005 _values!1337) from!2000) (dynLambda!3529 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6232 (array!89059 array!89061 (_ BitVec 32) (_ BitVec 32) V!53241 V!53241 (_ BitVec 32) Int) ListLongMap!21085)

(assert (=> b!1322102 (= lt!587777 (getCurrentListMapNoExtraKeys!6232 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1322103 () Bool)

(declare-fun res!877551 () Bool)

(assert (=> b!1322103 (=> (not res!877551) (not e!753931))))

(assert (=> b!1322103 (= res!877551 (and (= (size!43557 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43556 _keys!1609) (size!43557 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322104 () Bool)

(declare-fun e!753928 () Bool)

(declare-fun tp_is_empty!36103 () Bool)

(assert (=> b!1322104 (= e!753928 tp_is_empty!36103)))

(declare-fun res!877544 () Bool)

(assert (=> start!111626 (=> (not res!877544) (not e!753931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111626 (= res!877544 (validMask!0 mask!2019))))

(assert (=> start!111626 e!753931))

(declare-fun array_inv!32651 (array!89059) Bool)

(assert (=> start!111626 (array_inv!32651 _keys!1609)))

(assert (=> start!111626 true))

(assert (=> start!111626 tp_is_empty!36103))

(declare-fun e!753929 () Bool)

(declare-fun array_inv!32652 (array!89061) Bool)

(assert (=> start!111626 (and (array_inv!32652 _values!1337) e!753929)))

(assert (=> start!111626 tp!106325))

(declare-fun mapNonEmpty!55802 () Bool)

(declare-fun mapRes!55802 () Bool)

(declare-fun tp!106326 () Bool)

(assert (=> mapNonEmpty!55802 (= mapRes!55802 (and tp!106326 e!753928))))

(declare-fun mapValue!55802 () ValueCell!17153)

(declare-fun mapRest!55802 () (Array (_ BitVec 32) ValueCell!17153))

(declare-fun mapKey!55802 () (_ BitVec 32))

(assert (=> mapNonEmpty!55802 (= (arr!43005 _values!1337) (store mapRest!55802 mapKey!55802 mapValue!55802))))

(declare-fun b!1322105 () Bool)

(declare-fun e!753930 () Bool)

(assert (=> b!1322105 (= e!753930 tp_is_empty!36103)))

(declare-fun b!1322106 () Bool)

(declare-fun res!877549 () Bool)

(assert (=> b!1322106 (=> (not res!877549) (not e!753931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89059 (_ BitVec 32)) Bool)

(assert (=> b!1322106 (= res!877549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapIsEmpty!55802 () Bool)

(assert (=> mapIsEmpty!55802 mapRes!55802))

(declare-fun b!1322107 () Bool)

(declare-fun res!877545 () Bool)

(assert (=> b!1322107 (=> (not res!877545) (not e!753931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322107 (= res!877545 (validKeyInArray!0 (select (arr!43004 _keys!1609) from!2000)))))

(declare-fun b!1322108 () Bool)

(assert (=> b!1322108 (= e!753929 (and e!753930 mapRes!55802))))

(declare-fun condMapEmpty!55802 () Bool)

(declare-fun mapDefault!55802 () ValueCell!17153)

(assert (=> b!1322108 (= condMapEmpty!55802 (= (arr!43005 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17153)) mapDefault!55802)))))

(declare-fun b!1322109 () Bool)

(declare-fun res!877550 () Bool)

(assert (=> b!1322109 (=> (not res!877550) (not e!753931))))

(assert (=> b!1322109 (= res!877550 (not (= (select (arr!43004 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1322110 () Bool)

(declare-fun res!877547 () Bool)

(assert (=> b!1322110 (=> (not res!877547) (not e!753931))))

(declare-datatypes ((List!30563 0))(
  ( (Nil!30560) (Cons!30559 (h!31768 (_ BitVec 64)) (t!44387 List!30563)) )
))
(declare-fun arrayNoDuplicates!0 (array!89059 (_ BitVec 32) List!30563) Bool)

(assert (=> b!1322110 (= res!877547 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30560))))

(assert (= (and start!111626 res!877544) b!1322103))

(assert (= (and b!1322103 res!877551) b!1322106))

(assert (= (and b!1322106 res!877549) b!1322110))

(assert (= (and b!1322110 res!877547) b!1322100))

(assert (= (and b!1322100 res!877548) b!1322101))

(assert (= (and b!1322101 res!877546) b!1322109))

(assert (= (and b!1322109 res!877550) b!1322107))

(assert (= (and b!1322107 res!877545) b!1322102))

(assert (= (and b!1322108 condMapEmpty!55802) mapIsEmpty!55802))

(assert (= (and b!1322108 (not condMapEmpty!55802)) mapNonEmpty!55802))

(get-info :version)

(assert (= (and mapNonEmpty!55802 ((_ is ValueCellFull!17153) mapValue!55802)) b!1322104))

(assert (= (and b!1322108 ((_ is ValueCellFull!17153) mapDefault!55802)) b!1322105))

(assert (= start!111626 b!1322108))

(declare-fun b_lambda!23599 () Bool)

(assert (=> (not b_lambda!23599) (not b!1322102)))

(declare-fun t!44385 () Bool)

(declare-fun tb!11627 () Bool)

(assert (=> (and start!111626 (= defaultEntry!1340 defaultEntry!1340) t!44385) tb!11627))

(declare-fun result!24317 () Bool)

(assert (=> tb!11627 (= result!24317 tp_is_empty!36103)))

(assert (=> b!1322102 t!44385))

(declare-fun b_and!48709 () Bool)

(assert (= b_and!48707 (and (=> t!44385 result!24317) b_and!48709)))

(declare-fun m!1209825 () Bool)

(assert (=> start!111626 m!1209825))

(declare-fun m!1209827 () Bool)

(assert (=> start!111626 m!1209827))

(declare-fun m!1209829 () Bool)

(assert (=> start!111626 m!1209829))

(declare-fun m!1209831 () Bool)

(assert (=> b!1322106 m!1209831))

(declare-fun m!1209833 () Bool)

(assert (=> b!1322107 m!1209833))

(assert (=> b!1322107 m!1209833))

(declare-fun m!1209835 () Bool)

(assert (=> b!1322107 m!1209835))

(declare-fun m!1209837 () Bool)

(assert (=> mapNonEmpty!55802 m!1209837))

(declare-fun m!1209839 () Bool)

(assert (=> b!1322101 m!1209839))

(assert (=> b!1322101 m!1209839))

(declare-fun m!1209841 () Bool)

(assert (=> b!1322101 m!1209841))

(declare-fun m!1209843 () Bool)

(assert (=> b!1322110 m!1209843))

(declare-fun m!1209845 () Bool)

(assert (=> b!1322102 m!1209845))

(declare-fun m!1209847 () Bool)

(assert (=> b!1322102 m!1209847))

(declare-fun m!1209849 () Bool)

(assert (=> b!1322102 m!1209849))

(declare-fun m!1209851 () Bool)

(assert (=> b!1322102 m!1209851))

(assert (=> b!1322102 m!1209833))

(declare-fun m!1209853 () Bool)

(assert (=> b!1322102 m!1209853))

(assert (=> b!1322102 m!1209851))

(assert (=> b!1322102 m!1209845))

(declare-fun m!1209855 () Bool)

(assert (=> b!1322102 m!1209855))

(declare-fun m!1209857 () Bool)

(assert (=> b!1322102 m!1209857))

(declare-fun m!1209859 () Bool)

(assert (=> b!1322102 m!1209859))

(declare-fun m!1209861 () Bool)

(assert (=> b!1322102 m!1209861))

(declare-fun m!1209863 () Bool)

(assert (=> b!1322102 m!1209863))

(declare-fun m!1209865 () Bool)

(assert (=> b!1322102 m!1209865))

(declare-fun m!1209867 () Bool)

(assert (=> b!1322102 m!1209867))

(assert (=> b!1322102 m!1209833))

(declare-fun m!1209869 () Bool)

(assert (=> b!1322102 m!1209869))

(declare-fun m!1209871 () Bool)

(assert (=> b!1322102 m!1209871))

(assert (=> b!1322102 m!1209865))

(declare-fun m!1209873 () Bool)

(assert (=> b!1322102 m!1209873))

(assert (=> b!1322109 m!1209833))

(check-sat (not b_next!30283) (not b_lambda!23599) (not b!1322101) (not b!1322107) (not mapNonEmpty!55802) tp_is_empty!36103 (not b!1322106) (not start!111626) (not b!1322102) b_and!48709 (not b!1322110))
(check-sat b_and!48709 (not b_next!30283))
