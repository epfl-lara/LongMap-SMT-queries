; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112574 () Bool)

(assert start!112574)

(declare-fun b_free!30745 () Bool)

(declare-fun b_next!30745 () Bool)

(assert (=> start!112574 (= b_free!30745 (not b_next!30745))))

(declare-fun tp!107872 () Bool)

(declare-fun b_and!49547 () Bool)

(assert (=> start!112574 (= tp!107872 b_and!49547)))

(declare-fun b!1333016 () Bool)

(declare-fun res!884232 () Bool)

(declare-fun e!759631 () Bool)

(assert (=> b!1333016 (=> (not res!884232) (not e!759631))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90295 0))(
  ( (array!90296 (arr!43609 (Array (_ BitVec 32) (_ BitVec 64))) (size!44160 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90295)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1333016 (= res!884232 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44160 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333017 () Bool)

(declare-fun e!759630 () Bool)

(declare-fun tp_is_empty!36655 () Bool)

(assert (=> b!1333017 (= e!759630 tp_is_empty!36655)))

(declare-fun mapNonEmpty!56656 () Bool)

(declare-fun mapRes!56656 () Bool)

(declare-fun tp!107871 () Bool)

(assert (=> mapNonEmpty!56656 (= mapRes!56656 (and tp!107871 e!759630))))

(declare-datatypes ((V!53977 0))(
  ( (V!53978 (val!18402 Int)) )
))
(declare-datatypes ((ValueCell!17429 0))(
  ( (ValueCellFull!17429 (v!21034 V!53977)) (EmptyCell!17429) )
))
(declare-fun mapValue!56656 () ValueCell!17429)

(declare-datatypes ((array!90297 0))(
  ( (array!90298 (arr!43610 (Array (_ BitVec 32) ValueCell!17429)) (size!44161 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90297)

(declare-fun mapKey!56656 () (_ BitVec 32))

(declare-fun mapRest!56656 () (Array (_ BitVec 32) ValueCell!17429))

(assert (=> mapNonEmpty!56656 (= (arr!43610 _values!1320) (store mapRest!56656 mapKey!56656 mapValue!56656))))

(declare-fun b!1333018 () Bool)

(declare-fun res!884236 () Bool)

(assert (=> b!1333018 (=> (not res!884236) (not e!759631))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53977)

(declare-fun zeroValue!1262 () V!53977)

(declare-datatypes ((tuple2!23738 0))(
  ( (tuple2!23739 (_1!11880 (_ BitVec 64)) (_2!11880 V!53977)) )
))
(declare-datatypes ((List!30901 0))(
  ( (Nil!30898) (Cons!30897 (h!32115 tuple2!23738) (t!45051 List!30901)) )
))
(declare-datatypes ((ListLongMap!21403 0))(
  ( (ListLongMap!21404 (toList!10717 List!30901)) )
))
(declare-fun contains!8893 (ListLongMap!21403 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5686 (array!90295 array!90297 (_ BitVec 32) (_ BitVec 32) V!53977 V!53977 (_ BitVec 32) Int) ListLongMap!21403)

(assert (=> b!1333018 (= res!884236 (contains!8893 (getCurrentListMap!5686 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1333019 () Bool)

(declare-fun res!884235 () Bool)

(assert (=> b!1333019 (=> (not res!884235) (not e!759631))))

(assert (=> b!1333019 (= res!884235 (not (= (select (arr!43609 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1333020 () Bool)

(declare-fun e!759633 () Bool)

(declare-fun e!759632 () Bool)

(assert (=> b!1333020 (= e!759633 (and e!759632 mapRes!56656))))

(declare-fun condMapEmpty!56656 () Bool)

(declare-fun mapDefault!56656 () ValueCell!17429)

(assert (=> b!1333020 (= condMapEmpty!56656 (= (arr!43610 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17429)) mapDefault!56656)))))

(declare-fun b!1333021 () Bool)

(declare-fun res!884239 () Bool)

(assert (=> b!1333021 (=> (not res!884239) (not e!759631))))

(assert (=> b!1333021 (= res!884239 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!884240 () Bool)

(assert (=> start!112574 (=> (not res!884240) (not e!759631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112574 (= res!884240 (validMask!0 mask!1998))))

(assert (=> start!112574 e!759631))

(declare-fun array_inv!33173 (array!90297) Bool)

(assert (=> start!112574 (and (array_inv!33173 _values!1320) e!759633)))

(assert (=> start!112574 true))

(declare-fun array_inv!33174 (array!90295) Bool)

(assert (=> start!112574 (array_inv!33174 _keys!1590)))

(assert (=> start!112574 tp!107872))

(assert (=> start!112574 tp_is_empty!36655))

(declare-fun b!1333022 () Bool)

(assert (=> b!1333022 (= e!759632 tp_is_empty!36655)))

(declare-fun mapIsEmpty!56656 () Bool)

(assert (=> mapIsEmpty!56656 mapRes!56656))

(declare-fun b!1333023 () Bool)

(declare-fun res!884237 () Bool)

(assert (=> b!1333023 (=> (not res!884237) (not e!759631))))

(assert (=> b!1333023 (= res!884237 (and (= (size!44161 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44160 _keys!1590) (size!44161 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333024 () Bool)

(declare-fun res!884234 () Bool)

(assert (=> b!1333024 (=> (not res!884234) (not e!759631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90295 (_ BitVec 32)) Bool)

(assert (=> b!1333024 (= res!884234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1333025 () Bool)

(declare-fun res!884238 () Bool)

(assert (=> b!1333025 (=> (not res!884238) (not e!759631))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333025 (= res!884238 (validKeyInArray!0 (select (arr!43609 _keys!1590) from!1980)))))

(declare-fun b!1333026 () Bool)

(declare-fun res!884233 () Bool)

(assert (=> b!1333026 (=> (not res!884233) (not e!759631))))

(declare-datatypes ((List!30902 0))(
  ( (Nil!30899) (Cons!30898 (h!32116 (_ BitVec 64)) (t!45052 List!30902)) )
))
(declare-fun arrayNoDuplicates!0 (array!90295 (_ BitVec 32) List!30902) Bool)

(assert (=> b!1333026 (= res!884233 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30899))))

(declare-fun b!1333027 () Bool)

(assert (=> b!1333027 (= e!759631 (not true))))

(declare-fun lt!592142 () ListLongMap!21403)

(declare-fun +!4728 (ListLongMap!21403 tuple2!23738) ListLongMap!21403)

(assert (=> b!1333027 (contains!8893 (+!4728 lt!592142 (tuple2!23739 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43766 0))(
  ( (Unit!43767) )
))
(declare-fun lt!592141 () Unit!43766)

(declare-fun addStillContains!1174 (ListLongMap!21403 (_ BitVec 64) V!53977 (_ BitVec 64)) Unit!43766)

(assert (=> b!1333027 (= lt!592141 (addStillContains!1174 lt!592142 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1333027 (contains!8893 lt!592142 k0!1153)))

(declare-fun lt!592143 () Unit!43766)

(declare-fun lt!592145 () V!53977)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!271 ((_ BitVec 64) (_ BitVec 64) V!53977 ListLongMap!21403) Unit!43766)

(assert (=> b!1333027 (= lt!592143 (lemmaInListMapAfterAddingDiffThenInBefore!271 k0!1153 (select (arr!43609 _keys!1590) from!1980) lt!592145 lt!592142))))

(declare-fun lt!592146 () ListLongMap!21403)

(assert (=> b!1333027 (contains!8893 lt!592146 k0!1153)))

(declare-fun lt!592144 () Unit!43766)

(assert (=> b!1333027 (= lt!592144 (lemmaInListMapAfterAddingDiffThenInBefore!271 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592146))))

(assert (=> b!1333027 (= lt!592146 (+!4728 lt!592142 (tuple2!23739 (select (arr!43609 _keys!1590) from!1980) lt!592145)))))

(declare-fun get!22009 (ValueCell!17429 V!53977) V!53977)

(declare-fun dynLambda!3682 (Int (_ BitVec 64)) V!53977)

(assert (=> b!1333027 (= lt!592145 (get!22009 (select (arr!43610 _values!1320) from!1980) (dynLambda!3682 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6372 (array!90295 array!90297 (_ BitVec 32) (_ BitVec 32) V!53977 V!53977 (_ BitVec 32) Int) ListLongMap!21403)

(assert (=> b!1333027 (= lt!592142 (getCurrentListMapNoExtraKeys!6372 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(assert (= (and start!112574 res!884240) b!1333023))

(assert (= (and b!1333023 res!884237) b!1333024))

(assert (= (and b!1333024 res!884234) b!1333026))

(assert (= (and b!1333026 res!884233) b!1333016))

(assert (= (and b!1333016 res!884232) b!1333018))

(assert (= (and b!1333018 res!884236) b!1333019))

(assert (= (and b!1333019 res!884235) b!1333025))

(assert (= (and b!1333025 res!884238) b!1333021))

(assert (= (and b!1333021 res!884239) b!1333027))

(assert (= (and b!1333020 condMapEmpty!56656) mapIsEmpty!56656))

(assert (= (and b!1333020 (not condMapEmpty!56656)) mapNonEmpty!56656))

(get-info :version)

(assert (= (and mapNonEmpty!56656 ((_ is ValueCellFull!17429) mapValue!56656)) b!1333017))

(assert (= (and b!1333020 ((_ is ValueCellFull!17429) mapDefault!56656)) b!1333022))

(assert (= start!112574 b!1333020))

(declare-fun b_lambda!23999 () Bool)

(assert (=> (not b_lambda!23999) (not b!1333027)))

(declare-fun t!45050 () Bool)

(declare-fun tb!11953 () Bool)

(assert (=> (and start!112574 (= defaultEntry!1323 defaultEntry!1323) t!45050) tb!11953))

(declare-fun result!24985 () Bool)

(assert (=> tb!11953 (= result!24985 tp_is_empty!36655)))

(assert (=> b!1333027 t!45050))

(declare-fun b_and!49549 () Bool)

(assert (= b_and!49547 (and (=> t!45050 result!24985) b_and!49549)))

(declare-fun m!1222013 () Bool)

(assert (=> b!1333024 m!1222013))

(declare-fun m!1222015 () Bool)

(assert (=> b!1333026 m!1222015))

(declare-fun m!1222017 () Bool)

(assert (=> b!1333018 m!1222017))

(assert (=> b!1333018 m!1222017))

(declare-fun m!1222019 () Bool)

(assert (=> b!1333018 m!1222019))

(declare-fun m!1222021 () Bool)

(assert (=> start!112574 m!1222021))

(declare-fun m!1222023 () Bool)

(assert (=> start!112574 m!1222023))

(declare-fun m!1222025 () Bool)

(assert (=> start!112574 m!1222025))

(declare-fun m!1222027 () Bool)

(assert (=> b!1333027 m!1222027))

(declare-fun m!1222029 () Bool)

(assert (=> b!1333027 m!1222029))

(declare-fun m!1222031 () Bool)

(assert (=> b!1333027 m!1222031))

(assert (=> b!1333027 m!1222029))

(declare-fun m!1222033 () Bool)

(assert (=> b!1333027 m!1222033))

(declare-fun m!1222035 () Bool)

(assert (=> b!1333027 m!1222035))

(declare-fun m!1222037 () Bool)

(assert (=> b!1333027 m!1222037))

(declare-fun m!1222039 () Bool)

(assert (=> b!1333027 m!1222039))

(declare-fun m!1222041 () Bool)

(assert (=> b!1333027 m!1222041))

(declare-fun m!1222043 () Bool)

(assert (=> b!1333027 m!1222043))

(declare-fun m!1222045 () Bool)

(assert (=> b!1333027 m!1222045))

(declare-fun m!1222047 () Bool)

(assert (=> b!1333027 m!1222047))

(declare-fun m!1222049 () Bool)

(assert (=> b!1333027 m!1222049))

(assert (=> b!1333027 m!1222043))

(assert (=> b!1333027 m!1222037))

(assert (=> b!1333027 m!1222031))

(declare-fun m!1222051 () Bool)

(assert (=> b!1333027 m!1222051))

(assert (=> b!1333025 m!1222037))

(assert (=> b!1333025 m!1222037))

(declare-fun m!1222053 () Bool)

(assert (=> b!1333025 m!1222053))

(declare-fun m!1222055 () Bool)

(assert (=> mapNonEmpty!56656 m!1222055))

(assert (=> b!1333019 m!1222037))

(check-sat (not b!1333024) (not mapNonEmpty!56656) (not b!1333025) (not start!112574) tp_is_empty!36655 (not b_next!30745) (not b!1333026) b_and!49549 (not b!1333027) (not b!1333018) (not b_lambda!23999))
(check-sat b_and!49549 (not b_next!30745))
