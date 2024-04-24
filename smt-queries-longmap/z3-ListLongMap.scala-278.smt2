; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4490 () Bool)

(assert start!4490)

(declare-fun b_free!1255 () Bool)

(declare-fun b_next!1255 () Bool)

(assert (=> start!4490 (= b_free!1255 (not b_next!1255))))

(declare-fun tp!5202 () Bool)

(declare-fun b_and!2067 () Bool)

(assert (=> start!4490 (= tp!5202 b_and!2067)))

(declare-fun b!34969 () Bool)

(declare-fun e!22098 () Bool)

(declare-datatypes ((SeekEntryResult!147 0))(
  ( (MissingZero!147 (index!2710 (_ BitVec 32))) (Found!147 (index!2711 (_ BitVec 32))) (Intermediate!147 (undefined!959 Bool) (index!2712 (_ BitVec 32)) (x!6973 (_ BitVec 32))) (Undefined!147) (MissingVacant!147 (index!2713 (_ BitVec 32))) )
))
(declare-fun lt!12796 () SeekEntryResult!147)

(declare-datatypes ((array!2413 0))(
  ( (array!2414 (arr!1154 (Array (_ BitVec 32) (_ BitVec 64))) (size!1255 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2413)

(get-info :version)

(assert (=> b!34969 (= e!22098 (and ((_ is Found!147) lt!12796) (or (bvslt (index!2711 lt!12796) #b00000000000000000000000000000000) (bvsge (index!2711 lt!12796) (size!1255 _keys!1833)))))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2413 (_ BitVec 32)) SeekEntryResult!147)

(assert (=> b!34969 (= lt!12796 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!34970 () Bool)

(declare-fun res!21269 () Bool)

(assert (=> b!34970 (=> (not res!21269) (not e!22098))))

(declare-datatypes ((V!1971 0))(
  ( (V!1972 (val!831 Int)) )
))
(declare-datatypes ((ValueCell!605 0))(
  ( (ValueCellFull!605 (v!1926 V!1971)) (EmptyCell!605) )
))
(declare-datatypes ((array!2415 0))(
  ( (array!2416 (arr!1155 (Array (_ BitVec 32) ValueCell!605)) (size!1256 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2415)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!34970 (= res!21269 (and (= (size!1256 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1255 _keys!1833) (size!1256 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34971 () Bool)

(declare-fun res!21272 () Bool)

(assert (=> b!34971 (=> (not res!21272) (not e!22098))))

(declare-datatypes ((List!914 0))(
  ( (Nil!911) (Cons!910 (h!1477 (_ BitVec 64)) (t!3613 List!914)) )
))
(declare-fun arrayNoDuplicates!0 (array!2413 (_ BitVec 32) List!914) Bool)

(assert (=> b!34971 (= res!21272 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!911))))

(declare-fun b!34972 () Bool)

(declare-fun e!22096 () Bool)

(declare-fun e!22095 () Bool)

(declare-fun mapRes!1960 () Bool)

(assert (=> b!34972 (= e!22096 (and e!22095 mapRes!1960))))

(declare-fun condMapEmpty!1960 () Bool)

(declare-fun mapDefault!1960 () ValueCell!605)

(assert (=> b!34972 (= condMapEmpty!1960 (= (arr!1155 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!605)) mapDefault!1960)))))

(declare-fun mapNonEmpty!1960 () Bool)

(declare-fun tp!5203 () Bool)

(declare-fun e!22097 () Bool)

(assert (=> mapNonEmpty!1960 (= mapRes!1960 (and tp!5203 e!22097))))

(declare-fun mapKey!1960 () (_ BitVec 32))

(declare-fun mapValue!1960 () ValueCell!605)

(declare-fun mapRest!1960 () (Array (_ BitVec 32) ValueCell!605))

(assert (=> mapNonEmpty!1960 (= (arr!1155 _values!1501) (store mapRest!1960 mapKey!1960 mapValue!1960))))

(declare-fun mapIsEmpty!1960 () Bool)

(assert (=> mapIsEmpty!1960 mapRes!1960))

(declare-fun b!34973 () Bool)

(declare-fun res!21273 () Bool)

(assert (=> b!34973 (=> (not res!21273) (not e!22098))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34973 (= res!21273 (validKeyInArray!0 k0!1304))))

(declare-fun res!21271 () Bool)

(assert (=> start!4490 (=> (not res!21271) (not e!22098))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4490 (= res!21271 (validMask!0 mask!2294))))

(assert (=> start!4490 e!22098))

(assert (=> start!4490 true))

(assert (=> start!4490 tp!5202))

(declare-fun array_inv!789 (array!2415) Bool)

(assert (=> start!4490 (and (array_inv!789 _values!1501) e!22096)))

(declare-fun array_inv!790 (array!2413) Bool)

(assert (=> start!4490 (array_inv!790 _keys!1833)))

(declare-fun tp_is_empty!1609 () Bool)

(assert (=> start!4490 tp_is_empty!1609))

(declare-fun b!34974 () Bool)

(declare-fun res!21270 () Bool)

(assert (=> b!34974 (=> (not res!21270) (not e!22098))))

(declare-fun arrayContainsKey!0 (array!2413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34974 (= res!21270 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34975 () Bool)

(assert (=> b!34975 (= e!22095 tp_is_empty!1609)))

(declare-fun b!34976 () Bool)

(declare-fun res!21275 () Bool)

(assert (=> b!34976 (=> (not res!21275) (not e!22098))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1971)

(declare-fun minValue!1443 () V!1971)

(declare-datatypes ((tuple2!1318 0))(
  ( (tuple2!1319 (_1!670 (_ BitVec 64)) (_2!670 V!1971)) )
))
(declare-datatypes ((List!915 0))(
  ( (Nil!912) (Cons!911 (h!1478 tuple2!1318) (t!3614 List!915)) )
))
(declare-datatypes ((ListLongMap!889 0))(
  ( (ListLongMap!890 (toList!460 List!915)) )
))
(declare-fun contains!408 (ListLongMap!889 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!281 (array!2413 array!2415 (_ BitVec 32) (_ BitVec 32) V!1971 V!1971 (_ BitVec 32) Int) ListLongMap!889)

(assert (=> b!34976 (= res!21275 (not (contains!408 (getCurrentListMap!281 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!34977 () Bool)

(declare-fun res!21274 () Bool)

(assert (=> b!34977 (=> (not res!21274) (not e!22098))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2413 (_ BitVec 32)) Bool)

(assert (=> b!34977 (= res!21274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34978 () Bool)

(assert (=> b!34978 (= e!22097 tp_is_empty!1609)))

(assert (= (and start!4490 res!21271) b!34970))

(assert (= (and b!34970 res!21269) b!34977))

(assert (= (and b!34977 res!21274) b!34971))

(assert (= (and b!34971 res!21272) b!34973))

(assert (= (and b!34973 res!21273) b!34976))

(assert (= (and b!34976 res!21275) b!34974))

(assert (= (and b!34974 res!21270) b!34969))

(assert (= (and b!34972 condMapEmpty!1960) mapIsEmpty!1960))

(assert (= (and b!34972 (not condMapEmpty!1960)) mapNonEmpty!1960))

(assert (= (and mapNonEmpty!1960 ((_ is ValueCellFull!605) mapValue!1960)) b!34978))

(assert (= (and b!34972 ((_ is ValueCellFull!605) mapDefault!1960)) b!34975))

(assert (= start!4490 b!34972))

(declare-fun m!28057 () Bool)

(assert (=> b!34969 m!28057))

(declare-fun m!28059 () Bool)

(assert (=> b!34976 m!28059))

(assert (=> b!34976 m!28059))

(declare-fun m!28061 () Bool)

(assert (=> b!34976 m!28061))

(declare-fun m!28063 () Bool)

(assert (=> mapNonEmpty!1960 m!28063))

(declare-fun m!28065 () Bool)

(assert (=> b!34977 m!28065))

(declare-fun m!28067 () Bool)

(assert (=> b!34974 m!28067))

(declare-fun m!28069 () Bool)

(assert (=> b!34971 m!28069))

(declare-fun m!28071 () Bool)

(assert (=> b!34973 m!28071))

(declare-fun m!28073 () Bool)

(assert (=> start!4490 m!28073))

(declare-fun m!28075 () Bool)

(assert (=> start!4490 m!28075))

(declare-fun m!28077 () Bool)

(assert (=> start!4490 m!28077))

(check-sat b_and!2067 tp_is_empty!1609 (not b_next!1255) (not b!34974) (not mapNonEmpty!1960) (not start!4490) (not b!34969) (not b!34977) (not b!34973) (not b!34971) (not b!34976))
(check-sat b_and!2067 (not b_next!1255))
(get-model)

(declare-fun d!5239 () Bool)

(declare-fun e!22133 () Bool)

(assert (=> d!5239 e!22133))

(declare-fun res!21320 () Bool)

(assert (=> d!5239 (=> res!21320 e!22133)))

(declare-fun lt!12812 () Bool)

(assert (=> d!5239 (= res!21320 (not lt!12812))))

(declare-fun lt!12813 () Bool)

(assert (=> d!5239 (= lt!12812 lt!12813)))

(declare-datatypes ((Unit!777 0))(
  ( (Unit!778) )
))
(declare-fun lt!12814 () Unit!777)

(declare-fun e!22134 () Unit!777)

(assert (=> d!5239 (= lt!12814 e!22134)))

(declare-fun c!3945 () Bool)

(assert (=> d!5239 (= c!3945 lt!12813)))

(declare-fun containsKey!35 (List!915 (_ BitVec 64)) Bool)

(assert (=> d!5239 (= lt!12813 (containsKey!35 (toList!460 (getCurrentListMap!281 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(assert (=> d!5239 (= (contains!408 (getCurrentListMap!281 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304) lt!12812)))

(declare-fun b!35045 () Bool)

(declare-fun lt!12811 () Unit!777)

(assert (=> b!35045 (= e!22134 lt!12811)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!32 (List!915 (_ BitVec 64)) Unit!777)

(assert (=> b!35045 (= lt!12811 (lemmaContainsKeyImpliesGetValueByKeyDefined!32 (toList!460 (getCurrentListMap!281 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-datatypes ((Option!77 0))(
  ( (Some!76 (v!1929 V!1971)) (None!75) )
))
(declare-fun isDefined!33 (Option!77) Bool)

(declare-fun getValueByKey!71 (List!915 (_ BitVec 64)) Option!77)

(assert (=> b!35045 (isDefined!33 (getValueByKey!71 (toList!460 (getCurrentListMap!281 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304))))

(declare-fun b!35046 () Bool)

(declare-fun Unit!779 () Unit!777)

(assert (=> b!35046 (= e!22134 Unit!779)))

(declare-fun b!35047 () Bool)

(assert (=> b!35047 (= e!22133 (isDefined!33 (getValueByKey!71 (toList!460 (getCurrentListMap!281 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504)) k0!1304)))))

(assert (= (and d!5239 c!3945) b!35045))

(assert (= (and d!5239 (not c!3945)) b!35046))

(assert (= (and d!5239 (not res!21320)) b!35047))

(declare-fun m!28123 () Bool)

(assert (=> d!5239 m!28123))

(declare-fun m!28125 () Bool)

(assert (=> b!35045 m!28125))

(declare-fun m!28127 () Bool)

(assert (=> b!35045 m!28127))

(assert (=> b!35045 m!28127))

(declare-fun m!28129 () Bool)

(assert (=> b!35045 m!28129))

(assert (=> b!35047 m!28127))

(assert (=> b!35047 m!28127))

(assert (=> b!35047 m!28129))

(assert (=> b!34976 d!5239))

(declare-fun b!35091 () Bool)

(declare-fun e!22164 () Bool)

(assert (=> b!35091 (= e!22164 (validKeyInArray!0 (select (arr!1154 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35092 () Bool)

(declare-fun e!22173 () ListLongMap!889)

(declare-fun e!22171 () ListLongMap!889)

(assert (=> b!35092 (= e!22173 e!22171)))

(declare-fun c!3963 () Bool)

(assert (=> b!35092 (= c!3963 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!2749 () Bool)

(declare-fun call!2757 () ListLongMap!889)

(declare-fun call!2754 () ListLongMap!889)

(assert (=> bm!2749 (= call!2757 call!2754)))

(declare-fun b!35093 () Bool)

(declare-fun e!22165 () Bool)

(declare-fun e!22161 () Bool)

(assert (=> b!35093 (= e!22165 e!22161)))

(declare-fun res!21342 () Bool)

(declare-fun call!2756 () Bool)

(assert (=> b!35093 (= res!21342 call!2756)))

(assert (=> b!35093 (=> (not res!21342) (not e!22161))))

(declare-fun b!35094 () Bool)

(declare-fun e!22169 () Bool)

(declare-fun lt!12862 () ListLongMap!889)

(declare-fun apply!39 (ListLongMap!889 (_ BitVec 64)) V!1971)

(declare-fun get!600 (ValueCell!605 V!1971) V!1971)

(declare-fun dynLambda!152 (Int (_ BitVec 64)) V!1971)

(assert (=> b!35094 (= e!22169 (= (apply!39 lt!12862 (select (arr!1154 _keys!1833) #b00000000000000000000000000000000)) (get!600 (select (arr!1155 _values!1501) #b00000000000000000000000000000000) (dynLambda!152 defaultEntry!1504 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!35094 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1256 _values!1501)))))

(assert (=> b!35094 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1255 _keys!1833)))))

(declare-fun bm!2750 () Bool)

(declare-fun call!2752 () ListLongMap!889)

(assert (=> bm!2750 (= call!2752 call!2757)))

(declare-fun b!35095 () Bool)

(declare-fun e!22167 () Bool)

(assert (=> b!35095 (= e!22167 e!22169)))

(declare-fun res!21344 () Bool)

(assert (=> b!35095 (=> (not res!21344) (not e!22169))))

(assert (=> b!35095 (= res!21344 (contains!408 lt!12862 (select (arr!1154 _keys!1833) #b00000000000000000000000000000000)))))

(assert (=> b!35095 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1255 _keys!1833)))))

(declare-fun bm!2751 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!26 (array!2413 array!2415 (_ BitVec 32) (_ BitVec 32) V!1971 V!1971 (_ BitVec 32) Int) ListLongMap!889)

(assert (=> bm!2751 (= call!2754 (getCurrentListMapNoExtraKeys!26 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!35096 () Bool)

(declare-fun e!22163 () Bool)

(declare-fun e!22172 () Bool)

(assert (=> b!35096 (= e!22163 e!22172)))

(declare-fun res!21346 () Bool)

(declare-fun call!2753 () Bool)

(assert (=> b!35096 (= res!21346 call!2753)))

(assert (=> b!35096 (=> (not res!21346) (not e!22172))))

(declare-fun bm!2752 () Bool)

(declare-fun call!2758 () ListLongMap!889)

(declare-fun call!2755 () ListLongMap!889)

(assert (=> bm!2752 (= call!2758 call!2755)))

(declare-fun b!35097 () Bool)

(assert (=> b!35097 (= e!22163 (not call!2753))))

(declare-fun b!35098 () Bool)

(assert (=> b!35098 (= e!22171 call!2758)))

(declare-fun bm!2753 () Bool)

(assert (=> bm!2753 (= call!2753 (contains!408 lt!12862 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!5241 () Bool)

(declare-fun e!22166 () Bool)

(assert (=> d!5241 e!22166))

(declare-fun res!21339 () Bool)

(assert (=> d!5241 (=> (not res!21339) (not e!22166))))

(assert (=> d!5241 (= res!21339 (or (bvsge #b00000000000000000000000000000000 (size!1255 _keys!1833)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1255 _keys!1833)))))))

(declare-fun lt!12859 () ListLongMap!889)

(assert (=> d!5241 (= lt!12862 lt!12859)))

(declare-fun lt!12875 () Unit!777)

(declare-fun e!22162 () Unit!777)

(assert (=> d!5241 (= lt!12875 e!22162)))

(declare-fun c!3959 () Bool)

(assert (=> d!5241 (= c!3959 e!22164)))

(declare-fun res!21343 () Bool)

(assert (=> d!5241 (=> (not res!21343) (not e!22164))))

(assert (=> d!5241 (= res!21343 (bvslt #b00000000000000000000000000000000 (size!1255 _keys!1833)))))

(assert (=> d!5241 (= lt!12859 e!22173)))

(declare-fun c!3960 () Bool)

(assert (=> d!5241 (= c!3960 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!5241 (validMask!0 mask!2294)))

(assert (=> d!5241 (= (getCurrentListMap!281 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) lt!12862)))

(declare-fun b!35090 () Bool)

(declare-fun res!21341 () Bool)

(assert (=> b!35090 (=> (not res!21341) (not e!22166))))

(assert (=> b!35090 (= res!21341 e!22167)))

(declare-fun res!21347 () Bool)

(assert (=> b!35090 (=> res!21347 e!22167)))

(declare-fun e!22168 () Bool)

(assert (=> b!35090 (= res!21347 (not e!22168))))

(declare-fun res!21345 () Bool)

(assert (=> b!35090 (=> (not res!21345) (not e!22168))))

(assert (=> b!35090 (= res!21345 (bvslt #b00000000000000000000000000000000 (size!1255 _keys!1833)))))

(declare-fun b!35099 () Bool)

(assert (=> b!35099 (= e!22166 e!22165)))

(declare-fun c!3958 () Bool)

(assert (=> b!35099 (= c!3958 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!2754 () Bool)

(assert (=> bm!2754 (= call!2756 (contains!408 lt!12862 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!35100 () Bool)

(assert (=> b!35100 (= e!22168 (validKeyInArray!0 (select (arr!1154 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35101 () Bool)

(assert (=> b!35101 (= e!22165 (not call!2756))))

(declare-fun b!35102 () Bool)

(declare-fun lt!12878 () Unit!777)

(assert (=> b!35102 (= e!22162 lt!12878)))

(declare-fun lt!12874 () ListLongMap!889)

(assert (=> b!35102 (= lt!12874 (getCurrentListMapNoExtraKeys!26 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12864 () (_ BitVec 64))

(assert (=> b!35102 (= lt!12864 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12861 () (_ BitVec 64))

(assert (=> b!35102 (= lt!12861 (select (arr!1154 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12870 () Unit!777)

(declare-fun addStillContains!24 (ListLongMap!889 (_ BitVec 64) V!1971 (_ BitVec 64)) Unit!777)

(assert (=> b!35102 (= lt!12870 (addStillContains!24 lt!12874 lt!12864 zeroValue!1443 lt!12861))))

(declare-fun +!56 (ListLongMap!889 tuple2!1318) ListLongMap!889)

(assert (=> b!35102 (contains!408 (+!56 lt!12874 (tuple2!1319 lt!12864 zeroValue!1443)) lt!12861)))

(declare-fun lt!12868 () Unit!777)

(assert (=> b!35102 (= lt!12868 lt!12870)))

(declare-fun lt!12860 () ListLongMap!889)

(assert (=> b!35102 (= lt!12860 (getCurrentListMapNoExtraKeys!26 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12877 () (_ BitVec 64))

(assert (=> b!35102 (= lt!12877 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12872 () (_ BitVec 64))

(assert (=> b!35102 (= lt!12872 (select (arr!1154 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12869 () Unit!777)

(declare-fun addApplyDifferent!24 (ListLongMap!889 (_ BitVec 64) V!1971 (_ BitVec 64)) Unit!777)

(assert (=> b!35102 (= lt!12869 (addApplyDifferent!24 lt!12860 lt!12877 minValue!1443 lt!12872))))

(assert (=> b!35102 (= (apply!39 (+!56 lt!12860 (tuple2!1319 lt!12877 minValue!1443)) lt!12872) (apply!39 lt!12860 lt!12872))))

(declare-fun lt!12879 () Unit!777)

(assert (=> b!35102 (= lt!12879 lt!12869)))

(declare-fun lt!12866 () ListLongMap!889)

(assert (=> b!35102 (= lt!12866 (getCurrentListMapNoExtraKeys!26 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12863 () (_ BitVec 64))

(assert (=> b!35102 (= lt!12863 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12871 () (_ BitVec 64))

(assert (=> b!35102 (= lt!12871 (select (arr!1154 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12873 () Unit!777)

(assert (=> b!35102 (= lt!12873 (addApplyDifferent!24 lt!12866 lt!12863 zeroValue!1443 lt!12871))))

(assert (=> b!35102 (= (apply!39 (+!56 lt!12866 (tuple2!1319 lt!12863 zeroValue!1443)) lt!12871) (apply!39 lt!12866 lt!12871))))

(declare-fun lt!12876 () Unit!777)

(assert (=> b!35102 (= lt!12876 lt!12873)))

(declare-fun lt!12865 () ListLongMap!889)

(assert (=> b!35102 (= lt!12865 (getCurrentListMapNoExtraKeys!26 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun lt!12867 () (_ BitVec 64))

(assert (=> b!35102 (= lt!12867 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!12880 () (_ BitVec 64))

(assert (=> b!35102 (= lt!12880 (select (arr!1154 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> b!35102 (= lt!12878 (addApplyDifferent!24 lt!12865 lt!12867 minValue!1443 lt!12880))))

(assert (=> b!35102 (= (apply!39 (+!56 lt!12865 (tuple2!1319 lt!12867 minValue!1443)) lt!12880) (apply!39 lt!12865 lt!12880))))

(declare-fun b!35103 () Bool)

(declare-fun e!22170 () ListLongMap!889)

(assert (=> b!35103 (= e!22170 call!2758)))

(declare-fun b!35104 () Bool)

(declare-fun res!21340 () Bool)

(assert (=> b!35104 (=> (not res!21340) (not e!22166))))

(assert (=> b!35104 (= res!21340 e!22163)))

(declare-fun c!3962 () Bool)

(assert (=> b!35104 (= c!3962 (not (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!35105 () Bool)

(declare-fun c!3961 () Bool)

(assert (=> b!35105 (= c!3961 (and (not (= (bvand extraKeys!1422 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1422 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!35105 (= e!22171 e!22170)))

(declare-fun b!35106 () Bool)

(assert (=> b!35106 (= e!22161 (= (apply!39 lt!12862 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1443))))

(declare-fun b!35107 () Bool)

(assert (=> b!35107 (= e!22170 call!2752)))

(declare-fun b!35108 () Bool)

(assert (=> b!35108 (= e!22172 (= (apply!39 lt!12862 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1443))))

(declare-fun b!35109 () Bool)

(declare-fun Unit!780 () Unit!777)

(assert (=> b!35109 (= e!22162 Unit!780)))

(declare-fun bm!2755 () Bool)

(assert (=> bm!2755 (= call!2755 (+!56 (ite c!3960 call!2754 (ite c!3963 call!2757 call!2752)) (ite (or c!3960 c!3963) (tuple2!1319 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1443) (tuple2!1319 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443))))))

(declare-fun b!35110 () Bool)

(assert (=> b!35110 (= e!22173 (+!56 call!2755 (tuple2!1319 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1443)))))

(assert (= (and d!5241 c!3960) b!35110))

(assert (= (and d!5241 (not c!3960)) b!35092))

(assert (= (and b!35092 c!3963) b!35098))

(assert (= (and b!35092 (not c!3963)) b!35105))

(assert (= (and b!35105 c!3961) b!35103))

(assert (= (and b!35105 (not c!3961)) b!35107))

(assert (= (or b!35103 b!35107) bm!2750))

(assert (= (or b!35098 bm!2750) bm!2749))

(assert (= (or b!35098 b!35103) bm!2752))

(assert (= (or b!35110 bm!2749) bm!2751))

(assert (= (or b!35110 bm!2752) bm!2755))

(assert (= (and d!5241 res!21343) b!35091))

(assert (= (and d!5241 c!3959) b!35102))

(assert (= (and d!5241 (not c!3959)) b!35109))

(assert (= (and d!5241 res!21339) b!35090))

(assert (= (and b!35090 res!21345) b!35100))

(assert (= (and b!35090 (not res!21347)) b!35095))

(assert (= (and b!35095 res!21344) b!35094))

(assert (= (and b!35090 res!21341) b!35104))

(assert (= (and b!35104 c!3962) b!35096))

(assert (= (and b!35104 (not c!3962)) b!35097))

(assert (= (and b!35096 res!21346) b!35108))

(assert (= (or b!35096 b!35097) bm!2753))

(assert (= (and b!35104 res!21340) b!35099))

(assert (= (and b!35099 c!3958) b!35093))

(assert (= (and b!35099 (not c!3958)) b!35101))

(assert (= (and b!35093 res!21342) b!35106))

(assert (= (or b!35093 b!35101) bm!2754))

(declare-fun b_lambda!1703 () Bool)

(assert (=> (not b_lambda!1703) (not b!35094)))

(declare-fun t!3618 () Bool)

(declare-fun tb!687 () Bool)

(assert (=> (and start!4490 (= defaultEntry!1504 defaultEntry!1504) t!3618) tb!687))

(declare-fun result!1183 () Bool)

(assert (=> tb!687 (= result!1183 tp_is_empty!1609)))

(assert (=> b!35094 t!3618))

(declare-fun b_and!2073 () Bool)

(assert (= b_and!2067 (and (=> t!3618 result!1183) b_and!2073)))

(declare-fun m!28131 () Bool)

(assert (=> b!35106 m!28131))

(declare-fun m!28133 () Bool)

(assert (=> b!35100 m!28133))

(assert (=> b!35100 m!28133))

(declare-fun m!28135 () Bool)

(assert (=> b!35100 m!28135))

(declare-fun m!28137 () Bool)

(assert (=> b!35108 m!28137))

(declare-fun m!28139 () Bool)

(assert (=> bm!2754 m!28139))

(assert (=> b!35095 m!28133))

(assert (=> b!35095 m!28133))

(declare-fun m!28141 () Bool)

(assert (=> b!35095 m!28141))

(assert (=> b!35091 m!28133))

(assert (=> b!35091 m!28133))

(assert (=> b!35091 m!28135))

(declare-fun m!28143 () Bool)

(assert (=> bm!2755 m!28143))

(declare-fun m!28145 () Bool)

(assert (=> b!35102 m!28145))

(declare-fun m!28147 () Bool)

(assert (=> b!35102 m!28147))

(declare-fun m!28149 () Bool)

(assert (=> b!35102 m!28149))

(declare-fun m!28151 () Bool)

(assert (=> b!35102 m!28151))

(declare-fun m!28153 () Bool)

(assert (=> b!35102 m!28153))

(declare-fun m!28155 () Bool)

(assert (=> b!35102 m!28155))

(assert (=> b!35102 m!28151))

(declare-fun m!28157 () Bool)

(assert (=> b!35102 m!28157))

(declare-fun m!28159 () Bool)

(assert (=> b!35102 m!28159))

(assert (=> b!35102 m!28133))

(declare-fun m!28161 () Bool)

(assert (=> b!35102 m!28161))

(declare-fun m!28163 () Bool)

(assert (=> b!35102 m!28163))

(declare-fun m!28165 () Bool)

(assert (=> b!35102 m!28165))

(assert (=> b!35102 m!28149))

(declare-fun m!28167 () Bool)

(assert (=> b!35102 m!28167))

(declare-fun m!28169 () Bool)

(assert (=> b!35102 m!28169))

(declare-fun m!28171 () Bool)

(assert (=> b!35102 m!28171))

(assert (=> b!35102 m!28171))

(declare-fun m!28173 () Bool)

(assert (=> b!35102 m!28173))

(declare-fun m!28175 () Bool)

(assert (=> b!35102 m!28175))

(assert (=> b!35102 m!28145))

(assert (=> b!35094 m!28133))

(declare-fun m!28177 () Bool)

(assert (=> b!35094 m!28177))

(declare-fun m!28179 () Bool)

(assert (=> b!35094 m!28179))

(assert (=> b!35094 m!28133))

(declare-fun m!28181 () Bool)

(assert (=> b!35094 m!28181))

(assert (=> b!35094 m!28177))

(assert (=> b!35094 m!28179))

(declare-fun m!28183 () Bool)

(assert (=> b!35094 m!28183))

(declare-fun m!28185 () Bool)

(assert (=> bm!2753 m!28185))

(declare-fun m!28187 () Bool)

(assert (=> b!35110 m!28187))

(assert (=> d!5241 m!28073))

(assert (=> bm!2751 m!28155))

(assert (=> b!34976 d!5241))

(declare-fun bm!2758 () Bool)

(declare-fun call!2761 () Bool)

(assert (=> bm!2758 (= call!2761 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun d!5243 () Bool)

(declare-fun res!21353 () Bool)

(declare-fun e!22182 () Bool)

(assert (=> d!5243 (=> res!21353 e!22182)))

(assert (=> d!5243 (= res!21353 (bvsge #b00000000000000000000000000000000 (size!1255 _keys!1833)))))

(assert (=> d!5243 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!22182)))

(declare-fun b!35121 () Bool)

(declare-fun e!22180 () Bool)

(assert (=> b!35121 (= e!22182 e!22180)))

(declare-fun c!3966 () Bool)

(assert (=> b!35121 (= c!3966 (validKeyInArray!0 (select (arr!1154 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35122 () Bool)

(assert (=> b!35122 (= e!22180 call!2761)))

(declare-fun b!35123 () Bool)

(declare-fun e!22181 () Bool)

(assert (=> b!35123 (= e!22180 e!22181)))

(declare-fun lt!12888 () (_ BitVec 64))

(assert (=> b!35123 (= lt!12888 (select (arr!1154 _keys!1833) #b00000000000000000000000000000000))))

(declare-fun lt!12887 () Unit!777)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2413 (_ BitVec 64) (_ BitVec 32)) Unit!777)

(assert (=> b!35123 (= lt!12887 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!12888 #b00000000000000000000000000000000))))

(assert (=> b!35123 (arrayContainsKey!0 _keys!1833 lt!12888 #b00000000000000000000000000000000)))

(declare-fun lt!12889 () Unit!777)

(assert (=> b!35123 (= lt!12889 lt!12887)))

(declare-fun res!21352 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2413 (_ BitVec 32)) SeekEntryResult!147)

(assert (=> b!35123 (= res!21352 (= (seekEntryOrOpen!0 (select (arr!1154 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!147 #b00000000000000000000000000000000)))))

(assert (=> b!35123 (=> (not res!21352) (not e!22181))))

(declare-fun b!35124 () Bool)

(assert (=> b!35124 (= e!22181 call!2761)))

(assert (= (and d!5243 (not res!21353)) b!35121))

(assert (= (and b!35121 c!3966) b!35123))

(assert (= (and b!35121 (not c!3966)) b!35122))

(assert (= (and b!35123 res!21352) b!35124))

(assert (= (or b!35124 b!35122) bm!2758))

(declare-fun m!28189 () Bool)

(assert (=> bm!2758 m!28189))

(assert (=> b!35121 m!28133))

(assert (=> b!35121 m!28133))

(assert (=> b!35121 m!28135))

(assert (=> b!35123 m!28133))

(declare-fun m!28191 () Bool)

(assert (=> b!35123 m!28191))

(declare-fun m!28193 () Bool)

(assert (=> b!35123 m!28193))

(assert (=> b!35123 m!28133))

(declare-fun m!28195 () Bool)

(assert (=> b!35123 m!28195))

(assert (=> b!34977 d!5243))

(declare-fun bm!2761 () Bool)

(declare-fun call!2764 () Bool)

(declare-fun c!3969 () Bool)

(assert (=> bm!2761 (= call!2764 (arrayNoDuplicates!0 _keys!1833 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!3969 (Cons!910 (select (arr!1154 _keys!1833) #b00000000000000000000000000000000) Nil!911) Nil!911)))))

(declare-fun b!35135 () Bool)

(declare-fun e!22192 () Bool)

(declare-fun e!22193 () Bool)

(assert (=> b!35135 (= e!22192 e!22193)))

(declare-fun res!21360 () Bool)

(assert (=> b!35135 (=> (not res!21360) (not e!22193))))

(declare-fun e!22191 () Bool)

(assert (=> b!35135 (= res!21360 (not e!22191))))

(declare-fun res!21362 () Bool)

(assert (=> b!35135 (=> (not res!21362) (not e!22191))))

(assert (=> b!35135 (= res!21362 (validKeyInArray!0 (select (arr!1154 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun d!5245 () Bool)

(declare-fun res!21361 () Bool)

(assert (=> d!5245 (=> res!21361 e!22192)))

(assert (=> d!5245 (= res!21361 (bvsge #b00000000000000000000000000000000 (size!1255 _keys!1833)))))

(assert (=> d!5245 (= (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!911) e!22192)))

(declare-fun b!35136 () Bool)

(declare-fun e!22194 () Bool)

(assert (=> b!35136 (= e!22194 call!2764)))

(declare-fun b!35137 () Bool)

(assert (=> b!35137 (= e!22194 call!2764)))

(declare-fun b!35138 () Bool)

(declare-fun contains!410 (List!914 (_ BitVec 64)) Bool)

(assert (=> b!35138 (= e!22191 (contains!410 Nil!911 (select (arr!1154 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!35139 () Bool)

(assert (=> b!35139 (= e!22193 e!22194)))

(assert (=> b!35139 (= c!3969 (validKeyInArray!0 (select (arr!1154 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!5245 (not res!21361)) b!35135))

(assert (= (and b!35135 res!21362) b!35138))

(assert (= (and b!35135 res!21360) b!35139))

(assert (= (and b!35139 c!3969) b!35136))

(assert (= (and b!35139 (not c!3969)) b!35137))

(assert (= (or b!35136 b!35137) bm!2761))

(assert (=> bm!2761 m!28133))

(declare-fun m!28197 () Bool)

(assert (=> bm!2761 m!28197))

(assert (=> b!35135 m!28133))

(assert (=> b!35135 m!28133))

(assert (=> b!35135 m!28135))

(assert (=> b!35138 m!28133))

(assert (=> b!35138 m!28133))

(declare-fun m!28199 () Bool)

(assert (=> b!35138 m!28199))

(assert (=> b!35139 m!28133))

(assert (=> b!35139 m!28133))

(assert (=> b!35139 m!28135))

(assert (=> b!34971 d!5245))

(declare-fun d!5247 () Bool)

(declare-fun res!21367 () Bool)

(declare-fun e!22199 () Bool)

(assert (=> d!5247 (=> res!21367 e!22199)))

(assert (=> d!5247 (= res!21367 (= (select (arr!1154 _keys!1833) #b00000000000000000000000000000000) k0!1304))))

(assert (=> d!5247 (= (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000) e!22199)))

(declare-fun b!35144 () Bool)

(declare-fun e!22200 () Bool)

(assert (=> b!35144 (= e!22199 e!22200)))

(declare-fun res!21368 () Bool)

(assert (=> b!35144 (=> (not res!21368) (not e!22200))))

(assert (=> b!35144 (= res!21368 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1255 _keys!1833)))))

(declare-fun b!35145 () Bool)

(assert (=> b!35145 (= e!22200 (arrayContainsKey!0 _keys!1833 k0!1304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!5247 (not res!21367)) b!35144))

(assert (= (and b!35144 res!21368) b!35145))

(assert (=> d!5247 m!28133))

(declare-fun m!28201 () Bool)

(assert (=> b!35145 m!28201))

(assert (=> b!34974 d!5247))

(declare-fun b!35158 () Bool)

(declare-fun e!22207 () SeekEntryResult!147)

(declare-fun lt!12900 () SeekEntryResult!147)

(assert (=> b!35158 (= e!22207 (Found!147 (index!2712 lt!12900)))))

(declare-fun b!35159 () Bool)

(declare-fun e!22209 () SeekEntryResult!147)

(assert (=> b!35159 (= e!22209 Undefined!147)))

(declare-fun b!35160 () Bool)

(declare-fun c!3978 () Bool)

(declare-fun lt!12899 () (_ BitVec 64))

(assert (=> b!35160 (= c!3978 (= lt!12899 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!22208 () SeekEntryResult!147)

(assert (=> b!35160 (= e!22207 e!22208)))

(declare-fun b!35161 () Bool)

(declare-fun lt!12901 () SeekEntryResult!147)

(assert (=> b!35161 (= e!22208 (ite ((_ is MissingVacant!147) lt!12901) (MissingZero!147 (index!2713 lt!12901)) lt!12901))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2413 (_ BitVec 32)) SeekEntryResult!147)

(assert (=> b!35161 (= lt!12901 (seekKeyOrZeroReturnVacant!0 (x!6973 lt!12900) (index!2712 lt!12900) (index!2712 lt!12900) k0!1304 _keys!1833 mask!2294))))

(declare-fun d!5249 () Bool)

(declare-fun lt!12898 () SeekEntryResult!147)

(assert (=> d!5249 (and (or ((_ is MissingVacant!147) lt!12898) (not ((_ is Found!147) lt!12898)) (and (bvsge (index!2711 lt!12898) #b00000000000000000000000000000000) (bvslt (index!2711 lt!12898) (size!1255 _keys!1833)))) (not ((_ is MissingVacant!147) lt!12898)) (or (not ((_ is Found!147) lt!12898)) (= (select (arr!1154 _keys!1833) (index!2711 lt!12898)) k0!1304)))))

(assert (=> d!5249 (= lt!12898 e!22209)))

(declare-fun c!3977 () Bool)

(assert (=> d!5249 (= c!3977 (and ((_ is Intermediate!147) lt!12900) (undefined!959 lt!12900)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2413 (_ BitVec 32)) SeekEntryResult!147)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!5249 (= lt!12900 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1304 mask!2294) k0!1304 _keys!1833 mask!2294))))

(assert (=> d!5249 (validMask!0 mask!2294)))

(assert (=> d!5249 (= (seekEntry!0 k0!1304 _keys!1833 mask!2294) lt!12898)))

(declare-fun b!35162 () Bool)

(assert (=> b!35162 (= e!22209 e!22207)))

(assert (=> b!35162 (= lt!12899 (select (arr!1154 _keys!1833) (index!2712 lt!12900)))))

(declare-fun c!3976 () Bool)

(assert (=> b!35162 (= c!3976 (= lt!12899 k0!1304))))

(declare-fun b!35163 () Bool)

(assert (=> b!35163 (= e!22208 (MissingZero!147 (index!2712 lt!12900)))))

(assert (= (and d!5249 c!3977) b!35159))

(assert (= (and d!5249 (not c!3977)) b!35162))

(assert (= (and b!35162 c!3976) b!35158))

(assert (= (and b!35162 (not c!3976)) b!35160))

(assert (= (and b!35160 c!3978) b!35163))

(assert (= (and b!35160 (not c!3978)) b!35161))

(declare-fun m!28203 () Bool)

(assert (=> b!35161 m!28203))

(declare-fun m!28205 () Bool)

(assert (=> d!5249 m!28205))

(declare-fun m!28207 () Bool)

(assert (=> d!5249 m!28207))

(assert (=> d!5249 m!28207))

(declare-fun m!28209 () Bool)

(assert (=> d!5249 m!28209))

(assert (=> d!5249 m!28073))

(declare-fun m!28211 () Bool)

(assert (=> b!35162 m!28211))

(assert (=> b!34969 d!5249))

(declare-fun d!5251 () Bool)

(assert (=> d!5251 (= (validKeyInArray!0 k0!1304) (and (not (= k0!1304 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1304 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!34973 d!5251))

(declare-fun d!5253 () Bool)

(assert (=> d!5253 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!4490 d!5253))

(declare-fun d!5255 () Bool)

(assert (=> d!5255 (= (array_inv!789 _values!1501) (bvsge (size!1256 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!4490 d!5255))

(declare-fun d!5257 () Bool)

(assert (=> d!5257 (= (array_inv!790 _keys!1833) (bvsge (size!1255 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!4490 d!5257))

(declare-fun mapIsEmpty!1969 () Bool)

(declare-fun mapRes!1969 () Bool)

(assert (=> mapIsEmpty!1969 mapRes!1969))

(declare-fun b!35171 () Bool)

(declare-fun e!22214 () Bool)

(assert (=> b!35171 (= e!22214 tp_is_empty!1609)))

(declare-fun mapNonEmpty!1969 () Bool)

(declare-fun tp!5218 () Bool)

(declare-fun e!22215 () Bool)

(assert (=> mapNonEmpty!1969 (= mapRes!1969 (and tp!5218 e!22215))))

(declare-fun mapKey!1969 () (_ BitVec 32))

(declare-fun mapRest!1969 () (Array (_ BitVec 32) ValueCell!605))

(declare-fun mapValue!1969 () ValueCell!605)

(assert (=> mapNonEmpty!1969 (= mapRest!1960 (store mapRest!1969 mapKey!1969 mapValue!1969))))

(declare-fun b!35170 () Bool)

(assert (=> b!35170 (= e!22215 tp_is_empty!1609)))

(declare-fun condMapEmpty!1969 () Bool)

(declare-fun mapDefault!1969 () ValueCell!605)

(assert (=> mapNonEmpty!1960 (= condMapEmpty!1969 (= mapRest!1960 ((as const (Array (_ BitVec 32) ValueCell!605)) mapDefault!1969)))))

(assert (=> mapNonEmpty!1960 (= tp!5203 (and e!22214 mapRes!1969))))

(assert (= (and mapNonEmpty!1960 condMapEmpty!1969) mapIsEmpty!1969))

(assert (= (and mapNonEmpty!1960 (not condMapEmpty!1969)) mapNonEmpty!1969))

(assert (= (and mapNonEmpty!1969 ((_ is ValueCellFull!605) mapValue!1969)) b!35170))

(assert (= (and mapNonEmpty!1960 ((_ is ValueCellFull!605) mapDefault!1969)) b!35171))

(declare-fun m!28213 () Bool)

(assert (=> mapNonEmpty!1969 m!28213))

(declare-fun b_lambda!1705 () Bool)

(assert (= b_lambda!1703 (or (and start!4490 b_free!1255) b_lambda!1705)))

(check-sat (not bm!2758) (not b!35135) (not bm!2754) (not b!35139) tp_is_empty!1609 (not b!35100) (not d!5239) (not d!5249) (not b!35138) (not d!5241) (not b!35091) (not bm!2751) (not b!35121) (not bm!2761) (not b!35161) (not b_lambda!1705) (not bm!2755) (not mapNonEmpty!1969) (not b_next!1255) (not b!35110) (not b!35095) (not b!35047) (not b!35045) (not b!35102) (not bm!2753) (not b!35108) (not b!35145) (not b!35123) (not b!35094) b_and!2073 (not b!35106))
(check-sat b_and!2073 (not b_next!1255))
