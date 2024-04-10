; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111688 () Bool)

(assert start!111688)

(declare-fun b_free!30345 () Bool)

(declare-fun b_next!30345 () Bool)

(assert (=> start!111688 (= b_free!30345 (not b_next!30345))))

(declare-fun tp!106511 () Bool)

(declare-fun b_and!48849 () Bool)

(assert (=> start!111688 (= tp!106511 b_and!48849)))

(declare-fun mapIsEmpty!55895 () Bool)

(declare-fun mapRes!55895 () Bool)

(assert (=> mapIsEmpty!55895 mapRes!55895))

(declare-fun b!1323255 () Bool)

(declare-fun res!878320 () Bool)

(declare-fun e!754425 () Bool)

(assert (=> b!1323255 (=> (not res!878320) (not e!754425))))

(declare-datatypes ((array!89248 0))(
  ( (array!89249 (arr!43098 (Array (_ BitVec 32) (_ BitVec 64))) (size!43648 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89248)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1323255 (= res!878320 (validKeyInArray!0 (select (arr!43098 _keys!1609) from!2000)))))

(declare-fun b!1323256 () Bool)

(declare-fun res!878324 () Bool)

(assert (=> b!1323256 (=> (not res!878324) (not e!754425))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1323256 (= res!878324 (not (= (select (arr!43098 _keys!1609) from!2000) k0!1164)))))

(declare-fun res!878318 () Bool)

(assert (=> start!111688 (=> (not res!878318) (not e!754425))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111688 (= res!878318 (validMask!0 mask!2019))))

(assert (=> start!111688 e!754425))

(declare-fun array_inv!32537 (array!89248) Bool)

(assert (=> start!111688 (array_inv!32537 _keys!1609)))

(assert (=> start!111688 true))

(declare-fun tp_is_empty!36165 () Bool)

(assert (=> start!111688 tp_is_empty!36165))

(declare-datatypes ((V!53323 0))(
  ( (V!53324 (val!18157 Int)) )
))
(declare-datatypes ((ValueCell!17184 0))(
  ( (ValueCellFull!17184 (v!20787 V!53323)) (EmptyCell!17184) )
))
(declare-datatypes ((array!89250 0))(
  ( (array!89251 (arr!43099 (Array (_ BitVec 32) ValueCell!17184)) (size!43649 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89250)

(declare-fun e!754429 () Bool)

(declare-fun array_inv!32538 (array!89250) Bool)

(assert (=> start!111688 (and (array_inv!32538 _values!1337) e!754429)))

(assert (=> start!111688 tp!106511))

(declare-fun b!1323257 () Bool)

(declare-fun e!754427 () Bool)

(assert (=> b!1323257 (= e!754429 (and e!754427 mapRes!55895))))

(declare-fun condMapEmpty!55895 () Bool)

(declare-fun mapDefault!55895 () ValueCell!17184)

(assert (=> b!1323257 (= condMapEmpty!55895 (= (arr!43099 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17184)) mapDefault!55895)))))

(declare-fun b!1323258 () Bool)

(declare-fun res!878319 () Bool)

(assert (=> b!1323258 (=> (not res!878319) (not e!754425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89248 (_ BitVec 32)) Bool)

(assert (=> b!1323258 (= res!878319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1323259 () Bool)

(declare-fun res!878322 () Bool)

(assert (=> b!1323259 (=> (not res!878322) (not e!754425))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1323259 (= res!878322 (and (= (size!43649 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43648 _keys!1609) (size!43649 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1323260 () Bool)

(declare-fun res!878317 () Bool)

(assert (=> b!1323260 (=> (not res!878317) (not e!754425))))

(declare-fun zeroValue!1279 () V!53323)

(declare-fun minValue!1279 () V!53323)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23402 0))(
  ( (tuple2!23403 (_1!11712 (_ BitVec 64)) (_2!11712 V!53323)) )
))
(declare-datatypes ((List!30544 0))(
  ( (Nil!30541) (Cons!30540 (h!31749 tuple2!23402) (t!44438 List!30544)) )
))
(declare-datatypes ((ListLongMap!21059 0))(
  ( (ListLongMap!21060 (toList!10545 List!30544)) )
))
(declare-fun contains!8700 (ListLongMap!21059 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5542 (array!89248 array!89250 (_ BitVec 32) (_ BitVec 32) V!53323 V!53323 (_ BitVec 32) Int) ListLongMap!21059)

(assert (=> b!1323260 (= res!878317 (contains!8700 (getCurrentListMap!5542 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1323261 () Bool)

(declare-fun res!878321 () Bool)

(assert (=> b!1323261 (=> (not res!878321) (not e!754425))))

(assert (=> b!1323261 (= res!878321 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43648 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1323262 () Bool)

(declare-fun res!878323 () Bool)

(assert (=> b!1323262 (=> (not res!878323) (not e!754425))))

(declare-datatypes ((List!30545 0))(
  ( (Nil!30542) (Cons!30541 (h!31750 (_ BitVec 64)) (t!44439 List!30545)) )
))
(declare-fun arrayNoDuplicates!0 (array!89248 (_ BitVec 32) List!30545) Bool)

(assert (=> b!1323262 (= res!878323 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30542))))

(declare-fun b!1323263 () Bool)

(declare-fun e!754428 () Bool)

(assert (=> b!1323263 (= e!754428 tp_is_empty!36165)))

(declare-fun b!1323264 () Bool)

(assert (=> b!1323264 (= e!754425 (not true))))

(declare-fun lt!588862 () ListLongMap!21059)

(declare-fun +!4597 (ListLongMap!21059 tuple2!23402) ListLongMap!21059)

(assert (=> b!1323264 (contains!8700 (+!4597 lt!588862 (tuple2!23403 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43614 0))(
  ( (Unit!43615) )
))
(declare-fun lt!588867 () Unit!43614)

(declare-fun addStillContains!1146 (ListLongMap!21059 (_ BitVec 64) V!53323 (_ BitVec 64)) Unit!43614)

(assert (=> b!1323264 (= lt!588867 (addStillContains!1146 lt!588862 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1323264 (contains!8700 lt!588862 k0!1164)))

(declare-fun lt!588865 () ListLongMap!21059)

(declare-fun lt!588861 () tuple2!23402)

(assert (=> b!1323264 (= lt!588862 (+!4597 lt!588865 lt!588861))))

(declare-fun lt!588860 () Unit!43614)

(assert (=> b!1323264 (= lt!588860 (addStillContains!1146 lt!588865 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1323264 (contains!8700 lt!588865 k0!1164)))

(declare-fun lt!588866 () Unit!43614)

(declare-fun lt!588868 () V!53323)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!193 ((_ BitVec 64) (_ BitVec 64) V!53323 ListLongMap!21059) Unit!43614)

(assert (=> b!1323264 (= lt!588866 (lemmaInListMapAfterAddingDiffThenInBefore!193 k0!1164 (select (arr!43098 _keys!1609) from!2000) lt!588868 lt!588865))))

(declare-fun lt!588863 () ListLongMap!21059)

(assert (=> b!1323264 (contains!8700 lt!588863 k0!1164)))

(declare-fun lt!588869 () Unit!43614)

(assert (=> b!1323264 (= lt!588869 (lemmaInListMapAfterAddingDiffThenInBefore!193 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!588863))))

(declare-fun lt!588870 () ListLongMap!21059)

(assert (=> b!1323264 (contains!8700 lt!588870 k0!1164)))

(declare-fun lt!588864 () Unit!43614)

(assert (=> b!1323264 (= lt!588864 (lemmaInListMapAfterAddingDiffThenInBefore!193 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!588870))))

(assert (=> b!1323264 (= lt!588870 (+!4597 lt!588863 lt!588861))))

(assert (=> b!1323264 (= lt!588861 (tuple2!23403 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1323264 (= lt!588863 (+!4597 lt!588865 (tuple2!23403 (select (arr!43098 _keys!1609) from!2000) lt!588868)))))

(declare-fun get!21703 (ValueCell!17184 V!53323) V!53323)

(declare-fun dynLambda!3536 (Int (_ BitVec 64)) V!53323)

(assert (=> b!1323264 (= lt!588868 (get!21703 (select (arr!43099 _values!1337) from!2000) (dynLambda!3536 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6232 (array!89248 array!89250 (_ BitVec 32) (_ BitVec 32) V!53323 V!53323 (_ BitVec 32) Int) ListLongMap!21059)

(assert (=> b!1323264 (= lt!588865 (getCurrentListMapNoExtraKeys!6232 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun mapNonEmpty!55895 () Bool)

(declare-fun tp!106510 () Bool)

(assert (=> mapNonEmpty!55895 (= mapRes!55895 (and tp!106510 e!754428))))

(declare-fun mapKey!55895 () (_ BitVec 32))

(declare-fun mapValue!55895 () ValueCell!17184)

(declare-fun mapRest!55895 () (Array (_ BitVec 32) ValueCell!17184))

(assert (=> mapNonEmpty!55895 (= (arr!43099 _values!1337) (store mapRest!55895 mapKey!55895 mapValue!55895))))

(declare-fun b!1323265 () Bool)

(assert (=> b!1323265 (= e!754427 tp_is_empty!36165)))

(assert (= (and start!111688 res!878318) b!1323259))

(assert (= (and b!1323259 res!878322) b!1323258))

(assert (= (and b!1323258 res!878319) b!1323262))

(assert (= (and b!1323262 res!878323) b!1323261))

(assert (= (and b!1323261 res!878321) b!1323260))

(assert (= (and b!1323260 res!878317) b!1323256))

(assert (= (and b!1323256 res!878324) b!1323255))

(assert (= (and b!1323255 res!878320) b!1323264))

(assert (= (and b!1323257 condMapEmpty!55895) mapIsEmpty!55895))

(assert (= (and b!1323257 (not condMapEmpty!55895)) mapNonEmpty!55895))

(get-info :version)

(assert (= (and mapNonEmpty!55895 ((_ is ValueCellFull!17184) mapValue!55895)) b!1323263))

(assert (= (and b!1323257 ((_ is ValueCellFull!17184) mapDefault!55895)) b!1323265))

(assert (= start!111688 b!1323257))

(declare-fun b_lambda!23671 () Bool)

(assert (=> (not b_lambda!23671) (not b!1323264)))

(declare-fun t!44437 () Bool)

(declare-fun tb!11697 () Bool)

(assert (=> (and start!111688 (= defaultEntry!1340 defaultEntry!1340) t!44437) tb!11697))

(declare-fun result!24449 () Bool)

(assert (=> tb!11697 (= result!24449 tp_is_empty!36165)))

(assert (=> b!1323264 t!44437))

(declare-fun b_and!48851 () Bool)

(assert (= b_and!48849 (and (=> t!44437 result!24449) b_and!48851)))

(declare-fun m!1211951 () Bool)

(assert (=> b!1323264 m!1211951))

(declare-fun m!1211953 () Bool)

(assert (=> b!1323264 m!1211953))

(declare-fun m!1211955 () Bool)

(assert (=> b!1323264 m!1211955))

(declare-fun m!1211957 () Bool)

(assert (=> b!1323264 m!1211957))

(declare-fun m!1211959 () Bool)

(assert (=> b!1323264 m!1211959))

(declare-fun m!1211961 () Bool)

(assert (=> b!1323264 m!1211961))

(declare-fun m!1211963 () Bool)

(assert (=> b!1323264 m!1211963))

(declare-fun m!1211965 () Bool)

(assert (=> b!1323264 m!1211965))

(declare-fun m!1211967 () Bool)

(assert (=> b!1323264 m!1211967))

(declare-fun m!1211969 () Bool)

(assert (=> b!1323264 m!1211969))

(assert (=> b!1323264 m!1211959))

(declare-fun m!1211971 () Bool)

(assert (=> b!1323264 m!1211971))

(declare-fun m!1211973 () Bool)

(assert (=> b!1323264 m!1211973))

(assert (=> b!1323264 m!1211951))

(declare-fun m!1211975 () Bool)

(assert (=> b!1323264 m!1211975))

(declare-fun m!1211977 () Bool)

(assert (=> b!1323264 m!1211977))

(assert (=> b!1323264 m!1211955))

(declare-fun m!1211979 () Bool)

(assert (=> b!1323264 m!1211979))

(declare-fun m!1211981 () Bool)

(assert (=> b!1323264 m!1211981))

(assert (=> b!1323264 m!1211969))

(declare-fun m!1211983 () Bool)

(assert (=> b!1323264 m!1211983))

(declare-fun m!1211985 () Bool)

(assert (=> b!1323264 m!1211985))

(declare-fun m!1211987 () Bool)

(assert (=> b!1323264 m!1211987))

(declare-fun m!1211989 () Bool)

(assert (=> start!111688 m!1211989))

(declare-fun m!1211991 () Bool)

(assert (=> start!111688 m!1211991))

(declare-fun m!1211993 () Bool)

(assert (=> start!111688 m!1211993))

(declare-fun m!1211995 () Bool)

(assert (=> b!1323262 m!1211995))

(declare-fun m!1211997 () Bool)

(assert (=> b!1323260 m!1211997))

(assert (=> b!1323260 m!1211997))

(declare-fun m!1211999 () Bool)

(assert (=> b!1323260 m!1211999))

(assert (=> b!1323256 m!1211951))

(assert (=> b!1323255 m!1211951))

(assert (=> b!1323255 m!1211951))

(declare-fun m!1212001 () Bool)

(assert (=> b!1323255 m!1212001))

(declare-fun m!1212003 () Bool)

(assert (=> mapNonEmpty!55895 m!1212003))

(declare-fun m!1212005 () Bool)

(assert (=> b!1323258 m!1212005))

(check-sat (not b_next!30345) (not start!111688) b_and!48851 (not mapNonEmpty!55895) (not b!1323255) (not b!1323262) (not b_lambda!23671) (not b!1323258) tp_is_empty!36165 (not b!1323264) (not b!1323260))
(check-sat b_and!48851 (not b_next!30345))
