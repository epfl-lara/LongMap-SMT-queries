; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6730 () Bool)

(assert start!6730)

(declare-fun b_free!1513 () Bool)

(declare-fun b_next!1513 () Bool)

(assert (=> start!6730 (= b_free!1513 (not b_next!1513))))

(declare-fun tp!5957 () Bool)

(declare-fun b_and!2701 () Bool)

(assert (=> start!6730 (= tp!5957 b_and!2701)))

(declare-fun b!43984 () Bool)

(declare-datatypes ((Unit!1234 0))(
  ( (Unit!1235) )
))
(declare-fun e!27885 () Unit!1234)

(declare-fun Unit!1236 () Unit!1234)

(assert (=> b!43984 (= e!27885 Unit!1236)))

(declare-datatypes ((V!2325 0))(
  ( (V!2326 (val!990 Int)) )
))
(declare-datatypes ((tuple2!1638 0))(
  ( (tuple2!1639 (_1!830 (_ BitVec 64)) (_2!830 V!2325)) )
))
(declare-fun lt!19245 () tuple2!1638)

(declare-datatypes ((List!1201 0))(
  ( (Nil!1198) (Cons!1197 (h!1774 tuple2!1638) (t!4215 List!1201)) )
))
(declare-datatypes ((ListLongMap!1203 0))(
  ( (ListLongMap!1204 (toList!617 List!1201)) )
))
(declare-fun lt!19252 () ListLongMap!1203)

(declare-fun head!893 (List!1201) tuple2!1638)

(assert (=> b!43984 (= lt!19245 (head!893 (toList!617 lt!19252)))))

(declare-datatypes ((array!2925 0))(
  ( (array!2926 (arr!1406 (Array (_ BitVec 32) (_ BitVec 64))) (size!1609 (_ BitVec 32))) )
))
(declare-fun lt!19247 () array!2925)

(declare-fun lt!19253 () Unit!1234)

(declare-fun lt!19248 () V!2325)

(declare-fun mask!853 () (_ BitVec 32))

(declare-datatypes ((ValueCell!704 0))(
  ( (ValueCellFull!704 (v!2084 V!2325)) (EmptyCell!704) )
))
(declare-datatypes ((array!2927 0))(
  ( (array!2928 (arr!1407 (Array (_ BitVec 32) ValueCell!704)) (size!1610 (_ BitVec 32))) )
))
(declare-fun lt!19249 () array!2927)

(declare-fun defaultEntry!470 () Int)

(declare-fun lemmaKeyInListMapIsInArray!112 (array!2925 array!2927 (_ BitVec 32) (_ BitVec 32) V!2325 V!2325 (_ BitVec 64) Int) Unit!1234)

