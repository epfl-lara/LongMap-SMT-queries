; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5696 () Bool)

(assert start!5696)

(declare-fun b_free!1363 () Bool)

(declare-fun b_next!1363 () Bool)

(assert (=> start!5696 (= b_free!1363 (not b_next!1363))))

(declare-fun tp!5732 () Bool)

(declare-fun b_and!2355 () Bool)

(assert (=> start!5696 (= tp!5732 b_and!2355)))

(declare-fun res!24006 () Bool)

(declare-fun e!25490 () Bool)

(assert (=> start!5696 (=> (not res!24006) (not e!25490))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5696 (= res!24006 (validMask!0 mask!853))))

(assert (=> start!5696 e!25490))

(assert (=> start!5696 true))

(assert (=> start!5696 tp!5732))

(declare-fun b!40184 () Bool)

(declare-fun e!25491 () Bool)

(assert (=> b!40184 (= e!25490 (not e!25491))))

(declare-fun res!24008 () Bool)

(assert (=> b!40184 (=> res!24008 e!25491)))

(declare-datatypes ((V!2097 0))(
  ( (V!2098 (val!915 Int)) )
))
(declare-datatypes ((tuple2!1466 0))(
  ( (tuple2!1467 (_1!744 (_ BitVec 64)) (_2!744 V!2097)) )
))
(declare-datatypes ((List!1038 0))(
  ( (Nil!1035) (Cons!1034 (h!1608 tuple2!1466) (t!3891 List!1038)) )
))
(declare-datatypes ((ListLongMap!1037 0))(
  ( (ListLongMap!1038 (toList!534 List!1038)) )
))
(declare-fun lt!15400 () ListLongMap!1037)

(assert (=> b!40184 (= res!24008 (= lt!15400 (ListLongMap!1038 Nil!1035)))))

