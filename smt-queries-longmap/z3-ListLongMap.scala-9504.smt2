; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112692 () Bool)

(assert start!112692)

(declare-fun b_free!31029 () Bool)

(declare-fun b_next!31029 () Bool)

(assert (=> start!112692 (= b_free!31029 (not b_next!31029))))

(declare-fun tp!108728 () Bool)

(declare-fun b_and!49995 () Bool)

(assert (=> start!112692 (= tp!108728 b_and!49995)))

(declare-fun b!1336861 () Bool)

(declare-fun res!887211 () Bool)

(declare-fun e!761245 () Bool)

(assert (=> b!1336861 (=> (not res!887211) (not e!761245))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90736 0))(
  ( (array!90737 (arr!43833 (Array (_ BitVec 32) (_ BitVec 64))) (size!44383 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90736)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1336861 (= res!887211 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44383 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1336862 () Bool)

(declare-fun res!887206 () Bool)

(assert (=> b!1336862 (=> (not res!887206) (not e!761245))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((V!54355 0))(
  ( (V!54356 (val!18544 Int)) )
))
(declare-fun minValue!1262 () V!54355)

(declare-fun zeroValue!1262 () V!54355)

(declare-datatypes ((ValueCell!17571 0))(
  ( (ValueCellFull!17571 (v!21184 V!54355)) (EmptyCell!17571) )
))
(declare-datatypes ((array!90738 0))(
  ( (array!90739 (arr!43834 (Array (_ BitVec 32) ValueCell!17571)) (size!44384 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90738)

(declare-datatypes ((tuple2!23920 0))(
  ( (tuple2!23921 (_1!11971 (_ BitVec 64)) (_2!11971 V!54355)) )
))
(declare-datatypes ((List!31062 0))(
  ( (Nil!31059) (Cons!31058 (h!32267 tuple2!23920) (t!45372 List!31062)) )
))
(declare-datatypes ((ListLongMap!21577 0))(
  ( (ListLongMap!21578 (toList!10804 List!31062)) )
))
(declare-fun contains!8969 (ListLongMap!21577 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5775 (array!90736 array!90738 (_ BitVec 32) (_ BitVec 32) V!54355 V!54355 (_ BitVec 32) Int) ListLongMap!21577)

(assert (=> b!1336862 (= res!887206 (contains!8969 (getCurrentListMap!5775 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1336863 () Bool)

(declare-fun res!887209 () Bool)

(assert (=> b!1336863 (=> (not res!887209) (not e!761245))))

(assert (=> b!1336863 (= res!887209 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1336864 () Bool)

(declare-fun e!761243 () Bool)

(declare-fun e!761244 () Bool)

(declare-fun mapRes!57086 () Bool)

(assert (=> b!1336864 (= e!761243 (and e!761244 mapRes!57086))))

(declare-fun condMapEmpty!57086 () Bool)

(declare-fun mapDefault!57086 () ValueCell!17571)

(assert (=> b!1336864 (= condMapEmpty!57086 (= (arr!43834 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17571)) mapDefault!57086)))))

(declare-fun b!1336865 () Bool)

(declare-fun res!887213 () Bool)

(assert (=> b!1336865 (=> (not res!887213) (not e!761245))))

(assert (=> b!1336865 (= res!887213 (and (= (size!44384 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44383 _keys!1590) (size!44384 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!887210 () Bool)

(assert (=> start!112692 (=> (not res!887210) (not e!761245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112692 (= res!887210 (validMask!0 mask!1998))))

(assert (=> start!112692 e!761245))

(declare-fun array_inv!33057 (array!90738) Bool)

(assert (=> start!112692 (and (array_inv!33057 _values!1320) e!761243)))

(assert (=> start!112692 true))

(declare-fun array_inv!33058 (array!90736) Bool)

(assert (=> start!112692 (array_inv!33058 _keys!1590)))

(assert (=> start!112692 tp!108728))

(declare-fun tp_is_empty!36939 () Bool)

(assert (=> start!112692 tp_is_empty!36939))

(declare-fun mapIsEmpty!57086 () Bool)

(assert (=> mapIsEmpty!57086 mapRes!57086))

(declare-fun b!1336866 () Bool)

(assert (=> b!1336866 (= e!761244 tp_is_empty!36939)))

(declare-fun b!1336867 () Bool)

(declare-fun res!887205 () Bool)

(assert (=> b!1336867 (=> (not res!887205) (not e!761245))))

(assert (=> b!1336867 (= res!887205 (not (= (select (arr!43833 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1336868 () Bool)

(declare-fun res!887208 () Bool)

(assert (=> b!1336868 (=> (not res!887208) (not e!761245))))

(declare-datatypes ((List!31063 0))(
  ( (Nil!31060) (Cons!31059 (h!32268 (_ BitVec 64)) (t!45373 List!31063)) )
))
(declare-fun arrayNoDuplicates!0 (array!90736 (_ BitVec 32) List!31063) Bool)

(assert (=> b!1336868 (= res!887208 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31060))))

(declare-fun b!1336869 () Bool)

(declare-fun e!761241 () Bool)

(assert (=> b!1336869 (= e!761241 tp_is_empty!36939)))

(declare-fun b!1336870 () Bool)

(assert (=> b!1336870 (= e!761245 (not (contains!8969 (getCurrentListMap!5775 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) k0!1153)))))

(declare-fun lt!592888 () ListLongMap!21577)

(declare-fun +!4744 (ListLongMap!21577 tuple2!23920) ListLongMap!21577)

(assert (=> b!1336870 (contains!8969 (+!4744 lt!592888 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43936 0))(
  ( (Unit!43937) )
))
(declare-fun lt!592892 () Unit!43936)

(declare-fun addStillContains!1188 (ListLongMap!21577 (_ BitVec 64) V!54355 (_ BitVec 64)) Unit!43936)

(assert (=> b!1336870 (= lt!592892 (addStillContains!1188 lt!592888 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1336870 (contains!8969 lt!592888 k0!1153)))

(declare-fun lt!592887 () Unit!43936)

(declare-fun lt!592891 () V!54355)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!323 ((_ BitVec 64) (_ BitVec 64) V!54355 ListLongMap!21577) Unit!43936)

(assert (=> b!1336870 (= lt!592887 (lemmaInListMapAfterAddingDiffThenInBefore!323 k0!1153 (select (arr!43833 _keys!1590) from!1980) lt!592891 lt!592888))))

(declare-fun lt!592889 () ListLongMap!21577)

(assert (=> b!1336870 (contains!8969 lt!592889 k0!1153)))

(declare-fun lt!592890 () Unit!43936)

(assert (=> b!1336870 (= lt!592890 (lemmaInListMapAfterAddingDiffThenInBefore!323 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592889))))

(assert (=> b!1336870 (= lt!592889 (+!4744 lt!592888 (tuple2!23921 (select (arr!43833 _keys!1590) from!1980) lt!592891)))))

(declare-fun get!22119 (ValueCell!17571 V!54355) V!54355)

(declare-fun dynLambda!3683 (Int (_ BitVec 64)) V!54355)

(assert (=> b!1336870 (= lt!592891 (get!22119 (select (arr!43834 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6386 (array!90736 array!90738 (_ BitVec 32) (_ BitVec 32) V!54355 V!54355 (_ BitVec 32) Int) ListLongMap!21577)

(assert (=> b!1336870 (= lt!592888 (getCurrentListMapNoExtraKeys!6386 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1336871 () Bool)

(declare-fun res!887207 () Bool)

(assert (=> b!1336871 (=> (not res!887207) (not e!761245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90736 (_ BitVec 32)) Bool)

(assert (=> b!1336871 (= res!887207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1336872 () Bool)

(declare-fun res!887212 () Bool)

(assert (=> b!1336872 (=> (not res!887212) (not e!761245))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1336872 (= res!887212 (validKeyInArray!0 (select (arr!43833 _keys!1590) from!1980)))))

(declare-fun mapNonEmpty!57086 () Bool)

(declare-fun tp!108727 () Bool)

(assert (=> mapNonEmpty!57086 (= mapRes!57086 (and tp!108727 e!761241))))

(declare-fun mapRest!57086 () (Array (_ BitVec 32) ValueCell!17571))

(declare-fun mapValue!57086 () ValueCell!17571)

(declare-fun mapKey!57086 () (_ BitVec 32))

(assert (=> mapNonEmpty!57086 (= (arr!43834 _values!1320) (store mapRest!57086 mapKey!57086 mapValue!57086))))

(assert (= (and start!112692 res!887210) b!1336865))

(assert (= (and b!1336865 res!887213) b!1336871))

(assert (= (and b!1336871 res!887207) b!1336868))

(assert (= (and b!1336868 res!887208) b!1336861))

(assert (= (and b!1336861 res!887211) b!1336862))

(assert (= (and b!1336862 res!887206) b!1336867))

(assert (= (and b!1336867 res!887205) b!1336872))

(assert (= (and b!1336872 res!887212) b!1336863))

(assert (= (and b!1336863 res!887209) b!1336870))

(assert (= (and b!1336864 condMapEmpty!57086) mapIsEmpty!57086))

(assert (= (and b!1336864 (not condMapEmpty!57086)) mapNonEmpty!57086))

(get-info :version)

(assert (= (and mapNonEmpty!57086 ((_ is ValueCellFull!17571) mapValue!57086)) b!1336869))

(assert (= (and b!1336864 ((_ is ValueCellFull!17571) mapDefault!57086)) b!1336866))

(assert (= start!112692 b!1336864))

(declare-fun b_lambda!24187 () Bool)

(assert (=> (not b_lambda!24187) (not b!1336870)))

(declare-fun t!45371 () Bool)

(declare-fun tb!12113 () Bool)

(assert (=> (and start!112692 (= defaultEntry!1323 defaultEntry!1323) t!45371) tb!12113))

(declare-fun result!25299 () Bool)

(assert (=> tb!12113 (= result!25299 tp_is_empty!36939)))

(assert (=> b!1336870 t!45371))

(declare-fun b_and!49997 () Bool)

(assert (= b_and!49995 (and (=> t!45371 result!25299) b_and!49997)))

(declare-fun m!1224931 () Bool)

(assert (=> start!112692 m!1224931))

(declare-fun m!1224933 () Bool)

(assert (=> start!112692 m!1224933))

(declare-fun m!1224935 () Bool)

(assert (=> start!112692 m!1224935))

(declare-fun m!1224937 () Bool)

(assert (=> b!1336872 m!1224937))

(assert (=> b!1336872 m!1224937))

(declare-fun m!1224939 () Bool)

(assert (=> b!1336872 m!1224939))

(declare-fun m!1224941 () Bool)

(assert (=> b!1336868 m!1224941))

(assert (=> b!1336867 m!1224937))

(declare-fun m!1224943 () Bool)

(assert (=> mapNonEmpty!57086 m!1224943))

(declare-fun m!1224945 () Bool)

(assert (=> b!1336870 m!1224945))

(declare-fun m!1224947 () Bool)

(assert (=> b!1336870 m!1224947))

(declare-fun m!1224949 () Bool)

(assert (=> b!1336870 m!1224949))

(declare-fun m!1224951 () Bool)

(assert (=> b!1336870 m!1224951))

(declare-fun m!1224953 () Bool)

(assert (=> b!1336870 m!1224953))

(declare-fun m!1224955 () Bool)

(assert (=> b!1336870 m!1224955))

(assert (=> b!1336870 m!1224951))

(declare-fun m!1224957 () Bool)

(assert (=> b!1336870 m!1224957))

(assert (=> b!1336870 m!1224945))

(declare-fun m!1224959 () Bool)

(assert (=> b!1336870 m!1224959))

(declare-fun m!1224961 () Bool)

(assert (=> b!1336870 m!1224961))

(assert (=> b!1336870 m!1224937))

(declare-fun m!1224963 () Bool)

(assert (=> b!1336870 m!1224963))

(assert (=> b!1336870 m!1224955))

(assert (=> b!1336870 m!1224937))

(declare-fun m!1224965 () Bool)

(assert (=> b!1336870 m!1224965))

(declare-fun m!1224967 () Bool)

(assert (=> b!1336870 m!1224967))

(assert (=> b!1336870 m!1224961))

(declare-fun m!1224969 () Bool)

(assert (=> b!1336870 m!1224969))

(declare-fun m!1224971 () Bool)

(assert (=> b!1336870 m!1224971))

(declare-fun m!1224973 () Bool)

(assert (=> b!1336871 m!1224973))

(declare-fun m!1224975 () Bool)

(assert (=> b!1336862 m!1224975))

(assert (=> b!1336862 m!1224975))

(declare-fun m!1224977 () Bool)

(assert (=> b!1336862 m!1224977))

(check-sat (not b!1336868) (not start!112692) (not b_next!31029) (not b_lambda!24187) (not mapNonEmpty!57086) (not b!1336871) (not b!1336862) tp_is_empty!36939 (not b!1336872) b_and!49997 (not b!1336870))
(check-sat b_and!49997 (not b_next!31029))
(get-model)

(declare-fun b_lambda!24191 () Bool)

(assert (= b_lambda!24187 (or (and start!112692 b_free!31029) b_lambda!24191)))

(check-sat (not b!1336868) (not start!112692) (not b_next!31029) (not mapNonEmpty!57086) (not b!1336871) (not b!1336862) tp_is_empty!36939 (not b!1336872) b_and!49997 (not b!1336870) (not b_lambda!24191))
(check-sat b_and!49997 (not b_next!31029))
(get-model)

(declare-fun bm!64868 () Bool)

(declare-fun call!64871 () Bool)

(assert (=> bm!64868 (= call!64871 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun b!1336921 () Bool)

(declare-fun e!761269 () Bool)

(declare-fun e!761267 () Bool)

(assert (=> b!1336921 (= e!761269 e!761267)))

(declare-fun lt!592917 () (_ BitVec 64))

(assert (=> b!1336921 (= lt!592917 (select (arr!43833 _keys!1590) #b00000000000000000000000000000000))))

(declare-fun lt!592919 () Unit!43936)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90736 (_ BitVec 64) (_ BitVec 32)) Unit!43936)

(assert (=> b!1336921 (= lt!592919 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!592917 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90736 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1336921 (arrayContainsKey!0 _keys!1590 lt!592917 #b00000000000000000000000000000000)))

(declare-fun lt!592918 () Unit!43936)

(assert (=> b!1336921 (= lt!592918 lt!592919)))

(declare-fun res!887246 () Bool)

(declare-datatypes ((SeekEntryResult!10048 0))(
  ( (MissingZero!10048 (index!42563 (_ BitVec 32))) (Found!10048 (index!42564 (_ BitVec 32))) (Intermediate!10048 (undefined!10860 Bool) (index!42565 (_ BitVec 32)) (x!119440 (_ BitVec 32))) (Undefined!10048) (MissingVacant!10048 (index!42566 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90736 (_ BitVec 32)) SeekEntryResult!10048)

(assert (=> b!1336921 (= res!887246 (= (seekEntryOrOpen!0 (select (arr!43833 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10048 #b00000000000000000000000000000000)))))

(assert (=> b!1336921 (=> (not res!887246) (not e!761267))))

(declare-fun d!143691 () Bool)

(declare-fun res!887245 () Bool)

(declare-fun e!761268 () Bool)

(assert (=> d!143691 (=> res!887245 e!761268)))

(assert (=> d!143691 (= res!887245 (bvsge #b00000000000000000000000000000000 (size!44383 _keys!1590)))))

(assert (=> d!143691 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!761268)))

(declare-fun b!1336922 () Bool)

(assert (=> b!1336922 (= e!761267 call!64871)))

(declare-fun b!1336923 () Bool)

(assert (=> b!1336923 (= e!761269 call!64871)))

(declare-fun b!1336924 () Bool)

(assert (=> b!1336924 (= e!761268 e!761269)))

(declare-fun c!126009 () Bool)

(assert (=> b!1336924 (= c!126009 (validKeyInArray!0 (select (arr!43833 _keys!1590) #b00000000000000000000000000000000)))))

(assert (= (and d!143691 (not res!887245)) b!1336924))

(assert (= (and b!1336924 c!126009) b!1336921))

(assert (= (and b!1336924 (not c!126009)) b!1336923))

(assert (= (and b!1336921 res!887246) b!1336922))

(assert (= (or b!1336922 b!1336923) bm!64868))

(declare-fun m!1225027 () Bool)

(assert (=> bm!64868 m!1225027))

(declare-fun m!1225029 () Bool)

(assert (=> b!1336921 m!1225029))

(declare-fun m!1225031 () Bool)

(assert (=> b!1336921 m!1225031))

(declare-fun m!1225033 () Bool)

(assert (=> b!1336921 m!1225033))

(assert (=> b!1336921 m!1225029))

(declare-fun m!1225035 () Bool)

(assert (=> b!1336921 m!1225035))

(assert (=> b!1336924 m!1225029))

(assert (=> b!1336924 m!1225029))

(declare-fun m!1225037 () Bool)

(assert (=> b!1336924 m!1225037))

(assert (=> b!1336871 d!143691))

(declare-fun d!143693 () Bool)

(declare-fun e!761272 () Bool)

(assert (=> d!143693 e!761272))

(declare-fun res!887251 () Bool)

(assert (=> d!143693 (=> (not res!887251) (not e!761272))))

(declare-fun lt!592930 () ListLongMap!21577)

(assert (=> d!143693 (= res!887251 (contains!8969 lt!592930 (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun lt!592931 () List!31062)

(assert (=> d!143693 (= lt!592930 (ListLongMap!21578 lt!592931))))

(declare-fun lt!592928 () Unit!43936)

(declare-fun lt!592929 () Unit!43936)

(assert (=> d!143693 (= lt!592928 lt!592929)))

(declare-datatypes ((Option!768 0))(
  ( (Some!767 (v!21186 V!54355)) (None!766) )
))
(declare-fun getValueByKey!716 (List!31062 (_ BitVec 64)) Option!768)

(assert (=> d!143693 (= (getValueByKey!716 lt!592931 (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!767 (_2!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun lemmaContainsTupThenGetReturnValue!361 (List!31062 (_ BitVec 64) V!54355) Unit!43936)

(assert (=> d!143693 (= lt!592929 (lemmaContainsTupThenGetReturnValue!361 lt!592931 (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun insertStrictlySorted!490 (List!31062 (_ BitVec 64) V!54355) List!31062)

(assert (=> d!143693 (= lt!592931 (insertStrictlySorted!490 (toList!10804 lt!592888) (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) (_2!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(assert (=> d!143693 (= (+!4744 lt!592888 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) lt!592930)))

(declare-fun b!1336929 () Bool)

(declare-fun res!887252 () Bool)

(assert (=> b!1336929 (=> (not res!887252) (not e!761272))))

(assert (=> b!1336929 (= res!887252 (= (getValueByKey!716 (toList!10804 lt!592930) (_1!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) (Some!767 (_2!11971 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))))

(declare-fun b!1336930 () Bool)

(declare-fun contains!8971 (List!31062 tuple2!23920) Bool)

(assert (=> b!1336930 (= e!761272 (contains!8971 (toList!10804 lt!592930) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(assert (= (and d!143693 res!887251) b!1336929))

(assert (= (and b!1336929 res!887252) b!1336930))

(declare-fun m!1225039 () Bool)

(assert (=> d!143693 m!1225039))

(declare-fun m!1225041 () Bool)

(assert (=> d!143693 m!1225041))

(declare-fun m!1225043 () Bool)

(assert (=> d!143693 m!1225043))

(declare-fun m!1225045 () Bool)

(assert (=> d!143693 m!1225045))

(declare-fun m!1225047 () Bool)

(assert (=> b!1336929 m!1225047))

(declare-fun m!1225049 () Bool)

(assert (=> b!1336930 m!1225049))

(assert (=> b!1336870 d!143693))

(declare-fun d!143695 () Bool)

(assert (=> d!143695 (contains!8969 lt!592888 k0!1153)))

(declare-fun lt!592934 () Unit!43936)

(declare-fun choose!1960 ((_ BitVec 64) (_ BitVec 64) V!54355 ListLongMap!21577) Unit!43936)

(assert (=> d!143695 (= lt!592934 (choose!1960 k0!1153 (select (arr!43833 _keys!1590) from!1980) lt!592891 lt!592888))))

(assert (=> d!143695 (contains!8969 (+!4744 lt!592888 (tuple2!23921 (select (arr!43833 _keys!1590) from!1980) lt!592891)) k0!1153)))

(assert (=> d!143695 (= (lemmaInListMapAfterAddingDiffThenInBefore!323 k0!1153 (select (arr!43833 _keys!1590) from!1980) lt!592891 lt!592888) lt!592934)))

(declare-fun bs!38283 () Bool)

(assert (= bs!38283 d!143695))

(assert (=> bs!38283 m!1224953))

(assert (=> bs!38283 m!1224937))

(declare-fun m!1225051 () Bool)

(assert (=> bs!38283 m!1225051))

(assert (=> bs!38283 m!1224967))

(assert (=> bs!38283 m!1224967))

(declare-fun m!1225053 () Bool)

(assert (=> bs!38283 m!1225053))

(assert (=> b!1336870 d!143695))

(declare-fun b!1336955 () Bool)

(declare-fun e!761287 () Bool)

(declare-fun e!761292 () Bool)

(assert (=> b!1336955 (= e!761287 e!761292)))

(assert (=> b!1336955 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44383 _keys!1590)))))

(declare-fun lt!592949 () ListLongMap!21577)

(declare-fun res!887262 () Bool)

(assert (=> b!1336955 (= res!887262 (contains!8969 lt!592949 (select (arr!43833 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1336955 (=> (not res!887262) (not e!761292))))

(declare-fun b!1336956 () Bool)

(declare-fun e!761288 () ListLongMap!21577)

(assert (=> b!1336956 (= e!761288 (ListLongMap!21578 Nil!31059))))

(declare-fun b!1336958 () Bool)

(declare-fun e!761289 () Bool)

(assert (=> b!1336958 (= e!761289 e!761287)))

(declare-fun c!126020 () Bool)

(declare-fun e!761293 () Bool)

(assert (=> b!1336958 (= c!126020 e!761293)))

(declare-fun res!887263 () Bool)

(assert (=> b!1336958 (=> (not res!887263) (not e!761293))))

(assert (=> b!1336958 (= res!887263 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44383 _keys!1590)))))

(declare-fun b!1336959 () Bool)

(declare-fun e!761290 () ListLongMap!21577)

(assert (=> b!1336959 (= e!761288 e!761290)))

(declare-fun c!126021 () Bool)

(assert (=> b!1336959 (= c!126021 (validKeyInArray!0 (select (arr!43833 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1336960 () Bool)

(declare-fun e!761291 () Bool)

(declare-fun isEmpty!1084 (ListLongMap!21577) Bool)

(assert (=> b!1336960 (= e!761291 (isEmpty!1084 lt!592949))))

(declare-fun b!1336961 () Bool)

(declare-fun call!64874 () ListLongMap!21577)

(assert (=> b!1336961 (= e!761290 call!64874)))

(declare-fun b!1336962 () Bool)

(declare-fun res!887264 () Bool)

(assert (=> b!1336962 (=> (not res!887264) (not e!761289))))

(assert (=> b!1336962 (= res!887264 (not (contains!8969 lt!592949 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1336963 () Bool)

(declare-fun lt!592952 () Unit!43936)

(declare-fun lt!592953 () Unit!43936)

(assert (=> b!1336963 (= lt!592952 lt!592953)))

(declare-fun lt!592954 () (_ BitVec 64))

(declare-fun lt!592955 () ListLongMap!21577)

(declare-fun lt!592950 () V!54355)

(declare-fun lt!592951 () (_ BitVec 64))

(assert (=> b!1336963 (not (contains!8969 (+!4744 lt!592955 (tuple2!23921 lt!592951 lt!592950)) lt!592954))))

(declare-fun addStillNotContains!497 (ListLongMap!21577 (_ BitVec 64) V!54355 (_ BitVec 64)) Unit!43936)

(assert (=> b!1336963 (= lt!592953 (addStillNotContains!497 lt!592955 lt!592951 lt!592950 lt!592954))))

(assert (=> b!1336963 (= lt!592954 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1336963 (= lt!592950 (get!22119 (select (arr!43834 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1336963 (= lt!592951 (select (arr!43833 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(assert (=> b!1336963 (= lt!592955 call!64874)))

(assert (=> b!1336963 (= e!761290 (+!4744 call!64874 (tuple2!23921 (select (arr!43833 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)) (get!22119 (select (arr!43834 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1336957 () Bool)

(assert (=> b!1336957 (= e!761287 e!761291)))

(declare-fun c!126018 () Bool)

(assert (=> b!1336957 (= c!126018 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44383 _keys!1590)))))

(declare-fun d!143697 () Bool)

(assert (=> d!143697 e!761289))

(declare-fun res!887261 () Bool)

(assert (=> d!143697 (=> (not res!887261) (not e!761289))))

(assert (=> d!143697 (= res!887261 (not (contains!8969 lt!592949 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!143697 (= lt!592949 e!761288)))

(declare-fun c!126019 () Bool)

(assert (=> d!143697 (= c!126019 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) (size!44383 _keys!1590)))))

(assert (=> d!143697 (validMask!0 mask!1998)))

(assert (=> d!143697 (= (getCurrentListMapNoExtraKeys!6386 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) lt!592949)))

(declare-fun b!1336964 () Bool)

(assert (=> b!1336964 (= e!761293 (validKeyInArray!0 (select (arr!43833 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1336964 (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))

(declare-fun b!1336965 () Bool)

(assert (=> b!1336965 (= e!761291 (= lt!592949 (getCurrentListMapNoExtraKeys!6386 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323)))))

(declare-fun bm!64871 () Bool)

(assert (=> bm!64871 (= call!64874 (getCurrentListMapNoExtraKeys!6386 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980 #b00000000000000000000000000000001) defaultEntry!1323))))

(declare-fun b!1336966 () Bool)

(assert (=> b!1336966 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44383 _keys!1590)))))

(assert (=> b!1336966 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44384 _values!1320)))))

(declare-fun apply!1033 (ListLongMap!21577 (_ BitVec 64)) V!54355)

(assert (=> b!1336966 (= e!761292 (= (apply!1033 lt!592949 (select (arr!43833 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22119 (select (arr!43834 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!143697 c!126019) b!1336956))

(assert (= (and d!143697 (not c!126019)) b!1336959))

(assert (= (and b!1336959 c!126021) b!1336963))

(assert (= (and b!1336959 (not c!126021)) b!1336961))

(assert (= (or b!1336963 b!1336961) bm!64871))

(assert (= (and d!143697 res!887261) b!1336962))

(assert (= (and b!1336962 res!887264) b!1336958))

(assert (= (and b!1336958 res!887263) b!1336964))

(assert (= (and b!1336958 c!126020) b!1336955))

(assert (= (and b!1336958 (not c!126020)) b!1336957))

(assert (= (and b!1336955 res!887262) b!1336966))

(assert (= (and b!1336957 c!126018) b!1336965))

(assert (= (and b!1336957 (not c!126018)) b!1336960))

(declare-fun b_lambda!24193 () Bool)

(assert (=> (not b_lambda!24193) (not b!1336963)))

(assert (=> b!1336963 t!45371))

(declare-fun b_and!50003 () Bool)

(assert (= b_and!49997 (and (=> t!45371 result!25299) b_and!50003)))

(declare-fun b_lambda!24195 () Bool)

(assert (=> (not b_lambda!24195) (not b!1336966)))

(assert (=> b!1336966 t!45371))

(declare-fun b_and!50005 () Bool)

(assert (= b_and!50003 (and (=> t!45371 result!25299) b_and!50005)))

(declare-fun m!1225055 () Bool)

(assert (=> b!1336962 m!1225055))

(declare-fun m!1225057 () Bool)

(assert (=> b!1336964 m!1225057))

(assert (=> b!1336964 m!1225057))

(declare-fun m!1225059 () Bool)

(assert (=> b!1336964 m!1225059))

(assert (=> b!1336959 m!1225057))

(assert (=> b!1336959 m!1225057))

(assert (=> b!1336959 m!1225059))

(assert (=> b!1336966 m!1224951))

(assert (=> b!1336966 m!1225057))

(declare-fun m!1225061 () Bool)

(assert (=> b!1336966 m!1225061))

(assert (=> b!1336966 m!1224951))

(declare-fun m!1225063 () Bool)

(assert (=> b!1336966 m!1225063))

(assert (=> b!1336966 m!1225061))

(assert (=> b!1336966 m!1225057))

(declare-fun m!1225065 () Bool)

(assert (=> b!1336966 m!1225065))

(declare-fun m!1225067 () Bool)

(assert (=> b!1336965 m!1225067))

(declare-fun m!1225069 () Bool)

(assert (=> b!1336960 m!1225069))

(assert (=> b!1336955 m!1225057))

(assert (=> b!1336955 m!1225057))

(declare-fun m!1225071 () Bool)

(assert (=> b!1336955 m!1225071))

(declare-fun m!1225073 () Bool)

(assert (=> d!143697 m!1225073))

(assert (=> d!143697 m!1224931))

(assert (=> bm!64871 m!1225067))

(declare-fun m!1225075 () Bool)

(assert (=> b!1336963 m!1225075))

(declare-fun m!1225077 () Bool)

(assert (=> b!1336963 m!1225077))

(assert (=> b!1336963 m!1224951))

(assert (=> b!1336963 m!1225057))

(assert (=> b!1336963 m!1225061))

(assert (=> b!1336963 m!1225061))

(assert (=> b!1336963 m!1224951))

(assert (=> b!1336963 m!1225063))

(declare-fun m!1225079 () Bool)

(assert (=> b!1336963 m!1225079))

(declare-fun m!1225081 () Bool)

(assert (=> b!1336963 m!1225081))

(assert (=> b!1336963 m!1225079))

(assert (=> b!1336870 d!143697))

(declare-fun d!143699 () Bool)

(declare-fun e!761294 () Bool)

(assert (=> d!143699 e!761294))

(declare-fun res!887265 () Bool)

(assert (=> d!143699 (=> (not res!887265) (not e!761294))))

(declare-fun lt!592958 () ListLongMap!21577)

(assert (=> d!143699 (= res!887265 (contains!8969 lt!592958 (_1!11971 (tuple2!23921 (select (arr!43833 _keys!1590) from!1980) lt!592891))))))

(declare-fun lt!592959 () List!31062)

(assert (=> d!143699 (= lt!592958 (ListLongMap!21578 lt!592959))))

(declare-fun lt!592956 () Unit!43936)

(declare-fun lt!592957 () Unit!43936)

(assert (=> d!143699 (= lt!592956 lt!592957)))

(assert (=> d!143699 (= (getValueByKey!716 lt!592959 (_1!11971 (tuple2!23921 (select (arr!43833 _keys!1590) from!1980) lt!592891))) (Some!767 (_2!11971 (tuple2!23921 (select (arr!43833 _keys!1590) from!1980) lt!592891))))))

(assert (=> d!143699 (= lt!592957 (lemmaContainsTupThenGetReturnValue!361 lt!592959 (_1!11971 (tuple2!23921 (select (arr!43833 _keys!1590) from!1980) lt!592891)) (_2!11971 (tuple2!23921 (select (arr!43833 _keys!1590) from!1980) lt!592891))))))

(assert (=> d!143699 (= lt!592959 (insertStrictlySorted!490 (toList!10804 lt!592888) (_1!11971 (tuple2!23921 (select (arr!43833 _keys!1590) from!1980) lt!592891)) (_2!11971 (tuple2!23921 (select (arr!43833 _keys!1590) from!1980) lt!592891))))))

(assert (=> d!143699 (= (+!4744 lt!592888 (tuple2!23921 (select (arr!43833 _keys!1590) from!1980) lt!592891)) lt!592958)))

(declare-fun b!1336967 () Bool)

(declare-fun res!887266 () Bool)

(assert (=> b!1336967 (=> (not res!887266) (not e!761294))))

(assert (=> b!1336967 (= res!887266 (= (getValueByKey!716 (toList!10804 lt!592958) (_1!11971 (tuple2!23921 (select (arr!43833 _keys!1590) from!1980) lt!592891))) (Some!767 (_2!11971 (tuple2!23921 (select (arr!43833 _keys!1590) from!1980) lt!592891)))))))

(declare-fun b!1336968 () Bool)

(assert (=> b!1336968 (= e!761294 (contains!8971 (toList!10804 lt!592958) (tuple2!23921 (select (arr!43833 _keys!1590) from!1980) lt!592891)))))

(assert (= (and d!143699 res!887265) b!1336967))

(assert (= (and b!1336967 res!887266) b!1336968))

(declare-fun m!1225083 () Bool)

(assert (=> d!143699 m!1225083))

(declare-fun m!1225085 () Bool)

(assert (=> d!143699 m!1225085))

(declare-fun m!1225087 () Bool)

(assert (=> d!143699 m!1225087))

(declare-fun m!1225089 () Bool)

(assert (=> d!143699 m!1225089))

(declare-fun m!1225091 () Bool)

(assert (=> b!1336967 m!1225091))

(declare-fun m!1225093 () Bool)

(assert (=> b!1336968 m!1225093))

(assert (=> b!1336870 d!143699))

(declare-fun d!143701 () Bool)

(declare-fun e!761300 () Bool)

(assert (=> d!143701 e!761300))

(declare-fun res!887269 () Bool)

(assert (=> d!143701 (=> res!887269 e!761300)))

(declare-fun lt!592969 () Bool)

(assert (=> d!143701 (= res!887269 (not lt!592969))))

(declare-fun lt!592968 () Bool)

(assert (=> d!143701 (= lt!592969 lt!592968)))

(declare-fun lt!592970 () Unit!43936)

(declare-fun e!761299 () Unit!43936)

(assert (=> d!143701 (= lt!592970 e!761299)))

(declare-fun c!126024 () Bool)

(assert (=> d!143701 (= c!126024 lt!592968)))

(declare-fun containsKey!738 (List!31062 (_ BitVec 64)) Bool)

(assert (=> d!143701 (= lt!592968 (containsKey!738 (toList!10804 (getCurrentListMap!5775 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(assert (=> d!143701 (= (contains!8969 (getCurrentListMap!5775 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) k0!1153) lt!592969)))

(declare-fun b!1336975 () Bool)

(declare-fun lt!592971 () Unit!43936)

(assert (=> b!1336975 (= e!761299 lt!592971)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!484 (List!31062 (_ BitVec 64)) Unit!43936)

(assert (=> b!1336975 (= lt!592971 (lemmaContainsKeyImpliesGetValueByKeyDefined!484 (toList!10804 (getCurrentListMap!5775 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(declare-fun isDefined!523 (Option!768) Bool)

(assert (=> b!1336975 (isDefined!523 (getValueByKey!716 (toList!10804 (getCurrentListMap!5775 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153))))

(declare-fun b!1336976 () Bool)

(declare-fun Unit!43940 () Unit!43936)

(assert (=> b!1336976 (= e!761299 Unit!43940)))

(declare-fun b!1336977 () Bool)

(assert (=> b!1336977 (= e!761300 (isDefined!523 (getValueByKey!716 (toList!10804 (getCurrentListMap!5775 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323)) k0!1153)))))

(assert (= (and d!143701 c!126024) b!1336975))

(assert (= (and d!143701 (not c!126024)) b!1336976))

(assert (= (and d!143701 (not res!887269)) b!1336977))

(declare-fun m!1225095 () Bool)

(assert (=> d!143701 m!1225095))

(declare-fun m!1225097 () Bool)

(assert (=> b!1336975 m!1225097))

(declare-fun m!1225099 () Bool)

(assert (=> b!1336975 m!1225099))

(assert (=> b!1336975 m!1225099))

(declare-fun m!1225101 () Bool)

(assert (=> b!1336975 m!1225101))

(assert (=> b!1336977 m!1225099))

(assert (=> b!1336977 m!1225099))

(assert (=> b!1336977 m!1225101))

(assert (=> b!1336870 d!143701))

(declare-fun d!143703 () Bool)

(declare-fun e!761302 () Bool)

(assert (=> d!143703 e!761302))

(declare-fun res!887270 () Bool)

(assert (=> d!143703 (=> res!887270 e!761302)))

(declare-fun lt!592973 () Bool)

(assert (=> d!143703 (= res!887270 (not lt!592973))))

(declare-fun lt!592972 () Bool)

(assert (=> d!143703 (= lt!592973 lt!592972)))

(declare-fun lt!592974 () Unit!43936)

(declare-fun e!761301 () Unit!43936)

(assert (=> d!143703 (= lt!592974 e!761301)))

(declare-fun c!126025 () Bool)

(assert (=> d!143703 (= c!126025 lt!592972)))

(assert (=> d!143703 (= lt!592972 (containsKey!738 (toList!10804 lt!592889) k0!1153))))

(assert (=> d!143703 (= (contains!8969 lt!592889 k0!1153) lt!592973)))

(declare-fun b!1336978 () Bool)

(declare-fun lt!592975 () Unit!43936)

(assert (=> b!1336978 (= e!761301 lt!592975)))

(assert (=> b!1336978 (= lt!592975 (lemmaContainsKeyImpliesGetValueByKeyDefined!484 (toList!10804 lt!592889) k0!1153))))

(assert (=> b!1336978 (isDefined!523 (getValueByKey!716 (toList!10804 lt!592889) k0!1153))))

(declare-fun b!1336979 () Bool)

(declare-fun Unit!43941 () Unit!43936)

(assert (=> b!1336979 (= e!761301 Unit!43941)))

(declare-fun b!1336980 () Bool)

(assert (=> b!1336980 (= e!761302 (isDefined!523 (getValueByKey!716 (toList!10804 lt!592889) k0!1153)))))

(assert (= (and d!143703 c!126025) b!1336978))

(assert (= (and d!143703 (not c!126025)) b!1336979))

(assert (= (and d!143703 (not res!887270)) b!1336980))

(declare-fun m!1225103 () Bool)

(assert (=> d!143703 m!1225103))

(declare-fun m!1225105 () Bool)

(assert (=> b!1336978 m!1225105))

(declare-fun m!1225107 () Bool)

(assert (=> b!1336978 m!1225107))

(assert (=> b!1336978 m!1225107))

(declare-fun m!1225109 () Bool)

(assert (=> b!1336978 m!1225109))

(assert (=> b!1336980 m!1225107))

(assert (=> b!1336980 m!1225107))

(assert (=> b!1336980 m!1225109))

(assert (=> b!1336870 d!143703))

(declare-fun b!1337023 () Bool)

(declare-fun e!761339 () Bool)

(declare-fun e!761337 () Bool)

(assert (=> b!1337023 (= e!761339 e!761337)))

(declare-fun res!887294 () Bool)

(declare-fun call!64894 () Bool)

(assert (=> b!1337023 (= res!887294 call!64894)))

(assert (=> b!1337023 (=> (not res!887294) (not e!761337))))

(declare-fun b!1337024 () Bool)

(declare-fun e!761336 () Bool)

(declare-fun e!761341 () Bool)

(assert (=> b!1337024 (= e!761336 e!761341)))

(declare-fun res!887289 () Bool)

(declare-fun call!64893 () Bool)

(assert (=> b!1337024 (= res!887289 call!64893)))

(assert (=> b!1337024 (=> (not res!887289) (not e!761341))))

(declare-fun b!1337025 () Bool)

(declare-fun e!761334 () ListLongMap!21577)

(declare-fun call!64889 () ListLongMap!21577)

(assert (=> b!1337025 (= e!761334 (+!4744 call!64889 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun b!1337026 () Bool)

(declare-fun e!761332 () ListLongMap!21577)

(declare-fun call!64891 () ListLongMap!21577)

(assert (=> b!1337026 (= e!761332 call!64891)))

(declare-fun b!1337027 () Bool)

(declare-fun e!761330 () Unit!43936)

(declare-fun lt!593031 () Unit!43936)

(assert (=> b!1337027 (= e!761330 lt!593031)))

(declare-fun lt!593029 () ListLongMap!21577)

(assert (=> b!1337027 (= lt!593029 (getCurrentListMapNoExtraKeys!6386 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593025 () (_ BitVec 64))

(assert (=> b!1337027 (= lt!593025 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593041 () (_ BitVec 64))

(assert (=> b!1337027 (= lt!593041 (select (arr!43833 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!593040 () Unit!43936)

(assert (=> b!1337027 (= lt!593040 (addStillContains!1188 lt!593029 lt!593025 zeroValue!1262 lt!593041))))

(assert (=> b!1337027 (contains!8969 (+!4744 lt!593029 (tuple2!23921 lt!593025 zeroValue!1262)) lt!593041)))

(declare-fun lt!593033 () Unit!43936)

(assert (=> b!1337027 (= lt!593033 lt!593040)))

(declare-fun lt!593030 () ListLongMap!21577)

(assert (=> b!1337027 (= lt!593030 (getCurrentListMapNoExtraKeys!6386 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593039 () (_ BitVec 64))

(assert (=> b!1337027 (= lt!593039 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593023 () (_ BitVec 64))

(assert (=> b!1337027 (= lt!593023 (select (arr!43833 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!593038 () Unit!43936)

(declare-fun addApplyDifferent!575 (ListLongMap!21577 (_ BitVec 64) V!54355 (_ BitVec 64)) Unit!43936)

(assert (=> b!1337027 (= lt!593038 (addApplyDifferent!575 lt!593030 lt!593039 minValue!1262 lt!593023))))

(assert (=> b!1337027 (= (apply!1033 (+!4744 lt!593030 (tuple2!23921 lt!593039 minValue!1262)) lt!593023) (apply!1033 lt!593030 lt!593023))))

(declare-fun lt!593036 () Unit!43936)

(assert (=> b!1337027 (= lt!593036 lt!593038)))

(declare-fun lt!593026 () ListLongMap!21577)

(assert (=> b!1337027 (= lt!593026 (getCurrentListMapNoExtraKeys!6386 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593034 () (_ BitVec 64))

(assert (=> b!1337027 (= lt!593034 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593021 () (_ BitVec 64))

(assert (=> b!1337027 (= lt!593021 (select (arr!43833 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(declare-fun lt!593032 () Unit!43936)

(assert (=> b!1337027 (= lt!593032 (addApplyDifferent!575 lt!593026 lt!593034 zeroValue!1262 lt!593021))))

(assert (=> b!1337027 (= (apply!1033 (+!4744 lt!593026 (tuple2!23921 lt!593034 zeroValue!1262)) lt!593021) (apply!1033 lt!593026 lt!593021))))

(declare-fun lt!593028 () Unit!43936)

(assert (=> b!1337027 (= lt!593028 lt!593032)))

(declare-fun lt!593027 () ListLongMap!21577)

(assert (=> b!1337027 (= lt!593027 (getCurrentListMapNoExtraKeys!6386 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun lt!593022 () (_ BitVec 64))

(assert (=> b!1337027 (= lt!593022 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593020 () (_ BitVec 64))

(assert (=> b!1337027 (= lt!593020 (select (arr!43833 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980)))))

(assert (=> b!1337027 (= lt!593031 (addApplyDifferent!575 lt!593027 lt!593022 minValue!1262 lt!593020))))

(assert (=> b!1337027 (= (apply!1033 (+!4744 lt!593027 (tuple2!23921 lt!593022 minValue!1262)) lt!593020) (apply!1033 lt!593027 lt!593020))))

(declare-fun b!1337028 () Bool)

(declare-fun call!64895 () ListLongMap!21577)

(assert (=> b!1337028 (= e!761332 call!64895)))

(declare-fun b!1337029 () Bool)

(declare-fun lt!593035 () ListLongMap!21577)

(assert (=> b!1337029 (= e!761337 (= (apply!1033 lt!593035 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1262))))

(declare-fun b!1337030 () Bool)

(declare-fun e!761331 () Bool)

(declare-fun e!761329 () Bool)

(assert (=> b!1337030 (= e!761331 e!761329)))

(declare-fun res!887296 () Bool)

(assert (=> b!1337030 (=> (not res!887296) (not e!761329))))

(assert (=> b!1337030 (= res!887296 (contains!8969 lt!593035 (select (arr!43833 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(assert (=> b!1337030 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44383 _keys!1590)))))

(declare-fun b!1337031 () Bool)

(assert (=> b!1337031 (= e!761341 (= (apply!1033 lt!593035 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1262))))

(declare-fun b!1337032 () Bool)

(declare-fun res!887295 () Bool)

(declare-fun e!761335 () Bool)

(assert (=> b!1337032 (=> (not res!887295) (not e!761335))))

(assert (=> b!1337032 (= res!887295 e!761336)))

(declare-fun c!126040 () Bool)

(assert (=> b!1337032 (= c!126040 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1337033 () Bool)

(declare-fun e!761333 () Bool)

(assert (=> b!1337033 (= e!761333 (validKeyInArray!0 (select (arr!43833 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun bm!64886 () Bool)

(assert (=> bm!64886 (= call!64893 (contains!8969 lt!593035 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1337034 () Bool)

(declare-fun e!761340 () Bool)

(assert (=> b!1337034 (= e!761340 (validKeyInArray!0 (select (arr!43833 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))))))

(declare-fun b!1337035 () Bool)

(assert (=> b!1337035 (= e!761336 (not call!64893))))

(declare-fun b!1337036 () Bool)

(assert (=> b!1337036 (= e!761339 (not call!64894))))

(declare-fun bm!64887 () Bool)

(assert (=> bm!64887 (= call!64891 call!64889)))

(declare-fun bm!64888 () Bool)

(declare-fun call!64890 () ListLongMap!21577)

(assert (=> bm!64888 (= call!64895 call!64890)))

(declare-fun b!1337037 () Bool)

(declare-fun c!126043 () Bool)

(assert (=> b!1337037 (= c!126043 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!761338 () ListLongMap!21577)

(assert (=> b!1337037 (= e!761338 e!761332)))

(declare-fun bm!64889 () Bool)

(declare-fun call!64892 () ListLongMap!21577)

(assert (=> bm!64889 (= call!64892 (getCurrentListMapNoExtraKeys!6386 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun d!143705 () Bool)

(assert (=> d!143705 e!761335))

(declare-fun res!887291 () Bool)

(assert (=> d!143705 (=> (not res!887291) (not e!761335))))

(assert (=> d!143705 (= res!887291 (or (bvsge (bvadd #b00000000000000000000000000000001 from!1980) (size!44383 _keys!1590)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44383 _keys!1590)))))))

(declare-fun lt!593024 () ListLongMap!21577)

(assert (=> d!143705 (= lt!593035 lt!593024)))

(declare-fun lt!593037 () Unit!43936)

(assert (=> d!143705 (= lt!593037 e!761330)))

(declare-fun c!126038 () Bool)

(assert (=> d!143705 (= c!126038 e!761333)))

(declare-fun res!887292 () Bool)

(assert (=> d!143705 (=> (not res!887292) (not e!761333))))

(assert (=> d!143705 (= res!887292 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44383 _keys!1590)))))

(assert (=> d!143705 (= lt!593024 e!761334)))

(declare-fun c!126039 () Bool)

(assert (=> d!143705 (= c!126039 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143705 (validMask!0 mask!1998)))

(assert (=> d!143705 (= (getCurrentListMap!5775 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) lt!593035)))

(declare-fun bm!64890 () Bool)

(assert (=> bm!64890 (= call!64890 call!64892)))

(declare-fun b!1337038 () Bool)

(assert (=> b!1337038 (= e!761329 (= (apply!1033 lt!593035 (select (arr!43833 _keys!1590) (bvadd #b00000000000000000000000000000001 from!1980))) (get!22119 (select (arr!43834 _values!1320) (bvadd #b00000000000000000000000000000001 from!1980)) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1337038 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44384 _values!1320)))))

(assert (=> b!1337038 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44383 _keys!1590)))))

(declare-fun b!1337039 () Bool)

(assert (=> b!1337039 (= e!761334 e!761338)))

(declare-fun c!126042 () Bool)

(assert (=> b!1337039 (= c!126042 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1337040 () Bool)

(assert (=> b!1337040 (= e!761335 e!761339)))

(declare-fun c!126041 () Bool)

(assert (=> b!1337040 (= c!126041 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1337041 () Bool)

(declare-fun Unit!43942 () Unit!43936)

(assert (=> b!1337041 (= e!761330 Unit!43942)))

(declare-fun bm!64891 () Bool)

(assert (=> bm!64891 (= call!64894 (contains!8969 lt!593035 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!64892 () Bool)

(assert (=> bm!64892 (= call!64889 (+!4744 (ite c!126039 call!64892 (ite c!126042 call!64890 call!64895)) (ite (or c!126039 c!126042) (tuple2!23921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1337042 () Bool)

(assert (=> b!1337042 (= e!761338 call!64891)))

(declare-fun b!1337043 () Bool)

(declare-fun res!887293 () Bool)

(assert (=> b!1337043 (=> (not res!887293) (not e!761335))))

(assert (=> b!1337043 (= res!887293 e!761331)))

(declare-fun res!887290 () Bool)

(assert (=> b!1337043 (=> res!887290 e!761331)))

(assert (=> b!1337043 (= res!887290 (not e!761340))))

(declare-fun res!887297 () Bool)

(assert (=> b!1337043 (=> (not res!887297) (not e!761340))))

(assert (=> b!1337043 (= res!887297 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) (size!44383 _keys!1590)))))

(assert (= (and d!143705 c!126039) b!1337025))

(assert (= (and d!143705 (not c!126039)) b!1337039))

(assert (= (and b!1337039 c!126042) b!1337042))

(assert (= (and b!1337039 (not c!126042)) b!1337037))

(assert (= (and b!1337037 c!126043) b!1337026))

(assert (= (and b!1337037 (not c!126043)) b!1337028))

(assert (= (or b!1337026 b!1337028) bm!64888))

(assert (= (or b!1337042 bm!64888) bm!64890))

(assert (= (or b!1337042 b!1337026) bm!64887))

(assert (= (or b!1337025 bm!64890) bm!64889))

(assert (= (or b!1337025 bm!64887) bm!64892))

(assert (= (and d!143705 res!887292) b!1337033))

(assert (= (and d!143705 c!126038) b!1337027))

(assert (= (and d!143705 (not c!126038)) b!1337041))

(assert (= (and d!143705 res!887291) b!1337043))

(assert (= (and b!1337043 res!887297) b!1337034))

(assert (= (and b!1337043 (not res!887290)) b!1337030))

(assert (= (and b!1337030 res!887296) b!1337038))

(assert (= (and b!1337043 res!887293) b!1337032))

(assert (= (and b!1337032 c!126040) b!1337024))

(assert (= (and b!1337032 (not c!126040)) b!1337035))

(assert (= (and b!1337024 res!887289) b!1337031))

(assert (= (or b!1337024 b!1337035) bm!64886))

(assert (= (and b!1337032 res!887295) b!1337040))

(assert (= (and b!1337040 c!126041) b!1337023))

(assert (= (and b!1337040 (not c!126041)) b!1337036))

(assert (= (and b!1337023 res!887294) b!1337029))

(assert (= (or b!1337023 b!1337036) bm!64891))

(declare-fun b_lambda!24197 () Bool)

(assert (=> (not b_lambda!24197) (not b!1337038)))

(assert (=> b!1337038 t!45371))

(declare-fun b_and!50007 () Bool)

(assert (= b_and!50005 (and (=> t!45371 result!25299) b_and!50007)))

(assert (=> d!143705 m!1224931))

(assert (=> b!1337033 m!1225057))

(assert (=> b!1337033 m!1225057))

(assert (=> b!1337033 m!1225059))

(declare-fun m!1225111 () Bool)

(assert (=> bm!64891 m!1225111))

(declare-fun m!1225113 () Bool)

(assert (=> b!1337027 m!1225113))

(declare-fun m!1225115 () Bool)

(assert (=> b!1337027 m!1225115))

(declare-fun m!1225117 () Bool)

(assert (=> b!1337027 m!1225117))

(declare-fun m!1225119 () Bool)

(assert (=> b!1337027 m!1225119))

(declare-fun m!1225121 () Bool)

(assert (=> b!1337027 m!1225121))

(declare-fun m!1225123 () Bool)

(assert (=> b!1337027 m!1225123))

(declare-fun m!1225125 () Bool)

(assert (=> b!1337027 m!1225125))

(assert (=> b!1337027 m!1224965))

(assert (=> b!1337027 m!1225121))

(declare-fun m!1225127 () Bool)

(assert (=> b!1337027 m!1225127))

(declare-fun m!1225129 () Bool)

(assert (=> b!1337027 m!1225129))

(declare-fun m!1225131 () Bool)

(assert (=> b!1337027 m!1225131))

(declare-fun m!1225133 () Bool)

(assert (=> b!1337027 m!1225133))

(declare-fun m!1225135 () Bool)

(assert (=> b!1337027 m!1225135))

(assert (=> b!1337027 m!1225115))

(declare-fun m!1225137 () Bool)

(assert (=> b!1337027 m!1225137))

(declare-fun m!1225139 () Bool)

(assert (=> b!1337027 m!1225139))

(assert (=> b!1337027 m!1225113))

(declare-fun m!1225141 () Bool)

(assert (=> b!1337027 m!1225141))

(assert (=> b!1337027 m!1225057))

(assert (=> b!1337027 m!1225129))

(declare-fun m!1225143 () Bool)

(assert (=> bm!64892 m!1225143))

(declare-fun m!1225145 () Bool)

(assert (=> bm!64886 m!1225145))

(declare-fun m!1225147 () Bool)

(assert (=> b!1337025 m!1225147))

(declare-fun m!1225149 () Bool)

(assert (=> b!1337031 m!1225149))

(declare-fun m!1225151 () Bool)

(assert (=> b!1337029 m!1225151))

(assert (=> b!1337038 m!1225057))

(declare-fun m!1225153 () Bool)

(assert (=> b!1337038 m!1225153))

(assert (=> b!1337038 m!1224951))

(assert (=> b!1337038 m!1225061))

(assert (=> b!1337038 m!1224951))

(assert (=> b!1337038 m!1225063))

(assert (=> b!1337038 m!1225057))

(assert (=> b!1337038 m!1225061))

(assert (=> b!1337030 m!1225057))

(assert (=> b!1337030 m!1225057))

(declare-fun m!1225155 () Bool)

(assert (=> b!1337030 m!1225155))

(assert (=> b!1337034 m!1225057))

(assert (=> b!1337034 m!1225057))

(assert (=> b!1337034 m!1225059))

(assert (=> bm!64889 m!1224965))

(assert (=> b!1336870 d!143705))

(declare-fun d!143707 () Bool)

(declare-fun c!126046 () Bool)

(assert (=> d!143707 (= c!126046 ((_ is ValueCellFull!17571) (select (arr!43834 _values!1320) from!1980)))))

(declare-fun e!761344 () V!54355)

(assert (=> d!143707 (= (get!22119 (select (arr!43834 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)) e!761344)))

(declare-fun b!1337048 () Bool)

(declare-fun get!22121 (ValueCell!17571 V!54355) V!54355)

(assert (=> b!1337048 (= e!761344 (get!22121 (select (arr!43834 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1337049 () Bool)

(declare-fun get!22122 (ValueCell!17571 V!54355) V!54355)

(assert (=> b!1337049 (= e!761344 (get!22122 (select (arr!43834 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143707 c!126046) b!1337048))

(assert (= (and d!143707 (not c!126046)) b!1337049))

(assert (=> b!1337048 m!1224955))

(assert (=> b!1337048 m!1224951))

(declare-fun m!1225157 () Bool)

(assert (=> b!1337048 m!1225157))

(assert (=> b!1337049 m!1224955))

(assert (=> b!1337049 m!1224951))

(declare-fun m!1225159 () Bool)

(assert (=> b!1337049 m!1225159))

(assert (=> b!1336870 d!143707))

(declare-fun d!143709 () Bool)

(assert (=> d!143709 (contains!8969 lt!592889 k0!1153)))

(declare-fun lt!593042 () Unit!43936)

(assert (=> d!143709 (= lt!593042 (choose!1960 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592889))))

(assert (=> d!143709 (contains!8969 (+!4744 lt!592889 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(assert (=> d!143709 (= (lemmaInListMapAfterAddingDiffThenInBefore!323 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592889) lt!593042)))

(declare-fun bs!38284 () Bool)

(assert (= bs!38284 d!143709))

(assert (=> bs!38284 m!1224949))

(declare-fun m!1225161 () Bool)

(assert (=> bs!38284 m!1225161))

(declare-fun m!1225163 () Bool)

(assert (=> bs!38284 m!1225163))

(assert (=> bs!38284 m!1225163))

(declare-fun m!1225165 () Bool)

(assert (=> bs!38284 m!1225165))

(assert (=> b!1336870 d!143709))

(declare-fun d!143711 () Bool)

(declare-fun e!761346 () Bool)

(assert (=> d!143711 e!761346))

(declare-fun res!887298 () Bool)

(assert (=> d!143711 (=> res!887298 e!761346)))

(declare-fun lt!593044 () Bool)

(assert (=> d!143711 (= res!887298 (not lt!593044))))

(declare-fun lt!593043 () Bool)

(assert (=> d!143711 (= lt!593044 lt!593043)))

(declare-fun lt!593045 () Unit!43936)

(declare-fun e!761345 () Unit!43936)

(assert (=> d!143711 (= lt!593045 e!761345)))

(declare-fun c!126047 () Bool)

(assert (=> d!143711 (= c!126047 lt!593043)))

(assert (=> d!143711 (= lt!593043 (containsKey!738 (toList!10804 (+!4744 lt!592888 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(assert (=> d!143711 (= (contains!8969 (+!4744 lt!592888 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153) lt!593044)))

(declare-fun b!1337050 () Bool)

(declare-fun lt!593046 () Unit!43936)

(assert (=> b!1337050 (= e!761345 lt!593046)))

(assert (=> b!1337050 (= lt!593046 (lemmaContainsKeyImpliesGetValueByKeyDefined!484 (toList!10804 (+!4744 lt!592888 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(assert (=> b!1337050 (isDefined!523 (getValueByKey!716 (toList!10804 (+!4744 lt!592888 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153))))

(declare-fun b!1337051 () Bool)

(declare-fun Unit!43943 () Unit!43936)

(assert (=> b!1337051 (= e!761345 Unit!43943)))

(declare-fun b!1337052 () Bool)

(assert (=> b!1337052 (= e!761346 (isDefined!523 (getValueByKey!716 (toList!10804 (+!4744 lt!592888 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))) k0!1153)))))

(assert (= (and d!143711 c!126047) b!1337050))

(assert (= (and d!143711 (not c!126047)) b!1337051))

(assert (= (and d!143711 (not res!887298)) b!1337052))

(declare-fun m!1225167 () Bool)

(assert (=> d!143711 m!1225167))

(declare-fun m!1225169 () Bool)

(assert (=> b!1337050 m!1225169))

(declare-fun m!1225171 () Bool)

(assert (=> b!1337050 m!1225171))

(assert (=> b!1337050 m!1225171))

(declare-fun m!1225173 () Bool)

(assert (=> b!1337050 m!1225173))

(assert (=> b!1337052 m!1225171))

(assert (=> b!1337052 m!1225171))

(assert (=> b!1337052 m!1225173))

(assert (=> b!1336870 d!143711))

(declare-fun d!143713 () Bool)

(declare-fun e!761348 () Bool)

(assert (=> d!143713 e!761348))

(declare-fun res!887299 () Bool)

(assert (=> d!143713 (=> res!887299 e!761348)))

(declare-fun lt!593048 () Bool)

(assert (=> d!143713 (= res!887299 (not lt!593048))))

(declare-fun lt!593047 () Bool)

(assert (=> d!143713 (= lt!593048 lt!593047)))

(declare-fun lt!593049 () Unit!43936)

(declare-fun e!761347 () Unit!43936)

(assert (=> d!143713 (= lt!593049 e!761347)))

(declare-fun c!126048 () Bool)

(assert (=> d!143713 (= c!126048 lt!593047)))

(assert (=> d!143713 (= lt!593047 (containsKey!738 (toList!10804 lt!592888) k0!1153))))

(assert (=> d!143713 (= (contains!8969 lt!592888 k0!1153) lt!593048)))

(declare-fun b!1337053 () Bool)

(declare-fun lt!593050 () Unit!43936)

(assert (=> b!1337053 (= e!761347 lt!593050)))

(assert (=> b!1337053 (= lt!593050 (lemmaContainsKeyImpliesGetValueByKeyDefined!484 (toList!10804 lt!592888) k0!1153))))

(assert (=> b!1337053 (isDefined!523 (getValueByKey!716 (toList!10804 lt!592888) k0!1153))))

(declare-fun b!1337054 () Bool)

(declare-fun Unit!43944 () Unit!43936)

(assert (=> b!1337054 (= e!761347 Unit!43944)))

(declare-fun b!1337055 () Bool)

(assert (=> b!1337055 (= e!761348 (isDefined!523 (getValueByKey!716 (toList!10804 lt!592888) k0!1153)))))

(assert (= (and d!143713 c!126048) b!1337053))

(assert (= (and d!143713 (not c!126048)) b!1337054))

(assert (= (and d!143713 (not res!887299)) b!1337055))

(declare-fun m!1225175 () Bool)

(assert (=> d!143713 m!1225175))

(declare-fun m!1225177 () Bool)

(assert (=> b!1337053 m!1225177))

(declare-fun m!1225179 () Bool)

(assert (=> b!1337053 m!1225179))

(assert (=> b!1337053 m!1225179))

(declare-fun m!1225181 () Bool)

(assert (=> b!1337053 m!1225181))

(assert (=> b!1337055 m!1225179))

(assert (=> b!1337055 m!1225179))

(assert (=> b!1337055 m!1225181))

(assert (=> b!1336870 d!143713))

(declare-fun d!143715 () Bool)

(assert (=> d!143715 (contains!8969 (+!4744 lt!592888 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-fun lt!593053 () Unit!43936)

(declare-fun choose!1961 (ListLongMap!21577 (_ BitVec 64) V!54355 (_ BitVec 64)) Unit!43936)

(assert (=> d!143715 (= lt!593053 (choose!1961 lt!592888 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> d!143715 (contains!8969 lt!592888 k0!1153)))

(assert (=> d!143715 (= (addStillContains!1188 lt!592888 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153) lt!593053)))

(declare-fun bs!38285 () Bool)

(assert (= bs!38285 d!143715))

(assert (=> bs!38285 m!1224961))

(assert (=> bs!38285 m!1224961))

(assert (=> bs!38285 m!1224969))

(declare-fun m!1225183 () Bool)

(assert (=> bs!38285 m!1225183))

(assert (=> bs!38285 m!1224953))

(assert (=> b!1336870 d!143715))

(declare-fun b!1337067 () Bool)

(declare-fun e!761357 () Bool)

(declare-fun call!64898 () Bool)

(assert (=> b!1337067 (= e!761357 call!64898)))

(declare-fun b!1337068 () Bool)

(declare-fun e!761359 () Bool)

(declare-fun e!761360 () Bool)

(assert (=> b!1337068 (= e!761359 e!761360)))

(declare-fun res!887307 () Bool)

(assert (=> b!1337068 (=> (not res!887307) (not e!761360))))

(declare-fun e!761358 () Bool)

(assert (=> b!1337068 (= res!887307 (not e!761358))))

(declare-fun res!887308 () Bool)

(assert (=> b!1337068 (=> (not res!887308) (not e!761358))))

(assert (=> b!1337068 (= res!887308 (validKeyInArray!0 (select (arr!43833 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun d!143717 () Bool)

(declare-fun res!887306 () Bool)

(assert (=> d!143717 (=> res!887306 e!761359)))

(assert (=> d!143717 (= res!887306 (bvsge #b00000000000000000000000000000000 (size!44383 _keys!1590)))))

(assert (=> d!143717 (= (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31060) e!761359)))

(declare-fun b!1337069 () Bool)

(assert (=> b!1337069 (= e!761357 call!64898)))

(declare-fun b!1337070 () Bool)

(assert (=> b!1337070 (= e!761360 e!761357)))

(declare-fun c!126051 () Bool)

(assert (=> b!1337070 (= c!126051 (validKeyInArray!0 (select (arr!43833 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun bm!64895 () Bool)

(assert (=> bm!64895 (= call!64898 (arrayNoDuplicates!0 _keys!1590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126051 (Cons!31059 (select (arr!43833 _keys!1590) #b00000000000000000000000000000000) Nil!31060) Nil!31060)))))

(declare-fun b!1337071 () Bool)

(declare-fun contains!8972 (List!31063 (_ BitVec 64)) Bool)

(assert (=> b!1337071 (= e!761358 (contains!8972 Nil!31060 (select (arr!43833 _keys!1590) #b00000000000000000000000000000000)))))

(assert (= (and d!143717 (not res!887306)) b!1337068))

(assert (= (and b!1337068 res!887308) b!1337071))

(assert (= (and b!1337068 res!887307) b!1337070))

(assert (= (and b!1337070 c!126051) b!1337067))

(assert (= (and b!1337070 (not c!126051)) b!1337069))

(assert (= (or b!1337067 b!1337069) bm!64895))

(assert (=> b!1337068 m!1225029))

(assert (=> b!1337068 m!1225029))

(assert (=> b!1337068 m!1225037))

(assert (=> b!1337070 m!1225029))

(assert (=> b!1337070 m!1225029))

(assert (=> b!1337070 m!1225037))

(assert (=> bm!64895 m!1225029))

(declare-fun m!1225185 () Bool)

(assert (=> bm!64895 m!1225185))

(assert (=> b!1337071 m!1225029))

(assert (=> b!1337071 m!1225029))

(declare-fun m!1225187 () Bool)

(assert (=> b!1337071 m!1225187))

(assert (=> b!1336868 d!143717))

(declare-fun d!143719 () Bool)

(assert (=> d!143719 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112692 d!143719))

(declare-fun d!143721 () Bool)

(assert (=> d!143721 (= (array_inv!33057 _values!1320) (bvsge (size!44384 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112692 d!143721))

(declare-fun d!143723 () Bool)

(assert (=> d!143723 (= (array_inv!33058 _keys!1590) (bvsge (size!44383 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112692 d!143723))

(declare-fun d!143725 () Bool)

(assert (=> d!143725 (= (validKeyInArray!0 (select (arr!43833 _keys!1590) from!1980)) (and (not (= (select (arr!43833 _keys!1590) from!1980) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43833 _keys!1590) from!1980) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1336872 d!143725))

(declare-fun d!143727 () Bool)

(declare-fun e!761362 () Bool)

(assert (=> d!143727 e!761362))

(declare-fun res!887309 () Bool)

(assert (=> d!143727 (=> res!887309 e!761362)))

(declare-fun lt!593055 () Bool)

(assert (=> d!143727 (= res!887309 (not lt!593055))))

(declare-fun lt!593054 () Bool)

(assert (=> d!143727 (= lt!593055 lt!593054)))

(declare-fun lt!593056 () Unit!43936)

(declare-fun e!761361 () Unit!43936)

(assert (=> d!143727 (= lt!593056 e!761361)))

(declare-fun c!126052 () Bool)

(assert (=> d!143727 (= c!126052 lt!593054)))

(assert (=> d!143727 (= lt!593054 (containsKey!738 (toList!10804 (getCurrentListMap!5775 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> d!143727 (= (contains!8969 (getCurrentListMap!5775 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153) lt!593055)))

(declare-fun b!1337072 () Bool)

(declare-fun lt!593057 () Unit!43936)

(assert (=> b!1337072 (= e!761361 lt!593057)))

(assert (=> b!1337072 (= lt!593057 (lemmaContainsKeyImpliesGetValueByKeyDefined!484 (toList!10804 (getCurrentListMap!5775 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(assert (=> b!1337072 (isDefined!523 (getValueByKey!716 (toList!10804 (getCurrentListMap!5775 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153))))

(declare-fun b!1337073 () Bool)

(declare-fun Unit!43945 () Unit!43936)

(assert (=> b!1337073 (= e!761361 Unit!43945)))

(declare-fun b!1337074 () Bool)

(assert (=> b!1337074 (= e!761362 (isDefined!523 (getValueByKey!716 (toList!10804 (getCurrentListMap!5775 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323)) k0!1153)))))

(assert (= (and d!143727 c!126052) b!1337072))

(assert (= (and d!143727 (not c!126052)) b!1337073))

(assert (= (and d!143727 (not res!887309)) b!1337074))

(declare-fun m!1225189 () Bool)

(assert (=> d!143727 m!1225189))

(declare-fun m!1225191 () Bool)

(assert (=> b!1337072 m!1225191))

(declare-fun m!1225193 () Bool)

(assert (=> b!1337072 m!1225193))

(assert (=> b!1337072 m!1225193))

(declare-fun m!1225195 () Bool)

(assert (=> b!1337072 m!1225195))

(assert (=> b!1337074 m!1225193))

(assert (=> b!1337074 m!1225193))

(assert (=> b!1337074 m!1225195))

(assert (=> b!1336862 d!143727))

(declare-fun b!1337075 () Bool)

(declare-fun e!761373 () Bool)

(declare-fun e!761371 () Bool)

(assert (=> b!1337075 (= e!761373 e!761371)))

(declare-fun res!887315 () Bool)

(declare-fun call!64904 () Bool)

(assert (=> b!1337075 (= res!887315 call!64904)))

(assert (=> b!1337075 (=> (not res!887315) (not e!761371))))

(declare-fun b!1337076 () Bool)

(declare-fun e!761370 () Bool)

(declare-fun e!761375 () Bool)

(assert (=> b!1337076 (= e!761370 e!761375)))

(declare-fun res!887310 () Bool)

(declare-fun call!64903 () Bool)

(assert (=> b!1337076 (= res!887310 call!64903)))

(assert (=> b!1337076 (=> (not res!887310) (not e!761375))))

(declare-fun b!1337077 () Bool)

(declare-fun e!761368 () ListLongMap!21577)

(declare-fun call!64899 () ListLongMap!21577)

(assert (=> b!1337077 (= e!761368 (+!4744 call!64899 (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)))))

(declare-fun b!1337078 () Bool)

(declare-fun e!761366 () ListLongMap!21577)

(declare-fun call!64901 () ListLongMap!21577)

(assert (=> b!1337078 (= e!761366 call!64901)))

(declare-fun b!1337079 () Bool)

(declare-fun e!761364 () Unit!43936)

(declare-fun lt!593069 () Unit!43936)

(assert (=> b!1337079 (= e!761364 lt!593069)))

(declare-fun lt!593067 () ListLongMap!21577)

(assert (=> b!1337079 (= lt!593067 (getCurrentListMapNoExtraKeys!6386 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593063 () (_ BitVec 64))

(assert (=> b!1337079 (= lt!593063 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593079 () (_ BitVec 64))

(assert (=> b!1337079 (= lt!593079 (select (arr!43833 _keys!1590) from!1980))))

(declare-fun lt!593078 () Unit!43936)

(assert (=> b!1337079 (= lt!593078 (addStillContains!1188 lt!593067 lt!593063 zeroValue!1262 lt!593079))))

(assert (=> b!1337079 (contains!8969 (+!4744 lt!593067 (tuple2!23921 lt!593063 zeroValue!1262)) lt!593079)))

(declare-fun lt!593071 () Unit!43936)

(assert (=> b!1337079 (= lt!593071 lt!593078)))

(declare-fun lt!593068 () ListLongMap!21577)

(assert (=> b!1337079 (= lt!593068 (getCurrentListMapNoExtraKeys!6386 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593077 () (_ BitVec 64))

(assert (=> b!1337079 (= lt!593077 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593061 () (_ BitVec 64))

(assert (=> b!1337079 (= lt!593061 (select (arr!43833 _keys!1590) from!1980))))

(declare-fun lt!593076 () Unit!43936)

(assert (=> b!1337079 (= lt!593076 (addApplyDifferent!575 lt!593068 lt!593077 minValue!1262 lt!593061))))

(assert (=> b!1337079 (= (apply!1033 (+!4744 lt!593068 (tuple2!23921 lt!593077 minValue!1262)) lt!593061) (apply!1033 lt!593068 lt!593061))))

(declare-fun lt!593074 () Unit!43936)

(assert (=> b!1337079 (= lt!593074 lt!593076)))

(declare-fun lt!593064 () ListLongMap!21577)

(assert (=> b!1337079 (= lt!593064 (getCurrentListMapNoExtraKeys!6386 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593072 () (_ BitVec 64))

(assert (=> b!1337079 (= lt!593072 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593059 () (_ BitVec 64))

(assert (=> b!1337079 (= lt!593059 (select (arr!43833 _keys!1590) from!1980))))

(declare-fun lt!593070 () Unit!43936)

(assert (=> b!1337079 (= lt!593070 (addApplyDifferent!575 lt!593064 lt!593072 zeroValue!1262 lt!593059))))

(assert (=> b!1337079 (= (apply!1033 (+!4744 lt!593064 (tuple2!23921 lt!593072 zeroValue!1262)) lt!593059) (apply!1033 lt!593064 lt!593059))))

(declare-fun lt!593066 () Unit!43936)

(assert (=> b!1337079 (= lt!593066 lt!593070)))

(declare-fun lt!593065 () ListLongMap!21577)

(assert (=> b!1337079 (= lt!593065 (getCurrentListMapNoExtraKeys!6386 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun lt!593060 () (_ BitVec 64))

(assert (=> b!1337079 (= lt!593060 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!593058 () (_ BitVec 64))

(assert (=> b!1337079 (= lt!593058 (select (arr!43833 _keys!1590) from!1980))))

(assert (=> b!1337079 (= lt!593069 (addApplyDifferent!575 lt!593065 lt!593060 minValue!1262 lt!593058))))

(assert (=> b!1337079 (= (apply!1033 (+!4744 lt!593065 (tuple2!23921 lt!593060 minValue!1262)) lt!593058) (apply!1033 lt!593065 lt!593058))))

(declare-fun b!1337080 () Bool)

(declare-fun call!64905 () ListLongMap!21577)

(assert (=> b!1337080 (= e!761366 call!64905)))

(declare-fun b!1337081 () Bool)

(declare-fun lt!593073 () ListLongMap!21577)

(assert (=> b!1337081 (= e!761371 (= (apply!1033 lt!593073 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1262))))

(declare-fun b!1337082 () Bool)

(declare-fun e!761365 () Bool)

(declare-fun e!761363 () Bool)

(assert (=> b!1337082 (= e!761365 e!761363)))

(declare-fun res!887317 () Bool)

(assert (=> b!1337082 (=> (not res!887317) (not e!761363))))

(assert (=> b!1337082 (= res!887317 (contains!8969 lt!593073 (select (arr!43833 _keys!1590) from!1980)))))

(assert (=> b!1337082 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44383 _keys!1590)))))

(declare-fun b!1337083 () Bool)

(assert (=> b!1337083 (= e!761375 (= (apply!1033 lt!593073 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1262))))

(declare-fun b!1337084 () Bool)

(declare-fun res!887316 () Bool)

(declare-fun e!761369 () Bool)

(assert (=> b!1337084 (=> (not res!887316) (not e!761369))))

(assert (=> b!1337084 (= res!887316 e!761370)))

(declare-fun c!126055 () Bool)

(assert (=> b!1337084 (= c!126055 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1337085 () Bool)

(declare-fun e!761367 () Bool)

(assert (=> b!1337085 (= e!761367 (validKeyInArray!0 (select (arr!43833 _keys!1590) from!1980)))))

(declare-fun bm!64896 () Bool)

(assert (=> bm!64896 (= call!64903 (contains!8969 lt!593073 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1337086 () Bool)

(declare-fun e!761374 () Bool)

(assert (=> b!1337086 (= e!761374 (validKeyInArray!0 (select (arr!43833 _keys!1590) from!1980)))))

(declare-fun b!1337087 () Bool)

(assert (=> b!1337087 (= e!761370 (not call!64903))))

(declare-fun b!1337088 () Bool)

(assert (=> b!1337088 (= e!761373 (not call!64904))))

(declare-fun bm!64897 () Bool)

(assert (=> bm!64897 (= call!64901 call!64899)))

(declare-fun bm!64898 () Bool)

(declare-fun call!64900 () ListLongMap!21577)

(assert (=> bm!64898 (= call!64905 call!64900)))

(declare-fun b!1337089 () Bool)

(declare-fun c!126058 () Bool)

(assert (=> b!1337089 (= c!126058 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!761372 () ListLongMap!21577)

(assert (=> b!1337089 (= e!761372 e!761366)))

(declare-fun bm!64899 () Bool)

(declare-fun call!64902 () ListLongMap!21577)

(assert (=> bm!64899 (= call!64902 (getCurrentListMapNoExtraKeys!6386 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323))))

(declare-fun d!143729 () Bool)

(assert (=> d!143729 e!761369))

(declare-fun res!887312 () Bool)

(assert (=> d!143729 (=> (not res!887312) (not e!761369))))

(assert (=> d!143729 (= res!887312 (or (bvsge from!1980 (size!44383 _keys!1590)) (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44383 _keys!1590)))))))

(declare-fun lt!593062 () ListLongMap!21577)

(assert (=> d!143729 (= lt!593073 lt!593062)))

(declare-fun lt!593075 () Unit!43936)

(assert (=> d!143729 (= lt!593075 e!761364)))

(declare-fun c!126053 () Bool)

(assert (=> d!143729 (= c!126053 e!761367)))

(declare-fun res!887313 () Bool)

(assert (=> d!143729 (=> (not res!887313) (not e!761367))))

(assert (=> d!143729 (= res!887313 (bvslt from!1980 (size!44383 _keys!1590)))))

(assert (=> d!143729 (= lt!593062 e!761368)))

(declare-fun c!126054 () Bool)

(assert (=> d!143729 (= c!126054 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143729 (validMask!0 mask!1998)))

(assert (=> d!143729 (= (getCurrentListMap!5775 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) lt!593073)))

(declare-fun bm!64900 () Bool)

(assert (=> bm!64900 (= call!64900 call!64902)))

(declare-fun b!1337090 () Bool)

(assert (=> b!1337090 (= e!761363 (= (apply!1033 lt!593073 (select (arr!43833 _keys!1590) from!1980)) (get!22119 (select (arr!43834 _values!1320) from!1980) (dynLambda!3683 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1337090 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44384 _values!1320)))))

(assert (=> b!1337090 (and (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44383 _keys!1590)))))

(declare-fun b!1337091 () Bool)

(assert (=> b!1337091 (= e!761368 e!761372)))

(declare-fun c!126057 () Bool)

(assert (=> b!1337091 (= c!126057 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1337092 () Bool)

(assert (=> b!1337092 (= e!761369 e!761373)))

(declare-fun c!126056 () Bool)

(assert (=> b!1337092 (= c!126056 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1337093 () Bool)

(declare-fun Unit!43946 () Unit!43936)

(assert (=> b!1337093 (= e!761364 Unit!43946)))

(declare-fun bm!64901 () Bool)

(assert (=> bm!64901 (= call!64904 (contains!8969 lt!593073 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!64902 () Bool)

(assert (=> bm!64902 (= call!64899 (+!4744 (ite c!126054 call!64902 (ite c!126057 call!64900 call!64905)) (ite (or c!126054 c!126057) (tuple2!23921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1262) (tuple2!23921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262))))))

(declare-fun b!1337094 () Bool)

(assert (=> b!1337094 (= e!761372 call!64901)))

(declare-fun b!1337095 () Bool)

(declare-fun res!887314 () Bool)

(assert (=> b!1337095 (=> (not res!887314) (not e!761369))))

(assert (=> b!1337095 (= res!887314 e!761365)))

(declare-fun res!887311 () Bool)

(assert (=> b!1337095 (=> res!887311 e!761365)))

(assert (=> b!1337095 (= res!887311 (not e!761374))))

(declare-fun res!887318 () Bool)

(assert (=> b!1337095 (=> (not res!887318) (not e!761374))))

(assert (=> b!1337095 (= res!887318 (bvslt from!1980 (size!44383 _keys!1590)))))

(assert (= (and d!143729 c!126054) b!1337077))

(assert (= (and d!143729 (not c!126054)) b!1337091))

(assert (= (and b!1337091 c!126057) b!1337094))

(assert (= (and b!1337091 (not c!126057)) b!1337089))

(assert (= (and b!1337089 c!126058) b!1337078))

(assert (= (and b!1337089 (not c!126058)) b!1337080))

(assert (= (or b!1337078 b!1337080) bm!64898))

(assert (= (or b!1337094 bm!64898) bm!64900))

(assert (= (or b!1337094 b!1337078) bm!64897))

(assert (= (or b!1337077 bm!64900) bm!64899))

(assert (= (or b!1337077 bm!64897) bm!64902))

(assert (= (and d!143729 res!887313) b!1337085))

(assert (= (and d!143729 c!126053) b!1337079))

(assert (= (and d!143729 (not c!126053)) b!1337093))

(assert (= (and d!143729 res!887312) b!1337095))

(assert (= (and b!1337095 res!887318) b!1337086))

(assert (= (and b!1337095 (not res!887311)) b!1337082))

(assert (= (and b!1337082 res!887317) b!1337090))

(assert (= (and b!1337095 res!887314) b!1337084))

(assert (= (and b!1337084 c!126055) b!1337076))

(assert (= (and b!1337084 (not c!126055)) b!1337087))

(assert (= (and b!1337076 res!887310) b!1337083))

(assert (= (or b!1337076 b!1337087) bm!64896))

(assert (= (and b!1337084 res!887316) b!1337092))

(assert (= (and b!1337092 c!126056) b!1337075))

(assert (= (and b!1337092 (not c!126056)) b!1337088))

(assert (= (and b!1337075 res!887315) b!1337081))

(assert (= (or b!1337075 b!1337088) bm!64901))

(declare-fun b_lambda!24199 () Bool)

(assert (=> (not b_lambda!24199) (not b!1337090)))

(assert (=> b!1337090 t!45371))

(declare-fun b_and!50009 () Bool)

(assert (= b_and!50007 (and (=> t!45371 result!25299) b_and!50009)))

(assert (=> d!143729 m!1224931))

(assert (=> b!1337085 m!1224937))

(assert (=> b!1337085 m!1224937))

(assert (=> b!1337085 m!1224939))

(declare-fun m!1225197 () Bool)

(assert (=> bm!64901 m!1225197))

(declare-fun m!1225199 () Bool)

(assert (=> b!1337079 m!1225199))

(declare-fun m!1225201 () Bool)

(assert (=> b!1337079 m!1225201))

(declare-fun m!1225203 () Bool)

(assert (=> b!1337079 m!1225203))

(declare-fun m!1225205 () Bool)

(assert (=> b!1337079 m!1225205))

(declare-fun m!1225207 () Bool)

(assert (=> b!1337079 m!1225207))

(declare-fun m!1225209 () Bool)

(assert (=> b!1337079 m!1225209))

(declare-fun m!1225211 () Bool)

(assert (=> b!1337079 m!1225211))

(declare-fun m!1225213 () Bool)

(assert (=> b!1337079 m!1225213))

(assert (=> b!1337079 m!1225207))

(declare-fun m!1225215 () Bool)

(assert (=> b!1337079 m!1225215))

(declare-fun m!1225217 () Bool)

(assert (=> b!1337079 m!1225217))

(declare-fun m!1225219 () Bool)

(assert (=> b!1337079 m!1225219))

(declare-fun m!1225221 () Bool)

(assert (=> b!1337079 m!1225221))

(declare-fun m!1225223 () Bool)

(assert (=> b!1337079 m!1225223))

(assert (=> b!1337079 m!1225201))

(declare-fun m!1225225 () Bool)

(assert (=> b!1337079 m!1225225))

(declare-fun m!1225227 () Bool)

(assert (=> b!1337079 m!1225227))

(assert (=> b!1337079 m!1225199))

(declare-fun m!1225229 () Bool)

(assert (=> b!1337079 m!1225229))

(assert (=> b!1337079 m!1224937))

(assert (=> b!1337079 m!1225217))

(declare-fun m!1225231 () Bool)

(assert (=> bm!64902 m!1225231))

(declare-fun m!1225233 () Bool)

(assert (=> bm!64896 m!1225233))

(declare-fun m!1225235 () Bool)

(assert (=> b!1337077 m!1225235))

(declare-fun m!1225237 () Bool)

(assert (=> b!1337083 m!1225237))

(declare-fun m!1225239 () Bool)

(assert (=> b!1337081 m!1225239))

(assert (=> b!1337090 m!1224937))

(declare-fun m!1225241 () Bool)

(assert (=> b!1337090 m!1225241))

(assert (=> b!1337090 m!1224951))

(assert (=> b!1337090 m!1224955))

(assert (=> b!1337090 m!1224951))

(assert (=> b!1337090 m!1224957))

(assert (=> b!1337090 m!1224937))

(assert (=> b!1337090 m!1224955))

(assert (=> b!1337082 m!1224937))

(assert (=> b!1337082 m!1224937))

(declare-fun m!1225243 () Bool)

(assert (=> b!1337082 m!1225243))

(assert (=> b!1337086 m!1224937))

(assert (=> b!1337086 m!1224937))

(assert (=> b!1337086 m!1224939))

(assert (=> bm!64899 m!1225213))

(assert (=> b!1336862 d!143729))

(declare-fun condMapEmpty!57092 () Bool)

(declare-fun mapDefault!57092 () ValueCell!17571)

(assert (=> mapNonEmpty!57086 (= condMapEmpty!57092 (= mapRest!57086 ((as const (Array (_ BitVec 32) ValueCell!17571)) mapDefault!57092)))))

(declare-fun e!761380 () Bool)

(declare-fun mapRes!57092 () Bool)

(assert (=> mapNonEmpty!57086 (= tp!108727 (and e!761380 mapRes!57092))))

(declare-fun mapIsEmpty!57092 () Bool)

(assert (=> mapIsEmpty!57092 mapRes!57092))

(declare-fun b!1337102 () Bool)

(declare-fun e!761381 () Bool)

(assert (=> b!1337102 (= e!761381 tp_is_empty!36939)))

(declare-fun mapNonEmpty!57092 () Bool)

(declare-fun tp!108737 () Bool)

(assert (=> mapNonEmpty!57092 (= mapRes!57092 (and tp!108737 e!761381))))

(declare-fun mapValue!57092 () ValueCell!17571)

(declare-fun mapRest!57092 () (Array (_ BitVec 32) ValueCell!17571))

(declare-fun mapKey!57092 () (_ BitVec 32))

(assert (=> mapNonEmpty!57092 (= mapRest!57086 (store mapRest!57092 mapKey!57092 mapValue!57092))))

(declare-fun b!1337103 () Bool)

(assert (=> b!1337103 (= e!761380 tp_is_empty!36939)))

(assert (= (and mapNonEmpty!57086 condMapEmpty!57092) mapIsEmpty!57092))

(assert (= (and mapNonEmpty!57086 (not condMapEmpty!57092)) mapNonEmpty!57092))

(assert (= (and mapNonEmpty!57092 ((_ is ValueCellFull!17571) mapValue!57092)) b!1337102))

(assert (= (and mapNonEmpty!57086 ((_ is ValueCellFull!17571) mapDefault!57092)) b!1337103))

(declare-fun m!1225245 () Bool)

(assert (=> mapNonEmpty!57092 m!1225245))

(declare-fun b_lambda!24201 () Bool)

(assert (= b_lambda!24199 (or (and start!112692 b_free!31029) b_lambda!24201)))

(declare-fun b_lambda!24203 () Bool)

(assert (= b_lambda!24193 (or (and start!112692 b_free!31029) b_lambda!24203)))

(declare-fun b_lambda!24205 () Bool)

(assert (= b_lambda!24197 (or (and start!112692 b_free!31029) b_lambda!24205)))

(declare-fun b_lambda!24207 () Bool)

(assert (= b_lambda!24195 (or (and start!112692 b_free!31029) b_lambda!24207)))

(check-sat (not b!1336921) (not b!1337071) (not b_next!31029) (not b!1337038) (not b!1337055) (not bm!64899) (not b!1336962) (not b!1337070) (not bm!64895) (not b!1337034) b_and!50009 (not b!1337048) (not b_lambda!24191) (not b!1337072) (not d!143695) (not b!1336929) (not b!1337025) (not bm!64891) (not b!1337077) (not bm!64902) (not b!1336924) (not b!1337090) (not bm!64901) (not b!1337053) (not bm!64892) (not b!1336968) (not b!1337052) (not b!1336977) (not b!1337029) (not b_lambda!24203) (not b!1337068) (not b!1337050) (not b!1336959) (not bm!64889) (not d!143699) (not b!1336966) (not b_lambda!24207) (not b!1336978) (not d!143711) (not b_lambda!24201) (not mapNonEmpty!57092) (not b!1337086) (not d!143697) (not d!143709) (not b!1337049) (not d!143705) (not bm!64886) (not bm!64868) (not b!1336930) (not b!1336967) (not b!1337085) (not b!1336964) (not d!143715) (not b!1337079) (not d!143703) (not bm!64896) (not b_lambda!24205) (not b!1337030) (not b!1336960) (not b!1336980) (not b!1336975) (not b!1336963) (not b!1336965) (not b!1337083) (not d!143729) (not b!1337033) (not b!1337082) (not b!1337027) tp_is_empty!36939 (not d!143727) (not b!1337081) (not d!143701) (not b!1336955) (not d!143693) (not b!1337074) (not d!143713) (not bm!64871) (not b!1337031))
(check-sat b_and!50009 (not b_next!31029))
