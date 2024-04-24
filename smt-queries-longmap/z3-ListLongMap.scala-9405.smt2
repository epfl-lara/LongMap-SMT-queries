; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112148 () Bool)

(assert start!112148)

(declare-fun b_free!30523 () Bool)

(declare-fun b_next!30523 () Bool)

(assert (=> start!112148 (= b_free!30523 (not b_next!30523))))

(declare-fun tp!107049 () Bool)

(declare-fun b_and!49143 () Bool)

(assert (=> start!112148 (= tp!107049 b_and!49143)))

(declare-fun b!1327732 () Bool)

(declare-fun res!880871 () Bool)

(declare-fun e!756863 () Bool)

(assert (=> b!1327732 (=> (not res!880871) (not e!756863))))

(declare-datatypes ((array!89687 0))(
  ( (array!89688 (arr!43312 (Array (_ BitVec 32) (_ BitVec 64))) (size!43863 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89687)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1327732 (= res!880871 (not (= (select (arr!43312 _keys!1609) from!2000) k0!1164)))))

(declare-fun res!880877 () Bool)

(assert (=> start!112148 (=> (not res!880877) (not e!756863))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112148 (= res!880877 (validMask!0 mask!2019))))

(assert (=> start!112148 e!756863))

(declare-fun array_inv!32955 (array!89687) Bool)

(assert (=> start!112148 (array_inv!32955 _keys!1609)))

(assert (=> start!112148 true))

(declare-fun tp_is_empty!36343 () Bool)

(assert (=> start!112148 tp_is_empty!36343))

(declare-datatypes ((V!53561 0))(
  ( (V!53562 (val!18246 Int)) )
))
(declare-datatypes ((ValueCell!17273 0))(
  ( (ValueCellFull!17273 (v!20874 V!53561)) (EmptyCell!17273) )
))
(declare-datatypes ((array!89689 0))(
  ( (array!89690 (arr!43313 (Array (_ BitVec 32) ValueCell!17273)) (size!43864 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89689)

(declare-fun e!756864 () Bool)

(declare-fun array_inv!32956 (array!89689) Bool)

(assert (=> start!112148 (and (array_inv!32956 _values!1337) e!756864)))

(assert (=> start!112148 tp!107049))

(declare-fun b!1327733 () Bool)

(declare-fun res!880874 () Bool)

(assert (=> b!1327733 (=> (not res!880874) (not e!756863))))

(declare-datatypes ((List!30720 0))(
  ( (Nil!30717) (Cons!30716 (h!31934 (_ BitVec 64)) (t!44706 List!30720)) )
))
(declare-fun arrayNoDuplicates!0 (array!89687 (_ BitVec 32) List!30720) Bool)

(assert (=> b!1327733 (= res!880874 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30717))))

(declare-fun b!1327734 () Bool)

(declare-fun res!880878 () Bool)

(assert (=> b!1327734 (=> (not res!880878) (not e!756863))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1327734 (= res!880878 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43863 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!56166 () Bool)

(declare-fun mapRes!56166 () Bool)

(declare-fun tp!107048 () Bool)

(declare-fun e!756865 () Bool)

(assert (=> mapNonEmpty!56166 (= mapRes!56166 (and tp!107048 e!756865))))

(declare-fun mapValue!56166 () ValueCell!17273)

(declare-fun mapKey!56166 () (_ BitVec 32))

(declare-fun mapRest!56166 () (Array (_ BitVec 32) ValueCell!17273))

(assert (=> mapNonEmpty!56166 (= (arr!43313 _values!1337) (store mapRest!56166 mapKey!56166 mapValue!56166))))

(declare-fun b!1327735 () Bool)

(declare-fun res!880873 () Bool)

(assert (=> b!1327735 (=> (not res!880873) (not e!756863))))

(declare-fun zeroValue!1279 () V!53561)

(declare-fun minValue!1279 () V!53561)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23568 0))(
  ( (tuple2!23569 (_1!11795 (_ BitVec 64)) (_2!11795 V!53561)) )
))
(declare-datatypes ((List!30721 0))(
  ( (Nil!30718) (Cons!30717 (h!31935 tuple2!23568) (t!44707 List!30721)) )
))
(declare-datatypes ((ListLongMap!21233 0))(
  ( (ListLongMap!21234 (toList!10632 List!30721)) )
))
(declare-fun contains!8800 (ListLongMap!21233 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5610 (array!89687 array!89689 (_ BitVec 32) (_ BitVec 32) V!53561 V!53561 (_ BitVec 32) Int) ListLongMap!21233)

(assert (=> b!1327735 (= res!880873 (contains!8800 (getCurrentListMap!5610 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapIsEmpty!56166 () Bool)

(assert (=> mapIsEmpty!56166 mapRes!56166))

(declare-fun b!1327736 () Bool)

(assert (=> b!1327736 (= e!756865 tp_is_empty!36343)))

(declare-fun b!1327737 () Bool)

(declare-fun e!756861 () Bool)

(assert (=> b!1327737 (= e!756864 (and e!756861 mapRes!56166))))

(declare-fun condMapEmpty!56166 () Bool)

(declare-fun mapDefault!56166 () ValueCell!17273)

(assert (=> b!1327737 (= condMapEmpty!56166 (= (arr!43313 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17273)) mapDefault!56166)))))

(declare-fun b!1327738 () Bool)

(declare-fun res!880876 () Bool)

(assert (=> b!1327738 (=> (not res!880876) (not e!756863))))

(assert (=> b!1327738 (= res!880876 (and (= (size!43864 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43863 _keys!1609) (size!43864 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1327739 () Bool)

(assert (=> b!1327739 (= e!756861 tp_is_empty!36343)))

(declare-fun b!1327740 () Bool)

(declare-fun res!880875 () Bool)

(assert (=> b!1327740 (=> (not res!880875) (not e!756863))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1327740 (= res!880875 (validKeyInArray!0 (select (arr!43312 _keys!1609) from!2000)))))

(declare-fun b!1327741 () Bool)

(assert (=> b!1327741 (= e!756863 (not true))))

(declare-fun lt!590563 () ListLongMap!21233)

(declare-fun lt!590567 () tuple2!23568)

(declare-fun +!4676 (ListLongMap!21233 tuple2!23568) ListLongMap!21233)

(assert (=> b!1327741 (contains!8800 (+!4676 lt!590563 lt!590567) k0!1164)))

(declare-datatypes ((Unit!43645 0))(
  ( (Unit!43646) )
))
(declare-fun lt!590562 () Unit!43645)

(declare-fun addStillContains!1168 (ListLongMap!21233 (_ BitVec 64) V!53561 (_ BitVec 64)) Unit!43645)

(assert (=> b!1327741 (= lt!590562 (addStillContains!1168 lt!590563 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1327741 (contains!8800 lt!590563 k0!1164)))

(declare-fun lt!590561 () Unit!43645)

(declare-fun lt!590560 () V!53561)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!226 ((_ BitVec 64) (_ BitVec 64) V!53561 ListLongMap!21233) Unit!43645)

(assert (=> b!1327741 (= lt!590561 (lemmaInListMapAfterAddingDiffThenInBefore!226 k0!1164 (select (arr!43312 _keys!1609) from!2000) lt!590560 lt!590563))))

(declare-fun lt!590565 () ListLongMap!21233)

(assert (=> b!1327741 (contains!8800 lt!590565 k0!1164)))

(declare-fun lt!590559 () Unit!43645)

(assert (=> b!1327741 (= lt!590559 (lemmaInListMapAfterAddingDiffThenInBefore!226 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!590565))))

(declare-fun lt!590564 () ListLongMap!21233)

(assert (=> b!1327741 (contains!8800 lt!590564 k0!1164)))

(declare-fun lt!590566 () Unit!43645)

(assert (=> b!1327741 (= lt!590566 (lemmaInListMapAfterAddingDiffThenInBefore!226 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!590564))))

(assert (=> b!1327741 (= lt!590564 (+!4676 lt!590565 lt!590567))))

(assert (=> b!1327741 (= lt!590567 (tuple2!23569 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1327741 (= lt!590565 (+!4676 lt!590563 (tuple2!23569 (select (arr!43312 _keys!1609) from!2000) lt!590560)))))

(declare-fun get!21848 (ValueCell!17273 V!53561) V!53561)

(declare-fun dynLambda!3630 (Int (_ BitVec 64)) V!53561)

(assert (=> b!1327741 (= lt!590560 (get!21848 (select (arr!43313 _values!1337) from!2000) (dynLambda!3630 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6320 (array!89687 array!89689 (_ BitVec 32) (_ BitVec 32) V!53561 V!53561 (_ BitVec 32) Int) ListLongMap!21233)

(assert (=> b!1327741 (= lt!590563 (getCurrentListMapNoExtraKeys!6320 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1327742 () Bool)

(declare-fun res!880872 () Bool)

(assert (=> b!1327742 (=> (not res!880872) (not e!756863))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89687 (_ BitVec 32)) Bool)

(assert (=> b!1327742 (= res!880872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(assert (= (and start!112148 res!880877) b!1327738))

(assert (= (and b!1327738 res!880876) b!1327742))

(assert (= (and b!1327742 res!880872) b!1327733))

(assert (= (and b!1327733 res!880874) b!1327734))

(assert (= (and b!1327734 res!880878) b!1327735))

(assert (= (and b!1327735 res!880873) b!1327732))

(assert (= (and b!1327732 res!880871) b!1327740))

(assert (= (and b!1327740 res!880875) b!1327741))

(assert (= (and b!1327737 condMapEmpty!56166) mapIsEmpty!56166))

(assert (= (and b!1327737 (not condMapEmpty!56166)) mapNonEmpty!56166))

(get-info :version)

(assert (= (and mapNonEmpty!56166 ((_ is ValueCellFull!17273) mapValue!56166)) b!1327736))

(assert (= (and b!1327737 ((_ is ValueCellFull!17273) mapDefault!56166)) b!1327739))

(assert (= start!112148 b!1327737))

(declare-fun b_lambda!23795 () Bool)

(assert (=> (not b_lambda!23795) (not b!1327741)))

(declare-fun t!44705 () Bool)

(declare-fun tb!11789 () Bool)

(assert (=> (and start!112148 (= defaultEntry!1340 defaultEntry!1340) t!44705) tb!11789))

(declare-fun result!24643 () Bool)

(assert (=> tb!11789 (= result!24643 tp_is_empty!36343)))

(assert (=> b!1327741 t!44705))

(declare-fun b_and!49145 () Bool)

(assert (= b_and!49143 (and (=> t!44705 result!24643) b_and!49145)))

(declare-fun m!1217019 () Bool)

(assert (=> b!1327733 m!1217019))

(declare-fun m!1217021 () Bool)

(assert (=> mapNonEmpty!56166 m!1217021))

(declare-fun m!1217023 () Bool)

(assert (=> start!112148 m!1217023))

(declare-fun m!1217025 () Bool)

(assert (=> start!112148 m!1217025))

(declare-fun m!1217027 () Bool)

(assert (=> start!112148 m!1217027))

(declare-fun m!1217029 () Bool)

(assert (=> b!1327732 m!1217029))

(declare-fun m!1217031 () Bool)

(assert (=> b!1327735 m!1217031))

(assert (=> b!1327735 m!1217031))

(declare-fun m!1217033 () Bool)

(assert (=> b!1327735 m!1217033))

(declare-fun m!1217035 () Bool)

(assert (=> b!1327742 m!1217035))

(assert (=> b!1327740 m!1217029))

(assert (=> b!1327740 m!1217029))

(declare-fun m!1217037 () Bool)

(assert (=> b!1327740 m!1217037))

(declare-fun m!1217039 () Bool)

(assert (=> b!1327741 m!1217039))

(declare-fun m!1217041 () Bool)

(assert (=> b!1327741 m!1217041))

(declare-fun m!1217043 () Bool)

(assert (=> b!1327741 m!1217043))

(declare-fun m!1217045 () Bool)

(assert (=> b!1327741 m!1217045))

(declare-fun m!1217047 () Bool)

(assert (=> b!1327741 m!1217047))

(declare-fun m!1217049 () Bool)

(assert (=> b!1327741 m!1217049))

(declare-fun m!1217051 () Bool)

(assert (=> b!1327741 m!1217051))

(declare-fun m!1217053 () Bool)

(assert (=> b!1327741 m!1217053))

(assert (=> b!1327741 m!1217049))

(declare-fun m!1217055 () Bool)

(assert (=> b!1327741 m!1217055))

(declare-fun m!1217057 () Bool)

(assert (=> b!1327741 m!1217057))

(declare-fun m!1217059 () Bool)

(assert (=> b!1327741 m!1217059))

(assert (=> b!1327741 m!1217055))

(declare-fun m!1217061 () Bool)

(assert (=> b!1327741 m!1217061))

(declare-fun m!1217063 () Bool)

(assert (=> b!1327741 m!1217063))

(assert (=> b!1327741 m!1217029))

(declare-fun m!1217065 () Bool)

(assert (=> b!1327741 m!1217065))

(declare-fun m!1217067 () Bool)

(assert (=> b!1327741 m!1217067))

(assert (=> b!1327741 m!1217039))

(assert (=> b!1327741 m!1217029))

(check-sat (not b_next!30523) (not start!112148) b_and!49145 (not b!1327742) (not mapNonEmpty!56166) (not b!1327735) (not b!1327741) (not b!1327740) (not b!1327733) (not b_lambda!23795) tp_is_empty!36343)
(check-sat b_and!49145 (not b_next!30523))