(declare-datatypes ((array!2577 0))(
  ( (array!2578 (arr!1232 (Array (_ BitVec 32) (_ BitVec 64))) (size!1369 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!629 0))(
  ( (ValueCellFull!629 (v!1994 V!2097)) (EmptyCell!629) )
))
(declare-datatypes ((array!2579 0))(
  ( (array!2580 (arr!1233 (Array (_ BitVec 32) ValueCell!629)) (size!1370 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!238 0))(
  ( (LongMapFixedSize!239 (defaultEntry!1803 Int) (mask!5176 (_ BitVec 32)) (extraKeys!1694 (_ BitVec 32)) (zeroValue!1721 V!2097) (minValue!1721 V!2097) (_size!168 (_ BitVec 32)) (_keys!3292 array!2577) (_values!1786 array!2579) (_vacant!168 (_ BitVec 32))) )
))
(declare-fun lt!15398 () LongMapFixedSize!238)

(declare-fun map!689 (LongMapFixedSize!238) ListLongMap!1037)

(assert (=> b!40184 (= lt!15400 (map!689 lt!15398))))

(declare-fun lt!15397 () array!2577)

(declare-datatypes ((List!1039 0))(
  ( (Nil!1036) (Cons!1035 (h!1609 (_ BitVec 64)) (t!3892 List!1039)) )
))
(declare-fun arrayNoDuplicates!0 (array!2577 (_ BitVec 32) List!1039) Bool)

(assert (=> b!40184 (arrayNoDuplicates!0 lt!15397 #b00000000000000000000000000000000 Nil!1036)))

(declare-datatypes ((Unit!992 0))(
  ( (Unit!993) )
))
(declare-fun lt!15401 () Unit!992)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2577 (_ BitVec 32) (_ BitVec 32) List!1039) Unit!992)

(assert (=> b!40184 (= lt!15401 (lemmaArrayNoDuplicatesInAll0Array!0 lt!15397 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2577 (_ BitVec 32)) Bool)

(assert (=> b!40184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!15397 mask!853)))

(declare-fun lt!15402 () Unit!992)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2577 (_ BitVec 32) (_ BitVec 32)) Unit!992)

(assert (=> b!40184 (= lt!15402 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!15397 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2577 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!40184 (= (arrayCountValidKeys!0 lt!15397 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!15403 () Unit!992)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2577 (_ BitVec 32) (_ BitVec 32)) Unit!992)

(assert (=> b!40184 (= lt!15403 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!15397 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun lt!15399 () V!2097)

(declare-fun defaultEntry!470 () Int)

(assert (=> b!40184 (= lt!15398 (LongMapFixedSize!239 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!15399 lt!15399 #b00000000000000000000000000000000 lt!15397 (array!2580 ((as const (Array (_ BitVec 32) ValueCell!629)) EmptyCell!629) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))

(assert (=> b!40184 (= lt!15397 (array!2578 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!186 (Int (_ BitVec 64)) V!2097)

(assert (=> b!40184 (= lt!15399 (dynLambda!186 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!40185 () Bool)

(declare-fun res!24007 () Bool)

(assert (=> b!40185 (=> res!24007 e!25491)))

(declare-fun isEmpty!233 (List!1038) Bool)

(assert (=> b!40185 (= res!24007 (isEmpty!233 (toList!534 lt!15400)))))

(declare-fun b!40186 () Bool)

(declare-fun valid!132 (LongMapFixedSize!238) Bool)

(assert (=> b!40186 (= e!25491 (valid!132 lt!15398))))

(assert (= (and start!5696 res!24006) b!40184))

(assert (= (and b!40184 (not res!24008)) b!40185))

(assert (= (and b!40185 (not res!24007)) b!40186))

(declare-fun b_lambda!2057 () Bool)

(assert (=> (not b_lambda!2057) (not b!40184)))

(declare-fun t!3890 () Bool)

(declare-fun tb!839 () Bool)

(assert (=> (and start!5696 (= defaultEntry!470 defaultEntry!470) t!3890) tb!839))

(declare-fun result!1435 () Bool)

(declare-fun tp_is_empty!1753 () Bool)

(assert (=> tb!839 (= result!1435 tp_is_empty!1753)))

(assert (=> b!40184 t!3890))

(declare-fun b_and!2357 () Bool)

(assert (= b_and!2355 (and (=> t!3890 result!1435) b_and!2357)))

(declare-fun m!33055 () Bool)

(assert (=> start!5696 m!33055))

(declare-fun m!33057 () Bool)

(assert (=> b!40184 m!33057))

(declare-fun m!33059 () Bool)

(assert (=> b!40184 m!33059))

(declare-fun m!33061 () Bool)

(assert (=> b!40184 m!33061))

(declare-fun m!33063 () Bool)

(assert (=> b!40184 m!33063))

(declare-fun m!33065 () Bool)

(assert (=> b!40184 m!33065))

(declare-fun m!33067 () Bool)

(assert (=> b!40184 m!33067))

(declare-fun m!33069 () Bool)

(assert (=> b!40184 m!33069))

(declare-fun m!33071 () Bool)

(assert (=> b!40184 m!33071))

(declare-fun m!33073 () Bool)

(assert (=> b!40185 m!33073))

(declare-fun m!33075 () Bool)

(assert (=> b!40186 m!33075))

(check-sat (not b!40184) (not b!40185) (not b!40186) (not start!5696) (not b_lambda!2057) (not b_next!1363) tp_is_empty!1753 b_and!2357)
(check-sat b_and!2357 (not b_next!1363))
(get-model)

(declare-fun b_lambda!2067 () Bool)

(assert (= b_lambda!2057 (or (and start!5696 b_free!1363) b_lambda!2067)))

(check-sat (not b!40184) (not b!40186) (not start!5696) (not b_next!1363) tp_is_empty!1753 b_and!2357 (not b!40185) (not b_lambda!2067))
(check-sat b_and!2357 (not b_next!1363))
(get-model)

(declare-fun d!6965 () Bool)

(declare-fun res!24033 () Bool)

(declare-fun e!25506 () Bool)

(assert (=> d!6965 (=> (not res!24033) (not e!25506))))

(declare-fun simpleValid!27 (LongMapFixedSize!238) Bool)

(assert (=> d!6965 (= res!24033 (simpleValid!27 lt!15398))))

(assert (=> d!6965 (= (valid!132 lt!15398) e!25506)))

(declare-fun b!40217 () Bool)

(declare-fun res!24034 () Bool)

(assert (=> b!40217 (=> (not res!24034) (not e!25506))))

(assert (=> b!40217 (= res!24034 (= (arrayCountValidKeys!0 (_keys!3292 lt!15398) #b00000000000000000000000000000000 (size!1369 (_keys!3292 lt!15398))) (_size!168 lt!15398)))))

(declare-fun b!40218 () Bool)

(declare-fun res!24035 () Bool)

(assert (=> b!40218 (=> (not res!24035) (not e!25506))))

(assert (=> b!40218 (= res!24035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3292 lt!15398) (mask!5176 lt!15398)))))

(declare-fun b!40219 () Bool)

(assert (=> b!40219 (= e!25506 (arrayNoDuplicates!0 (_keys!3292 lt!15398) #b00000000000000000000000000000000 Nil!1036))))

(assert (= (and d!6965 res!24033) b!40217))

(assert (= (and b!40217 res!24034) b!40218))

(assert (= (and b!40218 res!24035) b!40219))

(declare-fun m!33127 () Bool)

(assert (=> d!6965 m!33127))

(declare-fun m!33129 () Bool)

(assert (=> b!40217 m!33129))

(declare-fun m!33131 () Bool)

(assert (=> b!40218 m!33131))

(declare-fun m!33133 () Bool)

(assert (=> b!40219 m!33133))

(assert (=> b!40186 d!6965))

(declare-fun d!6975 () Bool)

(assert (=> d!6975 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!5696 d!6975))

(declare-fun d!6983 () Bool)

(get-info :version)

(assert (=> d!6983 (= (isEmpty!233 (toList!534 lt!15400)) ((_ is Nil!1035) (toList!534 lt!15400)))))

(assert (=> b!40185 d!6983))

(declare-fun d!6985 () Bool)

(assert (=> d!6985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!15397 mask!853)))

(declare-fun lt!15475 () Unit!992)

(declare-fun choose!34 (array!2577 (_ BitVec 32) (_ BitVec 32)) Unit!992)

(assert (=> d!6985 (= lt!15475 (choose!34 lt!15397 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!6985 (validMask!0 mask!853)))

(assert (=> d!6985 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!15397 mask!853 #b00000000000000000000000000000000) lt!15475)))

(declare-fun bs!1697 () Bool)

(assert (= bs!1697 d!6985))

(assert (=> bs!1697 m!33059))

(declare-fun m!33159 () Bool)

(assert (=> bs!1697 m!33159))

(assert (=> bs!1697 m!33055))

(assert (=> b!40184 d!6985))

(declare-fun d!6991 () Bool)

(assert (=> d!6991 (= (arrayCountValidKeys!0 lt!15397 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!15478 () Unit!992)

(declare-fun choose!59 (array!2577 (_ BitVec 32) (_ BitVec 32)) Unit!992)

(assert (=> d!6991 (= lt!15478 (choose!59 lt!15397 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6991 (bvslt (size!1369 lt!15397) #b01111111111111111111111111111111)))

(assert (=> d!6991 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!15397 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!15478)))

(declare-fun bs!1698 () Bool)

(assert (= bs!1698 d!6991))

(assert (=> bs!1698 m!33071))

(declare-fun m!33161 () Bool)

(assert (=> bs!1698 m!33161))

(assert (=> b!40184 d!6991))

(declare-fun d!6993 () Bool)

(assert (=> d!6993 (arrayNoDuplicates!0 lt!15397 #b00000000000000000000000000000000 Nil!1036)))

(declare-fun lt!15487 () Unit!992)

(declare-fun choose!111 (array!2577 (_ BitVec 32) (_ BitVec 32) List!1039) Unit!992)

(assert (=> d!6993 (= lt!15487 (choose!111 lt!15397 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1036))))

(assert (=> d!6993 (= (size!1369 lt!15397) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!6993 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!15397 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1036) lt!15487)))

(declare-fun bs!1699 () Bool)

(assert (= bs!1699 d!6993))

(assert (=> bs!1699 m!33069))

(declare-fun m!33163 () Bool)

(assert (=> bs!1699 m!33163))

(assert (=> b!40184 d!6993))

(declare-fun b!40306 () Bool)

(declare-fun e!25567 () Bool)

(declare-fun e!25569 () Bool)

(assert (=> b!40306 (= e!25567 e!25569)))

(declare-fun lt!15497 () (_ BitVec 64))

(assert (=> b!40306 (= lt!15497 (select (arr!1232 lt!15397) #b00000000000000000000000000000000))))

(declare-fun lt!15498 () Unit!992)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2577 (_ BitVec 64) (_ BitVec 32)) Unit!992)

(assert (=> b!40306 (= lt!15498 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!15397 lt!15497 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!40306 (arrayContainsKey!0 lt!15397 lt!15497 #b00000000000000000000000000000000)))

(declare-fun lt!15499 () Unit!992)

(assert (=> b!40306 (= lt!15499 lt!15498)))

(declare-fun res!24070 () Bool)

(declare-datatypes ((SeekEntryResult!168 0))(
  ( (MissingZero!168 (index!2794 (_ BitVec 32))) (Found!168 (index!2795 (_ BitVec 32))) (Intermediate!168 (undefined!980 Bool) (index!2796 (_ BitVec 32)) (x!7715 (_ BitVec 32))) (Undefined!168) (MissingVacant!168 (index!2797 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2577 (_ BitVec 32)) SeekEntryResult!168)

(assert (=> b!40306 (= res!24070 (= (seekEntryOrOpen!0 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) lt!15397 mask!853) (Found!168 #b00000000000000000000000000000000)))))

(assert (=> b!40306 (=> (not res!24070) (not e!25569))))

(declare-fun bm!3102 () Bool)

(declare-fun call!3105 () Bool)

(assert (=> bm!3102 (= call!3105 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!15397 mask!853))))

(declare-fun b!40307 () Bool)

(assert (=> b!40307 (= e!25569 call!3105)))

(declare-fun b!40308 () Bool)

(assert (=> b!40308 (= e!25567 call!3105)))

(declare-fun d!6995 () Bool)

(declare-fun res!24071 () Bool)

(declare-fun e!25568 () Bool)

(assert (=> d!6995 (=> res!24071 e!25568)))

(assert (=> d!6995 (= res!24071 (bvsge #b00000000000000000000000000000000 (size!1369 lt!15397)))))

(assert (=> d!6995 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!15397 mask!853) e!25568)))

(declare-fun b!40309 () Bool)

(assert (=> b!40309 (= e!25568 e!25567)))

(declare-fun c!4906 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!40309 (= c!4906 (validKeyInArray!0 (select (arr!1232 lt!15397) #b00000000000000000000000000000000)))))

(assert (= (and d!6995 (not res!24071)) b!40309))

(assert (= (and b!40309 c!4906) b!40306))

(assert (= (and b!40309 (not c!4906)) b!40308))

(assert (= (and b!40306 res!24070) b!40307))

(assert (= (or b!40307 b!40308) bm!3102))

(declare-fun m!33183 () Bool)

(assert (=> b!40306 m!33183))

(declare-fun m!33185 () Bool)

(assert (=> b!40306 m!33185))

(declare-fun m!33187 () Bool)

(assert (=> b!40306 m!33187))

(assert (=> b!40306 m!33183))

(declare-fun m!33189 () Bool)

(assert (=> b!40306 m!33189))

(declare-fun m!33191 () Bool)

(assert (=> bm!3102 m!33191))

(assert (=> b!40309 m!33183))

(assert (=> b!40309 m!33183))

(declare-fun m!33193 () Bool)

(assert (=> b!40309 m!33193))

(assert (=> b!40184 d!6995))

(declare-fun d!7005 () Bool)

(declare-fun getCurrentListMap!295 (array!2577 array!2579 (_ BitVec 32) (_ BitVec 32) V!2097 V!2097 (_ BitVec 32) Int) ListLongMap!1037)

(assert (=> d!7005 (= (map!689 lt!15398) (getCurrentListMap!295 (_keys!3292 lt!15398) (_values!1786 lt!15398) (mask!5176 lt!15398) (extraKeys!1694 lt!15398) (zeroValue!1721 lt!15398) (minValue!1721 lt!15398) #b00000000000000000000000000000000 (defaultEntry!1803 lt!15398)))))

(declare-fun bs!1703 () Bool)

(assert (= bs!1703 d!7005))

(declare-fun m!33199 () Bool)

(assert (=> bs!1703 m!33199))

(assert (=> b!40184 d!7005))

(declare-fun b!40329 () Bool)

(declare-fun e!25581 () Bool)

(declare-fun e!25582 () Bool)

(assert (=> b!40329 (= e!25581 e!25582)))

(declare-fun c!4909 () Bool)

(assert (=> b!40329 (= c!4909 (validKeyInArray!0 (select (arr!1232 lt!15397) #b00000000000000000000000000000000)))))

(declare-fun d!7011 () Bool)

(declare-fun res!24089 () Bool)

(declare-fun e!25583 () Bool)

(assert (=> d!7011 (=> res!24089 e!25583)))

(assert (=> d!7011 (= res!24089 (bvsge #b00000000000000000000000000000000 (size!1369 lt!15397)))))

(assert (=> d!7011 (= (arrayNoDuplicates!0 lt!15397 #b00000000000000000000000000000000 Nil!1036) e!25583)))

(declare-fun b!40330 () Bool)

(declare-fun call!3108 () Bool)

(assert (=> b!40330 (= e!25582 call!3108)))

(declare-fun bm!3105 () Bool)

(assert (=> bm!3105 (= call!3108 (arrayNoDuplicates!0 lt!15397 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4909 (Cons!1035 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) Nil!1036) Nil!1036)))))

(declare-fun b!40331 () Bool)

(assert (=> b!40331 (= e!25583 e!25581)))

(declare-fun res!24087 () Bool)

(assert (=> b!40331 (=> (not res!24087) (not e!25581))))

(declare-fun e!25584 () Bool)

(assert (=> b!40331 (= res!24087 (not e!25584))))

(declare-fun res!24088 () Bool)

(assert (=> b!40331 (=> (not res!24088) (not e!25584))))

(assert (=> b!40331 (= res!24088 (validKeyInArray!0 (select (arr!1232 lt!15397) #b00000000000000000000000000000000)))))

(declare-fun b!40332 () Bool)

(assert (=> b!40332 (= e!25582 call!3108)))

(declare-fun b!40333 () Bool)

(declare-fun contains!504 (List!1039 (_ BitVec 64)) Bool)

(assert (=> b!40333 (= e!25584 (contains!504 Nil!1036 (select (arr!1232 lt!15397) #b00000000000000000000000000000000)))))

(assert (= (and d!7011 (not res!24089)) b!40331))

(assert (= (and b!40331 res!24088) b!40333))

(assert (= (and b!40331 res!24087) b!40329))

(assert (= (and b!40329 c!4909) b!40330))

(assert (= (and b!40329 (not c!4909)) b!40332))

(assert (= (or b!40330 b!40332) bm!3105))

(assert (=> b!40329 m!33183))

(assert (=> b!40329 m!33183))

(assert (=> b!40329 m!33193))

(assert (=> bm!3105 m!33183))

(declare-fun m!33209 () Bool)

(assert (=> bm!3105 m!33209))

(assert (=> b!40331 m!33183))

(assert (=> b!40331 m!33183))

(assert (=> b!40331 m!33193))

(assert (=> b!40333 m!33183))

(assert (=> b!40333 m!33183))

(declare-fun m!33211 () Bool)

(assert (=> b!40333 m!33211))

(assert (=> b!40184 d!7011))

(declare-fun b!40351 () Bool)

(declare-fun e!25593 () (_ BitVec 32))

(declare-fun call!3111 () (_ BitVec 32))

(assert (=> b!40351 (= e!25593 (bvadd #b00000000000000000000000000000001 call!3111))))

(declare-fun b!40352 () Bool)

(declare-fun e!25592 () (_ BitVec 32))

(assert (=> b!40352 (= e!25592 e!25593)))

(declare-fun c!4915 () Bool)

(assert (=> b!40352 (= c!4915 (validKeyInArray!0 (select (arr!1232 lt!15397) #b00000000000000000000000000000000)))))

(declare-fun b!40353 () Bool)

(assert (=> b!40353 (= e!25592 #b00000000000000000000000000000000)))

(declare-fun d!7017 () Bool)

(declare-fun lt!15508 () (_ BitVec 32))

(assert (=> d!7017 (and (bvsge lt!15508 #b00000000000000000000000000000000) (bvsle lt!15508 (bvsub (size!1369 lt!15397) #b00000000000000000000000000000000)))))

(assert (=> d!7017 (= lt!15508 e!25592)))

(declare-fun c!4914 () Bool)

(assert (=> d!7017 (= c!4914 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7017 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1369 lt!15397)))))

(assert (=> d!7017 (= (arrayCountValidKeys!0 lt!15397 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!15508)))

(declare-fun b!40354 () Bool)

(assert (=> b!40354 (= e!25593 call!3111)))

(declare-fun bm!3108 () Bool)

(assert (=> bm!3108 (= call!3111 (arrayCountValidKeys!0 lt!15397 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and d!7017 c!4914) b!40353))

(assert (= (and d!7017 (not c!4914)) b!40352))

(assert (= (and b!40352 c!4915) b!40351))

(assert (= (and b!40352 (not c!4915)) b!40354))

(assert (= (or b!40351 b!40354) bm!3108))

(assert (=> b!40352 m!33183))

(assert (=> b!40352 m!33183))

(assert (=> b!40352 m!33193))

(declare-fun m!33221 () Bool)

(assert (=> bm!3108 m!33221))

(assert (=> b!40184 d!7017))

(check-sat (not bm!3105) (not d!6965) (not b!40352) (not bm!3102) (not b!40329) (not b!40217) (not b!40306) (not b!40218) (not b!40309) (not d!7005) (not b!40219) (not b_next!1363) (not b!40331) tp_is_empty!1753 (not bm!3108) (not b!40333) (not b_lambda!2067) (not d!6985) (not d!6993) (not d!6991) b_and!2357)
(check-sat b_and!2357 (not b_next!1363))
(get-model)

(declare-fun b!40373 () Bool)

(declare-fun e!25607 () (_ BitVec 32))

(declare-fun call!3112 () (_ BitVec 32))

(assert (=> b!40373 (= e!25607 (bvadd #b00000000000000000000000000000001 call!3112))))

(declare-fun b!40374 () Bool)

(declare-fun e!25606 () (_ BitVec 32))

(assert (=> b!40374 (= e!25606 e!25607)))

(declare-fun c!4923 () Bool)

(assert (=> b!40374 (= c!4923 (validKeyInArray!0 (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40375 () Bool)

(assert (=> b!40375 (= e!25606 #b00000000000000000000000000000000)))

(declare-fun d!7031 () Bool)

(declare-fun lt!15518 () (_ BitVec 32))

(assert (=> d!7031 (and (bvsge lt!15518 #b00000000000000000000000000000000) (bvsle lt!15518 (bvsub (size!1369 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!7031 (= lt!15518 e!25606)))

(declare-fun c!4922 () Bool)

(assert (=> d!7031 (= c!4922 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7031 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1369 lt!15397)))))

(assert (=> d!7031 (= (arrayCountValidKeys!0 lt!15397 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!15518)))

(declare-fun b!40376 () Bool)

(assert (=> b!40376 (= e!25607 call!3112)))

(declare-fun bm!3109 () Bool)

(assert (=> bm!3109 (= call!3112 (arrayCountValidKeys!0 lt!15397 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and d!7031 c!4922) b!40375))

(assert (= (and d!7031 (not c!4922)) b!40374))

(assert (= (and b!40374 c!4923) b!40373))

(assert (= (and b!40374 (not c!4923)) b!40376))

(assert (= (or b!40373 b!40376) bm!3109))

(declare-fun m!33227 () Bool)

(assert (=> b!40374 m!33227))

(assert (=> b!40374 m!33227))

(declare-fun m!33229 () Bool)

(assert (=> b!40374 m!33229))

(declare-fun m!33231 () Bool)

(assert (=> bm!3109 m!33231))

(assert (=> bm!3108 d!7031))

(declare-fun d!7033 () Bool)

(assert (=> d!7033 (= (validKeyInArray!0 (select (arr!1232 lt!15397) #b00000000000000000000000000000000)) (and (not (= (select (arr!1232 lt!15397) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1232 lt!15397) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!40309 d!7033))

(declare-fun d!7035 () Bool)

(declare-fun lt!15524 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!31 (List!1039) (InoxSet (_ BitVec 64)))

(assert (=> d!7035 (= lt!15524 (select (content!31 Nil!1036) (select (arr!1232 lt!15397) #b00000000000000000000000000000000)))))

(declare-fun e!25618 () Bool)

(assert (=> d!7035 (= lt!15524 e!25618)))

(declare-fun res!24122 () Bool)

(assert (=> d!7035 (=> (not res!24122) (not e!25618))))

(assert (=> d!7035 (= res!24122 ((_ is Cons!1035) Nil!1036))))

(assert (=> d!7035 (= (contains!504 Nil!1036 (select (arr!1232 lt!15397) #b00000000000000000000000000000000)) lt!15524)))

(declare-fun b!40399 () Bool)

(declare-fun e!25619 () Bool)

(assert (=> b!40399 (= e!25618 e!25619)))

(declare-fun res!24121 () Bool)

(assert (=> b!40399 (=> res!24121 e!25619)))

(assert (=> b!40399 (= res!24121 (= (h!1609 Nil!1036) (select (arr!1232 lt!15397) #b00000000000000000000000000000000)))))

(declare-fun b!40400 () Bool)

(assert (=> b!40400 (= e!25619 (contains!504 (t!3892 Nil!1036) (select (arr!1232 lt!15397) #b00000000000000000000000000000000)))))

(assert (= (and d!7035 res!24122) b!40399))

(assert (= (and b!40399 (not res!24121)) b!40400))

(declare-fun m!33251 () Bool)

(assert (=> d!7035 m!33251))

(assert (=> d!7035 m!33183))

(declare-fun m!33253 () Bool)

(assert (=> d!7035 m!33253))

(assert (=> b!40400 m!33183))

(declare-fun m!33255 () Bool)

(assert (=> b!40400 m!33255))

(assert (=> b!40333 d!7035))

(declare-fun b!40406 () Bool)

(declare-fun e!25624 () Bool)

(declare-fun e!25626 () Bool)

(assert (=> b!40406 (= e!25624 e!25626)))

(declare-fun lt!15525 () (_ BitVec 64))

(assert (=> b!40406 (= lt!15525 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000))))

(declare-fun lt!15526 () Unit!992)

(assert (=> b!40406 (= lt!15526 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3292 lt!15398) lt!15525 #b00000000000000000000000000000000))))

(assert (=> b!40406 (arrayContainsKey!0 (_keys!3292 lt!15398) lt!15525 #b00000000000000000000000000000000)))

(declare-fun lt!15527 () Unit!992)

(assert (=> b!40406 (= lt!15527 lt!15526)))

(declare-fun res!24126 () Bool)

(assert (=> b!40406 (= res!24126 (= (seekEntryOrOpen!0 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000) (_keys!3292 lt!15398) (mask!5176 lt!15398)) (Found!168 #b00000000000000000000000000000000)))))

(assert (=> b!40406 (=> (not res!24126) (not e!25626))))

(declare-fun bm!3111 () Bool)

(declare-fun call!3114 () Bool)

(assert (=> bm!3111 (= call!3114 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3292 lt!15398) (mask!5176 lt!15398)))))

(declare-fun b!40407 () Bool)

(assert (=> b!40407 (= e!25626 call!3114)))

(declare-fun b!40408 () Bool)

(assert (=> b!40408 (= e!25624 call!3114)))

(declare-fun d!7041 () Bool)

(declare-fun res!24127 () Bool)

(declare-fun e!25625 () Bool)

(assert (=> d!7041 (=> res!24127 e!25625)))

(assert (=> d!7041 (= res!24127 (bvsge #b00000000000000000000000000000000 (size!1369 (_keys!3292 lt!15398))))))

(assert (=> d!7041 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3292 lt!15398) (mask!5176 lt!15398)) e!25625)))

(declare-fun b!40409 () Bool)

(assert (=> b!40409 (= e!25625 e!25624)))

(declare-fun c!4928 () Bool)

(assert (=> b!40409 (= c!4928 (validKeyInArray!0 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)))))

(assert (= (and d!7041 (not res!24127)) b!40409))

(assert (= (and b!40409 c!4928) b!40406))

(assert (= (and b!40409 (not c!4928)) b!40408))

(assert (= (and b!40406 res!24126) b!40407))

(assert (= (or b!40407 b!40408) bm!3111))

(declare-fun m!33261 () Bool)

(assert (=> b!40406 m!33261))

(declare-fun m!33265 () Bool)

(assert (=> b!40406 m!33265))

(declare-fun m!33267 () Bool)

(assert (=> b!40406 m!33267))

(assert (=> b!40406 m!33261))

(declare-fun m!33269 () Bool)

(assert (=> b!40406 m!33269))

(declare-fun m!33273 () Bool)

(assert (=> bm!3111 m!33273))

(assert (=> b!40409 m!33261))

(assert (=> b!40409 m!33261))

(declare-fun m!33275 () Bool)

(assert (=> b!40409 m!33275))

(assert (=> b!40218 d!7041))

(declare-fun b!40414 () Bool)

(declare-fun e!25629 () Bool)

(declare-fun e!25630 () Bool)

(assert (=> b!40414 (= e!25629 e!25630)))

(declare-fun c!4931 () Bool)

(assert (=> b!40414 (= c!4931 (validKeyInArray!0 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)))))

(declare-fun d!7045 () Bool)

(declare-fun res!24130 () Bool)

(declare-fun e!25631 () Bool)

(assert (=> d!7045 (=> res!24130 e!25631)))

(assert (=> d!7045 (= res!24130 (bvsge #b00000000000000000000000000000000 (size!1369 (_keys!3292 lt!15398))))))

(assert (=> d!7045 (= (arrayNoDuplicates!0 (_keys!3292 lt!15398) #b00000000000000000000000000000000 Nil!1036) e!25631)))

(declare-fun b!40415 () Bool)

(declare-fun call!3116 () Bool)

(assert (=> b!40415 (= e!25630 call!3116)))

(declare-fun bm!3113 () Bool)

(assert (=> bm!3113 (= call!3116 (arrayNoDuplicates!0 (_keys!3292 lt!15398) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4931 (Cons!1035 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000) Nil!1036) Nil!1036)))))

(declare-fun b!40416 () Bool)

(assert (=> b!40416 (= e!25631 e!25629)))

(declare-fun res!24128 () Bool)

(assert (=> b!40416 (=> (not res!24128) (not e!25629))))

(declare-fun e!25632 () Bool)

(assert (=> b!40416 (= res!24128 (not e!25632))))

(declare-fun res!24129 () Bool)

(assert (=> b!40416 (=> (not res!24129) (not e!25632))))

(assert (=> b!40416 (= res!24129 (validKeyInArray!0 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)))))

(declare-fun b!40417 () Bool)

(assert (=> b!40417 (= e!25630 call!3116)))

(declare-fun b!40418 () Bool)

(assert (=> b!40418 (= e!25632 (contains!504 Nil!1036 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)))))

(assert (= (and d!7045 (not res!24130)) b!40416))

(assert (= (and b!40416 res!24129) b!40418))

(assert (= (and b!40416 res!24128) b!40414))

(assert (= (and b!40414 c!4931) b!40415))

(assert (= (and b!40414 (not c!4931)) b!40417))

(assert (= (or b!40415 b!40417) bm!3113))

(assert (=> b!40414 m!33261))

(assert (=> b!40414 m!33261))

(assert (=> b!40414 m!33275))

(assert (=> bm!3113 m!33261))

(declare-fun m!33279 () Bool)

(assert (=> bm!3113 m!33279))

(assert (=> b!40416 m!33261))

(assert (=> b!40416 m!33261))

(assert (=> b!40416 m!33275))

(assert (=> b!40418 m!33261))

(assert (=> b!40418 m!33261))

(declare-fun m!33281 () Bool)

(assert (=> b!40418 m!33281))

(assert (=> b!40219 d!7045))

(declare-fun b!40419 () Bool)

(declare-fun e!25633 () Bool)

(declare-fun e!25634 () Bool)

(assert (=> b!40419 (= e!25633 e!25634)))

(declare-fun c!4932 () Bool)

(assert (=> b!40419 (= c!4932 (validKeyInArray!0 (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!7049 () Bool)

(declare-fun res!24133 () Bool)

(declare-fun e!25635 () Bool)

(assert (=> d!7049 (=> res!24133 e!25635)))

(assert (=> d!7049 (= res!24133 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1369 lt!15397)))))

(assert (=> d!7049 (= (arrayNoDuplicates!0 lt!15397 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4909 (Cons!1035 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) Nil!1036) Nil!1036)) e!25635)))

(declare-fun b!40420 () Bool)

(declare-fun call!3117 () Bool)

(assert (=> b!40420 (= e!25634 call!3117)))

(declare-fun bm!3114 () Bool)

(assert (=> bm!3114 (= call!3117 (arrayNoDuplicates!0 lt!15397 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4932 (Cons!1035 (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4909 (Cons!1035 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) Nil!1036) Nil!1036)) (ite c!4909 (Cons!1035 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) Nil!1036) Nil!1036))))))

(declare-fun b!40421 () Bool)

(assert (=> b!40421 (= e!25635 e!25633)))

(declare-fun res!24131 () Bool)

(assert (=> b!40421 (=> (not res!24131) (not e!25633))))

(declare-fun e!25636 () Bool)

(assert (=> b!40421 (= res!24131 (not e!25636))))

(declare-fun res!24132 () Bool)

(assert (=> b!40421 (=> (not res!24132) (not e!25636))))

(assert (=> b!40421 (= res!24132 (validKeyInArray!0 (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40422 () Bool)

(assert (=> b!40422 (= e!25634 call!3117)))

(declare-fun b!40423 () Bool)

(assert (=> b!40423 (= e!25636 (contains!504 (ite c!4909 (Cons!1035 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) Nil!1036) Nil!1036) (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!7049 (not res!24133)) b!40421))

(assert (= (and b!40421 res!24132) b!40423))

(assert (= (and b!40421 res!24131) b!40419))

(assert (= (and b!40419 c!4932) b!40420))

(assert (= (and b!40419 (not c!4932)) b!40422))

(assert (= (or b!40420 b!40422) bm!3114))

(assert (=> b!40419 m!33227))

(assert (=> b!40419 m!33227))

(assert (=> b!40419 m!33229))

(assert (=> bm!3114 m!33227))

(declare-fun m!33283 () Bool)

(assert (=> bm!3114 m!33283))

(assert (=> b!40421 m!33227))

(assert (=> b!40421 m!33227))

(assert (=> b!40421 m!33229))

(assert (=> b!40423 m!33227))

(assert (=> b!40423 m!33227))

(declare-fun m!33285 () Bool)

(assert (=> b!40423 m!33285))

(assert (=> bm!3105 d!7049))

(assert (=> b!40352 d!7033))

(declare-fun b!40432 () Bool)

(declare-fun e!25639 () Bool)

(declare-fun e!25641 () Bool)

(assert (=> b!40432 (= e!25639 e!25641)))

(declare-fun lt!15529 () (_ BitVec 64))

(assert (=> b!40432 (= lt!15529 (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!15530 () Unit!992)

(assert (=> b!40432 (= lt!15530 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!15397 lt!15529 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!40432 (arrayContainsKey!0 lt!15397 lt!15529 #b00000000000000000000000000000000)))

(declare-fun lt!15531 () Unit!992)

(assert (=> b!40432 (= lt!15531 lt!15530)))

(declare-fun res!24142 () Bool)

(assert (=> b!40432 (= res!24142 (= (seekEntryOrOpen!0 (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15397 mask!853) (Found!168 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!40432 (=> (not res!24142) (not e!25641))))

(declare-fun bm!3115 () Bool)

(declare-fun call!3118 () Bool)

(assert (=> bm!3115 (= call!3118 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!15397 mask!853))))

(declare-fun b!40433 () Bool)

(assert (=> b!40433 (= e!25641 call!3118)))

(declare-fun b!40434 () Bool)

(assert (=> b!40434 (= e!25639 call!3118)))

(declare-fun d!7053 () Bool)

(declare-fun res!24143 () Bool)

(declare-fun e!25640 () Bool)

(assert (=> d!7053 (=> res!24143 e!25640)))

(assert (=> d!7053 (= res!24143 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1369 lt!15397)))))

(assert (=> d!7053 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!15397 mask!853) e!25640)))

(declare-fun b!40435 () Bool)

(assert (=> b!40435 (= e!25640 e!25639)))

(declare-fun c!4933 () Bool)

(assert (=> b!40435 (= c!4933 (validKeyInArray!0 (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!7053 (not res!24143)) b!40435))

(assert (= (and b!40435 c!4933) b!40432))

(assert (= (and b!40435 (not c!4933)) b!40434))

(assert (= (and b!40432 res!24142) b!40433))

(assert (= (or b!40433 b!40434) bm!3115))

(assert (=> b!40432 m!33227))

(declare-fun m!33287 () Bool)

(assert (=> b!40432 m!33287))

(declare-fun m!33289 () Bool)

(assert (=> b!40432 m!33289))

(assert (=> b!40432 m!33227))

(declare-fun m!33291 () Bool)

(assert (=> b!40432 m!33291))

(declare-fun m!33293 () Bool)

(assert (=> bm!3115 m!33293))

(assert (=> b!40435 m!33227))

(assert (=> b!40435 m!33227))

(assert (=> b!40435 m!33229))

(assert (=> bm!3102 d!7053))

(declare-fun b!40460 () Bool)

(declare-fun res!24163 () Bool)

(declare-fun e!25654 () Bool)

(assert (=> b!40460 (=> (not res!24163) (not e!25654))))

(assert (=> b!40460 (= res!24163 (and (= (size!1370 (_values!1786 lt!15398)) (bvadd (mask!5176 lt!15398) #b00000000000000000000000000000001)) (= (size!1369 (_keys!3292 lt!15398)) (size!1370 (_values!1786 lt!15398))) (bvsge (_size!168 lt!15398) #b00000000000000000000000000000000) (bvsle (_size!168 lt!15398) (bvadd (mask!5176 lt!15398) #b00000000000000000000000000000001))))))

(declare-fun b!40461 () Bool)

(declare-fun res!24164 () Bool)

(assert (=> b!40461 (=> (not res!24164) (not e!25654))))

(declare-fun size!1389 (LongMapFixedSize!238) (_ BitVec 32))

(assert (=> b!40461 (= res!24164 (bvsge (size!1389 lt!15398) (_size!168 lt!15398)))))

(declare-fun b!40462 () Bool)

(declare-fun res!24165 () Bool)

(assert (=> b!40462 (=> (not res!24165) (not e!25654))))

(assert (=> b!40462 (= res!24165 (= (size!1389 lt!15398) (bvadd (_size!168 lt!15398) (bvsdiv (bvadd (extraKeys!1694 lt!15398) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!40463 () Bool)

(assert (=> b!40463 (= e!25654 (and (bvsge (extraKeys!1694 lt!15398) #b00000000000000000000000000000000) (bvsle (extraKeys!1694 lt!15398) #b00000000000000000000000000000011) (bvsge (_vacant!168 lt!15398) #b00000000000000000000000000000000)))))

(declare-fun d!7055 () Bool)

(declare-fun res!24162 () Bool)

(assert (=> d!7055 (=> (not res!24162) (not e!25654))))

(assert (=> d!7055 (= res!24162 (validMask!0 (mask!5176 lt!15398)))))

(assert (=> d!7055 (= (simpleValid!27 lt!15398) e!25654)))

(assert (= (and d!7055 res!24162) b!40460))

(assert (= (and b!40460 res!24163) b!40461))

(assert (= (and b!40461 res!24164) b!40462))

(assert (= (and b!40462 res!24165) b!40463))

(declare-fun m!33317 () Bool)

(assert (=> b!40461 m!33317))

(assert (=> b!40462 m!33317))

(declare-fun m!33319 () Bool)

(assert (=> d!7055 m!33319))

(assert (=> d!6965 d!7055))

(declare-fun b!40595 () Bool)

(declare-fun e!25739 () Bool)

(declare-fun lt!15679 () ListLongMap!1037)

(declare-fun apply!56 (ListLongMap!1037 (_ BitVec 64)) V!2097)

(assert (=> b!40595 (= e!25739 (= (apply!56 lt!15679 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1721 lt!15398)))))

(declare-fun bm!3153 () Bool)

(declare-fun call!3158 () ListLongMap!1037)

(declare-fun call!3162 () ListLongMap!1037)

(assert (=> bm!3153 (= call!3158 call!3162)))

(declare-fun b!40596 () Bool)

(declare-fun res!24220 () Bool)

(declare-fun e!25740 () Bool)

(assert (=> b!40596 (=> (not res!24220) (not e!25740))))

(declare-fun e!25743 () Bool)

(assert (=> b!40596 (= res!24220 e!25743)))

(declare-fun c!4980 () Bool)

(assert (=> b!40596 (= c!4980 (not (= (bvand (extraKeys!1694 lt!15398) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!40597 () Bool)

(declare-fun e!25744 () ListLongMap!1037)

(assert (=> b!40597 (= e!25744 call!3158)))

(declare-fun call!3156 () ListLongMap!1037)

(declare-fun call!3157 () ListLongMap!1037)

(declare-fun bm!3154 () Bool)

(declare-fun c!4981 () Bool)

(declare-fun c!4977 () Bool)

(declare-fun +!64 (ListLongMap!1037 tuple2!1466) ListLongMap!1037)

(assert (=> bm!3154 (= call!3157 (+!64 (ite c!4977 call!3156 (ite c!4981 call!3162 call!3158)) (ite (or c!4977 c!4981) (tuple2!1467 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15398)) (tuple2!1467 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15398)))))))

(declare-fun b!40598 () Bool)

(declare-fun e!25742 () Bool)

(assert (=> b!40598 (= e!25740 e!25742)))

(declare-fun c!4978 () Bool)

(assert (=> b!40598 (= c!4978 (not (= (bvand (extraKeys!1694 lt!15398) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!40599 () Bool)

(declare-fun e!25749 () Bool)

(assert (=> b!40599 (= e!25749 (validKeyInArray!0 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)))))

(declare-fun b!40600 () Bool)

(declare-fun c!4976 () Bool)

(assert (=> b!40600 (= c!4976 (and (not (= (bvand (extraKeys!1694 lt!15398) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1694 lt!15398) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!25748 () ListLongMap!1037)

(assert (=> b!40600 (= e!25748 e!25744)))

(declare-fun bm!3155 () Bool)

(declare-fun call!3161 () Bool)

(declare-fun contains!506 (ListLongMap!1037 (_ BitVec 64)) Bool)

(assert (=> bm!3155 (= call!3161 (contains!506 lt!15679 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!40601 () Bool)

(declare-fun e!25741 () Bool)

(assert (=> b!40601 (= e!25743 e!25741)))

(declare-fun res!24219 () Bool)

(assert (=> b!40601 (= res!24219 call!3161)))

(assert (=> b!40601 (=> (not res!24219) (not e!25741))))

(declare-fun b!40602 () Bool)

(declare-fun e!25747 () Bool)

(declare-fun get!702 (ValueCell!629 V!2097) V!2097)

(assert (=> b!40602 (= e!25747 (= (apply!56 lt!15679 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)) (get!702 (select (arr!1233 (_values!1786 lt!15398)) #b00000000000000000000000000000000) (dynLambda!186 (defaultEntry!1803 lt!15398) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!40602 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1370 (_values!1786 lt!15398))))))

(assert (=> b!40602 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1369 (_keys!3292 lt!15398))))))

(declare-fun b!40603 () Bool)

(declare-fun e!25737 () ListLongMap!1037)

(assert (=> b!40603 (= e!25737 (+!64 call!3157 (tuple2!1467 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15398))))))

(declare-fun b!40604 () Bool)

(assert (=> b!40604 (= e!25742 e!25739)))

(declare-fun res!24223 () Bool)

(declare-fun call!3159 () Bool)

(assert (=> b!40604 (= res!24223 call!3159)))

(assert (=> b!40604 (=> (not res!24223) (not e!25739))))

(declare-fun b!40605 () Bool)

(assert (=> b!40605 (= e!25737 e!25748)))

(assert (=> b!40605 (= c!4981 (and (not (= (bvand (extraKeys!1694 lt!15398) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1694 lt!15398) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!40606 () Bool)

(declare-fun e!25738 () Bool)

(assert (=> b!40606 (= e!25738 (validKeyInArray!0 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)))))

(declare-fun b!40607 () Bool)

(declare-fun e!25746 () Unit!992)

(declare-fun lt!15664 () Unit!992)

(assert (=> b!40607 (= e!25746 lt!15664)))

(declare-fun lt!15671 () ListLongMap!1037)

(declare-fun getCurrentListMapNoExtraKeys!34 (array!2577 array!2579 (_ BitVec 32) (_ BitVec 32) V!2097 V!2097 (_ BitVec 32) Int) ListLongMap!1037)

(assert (=> b!40607 (= lt!15671 (getCurrentListMapNoExtraKeys!34 (_keys!3292 lt!15398) (_values!1786 lt!15398) (mask!5176 lt!15398) (extraKeys!1694 lt!15398) (zeroValue!1721 lt!15398) (minValue!1721 lt!15398) #b00000000000000000000000000000000 (defaultEntry!1803 lt!15398)))))

(declare-fun lt!15673 () (_ BitVec 64))

(assert (=> b!40607 (= lt!15673 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15663 () (_ BitVec 64))

(assert (=> b!40607 (= lt!15663 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000))))

(declare-fun lt!15676 () Unit!992)

(declare-fun addStillContains!32 (ListLongMap!1037 (_ BitVec 64) V!2097 (_ BitVec 64)) Unit!992)

(assert (=> b!40607 (= lt!15676 (addStillContains!32 lt!15671 lt!15673 (zeroValue!1721 lt!15398) lt!15663))))

(assert (=> b!40607 (contains!506 (+!64 lt!15671 (tuple2!1467 lt!15673 (zeroValue!1721 lt!15398))) lt!15663)))

(declare-fun lt!15662 () Unit!992)

(assert (=> b!40607 (= lt!15662 lt!15676)))

(declare-fun lt!15682 () ListLongMap!1037)

(assert (=> b!40607 (= lt!15682 (getCurrentListMapNoExtraKeys!34 (_keys!3292 lt!15398) (_values!1786 lt!15398) (mask!5176 lt!15398) (extraKeys!1694 lt!15398) (zeroValue!1721 lt!15398) (minValue!1721 lt!15398) #b00000000000000000000000000000000 (defaultEntry!1803 lt!15398)))))

(declare-fun lt!15661 () (_ BitVec 64))

(assert (=> b!40607 (= lt!15661 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15674 () (_ BitVec 64))

(assert (=> b!40607 (= lt!15674 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000))))

(declare-fun lt!15675 () Unit!992)

(declare-fun addApplyDifferent!32 (ListLongMap!1037 (_ BitVec 64) V!2097 (_ BitVec 64)) Unit!992)

(assert (=> b!40607 (= lt!15675 (addApplyDifferent!32 lt!15682 lt!15661 (minValue!1721 lt!15398) lt!15674))))

(assert (=> b!40607 (= (apply!56 (+!64 lt!15682 (tuple2!1467 lt!15661 (minValue!1721 lt!15398))) lt!15674) (apply!56 lt!15682 lt!15674))))

(declare-fun lt!15680 () Unit!992)

(assert (=> b!40607 (= lt!15680 lt!15675)))

(declare-fun lt!15668 () ListLongMap!1037)

(assert (=> b!40607 (= lt!15668 (getCurrentListMapNoExtraKeys!34 (_keys!3292 lt!15398) (_values!1786 lt!15398) (mask!5176 lt!15398) (extraKeys!1694 lt!15398) (zeroValue!1721 lt!15398) (minValue!1721 lt!15398) #b00000000000000000000000000000000 (defaultEntry!1803 lt!15398)))))

(declare-fun lt!15677 () (_ BitVec 64))

(assert (=> b!40607 (= lt!15677 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15666 () (_ BitVec 64))

(assert (=> b!40607 (= lt!15666 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000))))

(declare-fun lt!15669 () Unit!992)

(assert (=> b!40607 (= lt!15669 (addApplyDifferent!32 lt!15668 lt!15677 (zeroValue!1721 lt!15398) lt!15666))))

(assert (=> b!40607 (= (apply!56 (+!64 lt!15668 (tuple2!1467 lt!15677 (zeroValue!1721 lt!15398))) lt!15666) (apply!56 lt!15668 lt!15666))))

(declare-fun lt!15665 () Unit!992)

(assert (=> b!40607 (= lt!15665 lt!15669)))

(declare-fun lt!15681 () ListLongMap!1037)

(assert (=> b!40607 (= lt!15681 (getCurrentListMapNoExtraKeys!34 (_keys!3292 lt!15398) (_values!1786 lt!15398) (mask!5176 lt!15398) (extraKeys!1694 lt!15398) (zeroValue!1721 lt!15398) (minValue!1721 lt!15398) #b00000000000000000000000000000000 (defaultEntry!1803 lt!15398)))))

(declare-fun lt!15667 () (_ BitVec 64))

(assert (=> b!40607 (= lt!15667 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15678 () (_ BitVec 64))

(assert (=> b!40607 (= lt!15678 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000))))

(assert (=> b!40607 (= lt!15664 (addApplyDifferent!32 lt!15681 lt!15667 (minValue!1721 lt!15398) lt!15678))))

(assert (=> b!40607 (= (apply!56 (+!64 lt!15681 (tuple2!1467 lt!15667 (minValue!1721 lt!15398))) lt!15678) (apply!56 lt!15681 lt!15678))))

(declare-fun b!40608 () Bool)

(declare-fun e!25745 () Bool)

(assert (=> b!40608 (= e!25745 e!25747)))

(declare-fun res!24224 () Bool)

(assert (=> b!40608 (=> (not res!24224) (not e!25747))))

(assert (=> b!40608 (= res!24224 (contains!506 lt!15679 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)))))

(assert (=> b!40608 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1369 (_keys!3292 lt!15398))))))

(declare-fun bm!3156 () Bool)

(declare-fun call!3160 () ListLongMap!1037)

(assert (=> bm!3156 (= call!3160 call!3157)))

(declare-fun b!40609 () Bool)

(assert (=> b!40609 (= e!25748 call!3160)))

(declare-fun b!40610 () Bool)

(declare-fun Unit!999 () Unit!992)

(assert (=> b!40610 (= e!25746 Unit!999)))

(declare-fun b!40611 () Bool)

(assert (=> b!40611 (= e!25743 (not call!3161))))

(declare-fun b!40612 () Bool)

(assert (=> b!40612 (= e!25742 (not call!3159))))

(declare-fun bm!3157 () Bool)

(assert (=> bm!3157 (= call!3162 call!3156)))

(declare-fun b!40613 () Bool)

(assert (=> b!40613 (= e!25741 (= (apply!56 lt!15679 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1721 lt!15398)))))

(declare-fun b!40614 () Bool)

(assert (=> b!40614 (= e!25744 call!3160)))

(declare-fun bm!3158 () Bool)

(assert (=> bm!3158 (= call!3159 (contains!506 lt!15679 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!40615 () Bool)

(declare-fun res!24226 () Bool)

(assert (=> b!40615 (=> (not res!24226) (not e!25740))))

(assert (=> b!40615 (= res!24226 e!25745)))

(declare-fun res!24225 () Bool)

(assert (=> b!40615 (=> res!24225 e!25745)))

(assert (=> b!40615 (= res!24225 (not e!25738))))

(declare-fun res!24221 () Bool)

(assert (=> b!40615 (=> (not res!24221) (not e!25738))))

(assert (=> b!40615 (= res!24221 (bvslt #b00000000000000000000000000000000 (size!1369 (_keys!3292 lt!15398))))))

(declare-fun d!7065 () Bool)

(assert (=> d!7065 e!25740))

(declare-fun res!24227 () Bool)

(assert (=> d!7065 (=> (not res!24227) (not e!25740))))

(assert (=> d!7065 (= res!24227 (or (bvsge #b00000000000000000000000000000000 (size!1369 (_keys!3292 lt!15398))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1369 (_keys!3292 lt!15398))))))))

(declare-fun lt!15672 () ListLongMap!1037)

(assert (=> d!7065 (= lt!15679 lt!15672)))

(declare-fun lt!15670 () Unit!992)

(assert (=> d!7065 (= lt!15670 e!25746)))

(declare-fun c!4979 () Bool)

(assert (=> d!7065 (= c!4979 e!25749)))

(declare-fun res!24222 () Bool)

(assert (=> d!7065 (=> (not res!24222) (not e!25749))))

(assert (=> d!7065 (= res!24222 (bvslt #b00000000000000000000000000000000 (size!1369 (_keys!3292 lt!15398))))))

(assert (=> d!7065 (= lt!15672 e!25737)))

(assert (=> d!7065 (= c!4977 (and (not (= (bvand (extraKeys!1694 lt!15398) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1694 lt!15398) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!7065 (validMask!0 (mask!5176 lt!15398))))

(assert (=> d!7065 (= (getCurrentListMap!295 (_keys!3292 lt!15398) (_values!1786 lt!15398) (mask!5176 lt!15398) (extraKeys!1694 lt!15398) (zeroValue!1721 lt!15398) (minValue!1721 lt!15398) #b00000000000000000000000000000000 (defaultEntry!1803 lt!15398)) lt!15679)))

(declare-fun bm!3159 () Bool)

(assert (=> bm!3159 (= call!3156 (getCurrentListMapNoExtraKeys!34 (_keys!3292 lt!15398) (_values!1786 lt!15398) (mask!5176 lt!15398) (extraKeys!1694 lt!15398) (zeroValue!1721 lt!15398) (minValue!1721 lt!15398) #b00000000000000000000000000000000 (defaultEntry!1803 lt!15398)))))

(assert (= (and d!7065 c!4977) b!40603))

(assert (= (and d!7065 (not c!4977)) b!40605))

(assert (= (and b!40605 c!4981) b!40609))

(assert (= (and b!40605 (not c!4981)) b!40600))

(assert (= (and b!40600 c!4976) b!40614))

(assert (= (and b!40600 (not c!4976)) b!40597))

(assert (= (or b!40614 b!40597) bm!3153))

(assert (= (or b!40609 bm!3153) bm!3157))

(assert (= (or b!40609 b!40614) bm!3156))

(assert (= (or b!40603 bm!3157) bm!3159))

(assert (= (or b!40603 bm!3156) bm!3154))

(assert (= (and d!7065 res!24222) b!40599))

(assert (= (and d!7065 c!4979) b!40607))

(assert (= (and d!7065 (not c!4979)) b!40610))

(assert (= (and d!7065 res!24227) b!40615))

(assert (= (and b!40615 res!24221) b!40606))

(assert (= (and b!40615 (not res!24225)) b!40608))

(assert (= (and b!40608 res!24224) b!40602))

(assert (= (and b!40615 res!24226) b!40596))

(assert (= (and b!40596 c!4980) b!40601))

(assert (= (and b!40596 (not c!4980)) b!40611))

(assert (= (and b!40601 res!24219) b!40613))

(assert (= (or b!40601 b!40611) bm!3155))

(assert (= (and b!40596 res!24220) b!40598))

(assert (= (and b!40598 c!4978) b!40604))

(assert (= (and b!40598 (not c!4978)) b!40612))

(assert (= (and b!40604 res!24223) b!40595))

(assert (= (or b!40604 b!40612) bm!3158))

(declare-fun b_lambda!2071 () Bool)

(assert (=> (not b_lambda!2071) (not b!40602)))

(declare-fun tb!847 () Bool)

(declare-fun t!3904 () Bool)

(assert (=> (and start!5696 (= defaultEntry!470 (defaultEntry!1803 lt!15398)) t!3904) tb!847))

(declare-fun result!1449 () Bool)

(assert (=> tb!847 (= result!1449 tp_is_empty!1753)))

(assert (=> b!40602 t!3904))

(declare-fun b_and!2369 () Bool)

(assert (= b_and!2357 (and (=> t!3904 result!1449) b_and!2369)))

(declare-fun m!33403 () Bool)

(assert (=> bm!3158 m!33403))

(declare-fun m!33405 () Bool)

(assert (=> bm!3159 m!33405))

(declare-fun m!33407 () Bool)

(assert (=> b!40607 m!33407))

(declare-fun m!33409 () Bool)

(assert (=> b!40607 m!33409))

(declare-fun m!33411 () Bool)

(assert (=> b!40607 m!33411))

(declare-fun m!33413 () Bool)

(assert (=> b!40607 m!33413))

(assert (=> b!40607 m!33411))

(declare-fun m!33415 () Bool)

(assert (=> b!40607 m!33415))

(assert (=> b!40607 m!33405))

(declare-fun m!33417 () Bool)

(assert (=> b!40607 m!33417))

(declare-fun m!33419 () Bool)

(assert (=> b!40607 m!33419))

(assert (=> b!40607 m!33261))

(declare-fun m!33421 () Bool)

(assert (=> b!40607 m!33421))

(assert (=> b!40607 m!33417))

(declare-fun m!33423 () Bool)

(assert (=> b!40607 m!33423))

(declare-fun m!33425 () Bool)

(assert (=> b!40607 m!33425))

(declare-fun m!33427 () Bool)

(assert (=> b!40607 m!33427))

(assert (=> b!40607 m!33407))

(declare-fun m!33429 () Bool)

(assert (=> b!40607 m!33429))

(declare-fun m!33431 () Bool)

(assert (=> b!40607 m!33431))

(declare-fun m!33433 () Bool)

(assert (=> b!40607 m!33433))

(assert (=> b!40607 m!33415))

(declare-fun m!33435 () Bool)

(assert (=> b!40607 m!33435))

(declare-fun m!33437 () Bool)

(assert (=> b!40603 m!33437))

(declare-fun m!33439 () Bool)

(assert (=> b!40602 m!33439))

(declare-fun m!33441 () Bool)

(assert (=> b!40602 m!33441))

(declare-fun m!33443 () Bool)

(assert (=> b!40602 m!33443))

(assert (=> b!40602 m!33261))

(declare-fun m!33445 () Bool)

(assert (=> b!40602 m!33445))

(assert (=> b!40602 m!33441))

(assert (=> b!40602 m!33261))

(assert (=> b!40602 m!33439))

(declare-fun m!33447 () Bool)

(assert (=> b!40595 m!33447))

(declare-fun m!33451 () Bool)

(assert (=> bm!3155 m!33451))

(assert (=> d!7065 m!33319))

(assert (=> b!40608 m!33261))

(assert (=> b!40608 m!33261))

(declare-fun m!33457 () Bool)

(assert (=> b!40608 m!33457))

(assert (=> b!40599 m!33261))

(assert (=> b!40599 m!33261))

(assert (=> b!40599 m!33275))

(declare-fun m!33459 () Bool)

(assert (=> bm!3154 m!33459))

(declare-fun m!33461 () Bool)

(assert (=> b!40613 m!33461))

(assert (=> b!40606 m!33261))

(assert (=> b!40606 m!33261))

(assert (=> b!40606 m!33275))

(assert (=> d!7005 d!7065))

(declare-fun b!40638 () Bool)

(declare-fun e!25766 () (_ BitVec 32))

(declare-fun call!3166 () (_ BitVec 32))

(assert (=> b!40638 (= e!25766 (bvadd #b00000000000000000000000000000001 call!3166))))

(declare-fun b!40639 () Bool)

(declare-fun e!25765 () (_ BitVec 32))

(assert (=> b!40639 (= e!25765 e!25766)))

(declare-fun c!4990 () Bool)

(assert (=> b!40639 (= c!4990 (validKeyInArray!0 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)))))

(declare-fun b!40640 () Bool)

(assert (=> b!40640 (= e!25765 #b00000000000000000000000000000000)))

(declare-fun d!7079 () Bool)

(declare-fun lt!15693 () (_ BitVec 32))

(assert (=> d!7079 (and (bvsge lt!15693 #b00000000000000000000000000000000) (bvsle lt!15693 (bvsub (size!1369 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)))))

(assert (=> d!7079 (= lt!15693 e!25765)))

(declare-fun c!4989 () Bool)

(assert (=> d!7079 (= c!4989 (bvsge #b00000000000000000000000000000000 (size!1369 (_keys!3292 lt!15398))))))

(assert (=> d!7079 (and (bvsle #b00000000000000000000000000000000 (size!1369 (_keys!3292 lt!15398))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1369 (_keys!3292 lt!15398)) (size!1369 (_keys!3292 lt!15398))))))

(assert (=> d!7079 (= (arrayCountValidKeys!0 (_keys!3292 lt!15398) #b00000000000000000000000000000000 (size!1369 (_keys!3292 lt!15398))) lt!15693)))

(declare-fun b!40641 () Bool)

(assert (=> b!40641 (= e!25766 call!3166)))

(declare-fun bm!3163 () Bool)

(assert (=> bm!3163 (= call!3166 (arrayCountValidKeys!0 (_keys!3292 lt!15398) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1369 (_keys!3292 lt!15398))))))

(assert (= (and d!7079 c!4989) b!40640))

(assert (= (and d!7079 (not c!4989)) b!40639))

(assert (= (and b!40639 c!4990) b!40638))

(assert (= (and b!40639 (not c!4990)) b!40641))

(assert (= (or b!40638 b!40641) bm!3163))

(assert (=> b!40639 m!33261))

(assert (=> b!40639 m!33261))

(assert (=> b!40639 m!33275))

(declare-fun m!33471 () Bool)

(assert (=> bm!3163 m!33471))

(assert (=> b!40217 d!7079))

(assert (=> b!40331 d!7033))

(assert (=> d!6993 d!7011))

(declare-fun d!7083 () Bool)

(assert (=> d!7083 (arrayNoDuplicates!0 lt!15397 #b00000000000000000000000000000000 Nil!1036)))

(assert (=> d!7083 true))

(declare-fun res!24241 () Unit!992)

(assert (=> d!7083 (= (choose!111 lt!15397 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1036) res!24241)))

(declare-fun bs!1708 () Bool)

(assert (= bs!1708 d!7083))

(assert (=> bs!1708 m!33069))

(assert (=> d!6993 d!7083))

(assert (=> d!6985 d!6995))

(declare-fun d!7089 () Bool)

(assert (=> d!7089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!15397 mask!853)))

(assert (=> d!7089 true))

(declare-fun _$30!54 () Unit!992)

(assert (=> d!7089 (= (choose!34 lt!15397 mask!853 #b00000000000000000000000000000000) _$30!54)))

(declare-fun bs!1709 () Bool)

(assert (= bs!1709 d!7089))

(assert (=> bs!1709 m!33059))

(assert (=> d!6985 d!7089))

(assert (=> d!6985 d!6975))

(assert (=> d!6991 d!7017))

(declare-fun d!7095 () Bool)

(assert (=> d!7095 (= (arrayCountValidKeys!0 lt!15397 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(assert (=> d!7095 true))

(declare-fun _$88!40 () Unit!992)

(assert (=> d!7095 (= (choose!59 lt!15397 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) _$88!40)))

(declare-fun bs!1711 () Bool)

(assert (= bs!1711 d!7095))

(assert (=> bs!1711 m!33071))

(assert (=> d!6991 d!7095))

(declare-fun d!7099 () Bool)

(assert (=> d!7099 (arrayContainsKey!0 lt!15397 lt!15497 #b00000000000000000000000000000000)))

(declare-fun lt!15740 () Unit!992)

(declare-fun choose!13 (array!2577 (_ BitVec 64) (_ BitVec 32)) Unit!992)

(assert (=> d!7099 (= lt!15740 (choose!13 lt!15397 lt!15497 #b00000000000000000000000000000000))))

(assert (=> d!7099 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!7099 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!15397 lt!15497 #b00000000000000000000000000000000) lt!15740)))

(declare-fun bs!1713 () Bool)

(assert (= bs!1713 d!7099))

(assert (=> bs!1713 m!33187))

(declare-fun m!33491 () Bool)

(assert (=> bs!1713 m!33491))

(assert (=> b!40306 d!7099))

(declare-fun d!7103 () Bool)

(declare-fun res!24272 () Bool)

(declare-fun e!25804 () Bool)

(assert (=> d!7103 (=> res!24272 e!25804)))

(assert (=> d!7103 (= res!24272 (= (select (arr!1232 lt!15397) #b00000000000000000000000000000000) lt!15497))))

(assert (=> d!7103 (= (arrayContainsKey!0 lt!15397 lt!15497 #b00000000000000000000000000000000) e!25804)))

(declare-fun b!40694 () Bool)

(declare-fun e!25805 () Bool)

(assert (=> b!40694 (= e!25804 e!25805)))

(declare-fun res!24273 () Bool)

(assert (=> b!40694 (=> (not res!24273) (not e!25805))))

(assert (=> b!40694 (= res!24273 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1369 lt!15397)))))

(declare-fun b!40695 () Bool)

(assert (=> b!40695 (= e!25805 (arrayContainsKey!0 lt!15397 lt!15497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!7103 (not res!24272)) b!40694))

(assert (= (and b!40694 res!24273) b!40695))

(assert (=> d!7103 m!33183))

(declare-fun m!33493 () Bool)

(assert (=> b!40695 m!33493))

(assert (=> b!40306 d!7103))

(declare-fun b!40742 () Bool)

(declare-fun e!25836 () SeekEntryResult!168)

(declare-fun e!25834 () SeekEntryResult!168)

(assert (=> b!40742 (= e!25836 e!25834)))

(declare-fun lt!15775 () (_ BitVec 64))

(declare-fun lt!15774 () SeekEntryResult!168)

(assert (=> b!40742 (= lt!15775 (select (arr!1232 lt!15397) (index!2796 lt!15774)))))

(declare-fun c!5018 () Bool)

(assert (=> b!40742 (= c!5018 (= lt!15775 (select (arr!1232 lt!15397) #b00000000000000000000000000000000)))))

(declare-fun b!40743 () Bool)

(assert (=> b!40743 (= e!25836 Undefined!168)))

(declare-fun b!40744 () Bool)

(declare-fun e!25835 () SeekEntryResult!168)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2577 (_ BitVec 32)) SeekEntryResult!168)

(assert (=> b!40744 (= e!25835 (seekKeyOrZeroReturnVacant!0 (x!7715 lt!15774) (index!2796 lt!15774) (index!2796 lt!15774) (select (arr!1232 lt!15397) #b00000000000000000000000000000000) lt!15397 mask!853))))

(declare-fun d!7105 () Bool)

(declare-fun lt!15773 () SeekEntryResult!168)

(assert (=> d!7105 (and (or ((_ is Undefined!168) lt!15773) (not ((_ is Found!168) lt!15773)) (and (bvsge (index!2795 lt!15773) #b00000000000000000000000000000000) (bvslt (index!2795 lt!15773) (size!1369 lt!15397)))) (or ((_ is Undefined!168) lt!15773) ((_ is Found!168) lt!15773) (not ((_ is MissingZero!168) lt!15773)) (and (bvsge (index!2794 lt!15773) #b00000000000000000000000000000000) (bvslt (index!2794 lt!15773) (size!1369 lt!15397)))) (or ((_ is Undefined!168) lt!15773) ((_ is Found!168) lt!15773) ((_ is MissingZero!168) lt!15773) (not ((_ is MissingVacant!168) lt!15773)) (and (bvsge (index!2797 lt!15773) #b00000000000000000000000000000000) (bvslt (index!2797 lt!15773) (size!1369 lt!15397)))) (or ((_ is Undefined!168) lt!15773) (ite ((_ is Found!168) lt!15773) (= (select (arr!1232 lt!15397) (index!2795 lt!15773)) (select (arr!1232 lt!15397) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!168) lt!15773) (= (select (arr!1232 lt!15397) (index!2794 lt!15773)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!168) lt!15773) (= (select (arr!1232 lt!15397) (index!2797 lt!15773)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!7105 (= lt!15773 e!25836)))

(declare-fun c!5019 () Bool)

(assert (=> d!7105 (= c!5019 (and ((_ is Intermediate!168) lt!15774) (undefined!980 lt!15774)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2577 (_ BitVec 32)) SeekEntryResult!168)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!7105 (= lt!15774 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) mask!853) (select (arr!1232 lt!15397) #b00000000000000000000000000000000) lt!15397 mask!853))))

(assert (=> d!7105 (validMask!0 mask!853)))

(assert (=> d!7105 (= (seekEntryOrOpen!0 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) lt!15397 mask!853) lt!15773)))

(declare-fun b!40745 () Bool)

(declare-fun c!5020 () Bool)

(assert (=> b!40745 (= c!5020 (= lt!15775 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!40745 (= e!25834 e!25835)))

(declare-fun b!40746 () Bool)

(assert (=> b!40746 (= e!25834 (Found!168 (index!2796 lt!15774)))))

(declare-fun b!40747 () Bool)

(assert (=> b!40747 (= e!25835 (MissingZero!168 (index!2796 lt!15774)))))

(assert (= (and d!7105 c!5019) b!40743))

(assert (= (and d!7105 (not c!5019)) b!40742))

(assert (= (and b!40742 c!5018) b!40746))

(assert (= (and b!40742 (not c!5018)) b!40745))

(assert (= (and b!40745 c!5020) b!40747))

(assert (= (and b!40745 (not c!5020)) b!40744))

(declare-fun m!33563 () Bool)

(assert (=> b!40742 m!33563))

(assert (=> b!40744 m!33183))

(declare-fun m!33565 () Bool)

(assert (=> b!40744 m!33565))

(assert (=> d!7105 m!33055))

(declare-fun m!33567 () Bool)

(assert (=> d!7105 m!33567))

(declare-fun m!33569 () Bool)

(assert (=> d!7105 m!33569))

(assert (=> d!7105 m!33183))

(declare-fun m!33571 () Bool)

(assert (=> d!7105 m!33571))

(assert (=> d!7105 m!33571))

(assert (=> d!7105 m!33183))

(declare-fun m!33573 () Bool)

(assert (=> d!7105 m!33573))

(declare-fun m!33575 () Bool)

(assert (=> d!7105 m!33575))

(assert (=> b!40306 d!7105))

(assert (=> b!40329 d!7033))

(check-sat (not b!40416) (not b!40409) (not d!7083) (not d!7035) (not bm!3114) (not b!40400) (not d!7095) (not d!7055) (not b!40639) (not bm!3113) (not b!40374) (not b_lambda!2067) (not b!40607) (not b!40695) (not b!40423) (not b!40406) (not b!40421) (not b!40414) (not b_lambda!2071) (not b!40744) (not bm!3155) (not b!40435) (not b!40613) (not d!7065) (not d!7099) (not bm!3154) (not bm!3115) (not b!40418) (not b!40595) (not d!7089) (not b!40608) (not bm!3159) (not bm!3163) (not b!40461) (not bm!3109) (not b!40602) (not b!40599) (not b_next!1363) (not b!40603) (not b!40419) b_and!2369 (not b!40606) (not b!40432) tp_is_empty!1753 (not bm!3158) (not b!40462) (not bm!3111) (not d!7105))
(check-sat b_and!2369 (not b_next!1363))
(get-model)

(declare-fun b!40785 () Bool)

(declare-fun e!25865 () Bool)

(declare-fun e!25861 () Bool)

(assert (=> b!40785 (= e!25865 e!25861)))

(declare-fun c!5035 () Bool)

(declare-fun e!25863 () Bool)

(assert (=> b!40785 (= c!5035 e!25863)))

(declare-fun res!24305 () Bool)

(assert (=> b!40785 (=> (not res!24305) (not e!25863))))

(assert (=> b!40785 (= res!24305 (bvslt #b00000000000000000000000000000000 (size!1369 (_keys!3292 lt!15398))))))

(declare-fun d!7115 () Bool)

(assert (=> d!7115 e!25865))

(declare-fun res!24304 () Bool)

(assert (=> d!7115 (=> (not res!24304) (not e!25865))))

(declare-fun lt!15810 () ListLongMap!1037)

(assert (=> d!7115 (= res!24304 (not (contains!506 lt!15810 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!25864 () ListLongMap!1037)

(assert (=> d!7115 (= lt!15810 e!25864)))

(declare-fun c!5033 () Bool)

(assert (=> d!7115 (= c!5033 (bvsge #b00000000000000000000000000000000 (size!1369 (_keys!3292 lt!15398))))))

(assert (=> d!7115 (validMask!0 (mask!5176 lt!15398))))

(assert (=> d!7115 (= (getCurrentListMapNoExtraKeys!34 (_keys!3292 lt!15398) (_values!1786 lt!15398) (mask!5176 lt!15398) (extraKeys!1694 lt!15398) (zeroValue!1721 lt!15398) (minValue!1721 lt!15398) #b00000000000000000000000000000000 (defaultEntry!1803 lt!15398)) lt!15810)))

(declare-fun b!40786 () Bool)

(declare-fun e!25866 () Bool)

(declare-fun isEmpty!236 (ListLongMap!1037) Bool)

(assert (=> b!40786 (= e!25866 (isEmpty!236 lt!15810))))

(declare-fun b!40787 () Bool)

(declare-fun e!25860 () ListLongMap!1037)

(declare-fun call!3196 () ListLongMap!1037)

(assert (=> b!40787 (= e!25860 call!3196)))

(declare-fun b!40788 () Bool)

(declare-fun res!24307 () Bool)

(assert (=> b!40788 (=> (not res!24307) (not e!25865))))

(assert (=> b!40788 (= res!24307 (not (contains!506 lt!15810 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!40789 () Bool)

(declare-fun e!25862 () Bool)

(assert (=> b!40789 (= e!25861 e!25862)))

(assert (=> b!40789 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1369 (_keys!3292 lt!15398))))))

(declare-fun res!24306 () Bool)

(assert (=> b!40789 (= res!24306 (contains!506 lt!15810 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)))))

(assert (=> b!40789 (=> (not res!24306) (not e!25862))))

(declare-fun b!40790 () Bool)

(assert (=> b!40790 (= e!25861 e!25866)))

(declare-fun c!5036 () Bool)

(assert (=> b!40790 (= c!5036 (bvslt #b00000000000000000000000000000000 (size!1369 (_keys!3292 lt!15398))))))

(declare-fun b!40791 () Bool)

(assert (=> b!40791 (= e!25864 e!25860)))

(declare-fun c!5034 () Bool)

(assert (=> b!40791 (= c!5034 (validKeyInArray!0 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)))))

(declare-fun b!40792 () Bool)

(assert (=> b!40792 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1369 (_keys!3292 lt!15398))))))

(assert (=> b!40792 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1370 (_values!1786 lt!15398))))))

(assert (=> b!40792 (= e!25862 (= (apply!56 lt!15810 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)) (get!702 (select (arr!1233 (_values!1786 lt!15398)) #b00000000000000000000000000000000) (dynLambda!186 (defaultEntry!1803 lt!15398) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!3193 () Bool)

(assert (=> bm!3193 (= call!3196 (getCurrentListMapNoExtraKeys!34 (_keys!3292 lt!15398) (_values!1786 lt!15398) (mask!5176 lt!15398) (extraKeys!1694 lt!15398) (zeroValue!1721 lt!15398) (minValue!1721 lt!15398) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1803 lt!15398)))))

(declare-fun b!40793 () Bool)

(assert (=> b!40793 (= e!25863 (validKeyInArray!0 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)))))

(assert (=> b!40793 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!40794 () Bool)

(assert (=> b!40794 (= e!25866 (= lt!15810 (getCurrentListMapNoExtraKeys!34 (_keys!3292 lt!15398) (_values!1786 lt!15398) (mask!5176 lt!15398) (extraKeys!1694 lt!15398) (zeroValue!1721 lt!15398) (minValue!1721 lt!15398) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1803 lt!15398))))))

(declare-fun b!40795 () Bool)

(assert (=> b!40795 (= e!25864 (ListLongMap!1038 Nil!1035))))

(declare-fun b!40796 () Bool)

(declare-fun lt!15809 () Unit!992)

(declare-fun lt!15807 () Unit!992)

(assert (=> b!40796 (= lt!15809 lt!15807)))

(declare-fun lt!15808 () (_ BitVec 64))

(declare-fun lt!15806 () ListLongMap!1037)

(declare-fun lt!15811 () (_ BitVec 64))

(declare-fun lt!15805 () V!2097)

(assert (=> b!40796 (not (contains!506 (+!64 lt!15806 (tuple2!1467 lt!15811 lt!15805)) lt!15808))))

(declare-fun addStillNotContains!7 (ListLongMap!1037 (_ BitVec 64) V!2097 (_ BitVec 64)) Unit!992)

(assert (=> b!40796 (= lt!15807 (addStillNotContains!7 lt!15806 lt!15811 lt!15805 lt!15808))))

(assert (=> b!40796 (= lt!15808 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!40796 (= lt!15805 (get!702 (select (arr!1233 (_values!1786 lt!15398)) #b00000000000000000000000000000000) (dynLambda!186 (defaultEntry!1803 lt!15398) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!40796 (= lt!15811 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000))))

(assert (=> b!40796 (= lt!15806 call!3196)))

(assert (=> b!40796 (= e!25860 (+!64 call!3196 (tuple2!1467 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000) (get!702 (select (arr!1233 (_values!1786 lt!15398)) #b00000000000000000000000000000000) (dynLambda!186 (defaultEntry!1803 lt!15398) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!7115 c!5033) b!40795))

(assert (= (and d!7115 (not c!5033)) b!40791))

(assert (= (and b!40791 c!5034) b!40796))

(assert (= (and b!40791 (not c!5034)) b!40787))

(assert (= (or b!40796 b!40787) bm!3193))

(assert (= (and d!7115 res!24304) b!40788))

(assert (= (and b!40788 res!24307) b!40785))

(assert (= (and b!40785 res!24305) b!40793))

(assert (= (and b!40785 c!5035) b!40789))

(assert (= (and b!40785 (not c!5035)) b!40790))

(assert (= (and b!40789 res!24306) b!40792))

(assert (= (and b!40790 c!5036) b!40794))

(assert (= (and b!40790 (not c!5036)) b!40786))

(declare-fun b_lambda!2075 () Bool)

(assert (=> (not b_lambda!2075) (not b!40792)))

(assert (=> b!40792 t!3904))

(declare-fun b_and!2373 () Bool)

(assert (= b_and!2369 (and (=> t!3904 result!1449) b_and!2373)))

(declare-fun b_lambda!2077 () Bool)

(assert (=> (not b_lambda!2077) (not b!40796)))

(assert (=> b!40796 t!3904))

(declare-fun b_and!2375 () Bool)

(assert (= b_and!2373 (and (=> t!3904 result!1449) b_and!2375)))

(assert (=> b!40796 m!33439))

(declare-fun m!33603 () Bool)

(assert (=> b!40796 m!33603))

(declare-fun m!33605 () Bool)

(assert (=> b!40796 m!33605))

(assert (=> b!40796 m!33441))

(declare-fun m!33609 () Bool)

(assert (=> b!40796 m!33609))

(assert (=> b!40796 m!33605))

(declare-fun m!33611 () Bool)

(assert (=> b!40796 m!33611))

(assert (=> b!40796 m!33261))

(assert (=> b!40796 m!33439))

(assert (=> b!40796 m!33441))

(assert (=> b!40796 m!33443))

(declare-fun m!33613 () Bool)

(assert (=> b!40794 m!33613))

(assert (=> b!40791 m!33261))

(assert (=> b!40791 m!33261))

(assert (=> b!40791 m!33275))

(assert (=> b!40789 m!33261))

(assert (=> b!40789 m!33261))

(declare-fun m!33615 () Bool)

(assert (=> b!40789 m!33615))

(assert (=> bm!3193 m!33613))

(declare-fun m!33617 () Bool)

(assert (=> d!7115 m!33617))

(assert (=> d!7115 m!33319))

(assert (=> b!40792 m!33439))

(assert (=> b!40792 m!33441))

(assert (=> b!40792 m!33261))

(declare-fun m!33619 () Bool)

(assert (=> b!40792 m!33619))

(assert (=> b!40792 m!33261))

(assert (=> b!40792 m!33439))

(assert (=> b!40792 m!33441))

(assert (=> b!40792 m!33443))

(declare-fun m!33621 () Bool)

(assert (=> b!40786 m!33621))

(assert (=> b!40793 m!33261))

(assert (=> b!40793 m!33261))

(assert (=> b!40793 m!33275))

(declare-fun m!33623 () Bool)

(assert (=> b!40788 m!33623))

(assert (=> bm!3159 d!7115))

(declare-fun d!7125 () Bool)

(assert (=> d!7125 (= (validKeyInArray!0 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!40599 d!7125))

(declare-fun d!7127 () Bool)

(assert (=> d!7127 (= (size!1389 lt!15398) (bvadd (_size!168 lt!15398) (bvsdiv (bvadd (extraKeys!1694 lt!15398) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!40462 d!7127))

(declare-fun b!40802 () Bool)

(declare-fun e!25871 () Bool)

(declare-fun e!25873 () Bool)

(assert (=> b!40802 (= e!25871 e!25873)))

(declare-fun lt!15812 () (_ BitVec 64))

(assert (=> b!40802 (= lt!15812 (select (arr!1232 (_keys!3292 lt!15398)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!15813 () Unit!992)

(assert (=> b!40802 (= lt!15813 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3292 lt!15398) lt!15812 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!40802 (arrayContainsKey!0 (_keys!3292 lt!15398) lt!15812 #b00000000000000000000000000000000)))

(declare-fun lt!15814 () Unit!992)

(assert (=> b!40802 (= lt!15814 lt!15813)))

(declare-fun res!24311 () Bool)

(assert (=> b!40802 (= res!24311 (= (seekEntryOrOpen!0 (select (arr!1232 (_keys!3292 lt!15398)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3292 lt!15398) (mask!5176 lt!15398)) (Found!168 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!40802 (=> (not res!24311) (not e!25873))))

(declare-fun bm!3195 () Bool)

(declare-fun call!3198 () Bool)

(assert (=> bm!3195 (= call!3198 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3292 lt!15398) (mask!5176 lt!15398)))))

(declare-fun b!40803 () Bool)

(assert (=> b!40803 (= e!25873 call!3198)))

(declare-fun b!40804 () Bool)

(assert (=> b!40804 (= e!25871 call!3198)))

(declare-fun d!7129 () Bool)

(declare-fun res!24312 () Bool)

(declare-fun e!25872 () Bool)

(assert (=> d!7129 (=> res!24312 e!25872)))

(assert (=> d!7129 (= res!24312 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1369 (_keys!3292 lt!15398))))))

(assert (=> d!7129 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3292 lt!15398) (mask!5176 lt!15398)) e!25872)))

(declare-fun b!40805 () Bool)

(assert (=> b!40805 (= e!25872 e!25871)))

(declare-fun c!5038 () Bool)

(assert (=> b!40805 (= c!5038 (validKeyInArray!0 (select (arr!1232 (_keys!3292 lt!15398)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!7129 (not res!24312)) b!40805))

(assert (= (and b!40805 c!5038) b!40802))

(assert (= (and b!40805 (not c!5038)) b!40804))

(assert (= (and b!40802 res!24311) b!40803))

(assert (= (or b!40803 b!40804) bm!3195))

(declare-fun m!33625 () Bool)

(assert (=> b!40802 m!33625))

(declare-fun m!33627 () Bool)

(assert (=> b!40802 m!33627))

(declare-fun m!33629 () Bool)

(assert (=> b!40802 m!33629))

(assert (=> b!40802 m!33625))

(declare-fun m!33631 () Bool)

(assert (=> b!40802 m!33631))

(declare-fun m!33633 () Bool)

(assert (=> bm!3195 m!33633))

(assert (=> b!40805 m!33625))

(assert (=> b!40805 m!33625))

(declare-fun m!33635 () Bool)

(assert (=> b!40805 m!33635))

(assert (=> bm!3111 d!7129))

(declare-fun d!7131 () Bool)

(assert (=> d!7131 (= (content!31 Nil!1036) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!7035 d!7131))

(declare-fun b!40828 () Bool)

(declare-fun lt!15821 () SeekEntryResult!168)

(assert (=> b!40828 (and (bvsge (index!2796 lt!15821) #b00000000000000000000000000000000) (bvslt (index!2796 lt!15821) (size!1369 lt!15397)))))

(declare-fun res!24321 () Bool)

(assert (=> b!40828 (= res!24321 (= (select (arr!1232 lt!15397) (index!2796 lt!15821)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25889 () Bool)

(assert (=> b!40828 (=> res!24321 e!25889)))

(declare-fun d!7133 () Bool)

(declare-fun e!25887 () Bool)

(assert (=> d!7133 e!25887))

(declare-fun c!5047 () Bool)

(assert (=> d!7133 (= c!5047 (and ((_ is Intermediate!168) lt!15821) (undefined!980 lt!15821)))))

(declare-fun e!25890 () SeekEntryResult!168)

(assert (=> d!7133 (= lt!15821 e!25890)))

(declare-fun c!5048 () Bool)

(assert (=> d!7133 (= c!5048 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!15822 () (_ BitVec 64))

(assert (=> d!7133 (= lt!15822 (select (arr!1232 lt!15397) (toIndex!0 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) mask!853)))))

(assert (=> d!7133 (validMask!0 mask!853)))

(assert (=> d!7133 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) mask!853) (select (arr!1232 lt!15397) #b00000000000000000000000000000000) lt!15397 mask!853) lt!15821)))

(declare-fun b!40829 () Bool)

(declare-fun e!25886 () Bool)

(assert (=> b!40829 (= e!25887 e!25886)))

(declare-fun res!24319 () Bool)

(assert (=> b!40829 (= res!24319 (and ((_ is Intermediate!168) lt!15821) (not (undefined!980 lt!15821)) (bvslt (x!7715 lt!15821) #b01111111111111111111111111111110) (bvsge (x!7715 lt!15821) #b00000000000000000000000000000000) (bvsge (x!7715 lt!15821) #b00000000000000000000000000000000)))))

(assert (=> b!40829 (=> (not res!24319) (not e!25886))))

(declare-fun b!40830 () Bool)

(assert (=> b!40830 (and (bvsge (index!2796 lt!15821) #b00000000000000000000000000000000) (bvslt (index!2796 lt!15821) (size!1369 lt!15397)))))

(assert (=> b!40830 (= e!25889 (= (select (arr!1232 lt!15397) (index!2796 lt!15821)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!40831 () Bool)

(declare-fun e!25888 () SeekEntryResult!168)

(assert (=> b!40831 (= e!25888 (Intermediate!168 false (toIndex!0 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun b!40832 () Bool)

(assert (=> b!40832 (and (bvsge (index!2796 lt!15821) #b00000000000000000000000000000000) (bvslt (index!2796 lt!15821) (size!1369 lt!15397)))))

(declare-fun res!24320 () Bool)

(assert (=> b!40832 (= res!24320 (= (select (arr!1232 lt!15397) (index!2796 lt!15821)) (select (arr!1232 lt!15397) #b00000000000000000000000000000000)))))

(assert (=> b!40832 (=> res!24320 e!25889)))

(assert (=> b!40832 (= e!25886 e!25889)))

(declare-fun b!40833 () Bool)

(assert (=> b!40833 (= e!25890 e!25888)))

(declare-fun c!5049 () Bool)

(assert (=> b!40833 (= c!5049 (or (= lt!15822 (select (arr!1232 lt!15397) #b00000000000000000000000000000000)) (= (bvadd lt!15822 lt!15822) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!40834 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!40834 (= e!25888 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) mask!853) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!853) (select (arr!1232 lt!15397) #b00000000000000000000000000000000) lt!15397 mask!853))))

(declare-fun b!40835 () Bool)

(assert (=> b!40835 (= e!25890 (Intermediate!168 true (toIndex!0 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun b!40836 () Bool)

(assert (=> b!40836 (= e!25887 (bvsge (x!7715 lt!15821) #b01111111111111111111111111111110))))

(assert (= (and d!7133 c!5048) b!40835))

(assert (= (and d!7133 (not c!5048)) b!40833))

(assert (= (and b!40833 c!5049) b!40831))

(assert (= (and b!40833 (not c!5049)) b!40834))

(assert (= (and d!7133 c!5047) b!40836))

(assert (= (and d!7133 (not c!5047)) b!40829))

(assert (= (and b!40829 res!24319) b!40832))

(assert (= (and b!40832 (not res!24320)) b!40828))

(assert (= (and b!40828 (not res!24321)) b!40830))

(assert (=> b!40834 m!33571))

(declare-fun m!33637 () Bool)

(assert (=> b!40834 m!33637))

(assert (=> b!40834 m!33637))

(assert (=> b!40834 m!33183))

(declare-fun m!33639 () Bool)

(assert (=> b!40834 m!33639))

(declare-fun m!33641 () Bool)

(assert (=> b!40832 m!33641))

(assert (=> b!40830 m!33641))

(assert (=> b!40828 m!33641))

(assert (=> d!7133 m!33571))

(declare-fun m!33643 () Bool)

(assert (=> d!7133 m!33643))

(assert (=> d!7133 m!33055))

(assert (=> d!7105 d!7133))

(declare-fun d!7135 () Bool)

(declare-fun lt!15840 () (_ BitVec 32))

(declare-fun lt!15839 () (_ BitVec 32))

(assert (=> d!7135 (= lt!15840 (bvmul (bvxor lt!15839 (bvlshr lt!15839 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!7135 (= lt!15839 ((_ extract 31 0) (bvand (bvxor (select (arr!1232 lt!15397) #b00000000000000000000000000000000) (bvlshr (select (arr!1232 lt!15397) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!7135 (and (bvsge mask!853 #b00000000000000000000000000000000) (let ((res!24322 (let ((h!1614 ((_ extract 31 0) (bvand (bvxor (select (arr!1232 lt!15397) #b00000000000000000000000000000000) (bvlshr (select (arr!1232 lt!15397) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!7735 (bvmul (bvxor h!1614 (bvlshr h!1614 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!7735 (bvlshr x!7735 #b00000000000000000000000000001101)) mask!853))))) (and (bvslt res!24322 (bvadd mask!853 #b00000000000000000000000000000001)) (bvsge res!24322 #b00000000000000000000000000000000))))))

(assert (=> d!7135 (= (toIndex!0 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) mask!853) (bvand (bvxor lt!15840 (bvlshr lt!15840 #b00000000000000000000000000001101)) mask!853))))

(assert (=> d!7105 d!7135))

(assert (=> d!7105 d!6975))

(declare-fun d!7137 () Bool)

(assert (=> d!7137 (= (validKeyInArray!0 (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!40435 d!7137))

(declare-fun d!7139 () Bool)

(declare-fun res!24331 () Bool)

(declare-fun e!25903 () Bool)

(assert (=> d!7139 (=> res!24331 e!25903)))

(assert (=> d!7139 (= res!24331 (= (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15497))))

(assert (=> d!7139 (= (arrayContainsKey!0 lt!15397 lt!15497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!25903)))

(declare-fun b!40857 () Bool)

(declare-fun e!25904 () Bool)

(assert (=> b!40857 (= e!25903 e!25904)))

(declare-fun res!24332 () Bool)

(assert (=> b!40857 (=> (not res!24332) (not e!25904))))

(assert (=> b!40857 (= res!24332 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1369 lt!15397)))))

(declare-fun b!40858 () Bool)

(assert (=> b!40858 (= e!25904 (arrayContainsKey!0 lt!15397 lt!15497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!7139 (not res!24331)) b!40857))

(assert (= (and b!40857 res!24332) b!40858))

(assert (=> d!7139 m!33227))

(declare-fun m!33645 () Bool)

(assert (=> b!40858 m!33645))

(assert (=> b!40695 d!7139))

(declare-fun d!7141 () Bool)

(declare-fun e!25919 () Bool)

(assert (=> d!7141 e!25919))

(declare-fun res!24339 () Bool)

(assert (=> d!7141 (=> res!24339 e!25919)))

(declare-fun lt!15860 () Bool)

(assert (=> d!7141 (= res!24339 (not lt!15860))))

(declare-fun lt!15859 () Bool)

(assert (=> d!7141 (= lt!15860 lt!15859)))

(declare-fun lt!15857 () Unit!992)

(declare-fun e!25918 () Unit!992)

(assert (=> d!7141 (= lt!15857 e!25918)))

(declare-fun c!5064 () Bool)

(assert (=> d!7141 (= c!5064 lt!15859)))

(declare-fun containsKey!70 (List!1038 (_ BitVec 64)) Bool)

(assert (=> d!7141 (= lt!15859 (containsKey!70 (toList!534 lt!15679) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7141 (= (contains!506 lt!15679 #b1000000000000000000000000000000000000000000000000000000000000000) lt!15860)))

(declare-fun b!40881 () Bool)

(declare-fun lt!15858 () Unit!992)

(assert (=> b!40881 (= e!25918 lt!15858)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!58 (List!1038 (_ BitVec 64)) Unit!992)

(assert (=> b!40881 (= lt!15858 (lemmaContainsKeyImpliesGetValueByKeyDefined!58 (toList!534 lt!15679) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!109 0))(
  ( (Some!108 (v!2001 V!2097)) (None!107) )
))
(declare-fun isDefined!59 (Option!109) Bool)

(declare-fun getValueByKey!103 (List!1038 (_ BitVec 64)) Option!109)

(assert (=> b!40881 (isDefined!59 (getValueByKey!103 (toList!534 lt!15679) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!40882 () Bool)

(declare-fun Unit!1002 () Unit!992)

(assert (=> b!40882 (= e!25918 Unit!1002)))

(declare-fun b!40883 () Bool)

(assert (=> b!40883 (= e!25919 (isDefined!59 (getValueByKey!103 (toList!534 lt!15679) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!7141 c!5064) b!40881))

(assert (= (and d!7141 (not c!5064)) b!40882))

(assert (= (and d!7141 (not res!24339)) b!40883))

(declare-fun m!33671 () Bool)

(assert (=> d!7141 m!33671))

(declare-fun m!33675 () Bool)

(assert (=> b!40881 m!33675))

(declare-fun m!33677 () Bool)

(assert (=> b!40881 m!33677))

(assert (=> b!40881 m!33677))

(declare-fun m!33679 () Bool)

(assert (=> b!40881 m!33679))

(assert (=> b!40883 m!33677))

(assert (=> b!40883 m!33677))

(assert (=> b!40883 m!33679))

(assert (=> bm!3158 d!7141))

(declare-fun d!7149 () Bool)

(declare-fun e!25924 () Bool)

(assert (=> d!7149 e!25924))

(declare-fun res!24345 () Bool)

(assert (=> d!7149 (=> (not res!24345) (not e!25924))))

(declare-fun lt!15875 () ListLongMap!1037)

(assert (=> d!7149 (= res!24345 (contains!506 lt!15875 (_1!744 (ite (or c!4977 c!4981) (tuple2!1467 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15398)) (tuple2!1467 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15398))))))))

(declare-fun lt!15873 () List!1038)

(assert (=> d!7149 (= lt!15875 (ListLongMap!1038 lt!15873))))

(declare-fun lt!15876 () Unit!992)

(declare-fun lt!15874 () Unit!992)

(assert (=> d!7149 (= lt!15876 lt!15874)))

(assert (=> d!7149 (= (getValueByKey!103 lt!15873 (_1!744 (ite (or c!4977 c!4981) (tuple2!1467 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15398)) (tuple2!1467 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15398))))) (Some!108 (_2!744 (ite (or c!4977 c!4981) (tuple2!1467 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15398)) (tuple2!1467 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15398))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!26 (List!1038 (_ BitVec 64) V!2097) Unit!992)

(assert (=> d!7149 (= lt!15874 (lemmaContainsTupThenGetReturnValue!26 lt!15873 (_1!744 (ite (or c!4977 c!4981) (tuple2!1467 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15398)) (tuple2!1467 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15398)))) (_2!744 (ite (or c!4977 c!4981) (tuple2!1467 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15398)) (tuple2!1467 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15398))))))))

(declare-fun insertStrictlySorted!23 (List!1038 (_ BitVec 64) V!2097) List!1038)

(assert (=> d!7149 (= lt!15873 (insertStrictlySorted!23 (toList!534 (ite c!4977 call!3156 (ite c!4981 call!3162 call!3158))) (_1!744 (ite (or c!4977 c!4981) (tuple2!1467 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15398)) (tuple2!1467 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15398)))) (_2!744 (ite (or c!4977 c!4981) (tuple2!1467 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15398)) (tuple2!1467 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15398))))))))

(assert (=> d!7149 (= (+!64 (ite c!4977 call!3156 (ite c!4981 call!3162 call!3158)) (ite (or c!4977 c!4981) (tuple2!1467 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15398)) (tuple2!1467 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15398)))) lt!15875)))

(declare-fun b!40891 () Bool)

(declare-fun res!24346 () Bool)

(assert (=> b!40891 (=> (not res!24346) (not e!25924))))

(assert (=> b!40891 (= res!24346 (= (getValueByKey!103 (toList!534 lt!15875) (_1!744 (ite (or c!4977 c!4981) (tuple2!1467 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15398)) (tuple2!1467 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15398))))) (Some!108 (_2!744 (ite (or c!4977 c!4981) (tuple2!1467 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15398)) (tuple2!1467 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15398)))))))))

(declare-fun b!40892 () Bool)

(declare-fun contains!508 (List!1038 tuple2!1466) Bool)

(assert (=> b!40892 (= e!25924 (contains!508 (toList!534 lt!15875) (ite (or c!4977 c!4981) (tuple2!1467 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15398)) (tuple2!1467 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15398)))))))

(assert (= (and d!7149 res!24345) b!40891))

(assert (= (and b!40891 res!24346) b!40892))

(declare-fun m!33687 () Bool)

(assert (=> d!7149 m!33687))

(declare-fun m!33689 () Bool)

(assert (=> d!7149 m!33689))

(declare-fun m!33691 () Bool)

(assert (=> d!7149 m!33691))

(declare-fun m!33693 () Bool)

(assert (=> d!7149 m!33693))

(declare-fun m!33695 () Bool)

(assert (=> b!40891 m!33695))

(declare-fun m!33697 () Bool)

(assert (=> b!40892 m!33697))

(assert (=> bm!3154 d!7149))

(assert (=> b!40461 d!7127))

(declare-fun d!7159 () Bool)

(assert (=> d!7159 (arrayContainsKey!0 (_keys!3292 lt!15398) lt!15525 #b00000000000000000000000000000000)))

(declare-fun lt!15877 () Unit!992)

(assert (=> d!7159 (= lt!15877 (choose!13 (_keys!3292 lt!15398) lt!15525 #b00000000000000000000000000000000))))

(assert (=> d!7159 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!7159 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3292 lt!15398) lt!15525 #b00000000000000000000000000000000) lt!15877)))

(declare-fun bs!1718 () Bool)

(assert (= bs!1718 d!7159))

(assert (=> bs!1718 m!33267))

(declare-fun m!33699 () Bool)

(assert (=> bs!1718 m!33699))

(assert (=> b!40406 d!7159))

(declare-fun d!7161 () Bool)

(declare-fun res!24347 () Bool)

(declare-fun e!25925 () Bool)

(assert (=> d!7161 (=> res!24347 e!25925)))

(assert (=> d!7161 (= res!24347 (= (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000) lt!15525))))

(assert (=> d!7161 (= (arrayContainsKey!0 (_keys!3292 lt!15398) lt!15525 #b00000000000000000000000000000000) e!25925)))

(declare-fun b!40893 () Bool)

(declare-fun e!25926 () Bool)

(assert (=> b!40893 (= e!25925 e!25926)))

(declare-fun res!24348 () Bool)

(assert (=> b!40893 (=> (not res!24348) (not e!25926))))

(assert (=> b!40893 (= res!24348 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1369 (_keys!3292 lt!15398))))))

(declare-fun b!40894 () Bool)

(assert (=> b!40894 (= e!25926 (arrayContainsKey!0 (_keys!3292 lt!15398) lt!15525 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!7161 (not res!24347)) b!40893))

(assert (= (and b!40893 res!24348) b!40894))

(assert (=> d!7161 m!33261))

(declare-fun m!33701 () Bool)

(assert (=> b!40894 m!33701))

(assert (=> b!40406 d!7161))

(declare-fun b!40895 () Bool)

(declare-fun e!25929 () SeekEntryResult!168)

(declare-fun e!25927 () SeekEntryResult!168)

(assert (=> b!40895 (= e!25929 e!25927)))

(declare-fun lt!15880 () (_ BitVec 64))

(declare-fun lt!15879 () SeekEntryResult!168)

(assert (=> b!40895 (= lt!15880 (select (arr!1232 (_keys!3292 lt!15398)) (index!2796 lt!15879)))))

(declare-fun c!5066 () Bool)

(assert (=> b!40895 (= c!5066 (= lt!15880 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)))))

(declare-fun b!40896 () Bool)

(assert (=> b!40896 (= e!25929 Undefined!168)))

(declare-fun b!40897 () Bool)

(declare-fun e!25928 () SeekEntryResult!168)

(assert (=> b!40897 (= e!25928 (seekKeyOrZeroReturnVacant!0 (x!7715 lt!15879) (index!2796 lt!15879) (index!2796 lt!15879) (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000) (_keys!3292 lt!15398) (mask!5176 lt!15398)))))

(declare-fun d!7163 () Bool)

(declare-fun lt!15878 () SeekEntryResult!168)

(assert (=> d!7163 (and (or ((_ is Undefined!168) lt!15878) (not ((_ is Found!168) lt!15878)) (and (bvsge (index!2795 lt!15878) #b00000000000000000000000000000000) (bvslt (index!2795 lt!15878) (size!1369 (_keys!3292 lt!15398))))) (or ((_ is Undefined!168) lt!15878) ((_ is Found!168) lt!15878) (not ((_ is MissingZero!168) lt!15878)) (and (bvsge (index!2794 lt!15878) #b00000000000000000000000000000000) (bvslt (index!2794 lt!15878) (size!1369 (_keys!3292 lt!15398))))) (or ((_ is Undefined!168) lt!15878) ((_ is Found!168) lt!15878) ((_ is MissingZero!168) lt!15878) (not ((_ is MissingVacant!168) lt!15878)) (and (bvsge (index!2797 lt!15878) #b00000000000000000000000000000000) (bvslt (index!2797 lt!15878) (size!1369 (_keys!3292 lt!15398))))) (or ((_ is Undefined!168) lt!15878) (ite ((_ is Found!168) lt!15878) (= (select (arr!1232 (_keys!3292 lt!15398)) (index!2795 lt!15878)) (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!168) lt!15878) (= (select (arr!1232 (_keys!3292 lt!15398)) (index!2794 lt!15878)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!168) lt!15878) (= (select (arr!1232 (_keys!3292 lt!15398)) (index!2797 lt!15878)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!7163 (= lt!15878 e!25929)))

(declare-fun c!5067 () Bool)

(assert (=> d!7163 (= c!5067 (and ((_ is Intermediate!168) lt!15879) (undefined!980 lt!15879)))))

(assert (=> d!7163 (= lt!15879 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000) (mask!5176 lt!15398)) (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000) (_keys!3292 lt!15398) (mask!5176 lt!15398)))))

(assert (=> d!7163 (validMask!0 (mask!5176 lt!15398))))

(assert (=> d!7163 (= (seekEntryOrOpen!0 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000) (_keys!3292 lt!15398) (mask!5176 lt!15398)) lt!15878)))

(declare-fun b!40898 () Bool)

(declare-fun c!5068 () Bool)

(assert (=> b!40898 (= c!5068 (= lt!15880 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!40898 (= e!25927 e!25928)))

(declare-fun b!40899 () Bool)

(assert (=> b!40899 (= e!25927 (Found!168 (index!2796 lt!15879)))))

(declare-fun b!40900 () Bool)

(assert (=> b!40900 (= e!25928 (MissingZero!168 (index!2796 lt!15879)))))

(assert (= (and d!7163 c!5067) b!40896))

(assert (= (and d!7163 (not c!5067)) b!40895))

(assert (= (and b!40895 c!5066) b!40899))

(assert (= (and b!40895 (not c!5066)) b!40898))

(assert (= (and b!40898 c!5068) b!40900))

(assert (= (and b!40898 (not c!5068)) b!40897))

(declare-fun m!33703 () Bool)

(assert (=> b!40895 m!33703))

(assert (=> b!40897 m!33261))

(declare-fun m!33705 () Bool)

(assert (=> b!40897 m!33705))

(assert (=> d!7163 m!33319))

(declare-fun m!33707 () Bool)

(assert (=> d!7163 m!33707))

(declare-fun m!33709 () Bool)

(assert (=> d!7163 m!33709))

(assert (=> d!7163 m!33261))

(declare-fun m!33711 () Bool)

(assert (=> d!7163 m!33711))

(assert (=> d!7163 m!33711))

(assert (=> d!7163 m!33261))

(declare-fun m!33713 () Bool)

(assert (=> d!7163 m!33713))

(declare-fun m!33715 () Bool)

(assert (=> d!7163 m!33715))

(assert (=> b!40406 d!7163))

(assert (=> b!40639 d!7125))

(declare-fun d!7165 () Bool)

(declare-fun get!704 (Option!109) V!2097)

(assert (=> d!7165 (= (apply!56 lt!15679 #b1000000000000000000000000000000000000000000000000000000000000000) (get!704 (getValueByKey!103 (toList!534 lt!15679) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1719 () Bool)

(assert (= bs!1719 d!7165))

(assert (=> bs!1719 m!33677))

(assert (=> bs!1719 m!33677))

(declare-fun m!33717 () Bool)

(assert (=> bs!1719 m!33717))

(assert (=> b!40595 d!7165))

(declare-fun b!40901 () Bool)

(declare-fun e!25930 () Bool)

(declare-fun e!25932 () Bool)

(assert (=> b!40901 (= e!25930 e!25932)))

(declare-fun lt!15881 () (_ BitVec 64))

(assert (=> b!40901 (= lt!15881 (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!15882 () Unit!992)

(assert (=> b!40901 (= lt!15882 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!15397 lt!15881 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!40901 (arrayContainsKey!0 lt!15397 lt!15881 #b00000000000000000000000000000000)))

(declare-fun lt!15883 () Unit!992)

(assert (=> b!40901 (= lt!15883 lt!15882)))

(declare-fun res!24349 () Bool)

(assert (=> b!40901 (= res!24349 (= (seekEntryOrOpen!0 (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!15397 mask!853) (Found!168 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!40901 (=> (not res!24349) (not e!25932))))

(declare-fun bm!3200 () Bool)

(declare-fun call!3203 () Bool)

(assert (=> bm!3200 (= call!3203 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!15397 mask!853))))

(declare-fun b!40902 () Bool)

(assert (=> b!40902 (= e!25932 call!3203)))

(declare-fun b!40903 () Bool)

(assert (=> b!40903 (= e!25930 call!3203)))

(declare-fun d!7167 () Bool)

(declare-fun res!24350 () Bool)

(declare-fun e!25931 () Bool)

(assert (=> d!7167 (=> res!24350 e!25931)))

(assert (=> d!7167 (= res!24350 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1369 lt!15397)))))

(assert (=> d!7167 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!15397 mask!853) e!25931)))

(declare-fun b!40904 () Bool)

(assert (=> b!40904 (= e!25931 e!25930)))

(declare-fun c!5069 () Bool)

(assert (=> b!40904 (= c!5069 (validKeyInArray!0 (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!7167 (not res!24350)) b!40904))

(assert (= (and b!40904 c!5069) b!40901))

(assert (= (and b!40904 (not c!5069)) b!40903))

(assert (= (and b!40901 res!24349) b!40902))

(assert (= (or b!40902 b!40903) bm!3200))

(declare-fun m!33719 () Bool)

(assert (=> b!40901 m!33719))

(declare-fun m!33721 () Bool)

(assert (=> b!40901 m!33721))

(declare-fun m!33723 () Bool)

(assert (=> b!40901 m!33723))

(assert (=> b!40901 m!33719))

(declare-fun m!33725 () Bool)

(assert (=> b!40901 m!33725))

(declare-fun m!33727 () Bool)

(assert (=> bm!3200 m!33727))

(assert (=> b!40904 m!33719))

(assert (=> b!40904 m!33719))

(declare-fun m!33729 () Bool)

(assert (=> b!40904 m!33729))

(assert (=> bm!3115 d!7167))

(declare-fun d!7169 () Bool)

(declare-fun lt!15884 () Bool)

(assert (=> d!7169 (= lt!15884 (select (content!31 (ite c!4909 (Cons!1035 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) Nil!1036) Nil!1036)) (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!25933 () Bool)

(assert (=> d!7169 (= lt!15884 e!25933)))

(declare-fun res!24352 () Bool)

(assert (=> d!7169 (=> (not res!24352) (not e!25933))))

(assert (=> d!7169 (= res!24352 ((_ is Cons!1035) (ite c!4909 (Cons!1035 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) Nil!1036) Nil!1036)))))

(assert (=> d!7169 (= (contains!504 (ite c!4909 (Cons!1035 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) Nil!1036) Nil!1036) (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!15884)))

(declare-fun b!40905 () Bool)

(declare-fun e!25934 () Bool)

(assert (=> b!40905 (= e!25933 e!25934)))

(declare-fun res!24351 () Bool)

(assert (=> b!40905 (=> res!24351 e!25934)))

(assert (=> b!40905 (= res!24351 (= (h!1609 (ite c!4909 (Cons!1035 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) Nil!1036) Nil!1036)) (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40906 () Bool)

(assert (=> b!40906 (= e!25934 (contains!504 (t!3892 (ite c!4909 (Cons!1035 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) Nil!1036) Nil!1036)) (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!7169 res!24352) b!40905))

(assert (= (and b!40905 (not res!24351)) b!40906))

(declare-fun m!33731 () Bool)

(assert (=> d!7169 m!33731))

(assert (=> d!7169 m!33227))

(declare-fun m!33733 () Bool)

(assert (=> d!7169 m!33733))

(assert (=> b!40906 m!33227))

(declare-fun m!33735 () Bool)

(assert (=> b!40906 m!33735))

(assert (=> b!40423 d!7169))

(declare-fun d!7171 () Bool)

(assert (=> d!7171 (= (apply!56 lt!15679 #b0000000000000000000000000000000000000000000000000000000000000000) (get!704 (getValueByKey!103 (toList!534 lt!15679) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1720 () Bool)

(assert (= bs!1720 d!7171))

(declare-fun m!33737 () Bool)

(assert (=> bs!1720 m!33737))

(assert (=> bs!1720 m!33737))

(declare-fun m!33739 () Bool)

(assert (=> bs!1720 m!33739))

(assert (=> b!40613 d!7171))

(declare-fun b!40946 () Bool)

(declare-fun e!25958 () SeekEntryResult!168)

(assert (=> b!40946 (= e!25958 Undefined!168)))

(declare-fun b!40947 () Bool)

(declare-fun e!25957 () SeekEntryResult!168)

(assert (=> b!40947 (= e!25958 e!25957)))

(declare-fun c!5085 () Bool)

(declare-fun lt!15900 () (_ BitVec 64))

(assert (=> b!40947 (= c!5085 (= lt!15900 (select (arr!1232 lt!15397) #b00000000000000000000000000000000)))))

(declare-fun b!40948 () Bool)

(declare-fun c!5086 () Bool)

(assert (=> b!40948 (= c!5086 (= lt!15900 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25956 () SeekEntryResult!168)

(assert (=> b!40948 (= e!25957 e!25956)))

(declare-fun b!40949 () Bool)

(assert (=> b!40949 (= e!25956 (MissingVacant!168 (index!2796 lt!15774)))))

(declare-fun d!7173 () Bool)

(declare-fun lt!15899 () SeekEntryResult!168)

(assert (=> d!7173 (and (or ((_ is Undefined!168) lt!15899) (not ((_ is Found!168) lt!15899)) (and (bvsge (index!2795 lt!15899) #b00000000000000000000000000000000) (bvslt (index!2795 lt!15899) (size!1369 lt!15397)))) (or ((_ is Undefined!168) lt!15899) ((_ is Found!168) lt!15899) (not ((_ is MissingVacant!168) lt!15899)) (not (= (index!2797 lt!15899) (index!2796 lt!15774))) (and (bvsge (index!2797 lt!15899) #b00000000000000000000000000000000) (bvslt (index!2797 lt!15899) (size!1369 lt!15397)))) (or ((_ is Undefined!168) lt!15899) (ite ((_ is Found!168) lt!15899) (= (select (arr!1232 lt!15397) (index!2795 lt!15899)) (select (arr!1232 lt!15397) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!168) lt!15899) (= (index!2797 lt!15899) (index!2796 lt!15774)) (= (select (arr!1232 lt!15397) (index!2797 lt!15899)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!7173 (= lt!15899 e!25958)))

(declare-fun c!5087 () Bool)

(assert (=> d!7173 (= c!5087 (bvsge (x!7715 lt!15774) #b01111111111111111111111111111110))))

(assert (=> d!7173 (= lt!15900 (select (arr!1232 lt!15397) (index!2796 lt!15774)))))

(assert (=> d!7173 (validMask!0 mask!853)))

(assert (=> d!7173 (= (seekKeyOrZeroReturnVacant!0 (x!7715 lt!15774) (index!2796 lt!15774) (index!2796 lt!15774) (select (arr!1232 lt!15397) #b00000000000000000000000000000000) lt!15397 mask!853) lt!15899)))

(declare-fun b!40950 () Bool)

(assert (=> b!40950 (= e!25957 (Found!168 (index!2796 lt!15774)))))

(declare-fun b!40951 () Bool)

(assert (=> b!40951 (= e!25956 (seekKeyOrZeroReturnVacant!0 (bvadd (x!7715 lt!15774) #b00000000000000000000000000000001) (nextIndex!0 (index!2796 lt!15774) (bvadd (x!7715 lt!15774) #b00000000000000000000000000000001) mask!853) (index!2796 lt!15774) (select (arr!1232 lt!15397) #b00000000000000000000000000000000) lt!15397 mask!853))))

(assert (= (and d!7173 c!5087) b!40946))

(assert (= (and d!7173 (not c!5087)) b!40947))

(assert (= (and b!40947 c!5085) b!40950))

(assert (= (and b!40947 (not c!5085)) b!40948))

(assert (= (and b!40948 c!5086) b!40949))

(assert (= (and b!40948 (not c!5086)) b!40951))

(declare-fun m!33749 () Bool)

(assert (=> d!7173 m!33749))

(declare-fun m!33751 () Bool)

(assert (=> d!7173 m!33751))

(assert (=> d!7173 m!33563))

(assert (=> d!7173 m!33055))

(declare-fun m!33753 () Bool)

(assert (=> b!40951 m!33753))

(assert (=> b!40951 m!33753))

(assert (=> b!40951 m!33183))

(declare-fun m!33755 () Bool)

(assert (=> b!40951 m!33755))

(assert (=> b!40744 d!7173))

(declare-fun d!7179 () Bool)

(assert (=> d!7179 (arrayContainsKey!0 lt!15397 lt!15529 #b00000000000000000000000000000000)))

(declare-fun lt!15903 () Unit!992)

(assert (=> d!7179 (= lt!15903 (choose!13 lt!15397 lt!15529 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!7179 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!7179 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!15397 lt!15529 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15903)))

(declare-fun bs!1721 () Bool)

(assert (= bs!1721 d!7179))

(assert (=> bs!1721 m!33289))

(declare-fun m!33757 () Bool)

(assert (=> bs!1721 m!33757))

(assert (=> b!40432 d!7179))

(declare-fun d!7181 () Bool)

(declare-fun res!24363 () Bool)

(declare-fun e!25959 () Bool)

(assert (=> d!7181 (=> res!24363 e!25959)))

(assert (=> d!7181 (= res!24363 (= (select (arr!1232 lt!15397) #b00000000000000000000000000000000) lt!15529))))

(assert (=> d!7181 (= (arrayContainsKey!0 lt!15397 lt!15529 #b00000000000000000000000000000000) e!25959)))

(declare-fun b!40952 () Bool)

(declare-fun e!25960 () Bool)

(assert (=> b!40952 (= e!25959 e!25960)))

(declare-fun res!24364 () Bool)

(assert (=> b!40952 (=> (not res!24364) (not e!25960))))

(assert (=> b!40952 (= res!24364 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1369 lt!15397)))))

(declare-fun b!40953 () Bool)

(assert (=> b!40953 (= e!25960 (arrayContainsKey!0 lt!15397 lt!15529 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!7181 (not res!24363)) b!40952))

(assert (= (and b!40952 res!24364) b!40953))

(assert (=> d!7181 m!33183))

(declare-fun m!33759 () Bool)

(assert (=> b!40953 m!33759))

(assert (=> b!40432 d!7181))

(declare-fun b!40954 () Bool)

(declare-fun e!25963 () SeekEntryResult!168)

(declare-fun e!25961 () SeekEntryResult!168)

(assert (=> b!40954 (= e!25963 e!25961)))

(declare-fun lt!15906 () (_ BitVec 64))

(declare-fun lt!15905 () SeekEntryResult!168)

(assert (=> b!40954 (= lt!15906 (select (arr!1232 lt!15397) (index!2796 lt!15905)))))

(declare-fun c!5088 () Bool)

(assert (=> b!40954 (= c!5088 (= lt!15906 (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40955 () Bool)

(assert (=> b!40955 (= e!25963 Undefined!168)))

(declare-fun b!40956 () Bool)

(declare-fun e!25962 () SeekEntryResult!168)

(assert (=> b!40956 (= e!25962 (seekKeyOrZeroReturnVacant!0 (x!7715 lt!15905) (index!2796 lt!15905) (index!2796 lt!15905) (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15397 mask!853))))

(declare-fun d!7183 () Bool)

(declare-fun lt!15904 () SeekEntryResult!168)

(assert (=> d!7183 (and (or ((_ is Undefined!168) lt!15904) (not ((_ is Found!168) lt!15904)) (and (bvsge (index!2795 lt!15904) #b00000000000000000000000000000000) (bvslt (index!2795 lt!15904) (size!1369 lt!15397)))) (or ((_ is Undefined!168) lt!15904) ((_ is Found!168) lt!15904) (not ((_ is MissingZero!168) lt!15904)) (and (bvsge (index!2794 lt!15904) #b00000000000000000000000000000000) (bvslt (index!2794 lt!15904) (size!1369 lt!15397)))) (or ((_ is Undefined!168) lt!15904) ((_ is Found!168) lt!15904) ((_ is MissingZero!168) lt!15904) (not ((_ is MissingVacant!168) lt!15904)) (and (bvsge (index!2797 lt!15904) #b00000000000000000000000000000000) (bvslt (index!2797 lt!15904) (size!1369 lt!15397)))) (or ((_ is Undefined!168) lt!15904) (ite ((_ is Found!168) lt!15904) (= (select (arr!1232 lt!15397) (index!2795 lt!15904)) (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!168) lt!15904) (= (select (arr!1232 lt!15397) (index!2794 lt!15904)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!168) lt!15904) (= (select (arr!1232 lt!15397) (index!2797 lt!15904)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!7183 (= lt!15904 e!25963)))

(declare-fun c!5089 () Bool)

(assert (=> d!7183 (= c!5089 (and ((_ is Intermediate!168) lt!15905) (undefined!980 lt!15905)))))

(assert (=> d!7183 (= lt!15905 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!853) (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15397 mask!853))))

(assert (=> d!7183 (validMask!0 mask!853)))

(assert (=> d!7183 (= (seekEntryOrOpen!0 (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15397 mask!853) lt!15904)))

(declare-fun b!40957 () Bool)

(declare-fun c!5090 () Bool)

(assert (=> b!40957 (= c!5090 (= lt!15906 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!40957 (= e!25961 e!25962)))

(declare-fun b!40958 () Bool)

(assert (=> b!40958 (= e!25961 (Found!168 (index!2796 lt!15905)))))

(declare-fun b!40959 () Bool)

(assert (=> b!40959 (= e!25962 (MissingZero!168 (index!2796 lt!15905)))))

(assert (= (and d!7183 c!5089) b!40955))

(assert (= (and d!7183 (not c!5089)) b!40954))

(assert (= (and b!40954 c!5088) b!40958))

(assert (= (and b!40954 (not c!5088)) b!40957))

(assert (= (and b!40957 c!5090) b!40959))

(assert (= (and b!40957 (not c!5090)) b!40956))

(declare-fun m!33761 () Bool)

(assert (=> b!40954 m!33761))

(assert (=> b!40956 m!33227))

(declare-fun m!33763 () Bool)

(assert (=> b!40956 m!33763))

(assert (=> d!7183 m!33055))

(declare-fun m!33765 () Bool)

(assert (=> d!7183 m!33765))

(declare-fun m!33767 () Bool)

(assert (=> d!7183 m!33767))

(assert (=> d!7183 m!33227))

(declare-fun m!33769 () Bool)

(assert (=> d!7183 m!33769))

(assert (=> d!7183 m!33769))

(assert (=> d!7183 m!33227))

(declare-fun m!33771 () Bool)

(assert (=> d!7183 m!33771))

(declare-fun m!33773 () Bool)

(assert (=> d!7183 m!33773))

(assert (=> b!40432 d!7183))

(declare-fun d!7185 () Bool)

(assert (=> d!7185 (= (validMask!0 (mask!5176 lt!15398)) (and (or (= (mask!5176 lt!15398) #b00000000000000000000000000000111) (= (mask!5176 lt!15398) #b00000000000000000000000000001111) (= (mask!5176 lt!15398) #b00000000000000000000000000011111) (= (mask!5176 lt!15398) #b00000000000000000000000000111111) (= (mask!5176 lt!15398) #b00000000000000000000000001111111) (= (mask!5176 lt!15398) #b00000000000000000000000011111111) (= (mask!5176 lt!15398) #b00000000000000000000000111111111) (= (mask!5176 lt!15398) #b00000000000000000000001111111111) (= (mask!5176 lt!15398) #b00000000000000000000011111111111) (= (mask!5176 lt!15398) #b00000000000000000000111111111111) (= (mask!5176 lt!15398) #b00000000000000000001111111111111) (= (mask!5176 lt!15398) #b00000000000000000011111111111111) (= (mask!5176 lt!15398) #b00000000000000000111111111111111) (= (mask!5176 lt!15398) #b00000000000000001111111111111111) (= (mask!5176 lt!15398) #b00000000000000011111111111111111) (= (mask!5176 lt!15398) #b00000000000000111111111111111111) (= (mask!5176 lt!15398) #b00000000000001111111111111111111) (= (mask!5176 lt!15398) #b00000000000011111111111111111111) (= (mask!5176 lt!15398) #b00000000000111111111111111111111) (= (mask!5176 lt!15398) #b00000000001111111111111111111111) (= (mask!5176 lt!15398) #b00000000011111111111111111111111) (= (mask!5176 lt!15398) #b00000000111111111111111111111111) (= (mask!5176 lt!15398) #b00000001111111111111111111111111) (= (mask!5176 lt!15398) #b00000011111111111111111111111111) (= (mask!5176 lt!15398) #b00000111111111111111111111111111) (= (mask!5176 lt!15398) #b00001111111111111111111111111111) (= (mask!5176 lt!15398) #b00011111111111111111111111111111) (= (mask!5176 lt!15398) #b00111111111111111111111111111111)) (bvsle (mask!5176 lt!15398) #b00111111111111111111111111111111)))))

(assert (=> d!7065 d!7185))

(declare-fun b!40960 () Bool)

(declare-fun e!25964 () Bool)

(declare-fun e!25965 () Bool)

(assert (=> b!40960 (= e!25964 e!25965)))

(declare-fun c!5091 () Bool)

(assert (=> b!40960 (= c!5091 (validKeyInArray!0 (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!7187 () Bool)

(declare-fun res!24367 () Bool)

(declare-fun e!25966 () Bool)

(assert (=> d!7187 (=> res!24367 e!25966)))

(assert (=> d!7187 (= res!24367 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1369 lt!15397)))))

(assert (=> d!7187 (= (arrayNoDuplicates!0 lt!15397 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4932 (Cons!1035 (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4909 (Cons!1035 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) Nil!1036) Nil!1036)) (ite c!4909 (Cons!1035 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) Nil!1036) Nil!1036))) e!25966)))

(declare-fun b!40961 () Bool)

(declare-fun call!3204 () Bool)

(assert (=> b!40961 (= e!25965 call!3204)))

(declare-fun bm!3201 () Bool)

(assert (=> bm!3201 (= call!3204 (arrayNoDuplicates!0 lt!15397 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5091 (Cons!1035 (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!4932 (Cons!1035 (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4909 (Cons!1035 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) Nil!1036) Nil!1036)) (ite c!4909 (Cons!1035 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) Nil!1036) Nil!1036))) (ite c!4932 (Cons!1035 (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4909 (Cons!1035 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) Nil!1036) Nil!1036)) (ite c!4909 (Cons!1035 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) Nil!1036) Nil!1036)))))))

(declare-fun b!40962 () Bool)

(assert (=> b!40962 (= e!25966 e!25964)))

(declare-fun res!24365 () Bool)

(assert (=> b!40962 (=> (not res!24365) (not e!25964))))

(declare-fun e!25967 () Bool)

(assert (=> b!40962 (= res!24365 (not e!25967))))

(declare-fun res!24366 () Bool)

(assert (=> b!40962 (=> (not res!24366) (not e!25967))))

(assert (=> b!40962 (= res!24366 (validKeyInArray!0 (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!40963 () Bool)

(assert (=> b!40963 (= e!25965 call!3204)))

(declare-fun b!40964 () Bool)

(assert (=> b!40964 (= e!25967 (contains!504 (ite c!4932 (Cons!1035 (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4909 (Cons!1035 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) Nil!1036) Nil!1036)) (ite c!4909 (Cons!1035 (select (arr!1232 lt!15397) #b00000000000000000000000000000000) Nil!1036) Nil!1036)) (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!7187 (not res!24367)) b!40962))

(assert (= (and b!40962 res!24366) b!40964))

(assert (= (and b!40962 res!24365) b!40960))

(assert (= (and b!40960 c!5091) b!40961))

(assert (= (and b!40960 (not c!5091)) b!40963))

(assert (= (or b!40961 b!40963) bm!3201))

(assert (=> b!40960 m!33719))

(assert (=> b!40960 m!33719))

(assert (=> b!40960 m!33729))

(assert (=> bm!3201 m!33719))

(declare-fun m!33775 () Bool)

(assert (=> bm!3201 m!33775))

(assert (=> b!40962 m!33719))

(assert (=> b!40962 m!33719))

(assert (=> b!40962 m!33729))

(assert (=> b!40964 m!33719))

(assert (=> b!40964 m!33719))

(declare-fun m!33777 () Bool)

(assert (=> b!40964 m!33777))

(assert (=> bm!3114 d!7187))

(assert (=> b!40421 d!7137))

(declare-fun d!7189 () Bool)

(declare-fun lt!15909 () Bool)

(assert (=> d!7189 (= lt!15909 (select (content!31 Nil!1036) (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)))))

(declare-fun e!25968 () Bool)

(assert (=> d!7189 (= lt!15909 e!25968)))

(declare-fun res!24369 () Bool)

(assert (=> d!7189 (=> (not res!24369) (not e!25968))))

(assert (=> d!7189 (= res!24369 ((_ is Cons!1035) Nil!1036))))

(assert (=> d!7189 (= (contains!504 Nil!1036 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)) lt!15909)))

(declare-fun b!40966 () Bool)

(declare-fun e!25969 () Bool)

(assert (=> b!40966 (= e!25968 e!25969)))

(declare-fun res!24368 () Bool)

(assert (=> b!40966 (=> res!24368 e!25969)))

(assert (=> b!40966 (= res!24368 (= (h!1609 Nil!1036) (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)))))

(declare-fun b!40967 () Bool)

(assert (=> b!40967 (= e!25969 (contains!504 (t!3892 Nil!1036) (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)))))

(assert (= (and d!7189 res!24369) b!40966))

(assert (= (and b!40966 (not res!24368)) b!40967))

(assert (=> d!7189 m!33251))

(assert (=> d!7189 m!33261))

(declare-fun m!33779 () Bool)

(assert (=> d!7189 m!33779))

(assert (=> b!40967 m!33261))

(declare-fun m!33781 () Bool)

(assert (=> b!40967 m!33781))

(assert (=> b!40418 d!7189))

(assert (=> d!7089 d!6995))

(declare-fun d!7191 () Bool)

(declare-fun e!25971 () Bool)

(assert (=> d!7191 e!25971))

(declare-fun res!24370 () Bool)

(assert (=> d!7191 (=> res!24370 e!25971)))

(declare-fun lt!15914 () Bool)

(assert (=> d!7191 (= res!24370 (not lt!15914))))

(declare-fun lt!15913 () Bool)

(assert (=> d!7191 (= lt!15914 lt!15913)))

(declare-fun lt!15911 () Unit!992)

(declare-fun e!25970 () Unit!992)

(assert (=> d!7191 (= lt!15911 e!25970)))

(declare-fun c!5092 () Bool)

(assert (=> d!7191 (= c!5092 lt!15913)))

(assert (=> d!7191 (= lt!15913 (containsKey!70 (toList!534 lt!15679) (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)))))

(assert (=> d!7191 (= (contains!506 lt!15679 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)) lt!15914)))

(declare-fun b!40968 () Bool)

(declare-fun lt!15912 () Unit!992)

(assert (=> b!40968 (= e!25970 lt!15912)))

(assert (=> b!40968 (= lt!15912 (lemmaContainsKeyImpliesGetValueByKeyDefined!58 (toList!534 lt!15679) (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)))))

(assert (=> b!40968 (isDefined!59 (getValueByKey!103 (toList!534 lt!15679) (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)))))

(declare-fun b!40969 () Bool)

(declare-fun Unit!1005 () Unit!992)

(assert (=> b!40969 (= e!25970 Unit!1005)))

(declare-fun b!40970 () Bool)

(assert (=> b!40970 (= e!25971 (isDefined!59 (getValueByKey!103 (toList!534 lt!15679) (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000))))))

(assert (= (and d!7191 c!5092) b!40968))

(assert (= (and d!7191 (not c!5092)) b!40969))

(assert (= (and d!7191 (not res!24370)) b!40970))

(assert (=> d!7191 m!33261))

(declare-fun m!33787 () Bool)

(assert (=> d!7191 m!33787))

(assert (=> b!40968 m!33261))

(declare-fun m!33789 () Bool)

(assert (=> b!40968 m!33789))

(assert (=> b!40968 m!33261))

(declare-fun m!33791 () Bool)

(assert (=> b!40968 m!33791))

(assert (=> b!40968 m!33791))

(declare-fun m!33795 () Bool)

(assert (=> b!40968 m!33795))

(assert (=> b!40970 m!33261))

(assert (=> b!40970 m!33791))

(assert (=> b!40970 m!33791))

(assert (=> b!40970 m!33795))

(assert (=> b!40608 d!7191))

(assert (=> d!7099 d!7103))

(declare-fun d!7199 () Bool)

(assert (=> d!7199 (arrayContainsKey!0 lt!15397 lt!15497 #b00000000000000000000000000000000)))

(assert (=> d!7199 true))

(declare-fun _$60!344 () Unit!992)

(assert (=> d!7199 (= (choose!13 lt!15397 lt!15497 #b00000000000000000000000000000000) _$60!344)))

(declare-fun bs!1723 () Bool)

(assert (= bs!1723 d!7199))

(assert (=> bs!1723 m!33187))

(assert (=> d!7099 d!7199))

(assert (=> b!40419 d!7137))

(declare-fun b!40980 () Bool)

(declare-fun e!25979 () Bool)

(declare-fun e!25980 () Bool)

(assert (=> b!40980 (= e!25979 e!25980)))

(declare-fun c!5095 () Bool)

(assert (=> b!40980 (= c!5095 (validKeyInArray!0 (select (arr!1232 (_keys!3292 lt!15398)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!7207 () Bool)

(declare-fun res!24378 () Bool)

(declare-fun e!25981 () Bool)

(assert (=> d!7207 (=> res!24378 e!25981)))

(assert (=> d!7207 (= res!24378 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1369 (_keys!3292 lt!15398))))))

(assert (=> d!7207 (= (arrayNoDuplicates!0 (_keys!3292 lt!15398) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4931 (Cons!1035 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000) Nil!1036) Nil!1036)) e!25981)))

(declare-fun b!40981 () Bool)

(declare-fun call!3206 () Bool)

(assert (=> b!40981 (= e!25980 call!3206)))

(declare-fun bm!3203 () Bool)

(assert (=> bm!3203 (= call!3206 (arrayNoDuplicates!0 (_keys!3292 lt!15398) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5095 (Cons!1035 (select (arr!1232 (_keys!3292 lt!15398)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4931 (Cons!1035 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000) Nil!1036) Nil!1036)) (ite c!4931 (Cons!1035 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000) Nil!1036) Nil!1036))))))

(declare-fun b!40982 () Bool)

(assert (=> b!40982 (= e!25981 e!25979)))

(declare-fun res!24376 () Bool)

(assert (=> b!40982 (=> (not res!24376) (not e!25979))))

(declare-fun e!25982 () Bool)

(assert (=> b!40982 (= res!24376 (not e!25982))))

(declare-fun res!24377 () Bool)

(assert (=> b!40982 (=> (not res!24377) (not e!25982))))

(assert (=> b!40982 (= res!24377 (validKeyInArray!0 (select (arr!1232 (_keys!3292 lt!15398)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40983 () Bool)

(assert (=> b!40983 (= e!25980 call!3206)))

(declare-fun b!40984 () Bool)

(assert (=> b!40984 (= e!25982 (contains!504 (ite c!4931 (Cons!1035 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000) Nil!1036) Nil!1036) (select (arr!1232 (_keys!3292 lt!15398)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!7207 (not res!24378)) b!40982))

(assert (= (and b!40982 res!24377) b!40984))

(assert (= (and b!40982 res!24376) b!40980))

(assert (= (and b!40980 c!5095) b!40981))

(assert (= (and b!40980 (not c!5095)) b!40983))

(assert (= (or b!40981 b!40983) bm!3203))

(assert (=> b!40980 m!33625))

(assert (=> b!40980 m!33625))

(assert (=> b!40980 m!33635))

(assert (=> bm!3203 m!33625))

(declare-fun m!33821 () Bool)

(assert (=> bm!3203 m!33821))

(assert (=> b!40982 m!33625))

(assert (=> b!40982 m!33625))

(assert (=> b!40982 m!33635))

(assert (=> b!40984 m!33625))

(assert (=> b!40984 m!33625))

(declare-fun m!33823 () Bool)

(assert (=> b!40984 m!33823))

(assert (=> bm!3113 d!7207))

(assert (=> b!40416 d!7125))

(assert (=> b!40606 d!7125))

(declare-fun b!40985 () Bool)

(declare-fun e!25984 () (_ BitVec 32))

(declare-fun call!3207 () (_ BitVec 32))

(assert (=> b!40985 (= e!25984 (bvadd #b00000000000000000000000000000001 call!3207))))

(declare-fun b!40986 () Bool)

(declare-fun e!25983 () (_ BitVec 32))

(assert (=> b!40986 (= e!25983 e!25984)))

(declare-fun c!5097 () Bool)

(assert (=> b!40986 (= c!5097 (validKeyInArray!0 (select (arr!1232 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!40987 () Bool)

(assert (=> b!40987 (= e!25983 #b00000000000000000000000000000000)))

(declare-fun d!7209 () Bool)

(declare-fun lt!15923 () (_ BitVec 32))

(assert (=> d!7209 (and (bvsge lt!15923 #b00000000000000000000000000000000) (bvsle lt!15923 (bvsub (size!1369 lt!15397) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!7209 (= lt!15923 e!25983)))

(declare-fun c!5096 () Bool)

(assert (=> d!7209 (= c!5096 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7209 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1369 lt!15397)))))

(assert (=> d!7209 (= (arrayCountValidKeys!0 lt!15397 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!15923)))

(declare-fun b!40988 () Bool)

(assert (=> b!40988 (= e!25984 call!3207)))

(declare-fun bm!3204 () Bool)

(assert (=> bm!3204 (= call!3207 (arrayCountValidKeys!0 lt!15397 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and d!7209 c!5096) b!40987))

(assert (= (and d!7209 (not c!5096)) b!40986))

(assert (= (and b!40986 c!5097) b!40985))

(assert (= (and b!40986 (not c!5097)) b!40988))

(assert (= (or b!40985 b!40988) bm!3204))

(assert (=> b!40986 m!33719))

(assert (=> b!40986 m!33719))

(assert (=> b!40986 m!33729))

(declare-fun m!33825 () Bool)

(assert (=> bm!3204 m!33825))

(assert (=> bm!3109 d!7209))

(declare-fun d!7211 () Bool)

(declare-fun e!25985 () Bool)

(assert (=> d!7211 e!25985))

(declare-fun res!24379 () Bool)

(assert (=> d!7211 (=> (not res!24379) (not e!25985))))

(declare-fun lt!15926 () ListLongMap!1037)

(assert (=> d!7211 (= res!24379 (contains!506 lt!15926 (_1!744 (tuple2!1467 lt!15667 (minValue!1721 lt!15398)))))))

(declare-fun lt!15924 () List!1038)

(assert (=> d!7211 (= lt!15926 (ListLongMap!1038 lt!15924))))

(declare-fun lt!15927 () Unit!992)

(declare-fun lt!15925 () Unit!992)

(assert (=> d!7211 (= lt!15927 lt!15925)))

(assert (=> d!7211 (= (getValueByKey!103 lt!15924 (_1!744 (tuple2!1467 lt!15667 (minValue!1721 lt!15398)))) (Some!108 (_2!744 (tuple2!1467 lt!15667 (minValue!1721 lt!15398)))))))

(assert (=> d!7211 (= lt!15925 (lemmaContainsTupThenGetReturnValue!26 lt!15924 (_1!744 (tuple2!1467 lt!15667 (minValue!1721 lt!15398))) (_2!744 (tuple2!1467 lt!15667 (minValue!1721 lt!15398)))))))

(assert (=> d!7211 (= lt!15924 (insertStrictlySorted!23 (toList!534 lt!15681) (_1!744 (tuple2!1467 lt!15667 (minValue!1721 lt!15398))) (_2!744 (tuple2!1467 lt!15667 (minValue!1721 lt!15398)))))))

(assert (=> d!7211 (= (+!64 lt!15681 (tuple2!1467 lt!15667 (minValue!1721 lt!15398))) lt!15926)))

(declare-fun b!40989 () Bool)

(declare-fun res!24380 () Bool)

(assert (=> b!40989 (=> (not res!24380) (not e!25985))))

(assert (=> b!40989 (= res!24380 (= (getValueByKey!103 (toList!534 lt!15926) (_1!744 (tuple2!1467 lt!15667 (minValue!1721 lt!15398)))) (Some!108 (_2!744 (tuple2!1467 lt!15667 (minValue!1721 lt!15398))))))))

(declare-fun b!40990 () Bool)

(assert (=> b!40990 (= e!25985 (contains!508 (toList!534 lt!15926) (tuple2!1467 lt!15667 (minValue!1721 lt!15398))))))

(assert (= (and d!7211 res!24379) b!40989))

(assert (= (and b!40989 res!24380) b!40990))

(declare-fun m!33827 () Bool)

(assert (=> d!7211 m!33827))

(declare-fun m!33829 () Bool)

(assert (=> d!7211 m!33829))

(declare-fun m!33831 () Bool)

(assert (=> d!7211 m!33831))

(declare-fun m!33833 () Bool)

(assert (=> d!7211 m!33833))

(declare-fun m!33835 () Bool)

(assert (=> b!40989 m!33835))

(declare-fun m!33837 () Bool)

(assert (=> b!40990 m!33837))

(assert (=> b!40607 d!7211))

(declare-fun d!7213 () Bool)

(assert (=> d!7213 (= (apply!56 (+!64 lt!15668 (tuple2!1467 lt!15677 (zeroValue!1721 lt!15398))) lt!15666) (apply!56 lt!15668 lt!15666))))

(declare-fun lt!15941 () Unit!992)

(declare-fun choose!252 (ListLongMap!1037 (_ BitVec 64) V!2097 (_ BitVec 64)) Unit!992)

(assert (=> d!7213 (= lt!15941 (choose!252 lt!15668 lt!15677 (zeroValue!1721 lt!15398) lt!15666))))

(declare-fun e!25993 () Bool)

(assert (=> d!7213 e!25993))

(declare-fun res!24390 () Bool)

(assert (=> d!7213 (=> (not res!24390) (not e!25993))))

(assert (=> d!7213 (= res!24390 (contains!506 lt!15668 lt!15666))))

(assert (=> d!7213 (= (addApplyDifferent!32 lt!15668 lt!15677 (zeroValue!1721 lt!15398) lt!15666) lt!15941)))

(declare-fun b!41002 () Bool)

(assert (=> b!41002 (= e!25993 (not (= lt!15666 lt!15677)))))

(assert (= (and d!7213 res!24390) b!41002))

(declare-fun m!33843 () Bool)

(assert (=> d!7213 m!33843))

(declare-fun m!33845 () Bool)

(assert (=> d!7213 m!33845))

(assert (=> d!7213 m!33423))

(assert (=> d!7213 m!33411))

(assert (=> d!7213 m!33411))

(assert (=> d!7213 m!33413))

(assert (=> b!40607 d!7213))

(declare-fun d!7217 () Bool)

(declare-fun e!25995 () Bool)

(assert (=> d!7217 e!25995))

(declare-fun res!24393 () Bool)

(assert (=> d!7217 (=> (not res!24393) (not e!25995))))

(declare-fun lt!15948 () ListLongMap!1037)

(assert (=> d!7217 (= res!24393 (contains!506 lt!15948 (_1!744 (tuple2!1467 lt!15673 (zeroValue!1721 lt!15398)))))))

(declare-fun lt!15946 () List!1038)

(assert (=> d!7217 (= lt!15948 (ListLongMap!1038 lt!15946))))

(declare-fun lt!15949 () Unit!992)

(declare-fun lt!15947 () Unit!992)

(assert (=> d!7217 (= lt!15949 lt!15947)))

(assert (=> d!7217 (= (getValueByKey!103 lt!15946 (_1!744 (tuple2!1467 lt!15673 (zeroValue!1721 lt!15398)))) (Some!108 (_2!744 (tuple2!1467 lt!15673 (zeroValue!1721 lt!15398)))))))

(assert (=> d!7217 (= lt!15947 (lemmaContainsTupThenGetReturnValue!26 lt!15946 (_1!744 (tuple2!1467 lt!15673 (zeroValue!1721 lt!15398))) (_2!744 (tuple2!1467 lt!15673 (zeroValue!1721 lt!15398)))))))

(assert (=> d!7217 (= lt!15946 (insertStrictlySorted!23 (toList!534 lt!15671) (_1!744 (tuple2!1467 lt!15673 (zeroValue!1721 lt!15398))) (_2!744 (tuple2!1467 lt!15673 (zeroValue!1721 lt!15398)))))))

(assert (=> d!7217 (= (+!64 lt!15671 (tuple2!1467 lt!15673 (zeroValue!1721 lt!15398))) lt!15948)))

(declare-fun b!41005 () Bool)

(declare-fun res!24394 () Bool)

(assert (=> b!41005 (=> (not res!24394) (not e!25995))))

(assert (=> b!41005 (= res!24394 (= (getValueByKey!103 (toList!534 lt!15948) (_1!744 (tuple2!1467 lt!15673 (zeroValue!1721 lt!15398)))) (Some!108 (_2!744 (tuple2!1467 lt!15673 (zeroValue!1721 lt!15398))))))))

(declare-fun b!41006 () Bool)

(assert (=> b!41006 (= e!25995 (contains!508 (toList!534 lt!15948) (tuple2!1467 lt!15673 (zeroValue!1721 lt!15398))))))

(assert (= (and d!7217 res!24393) b!41005))

(assert (= (and b!41005 res!24394) b!41006))

(declare-fun m!33859 () Bool)

(assert (=> d!7217 m!33859))

(declare-fun m!33861 () Bool)

(assert (=> d!7217 m!33861))

(declare-fun m!33864 () Bool)

(assert (=> d!7217 m!33864))

(declare-fun m!33867 () Bool)

(assert (=> d!7217 m!33867))

(declare-fun m!33869 () Bool)

(assert (=> b!41005 m!33869))

(declare-fun m!33871 () Bool)

(assert (=> b!41006 m!33871))

(assert (=> b!40607 d!7217))

(declare-fun d!7223 () Bool)

(declare-fun e!25999 () Bool)

(assert (=> d!7223 e!25999))

(declare-fun res!24397 () Bool)

(assert (=> d!7223 (=> res!24397 e!25999)))

(declare-fun lt!15962 () Bool)

(assert (=> d!7223 (= res!24397 (not lt!15962))))

(declare-fun lt!15961 () Bool)

(assert (=> d!7223 (= lt!15962 lt!15961)))

(declare-fun lt!15959 () Unit!992)

(declare-fun e!25998 () Unit!992)

(assert (=> d!7223 (= lt!15959 e!25998)))

(declare-fun c!5098 () Bool)

(assert (=> d!7223 (= c!5098 lt!15961)))

(assert (=> d!7223 (= lt!15961 (containsKey!70 (toList!534 (+!64 lt!15671 (tuple2!1467 lt!15673 (zeroValue!1721 lt!15398)))) lt!15663))))

(assert (=> d!7223 (= (contains!506 (+!64 lt!15671 (tuple2!1467 lt!15673 (zeroValue!1721 lt!15398))) lt!15663) lt!15962)))

(declare-fun b!41009 () Bool)

(declare-fun lt!15960 () Unit!992)

(assert (=> b!41009 (= e!25998 lt!15960)))

(assert (=> b!41009 (= lt!15960 (lemmaContainsKeyImpliesGetValueByKeyDefined!58 (toList!534 (+!64 lt!15671 (tuple2!1467 lt!15673 (zeroValue!1721 lt!15398)))) lt!15663))))

(assert (=> b!41009 (isDefined!59 (getValueByKey!103 (toList!534 (+!64 lt!15671 (tuple2!1467 lt!15673 (zeroValue!1721 lt!15398)))) lt!15663))))

(declare-fun b!41010 () Bool)

(declare-fun Unit!1006 () Unit!992)

(assert (=> b!41010 (= e!25998 Unit!1006)))

(declare-fun b!41011 () Bool)

(assert (=> b!41011 (= e!25999 (isDefined!59 (getValueByKey!103 (toList!534 (+!64 lt!15671 (tuple2!1467 lt!15673 (zeroValue!1721 lt!15398)))) lt!15663)))))

(assert (= (and d!7223 c!5098) b!41009))

(assert (= (and d!7223 (not c!5098)) b!41010))

(assert (= (and d!7223 (not res!24397)) b!41011))

(declare-fun m!33875 () Bool)

(assert (=> d!7223 m!33875))

(declare-fun m!33877 () Bool)

(assert (=> b!41009 m!33877))

(declare-fun m!33879 () Bool)

(assert (=> b!41009 m!33879))

(assert (=> b!41009 m!33879))

(declare-fun m!33881 () Bool)

(assert (=> b!41009 m!33881))

(assert (=> b!41011 m!33879))

(assert (=> b!41011 m!33879))

(assert (=> b!41011 m!33881))

(assert (=> b!40607 d!7223))

(declare-fun d!7227 () Bool)

(assert (=> d!7227 (= (apply!56 lt!15668 lt!15666) (get!704 (getValueByKey!103 (toList!534 lt!15668) lt!15666)))))

(declare-fun bs!1725 () Bool)

(assert (= bs!1725 d!7227))

(declare-fun m!33883 () Bool)

(assert (=> bs!1725 m!33883))

(assert (=> bs!1725 m!33883))

(declare-fun m!33887 () Bool)

(assert (=> bs!1725 m!33887))

(assert (=> b!40607 d!7227))

(declare-fun d!7229 () Bool)

(assert (=> d!7229 (= (apply!56 (+!64 lt!15682 (tuple2!1467 lt!15661 (minValue!1721 lt!15398))) lt!15674) (apply!56 lt!15682 lt!15674))))

(declare-fun lt!15966 () Unit!992)

(assert (=> d!7229 (= lt!15966 (choose!252 lt!15682 lt!15661 (minValue!1721 lt!15398) lt!15674))))

(declare-fun e!26005 () Bool)

(assert (=> d!7229 e!26005))

(declare-fun res!24402 () Bool)

(assert (=> d!7229 (=> (not res!24402) (not e!26005))))

(assert (=> d!7229 (= res!24402 (contains!506 lt!15682 lt!15674))))

(assert (=> d!7229 (= (addApplyDifferent!32 lt!15682 lt!15661 (minValue!1721 lt!15398) lt!15674) lt!15966)))

(declare-fun b!41022 () Bool)

(assert (=> b!41022 (= e!26005 (not (= lt!15674 lt!15661)))))

(assert (= (and d!7229 res!24402) b!41022))

(declare-fun m!33901 () Bool)

(assert (=> d!7229 m!33901))

(declare-fun m!33903 () Bool)

(assert (=> d!7229 m!33903))

(assert (=> d!7229 m!33421))

(assert (=> d!7229 m!33415))

(assert (=> d!7229 m!33415))

(assert (=> d!7229 m!33435))

(assert (=> b!40607 d!7229))

(declare-fun d!7233 () Bool)

(assert (=> d!7233 (= (apply!56 lt!15681 lt!15678) (get!704 (getValueByKey!103 (toList!534 lt!15681) lt!15678)))))

(declare-fun bs!1726 () Bool)

(assert (= bs!1726 d!7233))

(declare-fun m!33905 () Bool)

(assert (=> bs!1726 m!33905))

(assert (=> bs!1726 m!33905))

(declare-fun m!33907 () Bool)

(assert (=> bs!1726 m!33907))

(assert (=> b!40607 d!7233))

(declare-fun d!7235 () Bool)

(assert (=> d!7235 (= (apply!56 (+!64 lt!15681 (tuple2!1467 lt!15667 (minValue!1721 lt!15398))) lt!15678) (get!704 (getValueByKey!103 (toList!534 (+!64 lt!15681 (tuple2!1467 lt!15667 (minValue!1721 lt!15398)))) lt!15678)))))

(declare-fun bs!1727 () Bool)

(assert (= bs!1727 d!7235))

(declare-fun m!33909 () Bool)

(assert (=> bs!1727 m!33909))

(assert (=> bs!1727 m!33909))

(declare-fun m!33911 () Bool)

(assert (=> bs!1727 m!33911))

(assert (=> b!40607 d!7235))

(declare-fun d!7237 () Bool)

(assert (=> d!7237 (= (apply!56 (+!64 lt!15668 (tuple2!1467 lt!15677 (zeroValue!1721 lt!15398))) lt!15666) (get!704 (getValueByKey!103 (toList!534 (+!64 lt!15668 (tuple2!1467 lt!15677 (zeroValue!1721 lt!15398)))) lt!15666)))))

(declare-fun bs!1729 () Bool)

(assert (= bs!1729 d!7237))

(declare-fun m!33921 () Bool)

(assert (=> bs!1729 m!33921))

(assert (=> bs!1729 m!33921))

(declare-fun m!33927 () Bool)

(assert (=> bs!1729 m!33927))

(assert (=> b!40607 d!7237))

(declare-fun d!7245 () Bool)

(assert (=> d!7245 (= (apply!56 (+!64 lt!15682 (tuple2!1467 lt!15661 (minValue!1721 lt!15398))) lt!15674) (get!704 (getValueByKey!103 (toList!534 (+!64 lt!15682 (tuple2!1467 lt!15661 (minValue!1721 lt!15398)))) lt!15674)))))

(declare-fun bs!1731 () Bool)

(assert (= bs!1731 d!7245))

(declare-fun m!33933 () Bool)

(assert (=> bs!1731 m!33933))

(assert (=> bs!1731 m!33933))

(declare-fun m!33935 () Bool)

(assert (=> bs!1731 m!33935))

(assert (=> b!40607 d!7245))

(declare-fun d!7249 () Bool)

(assert (=> d!7249 (contains!506 (+!64 lt!15671 (tuple2!1467 lt!15673 (zeroValue!1721 lt!15398))) lt!15663)))

(declare-fun lt!15987 () Unit!992)

(declare-fun choose!253 (ListLongMap!1037 (_ BitVec 64) V!2097 (_ BitVec 64)) Unit!992)

(assert (=> d!7249 (= lt!15987 (choose!253 lt!15671 lt!15673 (zeroValue!1721 lt!15398) lt!15663))))

(assert (=> d!7249 (contains!506 lt!15671 lt!15663)))

(assert (=> d!7249 (= (addStillContains!32 lt!15671 lt!15673 (zeroValue!1721 lt!15398) lt!15663) lt!15987)))

(declare-fun bs!1737 () Bool)

(assert (= bs!1737 d!7249))

(assert (=> bs!1737 m!33407))

(assert (=> bs!1737 m!33407))

(assert (=> bs!1737 m!33409))

(declare-fun m!34005 () Bool)

(assert (=> bs!1737 m!34005))

(declare-fun m!34007 () Bool)

(assert (=> bs!1737 m!34007))

(assert (=> b!40607 d!7249))

(declare-fun d!7273 () Bool)

(assert (=> d!7273 (= (apply!56 (+!64 lt!15681 (tuple2!1467 lt!15667 (minValue!1721 lt!15398))) lt!15678) (apply!56 lt!15681 lt!15678))))

(declare-fun lt!15992 () Unit!992)

(assert (=> d!7273 (= lt!15992 (choose!252 lt!15681 lt!15667 (minValue!1721 lt!15398) lt!15678))))

(declare-fun e!26017 () Bool)

(assert (=> d!7273 e!26017))

(declare-fun res!24418 () Bool)

(assert (=> d!7273 (=> (not res!24418) (not e!26017))))

(assert (=> d!7273 (= res!24418 (contains!506 lt!15681 lt!15678))))

(assert (=> d!7273 (= (addApplyDifferent!32 lt!15681 lt!15667 (minValue!1721 lt!15398) lt!15678) lt!15992)))

(declare-fun b!41041 () Bool)

(assert (=> b!41041 (= e!26017 (not (= lt!15678 lt!15667)))))

(assert (= (and d!7273 res!24418) b!41041))

(declare-fun m!34021 () Bool)

(assert (=> d!7273 m!34021))

(declare-fun m!34023 () Bool)

(assert (=> d!7273 m!34023))

(assert (=> d!7273 m!33429))

(assert (=> d!7273 m!33417))

(assert (=> d!7273 m!33417))

(assert (=> d!7273 m!33419))

(assert (=> b!40607 d!7273))

(assert (=> b!40607 d!7115))

(declare-fun d!7277 () Bool)

(declare-fun e!26019 () Bool)

(assert (=> d!7277 e!26019))

(declare-fun res!24421 () Bool)

(assert (=> d!7277 (=> (not res!24421) (not e!26019))))

(declare-fun lt!15999 () ListLongMap!1037)

(assert (=> d!7277 (= res!24421 (contains!506 lt!15999 (_1!744 (tuple2!1467 lt!15677 (zeroValue!1721 lt!15398)))))))

(declare-fun lt!15997 () List!1038)

(assert (=> d!7277 (= lt!15999 (ListLongMap!1038 lt!15997))))

(declare-fun lt!16000 () Unit!992)

(declare-fun lt!15998 () Unit!992)

(assert (=> d!7277 (= lt!16000 lt!15998)))

(assert (=> d!7277 (= (getValueByKey!103 lt!15997 (_1!744 (tuple2!1467 lt!15677 (zeroValue!1721 lt!15398)))) (Some!108 (_2!744 (tuple2!1467 lt!15677 (zeroValue!1721 lt!15398)))))))

(assert (=> d!7277 (= lt!15998 (lemmaContainsTupThenGetReturnValue!26 lt!15997 (_1!744 (tuple2!1467 lt!15677 (zeroValue!1721 lt!15398))) (_2!744 (tuple2!1467 lt!15677 (zeroValue!1721 lt!15398)))))))

(assert (=> d!7277 (= lt!15997 (insertStrictlySorted!23 (toList!534 lt!15668) (_1!744 (tuple2!1467 lt!15677 (zeroValue!1721 lt!15398))) (_2!744 (tuple2!1467 lt!15677 (zeroValue!1721 lt!15398)))))))

(assert (=> d!7277 (= (+!64 lt!15668 (tuple2!1467 lt!15677 (zeroValue!1721 lt!15398))) lt!15999)))

(declare-fun b!41044 () Bool)

(declare-fun res!24422 () Bool)

(assert (=> b!41044 (=> (not res!24422) (not e!26019))))

(assert (=> b!41044 (= res!24422 (= (getValueByKey!103 (toList!534 lt!15999) (_1!744 (tuple2!1467 lt!15677 (zeroValue!1721 lt!15398)))) (Some!108 (_2!744 (tuple2!1467 lt!15677 (zeroValue!1721 lt!15398))))))))

(declare-fun b!41045 () Bool)

(assert (=> b!41045 (= e!26019 (contains!508 (toList!534 lt!15999) (tuple2!1467 lt!15677 (zeroValue!1721 lt!15398))))))

(assert (= (and d!7277 res!24421) b!41044))

(assert (= (and b!41044 res!24422) b!41045))

(declare-fun m!34037 () Bool)

(assert (=> d!7277 m!34037))

(declare-fun m!34039 () Bool)

(assert (=> d!7277 m!34039))

(declare-fun m!34041 () Bool)

(assert (=> d!7277 m!34041))

(declare-fun m!34043 () Bool)

(assert (=> d!7277 m!34043))

(declare-fun m!34045 () Bool)

(assert (=> b!41044 m!34045))

(declare-fun m!34047 () Bool)

(assert (=> b!41045 m!34047))

(assert (=> b!40607 d!7277))

(declare-fun d!7281 () Bool)

(declare-fun e!26020 () Bool)

(assert (=> d!7281 e!26020))

(declare-fun res!24423 () Bool)

(assert (=> d!7281 (=> (not res!24423) (not e!26020))))

(declare-fun lt!16003 () ListLongMap!1037)

(assert (=> d!7281 (= res!24423 (contains!506 lt!16003 (_1!744 (tuple2!1467 lt!15661 (minValue!1721 lt!15398)))))))

(declare-fun lt!16001 () List!1038)

(assert (=> d!7281 (= lt!16003 (ListLongMap!1038 lt!16001))))

(declare-fun lt!16004 () Unit!992)

(declare-fun lt!16002 () Unit!992)

(assert (=> d!7281 (= lt!16004 lt!16002)))

(assert (=> d!7281 (= (getValueByKey!103 lt!16001 (_1!744 (tuple2!1467 lt!15661 (minValue!1721 lt!15398)))) (Some!108 (_2!744 (tuple2!1467 lt!15661 (minValue!1721 lt!15398)))))))

(assert (=> d!7281 (= lt!16002 (lemmaContainsTupThenGetReturnValue!26 lt!16001 (_1!744 (tuple2!1467 lt!15661 (minValue!1721 lt!15398))) (_2!744 (tuple2!1467 lt!15661 (minValue!1721 lt!15398)))))))

(assert (=> d!7281 (= lt!16001 (insertStrictlySorted!23 (toList!534 lt!15682) (_1!744 (tuple2!1467 lt!15661 (minValue!1721 lt!15398))) (_2!744 (tuple2!1467 lt!15661 (minValue!1721 lt!15398)))))))

(assert (=> d!7281 (= (+!64 lt!15682 (tuple2!1467 lt!15661 (minValue!1721 lt!15398))) lt!16003)))

(declare-fun b!41046 () Bool)

(declare-fun res!24424 () Bool)

(assert (=> b!41046 (=> (not res!24424) (not e!26020))))

(assert (=> b!41046 (= res!24424 (= (getValueByKey!103 (toList!534 lt!16003) (_1!744 (tuple2!1467 lt!15661 (minValue!1721 lt!15398)))) (Some!108 (_2!744 (tuple2!1467 lt!15661 (minValue!1721 lt!15398))))))))

(declare-fun b!41047 () Bool)

(assert (=> b!41047 (= e!26020 (contains!508 (toList!534 lt!16003) (tuple2!1467 lt!15661 (minValue!1721 lt!15398))))))

(assert (= (and d!7281 res!24423) b!41046))

(assert (= (and b!41046 res!24424) b!41047))

(declare-fun m!34049 () Bool)

(assert (=> d!7281 m!34049))

(declare-fun m!34051 () Bool)

(assert (=> d!7281 m!34051))

(declare-fun m!34053 () Bool)

(assert (=> d!7281 m!34053))

(declare-fun m!34055 () Bool)

(assert (=> d!7281 m!34055))

(declare-fun m!34057 () Bool)

(assert (=> b!41046 m!34057))

(declare-fun m!34059 () Bool)

(assert (=> b!41047 m!34059))

(assert (=> b!40607 d!7281))

(declare-fun d!7285 () Bool)

(assert (=> d!7285 (= (apply!56 lt!15682 lt!15674) (get!704 (getValueByKey!103 (toList!534 lt!15682) lt!15674)))))

(declare-fun bs!1738 () Bool)

(assert (= bs!1738 d!7285))

(declare-fun m!34061 () Bool)

(assert (=> bs!1738 m!34061))

(assert (=> bs!1738 m!34061))

(declare-fun m!34063 () Bool)

(assert (=> bs!1738 m!34063))

(assert (=> b!40607 d!7285))

(declare-fun d!7287 () Bool)

(declare-fun e!26021 () Bool)

(assert (=> d!7287 e!26021))

(declare-fun res!24425 () Bool)

(assert (=> d!7287 (=> (not res!24425) (not e!26021))))

(declare-fun lt!16007 () ListLongMap!1037)

(assert (=> d!7287 (= res!24425 (contains!506 lt!16007 (_1!744 (tuple2!1467 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15398)))))))

(declare-fun lt!16005 () List!1038)

(assert (=> d!7287 (= lt!16007 (ListLongMap!1038 lt!16005))))

(declare-fun lt!16008 () Unit!992)

(declare-fun lt!16006 () Unit!992)

(assert (=> d!7287 (= lt!16008 lt!16006)))

(assert (=> d!7287 (= (getValueByKey!103 lt!16005 (_1!744 (tuple2!1467 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15398)))) (Some!108 (_2!744 (tuple2!1467 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15398)))))))

(assert (=> d!7287 (= lt!16006 (lemmaContainsTupThenGetReturnValue!26 lt!16005 (_1!744 (tuple2!1467 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15398))) (_2!744 (tuple2!1467 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15398)))))))

(assert (=> d!7287 (= lt!16005 (insertStrictlySorted!23 (toList!534 call!3157) (_1!744 (tuple2!1467 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15398))) (_2!744 (tuple2!1467 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15398)))))))

(assert (=> d!7287 (= (+!64 call!3157 (tuple2!1467 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15398))) lt!16007)))

(declare-fun b!41048 () Bool)

(declare-fun res!24426 () Bool)

(assert (=> b!41048 (=> (not res!24426) (not e!26021))))

(assert (=> b!41048 (= res!24426 (= (getValueByKey!103 (toList!534 lt!16007) (_1!744 (tuple2!1467 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15398)))) (Some!108 (_2!744 (tuple2!1467 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15398))))))))

(declare-fun b!41049 () Bool)

(assert (=> b!41049 (= e!26021 (contains!508 (toList!534 lt!16007) (tuple2!1467 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15398))))))

(assert (= (and d!7287 res!24425) b!41048))

(assert (= (and b!41048 res!24426) b!41049))

(declare-fun m!34065 () Bool)

(assert (=> d!7287 m!34065))

(declare-fun m!34067 () Bool)

(assert (=> d!7287 m!34067))

(declare-fun m!34069 () Bool)

(assert (=> d!7287 m!34069))

(declare-fun m!34071 () Bool)

(assert (=> d!7287 m!34071))

(declare-fun m!34073 () Bool)

(assert (=> b!41048 m!34073))

(declare-fun m!34075 () Bool)

(assert (=> b!41049 m!34075))

(assert (=> b!40603 d!7287))

(assert (=> b!40414 d!7125))

(assert (=> d!7083 d!7011))

(assert (=> d!7055 d!7185))

(assert (=> b!40374 d!7137))

(assert (=> d!7095 d!7017))

(declare-fun b!41050 () Bool)

(declare-fun e!26023 () (_ BitVec 32))

(declare-fun call!3209 () (_ BitVec 32))

(assert (=> b!41050 (= e!26023 (bvadd #b00000000000000000000000000000001 call!3209))))

(declare-fun b!41051 () Bool)

(declare-fun e!26022 () (_ BitVec 32))

(assert (=> b!41051 (= e!26022 e!26023)))

(declare-fun c!5104 () Bool)

(assert (=> b!41051 (= c!5104 (validKeyInArray!0 (select (arr!1232 (_keys!3292 lt!15398)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!41052 () Bool)

(assert (=> b!41052 (= e!26022 #b00000000000000000000000000000000)))

(declare-fun d!7289 () Bool)

(declare-fun lt!16009 () (_ BitVec 32))

(assert (=> d!7289 (and (bvsge lt!16009 #b00000000000000000000000000000000) (bvsle lt!16009 (bvsub (size!1369 (_keys!3292 lt!15398)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!7289 (= lt!16009 e!26022)))

(declare-fun c!5103 () Bool)

(assert (=> d!7289 (= c!5103 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1369 (_keys!3292 lt!15398))))))

(assert (=> d!7289 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1369 (_keys!3292 lt!15398))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1369 (_keys!3292 lt!15398)) (size!1369 (_keys!3292 lt!15398))))))

(assert (=> d!7289 (= (arrayCountValidKeys!0 (_keys!3292 lt!15398) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1369 (_keys!3292 lt!15398))) lt!16009)))

(declare-fun b!41053 () Bool)

(assert (=> b!41053 (= e!26023 call!3209)))

(declare-fun bm!3206 () Bool)

(assert (=> bm!3206 (= call!3209 (arrayCountValidKeys!0 (_keys!3292 lt!15398) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1369 (_keys!3292 lt!15398))))))

(assert (= (and d!7289 c!5103) b!41052))

(assert (= (and d!7289 (not c!5103)) b!41051))

(assert (= (and b!41051 c!5104) b!41050))

(assert (= (and b!41051 (not c!5104)) b!41053))

(assert (= (or b!41050 b!41053) bm!3206))

(assert (=> b!41051 m!33625))

(assert (=> b!41051 m!33625))

(assert (=> b!41051 m!33635))

(declare-fun m!34077 () Bool)

(assert (=> bm!3206 m!34077))

(assert (=> bm!3163 d!7289))

(declare-fun d!7291 () Bool)

(declare-fun e!26025 () Bool)

(assert (=> d!7291 e!26025))

(declare-fun res!24427 () Bool)

(assert (=> d!7291 (=> res!24427 e!26025)))

(declare-fun lt!16013 () Bool)

(assert (=> d!7291 (= res!24427 (not lt!16013))))

(declare-fun lt!16012 () Bool)

(assert (=> d!7291 (= lt!16013 lt!16012)))

(declare-fun lt!16010 () Unit!992)

(declare-fun e!26024 () Unit!992)

(assert (=> d!7291 (= lt!16010 e!26024)))

(declare-fun c!5105 () Bool)

(assert (=> d!7291 (= c!5105 lt!16012)))

(assert (=> d!7291 (= lt!16012 (containsKey!70 (toList!534 lt!15679) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7291 (= (contains!506 lt!15679 #b0000000000000000000000000000000000000000000000000000000000000000) lt!16013)))

(declare-fun b!41054 () Bool)

(declare-fun lt!16011 () Unit!992)

(assert (=> b!41054 (= e!26024 lt!16011)))

(assert (=> b!41054 (= lt!16011 (lemmaContainsKeyImpliesGetValueByKeyDefined!58 (toList!534 lt!15679) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!41054 (isDefined!59 (getValueByKey!103 (toList!534 lt!15679) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41055 () Bool)

(declare-fun Unit!1007 () Unit!992)

(assert (=> b!41055 (= e!26024 Unit!1007)))

(declare-fun b!41056 () Bool)

(assert (=> b!41056 (= e!26025 (isDefined!59 (getValueByKey!103 (toList!534 lt!15679) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!7291 c!5105) b!41054))

(assert (= (and d!7291 (not c!5105)) b!41055))

(assert (= (and d!7291 (not res!24427)) b!41056))

(declare-fun m!34079 () Bool)

(assert (=> d!7291 m!34079))

(declare-fun m!34081 () Bool)

(assert (=> b!41054 m!34081))

(assert (=> b!41054 m!33737))

(assert (=> b!41054 m!33737))

(declare-fun m!34083 () Bool)

(assert (=> b!41054 m!34083))

(assert (=> b!41056 m!33737))

(assert (=> b!41056 m!33737))

(assert (=> b!41056 m!34083))

(assert (=> bm!3155 d!7291))

(assert (=> b!40409 d!7125))

(declare-fun d!7293 () Bool)

(assert (not d!7293))

(assert (=> b!40400 d!7293))

(declare-fun d!7295 () Bool)

(assert (=> d!7295 (= (apply!56 lt!15679 (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000)) (get!704 (getValueByKey!103 (toList!534 lt!15679) (select (arr!1232 (_keys!3292 lt!15398)) #b00000000000000000000000000000000))))))

(declare-fun bs!1739 () Bool)

(assert (= bs!1739 d!7295))

(assert (=> bs!1739 m!33261))

(assert (=> bs!1739 m!33791))

(assert (=> bs!1739 m!33791))

(declare-fun m!34085 () Bool)

(assert (=> bs!1739 m!34085))

(assert (=> b!40602 d!7295))

(declare-fun d!7297 () Bool)

(declare-fun c!5108 () Bool)

(assert (=> d!7297 (= c!5108 ((_ is ValueCellFull!629) (select (arr!1233 (_values!1786 lt!15398)) #b00000000000000000000000000000000)))))

(declare-fun e!26028 () V!2097)

(assert (=> d!7297 (= (get!702 (select (arr!1233 (_values!1786 lt!15398)) #b00000000000000000000000000000000) (dynLambda!186 (defaultEntry!1803 lt!15398) #b0000000000000000000000000000000000000000000000000000000000000000)) e!26028)))

(declare-fun b!41061 () Bool)

(declare-fun get!706 (ValueCell!629 V!2097) V!2097)

(assert (=> b!41061 (= e!26028 (get!706 (select (arr!1233 (_values!1786 lt!15398)) #b00000000000000000000000000000000) (dynLambda!186 (defaultEntry!1803 lt!15398) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!41062 () Bool)

(declare-fun get!707 (ValueCell!629 V!2097) V!2097)

(assert (=> b!41062 (= e!26028 (get!707 (select (arr!1233 (_values!1786 lt!15398)) #b00000000000000000000000000000000) (dynLambda!186 (defaultEntry!1803 lt!15398) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!7297 c!5108) b!41061))

(assert (= (and d!7297 (not c!5108)) b!41062))

(assert (=> b!41061 m!33439))

(assert (=> b!41061 m!33441))

(declare-fun m!34087 () Bool)

(assert (=> b!41061 m!34087))

(assert (=> b!41062 m!33439))

(assert (=> b!41062 m!33441))

(declare-fun m!34089 () Bool)

(assert (=> b!41062 m!34089))

(assert (=> b!40602 d!7297))

(declare-fun b_lambda!2083 () Bool)

(assert (= b_lambda!2071 (or (and start!5696 b_free!1363 (= defaultEntry!470 (defaultEntry!1803 lt!15398))) b_lambda!2083)))

(check-sat (not d!7115) (not b!40881) (not d!7173) (not d!7163) (not d!7235) (not b_lambda!2077) (not b!41044) (not d!7273) (not b!40788) (not d!7287) (not d!7213) (not b!40792) (not d!7179) (not b!40982) (not bm!3201) (not d!7165) (not b!40967) (not b_lambda!2067) (not b!40796) (not d!7171) (not b!40960) (not b!40953) b_and!2375 (not bm!3204) (not b!40891) (not d!7249) (not b!40962) (not b!40897) (not b!40951) (not d!7291) (not b!41009) (not b!41005) (not b!40968) (not b!41062) (not d!7245) (not b!40834) (not d!7217) (not d!7227) (not d!7141) (not b!40892) (not b!40802) (not d!7223) (not b!41047) (not b!40786) (not d!7199) (not bm!3200) (not d!7183) (not b!41048) (not b!40791) (not d!7169) (not b!40989) (not d!7237) (not b!40901) (not b!40964) (not b_lambda!2075) (not b!41006) (not b!41061) (not b!41049) (not b!40906) (not d!7133) (not d!7233) (not d!7211) (not b!41051) (not bm!3195) (not d!7281) (not d!7159) (not b!40894) (not bm!3203) (not b!41011) (not bm!3206) (not b_next!1363) (not b!40990) (not d!7191) (not b!41054) (not d!7277) (not b!40904) (not d!7149) (not b!40980) (not b!40986) (not b!40956) (not b!40858) (not d!7189) (not b!40794) (not d!7285) (not b!40805) (not b!41056) tp_is_empty!1753 (not b!40970) (not b!40984) (not d!7229) (not b!41046) (not b!40793) (not b_lambda!2083) (not b!40789) (not d!7295) (not b!40883) (not bm!3193) (not b!41045))
(check-sat b_and!2375 (not b_next!1363))
