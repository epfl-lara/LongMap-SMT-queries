; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111632 () Bool)

(assert start!111632)

(declare-fun b_free!30289 () Bool)

(declare-fun b_next!30289 () Bool)

(assert (=> start!111632 (= b_free!30289 (not b_next!30289))))

(declare-fun tp!106344 () Bool)

(declare-fun b_and!48719 () Bool)

(assert (=> start!111632 (= tp!106344 b_and!48719)))

(declare-fun b!1322205 () Bool)

(declare-fun res!877616 () Bool)

(declare-fun e!753972 () Bool)

(assert (=> b!1322205 (=> (not res!877616) (not e!753972))))

(declare-datatypes ((array!89071 0))(
  ( (array!89072 (arr!43010 (Array (_ BitVec 32) (_ BitVec 64))) (size!43562 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89071)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1322205 (= res!877616 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43562 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1322206 () Bool)

(declare-fun res!877620 () Bool)

(assert (=> b!1322206 (=> (not res!877620) (not e!753972))))

(declare-datatypes ((V!53249 0))(
  ( (V!53250 (val!18129 Int)) )
))
(declare-datatypes ((ValueCell!17156 0))(
  ( (ValueCellFull!17156 (v!20758 V!53249)) (EmptyCell!17156) )
))
(declare-datatypes ((array!89073 0))(
  ( (array!89074 (arr!43011 (Array (_ BitVec 32) ValueCell!17156)) (size!43563 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89073)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1322206 (= res!877620 (and (= (size!43563 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43562 _keys!1609) (size!43563 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1322207 () Bool)

(declare-fun res!877617 () Bool)

(assert (=> b!1322207 (=> (not res!877617) (not e!753972))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1322207 (= res!877617 (validKeyInArray!0 (select (arr!43010 _keys!1609) from!2000)))))

(declare-fun res!877622 () Bool)

(assert (=> start!111632 (=> (not res!877622) (not e!753972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111632 (= res!877622 (validMask!0 mask!2019))))

(assert (=> start!111632 e!753972))

(declare-fun array_inv!32653 (array!89071) Bool)

(assert (=> start!111632 (array_inv!32653 _keys!1609)))

(assert (=> start!111632 true))

(declare-fun tp_is_empty!36109 () Bool)

(assert (=> start!111632 tp_is_empty!36109))

(declare-fun e!753973 () Bool)

(declare-fun array_inv!32654 (array!89073) Bool)

(assert (=> start!111632 (and (array_inv!32654 _values!1337) e!753973)))

(assert (=> start!111632 tp!106344))

(declare-fun b!1322208 () Bool)

(assert (=> b!1322208 (= e!753972 (not true))))

(declare-datatypes ((tuple2!23434 0))(
  ( (tuple2!23435 (_1!11728 (_ BitVec 64)) (_2!11728 V!53249)) )
))
(declare-datatypes ((List!30567 0))(
  ( (Nil!30564) (Cons!30563 (h!31772 tuple2!23434) (t!44397 List!30567)) )
))
(declare-datatypes ((ListLongMap!21091 0))(
  ( (ListLongMap!21092 (toList!10561 List!30567)) )
))
(declare-fun lt!587859 () ListLongMap!21091)

(declare-fun lt!587860 () tuple2!23434)

(declare-fun contains!8644 (ListLongMap!21091 (_ BitVec 64)) Bool)

(declare-fun +!4602 (ListLongMap!21091 tuple2!23434) ListLongMap!21091)

(assert (=> b!1322208 (contains!8644 (+!4602 lt!587859 lt!587860) k0!1164)))

(declare-fun zeroValue!1279 () V!53249)

(declare-datatypes ((Unit!43387 0))(
  ( (Unit!43388) )
))
(declare-fun lt!587856 () Unit!43387)

(declare-fun addStillContains!1126 (ListLongMap!21091 (_ BitVec 64) V!53249 (_ BitVec 64)) Unit!43387)

(assert (=> b!1322208 (= lt!587856 (addStillContains!1126 lt!587859 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1322208 (contains!8644 lt!587859 k0!1164)))

(declare-fun lt!587855 () Unit!43387)

(declare-fun lt!587858 () V!53249)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!167 ((_ BitVec 64) (_ BitVec 64) V!53249 ListLongMap!21091) Unit!43387)

(assert (=> b!1322208 (= lt!587855 (lemmaInListMapAfterAddingDiffThenInBefore!167 k0!1164 (select (arr!43010 _keys!1609) from!2000) lt!587858 lt!587859))))

(declare-fun lt!587857 () ListLongMap!21091)

(assert (=> b!1322208 (contains!8644 lt!587857 k0!1164)))

(declare-fun lt!587854 () Unit!43387)

(assert (=> b!1322208 (= lt!587854 (lemmaInListMapAfterAddingDiffThenInBefore!167 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587857))))

(declare-fun lt!587862 () ListLongMap!21091)

(assert (=> b!1322208 (contains!8644 lt!587862 k0!1164)))

(declare-fun minValue!1279 () V!53249)

(declare-fun lt!587861 () Unit!43387)

(assert (=> b!1322208 (= lt!587861 (lemmaInListMapAfterAddingDiffThenInBefore!167 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587862))))

(assert (=> b!1322208 (= lt!587862 (+!4602 lt!587857 lt!587860))))

(assert (=> b!1322208 (= lt!587860 (tuple2!23435 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1322208 (= lt!587857 (+!4602 lt!587859 (tuple2!23435 (select (arr!43010 _keys!1609) from!2000) lt!587858)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21657 (ValueCell!17156 V!53249) V!53249)

(declare-fun dynLambda!3532 (Int (_ BitVec 64)) V!53249)

(assert (=> b!1322208 (= lt!587858 (get!21657 (select (arr!43011 _values!1337) from!2000) (dynLambda!3532 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6235 (array!89071 array!89073 (_ BitVec 32) (_ BitVec 32) V!53249 V!53249 (_ BitVec 32) Int) ListLongMap!21091)

(assert (=> b!1322208 (= lt!587859 (getCurrentListMapNoExtraKeys!6235 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun mapNonEmpty!55811 () Bool)

(declare-fun mapRes!55811 () Bool)

(declare-fun tp!106343 () Bool)

(declare-fun e!753975 () Bool)

(assert (=> mapNonEmpty!55811 (= mapRes!55811 (and tp!106343 e!753975))))

(declare-fun mapValue!55811 () ValueCell!17156)

(declare-fun mapRest!55811 () (Array (_ BitVec 32) ValueCell!17156))

(declare-fun mapKey!55811 () (_ BitVec 32))

(assert (=> mapNonEmpty!55811 (= (arr!43011 _values!1337) (store mapRest!55811 mapKey!55811 mapValue!55811))))

(declare-fun b!1322209 () Bool)

(declare-fun e!753976 () Bool)

(assert (=> b!1322209 (= e!753976 tp_is_empty!36109)))

(declare-fun b!1322210 () Bool)

(declare-fun res!877621 () Bool)

(assert (=> b!1322210 (=> (not res!877621) (not e!753972))))

(declare-fun getCurrentListMap!5444 (array!89071 array!89073 (_ BitVec 32) (_ BitVec 32) V!53249 V!53249 (_ BitVec 32) Int) ListLongMap!21091)

(assert (=> b!1322210 (= res!877621 (contains!8644 (getCurrentListMap!5444 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1322211 () Bool)

(declare-fun res!877623 () Bool)

(assert (=> b!1322211 (=> (not res!877623) (not e!753972))))

(assert (=> b!1322211 (= res!877623 (not (= (select (arr!43010 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapIsEmpty!55811 () Bool)

(assert (=> mapIsEmpty!55811 mapRes!55811))

(declare-fun b!1322212 () Bool)

(assert (=> b!1322212 (= e!753973 (and e!753976 mapRes!55811))))

(declare-fun condMapEmpty!55811 () Bool)

(declare-fun mapDefault!55811 () ValueCell!17156)

(assert (=> b!1322212 (= condMapEmpty!55811 (= (arr!43011 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17156)) mapDefault!55811)))))

(declare-fun b!1322213 () Bool)

(declare-fun res!877619 () Bool)

(assert (=> b!1322213 (=> (not res!877619) (not e!753972))))

(declare-datatypes ((List!30568 0))(
  ( (Nil!30565) (Cons!30564 (h!31773 (_ BitVec 64)) (t!44398 List!30568)) )
))
(declare-fun arrayNoDuplicates!0 (array!89071 (_ BitVec 32) List!30568) Bool)

(assert (=> b!1322213 (= res!877619 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30565))))

(declare-fun b!1322214 () Bool)

(assert (=> b!1322214 (= e!753975 tp_is_empty!36109)))

(declare-fun b!1322215 () Bool)

(declare-fun res!877618 () Bool)

(assert (=> b!1322215 (=> (not res!877618) (not e!753972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89071 (_ BitVec 32)) Bool)

(assert (=> b!1322215 (= res!877618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(assert (= (and start!111632 res!877622) b!1322206))

(assert (= (and b!1322206 res!877620) b!1322215))

(assert (= (and b!1322215 res!877618) b!1322213))

(assert (= (and b!1322213 res!877619) b!1322205))

(assert (= (and b!1322205 res!877616) b!1322210))

(assert (= (and b!1322210 res!877621) b!1322211))

(assert (= (and b!1322211 res!877623) b!1322207))

(assert (= (and b!1322207 res!877617) b!1322208))

(assert (= (and b!1322212 condMapEmpty!55811) mapIsEmpty!55811))

(assert (= (and b!1322212 (not condMapEmpty!55811)) mapNonEmpty!55811))

(get-info :version)

(assert (= (and mapNonEmpty!55811 ((_ is ValueCellFull!17156) mapValue!55811)) b!1322214))

(assert (= (and b!1322212 ((_ is ValueCellFull!17156) mapDefault!55811)) b!1322209))

(assert (= start!111632 b!1322212))

(declare-fun b_lambda!23605 () Bool)

(assert (=> (not b_lambda!23605) (not b!1322208)))

(declare-fun t!44396 () Bool)

(declare-fun tb!11633 () Bool)

(assert (=> (and start!111632 (= defaultEntry!1340 defaultEntry!1340) t!44396) tb!11633))

(declare-fun result!24329 () Bool)

(assert (=> tb!11633 (= result!24329 tp_is_empty!36109)))

(assert (=> b!1322208 t!44396))

(declare-fun b_and!48721 () Bool)

(assert (= b_and!48719 (and (=> t!44396 result!24329) b_and!48721)))

(declare-fun m!1209975 () Bool)

(assert (=> start!111632 m!1209975))

(declare-fun m!1209977 () Bool)

(assert (=> start!111632 m!1209977))

(declare-fun m!1209979 () Bool)

(assert (=> start!111632 m!1209979))

(declare-fun m!1209981 () Bool)

(assert (=> b!1322211 m!1209981))

(declare-fun m!1209983 () Bool)

(assert (=> b!1322213 m!1209983))

(declare-fun m!1209985 () Bool)

(assert (=> mapNonEmpty!55811 m!1209985))

(declare-fun m!1209987 () Bool)

(assert (=> b!1322215 m!1209987))

(declare-fun m!1209989 () Bool)

(assert (=> b!1322210 m!1209989))

(assert (=> b!1322210 m!1209989))

(declare-fun m!1209991 () Bool)

(assert (=> b!1322210 m!1209991))

(assert (=> b!1322207 m!1209981))

(assert (=> b!1322207 m!1209981))

(declare-fun m!1209993 () Bool)

(assert (=> b!1322207 m!1209993))

(declare-fun m!1209995 () Bool)

(assert (=> b!1322208 m!1209995))

(declare-fun m!1209997 () Bool)

(assert (=> b!1322208 m!1209997))

(declare-fun m!1209999 () Bool)

(assert (=> b!1322208 m!1209999))

(declare-fun m!1210001 () Bool)

(assert (=> b!1322208 m!1210001))

(declare-fun m!1210003 () Bool)

(assert (=> b!1322208 m!1210003))

(declare-fun m!1210005 () Bool)

(assert (=> b!1322208 m!1210005))

(declare-fun m!1210007 () Bool)

(assert (=> b!1322208 m!1210007))

(declare-fun m!1210009 () Bool)

(assert (=> b!1322208 m!1210009))

(declare-fun m!1210011 () Bool)

(assert (=> b!1322208 m!1210011))

(assert (=> b!1322208 m!1210007))

(declare-fun m!1210013 () Bool)

(assert (=> b!1322208 m!1210013))

(assert (=> b!1322208 m!1210005))

(assert (=> b!1322208 m!1209999))

(declare-fun m!1210015 () Bool)

(assert (=> b!1322208 m!1210015))

(declare-fun m!1210017 () Bool)

(assert (=> b!1322208 m!1210017))

(declare-fun m!1210019 () Bool)

(assert (=> b!1322208 m!1210019))

(assert (=> b!1322208 m!1209981))

(assert (=> b!1322208 m!1209981))

(declare-fun m!1210021 () Bool)

(assert (=> b!1322208 m!1210021))

(declare-fun m!1210023 () Bool)

(assert (=> b!1322208 m!1210023))

(check-sat (not b!1322208) (not mapNonEmpty!55811) (not b!1322215) (not b!1322213) b_and!48721 (not b_next!30289) (not b_lambda!23605) (not b!1322207) (not b!1322210) (not start!111632) tp_is_empty!36109)
(check-sat b_and!48721 (not b_next!30289))