(assert (=> b!43984 (= lt!19253 (lemmaKeyInListMapIsInArray!112 lt!19247 lt!19249 mask!853 #b00000000000000000000000000000000 lt!19248 lt!19248 (_1!830 lt!19245) defaultEntry!470))))

(declare-fun res!26011 () Bool)

(assert (=> b!43984 (= res!26011 (and (not (= (_1!830 lt!19245) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!830 lt!19245) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!27887 () Bool)

(assert (=> b!43984 (=> (not res!26011) (not e!27887))))

(assert (=> b!43984 e!27887))

(declare-fun lt!19244 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2925 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!43984 (= lt!19244 (arrayScanForKey!0 lt!19247 (_1!830 lt!19245) #b00000000000000000000000000000000))))

(assert (=> b!43984 false))

(declare-fun b!43985 () Bool)

(declare-fun arrayContainsKey!0 (array!2925 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!43985 (= e!27887 (arrayContainsKey!0 lt!19247 (_1!830 lt!19245) #b00000000000000000000000000000000))))

(declare-fun b!43986 () Bool)

(declare-fun Unit!1237 () Unit!1234)

(assert (=> b!43986 (= e!27885 Unit!1237)))

(declare-fun b!43987 () Bool)

(declare-fun e!27884 () Bool)

(declare-fun e!27886 () Bool)

(assert (=> b!43987 (= e!27884 (not e!27886))))

(declare-fun res!26010 () Bool)

(assert (=> b!43987 (=> (not res!26010) (not e!27886))))

(declare-datatypes ((LongMapFixedSize!388 0))(
  ( (LongMapFixedSize!389 (defaultEntry!1896 Int) (mask!5472 (_ BitVec 32)) (extraKeys!1787 (_ BitVec 32)) (zeroValue!1814 V!2325) (minValue!1814 V!2325) (_size!243 (_ BitVec 32)) (_keys!3462 array!2925) (_values!1879 array!2927) (_vacant!243 (_ BitVec 32))) )
))
(declare-fun lt!19250 () LongMapFixedSize!388)

(declare-fun valid!134 (LongMapFixedSize!388) Bool)

(assert (=> b!43987 (= res!26010 (valid!134 lt!19250))))

(declare-fun lt!19251 () Unit!1234)

(assert (=> b!43987 (= lt!19251 e!27885)))

(declare-fun c!5708 () Bool)

(declare-fun lt!19246 () Bool)

(assert (=> b!43987 (= c!5708 lt!19246)))

(assert (=> b!43987 (= lt!19246 (not (= lt!19252 (ListLongMap!1204 Nil!1198))))))

(declare-fun map!843 (LongMapFixedSize!388) ListLongMap!1203)

(assert (=> b!43987 (= lt!19252 (map!843 lt!19250))))

(declare-datatypes ((List!1202 0))(
  ( (Nil!1199) (Cons!1198 (h!1775 (_ BitVec 64)) (t!4216 List!1202)) )
))
(declare-fun arrayNoDuplicates!0 (array!2925 (_ BitVec 32) List!1202) Bool)

(assert (=> b!43987 (arrayNoDuplicates!0 lt!19247 #b00000000000000000000000000000000 Nil!1199)))

(declare-fun lt!19243 () Unit!1234)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2925 (_ BitVec 32) (_ BitVec 32) List!1202) Unit!1234)

(assert (=> b!43987 (= lt!19243 (lemmaArrayNoDuplicatesInAll0Array!0 lt!19247 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1199))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2925 (_ BitVec 32)) Bool)

(assert (=> b!43987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19247 mask!853)))

(declare-fun lt!19241 () Unit!1234)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2925 (_ BitVec 32) (_ BitVec 32)) Unit!1234)

(assert (=> b!43987 (= lt!19241 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!19247 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2925 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!43987 (= (arrayCountValidKeys!0 lt!19247 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!19242 () Unit!1234)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2925 (_ BitVec 32) (_ BitVec 32)) Unit!1234)

(assert (=> b!43987 (= lt!19242 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!19247 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!43987 (= lt!19250 (LongMapFixedSize!389 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19248 lt!19248 #b00000000000000000000000000000000 lt!19247 lt!19249 #b00000000000000000000000000000000))))

(assert (=> b!43987 (= lt!19249 (array!2928 ((as const (Array (_ BitVec 32) ValueCell!704)) EmptyCell!704) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!43987 (= lt!19247 (array!2926 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!264 (Int (_ BitVec 64)) V!2325)

(assert (=> b!43987 (= lt!19248 (dynLambda!264 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!43988 () Bool)

(assert (=> b!43988 (= e!27886 (not lt!19246))))

(declare-fun res!26009 () Bool)

(assert (=> start!6730 (=> (not res!26009) (not e!27884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6730 (= res!26009 (validMask!0 mask!853))))

(assert (=> start!6730 e!27884))

(assert (=> start!6730 true))

(assert (=> start!6730 tp!5957))

(assert (= (and start!6730 res!26009) b!43987))

(assert (= (and b!43987 c!5708) b!43984))

(assert (= (and b!43987 (not c!5708)) b!43986))

(assert (= (and b!43984 res!26011) b!43985))

(assert (= (and b!43987 res!26010) b!43988))

(declare-fun b_lambda!2313 () Bool)

(assert (=> (not b_lambda!2313) (not b!43987)))

(declare-fun t!4214 () Bool)

(declare-fun tb!1001 () Bool)

(assert (=> (and start!6730 (= defaultEntry!470 defaultEntry!470) t!4214) tb!1001))

(declare-fun result!1747 () Bool)

(declare-fun tp_is_empty!1903 () Bool)

(assert (=> tb!1001 (= result!1747 tp_is_empty!1903)))

(assert (=> b!43987 t!4214))

(declare-fun b_and!2703 () Bool)

(assert (= b_and!2701 (and (=> t!4214 result!1747) b_and!2703)))

(declare-fun m!38171 () Bool)

(assert (=> b!43984 m!38171))

(declare-fun m!38173 () Bool)

(assert (=> b!43984 m!38173))

(declare-fun m!38175 () Bool)

(assert (=> b!43984 m!38175))

(declare-fun m!38177 () Bool)

(assert (=> b!43985 m!38177))

(declare-fun m!38179 () Bool)

(assert (=> b!43987 m!38179))

(declare-fun m!38181 () Bool)

(assert (=> b!43987 m!38181))

(declare-fun m!38183 () Bool)

(assert (=> b!43987 m!38183))

(declare-fun m!38185 () Bool)

(assert (=> b!43987 m!38185))

(declare-fun m!38187 () Bool)

(assert (=> b!43987 m!38187))

(declare-fun m!38189 () Bool)

(assert (=> b!43987 m!38189))

(declare-fun m!38191 () Bool)

(assert (=> b!43987 m!38191))

(declare-fun m!38193 () Bool)

(assert (=> b!43987 m!38193))

(declare-fun m!38195 () Bool)

(assert (=> b!43987 m!38195))

(declare-fun m!38197 () Bool)

(assert (=> start!6730 m!38197))

(check-sat (not b_lambda!2313) b_and!2703 (not b!43984) tp_is_empty!1903 (not b!43985) (not b_next!1513) (not b!43987) (not start!6730))
(check-sat b_and!2703 (not b_next!1513))
(get-model)

(declare-fun b_lambda!2323 () Bool)

(assert (= b_lambda!2313 (or (and start!6730 b_free!1513) b_lambda!2323)))

(check-sat b_and!2703 (not b!43984) (not b_lambda!2323) tp_is_empty!1903 (not b!43985) (not b_next!1513) (not b!43987) (not start!6730))
(check-sat b_and!2703 (not b_next!1513))
(get-model)

(declare-fun d!8243 () Bool)

(assert (=> d!8243 (arrayNoDuplicates!0 lt!19247 #b00000000000000000000000000000000 Nil!1199)))

(declare-fun lt!19339 () Unit!1234)

(declare-fun choose!111 (array!2925 (_ BitVec 32) (_ BitVec 32) List!1202) Unit!1234)

(assert (=> d!8243 (= lt!19339 (choose!111 lt!19247 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1199))))

(assert (=> d!8243 (= (size!1609 lt!19247) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!8243 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!19247 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1199) lt!19339)))

(declare-fun bs!2003 () Bool)

(assert (= bs!2003 d!8243))

(assert (=> bs!2003 m!38179))

(declare-fun m!38265 () Bool)

(assert (=> bs!2003 m!38265))

(assert (=> b!43987 d!8243))

(declare-fun d!8247 () Bool)

(declare-fun getCurrentListMap!345 (array!2925 array!2927 (_ BitVec 32) (_ BitVec 32) V!2325 V!2325 (_ BitVec 32) Int) ListLongMap!1203)

(assert (=> d!8247 (= (map!843 lt!19250) (getCurrentListMap!345 (_keys!3462 lt!19250) (_values!1879 lt!19250) (mask!5472 lt!19250) (extraKeys!1787 lt!19250) (zeroValue!1814 lt!19250) (minValue!1814 lt!19250) #b00000000000000000000000000000000 (defaultEntry!1896 lt!19250)))))

(declare-fun bs!2004 () Bool)

(assert (= bs!2004 d!8247))

(declare-fun m!38269 () Bool)

(assert (=> bs!2004 m!38269))

(assert (=> b!43987 d!8247))

(declare-fun d!8251 () Bool)

(declare-fun res!26051 () Bool)

(declare-fun e!27941 () Bool)

(assert (=> d!8251 (=> (not res!26051) (not e!27941))))

(declare-fun simpleValid!30 (LongMapFixedSize!388) Bool)

(assert (=> d!8251 (= res!26051 (simpleValid!30 lt!19250))))

(assert (=> d!8251 (= (valid!134 lt!19250) e!27941)))

(declare-fun b!44070 () Bool)

(declare-fun res!26052 () Bool)

(assert (=> b!44070 (=> (not res!26052) (not e!27941))))

(assert (=> b!44070 (= res!26052 (= (arrayCountValidKeys!0 (_keys!3462 lt!19250) #b00000000000000000000000000000000 (size!1609 (_keys!3462 lt!19250))) (_size!243 lt!19250)))))

(declare-fun b!44071 () Bool)

(declare-fun res!26053 () Bool)

(assert (=> b!44071 (=> (not res!26053) (not e!27941))))

(assert (=> b!44071 (= res!26053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3462 lt!19250) (mask!5472 lt!19250)))))

(declare-fun b!44072 () Bool)

(assert (=> b!44072 (= e!27941 (arrayNoDuplicates!0 (_keys!3462 lt!19250) #b00000000000000000000000000000000 Nil!1199))))

(assert (= (and d!8251 res!26051) b!44070))

(assert (= (and b!44070 res!26052) b!44071))

(assert (= (and b!44071 res!26053) b!44072))

(declare-fun m!38287 () Bool)

(assert (=> d!8251 m!38287))

(declare-fun m!38289 () Bool)

(assert (=> b!44070 m!38289))

(declare-fun m!38291 () Bool)

(assert (=> b!44071 m!38291))

(declare-fun m!38293 () Bool)

(assert (=> b!44072 m!38293))

(assert (=> b!43987 d!8251))

(declare-fun b!44087 () Bool)

(declare-fun e!27953 () (_ BitVec 32))

(declare-fun call!3557 () (_ BitVec 32))

(assert (=> b!44087 (= e!27953 call!3557)))

(declare-fun b!44088 () Bool)

(declare-fun e!27952 () (_ BitVec 32))

(assert (=> b!44088 (= e!27952 #b00000000000000000000000000000000)))

(declare-fun d!8259 () Bool)

(declare-fun lt!19361 () (_ BitVec 32))

(assert (=> d!8259 (and (bvsge lt!19361 #b00000000000000000000000000000000) (bvsle lt!19361 (bvsub (size!1609 lt!19247) #b00000000000000000000000000000000)))))

(assert (=> d!8259 (= lt!19361 e!27952)))

(declare-fun c!5731 () Bool)

(assert (=> d!8259 (= c!5731 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8259 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1609 lt!19247)))))

(assert (=> d!8259 (= (arrayCountValidKeys!0 lt!19247 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!19361)))

(declare-fun b!44089 () Bool)

(assert (=> b!44089 (= e!27953 (bvadd #b00000000000000000000000000000001 call!3557))))

(declare-fun bm!3554 () Bool)

(assert (=> bm!3554 (= call!3557 (arrayCountValidKeys!0 lt!19247 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!44090 () Bool)

(assert (=> b!44090 (= e!27952 e!27953)))

(declare-fun c!5732 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!44090 (= c!5732 (validKeyInArray!0 (select (arr!1406 lt!19247) #b00000000000000000000000000000000)))))

(assert (= (and d!8259 c!5731) b!44088))

(assert (= (and d!8259 (not c!5731)) b!44090))

(assert (= (and b!44090 c!5732) b!44089))

(assert (= (and b!44090 (not c!5732)) b!44087))

(assert (= (or b!44089 b!44087) bm!3554))

(declare-fun m!38299 () Bool)

(assert (=> bm!3554 m!38299))

(declare-fun m!38301 () Bool)

(assert (=> b!44090 m!38301))

(assert (=> b!44090 m!38301))

(declare-fun m!38303 () Bool)

(assert (=> b!44090 m!38303))

(assert (=> b!43987 d!8259))

(declare-fun d!8267 () Bool)

(declare-fun res!26066 () Bool)

(declare-fun e!27973 () Bool)

(assert (=> d!8267 (=> res!26066 e!27973)))

(assert (=> d!8267 (= res!26066 (bvsge #b00000000000000000000000000000000 (size!1609 lt!19247)))))

(assert (=> d!8267 (= (arrayNoDuplicates!0 lt!19247 #b00000000000000000000000000000000 Nil!1199) e!27973)))

(declare-fun b!44121 () Bool)

(declare-fun e!27974 () Bool)

(assert (=> b!44121 (= e!27973 e!27974)))

(declare-fun res!26067 () Bool)

(assert (=> b!44121 (=> (not res!26067) (not e!27974))))

(declare-fun e!27975 () Bool)

(assert (=> b!44121 (= res!26067 (not e!27975))))

(declare-fun res!26068 () Bool)

(assert (=> b!44121 (=> (not res!26068) (not e!27975))))

(assert (=> b!44121 (= res!26068 (validKeyInArray!0 (select (arr!1406 lt!19247) #b00000000000000000000000000000000)))))

(declare-fun bm!3562 () Bool)

(declare-fun call!3565 () Bool)

(declare-fun c!5745 () Bool)

(assert (=> bm!3562 (= call!3565 (arrayNoDuplicates!0 lt!19247 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5745 (Cons!1198 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) Nil!1199) Nil!1199)))))

(declare-fun b!44122 () Bool)

(declare-fun contains!573 (List!1202 (_ BitVec 64)) Bool)

(assert (=> b!44122 (= e!27975 (contains!573 Nil!1199 (select (arr!1406 lt!19247) #b00000000000000000000000000000000)))))

(declare-fun b!44123 () Bool)

(declare-fun e!27972 () Bool)

(assert (=> b!44123 (= e!27972 call!3565)))

(declare-fun b!44124 () Bool)

(assert (=> b!44124 (= e!27974 e!27972)))

(assert (=> b!44124 (= c!5745 (validKeyInArray!0 (select (arr!1406 lt!19247) #b00000000000000000000000000000000)))))

(declare-fun b!44125 () Bool)

(assert (=> b!44125 (= e!27972 call!3565)))

(assert (= (and d!8267 (not res!26066)) b!44121))

(assert (= (and b!44121 res!26068) b!44122))

(assert (= (and b!44121 res!26067) b!44124))

(assert (= (and b!44124 c!5745) b!44123))

(assert (= (and b!44124 (not c!5745)) b!44125))

(assert (= (or b!44123 b!44125) bm!3562))

(assert (=> b!44121 m!38301))

(assert (=> b!44121 m!38301))

(assert (=> b!44121 m!38303))

(assert (=> bm!3562 m!38301))

(declare-fun m!38311 () Bool)

(assert (=> bm!3562 m!38311))

(assert (=> b!44122 m!38301))

(assert (=> b!44122 m!38301))

(declare-fun m!38313 () Bool)

(assert (=> b!44122 m!38313))

(assert (=> b!44124 m!38301))

(assert (=> b!44124 m!38301))

(assert (=> b!44124 m!38303))

(assert (=> b!43987 d!8267))

(declare-fun d!8273 () Bool)

(assert (=> d!8273 (= (arrayCountValidKeys!0 lt!19247 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!19373 () Unit!1234)

(declare-fun choose!59 (array!2925 (_ BitVec 32) (_ BitVec 32)) Unit!1234)

(assert (=> d!8273 (= lt!19373 (choose!59 lt!19247 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8273 (bvslt (size!1609 lt!19247) #b01111111111111111111111111111111)))

(assert (=> d!8273 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!19247 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!19373)))

(declare-fun bs!2009 () Bool)

(assert (= bs!2009 d!8273))

(assert (=> bs!2009 m!38185))

(declare-fun m!38319 () Bool)

(assert (=> bs!2009 m!38319))

(assert (=> b!43987 d!8273))

(declare-fun b!44159 () Bool)

(declare-fun e!27998 () Bool)

(declare-fun e!27997 () Bool)

(assert (=> b!44159 (= e!27998 e!27997)))

(declare-fun lt!19390 () (_ BitVec 64))

(assert (=> b!44159 (= lt!19390 (select (arr!1406 lt!19247) #b00000000000000000000000000000000))))

(declare-fun lt!19389 () Unit!1234)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2925 (_ BitVec 64) (_ BitVec 32)) Unit!1234)

(assert (=> b!44159 (= lt!19389 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19247 lt!19390 #b00000000000000000000000000000000))))

(assert (=> b!44159 (arrayContainsKey!0 lt!19247 lt!19390 #b00000000000000000000000000000000)))

(declare-fun lt!19391 () Unit!1234)

(assert (=> b!44159 (= lt!19391 lt!19389)))

(declare-fun res!26089 () Bool)

(declare-datatypes ((SeekEntryResult!206 0))(
  ( (MissingZero!206 (index!2946 (_ BitVec 32))) (Found!206 (index!2947 (_ BitVec 32))) (Intermediate!206 (undefined!1018 Bool) (index!2948 (_ BitVec 32)) (x!8359 (_ BitVec 32))) (Undefined!206) (MissingVacant!206 (index!2949 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2925 (_ BitVec 32)) SeekEntryResult!206)

(assert (=> b!44159 (= res!26089 (= (seekEntryOrOpen!0 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) lt!19247 mask!853) (Found!206 #b00000000000000000000000000000000)))))

(assert (=> b!44159 (=> (not res!26089) (not e!27997))))

(declare-fun b!44160 () Bool)

(declare-fun e!27996 () Bool)

(assert (=> b!44160 (= e!27996 e!27998)))

(declare-fun c!5753 () Bool)

(assert (=> b!44160 (= c!5753 (validKeyInArray!0 (select (arr!1406 lt!19247) #b00000000000000000000000000000000)))))

(declare-fun b!44161 () Bool)

(declare-fun call!3572 () Bool)

(assert (=> b!44161 (= e!27997 call!3572)))

(declare-fun b!44162 () Bool)

(assert (=> b!44162 (= e!27998 call!3572)))

(declare-fun d!8279 () Bool)

(declare-fun res!26088 () Bool)

(assert (=> d!8279 (=> res!26088 e!27996)))

(assert (=> d!8279 (= res!26088 (bvsge #b00000000000000000000000000000000 (size!1609 lt!19247)))))

(assert (=> d!8279 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19247 mask!853) e!27996)))

(declare-fun bm!3569 () Bool)

(assert (=> bm!3569 (= call!3572 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!19247 mask!853))))

(assert (= (and d!8279 (not res!26088)) b!44160))

(assert (= (and b!44160 c!5753) b!44159))

(assert (= (and b!44160 (not c!5753)) b!44162))

(assert (= (and b!44159 res!26089) b!44161))

(assert (= (or b!44161 b!44162) bm!3569))

(assert (=> b!44159 m!38301))

(declare-fun m!38337 () Bool)

(assert (=> b!44159 m!38337))

(declare-fun m!38339 () Bool)

(assert (=> b!44159 m!38339))

(assert (=> b!44159 m!38301))

(declare-fun m!38341 () Bool)

(assert (=> b!44159 m!38341))

(assert (=> b!44160 m!38301))

(assert (=> b!44160 m!38301))

(assert (=> b!44160 m!38303))

(declare-fun m!38343 () Bool)

(assert (=> bm!3569 m!38343))

(assert (=> b!43987 d!8279))

(declare-fun d!8285 () Bool)

(assert (=> d!8285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19247 mask!853)))

(declare-fun lt!19397 () Unit!1234)

(declare-fun choose!34 (array!2925 (_ BitVec 32) (_ BitVec 32)) Unit!1234)

(assert (=> d!8285 (= lt!19397 (choose!34 lt!19247 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!8285 (validMask!0 mask!853)))

(assert (=> d!8285 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!19247 mask!853 #b00000000000000000000000000000000) lt!19397)))

(declare-fun bs!2011 () Bool)

(assert (= bs!2011 d!8285))

(assert (=> bs!2011 m!38191))

(declare-fun m!38347 () Bool)

(assert (=> bs!2011 m!38347))

(assert (=> bs!2011 m!38197))

(assert (=> b!43987 d!8285))

(declare-fun d!8289 () Bool)

(assert (=> d!8289 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6730 d!8289))

(declare-fun d!8301 () Bool)

(assert (=> d!8301 (= (head!893 (toList!617 lt!19252)) (h!1774 (toList!617 lt!19252)))))

(assert (=> b!43984 d!8301))

(declare-fun d!8303 () Bool)

(declare-fun e!28015 () Bool)

(assert (=> d!8303 e!28015))

(declare-fun c!5761 () Bool)

(assert (=> d!8303 (= c!5761 (and (not (= (_1!830 lt!19245) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!830 lt!19245) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!19408 () Unit!1234)

(declare-fun choose!271 (array!2925 array!2927 (_ BitVec 32) (_ BitVec 32) V!2325 V!2325 (_ BitVec 64) Int) Unit!1234)

(assert (=> d!8303 (= lt!19408 (choose!271 lt!19247 lt!19249 mask!853 #b00000000000000000000000000000000 lt!19248 lt!19248 (_1!830 lt!19245) defaultEntry!470))))

(assert (=> d!8303 (validMask!0 mask!853)))

(assert (=> d!8303 (= (lemmaKeyInListMapIsInArray!112 lt!19247 lt!19249 mask!853 #b00000000000000000000000000000000 lt!19248 lt!19248 (_1!830 lt!19245) defaultEntry!470) lt!19408)))

(declare-fun b!44192 () Bool)

(assert (=> b!44192 (= e!28015 (arrayContainsKey!0 lt!19247 (_1!830 lt!19245) #b00000000000000000000000000000000))))

(declare-fun b!44193 () Bool)

(assert (=> b!44193 (= e!28015 (ite (= (_1!830 lt!19245) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!8303 c!5761) b!44192))

(assert (= (and d!8303 (not c!5761)) b!44193))

(declare-fun m!38365 () Bool)

(assert (=> d!8303 m!38365))

(assert (=> d!8303 m!38197))

(assert (=> b!44192 m!38177))

(assert (=> b!43984 d!8303))

(declare-fun d!8309 () Bool)

(declare-fun lt!19412 () (_ BitVec 32))

(assert (=> d!8309 (and (or (bvslt lt!19412 #b00000000000000000000000000000000) (bvsge lt!19412 (size!1609 lt!19247)) (and (bvsge lt!19412 #b00000000000000000000000000000000) (bvslt lt!19412 (size!1609 lt!19247)))) (bvsge lt!19412 #b00000000000000000000000000000000) (bvslt lt!19412 (size!1609 lt!19247)) (= (select (arr!1406 lt!19247) lt!19412) (_1!830 lt!19245)))))

(declare-fun e!28027 () (_ BitVec 32))

(assert (=> d!8309 (= lt!19412 e!28027)))

(declare-fun c!5767 () Bool)

(assert (=> d!8309 (= c!5767 (= (select (arr!1406 lt!19247) #b00000000000000000000000000000000) (_1!830 lt!19245)))))

(assert (=> d!8309 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1609 lt!19247)) (bvslt (size!1609 lt!19247) #b01111111111111111111111111111111))))

(assert (=> d!8309 (= (arrayScanForKey!0 lt!19247 (_1!830 lt!19245) #b00000000000000000000000000000000) lt!19412)))

(declare-fun b!44210 () Bool)

(assert (=> b!44210 (= e!28027 #b00000000000000000000000000000000)))

(declare-fun b!44211 () Bool)

(assert (=> b!44211 (= e!28027 (arrayScanForKey!0 lt!19247 (_1!830 lt!19245) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8309 c!5767) b!44210))

(assert (= (and d!8309 (not c!5767)) b!44211))

(declare-fun m!38371 () Bool)

(assert (=> d!8309 m!38371))

(assert (=> d!8309 m!38301))

(declare-fun m!38373 () Bool)

(assert (=> b!44211 m!38373))

(assert (=> b!43984 d!8309))

(declare-fun d!8311 () Bool)

(declare-fun res!26118 () Bool)

(declare-fun e!28036 () Bool)

(assert (=> d!8311 (=> res!26118 e!28036)))

(assert (=> d!8311 (= res!26118 (= (select (arr!1406 lt!19247) #b00000000000000000000000000000000) (_1!830 lt!19245)))))

(assert (=> d!8311 (= (arrayContainsKey!0 lt!19247 (_1!830 lt!19245) #b00000000000000000000000000000000) e!28036)))

(declare-fun b!44221 () Bool)

(declare-fun e!28037 () Bool)

(assert (=> b!44221 (= e!28036 e!28037)))

(declare-fun res!26119 () Bool)

(assert (=> b!44221 (=> (not res!26119) (not e!28037))))

(assert (=> b!44221 (= res!26119 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1609 lt!19247)))))

(declare-fun b!44222 () Bool)

(assert (=> b!44222 (= e!28037 (arrayContainsKey!0 lt!19247 (_1!830 lt!19245) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8311 (not res!26118)) b!44221))

(assert (= (and b!44221 res!26119) b!44222))

(assert (=> d!8311 m!38301))

(declare-fun m!38379 () Bool)

(assert (=> b!44222 m!38379))

(assert (=> b!43985 d!8311))

(check-sat (not d!8247) (not d!8303) (not d!8251) (not bm!3554) (not b!44160) (not bm!3569) (not b_lambda!2323) (not b!44159) (not b!44072) (not b!44124) (not d!8243) (not d!8285) (not b!44211) (not b_next!1513) (not b!44121) (not b!44122) (not d!8273) (not b!44070) b_and!2703 tp_is_empty!1903 (not b!44192) (not b!44071) (not b!44222) (not bm!3562) (not b!44090))
(check-sat b_and!2703 (not b_next!1513))
(get-model)

(declare-fun d!8317 () Bool)

(declare-fun res!26123 () Bool)

(declare-fun e!28039 () Bool)

(assert (=> d!8317 (=> res!26123 e!28039)))

(assert (=> d!8317 (= res!26123 (bvsge #b00000000000000000000000000000000 (size!1609 (_keys!3462 lt!19250))))))

(assert (=> d!8317 (= (arrayNoDuplicates!0 (_keys!3462 lt!19250) #b00000000000000000000000000000000 Nil!1199) e!28039)))

(declare-fun b!44223 () Bool)

(declare-fun e!28040 () Bool)

(assert (=> b!44223 (= e!28039 e!28040)))

(declare-fun res!26124 () Bool)

(assert (=> b!44223 (=> (not res!26124) (not e!28040))))

(declare-fun e!28041 () Bool)

(assert (=> b!44223 (= res!26124 (not e!28041))))

(declare-fun res!26125 () Bool)

(assert (=> b!44223 (=> (not res!26125) (not e!28041))))

(assert (=> b!44223 (= res!26125 (validKeyInArray!0 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)))))

(declare-fun bm!3573 () Bool)

(declare-fun call!3576 () Bool)

(declare-fun c!5769 () Bool)

(assert (=> bm!3573 (= call!3576 (arrayNoDuplicates!0 (_keys!3462 lt!19250) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5769 (Cons!1198 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000) Nil!1199) Nil!1199)))))

(declare-fun b!44224 () Bool)

(assert (=> b!44224 (= e!28041 (contains!573 Nil!1199 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)))))

(declare-fun b!44225 () Bool)

(declare-fun e!28038 () Bool)

(assert (=> b!44225 (= e!28038 call!3576)))

(declare-fun b!44226 () Bool)

(assert (=> b!44226 (= e!28040 e!28038)))

(assert (=> b!44226 (= c!5769 (validKeyInArray!0 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)))))

(declare-fun b!44227 () Bool)

(assert (=> b!44227 (= e!28038 call!3576)))

(assert (= (and d!8317 (not res!26123)) b!44223))

(assert (= (and b!44223 res!26125) b!44224))

(assert (= (and b!44223 res!26124) b!44226))

(assert (= (and b!44226 c!5769) b!44225))

(assert (= (and b!44226 (not c!5769)) b!44227))

(assert (= (or b!44225 b!44227) bm!3573))

(declare-fun m!38381 () Bool)

(assert (=> b!44223 m!38381))

(assert (=> b!44223 m!38381))

(declare-fun m!38383 () Bool)

(assert (=> b!44223 m!38383))

(assert (=> bm!3573 m!38381))

(declare-fun m!38385 () Bool)

(assert (=> bm!3573 m!38385))

(assert (=> b!44224 m!38381))

(assert (=> b!44224 m!38381))

(declare-fun m!38387 () Bool)

(assert (=> b!44224 m!38387))

(assert (=> b!44226 m!38381))

(assert (=> b!44226 m!38381))

(assert (=> b!44226 m!38383))

(assert (=> b!44072 d!8317))

(assert (=> d!8273 d!8259))

(declare-fun d!8319 () Bool)

(assert (=> d!8319 (= (arrayCountValidKeys!0 lt!19247 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(assert (=> d!8319 true))

(declare-fun _$88!55 () Unit!1234)

(assert (=> d!8319 (= (choose!59 lt!19247 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) _$88!55)))

(declare-fun bs!2015 () Bool)

(assert (= bs!2015 d!8319))

(assert (=> bs!2015 m!38185))

(assert (=> d!8273 d!8319))

(declare-fun d!8321 () Bool)

(assert (=> d!8321 (= (validKeyInArray!0 (select (arr!1406 lt!19247) #b00000000000000000000000000000000)) (and (not (= (select (arr!1406 lt!19247) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1406 lt!19247) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!44121 d!8321))

(declare-fun d!8323 () Bool)

(declare-fun e!28044 () Bool)

(assert (=> d!8323 e!28044))

(declare-fun c!5772 () Bool)

(assert (=> d!8323 (= c!5772 (and (not (= (_1!830 lt!19245) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!830 lt!19245) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!8323 true))

(declare-fun _$15!80 () Unit!1234)

(assert (=> d!8323 (= (choose!271 lt!19247 lt!19249 mask!853 #b00000000000000000000000000000000 lt!19248 lt!19248 (_1!830 lt!19245) defaultEntry!470) _$15!80)))

(declare-fun b!44232 () Bool)

(assert (=> b!44232 (= e!28044 (arrayContainsKey!0 lt!19247 (_1!830 lt!19245) #b00000000000000000000000000000000))))

(declare-fun b!44233 () Bool)

(assert (=> b!44233 (= e!28044 (ite (= (_1!830 lt!19245) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!8323 c!5772) b!44232))

(assert (= (and d!8323 (not c!5772)) b!44233))

(assert (=> b!44232 m!38177))

(assert (=> d!8303 d!8323))

(assert (=> d!8303 d!8289))

(declare-fun d!8325 () Bool)

(assert (=> d!8325 (arrayContainsKey!0 lt!19247 lt!19390 #b00000000000000000000000000000000)))

(declare-fun lt!19415 () Unit!1234)

(declare-fun choose!13 (array!2925 (_ BitVec 64) (_ BitVec 32)) Unit!1234)

(assert (=> d!8325 (= lt!19415 (choose!13 lt!19247 lt!19390 #b00000000000000000000000000000000))))

(assert (=> d!8325 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!8325 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19247 lt!19390 #b00000000000000000000000000000000) lt!19415)))

(declare-fun bs!2016 () Bool)

(assert (= bs!2016 d!8325))

(assert (=> bs!2016 m!38339))

(declare-fun m!38389 () Bool)

(assert (=> bs!2016 m!38389))

(assert (=> b!44159 d!8325))

(declare-fun d!8327 () Bool)

(declare-fun res!26126 () Bool)

(declare-fun e!28045 () Bool)

(assert (=> d!8327 (=> res!26126 e!28045)))

(assert (=> d!8327 (= res!26126 (= (select (arr!1406 lt!19247) #b00000000000000000000000000000000) lt!19390))))

(assert (=> d!8327 (= (arrayContainsKey!0 lt!19247 lt!19390 #b00000000000000000000000000000000) e!28045)))

(declare-fun b!44234 () Bool)

(declare-fun e!28046 () Bool)

(assert (=> b!44234 (= e!28045 e!28046)))

(declare-fun res!26127 () Bool)

(assert (=> b!44234 (=> (not res!26127) (not e!28046))))

(assert (=> b!44234 (= res!26127 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1609 lt!19247)))))

(declare-fun b!44235 () Bool)

(assert (=> b!44235 (= e!28046 (arrayContainsKey!0 lt!19247 lt!19390 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8327 (not res!26126)) b!44234))

(assert (= (and b!44234 res!26127) b!44235))

(assert (=> d!8327 m!38301))

(declare-fun m!38391 () Bool)

(assert (=> b!44235 m!38391))

(assert (=> b!44159 d!8327))

(declare-fun b!44260 () Bool)

(declare-fun e!28062 () SeekEntryResult!206)

(declare-fun e!28061 () SeekEntryResult!206)

(assert (=> b!44260 (= e!28062 e!28061)))

(declare-fun lt!19428 () (_ BitVec 64))

(declare-fun lt!19429 () SeekEntryResult!206)

(assert (=> b!44260 (= lt!19428 (select (arr!1406 lt!19247) (index!2948 lt!19429)))))

(declare-fun c!5785 () Bool)

(assert (=> b!44260 (= c!5785 (= lt!19428 (select (arr!1406 lt!19247) #b00000000000000000000000000000000)))))

(declare-fun b!44261 () Bool)

(declare-fun e!28060 () SeekEntryResult!206)

(assert (=> b!44261 (= e!28060 (MissingZero!206 (index!2948 lt!19429)))))

(declare-fun b!44262 () Bool)

(assert (=> b!44262 (= e!28061 (Found!206 (index!2948 lt!19429)))))

(declare-fun b!44264 () Bool)

(assert (=> b!44264 (= e!28062 Undefined!206)))

(declare-fun b!44265 () Bool)

(declare-fun c!5784 () Bool)

(assert (=> b!44265 (= c!5784 (= lt!19428 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!44265 (= e!28061 e!28060)))

(declare-fun b!44263 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2925 (_ BitVec 32)) SeekEntryResult!206)

(assert (=> b!44263 (= e!28060 (seekKeyOrZeroReturnVacant!0 (x!8359 lt!19429) (index!2948 lt!19429) (index!2948 lt!19429) (select (arr!1406 lt!19247) #b00000000000000000000000000000000) lt!19247 mask!853))))

(declare-fun d!8329 () Bool)

(declare-fun lt!19427 () SeekEntryResult!206)

(get-info :version)

(assert (=> d!8329 (and (or ((_ is Undefined!206) lt!19427) (not ((_ is Found!206) lt!19427)) (and (bvsge (index!2947 lt!19427) #b00000000000000000000000000000000) (bvslt (index!2947 lt!19427) (size!1609 lt!19247)))) (or ((_ is Undefined!206) lt!19427) ((_ is Found!206) lt!19427) (not ((_ is MissingZero!206) lt!19427)) (and (bvsge (index!2946 lt!19427) #b00000000000000000000000000000000) (bvslt (index!2946 lt!19427) (size!1609 lt!19247)))) (or ((_ is Undefined!206) lt!19427) ((_ is Found!206) lt!19427) ((_ is MissingZero!206) lt!19427) (not ((_ is MissingVacant!206) lt!19427)) (and (bvsge (index!2949 lt!19427) #b00000000000000000000000000000000) (bvslt (index!2949 lt!19427) (size!1609 lt!19247)))) (or ((_ is Undefined!206) lt!19427) (ite ((_ is Found!206) lt!19427) (= (select (arr!1406 lt!19247) (index!2947 lt!19427)) (select (arr!1406 lt!19247) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!206) lt!19427) (= (select (arr!1406 lt!19247) (index!2946 lt!19427)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!206) lt!19427) (= (select (arr!1406 lt!19247) (index!2949 lt!19427)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!8329 (= lt!19427 e!28062)))

(declare-fun c!5786 () Bool)

(assert (=> d!8329 (= c!5786 (and ((_ is Intermediate!206) lt!19429) (undefined!1018 lt!19429)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2925 (_ BitVec 32)) SeekEntryResult!206)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!8329 (= lt!19429 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) mask!853) (select (arr!1406 lt!19247) #b00000000000000000000000000000000) lt!19247 mask!853))))

(assert (=> d!8329 (validMask!0 mask!853)))

(assert (=> d!8329 (= (seekEntryOrOpen!0 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) lt!19247 mask!853) lt!19427)))

(assert (= (and d!8329 c!5786) b!44264))

(assert (= (and d!8329 (not c!5786)) b!44260))

(assert (= (and b!44260 c!5785) b!44262))

(assert (= (and b!44260 (not c!5785)) b!44265))

(assert (= (and b!44265 c!5784) b!44261))

(assert (= (and b!44265 (not c!5784)) b!44263))

(declare-fun m!38413 () Bool)

(assert (=> b!44260 m!38413))

(assert (=> b!44263 m!38301))

(declare-fun m!38415 () Bool)

(assert (=> b!44263 m!38415))

(assert (=> d!8329 m!38301))

(declare-fun m!38417 () Bool)

(assert (=> d!8329 m!38417))

(declare-fun m!38419 () Bool)

(assert (=> d!8329 m!38419))

(declare-fun m!38421 () Bool)

(assert (=> d!8329 m!38421))

(declare-fun m!38423 () Bool)

(assert (=> d!8329 m!38423))

(assert (=> d!8329 m!38417))

(assert (=> d!8329 m!38301))

(declare-fun m!38425 () Bool)

(assert (=> d!8329 m!38425))

(assert (=> d!8329 m!38197))

(assert (=> b!44159 d!8329))

(declare-fun d!8341 () Bool)

(declare-fun res!26130 () Bool)

(declare-fun e!28064 () Bool)

(assert (=> d!8341 (=> res!26130 e!28064)))

(assert (=> d!8341 (= res!26130 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1609 lt!19247)))))

(assert (=> d!8341 (= (arrayNoDuplicates!0 lt!19247 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5745 (Cons!1198 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) Nil!1199) Nil!1199)) e!28064)))

(declare-fun b!44266 () Bool)

(declare-fun e!28065 () Bool)

(assert (=> b!44266 (= e!28064 e!28065)))

(declare-fun res!26131 () Bool)

(assert (=> b!44266 (=> (not res!26131) (not e!28065))))

(declare-fun e!28066 () Bool)

(assert (=> b!44266 (= res!26131 (not e!28066))))

(declare-fun res!26132 () Bool)

(assert (=> b!44266 (=> (not res!26132) (not e!28066))))

(assert (=> b!44266 (= res!26132 (validKeyInArray!0 (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun c!5787 () Bool)

(declare-fun bm!3577 () Bool)

(declare-fun call!3580 () Bool)

(assert (=> bm!3577 (= call!3580 (arrayNoDuplicates!0 lt!19247 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5787 (Cons!1198 (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5745 (Cons!1198 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) Nil!1199) Nil!1199)) (ite c!5745 (Cons!1198 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) Nil!1199) Nil!1199))))))

(declare-fun b!44267 () Bool)

(assert (=> b!44267 (= e!28066 (contains!573 (ite c!5745 (Cons!1198 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) Nil!1199) Nil!1199) (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!44268 () Bool)

(declare-fun e!28063 () Bool)

(assert (=> b!44268 (= e!28063 call!3580)))

(declare-fun b!44269 () Bool)

(assert (=> b!44269 (= e!28065 e!28063)))

(assert (=> b!44269 (= c!5787 (validKeyInArray!0 (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!44270 () Bool)

(assert (=> b!44270 (= e!28063 call!3580)))

(assert (= (and d!8341 (not res!26130)) b!44266))

(assert (= (and b!44266 res!26132) b!44267))

(assert (= (and b!44266 res!26131) b!44269))

(assert (= (and b!44269 c!5787) b!44268))

(assert (= (and b!44269 (not c!5787)) b!44270))

(assert (= (or b!44268 b!44270) bm!3577))

(declare-fun m!38427 () Bool)

(assert (=> b!44266 m!38427))

(assert (=> b!44266 m!38427))

(declare-fun m!38429 () Bool)

(assert (=> b!44266 m!38429))

(assert (=> bm!3577 m!38427))

(declare-fun m!38431 () Bool)

(assert (=> bm!3577 m!38431))

(assert (=> b!44267 m!38427))

(assert (=> b!44267 m!38427))

(declare-fun m!38435 () Bool)

(assert (=> b!44267 m!38435))

(assert (=> b!44269 m!38427))

(assert (=> b!44269 m!38427))

(assert (=> b!44269 m!38429))

(assert (=> bm!3562 d!8341))

(assert (=> d!8243 d!8267))

(declare-fun d!8345 () Bool)

(assert (=> d!8345 (arrayNoDuplicates!0 lt!19247 #b00000000000000000000000000000000 Nil!1199)))

(assert (=> d!8345 true))

(declare-fun res!26137 () Unit!1234)

(assert (=> d!8345 (= (choose!111 lt!19247 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1199) res!26137)))

(declare-fun bs!2018 () Bool)

(assert (= bs!2018 d!8345))

(assert (=> bs!2018 m!38179))

(assert (=> d!8243 d!8345))

(assert (=> b!44090 d!8321))

(declare-fun b!44273 () Bool)

(declare-fun e!28070 () (_ BitVec 32))

(declare-fun call!3581 () (_ BitVec 32))

(assert (=> b!44273 (= e!28070 call!3581)))

(declare-fun b!44274 () Bool)

(declare-fun e!28069 () (_ BitVec 32))

(assert (=> b!44274 (= e!28069 #b00000000000000000000000000000000)))

(declare-fun d!8349 () Bool)

(declare-fun lt!19433 () (_ BitVec 32))

(assert (=> d!8349 (and (bvsge lt!19433 #b00000000000000000000000000000000) (bvsle lt!19433 (bvsub (size!1609 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)))))

(assert (=> d!8349 (= lt!19433 e!28069)))

(declare-fun c!5788 () Bool)

(assert (=> d!8349 (= c!5788 (bvsge #b00000000000000000000000000000000 (size!1609 (_keys!3462 lt!19250))))))

(assert (=> d!8349 (and (bvsle #b00000000000000000000000000000000 (size!1609 (_keys!3462 lt!19250))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1609 (_keys!3462 lt!19250)) (size!1609 (_keys!3462 lt!19250))))))

(assert (=> d!8349 (= (arrayCountValidKeys!0 (_keys!3462 lt!19250) #b00000000000000000000000000000000 (size!1609 (_keys!3462 lt!19250))) lt!19433)))

(declare-fun b!44275 () Bool)

(assert (=> b!44275 (= e!28070 (bvadd #b00000000000000000000000000000001 call!3581))))

(declare-fun bm!3578 () Bool)

(assert (=> bm!3578 (= call!3581 (arrayCountValidKeys!0 (_keys!3462 lt!19250) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1609 (_keys!3462 lt!19250))))))

(declare-fun b!44276 () Bool)

(assert (=> b!44276 (= e!28069 e!28070)))

(declare-fun c!5789 () Bool)

(assert (=> b!44276 (= c!5789 (validKeyInArray!0 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)))))

(assert (= (and d!8349 c!5788) b!44274))

(assert (= (and d!8349 (not c!5788)) b!44276))

(assert (= (and b!44276 c!5789) b!44275))

(assert (= (and b!44276 (not c!5789)) b!44273))

(assert (= (or b!44275 b!44273) bm!3578))

(declare-fun m!38439 () Bool)

(assert (=> bm!3578 m!38439))

(assert (=> b!44276 m!38381))

(assert (=> b!44276 m!38381))

(assert (=> b!44276 m!38383))

(assert (=> b!44070 d!8349))

(assert (=> b!44192 d!8311))

(declare-fun d!8351 () Bool)

(declare-fun res!26138 () Bool)

(declare-fun e!28071 () Bool)

(assert (=> d!8351 (=> res!26138 e!28071)))

(assert (=> d!8351 (= res!26138 (= (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_1!830 lt!19245)))))

(assert (=> d!8351 (= (arrayContainsKey!0 lt!19247 (_1!830 lt!19245) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!28071)))

(declare-fun b!44277 () Bool)

(declare-fun e!28072 () Bool)

(assert (=> b!44277 (= e!28071 e!28072)))

(declare-fun res!26139 () Bool)

(assert (=> b!44277 (=> (not res!26139) (not e!28072))))

(assert (=> b!44277 (= res!26139 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1609 lt!19247)))))

(declare-fun b!44278 () Bool)

(assert (=> b!44278 (= e!28072 (arrayContainsKey!0 lt!19247 (_1!830 lt!19245) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!8351 (not res!26138)) b!44277))

(assert (= (and b!44277 res!26139) b!44278))

(assert (=> d!8351 m!38427))

(declare-fun m!38441 () Bool)

(assert (=> b!44278 m!38441))

(assert (=> b!44222 d!8351))

(declare-fun b!44279 () Bool)

(declare-fun e!28075 () Bool)

(declare-fun e!28074 () Bool)

(assert (=> b!44279 (= e!28075 e!28074)))

(declare-fun lt!19435 () (_ BitVec 64))

(assert (=> b!44279 (= lt!19435 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000))))

(declare-fun lt!19434 () Unit!1234)

(assert (=> b!44279 (= lt!19434 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3462 lt!19250) lt!19435 #b00000000000000000000000000000000))))

(assert (=> b!44279 (arrayContainsKey!0 (_keys!3462 lt!19250) lt!19435 #b00000000000000000000000000000000)))

(declare-fun lt!19436 () Unit!1234)

(assert (=> b!44279 (= lt!19436 lt!19434)))

(declare-fun res!26141 () Bool)

(assert (=> b!44279 (= res!26141 (= (seekEntryOrOpen!0 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000) (_keys!3462 lt!19250) (mask!5472 lt!19250)) (Found!206 #b00000000000000000000000000000000)))))

(assert (=> b!44279 (=> (not res!26141) (not e!28074))))

(declare-fun b!44280 () Bool)

(declare-fun e!28073 () Bool)

(assert (=> b!44280 (= e!28073 e!28075)))

(declare-fun c!5790 () Bool)

(assert (=> b!44280 (= c!5790 (validKeyInArray!0 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)))))

(declare-fun b!44281 () Bool)

(declare-fun call!3582 () Bool)

(assert (=> b!44281 (= e!28074 call!3582)))

(declare-fun b!44282 () Bool)

(assert (=> b!44282 (= e!28075 call!3582)))

(declare-fun d!8353 () Bool)

(declare-fun res!26140 () Bool)

(assert (=> d!8353 (=> res!26140 e!28073)))

(assert (=> d!8353 (= res!26140 (bvsge #b00000000000000000000000000000000 (size!1609 (_keys!3462 lt!19250))))))

(assert (=> d!8353 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3462 lt!19250) (mask!5472 lt!19250)) e!28073)))

(declare-fun bm!3579 () Bool)

(assert (=> bm!3579 (= call!3582 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3462 lt!19250) (mask!5472 lt!19250)))))

(assert (= (and d!8353 (not res!26140)) b!44280))

(assert (= (and b!44280 c!5790) b!44279))

(assert (= (and b!44280 (not c!5790)) b!44282))

(assert (= (and b!44279 res!26141) b!44281))

(assert (= (or b!44281 b!44282) bm!3579))

(assert (=> b!44279 m!38381))

(declare-fun m!38443 () Bool)

(assert (=> b!44279 m!38443))

(declare-fun m!38445 () Bool)

(assert (=> b!44279 m!38445))

(assert (=> b!44279 m!38381))

(declare-fun m!38447 () Bool)

(assert (=> b!44279 m!38447))

(assert (=> b!44280 m!38381))

(assert (=> b!44280 m!38381))

(assert (=> b!44280 m!38383))

(declare-fun m!38449 () Bool)

(assert (=> bm!3579 m!38449))

(assert (=> b!44071 d!8353))

(assert (=> d!8285 d!8279))

(declare-fun d!8355 () Bool)

(assert (=> d!8355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19247 mask!853)))

(assert (=> d!8355 true))

(declare-fun _$30!69 () Unit!1234)

(assert (=> d!8355 (= (choose!34 lt!19247 mask!853 #b00000000000000000000000000000000) _$30!69)))

(declare-fun bs!2019 () Bool)

(assert (= bs!2019 d!8355))

(assert (=> bs!2019 m!38191))

(assert (=> d!8285 d!8355))

(assert (=> d!8285 d!8289))

(assert (=> b!44124 d!8321))

(declare-fun b!44283 () Bool)

(declare-fun e!28077 () (_ BitVec 32))

(declare-fun call!3583 () (_ BitVec 32))

(assert (=> b!44283 (= e!28077 call!3583)))

(declare-fun b!44284 () Bool)

(declare-fun e!28076 () (_ BitVec 32))

(assert (=> b!44284 (= e!28076 #b00000000000000000000000000000000)))

(declare-fun d!8357 () Bool)

(declare-fun lt!19437 () (_ BitVec 32))

(assert (=> d!8357 (and (bvsge lt!19437 #b00000000000000000000000000000000) (bvsle lt!19437 (bvsub (size!1609 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!8357 (= lt!19437 e!28076)))

(declare-fun c!5791 () Bool)

(assert (=> d!8357 (= c!5791 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8357 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1609 lt!19247)))))

(assert (=> d!8357 (= (arrayCountValidKeys!0 lt!19247 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!19437)))

(declare-fun b!44285 () Bool)

(assert (=> b!44285 (= e!28077 (bvadd #b00000000000000000000000000000001 call!3583))))

(declare-fun bm!3580 () Bool)

(assert (=> bm!3580 (= call!3583 (arrayCountValidKeys!0 lt!19247 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!44286 () Bool)

(assert (=> b!44286 (= e!28076 e!28077)))

(declare-fun c!5792 () Bool)

(assert (=> b!44286 (= c!5792 (validKeyInArray!0 (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!8357 c!5791) b!44284))

(assert (= (and d!8357 (not c!5791)) b!44286))

(assert (= (and b!44286 c!5792) b!44285))

(assert (= (and b!44286 (not c!5792)) b!44283))

(assert (= (or b!44285 b!44283) bm!3580))

(declare-fun m!38451 () Bool)

(assert (=> bm!3580 m!38451))

(assert (=> b!44286 m!38427))

(assert (=> b!44286 m!38427))

(assert (=> b!44286 m!38429))

(assert (=> bm!3554 d!8357))

(declare-fun bm!3621 () Bool)

(declare-fun call!3629 () ListLongMap!1203)

(declare-fun call!3628 () ListLongMap!1203)

(assert (=> bm!3621 (= call!3629 call!3628)))

(declare-fun d!8359 () Bool)

(declare-fun e!28207 () Bool)

(assert (=> d!8359 e!28207))

(declare-fun res!26238 () Bool)

(assert (=> d!8359 (=> (not res!26238) (not e!28207))))

(assert (=> d!8359 (= res!26238 (or (bvsge #b00000000000000000000000000000000 (size!1609 (_keys!3462 lt!19250))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1609 (_keys!3462 lt!19250))))))))

(declare-fun lt!19581 () ListLongMap!1203)

(declare-fun lt!19576 () ListLongMap!1203)

(assert (=> d!8359 (= lt!19581 lt!19576)))

(declare-fun lt!19585 () Unit!1234)

(declare-fun e!28203 () Unit!1234)

(assert (=> d!8359 (= lt!19585 e!28203)))

(declare-fun c!5856 () Bool)

(declare-fun e!28202 () Bool)

(assert (=> d!8359 (= c!5856 e!28202)))

(declare-fun res!26243 () Bool)

(assert (=> d!8359 (=> (not res!26243) (not e!28202))))

(assert (=> d!8359 (= res!26243 (bvslt #b00000000000000000000000000000000 (size!1609 (_keys!3462 lt!19250))))))

(declare-fun e!28212 () ListLongMap!1203)

(assert (=> d!8359 (= lt!19576 e!28212)))

(declare-fun c!5853 () Bool)

(assert (=> d!8359 (= c!5853 (and (not (= (bvand (extraKeys!1787 lt!19250) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1787 lt!19250) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!8359 (validMask!0 (mask!5472 lt!19250))))

(assert (=> d!8359 (= (getCurrentListMap!345 (_keys!3462 lt!19250) (_values!1879 lt!19250) (mask!5472 lt!19250) (extraKeys!1787 lt!19250) (zeroValue!1814 lt!19250) (minValue!1814 lt!19250) #b00000000000000000000000000000000 (defaultEntry!1896 lt!19250)) lt!19581)))

(declare-fun bm!3622 () Bool)

(declare-fun call!3626 () ListLongMap!1203)

(declare-fun call!3625 () ListLongMap!1203)

(assert (=> bm!3622 (= call!3626 call!3625)))

(declare-fun b!44497 () Bool)

(declare-fun e!28204 () ListLongMap!1203)

(assert (=> b!44497 (= e!28212 e!28204)))

(declare-fun c!5857 () Bool)

(assert (=> b!44497 (= c!5857 (and (not (= (bvand (extraKeys!1787 lt!19250) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1787 lt!19250) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!44498 () Bool)

(assert (=> b!44498 (= e!28202 (validKeyInArray!0 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)))))

(declare-fun b!44499 () Bool)

(declare-fun e!28208 () Bool)

(assert (=> b!44499 (= e!28208 (validKeyInArray!0 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)))))

(declare-fun bm!3623 () Bool)

(declare-fun call!3627 () Bool)

(declare-fun contains!576 (ListLongMap!1203 (_ BitVec 64)) Bool)

(assert (=> bm!3623 (= call!3627 (contains!576 lt!19581 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!44500 () Bool)

(declare-fun c!5854 () Bool)

(assert (=> b!44500 (= c!5854 (and (not (= (bvand (extraKeys!1787 lt!19250) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1787 lt!19250) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!28205 () ListLongMap!1203)

(assert (=> b!44500 (= e!28204 e!28205)))

(declare-fun b!44501 () Bool)

(declare-fun e!28210 () Bool)

(declare-fun e!28201 () Bool)

(assert (=> b!44501 (= e!28210 e!28201)))

(declare-fun res!26239 () Bool)

(declare-fun call!3624 () Bool)

(assert (=> b!44501 (= res!26239 call!3624)))

(assert (=> b!44501 (=> (not res!26239) (not e!28201))))

(declare-fun b!44502 () Bool)

(declare-fun apply!62 (ListLongMap!1203 (_ BitVec 64)) V!2325)

(assert (=> b!44502 (= e!28201 (= (apply!62 lt!19581 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1814 lt!19250)))))

(declare-fun b!44503 () Bool)

(declare-fun e!28206 () Bool)

(declare-fun e!28209 () Bool)

(assert (=> b!44503 (= e!28206 e!28209)))

(declare-fun res!26242 () Bool)

(assert (=> b!44503 (= res!26242 call!3627)))

(assert (=> b!44503 (=> (not res!26242) (not e!28209))))

(declare-fun b!44504 () Bool)

(declare-fun Unit!1247 () Unit!1234)

(assert (=> b!44504 (= e!28203 Unit!1247)))

(declare-fun b!44505 () Bool)

(declare-fun lt!19575 () Unit!1234)

(assert (=> b!44505 (= e!28203 lt!19575)))

(declare-fun lt!19590 () ListLongMap!1203)

(declare-fun getCurrentListMapNoExtraKeys!40 (array!2925 array!2927 (_ BitVec 32) (_ BitVec 32) V!2325 V!2325 (_ BitVec 32) Int) ListLongMap!1203)

(assert (=> b!44505 (= lt!19590 (getCurrentListMapNoExtraKeys!40 (_keys!3462 lt!19250) (_values!1879 lt!19250) (mask!5472 lt!19250) (extraKeys!1787 lt!19250) (zeroValue!1814 lt!19250) (minValue!1814 lt!19250) #b00000000000000000000000000000000 (defaultEntry!1896 lt!19250)))))

(declare-fun lt!19587 () (_ BitVec 64))

(assert (=> b!44505 (= lt!19587 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19593 () (_ BitVec 64))

(assert (=> b!44505 (= lt!19593 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000))))

(declare-fun lt!19588 () Unit!1234)

(declare-fun addStillContains!38 (ListLongMap!1203 (_ BitVec 64) V!2325 (_ BitVec 64)) Unit!1234)

(assert (=> b!44505 (= lt!19588 (addStillContains!38 lt!19590 lt!19587 (zeroValue!1814 lt!19250) lt!19593))))

(declare-fun +!71 (ListLongMap!1203 tuple2!1638) ListLongMap!1203)

(assert (=> b!44505 (contains!576 (+!71 lt!19590 (tuple2!1639 lt!19587 (zeroValue!1814 lt!19250))) lt!19593)))

(declare-fun lt!19577 () Unit!1234)

(assert (=> b!44505 (= lt!19577 lt!19588)))

(declare-fun lt!19589 () ListLongMap!1203)

(assert (=> b!44505 (= lt!19589 (getCurrentListMapNoExtraKeys!40 (_keys!3462 lt!19250) (_values!1879 lt!19250) (mask!5472 lt!19250) (extraKeys!1787 lt!19250) (zeroValue!1814 lt!19250) (minValue!1814 lt!19250) #b00000000000000000000000000000000 (defaultEntry!1896 lt!19250)))))

(declare-fun lt!19586 () (_ BitVec 64))

(assert (=> b!44505 (= lt!19586 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19580 () (_ BitVec 64))

(assert (=> b!44505 (= lt!19580 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000))))

(declare-fun lt!19584 () Unit!1234)

(declare-fun addApplyDifferent!38 (ListLongMap!1203 (_ BitVec 64) V!2325 (_ BitVec 64)) Unit!1234)

(assert (=> b!44505 (= lt!19584 (addApplyDifferent!38 lt!19589 lt!19586 (minValue!1814 lt!19250) lt!19580))))

(assert (=> b!44505 (= (apply!62 (+!71 lt!19589 (tuple2!1639 lt!19586 (minValue!1814 lt!19250))) lt!19580) (apply!62 lt!19589 lt!19580))))

(declare-fun lt!19583 () Unit!1234)

(assert (=> b!44505 (= lt!19583 lt!19584)))

(declare-fun lt!19579 () ListLongMap!1203)

(assert (=> b!44505 (= lt!19579 (getCurrentListMapNoExtraKeys!40 (_keys!3462 lt!19250) (_values!1879 lt!19250) (mask!5472 lt!19250) (extraKeys!1787 lt!19250) (zeroValue!1814 lt!19250) (minValue!1814 lt!19250) #b00000000000000000000000000000000 (defaultEntry!1896 lt!19250)))))

(declare-fun lt!19582 () (_ BitVec 64))

(assert (=> b!44505 (= lt!19582 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19591 () (_ BitVec 64))

(assert (=> b!44505 (= lt!19591 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000))))

(declare-fun lt!19592 () Unit!1234)

(assert (=> b!44505 (= lt!19592 (addApplyDifferent!38 lt!19579 lt!19582 (zeroValue!1814 lt!19250) lt!19591))))

(assert (=> b!44505 (= (apply!62 (+!71 lt!19579 (tuple2!1639 lt!19582 (zeroValue!1814 lt!19250))) lt!19591) (apply!62 lt!19579 lt!19591))))

(declare-fun lt!19596 () Unit!1234)

(assert (=> b!44505 (= lt!19596 lt!19592)))

(declare-fun lt!19594 () ListLongMap!1203)

(assert (=> b!44505 (= lt!19594 (getCurrentListMapNoExtraKeys!40 (_keys!3462 lt!19250) (_values!1879 lt!19250) (mask!5472 lt!19250) (extraKeys!1787 lt!19250) (zeroValue!1814 lt!19250) (minValue!1814 lt!19250) #b00000000000000000000000000000000 (defaultEntry!1896 lt!19250)))))

(declare-fun lt!19578 () (_ BitVec 64))

(assert (=> b!44505 (= lt!19578 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19595 () (_ BitVec 64))

(assert (=> b!44505 (= lt!19595 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000))))

(assert (=> b!44505 (= lt!19575 (addApplyDifferent!38 lt!19594 lt!19578 (minValue!1814 lt!19250) lt!19595))))

(assert (=> b!44505 (= (apply!62 (+!71 lt!19594 (tuple2!1639 lt!19578 (minValue!1814 lt!19250))) lt!19595) (apply!62 lt!19594 lt!19595))))

(declare-fun b!44506 () Bool)

(assert (=> b!44506 (= e!28210 (not call!3624))))

(declare-fun b!44507 () Bool)

(declare-fun res!26244 () Bool)

(assert (=> b!44507 (=> (not res!26244) (not e!28207))))

(assert (=> b!44507 (= res!26244 e!28206)))

(declare-fun c!5852 () Bool)

(assert (=> b!44507 (= c!5852 (not (= (bvand (extraKeys!1787 lt!19250) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!44508 () Bool)

(assert (=> b!44508 (= e!28212 (+!71 call!3625 (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19250))))))

(declare-fun b!44509 () Bool)

(assert (=> b!44509 (= e!28209 (= (apply!62 lt!19581 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1814 lt!19250)))))

(declare-fun bm!3624 () Bool)

(assert (=> bm!3624 (= call!3624 (contains!576 lt!19581 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!44510 () Bool)

(declare-fun res!26241 () Bool)

(assert (=> b!44510 (=> (not res!26241) (not e!28207))))

(declare-fun e!28211 () Bool)

(assert (=> b!44510 (= res!26241 e!28211)))

(declare-fun res!26245 () Bool)

(assert (=> b!44510 (=> res!26245 e!28211)))

(assert (=> b!44510 (= res!26245 (not e!28208))))

(declare-fun res!26237 () Bool)

(assert (=> b!44510 (=> (not res!26237) (not e!28208))))

(assert (=> b!44510 (= res!26237 (bvslt #b00000000000000000000000000000000 (size!1609 (_keys!3462 lt!19250))))))

(declare-fun b!44511 () Bool)

(assert (=> b!44511 (= e!28205 call!3626)))

(declare-fun bm!3625 () Bool)

(declare-fun call!3630 () ListLongMap!1203)

(assert (=> bm!3625 (= call!3630 call!3629)))

(declare-fun b!44512 () Bool)

(assert (=> b!44512 (= e!28206 (not call!3627))))

(declare-fun b!44513 () Bool)

(declare-fun e!28213 () Bool)

(assert (=> b!44513 (= e!28211 e!28213)))

(declare-fun res!26240 () Bool)

(assert (=> b!44513 (=> (not res!26240) (not e!28213))))

(assert (=> b!44513 (= res!26240 (contains!576 lt!19581 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)))))

(assert (=> b!44513 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1609 (_keys!3462 lt!19250))))))

(declare-fun bm!3626 () Bool)

(assert (=> bm!3626 (= call!3625 (+!71 (ite c!5853 call!3628 (ite c!5857 call!3629 call!3630)) (ite (or c!5853 c!5857) (tuple2!1639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19250)) (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19250)))))))

(declare-fun b!44514 () Bool)

(declare-fun get!802 (ValueCell!704 V!2325) V!2325)

(assert (=> b!44514 (= e!28213 (= (apply!62 lt!19581 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)) (get!802 (select (arr!1407 (_values!1879 lt!19250)) #b00000000000000000000000000000000) (dynLambda!264 (defaultEntry!1896 lt!19250) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!44514 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1610 (_values!1879 lt!19250))))))

(assert (=> b!44514 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1609 (_keys!3462 lt!19250))))))

(declare-fun b!44515 () Bool)

(assert (=> b!44515 (= e!28204 call!3626)))

(declare-fun b!44516 () Bool)

(assert (=> b!44516 (= e!28205 call!3630)))

(declare-fun bm!3627 () Bool)

(assert (=> bm!3627 (= call!3628 (getCurrentListMapNoExtraKeys!40 (_keys!3462 lt!19250) (_values!1879 lt!19250) (mask!5472 lt!19250) (extraKeys!1787 lt!19250) (zeroValue!1814 lt!19250) (minValue!1814 lt!19250) #b00000000000000000000000000000000 (defaultEntry!1896 lt!19250)))))

(declare-fun b!44517 () Bool)

(assert (=> b!44517 (= e!28207 e!28210)))

(declare-fun c!5855 () Bool)

(assert (=> b!44517 (= c!5855 (not (= (bvand (extraKeys!1787 lt!19250) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!8359 c!5853) b!44508))

(assert (= (and d!8359 (not c!5853)) b!44497))

(assert (= (and b!44497 c!5857) b!44515))

(assert (= (and b!44497 (not c!5857)) b!44500))

(assert (= (and b!44500 c!5854) b!44511))

(assert (= (and b!44500 (not c!5854)) b!44516))

(assert (= (or b!44511 b!44516) bm!3625))

(assert (= (or b!44515 bm!3625) bm!3621))

(assert (= (or b!44515 b!44511) bm!3622))

(assert (= (or b!44508 bm!3621) bm!3627))

(assert (= (or b!44508 bm!3622) bm!3626))

(assert (= (and d!8359 res!26243) b!44498))

(assert (= (and d!8359 c!5856) b!44505))

(assert (= (and d!8359 (not c!5856)) b!44504))

(assert (= (and d!8359 res!26238) b!44510))

(assert (= (and b!44510 res!26237) b!44499))

(assert (= (and b!44510 (not res!26245)) b!44513))

(assert (= (and b!44513 res!26240) b!44514))

(assert (= (and b!44510 res!26241) b!44507))

(assert (= (and b!44507 c!5852) b!44503))

(assert (= (and b!44507 (not c!5852)) b!44512))

(assert (= (and b!44503 res!26242) b!44509))

(assert (= (or b!44503 b!44512) bm!3623))

(assert (= (and b!44507 res!26244) b!44517))

(assert (= (and b!44517 c!5855) b!44501))

(assert (= (and b!44517 (not c!5855)) b!44506))

(assert (= (and b!44501 res!26239) b!44502))

(assert (= (or b!44501 b!44506) bm!3624))

(declare-fun b_lambda!2327 () Bool)

(assert (=> (not b_lambda!2327) (not b!44514)))

(declare-fun t!4228 () Bool)

(declare-fun tb!1009 () Bool)

(assert (=> (and start!6730 (= defaultEntry!470 (defaultEntry!1896 lt!19250)) t!4228) tb!1009))

(declare-fun result!1761 () Bool)

(assert (=> tb!1009 (= result!1761 tp_is_empty!1903)))

(assert (=> b!44514 t!4228))

(declare-fun b_and!2715 () Bool)

(assert (= b_and!2703 (and (=> t!4228 result!1761) b_and!2715)))

(declare-fun m!38595 () Bool)

(assert (=> b!44509 m!38595))

(declare-fun m!38597 () Bool)

(assert (=> b!44505 m!38597))

(declare-fun m!38599 () Bool)

(assert (=> b!44505 m!38599))

(declare-fun m!38601 () Bool)

(assert (=> b!44505 m!38601))

(declare-fun m!38603 () Bool)

(assert (=> b!44505 m!38603))

(declare-fun m!38605 () Bool)

(assert (=> b!44505 m!38605))

(assert (=> b!44505 m!38603))

(declare-fun m!38607 () Bool)

(assert (=> b!44505 m!38607))

(assert (=> b!44505 m!38599))

(declare-fun m!38609 () Bool)

(assert (=> b!44505 m!38609))

(declare-fun m!38613 () Bool)

(assert (=> b!44505 m!38613))

(declare-fun m!38615 () Bool)

(assert (=> b!44505 m!38615))

(declare-fun m!38617 () Bool)

(assert (=> b!44505 m!38617))

(declare-fun m!38619 () Bool)

(assert (=> b!44505 m!38619))

(assert (=> b!44505 m!38381))

(assert (=> b!44505 m!38597))

(declare-fun m!38621 () Bool)

(assert (=> b!44505 m!38621))

(declare-fun m!38623 () Bool)

(assert (=> b!44505 m!38623))

(assert (=> b!44505 m!38623))

(declare-fun m!38625 () Bool)

(assert (=> b!44505 m!38625))

(declare-fun m!38627 () Bool)

(assert (=> b!44505 m!38627))

(declare-fun m!38629 () Bool)

(assert (=> b!44505 m!38629))

(assert (=> bm!3627 m!38613))

(assert (=> b!44498 m!38381))

(assert (=> b!44498 m!38381))

(assert (=> b!44498 m!38383))

(declare-fun m!38631 () Bool)

(assert (=> bm!3623 m!38631))

(assert (=> b!44499 m!38381))

(assert (=> b!44499 m!38381))

(assert (=> b!44499 m!38383))

(declare-fun m!38633 () Bool)

(assert (=> b!44514 m!38633))

(declare-fun m!38635 () Bool)

(assert (=> b!44514 m!38635))

(declare-fun m!38637 () Bool)

(assert (=> b!44514 m!38637))

(assert (=> b!44514 m!38381))

(declare-fun m!38641 () Bool)

(assert (=> b!44514 m!38641))

(assert (=> b!44514 m!38635))

(assert (=> b!44514 m!38381))

(assert (=> b!44514 m!38633))

(declare-fun m!38647 () Bool)

(assert (=> b!44508 m!38647))

(declare-fun m!38651 () Bool)

(assert (=> b!44502 m!38651))

(declare-fun m!38653 () Bool)

(assert (=> bm!3624 m!38653))

(declare-fun m!38655 () Bool)

(assert (=> bm!3626 m!38655))

(assert (=> b!44513 m!38381))

(assert (=> b!44513 m!38381))

(declare-fun m!38657 () Bool)

(assert (=> b!44513 m!38657))

(declare-fun m!38659 () Bool)

(assert (=> d!8359 m!38659))

(assert (=> d!8247 d!8359))

(assert (=> b!44160 d!8321))

(declare-fun d!8415 () Bool)

(declare-fun lt!19609 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!43 (List!1202) (InoxSet (_ BitVec 64)))

(assert (=> d!8415 (= lt!19609 (select (content!43 Nil!1199) (select (arr!1406 lt!19247) #b00000000000000000000000000000000)))))

(declare-fun e!28232 () Bool)

(assert (=> d!8415 (= lt!19609 e!28232)))

(declare-fun res!26259 () Bool)

(assert (=> d!8415 (=> (not res!26259) (not e!28232))))

(assert (=> d!8415 (= res!26259 ((_ is Cons!1198) Nil!1199))))

(assert (=> d!8415 (= (contains!573 Nil!1199 (select (arr!1406 lt!19247) #b00000000000000000000000000000000)) lt!19609)))

(declare-fun b!44542 () Bool)

(declare-fun e!28233 () Bool)

(assert (=> b!44542 (= e!28232 e!28233)))

(declare-fun res!26258 () Bool)

(assert (=> b!44542 (=> res!26258 e!28233)))

(assert (=> b!44542 (= res!26258 (= (h!1775 Nil!1199) (select (arr!1406 lt!19247) #b00000000000000000000000000000000)))))

(declare-fun b!44543 () Bool)

(assert (=> b!44543 (= e!28233 (contains!573 (t!4216 Nil!1199) (select (arr!1406 lt!19247) #b00000000000000000000000000000000)))))

(assert (= (and d!8415 res!26259) b!44542))

(assert (= (and b!44542 (not res!26258)) b!44543))

(declare-fun m!38667 () Bool)

(assert (=> d!8415 m!38667))

(assert (=> d!8415 m!38301))

(declare-fun m!38669 () Bool)

(assert (=> d!8415 m!38669))

(assert (=> b!44543 m!38301))

(declare-fun m!38671 () Bool)

(assert (=> b!44543 m!38671))

(assert (=> b!44122 d!8415))

(declare-fun b!44548 () Bool)

(declare-fun e!28239 () Bool)

(declare-fun e!28238 () Bool)

(assert (=> b!44548 (= e!28239 e!28238)))

(declare-fun lt!19614 () (_ BitVec 64))

(assert (=> b!44548 (= lt!19614 (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!19613 () Unit!1234)

(assert (=> b!44548 (= lt!19613 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19247 lt!19614 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!44548 (arrayContainsKey!0 lt!19247 lt!19614 #b00000000000000000000000000000000)))

(declare-fun lt!19615 () Unit!1234)

(assert (=> b!44548 (= lt!19615 lt!19613)))

(declare-fun res!26263 () Bool)

(assert (=> b!44548 (= res!26263 (= (seekEntryOrOpen!0 (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19247 mask!853) (Found!206 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!44548 (=> (not res!26263) (not e!28238))))

(declare-fun b!44549 () Bool)

(declare-fun e!28237 () Bool)

(assert (=> b!44549 (= e!28237 e!28239)))

(declare-fun c!5865 () Bool)

(assert (=> b!44549 (= c!5865 (validKeyInArray!0 (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!44550 () Bool)

(declare-fun call!3634 () Bool)

(assert (=> b!44550 (= e!28238 call!3634)))

(declare-fun b!44551 () Bool)

(assert (=> b!44551 (= e!28239 call!3634)))

(declare-fun d!8419 () Bool)

(declare-fun res!26262 () Bool)

(assert (=> d!8419 (=> res!26262 e!28237)))

(assert (=> d!8419 (= res!26262 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1609 lt!19247)))))

(assert (=> d!8419 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!19247 mask!853) e!28237)))

(declare-fun bm!3631 () Bool)

(assert (=> bm!3631 (= call!3634 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!19247 mask!853))))

(assert (= (and d!8419 (not res!26262)) b!44549))

(assert (= (and b!44549 c!5865) b!44548))

(assert (= (and b!44549 (not c!5865)) b!44551))

(assert (= (and b!44548 res!26263) b!44550))

(assert (= (or b!44550 b!44551) bm!3631))

(assert (=> b!44548 m!38427))

(declare-fun m!38681 () Bool)

(assert (=> b!44548 m!38681))

(declare-fun m!38683 () Bool)

(assert (=> b!44548 m!38683))

(assert (=> b!44548 m!38427))

(declare-fun m!38685 () Bool)

(assert (=> b!44548 m!38685))

(assert (=> b!44549 m!38427))

(assert (=> b!44549 m!38427))

(assert (=> b!44549 m!38429))

(declare-fun m!38687 () Bool)

(assert (=> bm!3631 m!38687))

(assert (=> bm!3569 d!8419))

(declare-fun d!8423 () Bool)

(declare-fun lt!19616 () (_ BitVec 32))

(assert (=> d!8423 (and (or (bvslt lt!19616 #b00000000000000000000000000000000) (bvsge lt!19616 (size!1609 lt!19247)) (and (bvsge lt!19616 #b00000000000000000000000000000000) (bvslt lt!19616 (size!1609 lt!19247)))) (bvsge lt!19616 #b00000000000000000000000000000000) (bvslt lt!19616 (size!1609 lt!19247)) (= (select (arr!1406 lt!19247) lt!19616) (_1!830 lt!19245)))))

(declare-fun e!28244 () (_ BitVec 32))

(assert (=> d!8423 (= lt!19616 e!28244)))

(declare-fun c!5867 () Bool)

(assert (=> d!8423 (= c!5867 (= (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_1!830 lt!19245)))))

(assert (=> d!8423 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1609 lt!19247)) (bvslt (size!1609 lt!19247) #b01111111111111111111111111111111))))

(assert (=> d!8423 (= (arrayScanForKey!0 lt!19247 (_1!830 lt!19245) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19616)))

(declare-fun b!44557 () Bool)

(assert (=> b!44557 (= e!28244 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(declare-fun b!44558 () Bool)

(assert (=> b!44558 (= e!28244 (arrayScanForKey!0 lt!19247 (_1!830 lt!19245) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!8423 c!5867) b!44557))

(assert (= (and d!8423 (not c!5867)) b!44558))

(declare-fun m!38689 () Bool)

(assert (=> d!8423 m!38689))

(assert (=> d!8423 m!38427))

(declare-fun m!38693 () Bool)

(assert (=> b!44558 m!38693))

(assert (=> b!44211 d!8423))

(declare-fun d!8425 () Bool)

(declare-fun res!26276 () Bool)

(declare-fun e!28247 () Bool)

(assert (=> d!8425 (=> (not res!26276) (not e!28247))))

(assert (=> d!8425 (= res!26276 (validMask!0 (mask!5472 lt!19250)))))

(assert (=> d!8425 (= (simpleValid!30 lt!19250) e!28247)))

(declare-fun b!44567 () Bool)

(declare-fun res!26278 () Bool)

(assert (=> b!44567 (=> (not res!26278) (not e!28247))))

(assert (=> b!44567 (= res!26278 (and (= (size!1610 (_values!1879 lt!19250)) (bvadd (mask!5472 lt!19250) #b00000000000000000000000000000001)) (= (size!1609 (_keys!3462 lt!19250)) (size!1610 (_values!1879 lt!19250))) (bvsge (_size!243 lt!19250) #b00000000000000000000000000000000) (bvsle (_size!243 lt!19250) (bvadd (mask!5472 lt!19250) #b00000000000000000000000000000001))))))

(declare-fun b!44568 () Bool)

(declare-fun res!26275 () Bool)

(assert (=> b!44568 (=> (not res!26275) (not e!28247))))

(declare-fun size!1628 (LongMapFixedSize!388) (_ BitVec 32))

(assert (=> b!44568 (= res!26275 (bvsge (size!1628 lt!19250) (_size!243 lt!19250)))))

(declare-fun b!44570 () Bool)

(assert (=> b!44570 (= e!28247 (and (bvsge (extraKeys!1787 lt!19250) #b00000000000000000000000000000000) (bvsle (extraKeys!1787 lt!19250) #b00000000000000000000000000000011) (bvsge (_vacant!243 lt!19250) #b00000000000000000000000000000000)))))

(declare-fun b!44569 () Bool)

(declare-fun res!26277 () Bool)

(assert (=> b!44569 (=> (not res!26277) (not e!28247))))

(assert (=> b!44569 (= res!26277 (= (size!1628 lt!19250) (bvadd (_size!243 lt!19250) (bvsdiv (bvadd (extraKeys!1787 lt!19250) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!8425 res!26276) b!44567))

(assert (= (and b!44567 res!26278) b!44568))

(assert (= (and b!44568 res!26275) b!44569))

(assert (= (and b!44569 res!26277) b!44570))

(assert (=> d!8425 m!38659))

(declare-fun m!38697 () Bool)

(assert (=> b!44568 m!38697))

(assert (=> b!44569 m!38697))

(assert (=> d!8251 d!8425))

(check-sat (not b!44278) (not b!44286) (not d!8355) (not b!44276) (not d!8319) (not d!8345) (not d!8415) (not b!44226) (not b!44508) (not b!44263) (not bm!3623) (not d!8359) (not b!44543) (not b!44549) (not bm!3573) (not b!44514) (not b!44223) (not b_lambda!2327) (not b!44235) (not b!44280) b_and!2715 (not b!44548) (not b!44569) (not bm!3624) (not b!44502) (not bm!3631) (not b_lambda!2323) (not bm!3626) (not d!8329) tp_is_empty!1903 (not d!8325) (not b!44279) (not bm!3577) (not bm!3580) (not bm!3627) (not b!44505) (not b!44499) (not b!44513) (not b!44224) (not bm!3579) (not b!44509) (not bm!3578) (not b!44266) (not b!44558) (not b!44269) (not d!8425) (not b!44267) (not b!44568) (not b_next!1513) (not b!44232) (not b!44498))
(check-sat b_and!2715 (not b_next!1513))
(get-model)

(declare-fun d!8427 () Bool)

(assert (=> d!8427 (arrayContainsKey!0 (_keys!3462 lt!19250) lt!19435 #b00000000000000000000000000000000)))

(declare-fun lt!19683 () Unit!1234)

(assert (=> d!8427 (= lt!19683 (choose!13 (_keys!3462 lt!19250) lt!19435 #b00000000000000000000000000000000))))

(assert (=> d!8427 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!8427 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3462 lt!19250) lt!19435 #b00000000000000000000000000000000) lt!19683)))

(declare-fun bs!2026 () Bool)

(assert (= bs!2026 d!8427))

(assert (=> bs!2026 m!38445))

(declare-fun m!38753 () Bool)

(assert (=> bs!2026 m!38753))

(assert (=> b!44279 d!8427))

(declare-fun d!8429 () Bool)

(declare-fun res!26306 () Bool)

(declare-fun e!28287 () Bool)

(assert (=> d!8429 (=> res!26306 e!28287)))

(assert (=> d!8429 (= res!26306 (= (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000) lt!19435))))

(assert (=> d!8429 (= (arrayContainsKey!0 (_keys!3462 lt!19250) lt!19435 #b00000000000000000000000000000000) e!28287)))

(declare-fun b!44634 () Bool)

(declare-fun e!28288 () Bool)

(assert (=> b!44634 (= e!28287 e!28288)))

(declare-fun res!26307 () Bool)

(assert (=> b!44634 (=> (not res!26307) (not e!28288))))

(assert (=> b!44634 (= res!26307 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1609 (_keys!3462 lt!19250))))))

(declare-fun b!44635 () Bool)

(assert (=> b!44635 (= e!28288 (arrayContainsKey!0 (_keys!3462 lt!19250) lt!19435 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8429 (not res!26306)) b!44634))

(assert (= (and b!44634 res!26307) b!44635))

(assert (=> d!8429 m!38381))

(declare-fun m!38755 () Bool)

(assert (=> b!44635 m!38755))

(assert (=> b!44279 d!8429))

(declare-fun b!44636 () Bool)

(declare-fun e!28291 () SeekEntryResult!206)

(declare-fun e!28290 () SeekEntryResult!206)

(assert (=> b!44636 (= e!28291 e!28290)))

(declare-fun lt!19685 () (_ BitVec 64))

(declare-fun lt!19686 () SeekEntryResult!206)

(assert (=> b!44636 (= lt!19685 (select (arr!1406 (_keys!3462 lt!19250)) (index!2948 lt!19686)))))

(declare-fun c!5887 () Bool)

(assert (=> b!44636 (= c!5887 (= lt!19685 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)))))

(declare-fun b!44637 () Bool)

(declare-fun e!28289 () SeekEntryResult!206)

(assert (=> b!44637 (= e!28289 (MissingZero!206 (index!2948 lt!19686)))))

(declare-fun b!44638 () Bool)

(assert (=> b!44638 (= e!28290 (Found!206 (index!2948 lt!19686)))))

(declare-fun b!44640 () Bool)

(assert (=> b!44640 (= e!28291 Undefined!206)))

(declare-fun b!44641 () Bool)

(declare-fun c!5886 () Bool)

(assert (=> b!44641 (= c!5886 (= lt!19685 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!44641 (= e!28290 e!28289)))

(declare-fun b!44639 () Bool)

(assert (=> b!44639 (= e!28289 (seekKeyOrZeroReturnVacant!0 (x!8359 lt!19686) (index!2948 lt!19686) (index!2948 lt!19686) (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000) (_keys!3462 lt!19250) (mask!5472 lt!19250)))))

(declare-fun d!8431 () Bool)

(declare-fun lt!19684 () SeekEntryResult!206)

(assert (=> d!8431 (and (or ((_ is Undefined!206) lt!19684) (not ((_ is Found!206) lt!19684)) (and (bvsge (index!2947 lt!19684) #b00000000000000000000000000000000) (bvslt (index!2947 lt!19684) (size!1609 (_keys!3462 lt!19250))))) (or ((_ is Undefined!206) lt!19684) ((_ is Found!206) lt!19684) (not ((_ is MissingZero!206) lt!19684)) (and (bvsge (index!2946 lt!19684) #b00000000000000000000000000000000) (bvslt (index!2946 lt!19684) (size!1609 (_keys!3462 lt!19250))))) (or ((_ is Undefined!206) lt!19684) ((_ is Found!206) lt!19684) ((_ is MissingZero!206) lt!19684) (not ((_ is MissingVacant!206) lt!19684)) (and (bvsge (index!2949 lt!19684) #b00000000000000000000000000000000) (bvslt (index!2949 lt!19684) (size!1609 (_keys!3462 lt!19250))))) (or ((_ is Undefined!206) lt!19684) (ite ((_ is Found!206) lt!19684) (= (select (arr!1406 (_keys!3462 lt!19250)) (index!2947 lt!19684)) (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!206) lt!19684) (= (select (arr!1406 (_keys!3462 lt!19250)) (index!2946 lt!19684)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!206) lt!19684) (= (select (arr!1406 (_keys!3462 lt!19250)) (index!2949 lt!19684)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!8431 (= lt!19684 e!28291)))

(declare-fun c!5888 () Bool)

(assert (=> d!8431 (= c!5888 (and ((_ is Intermediate!206) lt!19686) (undefined!1018 lt!19686)))))

(assert (=> d!8431 (= lt!19686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000) (mask!5472 lt!19250)) (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000) (_keys!3462 lt!19250) (mask!5472 lt!19250)))))

(assert (=> d!8431 (validMask!0 (mask!5472 lt!19250))))

(assert (=> d!8431 (= (seekEntryOrOpen!0 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000) (_keys!3462 lt!19250) (mask!5472 lt!19250)) lt!19684)))

(assert (= (and d!8431 c!5888) b!44640))

(assert (= (and d!8431 (not c!5888)) b!44636))

(assert (= (and b!44636 c!5887) b!44638))

(assert (= (and b!44636 (not c!5887)) b!44641))

(assert (= (and b!44641 c!5886) b!44637))

(assert (= (and b!44641 (not c!5886)) b!44639))

(declare-fun m!38757 () Bool)

(assert (=> b!44636 m!38757))

(assert (=> b!44639 m!38381))

(declare-fun m!38759 () Bool)

(assert (=> b!44639 m!38759))

(assert (=> d!8431 m!38381))

(declare-fun m!38761 () Bool)

(assert (=> d!8431 m!38761))

(declare-fun m!38763 () Bool)

(assert (=> d!8431 m!38763))

(declare-fun m!38765 () Bool)

(assert (=> d!8431 m!38765))

(declare-fun m!38767 () Bool)

(assert (=> d!8431 m!38767))

(assert (=> d!8431 m!38761))

(assert (=> d!8431 m!38381))

(declare-fun m!38769 () Bool)

(assert (=> d!8431 m!38769))

(assert (=> d!8431 m!38659))

(assert (=> b!44279 d!8431))

(declare-fun d!8433 () Bool)

(assert (=> d!8433 (= (validKeyInArray!0 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!44226 d!8433))

(assert (=> b!44280 d!8433))

(declare-fun d!8435 () Bool)

(assert (=> d!8435 (arrayContainsKey!0 lt!19247 lt!19614 #b00000000000000000000000000000000)))

(declare-fun lt!19687 () Unit!1234)

(assert (=> d!8435 (= lt!19687 (choose!13 lt!19247 lt!19614 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!8435 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!8435 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19247 lt!19614 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19687)))

(declare-fun bs!2027 () Bool)

(assert (= bs!2027 d!8435))

(assert (=> bs!2027 m!38683))

(declare-fun m!38771 () Bool)

(assert (=> bs!2027 m!38771))

(assert (=> b!44548 d!8435))

(declare-fun d!8437 () Bool)

(declare-fun res!26308 () Bool)

(declare-fun e!28292 () Bool)

(assert (=> d!8437 (=> res!26308 e!28292)))

(assert (=> d!8437 (= res!26308 (= (select (arr!1406 lt!19247) #b00000000000000000000000000000000) lt!19614))))

(assert (=> d!8437 (= (arrayContainsKey!0 lt!19247 lt!19614 #b00000000000000000000000000000000) e!28292)))

(declare-fun b!44642 () Bool)

(declare-fun e!28293 () Bool)

(assert (=> b!44642 (= e!28292 e!28293)))

(declare-fun res!26309 () Bool)

(assert (=> b!44642 (=> (not res!26309) (not e!28293))))

(assert (=> b!44642 (= res!26309 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1609 lt!19247)))))

(declare-fun b!44643 () Bool)

(assert (=> b!44643 (= e!28293 (arrayContainsKey!0 lt!19247 lt!19614 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8437 (not res!26308)) b!44642))

(assert (= (and b!44642 res!26309) b!44643))

(assert (=> d!8437 m!38301))

(declare-fun m!38773 () Bool)

(assert (=> b!44643 m!38773))

(assert (=> b!44548 d!8437))

(declare-fun b!44644 () Bool)

(declare-fun e!28296 () SeekEntryResult!206)

(declare-fun e!28295 () SeekEntryResult!206)

(assert (=> b!44644 (= e!28296 e!28295)))

(declare-fun lt!19689 () (_ BitVec 64))

(declare-fun lt!19690 () SeekEntryResult!206)

(assert (=> b!44644 (= lt!19689 (select (arr!1406 lt!19247) (index!2948 lt!19690)))))

(declare-fun c!5890 () Bool)

(assert (=> b!44644 (= c!5890 (= lt!19689 (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!44645 () Bool)

(declare-fun e!28294 () SeekEntryResult!206)

(assert (=> b!44645 (= e!28294 (MissingZero!206 (index!2948 lt!19690)))))

(declare-fun b!44646 () Bool)

(assert (=> b!44646 (= e!28295 (Found!206 (index!2948 lt!19690)))))

(declare-fun b!44648 () Bool)

(assert (=> b!44648 (= e!28296 Undefined!206)))

(declare-fun b!44649 () Bool)

(declare-fun c!5889 () Bool)

(assert (=> b!44649 (= c!5889 (= lt!19689 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!44649 (= e!28295 e!28294)))

(declare-fun b!44647 () Bool)

(assert (=> b!44647 (= e!28294 (seekKeyOrZeroReturnVacant!0 (x!8359 lt!19690) (index!2948 lt!19690) (index!2948 lt!19690) (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19247 mask!853))))

(declare-fun d!8439 () Bool)

(declare-fun lt!19688 () SeekEntryResult!206)

(assert (=> d!8439 (and (or ((_ is Undefined!206) lt!19688) (not ((_ is Found!206) lt!19688)) (and (bvsge (index!2947 lt!19688) #b00000000000000000000000000000000) (bvslt (index!2947 lt!19688) (size!1609 lt!19247)))) (or ((_ is Undefined!206) lt!19688) ((_ is Found!206) lt!19688) (not ((_ is MissingZero!206) lt!19688)) (and (bvsge (index!2946 lt!19688) #b00000000000000000000000000000000) (bvslt (index!2946 lt!19688) (size!1609 lt!19247)))) (or ((_ is Undefined!206) lt!19688) ((_ is Found!206) lt!19688) ((_ is MissingZero!206) lt!19688) (not ((_ is MissingVacant!206) lt!19688)) (and (bvsge (index!2949 lt!19688) #b00000000000000000000000000000000) (bvslt (index!2949 lt!19688) (size!1609 lt!19247)))) (or ((_ is Undefined!206) lt!19688) (ite ((_ is Found!206) lt!19688) (= (select (arr!1406 lt!19247) (index!2947 lt!19688)) (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!206) lt!19688) (= (select (arr!1406 lt!19247) (index!2946 lt!19688)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!206) lt!19688) (= (select (arr!1406 lt!19247) (index!2949 lt!19688)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!8439 (= lt!19688 e!28296)))

(declare-fun c!5891 () Bool)

(assert (=> d!8439 (= c!5891 (and ((_ is Intermediate!206) lt!19690) (undefined!1018 lt!19690)))))

(assert (=> d!8439 (= lt!19690 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!853) (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19247 mask!853))))

(assert (=> d!8439 (validMask!0 mask!853)))

(assert (=> d!8439 (= (seekEntryOrOpen!0 (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19247 mask!853) lt!19688)))

(assert (= (and d!8439 c!5891) b!44648))

(assert (= (and d!8439 (not c!5891)) b!44644))

(assert (= (and b!44644 c!5890) b!44646))

(assert (= (and b!44644 (not c!5890)) b!44649))

(assert (= (and b!44649 c!5889) b!44645))

(assert (= (and b!44649 (not c!5889)) b!44647))

(declare-fun m!38775 () Bool)

(assert (=> b!44644 m!38775))

(assert (=> b!44647 m!38427))

(declare-fun m!38777 () Bool)

(assert (=> b!44647 m!38777))

(assert (=> d!8439 m!38427))

(declare-fun m!38779 () Bool)

(assert (=> d!8439 m!38779))

(declare-fun m!38781 () Bool)

(assert (=> d!8439 m!38781))

(declare-fun m!38783 () Bool)

(assert (=> d!8439 m!38783))

(declare-fun m!38785 () Bool)

(assert (=> d!8439 m!38785))

(assert (=> d!8439 m!38779))

(assert (=> d!8439 m!38427))

(declare-fun m!38787 () Bool)

(assert (=> d!8439 m!38787))

(assert (=> d!8439 m!38197))

(assert (=> b!44548 d!8439))

(declare-fun d!8441 () Bool)

(declare-fun res!26310 () Bool)

(declare-fun e!28298 () Bool)

(assert (=> d!8441 (=> res!26310 e!28298)))

(assert (=> d!8441 (= res!26310 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1609 (_keys!3462 lt!19250))))))

(assert (=> d!8441 (= (arrayNoDuplicates!0 (_keys!3462 lt!19250) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5769 (Cons!1198 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000) Nil!1199) Nil!1199)) e!28298)))

(declare-fun b!44650 () Bool)

(declare-fun e!28299 () Bool)

(assert (=> b!44650 (= e!28298 e!28299)))

(declare-fun res!26311 () Bool)

(assert (=> b!44650 (=> (not res!26311) (not e!28299))))

(declare-fun e!28300 () Bool)

(assert (=> b!44650 (= res!26311 (not e!28300))))

(declare-fun res!26312 () Bool)

(assert (=> b!44650 (=> (not res!26312) (not e!28300))))

(assert (=> b!44650 (= res!26312 (validKeyInArray!0 (select (arr!1406 (_keys!3462 lt!19250)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun c!5892 () Bool)

(declare-fun call!3657 () Bool)

(declare-fun bm!3654 () Bool)

(assert (=> bm!3654 (= call!3657 (arrayNoDuplicates!0 (_keys!3462 lt!19250) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5892 (Cons!1198 (select (arr!1406 (_keys!3462 lt!19250)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5769 (Cons!1198 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000) Nil!1199) Nil!1199)) (ite c!5769 (Cons!1198 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000) Nil!1199) Nil!1199))))))

(declare-fun b!44651 () Bool)

(assert (=> b!44651 (= e!28300 (contains!573 (ite c!5769 (Cons!1198 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000) Nil!1199) Nil!1199) (select (arr!1406 (_keys!3462 lt!19250)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!44652 () Bool)

(declare-fun e!28297 () Bool)

(assert (=> b!44652 (= e!28297 call!3657)))

(declare-fun b!44653 () Bool)

(assert (=> b!44653 (= e!28299 e!28297)))

(assert (=> b!44653 (= c!5892 (validKeyInArray!0 (select (arr!1406 (_keys!3462 lt!19250)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!44654 () Bool)

(assert (=> b!44654 (= e!28297 call!3657)))

(assert (= (and d!8441 (not res!26310)) b!44650))

(assert (= (and b!44650 res!26312) b!44651))

(assert (= (and b!44650 res!26311) b!44653))

(assert (= (and b!44653 c!5892) b!44652))

(assert (= (and b!44653 (not c!5892)) b!44654))

(assert (= (or b!44652 b!44654) bm!3654))

(declare-fun m!38789 () Bool)

(assert (=> b!44650 m!38789))

(assert (=> b!44650 m!38789))

(declare-fun m!38791 () Bool)

(assert (=> b!44650 m!38791))

(assert (=> bm!3654 m!38789))

(declare-fun m!38793 () Bool)

(assert (=> bm!3654 m!38793))

(assert (=> b!44651 m!38789))

(assert (=> b!44651 m!38789))

(declare-fun m!38795 () Bool)

(assert (=> b!44651 m!38795))

(assert (=> b!44653 m!38789))

(assert (=> b!44653 m!38789))

(assert (=> b!44653 m!38791))

(assert (=> bm!3573 d!8441))

(declare-fun d!8443 () Bool)

(declare-datatypes ((Option!111 0))(
  ( (Some!110 (v!2090 V!2325)) (None!109) )
))
(declare-fun get!804 (Option!111) V!2325)

(declare-fun getValueByKey!105 (List!1201 (_ BitVec 64)) Option!111)

(assert (=> d!8443 (= (apply!62 lt!19581 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)) (get!804 (getValueByKey!105 (toList!617 lt!19581) (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000))))))

(declare-fun bs!2028 () Bool)

(assert (= bs!2028 d!8443))

(assert (=> bs!2028 m!38381))

(declare-fun m!38797 () Bool)

(assert (=> bs!2028 m!38797))

(assert (=> bs!2028 m!38797))

(declare-fun m!38799 () Bool)

(assert (=> bs!2028 m!38799))

(assert (=> b!44514 d!8443))

(declare-fun d!8445 () Bool)

(declare-fun c!5895 () Bool)

(assert (=> d!8445 (= c!5895 ((_ is ValueCellFull!704) (select (arr!1407 (_values!1879 lt!19250)) #b00000000000000000000000000000000)))))

(declare-fun e!28303 () V!2325)

(assert (=> d!8445 (= (get!802 (select (arr!1407 (_values!1879 lt!19250)) #b00000000000000000000000000000000) (dynLambda!264 (defaultEntry!1896 lt!19250) #b0000000000000000000000000000000000000000000000000000000000000000)) e!28303)))

(declare-fun b!44659 () Bool)

(declare-fun get!805 (ValueCell!704 V!2325) V!2325)

(assert (=> b!44659 (= e!28303 (get!805 (select (arr!1407 (_values!1879 lt!19250)) #b00000000000000000000000000000000) (dynLambda!264 (defaultEntry!1896 lt!19250) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!44660 () Bool)

(declare-fun get!806 (ValueCell!704 V!2325) V!2325)

(assert (=> b!44660 (= e!28303 (get!806 (select (arr!1407 (_values!1879 lt!19250)) #b00000000000000000000000000000000) (dynLambda!264 (defaultEntry!1896 lt!19250) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!8445 c!5895) b!44659))

(assert (= (and d!8445 (not c!5895)) b!44660))

(assert (=> b!44659 m!38633))

(assert (=> b!44659 m!38635))

(declare-fun m!38801 () Bool)

(assert (=> b!44659 m!38801))

(assert (=> b!44660 m!38633))

(assert (=> b!44660 m!38635))

(declare-fun m!38803 () Bool)

(assert (=> b!44660 m!38803))

(assert (=> b!44514 d!8445))

(declare-fun d!8447 () Bool)

(assert (=> d!8447 (= (validMask!0 (mask!5472 lt!19250)) (and (or (= (mask!5472 lt!19250) #b00000000000000000000000000000111) (= (mask!5472 lt!19250) #b00000000000000000000000000001111) (= (mask!5472 lt!19250) #b00000000000000000000000000011111) (= (mask!5472 lt!19250) #b00000000000000000000000000111111) (= (mask!5472 lt!19250) #b00000000000000000000000001111111) (= (mask!5472 lt!19250) #b00000000000000000000000011111111) (= (mask!5472 lt!19250) #b00000000000000000000000111111111) (= (mask!5472 lt!19250) #b00000000000000000000001111111111) (= (mask!5472 lt!19250) #b00000000000000000000011111111111) (= (mask!5472 lt!19250) #b00000000000000000000111111111111) (= (mask!5472 lt!19250) #b00000000000000000001111111111111) (= (mask!5472 lt!19250) #b00000000000000000011111111111111) (= (mask!5472 lt!19250) #b00000000000000000111111111111111) (= (mask!5472 lt!19250) #b00000000000000001111111111111111) (= (mask!5472 lt!19250) #b00000000000000011111111111111111) (= (mask!5472 lt!19250) #b00000000000000111111111111111111) (= (mask!5472 lt!19250) #b00000000000001111111111111111111) (= (mask!5472 lt!19250) #b00000000000011111111111111111111) (= (mask!5472 lt!19250) #b00000000000111111111111111111111) (= (mask!5472 lt!19250) #b00000000001111111111111111111111) (= (mask!5472 lt!19250) #b00000000011111111111111111111111) (= (mask!5472 lt!19250) #b00000000111111111111111111111111) (= (mask!5472 lt!19250) #b00000001111111111111111111111111) (= (mask!5472 lt!19250) #b00000011111111111111111111111111) (= (mask!5472 lt!19250) #b00000111111111111111111111111111) (= (mask!5472 lt!19250) #b00001111111111111111111111111111) (= (mask!5472 lt!19250) #b00011111111111111111111111111111) (= (mask!5472 lt!19250) #b00111111111111111111111111111111)) (bvsle (mask!5472 lt!19250) #b00111111111111111111111111111111)))))

(assert (=> d!8359 d!8447))

(declare-fun d!8449 () Bool)

(declare-fun lt!19691 () Bool)

(assert (=> d!8449 (= lt!19691 (select (content!43 Nil!1199) (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)))))

(declare-fun e!28304 () Bool)

(assert (=> d!8449 (= lt!19691 e!28304)))

(declare-fun res!26314 () Bool)

(assert (=> d!8449 (=> (not res!26314) (not e!28304))))

(assert (=> d!8449 (= res!26314 ((_ is Cons!1198) Nil!1199))))

(assert (=> d!8449 (= (contains!573 Nil!1199 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)) lt!19691)))

(declare-fun b!44661 () Bool)

(declare-fun e!28305 () Bool)

(assert (=> b!44661 (= e!28304 e!28305)))

(declare-fun res!26313 () Bool)

(assert (=> b!44661 (=> res!26313 e!28305)))

(assert (=> b!44661 (= res!26313 (= (h!1775 Nil!1199) (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)))))

(declare-fun b!44662 () Bool)

(assert (=> b!44662 (= e!28305 (contains!573 (t!4216 Nil!1199) (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)))))

(assert (= (and d!8449 res!26314) b!44661))

(assert (= (and b!44661 (not res!26313)) b!44662))

(assert (=> d!8449 m!38667))

(assert (=> d!8449 m!38381))

(declare-fun m!38805 () Bool)

(assert (=> d!8449 m!38805))

(assert (=> b!44662 m!38381))

(declare-fun m!38807 () Bool)

(assert (=> b!44662 m!38807))

(assert (=> b!44224 d!8449))

(declare-fun d!8451 () Bool)

(declare-fun e!28308 () Bool)

(assert (=> d!8451 e!28308))

(declare-fun res!26319 () Bool)

(assert (=> d!8451 (=> (not res!26319) (not e!28308))))

(declare-fun lt!19700 () ListLongMap!1203)

(assert (=> d!8451 (= res!26319 (contains!576 lt!19700 (_1!830 (ite (or c!5853 c!5857) (tuple2!1639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19250)) (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19250))))))))

(declare-fun lt!19701 () List!1201)

(assert (=> d!8451 (= lt!19700 (ListLongMap!1204 lt!19701))))

(declare-fun lt!19703 () Unit!1234)

(declare-fun lt!19702 () Unit!1234)

(assert (=> d!8451 (= lt!19703 lt!19702)))

(assert (=> d!8451 (= (getValueByKey!105 lt!19701 (_1!830 (ite (or c!5853 c!5857) (tuple2!1639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19250)) (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19250))))) (Some!110 (_2!830 (ite (or c!5853 c!5857) (tuple2!1639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19250)) (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19250))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!32 (List!1201 (_ BitVec 64) V!2325) Unit!1234)

(assert (=> d!8451 (= lt!19702 (lemmaContainsTupThenGetReturnValue!32 lt!19701 (_1!830 (ite (or c!5853 c!5857) (tuple2!1639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19250)) (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19250)))) (_2!830 (ite (or c!5853 c!5857) (tuple2!1639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19250)) (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19250))))))))

(declare-fun insertStrictlySorted!29 (List!1201 (_ BitVec 64) V!2325) List!1201)

(assert (=> d!8451 (= lt!19701 (insertStrictlySorted!29 (toList!617 (ite c!5853 call!3628 (ite c!5857 call!3629 call!3630))) (_1!830 (ite (or c!5853 c!5857) (tuple2!1639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19250)) (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19250)))) (_2!830 (ite (or c!5853 c!5857) (tuple2!1639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19250)) (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19250))))))))

(assert (=> d!8451 (= (+!71 (ite c!5853 call!3628 (ite c!5857 call!3629 call!3630)) (ite (or c!5853 c!5857) (tuple2!1639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19250)) (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19250)))) lt!19700)))

(declare-fun b!44667 () Bool)

(declare-fun res!26320 () Bool)

(assert (=> b!44667 (=> (not res!26320) (not e!28308))))

(assert (=> b!44667 (= res!26320 (= (getValueByKey!105 (toList!617 lt!19700) (_1!830 (ite (or c!5853 c!5857) (tuple2!1639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19250)) (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19250))))) (Some!110 (_2!830 (ite (or c!5853 c!5857) (tuple2!1639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19250)) (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19250)))))))))

(declare-fun b!44668 () Bool)

(declare-fun contains!578 (List!1201 tuple2!1638) Bool)

(assert (=> b!44668 (= e!28308 (contains!578 (toList!617 lt!19700) (ite (or c!5853 c!5857) (tuple2!1639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19250)) (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19250)))))))

(assert (= (and d!8451 res!26319) b!44667))

(assert (= (and b!44667 res!26320) b!44668))

(declare-fun m!38809 () Bool)

(assert (=> d!8451 m!38809))

(declare-fun m!38811 () Bool)

(assert (=> d!8451 m!38811))

(declare-fun m!38813 () Bool)

(assert (=> d!8451 m!38813))

(declare-fun m!38815 () Bool)

(assert (=> d!8451 m!38815))

(declare-fun m!38817 () Bool)

(assert (=> b!44667 m!38817))

(declare-fun m!38819 () Bool)

(assert (=> b!44668 m!38819))

(assert (=> bm!3626 d!8451))

(declare-fun d!8453 () Bool)

(declare-fun e!28313 () Bool)

(assert (=> d!8453 e!28313))

(declare-fun res!26323 () Bool)

(assert (=> d!8453 (=> res!26323 e!28313)))

(declare-fun lt!19715 () Bool)

(assert (=> d!8453 (= res!26323 (not lt!19715))))

(declare-fun lt!19712 () Bool)

(assert (=> d!8453 (= lt!19715 lt!19712)))

(declare-fun lt!19713 () Unit!1234)

(declare-fun e!28314 () Unit!1234)

(assert (=> d!8453 (= lt!19713 e!28314)))

(declare-fun c!5898 () Bool)

(assert (=> d!8453 (= c!5898 lt!19712)))

(declare-fun containsKey!74 (List!1201 (_ BitVec 64)) Bool)

(assert (=> d!8453 (= lt!19712 (containsKey!74 (toList!617 lt!19581) (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)))))

(assert (=> d!8453 (= (contains!576 lt!19581 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)) lt!19715)))

(declare-fun b!44675 () Bool)

(declare-fun lt!19714 () Unit!1234)

(assert (=> b!44675 (= e!28314 lt!19714)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!62 (List!1201 (_ BitVec 64)) Unit!1234)

(assert (=> b!44675 (= lt!19714 (lemmaContainsKeyImpliesGetValueByKeyDefined!62 (toList!617 lt!19581) (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)))))

(declare-fun isDefined!63 (Option!111) Bool)

(assert (=> b!44675 (isDefined!63 (getValueByKey!105 (toList!617 lt!19581) (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)))))

(declare-fun b!44676 () Bool)

(declare-fun Unit!1249 () Unit!1234)

(assert (=> b!44676 (= e!28314 Unit!1249)))

(declare-fun b!44677 () Bool)

(assert (=> b!44677 (= e!28313 (isDefined!63 (getValueByKey!105 (toList!617 lt!19581) (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000))))))

(assert (= (and d!8453 c!5898) b!44675))

(assert (= (and d!8453 (not c!5898)) b!44676))

(assert (= (and d!8453 (not res!26323)) b!44677))

(assert (=> d!8453 m!38381))

(declare-fun m!38821 () Bool)

(assert (=> d!8453 m!38821))

(assert (=> b!44675 m!38381))

(declare-fun m!38823 () Bool)

(assert (=> b!44675 m!38823))

(assert (=> b!44675 m!38381))

(assert (=> b!44675 m!38797))

(assert (=> b!44675 m!38797))

(declare-fun m!38825 () Bool)

(assert (=> b!44675 m!38825))

(assert (=> b!44677 m!38381))

(assert (=> b!44677 m!38797))

(assert (=> b!44677 m!38797))

(assert (=> b!44677 m!38825))

(assert (=> b!44513 d!8453))

(declare-fun d!8455 () Bool)

(assert (=> d!8455 (= (apply!62 lt!19581 #b0000000000000000000000000000000000000000000000000000000000000000) (get!804 (getValueByKey!105 (toList!617 lt!19581) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2029 () Bool)

(assert (= bs!2029 d!8455))

(declare-fun m!38827 () Bool)

(assert (=> bs!2029 m!38827))

(assert (=> bs!2029 m!38827))

(declare-fun m!38829 () Bool)

(assert (=> bs!2029 m!38829))

(assert (=> b!44509 d!8455))

(declare-fun d!8457 () Bool)

(assert (=> d!8457 (= (size!1628 lt!19250) (bvadd (_size!243 lt!19250) (bvsdiv (bvadd (extraKeys!1787 lt!19250) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!44568 d!8457))

(declare-fun b!44678 () Bool)

(declare-fun e!28316 () (_ BitVec 32))

(declare-fun call!3658 () (_ BitVec 32))

(assert (=> b!44678 (= e!28316 call!3658)))

(declare-fun b!44679 () Bool)

(declare-fun e!28315 () (_ BitVec 32))

(assert (=> b!44679 (= e!28315 #b00000000000000000000000000000000)))

(declare-fun d!8459 () Bool)

(declare-fun lt!19716 () (_ BitVec 32))

(assert (=> d!8459 (and (bvsge lt!19716 #b00000000000000000000000000000000) (bvsle lt!19716 (bvsub (size!1609 (_keys!3462 lt!19250)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!8459 (= lt!19716 e!28315)))

(declare-fun c!5899 () Bool)

(assert (=> d!8459 (= c!5899 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1609 (_keys!3462 lt!19250))))))

(assert (=> d!8459 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1609 (_keys!3462 lt!19250))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1609 (_keys!3462 lt!19250)) (size!1609 (_keys!3462 lt!19250))))))

(assert (=> d!8459 (= (arrayCountValidKeys!0 (_keys!3462 lt!19250) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1609 (_keys!3462 lt!19250))) lt!19716)))

(declare-fun b!44680 () Bool)

(assert (=> b!44680 (= e!28316 (bvadd #b00000000000000000000000000000001 call!3658))))

(declare-fun bm!3655 () Bool)

(assert (=> bm!3655 (= call!3658 (arrayCountValidKeys!0 (_keys!3462 lt!19250) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1609 (_keys!3462 lt!19250))))))

(declare-fun b!44681 () Bool)

(assert (=> b!44681 (= e!28315 e!28316)))

(declare-fun c!5900 () Bool)

(assert (=> b!44681 (= c!5900 (validKeyInArray!0 (select (arr!1406 (_keys!3462 lt!19250)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!8459 c!5899) b!44679))

(assert (= (and d!8459 (not c!5899)) b!44681))

(assert (= (and b!44681 c!5900) b!44680))

(assert (= (and b!44681 (not c!5900)) b!44678))

(assert (= (or b!44680 b!44678) bm!3655))

(declare-fun m!38831 () Bool)

(assert (=> bm!3655 m!38831))

(assert (=> b!44681 m!38789))

(assert (=> b!44681 m!38789))

(assert (=> b!44681 m!38791))

(assert (=> bm!3578 d!8459))

(declare-fun d!8461 () Bool)

(declare-fun e!28317 () Bool)

(assert (=> d!8461 e!28317))

(declare-fun res!26324 () Bool)

(assert (=> d!8461 (=> (not res!26324) (not e!28317))))

(declare-fun lt!19717 () ListLongMap!1203)

(assert (=> d!8461 (= res!26324 (contains!576 lt!19717 (_1!830 (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19250)))))))

(declare-fun lt!19718 () List!1201)

(assert (=> d!8461 (= lt!19717 (ListLongMap!1204 lt!19718))))

(declare-fun lt!19720 () Unit!1234)

(declare-fun lt!19719 () Unit!1234)

(assert (=> d!8461 (= lt!19720 lt!19719)))

(assert (=> d!8461 (= (getValueByKey!105 lt!19718 (_1!830 (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19250)))) (Some!110 (_2!830 (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19250)))))))

(assert (=> d!8461 (= lt!19719 (lemmaContainsTupThenGetReturnValue!32 lt!19718 (_1!830 (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19250))) (_2!830 (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19250)))))))

(assert (=> d!8461 (= lt!19718 (insertStrictlySorted!29 (toList!617 call!3625) (_1!830 (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19250))) (_2!830 (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19250)))))))

(assert (=> d!8461 (= (+!71 call!3625 (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19250))) lt!19717)))

(declare-fun b!44682 () Bool)

(declare-fun res!26325 () Bool)

(assert (=> b!44682 (=> (not res!26325) (not e!28317))))

(assert (=> b!44682 (= res!26325 (= (getValueByKey!105 (toList!617 lt!19717) (_1!830 (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19250)))) (Some!110 (_2!830 (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19250))))))))

(declare-fun b!44683 () Bool)

(assert (=> b!44683 (= e!28317 (contains!578 (toList!617 lt!19717) (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19250))))))

(assert (= (and d!8461 res!26324) b!44682))

(assert (= (and b!44682 res!26325) b!44683))

(declare-fun m!38833 () Bool)

(assert (=> d!8461 m!38833))

(declare-fun m!38835 () Bool)

(assert (=> d!8461 m!38835))

(declare-fun m!38837 () Bool)

(assert (=> d!8461 m!38837))

(declare-fun m!38839 () Bool)

(assert (=> d!8461 m!38839))

(declare-fun m!38841 () Bool)

(assert (=> b!44682 m!38841))

(declare-fun m!38843 () Bool)

(assert (=> b!44683 m!38843))

(assert (=> b!44508 d!8461))

(assert (=> b!44223 d!8433))

(assert (=> b!44276 d!8433))

(declare-fun b!44714 () Bool)

(declare-fun e!28338 () Bool)

(declare-fun e!28339 () Bool)

(assert (=> b!44714 (= e!28338 e!28339)))

(declare-fun res!26335 () Bool)

(declare-fun lt!19730 () SeekEntryResult!206)

(assert (=> b!44714 (= res!26335 (and ((_ is Intermediate!206) lt!19730) (not (undefined!1018 lt!19730)) (bvslt (x!8359 lt!19730) #b01111111111111111111111111111110) (bvsge (x!8359 lt!19730) #b00000000000000000000000000000000) (bvsge (x!8359 lt!19730) #b00000000000000000000000000000000)))))

(assert (=> b!44714 (=> (not res!26335) (not e!28339))))

(declare-fun b!44715 () Bool)

(assert (=> b!44715 (and (bvsge (index!2948 lt!19730) #b00000000000000000000000000000000) (bvslt (index!2948 lt!19730) (size!1609 lt!19247)))))

(declare-fun res!26334 () Bool)

(assert (=> b!44715 (= res!26334 (= (select (arr!1406 lt!19247) (index!2948 lt!19730)) (select (arr!1406 lt!19247) #b00000000000000000000000000000000)))))

(declare-fun e!28337 () Bool)

(assert (=> b!44715 (=> res!26334 e!28337)))

(assert (=> b!44715 (= e!28339 e!28337)))

(declare-fun b!44716 () Bool)

(declare-fun e!28335 () SeekEntryResult!206)

(assert (=> b!44716 (= e!28335 (Intermediate!206 false (toIndex!0 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun b!44717 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!44717 (= e!28335 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000 mask!853) (select (arr!1406 lt!19247) #b00000000000000000000000000000000) lt!19247 mask!853))))

(declare-fun b!44718 () Bool)

(assert (=> b!44718 (= e!28338 (bvsge (x!8359 lt!19730) #b01111111111111111111111111111110))))

(declare-fun b!44719 () Bool)

(assert (=> b!44719 (and (bvsge (index!2948 lt!19730) #b00000000000000000000000000000000) (bvslt (index!2948 lt!19730) (size!1609 lt!19247)))))

(declare-fun res!26336 () Bool)

(assert (=> b!44719 (= res!26336 (= (select (arr!1406 lt!19247) (index!2948 lt!19730)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!44719 (=> res!26336 e!28337)))

(declare-fun d!8463 () Bool)

(assert (=> d!8463 e!28338))

(declare-fun c!5913 () Bool)

(assert (=> d!8463 (= c!5913 (and ((_ is Intermediate!206) lt!19730) (undefined!1018 lt!19730)))))

(declare-fun e!28336 () SeekEntryResult!206)

(assert (=> d!8463 (= lt!19730 e!28336)))

(declare-fun c!5914 () Bool)

(assert (=> d!8463 (= c!5914 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!19731 () (_ BitVec 64))

(assert (=> d!8463 (= lt!19731 (select (arr!1406 lt!19247) (toIndex!0 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) mask!853)))))

(assert (=> d!8463 (validMask!0 mask!853)))

(assert (=> d!8463 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) mask!853) (select (arr!1406 lt!19247) #b00000000000000000000000000000000) lt!19247 mask!853) lt!19730)))

(declare-fun b!44720 () Bool)

(assert (=> b!44720 (= e!28336 e!28335)))

(declare-fun c!5912 () Bool)

(assert (=> b!44720 (= c!5912 (or (= lt!19731 (select (arr!1406 lt!19247) #b00000000000000000000000000000000)) (= (bvadd lt!19731 lt!19731) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!44721 () Bool)

(assert (=> b!44721 (and (bvsge (index!2948 lt!19730) #b00000000000000000000000000000000) (bvslt (index!2948 lt!19730) (size!1609 lt!19247)))))

(assert (=> b!44721 (= e!28337 (= (select (arr!1406 lt!19247) (index!2948 lt!19730)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!44722 () Bool)

(assert (=> b!44722 (= e!28336 (Intermediate!206 true (toIndex!0 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(assert (= (and d!8463 c!5914) b!44722))

(assert (= (and d!8463 (not c!5914)) b!44720))

(assert (= (and b!44720 c!5912) b!44716))

(assert (= (and b!44720 (not c!5912)) b!44717))

(assert (= (and d!8463 c!5913) b!44718))

(assert (= (and d!8463 (not c!5913)) b!44714))

(assert (= (and b!44714 res!26335) b!44715))

(assert (= (and b!44715 (not res!26334)) b!44719))

(assert (= (and b!44719 (not res!26336)) b!44721))

(assert (=> b!44717 m!38417))

(declare-fun m!38871 () Bool)

(assert (=> b!44717 m!38871))

(assert (=> b!44717 m!38871))

(assert (=> b!44717 m!38301))

(declare-fun m!38873 () Bool)

(assert (=> b!44717 m!38873))

(declare-fun m!38875 () Bool)

(assert (=> b!44715 m!38875))

(assert (=> b!44719 m!38875))

(assert (=> d!8463 m!38417))

(declare-fun m!38877 () Bool)

(assert (=> d!8463 m!38877))

(assert (=> d!8463 m!38197))

(assert (=> b!44721 m!38875))

(assert (=> d!8329 d!8463))

(declare-fun d!8479 () Bool)

(declare-fun lt!19740 () (_ BitVec 32))

(declare-fun lt!19739 () (_ BitVec 32))

(assert (=> d!8479 (= lt!19740 (bvmul (bvxor lt!19739 (bvlshr lt!19739 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!8479 (= lt!19739 ((_ extract 31 0) (bvand (bvxor (select (arr!1406 lt!19247) #b00000000000000000000000000000000) (bvlshr (select (arr!1406 lt!19247) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!8479 (and (bvsge mask!853 #b00000000000000000000000000000000) (let ((res!26339 (let ((h!1780 ((_ extract 31 0) (bvand (bvxor (select (arr!1406 lt!19247) #b00000000000000000000000000000000) (bvlshr (select (arr!1406 lt!19247) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!8378 (bvmul (bvxor h!1780 (bvlshr h!1780 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!8378 (bvlshr x!8378 #b00000000000000000000000000001101)) mask!853))))) (and (bvslt res!26339 (bvadd mask!853 #b00000000000000000000000000000001)) (bvsge res!26339 #b00000000000000000000000000000000))))))

(assert (=> d!8479 (= (toIndex!0 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) mask!853) (bvand (bvxor lt!19740 (bvlshr lt!19740 #b00000000000000000000000000001101)) mask!853))))

(assert (=> d!8329 d!8479))

(assert (=> d!8329 d!8289))

(declare-fun b!44739 () Bool)

(declare-fun e!28354 () (_ BitVec 32))

(declare-fun call!3663 () (_ BitVec 32))

(assert (=> b!44739 (= e!28354 call!3663)))

(declare-fun b!44740 () Bool)

(declare-fun e!28353 () (_ BitVec 32))

(assert (=> b!44740 (= e!28353 #b00000000000000000000000000000000)))

(declare-fun d!8493 () Bool)

(declare-fun lt!19741 () (_ BitVec 32))

(assert (=> d!8493 (and (bvsge lt!19741 #b00000000000000000000000000000000) (bvsle lt!19741 (bvsub (size!1609 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!8493 (= lt!19741 e!28353)))

(declare-fun c!5918 () Bool)

(assert (=> d!8493 (= c!5918 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8493 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1609 lt!19247)))))

(assert (=> d!8493 (= (arrayCountValidKeys!0 lt!19247 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!19741)))

(declare-fun b!44741 () Bool)

(assert (=> b!44741 (= e!28354 (bvadd #b00000000000000000000000000000001 call!3663))))

(declare-fun bm!3660 () Bool)

(assert (=> bm!3660 (= call!3663 (arrayCountValidKeys!0 lt!19247 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!44742 () Bool)

(assert (=> b!44742 (= e!28353 e!28354)))

(declare-fun c!5919 () Bool)

(assert (=> b!44742 (= c!5919 (validKeyInArray!0 (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!8493 c!5918) b!44740))

(assert (= (and d!8493 (not c!5918)) b!44742))

(assert (= (and b!44742 c!5919) b!44741))

(assert (= (and b!44742 (not c!5919)) b!44739))

(assert (= (or b!44741 b!44739) bm!3660))

(declare-fun m!38899 () Bool)

(assert (=> bm!3660 m!38899))

(declare-fun m!38901 () Bool)

(assert (=> b!44742 m!38901))

(assert (=> b!44742 m!38901))

(declare-fun m!38903 () Bool)

(assert (=> b!44742 m!38903))

(assert (=> bm!3580 d!8493))

(assert (=> d!8355 d!8279))

(declare-fun d!8497 () Bool)

(assert (=> d!8497 (= (content!43 Nil!1199) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!8415 d!8497))

(declare-fun d!8499 () Bool)

(assert (=> d!8499 (= (validKeyInArray!0 (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!44286 d!8499))

(declare-fun d!8501 () Bool)

(declare-fun e!28355 () Bool)

(assert (=> d!8501 e!28355))

(declare-fun res!26348 () Bool)

(assert (=> d!8501 (=> res!26348 e!28355)))

(declare-fun lt!19745 () Bool)

(assert (=> d!8501 (= res!26348 (not lt!19745))))

(declare-fun lt!19742 () Bool)

(assert (=> d!8501 (= lt!19745 lt!19742)))

(declare-fun lt!19743 () Unit!1234)

(declare-fun e!28356 () Unit!1234)

(assert (=> d!8501 (= lt!19743 e!28356)))

(declare-fun c!5920 () Bool)

(assert (=> d!8501 (= c!5920 lt!19742)))

(assert (=> d!8501 (= lt!19742 (containsKey!74 (toList!617 lt!19581) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8501 (= (contains!576 lt!19581 #b1000000000000000000000000000000000000000000000000000000000000000) lt!19745)))

(declare-fun b!44743 () Bool)

(declare-fun lt!19744 () Unit!1234)

(assert (=> b!44743 (= e!28356 lt!19744)))

(assert (=> b!44743 (= lt!19744 (lemmaContainsKeyImpliesGetValueByKeyDefined!62 (toList!617 lt!19581) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!44743 (isDefined!63 (getValueByKey!105 (toList!617 lt!19581) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!44744 () Bool)

(declare-fun Unit!1250 () Unit!1234)

(assert (=> b!44744 (= e!28356 Unit!1250)))

(declare-fun b!44745 () Bool)

(assert (=> b!44745 (= e!28355 (isDefined!63 (getValueByKey!105 (toList!617 lt!19581) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!8501 c!5920) b!44743))

(assert (= (and d!8501 (not c!5920)) b!44744))

(assert (= (and d!8501 (not res!26348)) b!44745))

(declare-fun m!38905 () Bool)

(assert (=> d!8501 m!38905))

(declare-fun m!38907 () Bool)

(assert (=> b!44743 m!38907))

(declare-fun m!38909 () Bool)

(assert (=> b!44743 m!38909))

(assert (=> b!44743 m!38909))

(declare-fun m!38911 () Bool)

(assert (=> b!44743 m!38911))

(assert (=> b!44745 m!38909))

(assert (=> b!44745 m!38909))

(assert (=> b!44745 m!38911))

(assert (=> bm!3624 d!8501))

(assert (=> b!44569 d!8457))

(declare-fun b!44778 () Bool)

(declare-fun e!28374 () SeekEntryResult!206)

(assert (=> b!44778 (= e!28374 (MissingVacant!206 (index!2948 lt!19429)))))

(declare-fun b!44779 () Bool)

(declare-fun e!28373 () SeekEntryResult!206)

(declare-fun e!28375 () SeekEntryResult!206)

(assert (=> b!44779 (= e!28373 e!28375)))

(declare-fun c!5937 () Bool)

(declare-fun lt!19758 () (_ BitVec 64))

(assert (=> b!44779 (= c!5937 (= lt!19758 (select (arr!1406 lt!19247) #b00000000000000000000000000000000)))))

(declare-fun d!8503 () Bool)

(declare-fun lt!19757 () SeekEntryResult!206)

(assert (=> d!8503 (and (or ((_ is Undefined!206) lt!19757) (not ((_ is Found!206) lt!19757)) (and (bvsge (index!2947 lt!19757) #b00000000000000000000000000000000) (bvslt (index!2947 lt!19757) (size!1609 lt!19247)))) (or ((_ is Undefined!206) lt!19757) ((_ is Found!206) lt!19757) (not ((_ is MissingVacant!206) lt!19757)) (not (= (index!2949 lt!19757) (index!2948 lt!19429))) (and (bvsge (index!2949 lt!19757) #b00000000000000000000000000000000) (bvslt (index!2949 lt!19757) (size!1609 lt!19247)))) (or ((_ is Undefined!206) lt!19757) (ite ((_ is Found!206) lt!19757) (= (select (arr!1406 lt!19247) (index!2947 lt!19757)) (select (arr!1406 lt!19247) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!206) lt!19757) (= (index!2949 lt!19757) (index!2948 lt!19429)) (= (select (arr!1406 lt!19247) (index!2949 lt!19757)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!8503 (= lt!19757 e!28373)))

(declare-fun c!5939 () Bool)

(assert (=> d!8503 (= c!5939 (bvsge (x!8359 lt!19429) #b01111111111111111111111111111110))))

(assert (=> d!8503 (= lt!19758 (select (arr!1406 lt!19247) (index!2948 lt!19429)))))

(assert (=> d!8503 (validMask!0 mask!853)))

(assert (=> d!8503 (= (seekKeyOrZeroReturnVacant!0 (x!8359 lt!19429) (index!2948 lt!19429) (index!2948 lt!19429) (select (arr!1406 lt!19247) #b00000000000000000000000000000000) lt!19247 mask!853) lt!19757)))

(declare-fun b!44780 () Bool)

(assert (=> b!44780 (= e!28374 (seekKeyOrZeroReturnVacant!0 (bvadd (x!8359 lt!19429) #b00000000000000000000000000000001) (nextIndex!0 (index!2948 lt!19429) (x!8359 lt!19429) mask!853) (index!2948 lt!19429) (select (arr!1406 lt!19247) #b00000000000000000000000000000000) lt!19247 mask!853))))

(declare-fun b!44781 () Bool)

(assert (=> b!44781 (= e!28375 (Found!206 (index!2948 lt!19429)))))

(declare-fun b!44782 () Bool)

(declare-fun c!5938 () Bool)

(assert (=> b!44782 (= c!5938 (= lt!19758 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!44782 (= e!28375 e!28374)))

(declare-fun b!44783 () Bool)

(assert (=> b!44783 (= e!28373 Undefined!206)))

(assert (= (and d!8503 c!5939) b!44783))

(assert (= (and d!8503 (not c!5939)) b!44779))

(assert (= (and b!44779 c!5937) b!44781))

(assert (= (and b!44779 (not c!5937)) b!44782))

(assert (= (and b!44782 c!5938) b!44778))

(assert (= (and b!44782 (not c!5938)) b!44780))

(declare-fun m!38925 () Bool)

(assert (=> d!8503 m!38925))

(declare-fun m!38927 () Bool)

(assert (=> d!8503 m!38927))

(assert (=> d!8503 m!38413))

(assert (=> d!8503 m!38197))

(declare-fun m!38929 () Bool)

(assert (=> b!44780 m!38929))

(assert (=> b!44780 m!38929))

(assert (=> b!44780 m!38301))

(declare-fun m!38931 () Bool)

(assert (=> b!44780 m!38931))

(assert (=> b!44263 d!8503))

(assert (=> d!8319 d!8259))

(assert (=> d!8325 d!8327))

(declare-fun d!8509 () Bool)

(assert (=> d!8509 (arrayContainsKey!0 lt!19247 lt!19390 #b00000000000000000000000000000000)))

(assert (=> d!8509 true))

(declare-fun _$60!350 () Unit!1234)

(assert (=> d!8509 (= (choose!13 lt!19247 lt!19390 #b00000000000000000000000000000000) _$60!350)))

(declare-fun bs!2032 () Bool)

(assert (= bs!2032 d!8509))

(assert (=> bs!2032 m!38339))

(assert (=> d!8325 d!8509))

(declare-fun d!8511 () Bool)

(assert (=> d!8511 (= (apply!62 lt!19581 #b1000000000000000000000000000000000000000000000000000000000000000) (get!804 (getValueByKey!105 (toList!617 lt!19581) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2033 () Bool)

(assert (= bs!2033 d!8511))

(assert (=> bs!2033 m!38909))

(assert (=> bs!2033 m!38909))

(declare-fun m!38933 () Bool)

(assert (=> bs!2033 m!38933))

(assert (=> b!44502 d!8511))

(assert (=> b!44269 d!8499))

(assert (=> b!44232 d!8311))

(assert (=> d!8425 d!8447))

(assert (=> d!8345 d!8267))

(declare-fun d!8513 () Bool)

(declare-fun res!26349 () Bool)

(declare-fun e!28376 () Bool)

(assert (=> d!8513 (=> res!26349 e!28376)))

(assert (=> d!8513 (= res!26349 (= (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19390))))

(assert (=> d!8513 (= (arrayContainsKey!0 lt!19247 lt!19390 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!28376)))

(declare-fun b!44784 () Bool)

(declare-fun e!28377 () Bool)

(assert (=> b!44784 (= e!28376 e!28377)))

(declare-fun res!26350 () Bool)

(assert (=> b!44784 (=> (not res!26350) (not e!28377))))

(assert (=> b!44784 (= res!26350 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1609 lt!19247)))))

(declare-fun b!44785 () Bool)

(assert (=> b!44785 (= e!28377 (arrayContainsKey!0 lt!19247 lt!19390 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!8513 (not res!26349)) b!44784))

(assert (= (and b!44784 res!26350) b!44785))

(assert (=> d!8513 m!38427))

(declare-fun m!38935 () Bool)

(assert (=> b!44785 m!38935))

(assert (=> b!44235 d!8513))

(declare-fun d!8515 () Bool)

(assert (=> d!8515 (contains!576 (+!71 lt!19590 (tuple2!1639 lt!19587 (zeroValue!1814 lt!19250))) lt!19593)))

(declare-fun lt!19769 () Unit!1234)

(declare-fun choose!272 (ListLongMap!1203 (_ BitVec 64) V!2325 (_ BitVec 64)) Unit!1234)

(assert (=> d!8515 (= lt!19769 (choose!272 lt!19590 lt!19587 (zeroValue!1814 lt!19250) lt!19593))))

(assert (=> d!8515 (contains!576 lt!19590 lt!19593)))

(assert (=> d!8515 (= (addStillContains!38 lt!19590 lt!19587 (zeroValue!1814 lt!19250) lt!19593) lt!19769)))

(declare-fun bs!2034 () Bool)

(assert (= bs!2034 d!8515))

(assert (=> bs!2034 m!38597))

(assert (=> bs!2034 m!38597))

(assert (=> bs!2034 m!38621))

(declare-fun m!38937 () Bool)

(assert (=> bs!2034 m!38937))

(declare-fun m!38939 () Bool)

(assert (=> bs!2034 m!38939))

(assert (=> b!44505 d!8515))

(declare-fun d!8517 () Bool)

(declare-fun e!28380 () Bool)

(assert (=> d!8517 e!28380))

(declare-fun res!26355 () Bool)

(assert (=> d!8517 (=> (not res!26355) (not e!28380))))

(declare-fun lt!19770 () ListLongMap!1203)

(assert (=> d!8517 (= res!26355 (contains!576 lt!19770 (_1!830 (tuple2!1639 lt!19586 (minValue!1814 lt!19250)))))))

(declare-fun lt!19771 () List!1201)

(assert (=> d!8517 (= lt!19770 (ListLongMap!1204 lt!19771))))

(declare-fun lt!19773 () Unit!1234)

(declare-fun lt!19772 () Unit!1234)

(assert (=> d!8517 (= lt!19773 lt!19772)))

(assert (=> d!8517 (= (getValueByKey!105 lt!19771 (_1!830 (tuple2!1639 lt!19586 (minValue!1814 lt!19250)))) (Some!110 (_2!830 (tuple2!1639 lt!19586 (minValue!1814 lt!19250)))))))

(assert (=> d!8517 (= lt!19772 (lemmaContainsTupThenGetReturnValue!32 lt!19771 (_1!830 (tuple2!1639 lt!19586 (minValue!1814 lt!19250))) (_2!830 (tuple2!1639 lt!19586 (minValue!1814 lt!19250)))))))

(assert (=> d!8517 (= lt!19771 (insertStrictlySorted!29 (toList!617 lt!19589) (_1!830 (tuple2!1639 lt!19586 (minValue!1814 lt!19250))) (_2!830 (tuple2!1639 lt!19586 (minValue!1814 lt!19250)))))))

(assert (=> d!8517 (= (+!71 lt!19589 (tuple2!1639 lt!19586 (minValue!1814 lt!19250))) lt!19770)))

(declare-fun b!44791 () Bool)

(declare-fun res!26356 () Bool)

(assert (=> b!44791 (=> (not res!26356) (not e!28380))))

(assert (=> b!44791 (= res!26356 (= (getValueByKey!105 (toList!617 lt!19770) (_1!830 (tuple2!1639 lt!19586 (minValue!1814 lt!19250)))) (Some!110 (_2!830 (tuple2!1639 lt!19586 (minValue!1814 lt!19250))))))))

(declare-fun b!44792 () Bool)

(assert (=> b!44792 (= e!28380 (contains!578 (toList!617 lt!19770) (tuple2!1639 lt!19586 (minValue!1814 lt!19250))))))

(assert (= (and d!8517 res!26355) b!44791))

(assert (= (and b!44791 res!26356) b!44792))

(declare-fun m!38941 () Bool)

(assert (=> d!8517 m!38941))

(declare-fun m!38943 () Bool)

(assert (=> d!8517 m!38943))

(declare-fun m!38945 () Bool)

(assert (=> d!8517 m!38945))

(declare-fun m!38947 () Bool)

(assert (=> d!8517 m!38947))

(declare-fun m!38949 () Bool)

(assert (=> b!44791 m!38949))

(declare-fun m!38951 () Bool)

(assert (=> b!44792 m!38951))

(assert (=> b!44505 d!8517))

(declare-fun d!8519 () Bool)

(assert (=> d!8519 (= (apply!62 lt!19594 lt!19595) (get!804 (getValueByKey!105 (toList!617 lt!19594) lt!19595)))))

(declare-fun bs!2035 () Bool)

(assert (= bs!2035 d!8519))

(declare-fun m!38953 () Bool)

(assert (=> bs!2035 m!38953))

(assert (=> bs!2035 m!38953))

(declare-fun m!38955 () Bool)

(assert (=> bs!2035 m!38955))

(assert (=> b!44505 d!8519))

(declare-fun d!8521 () Bool)

(assert (=> d!8521 (= (apply!62 (+!71 lt!19579 (tuple2!1639 lt!19582 (zeroValue!1814 lt!19250))) lt!19591) (apply!62 lt!19579 lt!19591))))

(declare-fun lt!19780 () Unit!1234)

(declare-fun choose!273 (ListLongMap!1203 (_ BitVec 64) V!2325 (_ BitVec 64)) Unit!1234)

(assert (=> d!8521 (= lt!19780 (choose!273 lt!19579 lt!19582 (zeroValue!1814 lt!19250) lt!19591))))

(declare-fun e!28384 () Bool)

(assert (=> d!8521 e!28384))

(declare-fun res!26361 () Bool)

(assert (=> d!8521 (=> (not res!26361) (not e!28384))))

(assert (=> d!8521 (= res!26361 (contains!576 lt!19579 lt!19591))))

(assert (=> d!8521 (= (addApplyDifferent!38 lt!19579 lt!19582 (zeroValue!1814 lt!19250) lt!19591) lt!19780)))

(declare-fun b!44798 () Bool)

(assert (=> b!44798 (= e!28384 (not (= lt!19591 lt!19582)))))

(assert (= (and d!8521 res!26361) b!44798))

(declare-fun m!38969 () Bool)

(assert (=> d!8521 m!38969))

(assert (=> d!8521 m!38599))

(assert (=> d!8521 m!38609))

(declare-fun m!38971 () Bool)

(assert (=> d!8521 m!38971))

(assert (=> d!8521 m!38599))

(assert (=> d!8521 m!38617))

(assert (=> b!44505 d!8521))

(declare-fun d!8527 () Bool)

(declare-fun e!28385 () Bool)

(assert (=> d!8527 e!28385))

(declare-fun res!26362 () Bool)

(assert (=> d!8527 (=> (not res!26362) (not e!28385))))

(declare-fun lt!19781 () ListLongMap!1203)

(assert (=> d!8527 (= res!26362 (contains!576 lt!19781 (_1!830 (tuple2!1639 lt!19587 (zeroValue!1814 lt!19250)))))))

(declare-fun lt!19782 () List!1201)

(assert (=> d!8527 (= lt!19781 (ListLongMap!1204 lt!19782))))

(declare-fun lt!19784 () Unit!1234)

(declare-fun lt!19783 () Unit!1234)

(assert (=> d!8527 (= lt!19784 lt!19783)))

(assert (=> d!8527 (= (getValueByKey!105 lt!19782 (_1!830 (tuple2!1639 lt!19587 (zeroValue!1814 lt!19250)))) (Some!110 (_2!830 (tuple2!1639 lt!19587 (zeroValue!1814 lt!19250)))))))

(assert (=> d!8527 (= lt!19783 (lemmaContainsTupThenGetReturnValue!32 lt!19782 (_1!830 (tuple2!1639 lt!19587 (zeroValue!1814 lt!19250))) (_2!830 (tuple2!1639 lt!19587 (zeroValue!1814 lt!19250)))))))

(assert (=> d!8527 (= lt!19782 (insertStrictlySorted!29 (toList!617 lt!19590) (_1!830 (tuple2!1639 lt!19587 (zeroValue!1814 lt!19250))) (_2!830 (tuple2!1639 lt!19587 (zeroValue!1814 lt!19250)))))))

(assert (=> d!8527 (= (+!71 lt!19590 (tuple2!1639 lt!19587 (zeroValue!1814 lt!19250))) lt!19781)))

(declare-fun b!44799 () Bool)

(declare-fun res!26363 () Bool)

(assert (=> b!44799 (=> (not res!26363) (not e!28385))))

(assert (=> b!44799 (= res!26363 (= (getValueByKey!105 (toList!617 lt!19781) (_1!830 (tuple2!1639 lt!19587 (zeroValue!1814 lt!19250)))) (Some!110 (_2!830 (tuple2!1639 lt!19587 (zeroValue!1814 lt!19250))))))))

(declare-fun b!44800 () Bool)

(assert (=> b!44800 (= e!28385 (contains!578 (toList!617 lt!19781) (tuple2!1639 lt!19587 (zeroValue!1814 lt!19250))))))

(assert (= (and d!8527 res!26362) b!44799))

(assert (= (and b!44799 res!26363) b!44800))

(declare-fun m!38973 () Bool)

(assert (=> d!8527 m!38973))

(declare-fun m!38975 () Bool)

(assert (=> d!8527 m!38975))

(declare-fun m!38977 () Bool)

(assert (=> d!8527 m!38977))

(declare-fun m!38979 () Bool)

(assert (=> d!8527 m!38979))

(declare-fun m!38981 () Bool)

(assert (=> b!44799 m!38981))

(declare-fun m!38983 () Bool)

(assert (=> b!44800 m!38983))

(assert (=> b!44505 d!8527))

(declare-fun d!8529 () Bool)

(assert (=> d!8529 (= (apply!62 (+!71 lt!19594 (tuple2!1639 lt!19578 (minValue!1814 lt!19250))) lt!19595) (apply!62 lt!19594 lt!19595))))

(declare-fun lt!19785 () Unit!1234)

(assert (=> d!8529 (= lt!19785 (choose!273 lt!19594 lt!19578 (minValue!1814 lt!19250) lt!19595))))

(declare-fun e!28386 () Bool)

(assert (=> d!8529 e!28386))

(declare-fun res!26364 () Bool)

(assert (=> d!8529 (=> (not res!26364) (not e!28386))))

(assert (=> d!8529 (= res!26364 (contains!576 lt!19594 lt!19595))))

(assert (=> d!8529 (= (addApplyDifferent!38 lt!19594 lt!19578 (minValue!1814 lt!19250) lt!19595) lt!19785)))

(declare-fun b!44801 () Bool)

(assert (=> b!44801 (= e!28386 (not (= lt!19595 lt!19578)))))

(assert (= (and d!8529 res!26364) b!44801))

(declare-fun m!38985 () Bool)

(assert (=> d!8529 m!38985))

(assert (=> d!8529 m!38623))

(assert (=> d!8529 m!38625))

(declare-fun m!38987 () Bool)

(assert (=> d!8529 m!38987))

(assert (=> d!8529 m!38623))

(assert (=> d!8529 m!38601))

(assert (=> b!44505 d!8529))

(declare-fun d!8531 () Bool)

(declare-fun e!28387 () Bool)

(assert (=> d!8531 e!28387))

(declare-fun res!26365 () Bool)

(assert (=> d!8531 (=> (not res!26365) (not e!28387))))

(declare-fun lt!19786 () ListLongMap!1203)

(assert (=> d!8531 (= res!26365 (contains!576 lt!19786 (_1!830 (tuple2!1639 lt!19582 (zeroValue!1814 lt!19250)))))))

(declare-fun lt!19787 () List!1201)

(assert (=> d!8531 (= lt!19786 (ListLongMap!1204 lt!19787))))

(declare-fun lt!19789 () Unit!1234)

(declare-fun lt!19788 () Unit!1234)

(assert (=> d!8531 (= lt!19789 lt!19788)))

(assert (=> d!8531 (= (getValueByKey!105 lt!19787 (_1!830 (tuple2!1639 lt!19582 (zeroValue!1814 lt!19250)))) (Some!110 (_2!830 (tuple2!1639 lt!19582 (zeroValue!1814 lt!19250)))))))

(assert (=> d!8531 (= lt!19788 (lemmaContainsTupThenGetReturnValue!32 lt!19787 (_1!830 (tuple2!1639 lt!19582 (zeroValue!1814 lt!19250))) (_2!830 (tuple2!1639 lt!19582 (zeroValue!1814 lt!19250)))))))

(assert (=> d!8531 (= lt!19787 (insertStrictlySorted!29 (toList!617 lt!19579) (_1!830 (tuple2!1639 lt!19582 (zeroValue!1814 lt!19250))) (_2!830 (tuple2!1639 lt!19582 (zeroValue!1814 lt!19250)))))))

(assert (=> d!8531 (= (+!71 lt!19579 (tuple2!1639 lt!19582 (zeroValue!1814 lt!19250))) lt!19786)))

(declare-fun b!44802 () Bool)

(declare-fun res!26366 () Bool)

(assert (=> b!44802 (=> (not res!26366) (not e!28387))))

(assert (=> b!44802 (= res!26366 (= (getValueByKey!105 (toList!617 lt!19786) (_1!830 (tuple2!1639 lt!19582 (zeroValue!1814 lt!19250)))) (Some!110 (_2!830 (tuple2!1639 lt!19582 (zeroValue!1814 lt!19250))))))))

(declare-fun b!44803 () Bool)

(assert (=> b!44803 (= e!28387 (contains!578 (toList!617 lt!19786) (tuple2!1639 lt!19582 (zeroValue!1814 lt!19250))))))

(assert (= (and d!8531 res!26365) b!44802))

(assert (= (and b!44802 res!26366) b!44803))

(declare-fun m!38989 () Bool)

(assert (=> d!8531 m!38989))

(declare-fun m!38991 () Bool)

(assert (=> d!8531 m!38991))

(declare-fun m!38993 () Bool)

(assert (=> d!8531 m!38993))

(declare-fun m!38995 () Bool)

(assert (=> d!8531 m!38995))

(declare-fun m!38997 () Bool)

(assert (=> b!44802 m!38997))

(declare-fun m!38999 () Bool)

(assert (=> b!44803 m!38999))

(assert (=> b!44505 d!8531))

(declare-fun d!8533 () Bool)

(assert (=> d!8533 (= (apply!62 (+!71 lt!19594 (tuple2!1639 lt!19578 (minValue!1814 lt!19250))) lt!19595) (get!804 (getValueByKey!105 (toList!617 (+!71 lt!19594 (tuple2!1639 lt!19578 (minValue!1814 lt!19250)))) lt!19595)))))

(declare-fun bs!2036 () Bool)

(assert (= bs!2036 d!8533))

(declare-fun m!39001 () Bool)

(assert (=> bs!2036 m!39001))

(assert (=> bs!2036 m!39001))

(declare-fun m!39003 () Bool)

(assert (=> bs!2036 m!39003))

(assert (=> b!44505 d!8533))

(declare-fun d!8535 () Bool)

(declare-fun e!28388 () Bool)

(assert (=> d!8535 e!28388))

(declare-fun res!26367 () Bool)

(assert (=> d!8535 (=> res!26367 e!28388)))

(declare-fun lt!19793 () Bool)

(assert (=> d!8535 (= res!26367 (not lt!19793))))

(declare-fun lt!19790 () Bool)

(assert (=> d!8535 (= lt!19793 lt!19790)))

(declare-fun lt!19791 () Unit!1234)

(declare-fun e!28389 () Unit!1234)

(assert (=> d!8535 (= lt!19791 e!28389)))

(declare-fun c!5940 () Bool)

(assert (=> d!8535 (= c!5940 lt!19790)))

(assert (=> d!8535 (= lt!19790 (containsKey!74 (toList!617 (+!71 lt!19590 (tuple2!1639 lt!19587 (zeroValue!1814 lt!19250)))) lt!19593))))

(assert (=> d!8535 (= (contains!576 (+!71 lt!19590 (tuple2!1639 lt!19587 (zeroValue!1814 lt!19250))) lt!19593) lt!19793)))

(declare-fun b!44804 () Bool)

(declare-fun lt!19792 () Unit!1234)

(assert (=> b!44804 (= e!28389 lt!19792)))

(assert (=> b!44804 (= lt!19792 (lemmaContainsKeyImpliesGetValueByKeyDefined!62 (toList!617 (+!71 lt!19590 (tuple2!1639 lt!19587 (zeroValue!1814 lt!19250)))) lt!19593))))

(assert (=> b!44804 (isDefined!63 (getValueByKey!105 (toList!617 (+!71 lt!19590 (tuple2!1639 lt!19587 (zeroValue!1814 lt!19250)))) lt!19593))))

(declare-fun b!44805 () Bool)

(declare-fun Unit!1251 () Unit!1234)

(assert (=> b!44805 (= e!28389 Unit!1251)))

(declare-fun b!44806 () Bool)

(assert (=> b!44806 (= e!28388 (isDefined!63 (getValueByKey!105 (toList!617 (+!71 lt!19590 (tuple2!1639 lt!19587 (zeroValue!1814 lt!19250)))) lt!19593)))))

(assert (= (and d!8535 c!5940) b!44804))

(assert (= (and d!8535 (not c!5940)) b!44805))

(assert (= (and d!8535 (not res!26367)) b!44806))

(declare-fun m!39005 () Bool)

(assert (=> d!8535 m!39005))

(declare-fun m!39007 () Bool)

(assert (=> b!44804 m!39007))

(declare-fun m!39009 () Bool)

(assert (=> b!44804 m!39009))

(assert (=> b!44804 m!39009))

(declare-fun m!39011 () Bool)

(assert (=> b!44804 m!39011))

(assert (=> b!44806 m!39009))

(assert (=> b!44806 m!39009))

(assert (=> b!44806 m!39011))

(assert (=> b!44505 d!8535))

(declare-fun d!8537 () Bool)

(assert (=> d!8537 (= (apply!62 lt!19589 lt!19580) (get!804 (getValueByKey!105 (toList!617 lt!19589) lt!19580)))))

(declare-fun bs!2037 () Bool)

(assert (= bs!2037 d!8537))

(declare-fun m!39013 () Bool)

(assert (=> bs!2037 m!39013))

(assert (=> bs!2037 m!39013))

(declare-fun m!39015 () Bool)

(assert (=> bs!2037 m!39015))

(assert (=> b!44505 d!8537))

(declare-fun d!8539 () Bool)

(declare-fun e!28390 () Bool)

(assert (=> d!8539 e!28390))

(declare-fun res!26368 () Bool)

(assert (=> d!8539 (=> (not res!26368) (not e!28390))))

(declare-fun lt!19794 () ListLongMap!1203)

(assert (=> d!8539 (= res!26368 (contains!576 lt!19794 (_1!830 (tuple2!1639 lt!19578 (minValue!1814 lt!19250)))))))

(declare-fun lt!19795 () List!1201)

(assert (=> d!8539 (= lt!19794 (ListLongMap!1204 lt!19795))))

(declare-fun lt!19797 () Unit!1234)

(declare-fun lt!19796 () Unit!1234)

(assert (=> d!8539 (= lt!19797 lt!19796)))

(assert (=> d!8539 (= (getValueByKey!105 lt!19795 (_1!830 (tuple2!1639 lt!19578 (minValue!1814 lt!19250)))) (Some!110 (_2!830 (tuple2!1639 lt!19578 (minValue!1814 lt!19250)))))))

(assert (=> d!8539 (= lt!19796 (lemmaContainsTupThenGetReturnValue!32 lt!19795 (_1!830 (tuple2!1639 lt!19578 (minValue!1814 lt!19250))) (_2!830 (tuple2!1639 lt!19578 (minValue!1814 lt!19250)))))))

(assert (=> d!8539 (= lt!19795 (insertStrictlySorted!29 (toList!617 lt!19594) (_1!830 (tuple2!1639 lt!19578 (minValue!1814 lt!19250))) (_2!830 (tuple2!1639 lt!19578 (minValue!1814 lt!19250)))))))

(assert (=> d!8539 (= (+!71 lt!19594 (tuple2!1639 lt!19578 (minValue!1814 lt!19250))) lt!19794)))

(declare-fun b!44807 () Bool)

(declare-fun res!26369 () Bool)

(assert (=> b!44807 (=> (not res!26369) (not e!28390))))

(assert (=> b!44807 (= res!26369 (= (getValueByKey!105 (toList!617 lt!19794) (_1!830 (tuple2!1639 lt!19578 (minValue!1814 lt!19250)))) (Some!110 (_2!830 (tuple2!1639 lt!19578 (minValue!1814 lt!19250))))))))

(declare-fun b!44808 () Bool)

(assert (=> b!44808 (= e!28390 (contains!578 (toList!617 lt!19794) (tuple2!1639 lt!19578 (minValue!1814 lt!19250))))))

(assert (= (and d!8539 res!26368) b!44807))

(assert (= (and b!44807 res!26369) b!44808))

(declare-fun m!39017 () Bool)

(assert (=> d!8539 m!39017))

(declare-fun m!39019 () Bool)

(assert (=> d!8539 m!39019))

(declare-fun m!39021 () Bool)

(assert (=> d!8539 m!39021))

(declare-fun m!39023 () Bool)

(assert (=> d!8539 m!39023))

(declare-fun m!39025 () Bool)

(assert (=> b!44807 m!39025))

(declare-fun m!39027 () Bool)

(assert (=> b!44808 m!39027))

(assert (=> b!44505 d!8539))

(declare-fun d!8541 () Bool)

(assert (=> d!8541 (= (apply!62 (+!71 lt!19589 (tuple2!1639 lt!19586 (minValue!1814 lt!19250))) lt!19580) (apply!62 lt!19589 lt!19580))))

(declare-fun lt!19798 () Unit!1234)

(assert (=> d!8541 (= lt!19798 (choose!273 lt!19589 lt!19586 (minValue!1814 lt!19250) lt!19580))))

(declare-fun e!28391 () Bool)

(assert (=> d!8541 e!28391))

(declare-fun res!26370 () Bool)

(assert (=> d!8541 (=> (not res!26370) (not e!28391))))

(assert (=> d!8541 (= res!26370 (contains!576 lt!19589 lt!19580))))

(assert (=> d!8541 (= (addApplyDifferent!38 lt!19589 lt!19586 (minValue!1814 lt!19250) lt!19580) lt!19798)))

(declare-fun b!44809 () Bool)

(assert (=> b!44809 (= e!28391 (not (= lt!19580 lt!19586)))))

(assert (= (and d!8541 res!26370) b!44809))

(declare-fun m!39029 () Bool)

(assert (=> d!8541 m!39029))

(assert (=> d!8541 m!38603))

(assert (=> d!8541 m!38607))

(declare-fun m!39031 () Bool)

(assert (=> d!8541 m!39031))

(assert (=> d!8541 m!38603))

(assert (=> d!8541 m!38619))

(assert (=> b!44505 d!8541))

(declare-fun d!8543 () Bool)

(assert (=> d!8543 (= (apply!62 (+!71 lt!19589 (tuple2!1639 lt!19586 (minValue!1814 lt!19250))) lt!19580) (get!804 (getValueByKey!105 (toList!617 (+!71 lt!19589 (tuple2!1639 lt!19586 (minValue!1814 lt!19250)))) lt!19580)))))

(declare-fun bs!2038 () Bool)

(assert (= bs!2038 d!8543))

(declare-fun m!39033 () Bool)

(assert (=> bs!2038 m!39033))

(assert (=> bs!2038 m!39033))

(declare-fun m!39035 () Bool)

(assert (=> bs!2038 m!39035))

(assert (=> b!44505 d!8543))

(declare-fun b!44876 () Bool)

(declare-fun e!28432 () ListLongMap!1203)

(assert (=> b!44876 (= e!28432 (ListLongMap!1204 Nil!1198))))

(declare-fun b!44877 () Bool)

(assert (=> b!44877 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1609 (_keys!3462 lt!19250))))))

(assert (=> b!44877 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1610 (_values!1879 lt!19250))))))

(declare-fun e!28436 () Bool)

(declare-fun lt!19845 () ListLongMap!1203)

(assert (=> b!44877 (= e!28436 (= (apply!62 lt!19845 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)) (get!802 (select (arr!1407 (_values!1879 lt!19250)) #b00000000000000000000000000000000) (dynLambda!264 (defaultEntry!1896 lt!19250) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!44878 () Bool)

(declare-fun e!28435 () Bool)

(assert (=> b!44878 (= e!28435 e!28436)))

(assert (=> b!44878 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1609 (_keys!3462 lt!19250))))))

(declare-fun res!26396 () Bool)

(assert (=> b!44878 (= res!26396 (contains!576 lt!19845 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)))))

(assert (=> b!44878 (=> (not res!26396) (not e!28436))))

(declare-fun b!44879 () Bool)

(declare-fun e!28433 () ListLongMap!1203)

(declare-fun call!3669 () ListLongMap!1203)

(assert (=> b!44879 (= e!28433 call!3669)))

(declare-fun b!44880 () Bool)

(declare-fun e!28437 () Bool)

(assert (=> b!44880 (= e!28437 (validKeyInArray!0 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)))))

(assert (=> b!44880 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!8545 () Bool)

(declare-fun e!28434 () Bool)

(assert (=> d!8545 e!28434))

(declare-fun res!26395 () Bool)

(assert (=> d!8545 (=> (not res!26395) (not e!28434))))

(assert (=> d!8545 (= res!26395 (not (contains!576 lt!19845 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8545 (= lt!19845 e!28432)))

(declare-fun c!5966 () Bool)

(assert (=> d!8545 (= c!5966 (bvsge #b00000000000000000000000000000000 (size!1609 (_keys!3462 lt!19250))))))

(assert (=> d!8545 (validMask!0 (mask!5472 lt!19250))))

(assert (=> d!8545 (= (getCurrentListMapNoExtraKeys!40 (_keys!3462 lt!19250) (_values!1879 lt!19250) (mask!5472 lt!19250) (extraKeys!1787 lt!19250) (zeroValue!1814 lt!19250) (minValue!1814 lt!19250) #b00000000000000000000000000000000 (defaultEntry!1896 lt!19250)) lt!19845)))

(declare-fun b!44881 () Bool)

(declare-fun lt!19842 () Unit!1234)

(declare-fun lt!19847 () Unit!1234)

(assert (=> b!44881 (= lt!19842 lt!19847)))

(declare-fun lt!19843 () ListLongMap!1203)

(declare-fun lt!19846 () V!2325)

(declare-fun lt!19844 () (_ BitVec 64))

(declare-fun lt!19848 () (_ BitVec 64))

(assert (=> b!44881 (not (contains!576 (+!71 lt!19843 (tuple2!1639 lt!19844 lt!19846)) lt!19848))))

(declare-fun addStillNotContains!13 (ListLongMap!1203 (_ BitVec 64) V!2325 (_ BitVec 64)) Unit!1234)

(assert (=> b!44881 (= lt!19847 (addStillNotContains!13 lt!19843 lt!19844 lt!19846 lt!19848))))

(assert (=> b!44881 (= lt!19848 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!44881 (= lt!19846 (get!802 (select (arr!1407 (_values!1879 lt!19250)) #b00000000000000000000000000000000) (dynLambda!264 (defaultEntry!1896 lt!19250) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44881 (= lt!19844 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000))))

(assert (=> b!44881 (= lt!19843 call!3669)))

(assert (=> b!44881 (= e!28433 (+!71 call!3669 (tuple2!1639 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000) (get!802 (select (arr!1407 (_values!1879 lt!19250)) #b00000000000000000000000000000000) (dynLambda!264 (defaultEntry!1896 lt!19250) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!44882 () Bool)

(declare-fun res!26393 () Bool)

(assert (=> b!44882 (=> (not res!26393) (not e!28434))))

(assert (=> b!44882 (= res!26393 (not (contains!576 lt!19845 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!44883 () Bool)

(declare-fun e!28431 () Bool)

(assert (=> b!44883 (= e!28431 (= lt!19845 (getCurrentListMapNoExtraKeys!40 (_keys!3462 lt!19250) (_values!1879 lt!19250) (mask!5472 lt!19250) (extraKeys!1787 lt!19250) (zeroValue!1814 lt!19250) (minValue!1814 lt!19250) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1896 lt!19250))))))

(declare-fun b!44884 () Bool)

(declare-fun isEmpty!292 (ListLongMap!1203) Bool)

(assert (=> b!44884 (= e!28431 (isEmpty!292 lt!19845))))

(declare-fun b!44885 () Bool)

(assert (=> b!44885 (= e!28435 e!28431)))

(declare-fun c!5965 () Bool)

(assert (=> b!44885 (= c!5965 (bvslt #b00000000000000000000000000000000 (size!1609 (_keys!3462 lt!19250))))))

(declare-fun bm!3666 () Bool)

(assert (=> bm!3666 (= call!3669 (getCurrentListMapNoExtraKeys!40 (_keys!3462 lt!19250) (_values!1879 lt!19250) (mask!5472 lt!19250) (extraKeys!1787 lt!19250) (zeroValue!1814 lt!19250) (minValue!1814 lt!19250) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1896 lt!19250)))))

(declare-fun b!44886 () Bool)

(assert (=> b!44886 (= e!28434 e!28435)))

(declare-fun c!5964 () Bool)

(assert (=> b!44886 (= c!5964 e!28437)))

(declare-fun res!26394 () Bool)

(assert (=> b!44886 (=> (not res!26394) (not e!28437))))

(assert (=> b!44886 (= res!26394 (bvslt #b00000000000000000000000000000000 (size!1609 (_keys!3462 lt!19250))))))

(declare-fun b!44887 () Bool)

(assert (=> b!44887 (= e!28432 e!28433)))

(declare-fun c!5963 () Bool)

(assert (=> b!44887 (= c!5963 (validKeyInArray!0 (select (arr!1406 (_keys!3462 lt!19250)) #b00000000000000000000000000000000)))))

(assert (= (and d!8545 c!5966) b!44876))

(assert (= (and d!8545 (not c!5966)) b!44887))

(assert (= (and b!44887 c!5963) b!44881))

(assert (= (and b!44887 (not c!5963)) b!44879))

(assert (= (or b!44881 b!44879) bm!3666))

(assert (= (and d!8545 res!26395) b!44882))

(assert (= (and b!44882 res!26393) b!44886))

(assert (= (and b!44886 res!26394) b!44880))

(assert (= (and b!44886 c!5964) b!44878))

(assert (= (and b!44886 (not c!5964)) b!44885))

(assert (= (and b!44878 res!26396) b!44877))

(assert (= (and b!44885 c!5965) b!44883))

(assert (= (and b!44885 (not c!5965)) b!44884))

(declare-fun b_lambda!2335 () Bool)

(assert (=> (not b_lambda!2335) (not b!44877)))

(assert (=> b!44877 t!4228))

(declare-fun b_and!2723 () Bool)

(assert (= b_and!2715 (and (=> t!4228 result!1761) b_and!2723)))

(declare-fun b_lambda!2337 () Bool)

(assert (=> (not b_lambda!2337) (not b!44881)))

(assert (=> b!44881 t!4228))

(declare-fun b_and!2725 () Bool)

(assert (= b_and!2723 (and (=> t!4228 result!1761) b_and!2725)))

(declare-fun m!39065 () Bool)

(assert (=> b!44881 m!39065))

(assert (=> b!44881 m!38633))

(declare-fun m!39067 () Bool)

(assert (=> b!44881 m!39067))

(assert (=> b!44881 m!39065))

(declare-fun m!39069 () Bool)

(assert (=> b!44881 m!39069))

(assert (=> b!44881 m!38635))

(declare-fun m!39071 () Bool)

(assert (=> b!44881 m!39071))

(assert (=> b!44881 m!38381))

(assert (=> b!44881 m!38633))

(assert (=> b!44881 m!38635))

(assert (=> b!44881 m!38637))

(declare-fun m!39073 () Bool)

(assert (=> b!44884 m!39073))

(declare-fun m!39075 () Bool)

(assert (=> bm!3666 m!39075))

(declare-fun m!39077 () Bool)

(assert (=> d!8545 m!39077))

(assert (=> d!8545 m!38659))

(assert (=> b!44887 m!38381))

(assert (=> b!44887 m!38381))

(assert (=> b!44887 m!38383))

(assert (=> b!44883 m!39075))

(assert (=> b!44878 m!38381))

(assert (=> b!44878 m!38381))

(declare-fun m!39079 () Bool)

(assert (=> b!44878 m!39079))

(declare-fun m!39081 () Bool)

(assert (=> b!44882 m!39081))

(assert (=> b!44880 m!38381))

(assert (=> b!44880 m!38381))

(assert (=> b!44880 m!38383))

(assert (=> b!44877 m!38633))

(assert (=> b!44877 m!38635))

(assert (=> b!44877 m!38381))

(declare-fun m!39089 () Bool)

(assert (=> b!44877 m!39089))

(assert (=> b!44877 m!38381))

(assert (=> b!44877 m!38633))

(assert (=> b!44877 m!38635))

(assert (=> b!44877 m!38637))

(assert (=> b!44505 d!8545))

(declare-fun d!8553 () Bool)

(assert (=> d!8553 (= (apply!62 lt!19579 lt!19591) (get!804 (getValueByKey!105 (toList!617 lt!19579) lt!19591)))))

(declare-fun bs!2039 () Bool)

(assert (= bs!2039 d!8553))

(declare-fun m!39093 () Bool)

(assert (=> bs!2039 m!39093))

(assert (=> bs!2039 m!39093))

(declare-fun m!39095 () Bool)

(assert (=> bs!2039 m!39095))

(assert (=> b!44505 d!8553))

(declare-fun d!8555 () Bool)

(assert (=> d!8555 (= (apply!62 (+!71 lt!19579 (tuple2!1639 lt!19582 (zeroValue!1814 lt!19250))) lt!19591) (get!804 (getValueByKey!105 (toList!617 (+!71 lt!19579 (tuple2!1639 lt!19582 (zeroValue!1814 lt!19250)))) lt!19591)))))

(declare-fun bs!2040 () Bool)

(assert (= bs!2040 d!8555))

(declare-fun m!39097 () Bool)

(assert (=> bs!2040 m!39097))

(assert (=> bs!2040 m!39097))

(declare-fun m!39099 () Bool)

(assert (=> bs!2040 m!39099))

(assert (=> b!44505 d!8555))

(assert (=> bm!3627 d!8545))

(declare-fun d!8559 () Bool)

(declare-fun lt!19860 () Bool)

(assert (=> d!8559 (= lt!19860 (select (content!43 (ite c!5745 (Cons!1198 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) Nil!1199) Nil!1199)) (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!28445 () Bool)

(assert (=> d!8559 (= lt!19860 e!28445)))

(declare-fun res!26402 () Bool)

(assert (=> d!8559 (=> (not res!26402) (not e!28445))))

(assert (=> d!8559 (= res!26402 ((_ is Cons!1198) (ite c!5745 (Cons!1198 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) Nil!1199) Nil!1199)))))

(assert (=> d!8559 (= (contains!573 (ite c!5745 (Cons!1198 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) Nil!1199) Nil!1199) (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!19860)))

(declare-fun b!44898 () Bool)

(declare-fun e!28446 () Bool)

(assert (=> b!44898 (= e!28445 e!28446)))

(declare-fun res!26401 () Bool)

(assert (=> b!44898 (=> res!26401 e!28446)))

(assert (=> b!44898 (= res!26401 (= (h!1775 (ite c!5745 (Cons!1198 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) Nil!1199) Nil!1199)) (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!44899 () Bool)

(assert (=> b!44899 (= e!28446 (contains!573 (t!4216 (ite c!5745 (Cons!1198 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) Nil!1199) Nil!1199)) (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!8559 res!26402) b!44898))

(assert (= (and b!44898 (not res!26401)) b!44899))

(declare-fun m!39107 () Bool)

(assert (=> d!8559 m!39107))

(assert (=> d!8559 m!38427))

(declare-fun m!39111 () Bool)

(assert (=> d!8559 m!39111))

(assert (=> b!44899 m!38427))

(declare-fun m!39113 () Bool)

(assert (=> b!44899 m!39113))

(assert (=> b!44267 d!8559))

(declare-fun b!44902 () Bool)

(declare-fun e!28451 () Bool)

(declare-fun e!28450 () Bool)

(assert (=> b!44902 (= e!28451 e!28450)))

(declare-fun lt!19863 () (_ BitVec 64))

(assert (=> b!44902 (= lt!19863 (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!19862 () Unit!1234)

(assert (=> b!44902 (= lt!19862 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19247 lt!19863 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!44902 (arrayContainsKey!0 lt!19247 lt!19863 #b00000000000000000000000000000000)))

(declare-fun lt!19864 () Unit!1234)

(assert (=> b!44902 (= lt!19864 lt!19862)))

(declare-fun res!26406 () Bool)

(assert (=> b!44902 (= res!26406 (= (seekEntryOrOpen!0 (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!19247 mask!853) (Found!206 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!44902 (=> (not res!26406) (not e!28450))))

(declare-fun b!44903 () Bool)

(declare-fun e!28449 () Bool)

(assert (=> b!44903 (= e!28449 e!28451)))

(declare-fun c!5970 () Bool)

(assert (=> b!44903 (= c!5970 (validKeyInArray!0 (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!44904 () Bool)

(declare-fun call!3671 () Bool)

(assert (=> b!44904 (= e!28450 call!3671)))

(declare-fun b!44905 () Bool)

(assert (=> b!44905 (= e!28451 call!3671)))

(declare-fun d!8563 () Bool)

(declare-fun res!26405 () Bool)

(assert (=> d!8563 (=> res!26405 e!28449)))

(assert (=> d!8563 (= res!26405 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1609 lt!19247)))))

(assert (=> d!8563 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!19247 mask!853) e!28449)))

(declare-fun bm!3668 () Bool)

(assert (=> bm!3668 (= call!3671 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!19247 mask!853))))

(assert (= (and d!8563 (not res!26405)) b!44903))

(assert (= (and b!44903 c!5970) b!44902))

(assert (= (and b!44903 (not c!5970)) b!44905))

(assert (= (and b!44902 res!26406) b!44904))

(assert (= (or b!44904 b!44905) bm!3668))

(assert (=> b!44902 m!38901))

(declare-fun m!39119 () Bool)

(assert (=> b!44902 m!39119))

(declare-fun m!39121 () Bool)

(assert (=> b!44902 m!39121))

(assert (=> b!44902 m!38901))

(declare-fun m!39123 () Bool)

(assert (=> b!44902 m!39123))

(assert (=> b!44903 m!38901))

(assert (=> b!44903 m!38901))

(assert (=> b!44903 m!38903))

(declare-fun m!39127 () Bool)

(assert (=> bm!3668 m!39127))

(assert (=> bm!3631 d!8563))

(assert (=> b!44499 d!8433))

(declare-fun d!8569 () Bool)

(declare-fun lt!19866 () (_ BitVec 32))

(assert (=> d!8569 (and (or (bvslt lt!19866 #b00000000000000000000000000000000) (bvsge lt!19866 (size!1609 lt!19247)) (and (bvsge lt!19866 #b00000000000000000000000000000000) (bvslt lt!19866 (size!1609 lt!19247)))) (bvsge lt!19866 #b00000000000000000000000000000000) (bvslt lt!19866 (size!1609 lt!19247)) (= (select (arr!1406 lt!19247) lt!19866) (_1!830 lt!19245)))))

(declare-fun e!28454 () (_ BitVec 32))

(assert (=> d!8569 (= lt!19866 e!28454)))

(declare-fun c!5971 () Bool)

(assert (=> d!8569 (= c!5971 (= (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (_1!830 lt!19245)))))

(assert (=> d!8569 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1609 lt!19247)) (bvslt (size!1609 lt!19247) #b01111111111111111111111111111111))))

(assert (=> d!8569 (= (arrayScanForKey!0 lt!19247 (_1!830 lt!19245) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!19866)))

(declare-fun b!44908 () Bool)

(assert (=> b!44908 (= e!28454 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))

(declare-fun b!44909 () Bool)

(assert (=> b!44909 (= e!28454 (arrayScanForKey!0 lt!19247 (_1!830 lt!19245) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!8569 c!5971) b!44908))

(assert (= (and d!8569 (not c!5971)) b!44909))

(declare-fun m!39131 () Bool)

(assert (=> d!8569 m!39131))

(assert (=> d!8569 m!38901))

(declare-fun m!39133 () Bool)

(assert (=> b!44909 m!39133))

(assert (=> b!44558 d!8569))

(declare-fun d!8573 () Bool)

(declare-fun res!26409 () Bool)

(declare-fun e!28458 () Bool)

(assert (=> d!8573 (=> res!26409 e!28458)))

(assert (=> d!8573 (= res!26409 (= (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (_1!830 lt!19245)))))

(assert (=> d!8573 (= (arrayContainsKey!0 lt!19247 (_1!830 lt!19245) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) e!28458)))

(declare-fun b!44916 () Bool)

(declare-fun e!28459 () Bool)

(assert (=> b!44916 (= e!28458 e!28459)))

(declare-fun res!26410 () Bool)

(assert (=> b!44916 (=> (not res!26410) (not e!28459))))

(assert (=> b!44916 (= res!26410 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1609 lt!19247)))))

(declare-fun b!44917 () Bool)

(assert (=> b!44917 (= e!28459 (arrayContainsKey!0 lt!19247 (_1!830 lt!19245) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!8573 (not res!26409)) b!44916))

(assert (= (and b!44916 res!26410) b!44917))

(assert (=> d!8573 m!38901))

(declare-fun m!39135 () Bool)

(assert (=> b!44917 m!39135))

(assert (=> b!44278 d!8573))

(assert (=> b!44549 d!8499))

(assert (=> b!44498 d!8433))

(declare-fun d!8575 () Bool)

(assert (not d!8575))

(assert (=> b!44543 d!8575))

(declare-fun b!44918 () Bool)

(declare-fun e!28462 () Bool)

(declare-fun e!28461 () Bool)

(assert (=> b!44918 (= e!28462 e!28461)))

(declare-fun lt!19871 () (_ BitVec 64))

(assert (=> b!44918 (= lt!19871 (select (arr!1406 (_keys!3462 lt!19250)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!19870 () Unit!1234)

(assert (=> b!44918 (= lt!19870 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3462 lt!19250) lt!19871 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!44918 (arrayContainsKey!0 (_keys!3462 lt!19250) lt!19871 #b00000000000000000000000000000000)))

(declare-fun lt!19872 () Unit!1234)

(assert (=> b!44918 (= lt!19872 lt!19870)))

(declare-fun res!26412 () Bool)

(assert (=> b!44918 (= res!26412 (= (seekEntryOrOpen!0 (select (arr!1406 (_keys!3462 lt!19250)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3462 lt!19250) (mask!5472 lt!19250)) (Found!206 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!44918 (=> (not res!26412) (not e!28461))))

(declare-fun b!44919 () Bool)

(declare-fun e!28460 () Bool)

(assert (=> b!44919 (= e!28460 e!28462)))

(declare-fun c!5975 () Bool)

(assert (=> b!44919 (= c!5975 (validKeyInArray!0 (select (arr!1406 (_keys!3462 lt!19250)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!44920 () Bool)

(declare-fun call!3672 () Bool)

(assert (=> b!44920 (= e!28461 call!3672)))

(declare-fun b!44921 () Bool)

(assert (=> b!44921 (= e!28462 call!3672)))

(declare-fun d!8577 () Bool)

(declare-fun res!26411 () Bool)

(assert (=> d!8577 (=> res!26411 e!28460)))

(assert (=> d!8577 (= res!26411 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1609 (_keys!3462 lt!19250))))))

(assert (=> d!8577 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3462 lt!19250) (mask!5472 lt!19250)) e!28460)))

(declare-fun bm!3669 () Bool)

(assert (=> bm!3669 (= call!3672 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3462 lt!19250) (mask!5472 lt!19250)))))

(assert (= (and d!8577 (not res!26411)) b!44919))

(assert (= (and b!44919 c!5975) b!44918))

(assert (= (and b!44919 (not c!5975)) b!44921))

(assert (= (and b!44918 res!26412) b!44920))

(assert (= (or b!44920 b!44921) bm!3669))

(assert (=> b!44918 m!38789))

(declare-fun m!39151 () Bool)

(assert (=> b!44918 m!39151))

(declare-fun m!39153 () Bool)

(assert (=> b!44918 m!39153))

(assert (=> b!44918 m!38789))

(declare-fun m!39155 () Bool)

(assert (=> b!44918 m!39155))

(assert (=> b!44919 m!38789))

(assert (=> b!44919 m!38789))

(assert (=> b!44919 m!38791))

(declare-fun m!39163 () Bool)

(assert (=> bm!3669 m!39163))

(assert (=> bm!3579 d!8577))

(assert (=> b!44266 d!8499))

(declare-fun d!8581 () Bool)

(declare-fun res!26415 () Bool)

(declare-fun e!28467 () Bool)

(assert (=> d!8581 (=> res!26415 e!28467)))

(assert (=> d!8581 (= res!26415 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1609 lt!19247)))))

(assert (=> d!8581 (= (arrayNoDuplicates!0 lt!19247 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5787 (Cons!1198 (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5745 (Cons!1198 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) Nil!1199) Nil!1199)) (ite c!5745 (Cons!1198 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) Nil!1199) Nil!1199))) e!28467)))

(declare-fun b!44928 () Bool)

(declare-fun e!28468 () Bool)

(assert (=> b!44928 (= e!28467 e!28468)))

(declare-fun res!26416 () Bool)

(assert (=> b!44928 (=> (not res!26416) (not e!28468))))

(declare-fun e!28469 () Bool)

(assert (=> b!44928 (= res!26416 (not e!28469))))

(declare-fun res!26417 () Bool)

(assert (=> b!44928 (=> (not res!26417) (not e!28469))))

(assert (=> b!44928 (= res!26417 (validKeyInArray!0 (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun call!3674 () Bool)

(declare-fun bm!3671 () Bool)

(declare-fun c!5978 () Bool)

(assert (=> bm!3671 (= call!3674 (arrayNoDuplicates!0 lt!19247 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5978 (Cons!1198 (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!5787 (Cons!1198 (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5745 (Cons!1198 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) Nil!1199) Nil!1199)) (ite c!5745 (Cons!1198 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) Nil!1199) Nil!1199))) (ite c!5787 (Cons!1198 (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5745 (Cons!1198 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) Nil!1199) Nil!1199)) (ite c!5745 (Cons!1198 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) Nil!1199) Nil!1199)))))))

(declare-fun b!44929 () Bool)

(assert (=> b!44929 (= e!28469 (contains!573 (ite c!5787 (Cons!1198 (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5745 (Cons!1198 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) Nil!1199) Nil!1199)) (ite c!5745 (Cons!1198 (select (arr!1406 lt!19247) #b00000000000000000000000000000000) Nil!1199) Nil!1199)) (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!44930 () Bool)

(declare-fun e!28465 () Bool)

(assert (=> b!44930 (= e!28465 call!3674)))

(declare-fun b!44931 () Bool)

(assert (=> b!44931 (= e!28468 e!28465)))

(assert (=> b!44931 (= c!5978 (validKeyInArray!0 (select (arr!1406 lt!19247) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!44932 () Bool)

(assert (=> b!44932 (= e!28465 call!3674)))

(assert (= (and d!8581 (not res!26415)) b!44928))

(assert (= (and b!44928 res!26417) b!44929))

(assert (= (and b!44928 res!26416) b!44931))

(assert (= (and b!44931 c!5978) b!44930))

(assert (= (and b!44931 (not c!5978)) b!44932))

(assert (= (or b!44930 b!44932) bm!3671))

(assert (=> b!44928 m!38901))

(assert (=> b!44928 m!38901))

(assert (=> b!44928 m!38903))

(assert (=> bm!3671 m!38901))

(declare-fun m!39173 () Bool)

(assert (=> bm!3671 m!39173))

(assert (=> b!44929 m!38901))

(assert (=> b!44929 m!38901))

(declare-fun m!39175 () Bool)

(assert (=> b!44929 m!39175))

(assert (=> b!44931 m!38901))

(assert (=> b!44931 m!38901))

(assert (=> b!44931 m!38903))

(assert (=> bm!3577 d!8581))

(declare-fun d!8587 () Bool)

(declare-fun e!28472 () Bool)

(assert (=> d!8587 e!28472))

(declare-fun res!26420 () Bool)

(assert (=> d!8587 (=> res!26420 e!28472)))

(declare-fun lt!19882 () Bool)

(assert (=> d!8587 (= res!26420 (not lt!19882))))

(declare-fun lt!19879 () Bool)

(assert (=> d!8587 (= lt!19882 lt!19879)))

(declare-fun lt!19880 () Unit!1234)

(declare-fun e!28473 () Unit!1234)

(assert (=> d!8587 (= lt!19880 e!28473)))

(declare-fun c!5979 () Bool)

(assert (=> d!8587 (= c!5979 lt!19879)))

(assert (=> d!8587 (= lt!19879 (containsKey!74 (toList!617 lt!19581) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8587 (= (contains!576 lt!19581 #b0000000000000000000000000000000000000000000000000000000000000000) lt!19882)))

(declare-fun b!44935 () Bool)

(declare-fun lt!19881 () Unit!1234)

(assert (=> b!44935 (= e!28473 lt!19881)))

(assert (=> b!44935 (= lt!19881 (lemmaContainsKeyImpliesGetValueByKeyDefined!62 (toList!617 lt!19581) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!44935 (isDefined!63 (getValueByKey!105 (toList!617 lt!19581) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!44936 () Bool)

(declare-fun Unit!1256 () Unit!1234)

(assert (=> b!44936 (= e!28473 Unit!1256)))

(declare-fun b!44937 () Bool)

(assert (=> b!44937 (= e!28472 (isDefined!63 (getValueByKey!105 (toList!617 lt!19581) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!8587 c!5979) b!44935))

(assert (= (and d!8587 (not c!5979)) b!44936))

(assert (= (and d!8587 (not res!26420)) b!44937))

(declare-fun m!39183 () Bool)

(assert (=> d!8587 m!39183))

(declare-fun m!39185 () Bool)

(assert (=> b!44935 m!39185))

(assert (=> b!44935 m!38827))

(assert (=> b!44935 m!38827))

(declare-fun m!39187 () Bool)

(assert (=> b!44935 m!39187))

(assert (=> b!44937 m!38827))

(assert (=> b!44937 m!38827))

(assert (=> b!44937 m!39187))

(assert (=> bm!3623 d!8587))

(declare-fun b_lambda!2339 () Bool)

(assert (= b_lambda!2327 (or (and start!6730 b_free!1513 (= defaultEntry!470 (defaultEntry!1896 lt!19250))) b_lambda!2339)))

(check-sat (not b!44928) (not b!44937) (not b!44887) (not b!44677) (not b!44918) (not b!44650) (not b!44804) (not b_lambda!2339) (not d!8455) (not d!8463) (not b!44743) (not bm!3654) (not b!44807) (not d!8533) (not b!44806) (not d!8427) (not b!44745) (not b!44882) (not d!8453) (not b!44742) (not d!8515) (not d!8587) (not b!44635) (not b!44884) (not b!44717) (not d!8501) (not b!44902) (not d!8519) (not b!44917) (not b!44878) (not b!44780) (not b!44662) (not b!44682) (not b!44903) (not d!8435) (not b!44791) (not b!44653) (not b!44659) (not b!44799) (not b!44883) (not d!8431) (not bm!3671) (not b!44880) (not d!8553) (not d!8529) (not b!44800) (not bm!3668) (not b_lambda!2323) (not b!44675) (not b_lambda!2335) tp_is_empty!1903 (not d!8555) (not d!8535) (not d!8531) (not d!8517) (not d!8451) (not b_lambda!2337) (not d!8449) (not bm!3655) (not b!44899) b_and!2725 (not d!8527) (not b!44909) (not b!44935) (not b!44647) (not b!44681) (not b!44785) (not b!44881) (not b!44792) (not b!44931) (not b!44683) (not d!8541) (not d!8439) (not b!44660) (not b!44877) (not b!44643) (not d!8539) (not b!44639) (not d!8503) (not bm!3669) (not d!8511) (not b!44803) (not bm!3666) (not d!8543) (not b!44919) (not d!8537) (not d!8443) (not bm!3660) (not d!8509) (not b!44668) (not d!8461) (not d!8521) (not b!44667) (not b_next!1513) (not b!44651) (not b!44808) (not b!44929) (not d!8545) (not b!44802) (not d!8559))
(check-sat b_and!2725 (not b_next!1513))
