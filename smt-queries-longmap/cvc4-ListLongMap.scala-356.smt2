; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6740 () Bool)

(assert start!6740)

(declare-fun b_free!1517 () Bool)

(declare-fun b_next!1517 () Bool)

(assert (=> start!6740 (= b_free!1517 (not b_next!1517))))

(declare-fun tp!5963 () Bool)

(declare-fun b_and!2707 () Bool)

(assert (=> start!6740 (= tp!5963 b_and!2707)))

(declare-fun res!26053 () Bool)

(declare-fun e!27963 () Bool)

(assert (=> start!6740 (=> (not res!26053) (not e!27963))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6740 (= res!26053 (validMask!0 mask!853))))

(assert (=> start!6740 e!27963))

(assert (=> start!6740 true))

(assert (=> start!6740 tp!5963))

(declare-fun b!44098 () Bool)

(declare-fun e!27964 () Bool)

(declare-fun lt!19338 () Bool)

(assert (=> b!44098 (= e!27964 (not lt!19338))))

(declare-fun b!44099 () Bool)

(assert (=> b!44099 (= e!27963 (not e!27964))))

(declare-fun res!26055 () Bool)

(assert (=> b!44099 (=> (not res!26055) (not e!27964))))

(declare-datatypes ((array!2959 0))(
  ( (array!2960 (arr!1423 (Array (_ BitVec 32) (_ BitVec 64))) (size!1626 (_ BitVec 32))) )
))
(declare-datatypes ((V!2329 0))(
  ( (V!2330 (val!992 Int)) )
))
(declare-datatypes ((ValueCell!706 0))(
  ( (ValueCellFull!706 (v!2088 V!2329)) (EmptyCell!706) )
))
(declare-datatypes ((array!2961 0))(
  ( (array!2962 (arr!1424 (Array (_ BitVec 32) ValueCell!706)) (size!1627 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!392 0))(
  ( (LongMapFixedSize!393 (defaultEntry!1898 Int) (mask!5475 (_ BitVec 32)) (extraKeys!1789 (_ BitVec 32)) (zeroValue!1816 V!2329) (minValue!1816 V!2329) (_size!245 (_ BitVec 32)) (_keys!3465 array!2959) (_values!1881 array!2961) (_vacant!245 (_ BitVec 32))) )
))
(declare-fun lt!19337 () LongMapFixedSize!392)

(declare-fun valid!126 (LongMapFixedSize!392) Bool)

(assert (=> b!44099 (= res!26055 (valid!126 lt!19337))))

(declare-datatypes ((Unit!1237 0))(
  ( (Unit!1238) )
))
(declare-fun lt!19346 () Unit!1237)

(declare-fun e!27962 () Unit!1237)

(assert (=> b!44099 (= lt!19346 e!27962)))

(declare-fun c!5741 () Bool)

(assert (=> b!44099 (= c!5741 lt!19338)))

(declare-datatypes ((tuple2!1638 0))(
  ( (tuple2!1639 (_1!830 (_ BitVec 64)) (_2!830 V!2329)) )
))
(declare-datatypes ((List!1212 0))(
  ( (Nil!1209) (Cons!1208 (h!1785 tuple2!1638) (t!4231 List!1212)) )
))
(declare-datatypes ((ListLongMap!1215 0))(
  ( (ListLongMap!1216 (toList!623 List!1212)) )
))
(declare-fun lt!19339 () ListLongMap!1215)

(assert (=> b!44099 (= lt!19338 (not (= lt!19339 (ListLongMap!1216 Nil!1209))))))

(declare-fun map!844 (LongMapFixedSize!392) ListLongMap!1215)

(assert (=> b!44099 (= lt!19339 (map!844 lt!19337))))

(declare-fun lt!19345 () array!2959)

(declare-datatypes ((List!1213 0))(
  ( (Nil!1210) (Cons!1209 (h!1786 (_ BitVec 64)) (t!4232 List!1213)) )
))
(declare-fun arrayNoDuplicates!0 (array!2959 (_ BitVec 32) List!1213) Bool)

(assert (=> b!44099 (arrayNoDuplicates!0 lt!19345 #b00000000000000000000000000000000 Nil!1210)))

(declare-fun lt!19348 () Unit!1237)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2959 (_ BitVec 32) (_ BitVec 32) List!1213) Unit!1237)

(assert (=> b!44099 (= lt!19348 (lemmaArrayNoDuplicatesInAll0Array!0 lt!19345 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2959 (_ BitVec 32)) Bool)

(assert (=> b!44099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19345 mask!853)))

(declare-fun lt!19342 () Unit!1237)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2959 (_ BitVec 32) (_ BitVec 32)) Unit!1237)

(assert (=> b!44099 (= lt!19342 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!19345 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2959 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!44099 (= (arrayCountValidKeys!0 lt!19345 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!19343 () Unit!1237)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2959 (_ BitVec 32) (_ BitVec 32)) Unit!1237)

(assert (=> b!44099 (= lt!19343 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!19345 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!19344 () array!2961)

(declare-fun lt!19340 () V!2329)

(assert (=> b!44099 (= lt!19337 (LongMapFixedSize!393 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19340 lt!19340 #b00000000000000000000000000000000 lt!19345 lt!19344 #b00000000000000000000000000000000))))

(assert (=> b!44099 (= lt!19344 (array!2962 ((as const (Array (_ BitVec 32) ValueCell!706)) EmptyCell!706) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!44099 (= lt!19345 (array!2960 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!267 (Int (_ BitVec 64)) V!2329)

(assert (=> b!44099 (= lt!19340 (dynLambda!267 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!44100 () Bool)

(declare-fun Unit!1239 () Unit!1237)

(assert (=> b!44100 (= e!27962 Unit!1239)))

(declare-fun lt!19347 () tuple2!1638)

(declare-fun head!895 (List!1212) tuple2!1638)

(assert (=> b!44100 (= lt!19347 (head!895 (toList!623 lt!19339)))))

(declare-fun lt!19341 () Unit!1237)

(declare-fun lemmaKeyInListMapIsInArray!108 (array!2959 array!2961 (_ BitVec 32) (_ BitVec 32) V!2329 V!2329 (_ BitVec 64) Int) Unit!1237)

(assert (=> b!44100 (= lt!19341 (lemmaKeyInListMapIsInArray!108 lt!19345 lt!19344 mask!853 #b00000000000000000000000000000000 lt!19340 lt!19340 (_1!830 lt!19347) defaultEntry!470))))

(declare-fun res!26054 () Bool)

(assert (=> b!44100 (= res!26054 (and (not (= (_1!830 lt!19347) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!830 lt!19347) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!27961 () Bool)

(assert (=> b!44100 (=> (not res!26054) (not e!27961))))

(assert (=> b!44100 e!27961))

(declare-fun lt!19349 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2959 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!44100 (= lt!19349 (arrayScanForKey!0 lt!19345 (_1!830 lt!19347) #b00000000000000000000000000000000))))

(assert (=> b!44100 false))

(declare-fun b!44101 () Bool)

(declare-fun Unit!1240 () Unit!1237)

(assert (=> b!44101 (= e!27962 Unit!1240)))

(declare-fun b!44102 () Bool)

(declare-fun arrayContainsKey!0 (array!2959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!44102 (= e!27961 (arrayContainsKey!0 lt!19345 (_1!830 lt!19347) #b00000000000000000000000000000000))))

(assert (= (and start!6740 res!26053) b!44099))

(assert (= (and b!44099 c!5741) b!44100))

(assert (= (and b!44099 (not c!5741)) b!44101))

(assert (= (and b!44100 res!26054) b!44102))

(assert (= (and b!44099 res!26055) b!44098))

(declare-fun b_lambda!2313 () Bool)

(assert (=> (not b_lambda!2313) (not b!44099)))

(declare-fun t!4230 () Bool)

(declare-fun tb!1005 () Bool)

(assert (=> (and start!6740 (= defaultEntry!470 defaultEntry!470) t!4230) tb!1005))

(declare-fun result!1755 () Bool)

(declare-fun tp_is_empty!1907 () Bool)

(assert (=> tb!1005 (= result!1755 tp_is_empty!1907)))

(assert (=> b!44099 t!4230))

(declare-fun b_and!2709 () Bool)

(assert (= b_and!2707 (and (=> t!4230 result!1755) b_and!2709)))

(declare-fun m!38323 () Bool)

(assert (=> start!6740 m!38323))

(declare-fun m!38325 () Bool)

(assert (=> b!44099 m!38325))

(declare-fun m!38327 () Bool)

(assert (=> b!44099 m!38327))

(declare-fun m!38329 () Bool)

(assert (=> b!44099 m!38329))

(declare-fun m!38331 () Bool)

(assert (=> b!44099 m!38331))

(declare-fun m!38333 () Bool)

(assert (=> b!44099 m!38333))

(declare-fun m!38335 () Bool)

(assert (=> b!44099 m!38335))

(declare-fun m!38337 () Bool)

(assert (=> b!44099 m!38337))

(declare-fun m!38339 () Bool)

(assert (=> b!44099 m!38339))

(declare-fun m!38341 () Bool)

(assert (=> b!44099 m!38341))

(declare-fun m!38343 () Bool)

(assert (=> b!44100 m!38343))

(declare-fun m!38345 () Bool)

(assert (=> b!44100 m!38345))

(declare-fun m!38347 () Bool)

(assert (=> b!44100 m!38347))

(declare-fun m!38349 () Bool)

(assert (=> b!44102 m!38349))

(push 1)

(assert (not b_next!1517))

(assert (not b!44102))

(assert (not b!44099))

(assert b_and!2709)

(assert (not b_lambda!2313))

(assert (not b!44100))

(assert tp_is_empty!1907)

(assert (not start!6740))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2709)

(assert (not b_next!1517))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!2317 () Bool)

(assert (= b_lambda!2313 (or (and start!6740 b_free!1517) b_lambda!2317)))

(push 1)

(assert (not b_next!1517))

(assert (not b_lambda!2317))

(assert (not b!44100))

(assert (not b!44102))

(assert (not b!44099))

(assert b_and!2709)

(assert tp_is_empty!1907)

(assert (not start!6740))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2709)

(assert (not b_next!1517))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!8279 () Bool)

(declare-fun getCurrentListMap!356 (array!2959 array!2961 (_ BitVec 32) (_ BitVec 32) V!2329 V!2329 (_ BitVec 32) Int) ListLongMap!1215)

(assert (=> d!8279 (= (map!844 lt!19337) (getCurrentListMap!356 (_keys!3465 lt!19337) (_values!1881 lt!19337) (mask!5475 lt!19337) (extraKeys!1789 lt!19337) (zeroValue!1816 lt!19337) (minValue!1816 lt!19337) #b00000000000000000000000000000000 (defaultEntry!1898 lt!19337)))))

(declare-fun bs!2006 () Bool)

(assert (= bs!2006 d!8279))

(declare-fun m!38355 () Bool)

(assert (=> bs!2006 m!38355))

(assert (=> b!44099 d!8279))

(declare-fun d!8283 () Bool)

(declare-fun res!26068 () Bool)

(declare-fun e!27969 () Bool)

(assert (=> d!8283 (=> (not res!26068) (not e!27969))))

(declare-fun simpleValid!31 (LongMapFixedSize!392) Bool)

(assert (=> d!8283 (= res!26068 (simpleValid!31 lt!19337))))

(assert (=> d!8283 (= (valid!126 lt!19337) e!27969)))

(declare-fun b!44117 () Bool)

(declare-fun res!26069 () Bool)

(assert (=> b!44117 (=> (not res!26069) (not e!27969))))

(assert (=> b!44117 (= res!26069 (= (arrayCountValidKeys!0 (_keys!3465 lt!19337) #b00000000000000000000000000000000 (size!1626 (_keys!3465 lt!19337))) (_size!245 lt!19337)))))

(declare-fun b!44118 () Bool)

(declare-fun res!26070 () Bool)

(assert (=> b!44118 (=> (not res!26070) (not e!27969))))

(assert (=> b!44118 (= res!26070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3465 lt!19337) (mask!5475 lt!19337)))))

(declare-fun b!44119 () Bool)

(assert (=> b!44119 (= e!27969 (arrayNoDuplicates!0 (_keys!3465 lt!19337) #b00000000000000000000000000000000 Nil!1210))))

(assert (= (and d!8283 res!26068) b!44117))

(assert (= (and b!44117 res!26069) b!44118))

(assert (= (and b!44118 res!26070) b!44119))

(declare-fun m!38359 () Bool)

(assert (=> d!8283 m!38359))

(declare-fun m!38363 () Bool)

(assert (=> b!44117 m!38363))

(declare-fun m!38365 () Bool)

(assert (=> b!44118 m!38365))

(declare-fun m!38369 () Bool)

(assert (=> b!44119 m!38369))

(assert (=> b!44099 d!8283))

(declare-fun d!8289 () Bool)

(declare-fun lt!19370 () (_ BitVec 32))

(assert (=> d!8289 (and (bvsge lt!19370 #b00000000000000000000000000000000) (bvsle lt!19370 (bvsub (size!1626 lt!19345) #b00000000000000000000000000000000)))))

(declare-fun e!27985 () (_ BitVec 32))

(assert (=> d!8289 (= lt!19370 e!27985)))

(declare-fun c!5749 () Bool)

(assert (=> d!8289 (= c!5749 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8289 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1626 lt!19345)))))

(assert (=> d!8289 (= (arrayCountValidKeys!0 lt!19345 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!19370)))

(declare-fun b!44143 () Bool)

(declare-fun e!27984 () (_ BitVec 32))

(declare-fun call!3557 () (_ BitVec 32))

(assert (=> b!44143 (= e!27984 (bvadd #b00000000000000000000000000000001 call!3557))))

(declare-fun b!44144 () Bool)

(assert (=> b!44144 (= e!27984 call!3557)))

(declare-fun b!44145 () Bool)

(assert (=> b!44145 (= e!27985 #b00000000000000000000000000000000)))

(declare-fun bm!3554 () Bool)

(assert (=> bm!3554 (= call!3557 (arrayCountValidKeys!0 lt!19345 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!44146 () Bool)

(assert (=> b!44146 (= e!27985 e!27984)))

(declare-fun c!5750 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!44146 (= c!5750 (validKeyInArray!0 (select (arr!1423 lt!19345) #b00000000000000000000000000000000)))))

(assert (= (and d!8289 c!5749) b!44145))

(assert (= (and d!8289 (not c!5749)) b!44146))

(assert (= (and b!44146 c!5750) b!44143))

(assert (= (and b!44146 (not c!5750)) b!44144))

(assert (= (or b!44143 b!44144) bm!3554))

(declare-fun m!38389 () Bool)

(assert (=> bm!3554 m!38389))

(declare-fun m!38391 () Bool)

(assert (=> b!44146 m!38391))

(assert (=> b!44146 m!38391))

(declare-fun m!38393 () Bool)

(assert (=> b!44146 m!38393))

(assert (=> b!44099 d!8289))

(declare-fun d!8297 () Bool)

(assert (=> d!8297 (= (arrayCountValidKeys!0 lt!19345 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!19375 () Unit!1237)

(declare-fun choose!59 (array!2959 (_ BitVec 32) (_ BitVec 32)) Unit!1237)

(assert (=> d!8297 (= lt!19375 (choose!59 lt!19345 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8297 (bvslt (size!1626 lt!19345) #b01111111111111111111111111111111)))

(assert (=> d!8297 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!19345 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!19375)))

(declare-fun bs!2009 () Bool)

(assert (= bs!2009 d!8297))

(assert (=> bs!2009 m!38333))

(declare-fun m!38395 () Bool)

(assert (=> bs!2009 m!38395))

(assert (=> b!44099 d!8297))

(declare-fun d!8299 () Bool)

(declare-fun res!26103 () Bool)

(declare-fun e!28024 () Bool)

(assert (=> d!8299 (=> res!26103 e!28024)))

(assert (=> d!8299 (= res!26103 (bvsge #b00000000000000000000000000000000 (size!1626 lt!19345)))))

(assert (=> d!8299 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19345 mask!853) e!28024)))

(declare-fun b!44197 () Bool)

(declare-fun e!28023 () Bool)

(declare-fun call!3569 () Bool)

(assert (=> b!44197 (= e!28023 call!3569)))

(declare-fun b!44198 () Bool)

(declare-fun e!28022 () Bool)

(assert (=> b!44198 (= e!28022 e!28023)))

(declare-fun lt!19384 () (_ BitVec 64))

(assert (=> b!44198 (= lt!19384 (select (arr!1423 lt!19345) #b00000000000000000000000000000000))))

(declare-fun lt!19383 () Unit!1237)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2959 (_ BitVec 64) (_ BitVec 32)) Unit!1237)

(assert (=> b!44198 (= lt!19383 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19345 lt!19384 #b00000000000000000000000000000000))))

(assert (=> b!44198 (arrayContainsKey!0 lt!19345 lt!19384 #b00000000000000000000000000000000)))

(declare-fun lt!19385 () Unit!1237)

(assert (=> b!44198 (= lt!19385 lt!19383)))

(declare-fun res!26102 () Bool)

(declare-datatypes ((SeekEntryResult!204 0))(
  ( (MissingZero!204 (index!2938 (_ BitVec 32))) (Found!204 (index!2939 (_ BitVec 32))) (Intermediate!204 (undefined!1016 Bool) (index!2940 (_ BitVec 32)) (x!8358 (_ BitVec 32))) (Undefined!204) (MissingVacant!204 (index!2941 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2959 (_ BitVec 32)) SeekEntryResult!204)

(assert (=> b!44198 (= res!26102 (= (seekEntryOrOpen!0 (select (arr!1423 lt!19345) #b00000000000000000000000000000000) lt!19345 mask!853) (Found!204 #b00000000000000000000000000000000)))))

(assert (=> b!44198 (=> (not res!26102) (not e!28023))))

(declare-fun bm!3566 () Bool)

(assert (=> bm!3566 (= call!3569 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!19345 mask!853))))

(declare-fun b!44199 () Bool)

(assert (=> b!44199 (= e!28024 e!28022)))

(declare-fun c!5765 () Bool)

(assert (=> b!44199 (= c!5765 (validKeyInArray!0 (select (arr!1423 lt!19345) #b00000000000000000000000000000000)))))

(declare-fun b!44200 () Bool)

(assert (=> b!44200 (= e!28022 call!3569)))

(assert (= (and d!8299 (not res!26103)) b!44199))

(assert (= (and b!44199 c!5765) b!44198))

(assert (= (and b!44199 (not c!5765)) b!44200))

(assert (= (and b!44198 res!26102) b!44197))

(assert (= (or b!44197 b!44200) bm!3566))

(assert (=> b!44198 m!38391))

(declare-fun m!38411 () Bool)

(assert (=> b!44198 m!38411))

(declare-fun m!38413 () Bool)

(assert (=> b!44198 m!38413))

(assert (=> b!44198 m!38391))

(declare-fun m!38415 () Bool)

(assert (=> b!44198 m!38415))

(declare-fun m!38417 () Bool)

(assert (=> bm!3566 m!38417))

(assert (=> b!44199 m!38391))

(assert (=> b!44199 m!38391))

(assert (=> b!44199 m!38393))

(assert (=> b!44099 d!8299))

(declare-fun d!8307 () Bool)

(assert (=> d!8307 (arrayNoDuplicates!0 lt!19345 #b00000000000000000000000000000000 Nil!1210)))

(declare-fun lt!19388 () Unit!1237)

(declare-fun choose!111 (array!2959 (_ BitVec 32) (_ BitVec 32) List!1213) Unit!1237)

(assert (=> d!8307 (= lt!19388 (choose!111 lt!19345 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1210))))

(assert (=> d!8307 (= (size!1626 lt!19345) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!8307 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!19345 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1210) lt!19388)))

(declare-fun bs!2010 () Bool)

(assert (= bs!2010 d!8307))

(assert (=> bs!2010 m!38339))

(declare-fun m!38427 () Bool)

(assert (=> bs!2010 m!38427))

(assert (=> b!44099 d!8307))

(declare-fun d!8311 () Bool)

(assert (=> d!8311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19345 mask!853)))

(declare-fun lt!19399 () Unit!1237)

(declare-fun choose!34 (array!2959 (_ BitVec 32) (_ BitVec 32)) Unit!1237)

(assert (=> d!8311 (= lt!19399 (choose!34 lt!19345 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!8311 (validMask!0 mask!853)))

(assert (=> d!8311 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!19345 mask!853 #b00000000000000000000000000000000) lt!19399)))

(declare-fun bs!2011 () Bool)

(assert (= bs!2011 d!8311))

(assert (=> bs!2011 m!38335))

(declare-fun m!38429 () Bool)

(assert (=> bs!2011 m!38429))

(assert (=> bs!2011 m!38323))

(assert (=> b!44099 d!8311))

(declare-fun b!44244 () Bool)

(declare-fun e!28053 () Bool)

(declare-fun contains!576 (List!1213 (_ BitVec 64)) Bool)

(assert (=> b!44244 (= e!28053 (contains!576 Nil!1210 (select (arr!1423 lt!19345) #b00000000000000000000000000000000)))))

(declare-fun b!44245 () Bool)

(declare-fun e!28051 () Bool)

(declare-fun e!28052 () Bool)

(assert (=> b!44245 (= e!28051 e!28052)))

(declare-fun c!5777 () Bool)

(assert (=> b!44245 (= c!5777 (validKeyInArray!0 (select (arr!1423 lt!19345) #b00000000000000000000000000000000)))))

(declare-fun b!44246 () Bool)

(declare-fun e!28054 () Bool)

(assert (=> b!44246 (= e!28054 e!28051)))

(declare-fun res!26125 () Bool)

(assert (=> b!44246 (=> (not res!26125) (not e!28051))))

(assert (=> b!44246 (= res!26125 (not e!28053))))

(declare-fun res!26127 () Bool)

(assert (=> b!44246 (=> (not res!26127) (not e!28053))))

(assert (=> b!44246 (= res!26127 (validKeyInArray!0 (select (arr!1423 lt!19345) #b00000000000000000000000000000000)))))

(declare-fun bm!3575 () Bool)

(declare-fun call!3578 () Bool)

(assert (=> bm!3575 (= call!3578 (arrayNoDuplicates!0 lt!19345 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5777 (Cons!1209 (select (arr!1423 lt!19345) #b00000000000000000000000000000000) Nil!1210) Nil!1210)))))

(declare-fun b!44247 () Bool)

(assert (=> b!44247 (= e!28052 call!3578)))

(declare-fun d!8313 () Bool)

(declare-fun res!26126 () Bool)

(assert (=> d!8313 (=> res!26126 e!28054)))

(assert (=> d!8313 (= res!26126 (bvsge #b00000000000000000000000000000000 (size!1626 lt!19345)))))

(assert (=> d!8313 (= (arrayNoDuplicates!0 lt!19345 #b00000000000000000000000000000000 Nil!1210) e!28054)))

(declare-fun b!44248 () Bool)

(assert (=> b!44248 (= e!28052 call!3578)))

(assert (= (and d!8313 (not res!26126)) b!44246))

(assert (= (and b!44246 res!26127) b!44244))

(assert (= (and b!44246 res!26125) b!44245))

(assert (= (and b!44245 c!5777) b!44248))

(assert (= (and b!44245 (not c!5777)) b!44247))

(assert (= (or b!44248 b!44247) bm!3575))

(assert (=> b!44244 m!38391))

(assert (=> b!44244 m!38391))

(declare-fun m!38443 () Bool)

(assert (=> b!44244 m!38443))

(assert (=> b!44245 m!38391))

(assert (=> b!44245 m!38391))

(assert (=> b!44245 m!38393))

(assert (=> b!44246 m!38391))

(assert (=> b!44246 m!38391))

(assert (=> b!44246 m!38393))

(assert (=> bm!3575 m!38391))

(declare-fun m!38445 () Bool)

(assert (=> bm!3575 m!38445))

(assert (=> b!44099 d!8313))

(declare-fun d!8321 () Bool)

(assert (=> d!8321 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6740 d!8321))

(declare-fun d!8331 () Bool)

(assert (=> d!8331 (= (head!895 (toList!623 lt!19339)) (h!1785 (toList!623 lt!19339)))))

(assert (=> b!44100 d!8331))

(declare-fun d!8333 () Bool)

(declare-fun e!28062 () Bool)

(assert (=> d!8333 e!28062))

(declare-fun c!5785 () Bool)

(assert (=> d!8333 (= c!5785 (and (not (= (_1!830 lt!19347) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!830 lt!19347) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!19420 () Unit!1237)

(declare-fun choose!264 (array!2959 array!2961 (_ BitVec 32) (_ BitVec 32) V!2329 V!2329 (_ BitVec 64) Int) Unit!1237)

(assert (=> d!8333 (= lt!19420 (choose!264 lt!19345 lt!19344 mask!853 #b00000000000000000000000000000000 lt!19340 lt!19340 (_1!830 lt!19347) defaultEntry!470))))

(assert (=> d!8333 (validMask!0 mask!853)))

(assert (=> d!8333 (= (lemmaKeyInListMapIsInArray!108 lt!19345 lt!19344 mask!853 #b00000000000000000000000000000000 lt!19340 lt!19340 (_1!830 lt!19347) defaultEntry!470) lt!19420)))

(declare-fun b!44263 () Bool)

(assert (=> b!44263 (= e!28062 (arrayContainsKey!0 lt!19345 (_1!830 lt!19347) #b00000000000000000000000000000000))))

(declare-fun b!44264 () Bool)

(assert (=> b!44264 (= e!28062 (ite (= (_1!830 lt!19347) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!8333 c!5785) b!44263))

(assert (= (and d!8333 (not c!5785)) b!44264))

(declare-fun m!38455 () Bool)

(assert (=> d!8333 m!38455))

(assert (=> d!8333 m!38323))

(assert (=> b!44263 m!38349))

(assert (=> b!44100 d!8333))

(declare-fun d!8339 () Bool)

(declare-fun lt!19424 () (_ BitVec 32))

(assert (=> d!8339 (and (or (bvslt lt!19424 #b00000000000000000000000000000000) (bvsge lt!19424 (size!1626 lt!19345)) (and (bvsge lt!19424 #b00000000000000000000000000000000) (bvslt lt!19424 (size!1626 lt!19345)))) (bvsge lt!19424 #b00000000000000000000000000000000) (bvslt lt!19424 (size!1626 lt!19345)) (= (select (arr!1423 lt!19345) lt!19424) (_1!830 lt!19347)))))

(declare-fun e!28074 () (_ BitVec 32))

(assert (=> d!8339 (= lt!19424 e!28074)))

(declare-fun c!5789 () Bool)

(assert (=> d!8339 (= c!5789 (= (select (arr!1423 lt!19345) #b00000000000000000000000000000000) (_1!830 lt!19347)))))

(assert (=> d!8339 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1626 lt!19345)) (bvslt (size!1626 lt!19345) #b01111111111111111111111111111111))))

(assert (=> d!8339 (= (arrayScanForKey!0 lt!19345 (_1!830 lt!19347) #b00000000000000000000000000000000) lt!19424)))

(declare-fun b!44279 () Bool)

(assert (=> b!44279 (= e!28074 #b00000000000000000000000000000000)))

(declare-fun b!44280 () Bool)

(assert (=> b!44280 (= e!28074 (arrayScanForKey!0 lt!19345 (_1!830 lt!19347) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8339 c!5789) b!44279))

(assert (= (and d!8339 (not c!5789)) b!44280))

(declare-fun m!38463 () Bool)

(assert (=> d!8339 m!38463))

(assert (=> d!8339 m!38391))

(declare-fun m!38465 () Bool)

(assert (=> b!44280 m!38465))

(assert (=> b!44100 d!8339))

(declare-fun d!8345 () Bool)

(declare-fun res!26144 () Bool)

(declare-fun e!28083 () Bool)

(assert (=> d!8345 (=> res!26144 e!28083)))

(assert (=> d!8345 (= res!26144 (= (select (arr!1423 lt!19345) #b00000000000000000000000000000000) (_1!830 lt!19347)))))

(assert (=> d!8345 (= (arrayContainsKey!0 lt!19345 (_1!830 lt!19347) #b00000000000000000000000000000000) e!28083)))

(declare-fun b!44289 () Bool)

(declare-fun e!28084 () Bool)

(assert (=> b!44289 (= e!28083 e!28084)))

(declare-fun res!26145 () Bool)

(assert (=> b!44289 (=> (not res!26145) (not e!28084))))

(assert (=> b!44289 (= res!26145 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1626 lt!19345)))))

(declare-fun b!44290 () Bool)

(assert (=> b!44290 (= e!28084 (arrayContainsKey!0 lt!19345 (_1!830 lt!19347) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8345 (not res!26144)) b!44289))

(assert (= (and b!44289 res!26145) b!44290))

(assert (=> d!8345 m!38391))

(declare-fun m!38469 () Bool)

(assert (=> b!44290 m!38469))

(assert (=> b!44102 d!8345))

(push 1)

(assert (not b_next!1517))

(assert (not b!44198))

(assert (not d!8311))

(assert (not b!44146))

(assert (not b!44244))

(assert (not b!44246))

(assert (not d!8333))

(assert (not b!44245))

(assert b_and!2709)

(assert (not b!44199))

(assert (not d!8283))

(assert (not b!44280))

(assert (not d!8307))

(assert (not b!44290))

(assert (not bm!3575))

(assert (not b_lambda!2317))

(assert (not b!44118))

(assert (not b!44263))

(assert (not d!8279))

(assert (not b!44117))

(assert (not d!8297))

(assert tp_is_empty!1907)

(assert (not b!44119))

(assert (not bm!3554))

(assert (not bm!3566))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2709)

(assert (not b_next!1517))

(check-sat)

(get-model)

(pop 1)

(assert (=> d!8311 d!8299))

(declare-fun d!8375 () Bool)

(assert (=> d!8375 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19345 mask!853)))

(assert (=> d!8375 true))

(declare-fun _$30!72 () Unit!1237)

(assert (=> d!8375 (= (choose!34 lt!19345 mask!853 #b00000000000000000000000000000000) _$30!72)))

(declare-fun bs!2017 () Bool)

(assert (= bs!2017 d!8375))

(assert (=> bs!2017 m!38335))

(assert (=> d!8311 d!8375))

(assert (=> d!8311 d!8321))

(declare-fun d!8377 () Bool)

(declare-fun lt!19438 () (_ BitVec 32))

(assert (=> d!8377 (and (bvsge lt!19438 #b00000000000000000000000000000000) (bvsle lt!19438 (bvsub (size!1626 lt!19345) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!28115 () (_ BitVec 32))

(assert (=> d!8377 (= lt!19438 e!28115)))

(declare-fun c!5803 () Bool)

(assert (=> d!8377 (= c!5803 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8377 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1626 lt!19345)))))

(assert (=> d!8377 (= (arrayCountValidKeys!0 lt!19345 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!19438)))

(declare-fun b!44333 () Bool)

(declare-fun e!28114 () (_ BitVec 32))

(declare-fun call!3582 () (_ BitVec 32))

(assert (=> b!44333 (= e!28114 (bvadd #b00000000000000000000000000000001 call!3582))))

(declare-fun b!44334 () Bool)

(assert (=> b!44334 (= e!28114 call!3582)))

(declare-fun b!44335 () Bool)

(assert (=> b!44335 (= e!28115 #b00000000000000000000000000000000)))

(declare-fun bm!3579 () Bool)

(assert (=> bm!3579 (= call!3582 (arrayCountValidKeys!0 lt!19345 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!44336 () Bool)

(assert (=> b!44336 (= e!28115 e!28114)))

(declare-fun c!5804 () Bool)

(assert (=> b!44336 (= c!5804 (validKeyInArray!0 (select (arr!1423 lt!19345) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!8377 c!5803) b!44335))

(assert (= (and d!8377 (not c!5803)) b!44336))

(assert (= (and b!44336 c!5804) b!44333))

(assert (= (and b!44336 (not c!5804)) b!44334))

(assert (= (or b!44333 b!44334) bm!3579))

(declare-fun m!38513 () Bool)

(assert (=> bm!3579 m!38513))

(declare-fun m!38515 () Bool)

(assert (=> b!44336 m!38515))

(assert (=> b!44336 m!38515))

(declare-fun m!38517 () Bool)

(assert (=> b!44336 m!38517))

(assert (=> bm!3554 d!8377))

(assert (=> d!8307 d!8313))

(declare-fun d!8379 () Bool)

(assert (=> d!8379 (arrayNoDuplicates!0 lt!19345 #b00000000000000000000000000000000 Nil!1210)))

(assert (=> d!8379 true))

(declare-fun res!26164 () Unit!1237)

(assert (=> d!8379 (= (choose!111 lt!19345 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1210) res!26164)))

(declare-fun bs!2018 () Bool)

(assert (= bs!2018 d!8379))

(assert (=> bs!2018 m!38339))

(assert (=> d!8307 d!8379))

(declare-fun d!8381 () Bool)

(assert (=> d!8381 (= (validKeyInArray!0 (select (arr!1423 lt!19345) #b00000000000000000000000000000000)) (and (not (= (select (arr!1423 lt!19345) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1423 lt!19345) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!44146 d!8381))

(declare-fun d!8383 () Bool)

(declare-fun e!28118 () Bool)

(assert (=> d!8383 e!28118))

(declare-fun c!5807 () Bool)

(assert (=> d!8383 (= c!5807 (and (not (= (_1!830 lt!19347) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!830 lt!19347) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!8383 true))

(declare-fun _$15!83 () Unit!1237)

(assert (=> d!8383 (= (choose!264 lt!19345 lt!19344 mask!853 #b00000000000000000000000000000000 lt!19340 lt!19340 (_1!830 lt!19347) defaultEntry!470) _$15!83)))

(declare-fun b!44341 () Bool)

(assert (=> b!44341 (= e!28118 (arrayContainsKey!0 lt!19345 (_1!830 lt!19347) #b00000000000000000000000000000000))))

(declare-fun b!44342 () Bool)

(assert (=> b!44342 (= e!28118 (ite (= (_1!830 lt!19347) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!8383 c!5807) b!44341))

(assert (= (and d!8383 (not c!5807)) b!44342))

(assert (=> b!44341 m!38349))

(assert (=> d!8333 d!8383))

(assert (=> d!8333 d!8321))

(declare-fun d!8385 () Bool)

(declare-fun res!26166 () Bool)

(declare-fun e!28121 () Bool)

(assert (=> d!8385 (=> res!26166 e!28121)))

(assert (=> d!8385 (= res!26166 (bvsge #b00000000000000000000000000000000 (size!1626 (_keys!3465 lt!19337))))))

(assert (=> d!8385 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3465 lt!19337) (mask!5475 lt!19337)) e!28121)))

(declare-fun b!44343 () Bool)

(declare-fun e!28120 () Bool)

(declare-fun call!3583 () Bool)

(assert (=> b!44343 (= e!28120 call!3583)))

(declare-fun b!44344 () Bool)

(declare-fun e!28119 () Bool)

(assert (=> b!44344 (= e!28119 e!28120)))

(declare-fun lt!19440 () (_ BitVec 64))

(assert (=> b!44344 (= lt!19440 (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000))))

(declare-fun lt!19439 () Unit!1237)

(assert (=> b!44344 (= lt!19439 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3465 lt!19337) lt!19440 #b00000000000000000000000000000000))))

(assert (=> b!44344 (arrayContainsKey!0 (_keys!3465 lt!19337) lt!19440 #b00000000000000000000000000000000)))

(declare-fun lt!19441 () Unit!1237)

(assert (=> b!44344 (= lt!19441 lt!19439)))

(declare-fun res!26165 () Bool)

(assert (=> b!44344 (= res!26165 (= (seekEntryOrOpen!0 (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000) (_keys!3465 lt!19337) (mask!5475 lt!19337)) (Found!204 #b00000000000000000000000000000000)))))

(assert (=> b!44344 (=> (not res!26165) (not e!28120))))

(declare-fun bm!3580 () Bool)

(assert (=> bm!3580 (= call!3583 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3465 lt!19337) (mask!5475 lt!19337)))))

(declare-fun b!44345 () Bool)

(assert (=> b!44345 (= e!28121 e!28119)))

(declare-fun c!5808 () Bool)

(assert (=> b!44345 (= c!5808 (validKeyInArray!0 (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000)))))

(declare-fun b!44346 () Bool)

(assert (=> b!44346 (= e!28119 call!3583)))

(assert (= (and d!8385 (not res!26166)) b!44345))

(assert (= (and b!44345 c!5808) b!44344))

(assert (= (and b!44345 (not c!5808)) b!44346))

(assert (= (and b!44344 res!26165) b!44343))

(assert (= (or b!44343 b!44346) bm!3580))

(declare-fun m!38519 () Bool)

(assert (=> b!44344 m!38519))

(declare-fun m!38521 () Bool)

(assert (=> b!44344 m!38521))

(declare-fun m!38523 () Bool)

(assert (=> b!44344 m!38523))

(assert (=> b!44344 m!38519))

(declare-fun m!38525 () Bool)

(assert (=> b!44344 m!38525))

(declare-fun m!38527 () Bool)

(assert (=> bm!3580 m!38527))

(assert (=> b!44345 m!38519))

(assert (=> b!44345 m!38519))

(declare-fun m!38529 () Bool)

(assert (=> b!44345 m!38529))

(assert (=> b!44118 d!8385))

(declare-fun b!44347 () Bool)

(declare-fun e!28124 () Bool)

(assert (=> b!44347 (= e!28124 (contains!576 Nil!1210 (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000)))))

(declare-fun b!44348 () Bool)

(declare-fun e!28122 () Bool)

(declare-fun e!28123 () Bool)

(assert (=> b!44348 (= e!28122 e!28123)))

(declare-fun c!5809 () Bool)

(assert (=> b!44348 (= c!5809 (validKeyInArray!0 (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000)))))

(declare-fun b!44349 () Bool)

(declare-fun e!28125 () Bool)

(assert (=> b!44349 (= e!28125 e!28122)))

(declare-fun res!26167 () Bool)

(assert (=> b!44349 (=> (not res!26167) (not e!28122))))

(assert (=> b!44349 (= res!26167 (not e!28124))))

(declare-fun res!26169 () Bool)

(assert (=> b!44349 (=> (not res!26169) (not e!28124))))

(assert (=> b!44349 (= res!26169 (validKeyInArray!0 (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000)))))

(declare-fun bm!3581 () Bool)

(declare-fun call!3584 () Bool)

(assert (=> bm!3581 (= call!3584 (arrayNoDuplicates!0 (_keys!3465 lt!19337) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5809 (Cons!1209 (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000) Nil!1210) Nil!1210)))))

(declare-fun b!44350 () Bool)

(assert (=> b!44350 (= e!28123 call!3584)))

(declare-fun d!8387 () Bool)

(declare-fun res!26168 () Bool)

(assert (=> d!8387 (=> res!26168 e!28125)))

(assert (=> d!8387 (= res!26168 (bvsge #b00000000000000000000000000000000 (size!1626 (_keys!3465 lt!19337))))))

(assert (=> d!8387 (= (arrayNoDuplicates!0 (_keys!3465 lt!19337) #b00000000000000000000000000000000 Nil!1210) e!28125)))

(declare-fun b!44351 () Bool)

(assert (=> b!44351 (= e!28123 call!3584)))

(assert (= (and d!8387 (not res!26168)) b!44349))

(assert (= (and b!44349 res!26169) b!44347))

(assert (= (and b!44349 res!26167) b!44348))

(assert (= (and b!44348 c!5809) b!44351))

(assert (= (and b!44348 (not c!5809)) b!44350))

(assert (= (or b!44351 b!44350) bm!3581))

(assert (=> b!44347 m!38519))

(assert (=> b!44347 m!38519))

(declare-fun m!38531 () Bool)

(assert (=> b!44347 m!38531))

(assert (=> b!44348 m!38519))

(assert (=> b!44348 m!38519))

(assert (=> b!44348 m!38529))

(assert (=> b!44349 m!38519))

(assert (=> b!44349 m!38519))

(assert (=> b!44349 m!38529))

(assert (=> bm!3581 m!38519))

(declare-fun m!38533 () Bool)

(assert (=> bm!3581 m!38533))

(assert (=> b!44119 d!8387))

(assert (=> b!44199 d!8381))

(declare-fun d!8389 () Bool)

(declare-fun res!26170 () Bool)

(declare-fun e!28126 () Bool)

(assert (=> d!8389 (=> res!26170 e!28126)))

(assert (=> d!8389 (= res!26170 (= (select (arr!1423 lt!19345) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_1!830 lt!19347)))))

(assert (=> d!8389 (= (arrayContainsKey!0 lt!19345 (_1!830 lt!19347) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!28126)))

(declare-fun b!44352 () Bool)

(declare-fun e!28127 () Bool)

(assert (=> b!44352 (= e!28126 e!28127)))

(declare-fun res!26171 () Bool)

(assert (=> b!44352 (=> (not res!26171) (not e!28127))))

(assert (=> b!44352 (= res!26171 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1626 lt!19345)))))

(declare-fun b!44353 () Bool)

(assert (=> b!44353 (= e!28127 (arrayContainsKey!0 lt!19345 (_1!830 lt!19347) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!8389 (not res!26170)) b!44352))

(assert (= (and b!44352 res!26171) b!44353))

(assert (=> d!8389 m!38515))

(declare-fun m!38535 () Bool)

(assert (=> b!44353 m!38535))

(assert (=> b!44290 d!8389))

(assert (=> b!44263 d!8345))

(assert (=> d!8297 d!8289))

(declare-fun d!8391 () Bool)

(assert (=> d!8391 (= (arrayCountValidKeys!0 lt!19345 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(assert (=> d!8391 true))

(declare-fun _$88!55 () Unit!1237)

(assert (=> d!8391 (= (choose!59 lt!19345 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) _$88!55)))

(declare-fun bs!2019 () Bool)

(assert (= bs!2019 d!8391))

(assert (=> bs!2019 m!38333))

(assert (=> d!8297 d!8391))

(declare-fun b!44354 () Bool)

(declare-fun e!28130 () Bool)

(assert (=> b!44354 (= e!28130 (contains!576 (ite c!5777 (Cons!1209 (select (arr!1423 lt!19345) #b00000000000000000000000000000000) Nil!1210) Nil!1210) (select (arr!1423 lt!19345) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!44355 () Bool)

(declare-fun e!28128 () Bool)

(declare-fun e!28129 () Bool)

(assert (=> b!44355 (= e!28128 e!28129)))

(declare-fun c!5810 () Bool)

(assert (=> b!44355 (= c!5810 (validKeyInArray!0 (select (arr!1423 lt!19345) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!44356 () Bool)

(declare-fun e!28131 () Bool)

(assert (=> b!44356 (= e!28131 e!28128)))

(declare-fun res!26172 () Bool)

(assert (=> b!44356 (=> (not res!26172) (not e!28128))))

(assert (=> b!44356 (= res!26172 (not e!28130))))

(declare-fun res!26174 () Bool)

(assert (=> b!44356 (=> (not res!26174) (not e!28130))))

(assert (=> b!44356 (= res!26174 (validKeyInArray!0 (select (arr!1423 lt!19345) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun call!3585 () Bool)

(declare-fun bm!3582 () Bool)

(assert (=> bm!3582 (= call!3585 (arrayNoDuplicates!0 lt!19345 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5810 (Cons!1209 (select (arr!1423 lt!19345) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5777 (Cons!1209 (select (arr!1423 lt!19345) #b00000000000000000000000000000000) Nil!1210) Nil!1210)) (ite c!5777 (Cons!1209 (select (arr!1423 lt!19345) #b00000000000000000000000000000000) Nil!1210) Nil!1210))))))

(declare-fun b!44357 () Bool)

(assert (=> b!44357 (= e!28129 call!3585)))

(declare-fun d!8393 () Bool)

(declare-fun res!26173 () Bool)

(assert (=> d!8393 (=> res!26173 e!28131)))

(assert (=> d!8393 (= res!26173 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1626 lt!19345)))))

(assert (=> d!8393 (= (arrayNoDuplicates!0 lt!19345 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5777 (Cons!1209 (select (arr!1423 lt!19345) #b00000000000000000000000000000000) Nil!1210) Nil!1210)) e!28131)))

(declare-fun b!44358 () Bool)

(assert (=> b!44358 (= e!28129 call!3585)))

(assert (= (and d!8393 (not res!26173)) b!44356))

(assert (= (and b!44356 res!26174) b!44354))

(assert (= (and b!44356 res!26172) b!44355))

(assert (= (and b!44355 c!5810) b!44358))

(assert (= (and b!44355 (not c!5810)) b!44357))

(assert (= (or b!44358 b!44357) bm!3582))

(assert (=> b!44354 m!38515))

(assert (=> b!44354 m!38515))

(declare-fun m!38537 () Bool)

(assert (=> b!44354 m!38537))

(assert (=> b!44355 m!38515))

(assert (=> b!44355 m!38515))

(assert (=> b!44355 m!38517))

(assert (=> b!44356 m!38515))

(assert (=> b!44356 m!38515))

(assert (=> b!44356 m!38517))

(assert (=> bm!3582 m!38515))

(declare-fun m!38539 () Bool)

(assert (=> bm!3582 m!38539))

(assert (=> bm!3575 d!8393))

(declare-fun d!8395 () Bool)

(declare-fun lt!19442 () (_ BitVec 32))

(assert (=> d!8395 (and (bvsge lt!19442 #b00000000000000000000000000000000) (bvsle lt!19442 (bvsub (size!1626 (_keys!3465 lt!19337)) #b00000000000000000000000000000000)))))

(declare-fun e!28133 () (_ BitVec 32))

(assert (=> d!8395 (= lt!19442 e!28133)))

(declare-fun c!5811 () Bool)

(assert (=> d!8395 (= c!5811 (bvsge #b00000000000000000000000000000000 (size!1626 (_keys!3465 lt!19337))))))

(assert (=> d!8395 (and (bvsle #b00000000000000000000000000000000 (size!1626 (_keys!3465 lt!19337))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1626 (_keys!3465 lt!19337)) (size!1626 (_keys!3465 lt!19337))))))

(assert (=> d!8395 (= (arrayCountValidKeys!0 (_keys!3465 lt!19337) #b00000000000000000000000000000000 (size!1626 (_keys!3465 lt!19337))) lt!19442)))

(declare-fun b!44359 () Bool)

(declare-fun e!28132 () (_ BitVec 32))

(declare-fun call!3586 () (_ BitVec 32))

(assert (=> b!44359 (= e!28132 (bvadd #b00000000000000000000000000000001 call!3586))))

(declare-fun b!44360 () Bool)

(assert (=> b!44360 (= e!28132 call!3586)))

(declare-fun b!44361 () Bool)

(assert (=> b!44361 (= e!28133 #b00000000000000000000000000000000)))

(declare-fun bm!3583 () Bool)

(assert (=> bm!3583 (= call!3586 (arrayCountValidKeys!0 (_keys!3465 lt!19337) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1626 (_keys!3465 lt!19337))))))

(declare-fun b!44362 () Bool)

(assert (=> b!44362 (= e!28133 e!28132)))

(declare-fun c!5812 () Bool)

(assert (=> b!44362 (= c!5812 (validKeyInArray!0 (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000)))))

(assert (= (and d!8395 c!5811) b!44361))

(assert (= (and d!8395 (not c!5811)) b!44362))

(assert (= (and b!44362 c!5812) b!44359))

(assert (= (and b!44362 (not c!5812)) b!44360))

(assert (= (or b!44359 b!44360) bm!3583))

(declare-fun m!38541 () Bool)

(assert (=> bm!3583 m!38541))

(assert (=> b!44362 m!38519))

(assert (=> b!44362 m!38519))

(assert (=> b!44362 m!38529))

(assert (=> b!44117 d!8395))

(declare-fun d!8397 () Bool)

(assert (=> d!8397 (arrayContainsKey!0 lt!19345 lt!19384 #b00000000000000000000000000000000)))

(declare-fun lt!19445 () Unit!1237)

(declare-fun choose!13 (array!2959 (_ BitVec 64) (_ BitVec 32)) Unit!1237)

(assert (=> d!8397 (= lt!19445 (choose!13 lt!19345 lt!19384 #b00000000000000000000000000000000))))

(assert (=> d!8397 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!8397 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19345 lt!19384 #b00000000000000000000000000000000) lt!19445)))

(declare-fun bs!2020 () Bool)

(assert (= bs!2020 d!8397))

(assert (=> bs!2020 m!38413))

(declare-fun m!38543 () Bool)

(assert (=> bs!2020 m!38543))

(assert (=> b!44198 d!8397))

(declare-fun d!8399 () Bool)

(declare-fun res!26175 () Bool)

(declare-fun e!28134 () Bool)

(assert (=> d!8399 (=> res!26175 e!28134)))

(assert (=> d!8399 (= res!26175 (= (select (arr!1423 lt!19345) #b00000000000000000000000000000000) lt!19384))))

(assert (=> d!8399 (= (arrayContainsKey!0 lt!19345 lt!19384 #b00000000000000000000000000000000) e!28134)))

(declare-fun b!44363 () Bool)

(declare-fun e!28135 () Bool)

(assert (=> b!44363 (= e!28134 e!28135)))

(declare-fun res!26176 () Bool)

(assert (=> b!44363 (=> (not res!26176) (not e!28135))))

(assert (=> b!44363 (= res!26176 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1626 lt!19345)))))

(declare-fun b!44364 () Bool)

(assert (=> b!44364 (= e!28135 (arrayContainsKey!0 lt!19345 lt!19384 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8399 (not res!26175)) b!44363))

(assert (= (and b!44363 res!26176) b!44364))

(assert (=> d!8399 m!38391))

(declare-fun m!38545 () Bool)

(assert (=> b!44364 m!38545))

(assert (=> b!44198 d!8399))

(declare-fun b!44419 () Bool)

(declare-fun e!28168 () SeekEntryResult!204)

(assert (=> b!44419 (= e!28168 Undefined!204)))

(declare-fun d!8401 () Bool)

(declare-fun lt!19497 () SeekEntryResult!204)

(assert (=> d!8401 (and (or (is-Undefined!204 lt!19497) (not (is-Found!204 lt!19497)) (and (bvsge (index!2939 lt!19497) #b00000000000000000000000000000000) (bvslt (index!2939 lt!19497) (size!1626 lt!19345)))) (or (is-Undefined!204 lt!19497) (is-Found!204 lt!19497) (not (is-MissingZero!204 lt!19497)) (and (bvsge (index!2938 lt!19497) #b00000000000000000000000000000000) (bvslt (index!2938 lt!19497) (size!1626 lt!19345)))) (or (is-Undefined!204 lt!19497) (is-Found!204 lt!19497) (is-MissingZero!204 lt!19497) (not (is-MissingVacant!204 lt!19497)) (and (bvsge (index!2941 lt!19497) #b00000000000000000000000000000000) (bvslt (index!2941 lt!19497) (size!1626 lt!19345)))) (or (is-Undefined!204 lt!19497) (ite (is-Found!204 lt!19497) (= (select (arr!1423 lt!19345) (index!2939 lt!19497)) (select (arr!1423 lt!19345) #b00000000000000000000000000000000)) (ite (is-MissingZero!204 lt!19497) (= (select (arr!1423 lt!19345) (index!2938 lt!19497)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!204 lt!19497) (= (select (arr!1423 lt!19345) (index!2941 lt!19497)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!8401 (= lt!19497 e!28168)))

(declare-fun c!5833 () Bool)

(declare-fun lt!19498 () SeekEntryResult!204)

(assert (=> d!8401 (= c!5833 (and (is-Intermediate!204 lt!19498) (undefined!1016 lt!19498)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2959 (_ BitVec 32)) SeekEntryResult!204)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!8401 (= lt!19498 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1423 lt!19345) #b00000000000000000000000000000000) mask!853) (select (arr!1423 lt!19345) #b00000000000000000000000000000000) lt!19345 mask!853))))

(assert (=> d!8401 (validMask!0 mask!853)))

(assert (=> d!8401 (= (seekEntryOrOpen!0 (select (arr!1423 lt!19345) #b00000000000000000000000000000000) lt!19345 mask!853) lt!19497)))

(declare-fun b!44420 () Bool)

(declare-fun c!5832 () Bool)

(declare-fun lt!19496 () (_ BitVec 64))

(assert (=> b!44420 (= c!5832 (= lt!19496 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!28169 () SeekEntryResult!204)

(declare-fun e!28170 () SeekEntryResult!204)

(assert (=> b!44420 (= e!28169 e!28170)))

(declare-fun b!44421 () Bool)

(assert (=> b!44421 (= e!28169 (Found!204 (index!2940 lt!19498)))))

(declare-fun b!44422 () Bool)

(assert (=> b!44422 (= e!28170 (MissingZero!204 (index!2940 lt!19498)))))

(declare-fun b!44423 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2959 (_ BitVec 32)) SeekEntryResult!204)

(assert (=> b!44423 (= e!28170 (seekKeyOrZeroReturnVacant!0 (x!8358 lt!19498) (index!2940 lt!19498) (index!2940 lt!19498) (select (arr!1423 lt!19345) #b00000000000000000000000000000000) lt!19345 mask!853))))

(declare-fun b!44424 () Bool)

(assert (=> b!44424 (= e!28168 e!28169)))

(assert (=> b!44424 (= lt!19496 (select (arr!1423 lt!19345) (index!2940 lt!19498)))))

(declare-fun c!5831 () Bool)

(assert (=> b!44424 (= c!5831 (= lt!19496 (select (arr!1423 lt!19345) #b00000000000000000000000000000000)))))

(assert (= (and d!8401 c!5833) b!44419))

(assert (= (and d!8401 (not c!5833)) b!44424))

(assert (= (and b!44424 c!5831) b!44421))

(assert (= (and b!44424 (not c!5831)) b!44420))

(assert (= (and b!44420 c!5832) b!44422))

(assert (= (and b!44420 (not c!5832)) b!44423))

(declare-fun m!38547 () Bool)

(assert (=> d!8401 m!38547))

(assert (=> d!8401 m!38323))

(declare-fun m!38549 () Bool)

(assert (=> d!8401 m!38549))

(declare-fun m!38551 () Bool)

(assert (=> d!8401 m!38551))

(declare-fun m!38553 () Bool)

(assert (=> d!8401 m!38553))

(assert (=> d!8401 m!38391))

(declare-fun m!38555 () Bool)

(assert (=> d!8401 m!38555))

(assert (=> d!8401 m!38391))

(assert (=> d!8401 m!38553))

(assert (=> b!44423 m!38391))

(declare-fun m!38557 () Bool)

(assert (=> b!44423 m!38557))

(declare-fun m!38559 () Bool)

(assert (=> b!44424 m!38559))

(assert (=> b!44198 d!8401))

(declare-fun b!44670 () Bool)

(declare-fun e!28324 () Unit!1237)

(declare-fun Unit!1243 () Unit!1237)

(assert (=> b!44670 (= e!28324 Unit!1243)))

(declare-fun bm!3649 () Bool)

(declare-fun call!3656 () ListLongMap!1215)

(declare-fun call!3657 () ListLongMap!1215)

(assert (=> bm!3649 (= call!3656 call!3657)))

(declare-fun b!44671 () Bool)

(declare-fun e!28316 () Bool)

(declare-fun e!28315 () Bool)

(assert (=> b!44671 (= e!28316 e!28315)))

(declare-fun c!5909 () Bool)

(assert (=> b!44671 (= c!5909 (not (= (bvand (extraKeys!1789 lt!19337) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!3650 () Bool)

(declare-fun call!3653 () ListLongMap!1215)

(declare-fun getCurrentListMapNoExtraKeys!41 (array!2959 array!2961 (_ BitVec 32) (_ BitVec 32) V!2329 V!2329 (_ BitVec 32) Int) ListLongMap!1215)

(assert (=> bm!3650 (= call!3653 (getCurrentListMapNoExtraKeys!41 (_keys!3465 lt!19337) (_values!1881 lt!19337) (mask!5475 lt!19337) (extraKeys!1789 lt!19337) (zeroValue!1816 lt!19337) (minValue!1816 lt!19337) #b00000000000000000000000000000000 (defaultEntry!1898 lt!19337)))))

(declare-fun b!44672 () Bool)

(declare-fun e!28319 () Bool)

(declare-fun lt!19675 () ListLongMap!1215)

(declare-fun apply!63 (ListLongMap!1215 (_ BitVec 64)) V!2329)

(assert (=> b!44672 (= e!28319 (= (apply!63 lt!19675 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1816 lt!19337)))))

(declare-fun b!44673 () Bool)

(declare-fun res!26310 () Bool)

(assert (=> b!44673 (=> (not res!26310) (not e!28316))))

(declare-fun e!28325 () Bool)

(assert (=> b!44673 (= res!26310 e!28325)))

(declare-fun res!26308 () Bool)

(assert (=> b!44673 (=> res!26308 e!28325)))

(declare-fun e!28326 () Bool)

(assert (=> b!44673 (= res!26308 (not e!28326))))

(declare-fun res!26303 () Bool)

(assert (=> b!44673 (=> (not res!26303) (not e!28326))))

(assert (=> b!44673 (= res!26303 (bvslt #b00000000000000000000000000000000 (size!1626 (_keys!3465 lt!19337))))))

(declare-fun bm!3651 () Bool)

(declare-fun call!3654 () ListLongMap!1215)

(declare-fun call!3655 () ListLongMap!1215)

(assert (=> bm!3651 (= call!3654 call!3655)))

(declare-fun b!44674 () Bool)

(declare-fun res!26305 () Bool)

(assert (=> b!44674 (=> (not res!26305) (not e!28316))))

(declare-fun e!28321 () Bool)

(assert (=> b!44674 (= res!26305 e!28321)))

(declare-fun c!5908 () Bool)

(assert (=> b!44674 (= c!5908 (not (= (bvand (extraKeys!1789 lt!19337) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!44675 () Bool)

(declare-fun e!28314 () Bool)

(declare-fun get!801 (ValueCell!706 V!2329) V!2329)

(assert (=> b!44675 (= e!28314 (= (apply!63 lt!19675 (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000)) (get!801 (select (arr!1424 (_values!1881 lt!19337)) #b00000000000000000000000000000000) (dynLambda!267 (defaultEntry!1898 lt!19337) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!44675 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1627 (_values!1881 lt!19337))))))

(assert (=> b!44675 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1626 (_keys!3465 lt!19337))))))

(declare-fun b!44676 () Bool)

(declare-fun e!28322 () ListLongMap!1215)

(declare-fun e!28317 () ListLongMap!1215)

(assert (=> b!44676 (= e!28322 e!28317)))

(declare-fun c!5905 () Bool)

(assert (=> b!44676 (= c!5905 (and (not (= (bvand (extraKeys!1789 lt!19337) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1789 lt!19337) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!3652 () Bool)

(assert (=> bm!3652 (= call!3655 call!3653)))

(declare-fun b!44677 () Bool)

(declare-fun e!28323 () Bool)

(assert (=> b!44677 (= e!28323 (validKeyInArray!0 (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000)))))

(declare-fun d!8403 () Bool)

(assert (=> d!8403 e!28316))

(declare-fun res!26304 () Bool)

(assert (=> d!8403 (=> (not res!26304) (not e!28316))))

(assert (=> d!8403 (= res!26304 (or (bvsge #b00000000000000000000000000000000 (size!1626 (_keys!3465 lt!19337))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1626 (_keys!3465 lt!19337))))))))

(declare-fun lt!19673 () ListLongMap!1215)

(assert (=> d!8403 (= lt!19675 lt!19673)))

(declare-fun lt!19686 () Unit!1237)

(assert (=> d!8403 (= lt!19686 e!28324)))

(declare-fun c!5910 () Bool)

(assert (=> d!8403 (= c!5910 e!28323)))

(declare-fun res!26306 () Bool)

(assert (=> d!8403 (=> (not res!26306) (not e!28323))))

(assert (=> d!8403 (= res!26306 (bvslt #b00000000000000000000000000000000 (size!1626 (_keys!3465 lt!19337))))))

(assert (=> d!8403 (= lt!19673 e!28322)))

(declare-fun c!5906 () Bool)

(assert (=> d!8403 (= c!5906 (and (not (= (bvand (extraKeys!1789 lt!19337) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1789 lt!19337) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!8403 (validMask!0 (mask!5475 lt!19337))))

(assert (=> d!8403 (= (getCurrentListMap!356 (_keys!3465 lt!19337) (_values!1881 lt!19337) (mask!5475 lt!19337) (extraKeys!1789 lt!19337) (zeroValue!1816 lt!19337) (minValue!1816 lt!19337) #b00000000000000000000000000000000 (defaultEntry!1898 lt!19337)) lt!19675)))

(declare-fun b!44669 () Bool)

(assert (=> b!44669 (= e!28326 (validKeyInArray!0 (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000)))))

(declare-fun b!44678 () Bool)

(declare-fun e!28320 () ListLongMap!1215)

(assert (=> b!44678 (= e!28320 call!3654)))

(declare-fun b!44679 () Bool)

(assert (=> b!44679 (= e!28317 call!3656)))

(declare-fun b!44680 () Bool)

(declare-fun +!72 (ListLongMap!1215 tuple2!1638) ListLongMap!1215)

(assert (=> b!44680 (= e!28322 (+!72 call!3657 (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1816 lt!19337))))))

(declare-fun b!44681 () Bool)

(assert (=> b!44681 (= e!28325 e!28314)))

(declare-fun res!26311 () Bool)

(assert (=> b!44681 (=> (not res!26311) (not e!28314))))

(declare-fun contains!579 (ListLongMap!1215 (_ BitVec 64)) Bool)

(assert (=> b!44681 (= res!26311 (contains!579 lt!19675 (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000)))))

(assert (=> b!44681 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1626 (_keys!3465 lt!19337))))))

(declare-fun b!44682 () Bool)

(declare-fun call!3658 () Bool)

(assert (=> b!44682 (= e!28315 (not call!3658))))

(declare-fun b!44683 () Bool)

(declare-fun lt!19693 () Unit!1237)

(assert (=> b!44683 (= e!28324 lt!19693)))

(declare-fun lt!19683 () ListLongMap!1215)

(assert (=> b!44683 (= lt!19683 (getCurrentListMapNoExtraKeys!41 (_keys!3465 lt!19337) (_values!1881 lt!19337) (mask!5475 lt!19337) (extraKeys!1789 lt!19337) (zeroValue!1816 lt!19337) (minValue!1816 lt!19337) #b00000000000000000000000000000000 (defaultEntry!1898 lt!19337)))))

(declare-fun lt!19684 () (_ BitVec 64))

(assert (=> b!44683 (= lt!19684 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19679 () (_ BitVec 64))

(assert (=> b!44683 (= lt!19679 (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000))))

(declare-fun lt!19691 () Unit!1237)

(declare-fun addStillContains!39 (ListLongMap!1215 (_ BitVec 64) V!2329 (_ BitVec 64)) Unit!1237)

(assert (=> b!44683 (= lt!19691 (addStillContains!39 lt!19683 lt!19684 (zeroValue!1816 lt!19337) lt!19679))))

(assert (=> b!44683 (contains!579 (+!72 lt!19683 (tuple2!1639 lt!19684 (zeroValue!1816 lt!19337))) lt!19679)))

(declare-fun lt!19685 () Unit!1237)

(assert (=> b!44683 (= lt!19685 lt!19691)))

(declare-fun lt!19689 () ListLongMap!1215)

(assert (=> b!44683 (= lt!19689 (getCurrentListMapNoExtraKeys!41 (_keys!3465 lt!19337) (_values!1881 lt!19337) (mask!5475 lt!19337) (extraKeys!1789 lt!19337) (zeroValue!1816 lt!19337) (minValue!1816 lt!19337) #b00000000000000000000000000000000 (defaultEntry!1898 lt!19337)))))

(declare-fun lt!19672 () (_ BitVec 64))

(assert (=> b!44683 (= lt!19672 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19687 () (_ BitVec 64))

(assert (=> b!44683 (= lt!19687 (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000))))

(declare-fun lt!19678 () Unit!1237)

(declare-fun addApplyDifferent!39 (ListLongMap!1215 (_ BitVec 64) V!2329 (_ BitVec 64)) Unit!1237)

(assert (=> b!44683 (= lt!19678 (addApplyDifferent!39 lt!19689 lt!19672 (minValue!1816 lt!19337) lt!19687))))

(assert (=> b!44683 (= (apply!63 (+!72 lt!19689 (tuple2!1639 lt!19672 (minValue!1816 lt!19337))) lt!19687) (apply!63 lt!19689 lt!19687))))

(declare-fun lt!19682 () Unit!1237)

(assert (=> b!44683 (= lt!19682 lt!19678)))

(declare-fun lt!19680 () ListLongMap!1215)

(assert (=> b!44683 (= lt!19680 (getCurrentListMapNoExtraKeys!41 (_keys!3465 lt!19337) (_values!1881 lt!19337) (mask!5475 lt!19337) (extraKeys!1789 lt!19337) (zeroValue!1816 lt!19337) (minValue!1816 lt!19337) #b00000000000000000000000000000000 (defaultEntry!1898 lt!19337)))))

(declare-fun lt!19676 () (_ BitVec 64))

(assert (=> b!44683 (= lt!19676 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19677 () (_ BitVec 64))

(assert (=> b!44683 (= lt!19677 (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000))))

(declare-fun lt!19681 () Unit!1237)

(assert (=> b!44683 (= lt!19681 (addApplyDifferent!39 lt!19680 lt!19676 (zeroValue!1816 lt!19337) lt!19677))))

(assert (=> b!44683 (= (apply!63 (+!72 lt!19680 (tuple2!1639 lt!19676 (zeroValue!1816 lt!19337))) lt!19677) (apply!63 lt!19680 lt!19677))))

(declare-fun lt!19674 () Unit!1237)

(assert (=> b!44683 (= lt!19674 lt!19681)))

(declare-fun lt!19688 () ListLongMap!1215)

(assert (=> b!44683 (= lt!19688 (getCurrentListMapNoExtraKeys!41 (_keys!3465 lt!19337) (_values!1881 lt!19337) (mask!5475 lt!19337) (extraKeys!1789 lt!19337) (zeroValue!1816 lt!19337) (minValue!1816 lt!19337) #b00000000000000000000000000000000 (defaultEntry!1898 lt!19337)))))

(declare-fun lt!19690 () (_ BitVec 64))

(assert (=> b!44683 (= lt!19690 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19692 () (_ BitVec 64))

(assert (=> b!44683 (= lt!19692 (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000))))

(assert (=> b!44683 (= lt!19693 (addApplyDifferent!39 lt!19688 lt!19690 (minValue!1816 lt!19337) lt!19692))))

(assert (=> b!44683 (= (apply!63 (+!72 lt!19688 (tuple2!1639 lt!19690 (minValue!1816 lt!19337))) lt!19692) (apply!63 lt!19688 lt!19692))))

(declare-fun bm!3653 () Bool)

(assert (=> bm!3653 (= call!3658 (contains!579 lt!19675 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!44684 () Bool)

(declare-fun c!5907 () Bool)

(assert (=> b!44684 (= c!5907 (and (not (= (bvand (extraKeys!1789 lt!19337) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1789 lt!19337) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!44684 (= e!28317 e!28320)))

(declare-fun b!44685 () Bool)

(declare-fun e!28318 () Bool)

(assert (=> b!44685 (= e!28318 (= (apply!63 lt!19675 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1816 lt!19337)))))

(declare-fun bm!3654 () Bool)

(assert (=> bm!3654 (= call!3657 (+!72 (ite c!5906 call!3653 (ite c!5905 call!3655 call!3654)) (ite (or c!5906 c!5905) (tuple2!1639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1816 lt!19337)) (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1816 lt!19337)))))))

(declare-fun b!44686 () Bool)

(assert (=> b!44686 (= e!28321 e!28319)))

(declare-fun res!26307 () Bool)

(declare-fun call!3652 () Bool)

(assert (=> b!44686 (= res!26307 call!3652)))

(assert (=> b!44686 (=> (not res!26307) (not e!28319))))

(declare-fun b!44687 () Bool)

(assert (=> b!44687 (= e!28315 e!28318)))

(declare-fun res!26309 () Bool)

(assert (=> b!44687 (= res!26309 call!3658)))

(assert (=> b!44687 (=> (not res!26309) (not e!28318))))

(declare-fun b!44688 () Bool)

(assert (=> b!44688 (= e!28321 (not call!3652))))

(declare-fun bm!3655 () Bool)

(assert (=> bm!3655 (= call!3652 (contains!579 lt!19675 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!44689 () Bool)

(assert (=> b!44689 (= e!28320 call!3656)))

(assert (= (and d!8403 c!5906) b!44680))

(assert (= (and d!8403 (not c!5906)) b!44676))

(assert (= (and b!44676 c!5905) b!44679))

(assert (= (and b!44676 (not c!5905)) b!44684))

(assert (= (and b!44684 c!5907) b!44689))

(assert (= (and b!44684 (not c!5907)) b!44678))

(assert (= (or b!44689 b!44678) bm!3651))

(assert (= (or b!44679 bm!3651) bm!3652))

(assert (= (or b!44679 b!44689) bm!3649))

(assert (= (or b!44680 bm!3652) bm!3650))

(assert (= (or b!44680 bm!3649) bm!3654))

(assert (= (and d!8403 res!26306) b!44677))

(assert (= (and d!8403 c!5910) b!44683))

(assert (= (and d!8403 (not c!5910)) b!44670))

(assert (= (and d!8403 res!26304) b!44673))

(assert (= (and b!44673 res!26303) b!44669))

(assert (= (and b!44673 (not res!26308)) b!44681))

(assert (= (and b!44681 res!26311) b!44675))

(assert (= (and b!44673 res!26310) b!44674))

(assert (= (and b!44674 c!5908) b!44686))

(assert (= (and b!44674 (not c!5908)) b!44688))

(assert (= (and b!44686 res!26307) b!44672))

(assert (= (or b!44686 b!44688) bm!3655))

(assert (= (and b!44674 res!26305) b!44671))

(assert (= (and b!44671 c!5909) b!44687))

(assert (= (and b!44671 (not c!5909)) b!44682))

(assert (= (and b!44687 res!26309) b!44685))

(assert (= (or b!44687 b!44682) bm!3653))

(declare-fun b_lambda!2325 () Bool)

(assert (=> (not b_lambda!2325) (not b!44675)))

(declare-fun tb!1011 () Bool)

(declare-fun t!4238 () Bool)

(assert (=> (and start!6740 (= defaultEntry!470 (defaultEntry!1898 lt!19337)) t!4238) tb!1011))

(declare-fun result!1763 () Bool)

(assert (=> tb!1011 (= result!1763 tp_is_empty!1907)))

(assert (=> b!44675 t!4238))

(declare-fun b_and!2715 () Bool)

(assert (= b_and!2709 (and (=> t!4238 result!1763) b_and!2715)))

(declare-fun m!38773 () Bool)

(assert (=> b!44680 m!38773))

(declare-fun m!38775 () Bool)

(assert (=> b!44672 m!38775))

(assert (=> b!44681 m!38519))

(assert (=> b!44681 m!38519))

(declare-fun m!38777 () Bool)

(assert (=> b!44681 m!38777))

(declare-fun m!38779 () Bool)

(assert (=> b!44685 m!38779))

(declare-fun m!38781 () Bool)

(assert (=> b!44683 m!38781))

(declare-fun m!38783 () Bool)

(assert (=> b!44683 m!38783))

(declare-fun m!38785 () Bool)

(assert (=> b!44683 m!38785))

(declare-fun m!38787 () Bool)

(assert (=> b!44683 m!38787))

(assert (=> b!44683 m!38519))

(declare-fun m!38789 () Bool)

(assert (=> b!44683 m!38789))

(declare-fun m!38791 () Bool)

(assert (=> b!44683 m!38791))

(declare-fun m!38793 () Bool)

(assert (=> b!44683 m!38793))

(declare-fun m!38795 () Bool)

(assert (=> b!44683 m!38795))

(declare-fun m!38797 () Bool)

(assert (=> b!44683 m!38797))

(declare-fun m!38799 () Bool)

(assert (=> b!44683 m!38799))

(declare-fun m!38801 () Bool)

(assert (=> b!44683 m!38801))

(declare-fun m!38803 () Bool)

(assert (=> b!44683 m!38803))

(assert (=> b!44683 m!38787))

(declare-fun m!38805 () Bool)

(assert (=> b!44683 m!38805))

(assert (=> b!44683 m!38789))

(declare-fun m!38807 () Bool)

(assert (=> b!44683 m!38807))

(assert (=> b!44683 m!38795))

(declare-fun m!38809 () Bool)

(assert (=> b!44683 m!38809))

(declare-fun m!38811 () Bool)

(assert (=> b!44683 m!38811))

(assert (=> b!44683 m!38781))

(declare-fun m!38813 () Bool)

(assert (=> bm!3654 m!38813))

(declare-fun m!38815 () Bool)

(assert (=> b!44675 m!38815))

(declare-fun m!38817 () Bool)

(assert (=> b!44675 m!38817))

(declare-fun m!38819 () Bool)

(assert (=> b!44675 m!38819))

(assert (=> b!44675 m!38519))

(assert (=> b!44675 m!38815))

(assert (=> b!44675 m!38519))

(declare-fun m!38821 () Bool)

(assert (=> b!44675 m!38821))

(assert (=> b!44675 m!38817))

(assert (=> b!44677 m!38519))

(assert (=> b!44677 m!38519))

(assert (=> b!44677 m!38529))

(declare-fun m!38823 () Bool)

(assert (=> bm!3653 m!38823))

(declare-fun m!38825 () Bool)

(assert (=> bm!3655 m!38825))

(assert (=> b!44669 m!38519))

(assert (=> b!44669 m!38519))

(assert (=> b!44669 m!38529))

(declare-fun m!38827 () Bool)

(assert (=> d!8403 m!38827))

(assert (=> bm!3650 m!38811))

(assert (=> d!8279 d!8403))

(declare-fun d!8459 () Bool)

(declare-fun res!26313 () Bool)

(declare-fun e!28329 () Bool)

(assert (=> d!8459 (=> res!26313 e!28329)))

(assert (=> d!8459 (= res!26313 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1626 lt!19345)))))

(assert (=> d!8459 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!19345 mask!853) e!28329)))

(declare-fun b!44690 () Bool)

(declare-fun e!28328 () Bool)

(declare-fun call!3659 () Bool)

(assert (=> b!44690 (= e!28328 call!3659)))

(declare-fun b!44691 () Bool)

(declare-fun e!28327 () Bool)

(assert (=> b!44691 (= e!28327 e!28328)))

(declare-fun lt!19695 () (_ BitVec 64))

(assert (=> b!44691 (= lt!19695 (select (arr!1423 lt!19345) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!19694 () Unit!1237)

(assert (=> b!44691 (= lt!19694 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19345 lt!19695 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!44691 (arrayContainsKey!0 lt!19345 lt!19695 #b00000000000000000000000000000000)))

(declare-fun lt!19696 () Unit!1237)

(assert (=> b!44691 (= lt!19696 lt!19694)))

(declare-fun res!26312 () Bool)

(assert (=> b!44691 (= res!26312 (= (seekEntryOrOpen!0 (select (arr!1423 lt!19345) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19345 mask!853) (Found!204 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!44691 (=> (not res!26312) (not e!28328))))

(declare-fun bm!3656 () Bool)

(assert (=> bm!3656 (= call!3659 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!19345 mask!853))))

(declare-fun b!44692 () Bool)

(assert (=> b!44692 (= e!28329 e!28327)))

(declare-fun c!5911 () Bool)

(assert (=> b!44692 (= c!5911 (validKeyInArray!0 (select (arr!1423 lt!19345) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!44693 () Bool)

(assert (=> b!44693 (= e!28327 call!3659)))

(assert (= (and d!8459 (not res!26313)) b!44692))

(assert (= (and b!44692 c!5911) b!44691))

(assert (= (and b!44692 (not c!5911)) b!44693))

(assert (= (and b!44691 res!26312) b!44690))

(assert (= (or b!44690 b!44693) bm!3656))

(assert (=> b!44691 m!38515))

(declare-fun m!38829 () Bool)

(assert (=> b!44691 m!38829))

(declare-fun m!38831 () Bool)

(assert (=> b!44691 m!38831))

(assert (=> b!44691 m!38515))

(declare-fun m!38833 () Bool)

(assert (=> b!44691 m!38833))

(declare-fun m!38835 () Bool)

(assert (=> bm!3656 m!38835))

(assert (=> b!44692 m!38515))

(assert (=> b!44692 m!38515))

(assert (=> b!44692 m!38517))

(assert (=> bm!3566 d!8459))

(declare-fun d!8461 () Bool)

(declare-fun lt!19699 () Bool)

(declare-fun content!44 (List!1213) (Set (_ BitVec 64)))

(assert (=> d!8461 (= lt!19699 (member (select (arr!1423 lt!19345) #b00000000000000000000000000000000) (content!44 Nil!1210)))))

(declare-fun e!28335 () Bool)

(assert (=> d!8461 (= lt!19699 e!28335)))

(declare-fun res!26319 () Bool)

(assert (=> d!8461 (=> (not res!26319) (not e!28335))))

(assert (=> d!8461 (= res!26319 (is-Cons!1209 Nil!1210))))

(assert (=> d!8461 (= (contains!576 Nil!1210 (select (arr!1423 lt!19345) #b00000000000000000000000000000000)) lt!19699)))

(declare-fun b!44698 () Bool)

(declare-fun e!28334 () Bool)

(assert (=> b!44698 (= e!28335 e!28334)))

(declare-fun res!26318 () Bool)

(assert (=> b!44698 (=> res!26318 e!28334)))

(assert (=> b!44698 (= res!26318 (= (h!1786 Nil!1210) (select (arr!1423 lt!19345) #b00000000000000000000000000000000)))))

(declare-fun b!44699 () Bool)

(assert (=> b!44699 (= e!28334 (contains!576 (t!4232 Nil!1210) (select (arr!1423 lt!19345) #b00000000000000000000000000000000)))))

(assert (= (and d!8461 res!26319) b!44698))

(assert (= (and b!44698 (not res!26318)) b!44699))

(declare-fun m!38837 () Bool)

(assert (=> d!8461 m!38837))

(assert (=> d!8461 m!38391))

(declare-fun m!38839 () Bool)

(assert (=> d!8461 m!38839))

(assert (=> b!44699 m!38391))

(declare-fun m!38841 () Bool)

(assert (=> b!44699 m!38841))

(assert (=> b!44244 d!8461))

(declare-fun b!44709 () Bool)

(declare-fun res!26329 () Bool)

(declare-fun e!28338 () Bool)

(assert (=> b!44709 (=> (not res!26329) (not e!28338))))

(declare-fun size!1642 (LongMapFixedSize!392) (_ BitVec 32))

(assert (=> b!44709 (= res!26329 (bvsge (size!1642 lt!19337) (_size!245 lt!19337)))))

(declare-fun b!44711 () Bool)

(assert (=> b!44711 (= e!28338 (and (bvsge (extraKeys!1789 lt!19337) #b00000000000000000000000000000000) (bvsle (extraKeys!1789 lt!19337) #b00000000000000000000000000000011) (bvsge (_vacant!245 lt!19337) #b00000000000000000000000000000000)))))

(declare-fun b!44710 () Bool)

(declare-fun res!26330 () Bool)

(assert (=> b!44710 (=> (not res!26330) (not e!28338))))

(assert (=> b!44710 (= res!26330 (= (size!1642 lt!19337) (bvadd (_size!245 lt!19337) (bvsdiv (bvadd (extraKeys!1789 lt!19337) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!8463 () Bool)

(declare-fun res!26328 () Bool)

(assert (=> d!8463 (=> (not res!26328) (not e!28338))))

(assert (=> d!8463 (= res!26328 (validMask!0 (mask!5475 lt!19337)))))

(assert (=> d!8463 (= (simpleValid!31 lt!19337) e!28338)))

(declare-fun b!44708 () Bool)

(declare-fun res!26331 () Bool)

(assert (=> b!44708 (=> (not res!26331) (not e!28338))))

(assert (=> b!44708 (= res!26331 (and (= (size!1627 (_values!1881 lt!19337)) (bvadd (mask!5475 lt!19337) #b00000000000000000000000000000001)) (= (size!1626 (_keys!3465 lt!19337)) (size!1627 (_values!1881 lt!19337))) (bvsge (_size!245 lt!19337) #b00000000000000000000000000000000) (bvsle (_size!245 lt!19337) (bvadd (mask!5475 lt!19337) #b00000000000000000000000000000001))))))

(assert (= (and d!8463 res!26328) b!44708))

(assert (= (and b!44708 res!26331) b!44709))

(assert (= (and b!44709 res!26329) b!44710))

(assert (= (and b!44710 res!26330) b!44711))

(declare-fun m!38843 () Bool)

(assert (=> b!44709 m!38843))

(assert (=> b!44710 m!38843))

(assert (=> d!8463 m!38827))

(assert (=> d!8283 d!8463))

(declare-fun d!8465 () Bool)

(declare-fun lt!19700 () (_ BitVec 32))

(assert (=> d!8465 (and (or (bvslt lt!19700 #b00000000000000000000000000000000) (bvsge lt!19700 (size!1626 lt!19345)) (and (bvsge lt!19700 #b00000000000000000000000000000000) (bvslt lt!19700 (size!1626 lt!19345)))) (bvsge lt!19700 #b00000000000000000000000000000000) (bvslt lt!19700 (size!1626 lt!19345)) (= (select (arr!1423 lt!19345) lt!19700) (_1!830 lt!19347)))))

(declare-fun e!28339 () (_ BitVec 32))

(assert (=> d!8465 (= lt!19700 e!28339)))

(declare-fun c!5912 () Bool)

(assert (=> d!8465 (= c!5912 (= (select (arr!1423 lt!19345) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_1!830 lt!19347)))))

(assert (=> d!8465 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1626 lt!19345)) (bvslt (size!1626 lt!19345) #b01111111111111111111111111111111))))

(assert (=> d!8465 (= (arrayScanForKey!0 lt!19345 (_1!830 lt!19347) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19700)))

(declare-fun b!44712 () Bool)

(assert (=> b!44712 (= e!28339 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(declare-fun b!44713 () Bool)

(assert (=> b!44713 (= e!28339 (arrayScanForKey!0 lt!19345 (_1!830 lt!19347) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!8465 c!5912) b!44712))

(assert (= (and d!8465 (not c!5912)) b!44713))

(declare-fun m!38845 () Bool)

(assert (=> d!8465 m!38845))

(assert (=> d!8465 m!38515))

(declare-fun m!38847 () Bool)

(assert (=> b!44713 m!38847))

(assert (=> b!44280 d!8465))

(assert (=> b!44245 d!8381))

(assert (=> b!44246 d!8381))

(push 1)

(assert (not b!44675))

(assert (not b!44423))

(assert (not b!44362))

(assert (not b!44345))

(assert (not d!8375))

(assert (not bm!3581))

(assert (not b!44341))

(assert (not bm!3579))

(assert (not b!44355))

(assert (not b!44691))

(assert (not b!44336))

(assert (not b_next!1517))

(assert (not b!44713))

(assert (not b!44356))

(assert (not b!44677))

(assert (not b!44347))

(assert (not bm!3656))

(assert (not b_lambda!2317))

(assert (not b!44353))

(assert (not bm!3655))

(assert (not b!44692))

(assert (not d!8463))

(assert (not b!44699))

(assert (not b_lambda!2325))

(assert (not b!44344))

(assert (not bm!3580))

(assert (not b!44710))

(assert (not bm!3583))

(assert (not d!8397))

(assert (not d!8403))

(assert (not d!8461))

(assert (not bm!3582))

(assert (not b!44348))

(assert b_and!2715)

(assert (not b!44354))

(assert (not b!44680))

(assert (not b!44685))

(assert (not d!8379))

(assert (not b!44683))

(assert (not b!44672))

(assert (not bm!3653))

(assert (not b!44349))

(assert tp_is_empty!1907)

(assert (not bm!3654))

(assert (not b!44709))

(assert (not d!8391))

(assert (not d!8401))

(assert (not b!44364))

(assert (not bm!3650))

(assert (not b!44681))

(assert (not b!44669))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2715)

(assert (not b_next!1517))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!8653 () Bool)

(declare-fun res!26468 () Bool)

(declare-fun e!28538 () Bool)

(assert (=> d!8653 (=> res!26468 e!28538)))

(assert (=> d!8653 (= res!26468 (= (select (arr!1423 lt!19345) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19384))))

(assert (=> d!8653 (= (arrayContainsKey!0 lt!19345 lt!19384 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!28538)))

(declare-fun b!45034 () Bool)

(declare-fun e!28539 () Bool)

(assert (=> b!45034 (= e!28538 e!28539)))

(declare-fun res!26469 () Bool)

(assert (=> b!45034 (=> (not res!26469) (not e!28539))))

(assert (=> b!45034 (= res!26469 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1626 lt!19345)))))

(declare-fun b!45035 () Bool)

(assert (=> b!45035 (= e!28539 (arrayContainsKey!0 lt!19345 lt!19384 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!8653 (not res!26468)) b!45034))

(assert (= (and b!45034 res!26469) b!45035))

(assert (=> d!8653 m!38515))

(declare-fun m!39359 () Bool)

(assert (=> b!45035 m!39359))

(assert (=> b!44364 d!8653))

(declare-fun d!8655 () Bool)

(declare-fun e!28556 () Bool)

(assert (=> d!8655 e!28556))

(declare-fun res!26478 () Bool)

(assert (=> d!8655 (=> res!26478 e!28556)))

(declare-fun lt!19948 () Bool)

(assert (=> d!8655 (= res!26478 (not lt!19948))))

(declare-fun lt!19949 () Bool)

(assert (=> d!8655 (= lt!19948 lt!19949)))

(declare-fun lt!19946 () Unit!1237)

(declare-fun e!28555 () Unit!1237)

(assert (=> d!8655 (= lt!19946 e!28555)))

(declare-fun c!6012 () Bool)

(assert (=> d!8655 (= c!6012 lt!19949)))

(declare-fun containsKey!77 (List!1212 (_ BitVec 64)) Bool)

(assert (=> d!8655 (= lt!19949 (containsKey!77 (toList!623 lt!19675) (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000)))))

(assert (=> d!8655 (= (contains!579 lt!19675 (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000)) lt!19948)))

(declare-fun b!45060 () Bool)

(declare-fun lt!19947 () Unit!1237)

(assert (=> b!45060 (= e!28555 lt!19947)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!65 (List!1212 (_ BitVec 64)) Unit!1237)

(assert (=> b!45060 (= lt!19947 (lemmaContainsKeyImpliesGetValueByKeyDefined!65 (toList!623 lt!19675) (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000)))))

(declare-datatypes ((Option!115 0))(
  ( (Some!114 (v!2094 V!2329)) (None!113) )
))
(declare-fun isDefined!66 (Option!115) Bool)

(declare-fun getValueByKey!109 (List!1212 (_ BitVec 64)) Option!115)

(assert (=> b!45060 (isDefined!66 (getValueByKey!109 (toList!623 lt!19675) (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000)))))

(declare-fun b!45061 () Bool)

(declare-fun Unit!1249 () Unit!1237)

(assert (=> b!45061 (= e!28555 Unit!1249)))

(declare-fun b!45062 () Bool)

(assert (=> b!45062 (= e!28556 (isDefined!66 (getValueByKey!109 (toList!623 lt!19675) (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000))))))

(assert (= (and d!8655 c!6012) b!45060))

(assert (= (and d!8655 (not c!6012)) b!45061))

(assert (= (and d!8655 (not res!26478)) b!45062))

(assert (=> d!8655 m!38519))

(declare-fun m!39399 () Bool)

(assert (=> d!8655 m!39399))

(assert (=> b!45060 m!38519))

(declare-fun m!39401 () Bool)

(assert (=> b!45060 m!39401))

(assert (=> b!45060 m!38519))

(declare-fun m!39403 () Bool)

(assert (=> b!45060 m!39403))

(assert (=> b!45060 m!39403))

(declare-fun m!39405 () Bool)

(assert (=> b!45060 m!39405))

(assert (=> b!45062 m!38519))

(assert (=> b!45062 m!39403))

(assert (=> b!45062 m!39403))

(assert (=> b!45062 m!39405))

(assert (=> b!44681 d!8655))

(declare-fun d!8675 () Bool)

(assert (=> d!8675 (= (validKeyInArray!0 (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!44349 d!8675))

(declare-fun e!28559 () Bool)

(declare-fun b!45063 () Bool)

(assert (=> b!45063 (= e!28559 (contains!576 (ite c!5810 (Cons!1209 (select (arr!1423 lt!19345) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5777 (Cons!1209 (select (arr!1423 lt!19345) #b00000000000000000000000000000000) Nil!1210) Nil!1210)) (ite c!5777 (Cons!1209 (select (arr!1423 lt!19345) #b00000000000000000000000000000000) Nil!1210) Nil!1210)) (select (arr!1423 lt!19345) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!45064 () Bool)

(declare-fun e!28557 () Bool)

(declare-fun e!28558 () Bool)

(assert (=> b!45064 (= e!28557 e!28558)))

(declare-fun c!6013 () Bool)

(assert (=> b!45064 (= c!6013 (validKeyInArray!0 (select (arr!1423 lt!19345) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!45065 () Bool)

(declare-fun e!28560 () Bool)

(assert (=> b!45065 (= e!28560 e!28557)))

(declare-fun res!26479 () Bool)

(assert (=> b!45065 (=> (not res!26479) (not e!28557))))

(assert (=> b!45065 (= res!26479 (not e!28559))))

(declare-fun res!26481 () Bool)

(assert (=> b!45065 (=> (not res!26481) (not e!28559))))

(assert (=> b!45065 (= res!26481 (validKeyInArray!0 (select (arr!1423 lt!19345) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun bm!3674 () Bool)

(declare-fun call!3677 () Bool)

(assert (=> bm!3674 (= call!3677 (arrayNoDuplicates!0 lt!19345 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!6013 (Cons!1209 (select (arr!1423 lt!19345) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!5810 (Cons!1209 (select (arr!1423 lt!19345) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5777 (Cons!1209 (select (arr!1423 lt!19345) #b00000000000000000000000000000000) Nil!1210) Nil!1210)) (ite c!5777 (Cons!1209 (select (arr!1423 lt!19345) #b00000000000000000000000000000000) Nil!1210) Nil!1210))) (ite c!5810 (Cons!1209 (select (arr!1423 lt!19345) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5777 (Cons!1209 (select (arr!1423 lt!19345) #b00000000000000000000000000000000) Nil!1210) Nil!1210)) (ite c!5777 (Cons!1209 (select (arr!1423 lt!19345) #b00000000000000000000000000000000) Nil!1210) Nil!1210)))))))

(declare-fun b!45066 () Bool)

(assert (=> b!45066 (= e!28558 call!3677)))

(declare-fun d!8677 () Bool)

(declare-fun res!26480 () Bool)

(assert (=> d!8677 (=> res!26480 e!28560)))

(assert (=> d!8677 (= res!26480 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1626 lt!19345)))))

(assert (=> d!8677 (= (arrayNoDuplicates!0 lt!19345 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5810 (Cons!1209 (select (arr!1423 lt!19345) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5777 (Cons!1209 (select (arr!1423 lt!19345) #b00000000000000000000000000000000) Nil!1210) Nil!1210)) (ite c!5777 (Cons!1209 (select (arr!1423 lt!19345) #b00000000000000000000000000000000) Nil!1210) Nil!1210))) e!28560)))

(declare-fun b!45067 () Bool)

(assert (=> b!45067 (= e!28558 call!3677)))

(assert (= (and d!8677 (not res!26480)) b!45065))

(assert (= (and b!45065 res!26481) b!45063))

(assert (= (and b!45065 res!26479) b!45064))

(assert (= (and b!45064 c!6013) b!45067))

(assert (= (and b!45064 (not c!6013)) b!45066))

(assert (= (or b!45067 b!45066) bm!3674))

(declare-fun m!39407 () Bool)

(assert (=> b!45063 m!39407))

(assert (=> b!45063 m!39407))

(declare-fun m!39409 () Bool)

(assert (=> b!45063 m!39409))

(assert (=> b!45064 m!39407))

(assert (=> b!45064 m!39407))

(declare-fun m!39411 () Bool)

(assert (=> b!45064 m!39411))

(assert (=> b!45065 m!39407))

(assert (=> b!45065 m!39407))

(assert (=> b!45065 m!39411))

(assert (=> bm!3674 m!39407))

(declare-fun m!39413 () Bool)

(assert (=> bm!3674 m!39413))

(assert (=> bm!3582 d!8677))

(assert (=> d!8379 d!8313))

(declare-fun b!45103 () Bool)

(declare-fun e!28578 () SeekEntryResult!204)

(assert (=> b!45103 (= e!28578 (MissingVacant!204 (index!2940 lt!19498)))))

(declare-fun b!45104 () Bool)

(declare-fun e!28579 () SeekEntryResult!204)

(assert (=> b!45104 (= e!28579 (Found!204 (index!2940 lt!19498)))))

(declare-fun b!45105 () Bool)

(declare-fun e!28580 () SeekEntryResult!204)

(assert (=> b!45105 (= e!28580 e!28579)))

(declare-fun c!6033 () Bool)

(declare-fun lt!19962 () (_ BitVec 64))

(assert (=> b!45105 (= c!6033 (= lt!19962 (select (arr!1423 lt!19345) #b00000000000000000000000000000000)))))

(declare-fun b!45106 () Bool)

(assert (=> b!45106 (= e!28580 Undefined!204)))

(declare-fun b!45107 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!45107 (= e!28578 (seekKeyOrZeroReturnVacant!0 (bvadd (x!8358 lt!19498) #b00000000000000000000000000000001) (nextIndex!0 (index!2940 lt!19498) (x!8358 lt!19498) mask!853) (index!2940 lt!19498) (select (arr!1423 lt!19345) #b00000000000000000000000000000000) lt!19345 mask!853))))

(declare-fun b!45102 () Bool)

(declare-fun c!6031 () Bool)

(assert (=> b!45102 (= c!6031 (= lt!19962 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!45102 (= e!28579 e!28578)))

(declare-fun d!8679 () Bool)

(declare-fun lt!19961 () SeekEntryResult!204)

(assert (=> d!8679 (and (or (is-Undefined!204 lt!19961) (not (is-Found!204 lt!19961)) (and (bvsge (index!2939 lt!19961) #b00000000000000000000000000000000) (bvslt (index!2939 lt!19961) (size!1626 lt!19345)))) (or (is-Undefined!204 lt!19961) (is-Found!204 lt!19961) (not (is-MissingVacant!204 lt!19961)) (not (= (index!2941 lt!19961) (index!2940 lt!19498))) (and (bvsge (index!2941 lt!19961) #b00000000000000000000000000000000) (bvslt (index!2941 lt!19961) (size!1626 lt!19345)))) (or (is-Undefined!204 lt!19961) (ite (is-Found!204 lt!19961) (= (select (arr!1423 lt!19345) (index!2939 lt!19961)) (select (arr!1423 lt!19345) #b00000000000000000000000000000000)) (and (is-MissingVacant!204 lt!19961) (= (index!2941 lt!19961) (index!2940 lt!19498)) (= (select (arr!1423 lt!19345) (index!2941 lt!19961)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!8679 (= lt!19961 e!28580)))

(declare-fun c!6032 () Bool)

(assert (=> d!8679 (= c!6032 (bvsge (x!8358 lt!19498) #b01111111111111111111111111111110))))

(assert (=> d!8679 (= lt!19962 (select (arr!1423 lt!19345) (index!2940 lt!19498)))))

(assert (=> d!8679 (validMask!0 mask!853)))

(assert (=> d!8679 (= (seekKeyOrZeroReturnVacant!0 (x!8358 lt!19498) (index!2940 lt!19498) (index!2940 lt!19498) (select (arr!1423 lt!19345) #b00000000000000000000000000000000) lt!19345 mask!853) lt!19961)))

(assert (= (and d!8679 c!6032) b!45106))

(assert (= (and d!8679 (not c!6032)) b!45105))

(assert (= (and b!45105 c!6033) b!45104))

(assert (= (and b!45105 (not c!6033)) b!45102))

(assert (= (and b!45102 c!6031) b!45103))

(assert (= (and b!45102 (not c!6031)) b!45107))

(declare-fun m!39427 () Bool)

(assert (=> b!45107 m!39427))

(assert (=> b!45107 m!39427))

(assert (=> b!45107 m!38391))

(declare-fun m!39429 () Bool)

(assert (=> b!45107 m!39429))

(declare-fun m!39431 () Bool)

(assert (=> d!8679 m!39431))

(declare-fun m!39433 () Bool)

(assert (=> d!8679 m!39433))

(assert (=> d!8679 m!38559))

(assert (=> d!8679 m!38323))

(assert (=> b!44423 d!8679))

(declare-fun b!45108 () Bool)

(declare-fun e!28583 () Bool)

(assert (=> b!45108 (= e!28583 (contains!576 (ite c!5809 (Cons!1209 (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000) Nil!1210) Nil!1210) (select (arr!1423 (_keys!3465 lt!19337)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!45109 () Bool)

(declare-fun e!28581 () Bool)

(declare-fun e!28582 () Bool)

(assert (=> b!45109 (= e!28581 e!28582)))

(declare-fun c!6034 () Bool)

(assert (=> b!45109 (= c!6034 (validKeyInArray!0 (select (arr!1423 (_keys!3465 lt!19337)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!45110 () Bool)

(declare-fun e!28584 () Bool)

(assert (=> b!45110 (= e!28584 e!28581)))

(declare-fun res!26482 () Bool)

(assert (=> b!45110 (=> (not res!26482) (not e!28581))))

(assert (=> b!45110 (= res!26482 (not e!28583))))

(declare-fun res!26484 () Bool)

(assert (=> b!45110 (=> (not res!26484) (not e!28583))))

(assert (=> b!45110 (= res!26484 (validKeyInArray!0 (select (arr!1423 (_keys!3465 lt!19337)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun call!3679 () Bool)

(declare-fun bm!3676 () Bool)

(assert (=> bm!3676 (= call!3679 (arrayNoDuplicates!0 (_keys!3465 lt!19337) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!6034 (Cons!1209 (select (arr!1423 (_keys!3465 lt!19337)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5809 (Cons!1209 (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000) Nil!1210) Nil!1210)) (ite c!5809 (Cons!1209 (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000) Nil!1210) Nil!1210))))))

(declare-fun b!45111 () Bool)

(assert (=> b!45111 (= e!28582 call!3679)))

(declare-fun d!8685 () Bool)

(declare-fun res!26483 () Bool)

(assert (=> d!8685 (=> res!26483 e!28584)))

(assert (=> d!8685 (= res!26483 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1626 (_keys!3465 lt!19337))))))

(assert (=> d!8685 (= (arrayNoDuplicates!0 (_keys!3465 lt!19337) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5809 (Cons!1209 (select (arr!1423 (_keys!3465 lt!19337)) #b00000000000000000000000000000000) Nil!1210) Nil!1210)) e!28584)))

(declare-fun b!45112 () Bool)

(assert (=> b!45112 (= e!28582 call!3679)))

(assert (= (and d!8685 (not res!26483)) b!45110))

(assert (= (and b!45110 res!26484) b!45108))

(assert (= (and b!45110 res!26482) b!45109))

(assert (= (and b!45109 c!6034) b!45112))

(assert (= (and b!45109 (not c!6034)) b!45111))

(assert (= (or b!45112 b!45111) bm!3676))

(declare-fun m!39435 () Bool)

(assert (=> b!45108 m!39435))

(assert (=> b!45108 m!39435))

(declare-fun m!39437 () Bool)

(assert (=> b!45108 m!39437))

(assert (=> b!45109 m!39435))

(assert (=> b!45109 m!39435))

(declare-fun m!39439 () Bool)

(assert (=> b!45109 m!39439))

(assert (=> b!45110 m!39435))

(assert (=> b!45110 m!39435))

(assert (=> b!45110 m!39439))

(assert (=> bm!3676 m!39435))

(declare-fun m!39441 () Bool)

(assert (=> bm!3676 m!39441))

(assert (=> bm!3581 d!8685))

(declare-fun d!8687 () Bool)

(declare-fun e!28587 () Bool)

(assert (=> d!8687 e!28587))

(declare-fun res!26490 () Bool)

(assert (=> d!8687 (=> (not res!26490) (not e!28587))))

(declare-fun lt!19974 () ListLongMap!1215)

(assert (=> d!8687 (= res!26490 (contains!579 lt!19974 (_1!830 (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1816 lt!19337)))))))

(declare-fun lt!19972 () List!1212)

(assert (=> d!8687 (= lt!19974 (ListLongMap!1216 lt!19972))))

(declare-fun lt!19971 () Unit!1237)

(declare-fun lt!19973 () Unit!1237)

(assert (=> d!8687 (= lt!19971 lt!19973)))

(assert (=> d!8687 (= (getValueByKey!109 lt!19972 (_1!830 (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1816 lt!19337)))) (Some!114 (_2!830 (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1816 lt!19337)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!33 (List!1212 (_ BitVec 64) V!2329) Unit!1237)

(assert (=> d!8687 (= lt!19973 (lemmaContainsTupThenGetReturnValue!33 lt!19972 (_1!830 (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1816 lt!19337))) (_2!830 (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1816 lt!19337)))))))

(declare-fun insertStrictlySorted!30 (List!1212 (_ BitVec 64) V!2329) List!1212)

(assert (=> d!8687 (= lt!19972 (insertStrictlySorted!30 (toList!623 call!3657) (_1!830 (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1816 lt!19337))) (_2!830 (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1816 lt!19337)))))))

(assert (=> d!8687 (= (+!72 call!3657 (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1816 lt!19337))) lt!19974)))

(declare-fun b!45117 () Bool)

(declare-fun res!26489 () Bool)

(assert (=> b!45117 (=> (not res!26489) (not e!28587))))

(assert (=> b!45117 (= res!26489 (= (getValueByKey!109 (toList!623 lt!19974) (_1!830 (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1816 lt!19337)))) (Some!114 (_2!830 (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1816 lt!19337))))))))

(declare-fun b!45118 () Bool)

(declare-fun contains!582 (List!1212 tuple2!1638) Bool)

(assert (=> b!45118 (= e!28587 (contains!582 (toList!623 lt!19974) (tuple2!1639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1816 lt!19337))))))

(assert (= (and d!8687 res!26490) b!45117))

(assert (= (and b!45117 res!26489) b!45118))

(declare-fun m!39443 () Bool)

(assert (=> d!8687 m!39443))

(declare-fun m!39445 () Bool)

(assert (=> d!8687 m!39445))

(declare-fun m!39447 () Bool)

(assert (=> d!8687 m!39447))

(declare-fun m!39449 () Bool)

(assert (=> d!8687 m!39449))

(declare-fun m!39451 () Bool)

(assert (=> b!45117 m!39451))

(declare-fun m!39453 () Bool)

(assert (=> b!45118 m!39453))

(assert (=> b!44680 d!8687))

(assert (=> d!8397 d!8399))

(declare-fun d!8689 () Bool)

(assert (=> d!8689 (arrayContainsKey!0 lt!19345 lt!19384 #b00000000000000000000000000000000)))

(assert (=> d!8689 true))

(declare-fun _$60!356 () Unit!1237)

(assert (=> d!8689 (= (choose!13 lt!19345 lt!19384 #b00000000000000000000000000000000) _$60!356)))

(declare-fun bs!2054 () Bool)

(assert (= bs!2054 d!8689))

(assert (=> bs!2054 m!38413))

(assert (=> d!8397 d!8689))

(declare-fun d!8691 () Bool)

(declare-fun lt!19975 () (_ BitVec 32))

(assert (=> d!8691 (and (bvsge lt!19975 #b00000000000000000000000000000000) (bvsle lt!19975 (bvsub (size!1626 (_keys!3465 lt!19337)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!28589 () (_ BitVec 32))

(assert (=> d!8691 (= lt!19975 e!28589)))

(declare-fun c!6035 () Bool)

(assert (=> d!8691 (= c!6035 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1626 (_keys!3465 lt!19337))))))

(assert (=> d!8691 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1626 (_keys!3465 lt!19337))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1626 (_keys!3465 lt!19337)) (size!1626 (_keys!3465 lt!19337))))))

(assert (=> d!8691 (= (arrayCountValidKeys!0 (_keys!3465 lt!19337) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1626 (_keys!3465 lt!19337))) lt!19975)))

(declare-fun b!45119 () Bool)

(declare-fun e!28588 () (_ BitVec 32))

(declare-fun call!3680 () (_ BitVec 32))

(assert (=> b!45119 (= e!28588 (bvadd #b00000000000000000000000000000001 call!3680))))

(declare-fun b!45120 () Bool)

(assert (=> b!45120 (= e!28588 call!3680)))

(declare-fun b!45121 () Bool)

(assert (=> b!45121 (= e!28589 #b00000000000000000000000000000000)))

(declare-fun bm!3677 () Bool)

(assert (=> bm!3677 (= call!3680 (arrayCountValidKeys!0 (_keys!3465 lt!19337) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1626 (_keys!3465 lt!19337))))))

(declare-fun b!45122 () Bool)

(assert (=> b!45122 (= e!28589 e!28588)))

(declare-fun c!6036 () Bool)

(assert (=> b!45122 (= c!6036 (validKeyInArray!0 (select (arr!1423 (_keys!3465 lt!19337)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!8691 c!6035) b!45121))

(assert (= (and d!8691 (not c!6035)) b!45122))

(assert (= (and b!45122 c!6036) b!45119))

(assert (= (and b!45122 (not c!6036)) b!45120))

(assert (= (or b!45119 b!45120) bm!3677))

(declare-fun m!39455 () Bool)

(assert (=> bm!3677 m!39455))

(assert (=> b!45122 m!39435))

(assert (=> b!45122 m!39435))

(assert (=> b!45122 m!39439))

(assert (=> bm!3583 d!8691))

(declare-fun d!8693 () Bool)

(declare-fun lt!19976 () Bool)

(assert (=> d!8693 (= lt!19976 (member (select (arr!1423 lt!19345) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (content!44 (ite c!5777 (Cons!1209 (select (arr!1423 lt!19345) #b00000000000000000000000000000000) Nil!1210) Nil!1210))))))

(declare-fun e!28591 () Bool)

(assert (=> d!8693 (= lt!19976 e!28591)))

(declare-fun res!26492 () Bool)

(assert (=> d!8693 (=> (not res!26492) (not e!28591))))

(assert (=> d!8693 (= res!26492 (is-Cons!1209 (ite c!5777 (Cons!1209 (select (arr!1423 lt!19345) #b00000000000000000000000000000000) Nil!1210) Nil!1210)))))

(assert (=> d!8693 (= (contains!576 (ite c!5777 (Cons!1209 (select (arr!1423 lt!19345) #b00000000000000000000000000000000) Nil!1210) Nil!1210) (select (arr!1423 lt!19345) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!19976)))

(declare-fun b!45123 () Bool)

(declare-fun e!28590 () Bool)

(assert (=> b!45123 (= e!28591 e!28590)))

(declare-fun res!26491 () Bool)

(assert (=> b!45123 (=> res!26491 e!28590)))

(assert (=> b!45123 (= res!26491 (= (h!1786 (ite c!5777 (Cons!1209 (select (arr!1423 lt!19345) #b00000000000000000000000000000000) Nil!1210) Nil!1210)) (select (arr!1423 lt!19345) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!45124 () Bool)

(assert (=> b!45124 (= e!28590 (contains!576 (t!4232 (ite c!5777 (Cons!1209 (select (arr!1423 lt!19345) #b00000000000000000000000000000000) Nil!1210) Nil!1210)) (select (arr!1423 lt!19345) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!8693 res!26492) b!45123))

(assert (= (and b!45123 (not res!26491)) b!45124))

(declare-fun m!39457 () Bool)

(assert (=> d!8693 m!39457))

(assert (=> d!8693 m!38515))

(declare-fun m!39459 () Bool)

(assert (=> d!8693 m!39459))

(assert (=> b!45124 m!38515))

(declare-fun m!39461 () Bool)

(assert (=> b!45124 m!39461))

(assert (=> b!44354 d!8693))

(declare-fun d!8695 () Bool)

(declare-fun e!28593 () Bool)

(assert (=> d!8695 e!28593))

(declare-fun res!26493 () Bool)

(assert (=> d!8695 (=> res!26493 e!28593)))

(declare-fun lt!19979 () Bool)

(assert (=> d!8695 (= res!26493 (not lt!19979))))

(declare-fun lt!19980 () Bool)

(assert (=> d!8695 (= lt!19979 lt!19980)))

(declare-fun lt!19977 () Unit!1237)

(declare-fun e!28592 () Unit!1237)

(assert (=> d!8695 (= lt!19977 e!28592)))

(declare-fun c!6037 () Bool)

(assert (=> d!8695 (= c!6037 lt!19980)))

(assert (=> d!8695 (= lt!19980 (containsKey!77 (toList!623 lt!19675) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8695 (= (contains!579 lt!19675 #b1000000000000000000000000000000000000000000000000000000000000000) lt!19979)))

(declare-fun b!45125 () Bool)

(declare-fun lt!19978 () Unit!1237)

(assert (=> b!45125 (= e!28592 lt!19978)))

(assert (=> b!45125 (= lt!19978 (lemmaContainsKeyImpliesGetValueByKeyDefined!65 (toList!623 lt!19675) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!45125 (isDefined!66 (getValueByKey!109 (toList!623 lt!19675) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!45126 () Bool)

(declare-fun Unit!1252 () Unit!1237)

(assert (=> b!45126 (= e!28592 Unit!1252)))

(declare-fun b!45127 () Bool)

(assert (=> b!45127 (= e!28593 (isDefined!66 (getValueByKey!109 (toList!623 lt!19675) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!8695 c!6037) b!45125))

(assert (= (and d!8695 (not c!6037)) b!45126))

(assert (= (and d!8695 (not res!26493)) b!45127))

(declare-fun m!39463 () Bool)

(assert (=> d!8695 m!39463))

(declare-fun m!39465 () Bool)

(assert (=> b!45125 m!39465))

(declare-fun m!39467 () Bool)

(assert (=> b!45125 m!39467))

(assert (=> b!45125 m!39467))

(declare-fun m!39469 () Bool)

(assert (=> b!45125 m!39469))

(assert (=> b!45127 m!39467))

(assert (=> b!45127 m!39467))

(assert (=> b!45127 m!39469))

(assert (=> bm!3653 d!8695))

(assert (=> d!8391 d!8289))

(declare-fun d!8697 () Bool)

(declare-fun e!28595 () Bool)

(assert (=> d!8697 e!28595))

(declare-fun res!26494 () Bool)

(assert (=> d!8697 (=> res!26494 e!28595)))

(declare-fun lt!19983 () Bool)

(assert (=> d!8697 (= res!26494 (not lt!19983))))

(declare-fun lt!19984 () Bool)

(assert (=> d!8697 (= lt!19983 lt!19984)))

(declare-fun lt!19981 () Unit!1237)

(declare-fun e!28594 () Unit!1237)

(assert (=> d!8697 (= lt!19981 e!28594)))

(declare-fun c!6038 () Bool)

(assert (=> d!8697 (= c!6038 lt!19984)))

(assert (=> d!8697 (= lt!19984 (containsKey!77 (toList!623 (+!72 lt!19683 (tuple2!1639 lt!19684 (zeroValue!1816 lt!19337)))) lt!19679))))

(assert (=> d!8697 (= (contains!579 (+!72 lt!19683 (tuple2!1639 lt!19684 (zeroValue!1816 lt!19337))) lt!19679) lt!19983)))

(declare-fun b!45128 () Bool)

(declare-fun lt!19982 () Unit!1237)

(assert (=> b!45128 (= e!28594 lt!19982)))

(assert (=> b!45128 (= lt!19982 (lemmaContainsKeyImpliesGetValueByKeyDefined!65 (toList!623 (+!72 lt!19683 (tuple2!1639 lt!19684 (zeroValue!1816 lt!19337)))) lt!19679))))

(assert (=> b!45128 (isDefined!66 (getValueByKey!109 (toList!623 (+!72 lt!19683 (tuple2!1639 lt!19684 (zeroValue!1816 lt!19337)))) lt!19679))))

(declare-fun b!45129 () Bool)

(declare-fun Unit!1254 () Unit!1237)

(assert (=> b!45129 (= e!28594 Unit!1254)))

(declare-fun b!45130 () Bool)

(assert (=> b!45130 (= e!28595 (isDefined!66 (getValueByKey!109 (toList!623 (+!72 lt!19683 (tuple2!1639 lt!19684 (zeroValue!1816 lt!19337)))) lt!19679)))))

(assert (= (and d!8697 c!6038) b!45128))

(assert (= (and d!8697 (not c!6038)) b!45129))

(assert (= (and d!8697 (not res!26494)) b!45130))

(declare-fun m!39471 () Bool)

(assert (=> d!8697 m!39471))

(declare-fun m!39473 () Bool)

(assert (=> b!45128 m!39473))

(declare-fun m!39475 () Bool)

(assert (=> b!45128 m!39475))

(assert (=> b!45128 m!39475))

(declare-fun m!39477 () Bool)

(assert (=> b!45128 m!39477))

(assert (=> b!45130 m!39475))

(assert (=> b!45130 m!39475))

(assert (=> b!45130 m!39477))

(assert (=> b!44683 d!8697))

(declare-fun d!8699 () Bool)

(declare-fun get!808 (Option!115) V!2329)

(assert (=> d!8699 (= (apply!63 lt!19688 lt!19692) (get!808 (getValueByKey!109 (toList!623 lt!19688) lt!19692)))))

(declare-fun bs!2055 () Bool)

(assert (= bs!2055 d!8699))

(declare-fun m!39479 () Bool)

(assert (=> bs!2055 m!39479))

(assert (=> bs!2055 m!39479))

(declare-fun m!39481 () Bool)

(assert (=> bs!2055 m!39481))

(assert (=> b!44683 d!8699))

(declare-fun d!8701 () Bool)

(assert (=> d!8701 (= (apply!63 (+!72 lt!19689 (tuple2!1639 lt!19672 (minValue!1816 lt!19337))) lt!19687) (get!808 (getValueByKey!109 (toList!623 (+!72 lt!19689 (tuple2!1639 lt!19672 (minValue!1816 lt!19337)))) lt!19687)))))

(declare-fun bs!2056 () Bool)

(assert (= bs!2056 d!8701))

(declare-fun m!39483 () Bool)

(assert (=> bs!2056 m!39483))

(assert (=> bs!2056 m!39483))

(declare-fun m!39485 () Bool)

(assert (=> bs!2056 m!39485))

(assert (=> b!44683 d!8701))

(declare-fun d!8703 () Bool)

(assert (=> d!8703 (= (apply!63 (+!72 lt!19689 (tuple2!1639 lt!19672 (minValue!1816 lt!19337))) lt!19687) (apply!63 lt!19689 lt!19687))))

(declare-fun lt!19987 () Unit!1237)

(declare-fun choose!269 (ListLongMap!1215 (_ BitVec 64) V!2329 (_ BitVec 64)) Unit!1237)

(assert (=> d!8703 (= lt!19987 (choose!269 lt!19689 lt!19672 (minValue!1816 lt!19337) lt!19687))))

(declare-fun e!28598 () Bool)

(assert (=> d!8703 e!28598))

(declare-fun res!26497 () Bool)

(assert (=> d!8703 (=> (not res!26497) (not e!28598))))

(assert (=> d!8703 (= res!26497 (contains!579 lt!19689 lt!19687))))

(assert (=> d!8703 (= (addApplyDifferent!39 lt!19689 lt!19672 (minValue!1816 lt!19337) lt!19687) lt!19987)))

(declare-fun b!45134 () Bool)

(assert (=> b!45134 (= e!28598 (not (= lt!19687 lt!19672)))))

(assert (= (and d!8703 res!26497) b!45134))

(declare-fun m!39487 () Bool)

(assert (=> d!8703 m!39487))

(assert (=> d!8703 m!38789))

(assert (=> d!8703 m!38807))

(assert (=> d!8703 m!38789))

(declare-fun m!39489 () Bool)

(assert (=> d!8703 m!39489))

(assert (=> d!8703 m!38791))

(assert (=> b!44683 d!8703))

(declare-fun d!8705 () Bool)

(declare-fun e!28599 () Bool)

(assert (=> d!8705 e!28599))

(declare-fun res!26499 () Bool)

(assert (=> d!8705 (=> (not res!26499) (not e!28599))))

(declare-fun lt!19991 () ListLongMap!1215)

(assert (=> d!8705 (= res!26499 (contains!579 lt!19991 (_1!830 (tuple2!1639 lt!19676 (zeroValue!1816 lt!19337)))))))

(declare-fun lt!19989 () List!1212)

(assert (=> d!8705 (= lt!19991 (ListLongMap!1216 lt!19989))))

(declare-fun lt!19988 () Unit!1237)

(declare-fun lt!19990 () Unit!1237)

(assert (=> d!8705 (= lt!19988 lt!19990)))

(assert (=> d!8705 (= (getValueByKey!109 lt!19989 (_1!830 (tuple2!1639 lt!19676 (zeroValue!1816 lt!19337)))) (Some!114 (_2!830 (tuple2!1639 lt!19676 (zeroValue!1816 lt!19337)))))))

(assert (=> d!8705 (= lt!19990 (lemmaContainsTupThenGetReturnValue!33 lt!19989 (_1!830 (tuple2!1639 lt!19676 (zeroValue!1816 lt!19337))) (_2!830 (tuple2!1639 lt!19676 (zeroValue!1816 lt!19337)))))))

(assert (=> d!8705 (= lt!19989 (insertStrictlySorted!30 (toList!623 lt!19680) (_1!830 (tuple2!1639 lt!19676 (zeroValue!1816 lt!19337))) (_2!830 (tuple2!1639 lt!19676 (zeroValue!1816 lt!19337)))))))

(assert (=> d!8705 (= (+!72 lt!19680 (tuple2!1639 lt!19676 (zeroValue!1816 lt!19337))) lt!19991)))

(declare-fun b!45135 () Bool)

(declare-fun res!26498 () Bool)

(assert (=> b!45135 (=> (not res!26498) (not e!28599))))

(assert (=> b!45135 (= res!26498 (= (getValueByKey!109 (toList!623 lt!19991) (_1!830 (tuple2!1639 lt!19676 (zeroValue!1816 lt!19337)))) (Some!114 (_2!830 (tuple2!1639 lt!19676 (zeroValue!1816 lt!19337))))))))

(declare-fun b!45136 () Bool)

(assert (=> b!45136 (= e!28599 (contains!582 (toList!623 lt!19991) (tuple2!1639 lt!19676 (zeroValue!1816 lt!19337))))))

(assert (= (and d!8705 res!26499) b!45135))

(assert (= (and b!45135 res!26498) b!45136))

(declare-fun m!39491 () Bool)

(assert (=> d!8705 m!39491))

(declare-fun m!39493 () Bool)

(assert (=> d!8705 m!39493))

(declare-fun m!39495 () Bool)

(assert (=> d!8705 m!39495))

(declare-fun m!39497 () Bool)

(assert (=> d!8705 m!39497))

(declare-fun m!39499 () Bool)

(assert (=> b!45135 m!39499))

(declare-fun m!39501 () Bool)

(assert (=> b!45136 m!39501))

(assert (=> b!44683 d!8705))

(declare-fun d!8707 () Bool)

(assert (=> d!8707 (contains!579 (+!72 lt!19683 (tuple2!1639 lt!19684 (zeroValue!1816 lt!19337))) lt!19679)))

(declare-fun lt!19994 () Unit!1237)

(declare-fun choose!270 (ListLongMap!1215 (_ BitVec 64) V!2329 (_ BitVec 64)) Unit!1237)

(assert (=> d!8707 (= lt!19994 (choose!270 lt!19683 lt!19684 (zeroValue!1816 lt!19337) lt!19679))))

(assert (=> d!8707 (contains!579 lt!19683 lt!19679)))

(assert (=> d!8707 (= (addStillContains!39 lt!19683 lt!19684 (zeroValue!1816 lt!19337) lt!19679) lt!19994)))

(declare-fun bs!2057 () Bool)

(assert (= bs!2057 d!8707))

(assert (=> bs!2057 m!38781))

(assert (=> bs!2057 m!38781))

(assert (=> bs!2057 m!38783))

(declare-fun m!39503 () Bool)

(assert (=> bs!2057 m!39503))

(declare-fun m!39505 () Bool)

(assert (=> bs!2057 m!39505))

(assert (=> b!44683 d!8707))

(declare-fun d!8709 () Bool)

(assert (=> d!8709 (= (apply!63 (+!72 lt!19680 (tuple2!1639 lt!19676 (zeroValue!1816 lt!19337))) lt!19677) (get!808 (getValueByKey!109 (toList!623 (+!72 lt!19680 (tuple2!1639 lt!19676 (zeroValue!1816 lt!19337)))) lt!19677)))))

(declare-fun bs!2058 () Bool)

(assert (= bs!2058 d!8709))

(declare-fun m!39507 () Bool)

(assert (=> bs!2058 m!39507))

(assert (=> bs!2058 m!39507))

(declare-fun m!39509 () Bool)

(assert (=> bs!2058 m!39509))

(assert (=> b!44683 d!8709))

(declare-fun d!8711 () Bool)

(assert (=> d!8711 (= (apply!63 (+!72 lt!19680 (tuple2!1639 lt!19676 (zeroValue!1816 lt!19337))) lt!19677) (apply!63 lt!19680 lt!19677))))

(declare-fun lt!19995 () Unit!1237)

(assert (=> d!8711 (= lt!19995 (choose!269 lt!19680 lt!19676 (zeroValue!1816 lt!19337) lt!19677))))

(declare-fun e!28600 () Bool)

(assert (=> d!8711 e!28600))

(declare-fun res!26500 () Bool)

(assert (=> d!8711 (=> (not res!26500) (not e!28600))))

(assert (=> d!8711 (= res!26500 (contains!579 lt!19680 lt!19677))))

(assert (=> d!8711 (= (addApplyDifferent!39 lt!19680 lt!19676 (zeroValue!1816 lt!19337) lt!19677) lt!19995)))

(declare-fun b!45138 () Bool)

(assert (=> b!45138 (= e!28600 (not (= lt!19677 lt!19676)))))

(assert (= (and d!8711 res!26500) b!45138))

(declare-fun m!39511 () Bool)

(assert (=> d!8711 m!39511))

(assert (=> d!8711 m!38795))

(assert (=> d!8711 m!38797))

(assert (=> d!8711 m!38795))

(declare-fun m!39513 () Bool)

(assert (=> d!8711 m!39513))

(assert (=> d!8711 m!38785))

(assert (=> b!44683 d!8711))

(declare-fun d!8713 () Bool)

(assert (=> d!8713 (= (apply!63 lt!19689 lt!19687) (get!808 (getValueByKey!109 (toList!623 lt!19689) lt!19687)))))

(declare-fun bs!2059 () Bool)

(assert (= bs!2059 d!8713))

(declare-fun m!39515 () Bool)

(assert (=> bs!2059 m!39515))

(assert (=> bs!2059 m!39515))

(declare-fun m!39517 () Bool)

(assert (=> bs!2059 m!39517))

(assert (=> b!44683 d!8713))

(declare-fun d!8715 () Bool)

(declare-fun e!28601 () Bool)

(assert (=> d!8715 e!28601))

(declare-fun res!26502 () Bool)

(assert (=> d!8715 (=> (not res!26502) (not e!28601))))

(declare-fun lt!19999 () ListLongMap!1215)

(assert (=> d!8715 (= res!26502 (contains!579 lt!19999 (_1!830 (tuple2!1639 lt!19690 (minValue!1816 lt!19337)))))))

(declare-fun lt!19997 () List!1212)

(assert (=> d!8715 (= lt!19999 (ListLongMap!1216 lt!19997))))

(declare-fun lt!19996 () Unit!1237)

(declare-fun lt!19998 () Unit!1237)

(assert (=> d!8715 (= lt!19996 lt!19998)))

(assert (=> d!8715 (= (getValueByKey!109 lt!19997 (_1!830 (tuple2!1639 lt!19690 (minValue!1816 lt!19337)))) (Some!114 (_2!830 (tuple2!1639 lt!19690 (minValue!1816 lt!19337)))))))

(assert (=> d!8715 (= lt!19998 (lemmaContainsTupThenGetReturnValue!33 lt!19997 (_1!830 (tuple2!1639 lt!19690 (minValue!1816 lt!19337))) (_2!830 (tuple2!1639 lt!19690 (minValue!1816 lt!19337)))))))

(assert (=> d!8715 (= lt!19997 (insertStrictlySorted!30 (toList!623 lt!19688) (_1!830 (tuple2!1639 lt!19690 (minValue!1816 lt!19337))) (_2!830 (tuple2!1639 lt!19690 (minValue!1816 lt!19337)))))))

(assert (=> d!8715 (= (+!72 lt!19688 (tuple2!1639 lt!19690 (minValue!1816 lt!19337))) lt!19999)))

(declare-fun b!45139 () Bool)

(declare-fun res!26501 () Bool)

(assert (=> b!45139 (=> (not res!26501) (not e!28601))))

(assert (=> b!45139 (= res!26501 (= (getValueByKey!109 (toList!623 lt!19999) (_1!830 (tuple2!1639 lt!19690 (minValue!1816 lt!19337)))) (Some!114 (_2!830 (tuple2!1639 lt!19690 (minValue!1816 lt!19337))))))))

(declare-fun b!45140 () Bool)

(assert (=> b!45140 (= e!28601 (contains!582 (toList!623 lt!19999) (tuple2!1639 lt!19690 (minValue!1816 lt!19337))))))

(assert (= (and d!8715 res!26502) b!45139))

(assert (= (and b!45139 res!26501) b!45140))

(declare-fun m!39519 () Bool)

(assert (=> d!8715 m!39519))

(declare-fun m!39521 () Bool)

(assert (=> d!8715 m!39521))

(declare-fun m!39523 () Bool)

(assert (=> d!8715 m!39523))

(declare-fun m!39525 () Bool)

(assert (=> d!8715 m!39525))

(declare-fun m!39527 () Bool)

(assert (=> b!45139 m!39527))

(declare-fun m!39529 () Bool)

(assert (=> b!45140 m!39529))

(assert (=> b!44683 d!8715))

(declare-fun d!8717 () Bool)

(assert (=> d!8717 (= (apply!63 (+!72 lt!19688 (tuple2!1639 lt!19690 (minValue!1816 lt!19337))) lt!19692) (get!808 (getValueByKey!109 (toList!623 (+!72 lt!19688 (tuple2!1639 lt!19690 (minValue!1816 lt!19337)))) lt!19692)))))

(declare-fun bs!2060 () Bool)

(assert (= bs!2060 d!8717))

(declare-fun m!39531 () Bool)

(assert (=> bs!2060 m!39531))

(assert (=> bs!2060 m!39531))

(declare-fun m!39533 () Bool)

(assert (=> bs!2060 m!39533))

(assert (=> b!44683 d!8717))

(declare-fun d!8719 () Bool)

(declare-fun e!28602 () Bool)

(assert (=> d!8719 e!28602))

(declare-fun res!26504 () Bool)

(assert (=> d!8719 (=> (not res!26504) (not e!28602))))

(declare-fun lt!20003 () ListLongMap!1215)

(assert (=> d!8719 (= res!26504 (contains!579 lt!20003 (_1!830 (tuple2!1639 lt!19684 (zeroValue!1816 lt!19337)))))))

(declare-fun lt!20001 () List!1212)

(assert (=> d!8719 (= lt!20003 (ListLongMap!1216 lt!20001))))

(declare-fun lt!20000 () Unit!1237)

(declare-fun lt!20002 () Unit!1237)

(assert (=> d!8719 (= lt!20000 lt!20002)))

(assert (=> d!8719 (= (getValueByKey!109 lt!20001 (_1!830 (tuple2!1639 lt!19684 (zeroValue!1816 lt!19337)))) (Some!114 (_2!830 (tuple2!1639 lt!19684 (zeroValue!1816 lt!19337)))))))

(assert (=> d!8719 (= lt!20002 (lemmaContainsTupThenGetReturnValue!33 lt!20001 (_1!830 (tuple2!1639 lt!19684 (zeroValue!1816 lt!19337))) (_2!830 (tuple2!1639 lt!19684 (zeroValue!1816 lt!19337)))))))

(assert (=> d!8719 (= lt!20001 (insertStrictlySorted!30 (toList!623 lt!19683) (_1!830 (tuple2!1639 lt!19684 (zeroValue!1816 lt!19337))) (_2!830 (tuple2!1639 lt!19684 (zeroValue!1816 lt!19337)))))))

(assert (=> d!8719 (= (+!72 lt!19683 (tuple2!1639 lt!19684 (zeroValue!1816 lt!19337))) lt!20003)))

(declare-fun b!45141 () Bool)

(declare-fun res!26503 () Bool)

(assert (=> b!45141 (=> (not res!26503) (not e!28602))))

(assert (=> b!45141 (= res!26503 (= (getValueByKey!109 (toList!623 lt!20003) (_1!830 (tuple2!1639 lt!19684 (zeroValue!1816 lt!19337)))) (Some!114 (_2!830 (tuple2!1639 lt!19684 (zeroValue!1816 lt!19337))))))))

(declare-fun b!45142 () Bool)

(assert (=> b!45142 (= e!28602 (contains!582 (toList!623 lt!20003) (tuple2!1639 lt!19684 (zeroValue!1816 lt!19337))))))

(assert (= (and d!8719 res!26504) b!45141))

(assert (= (and b!45141 res!26503) b!45142))

(declare-fun m!39535 () Bool)

(assert (=> d!8719 m!39535))

(declare-fun m!39537 () Bool)

(assert (=> d!8719 m!39537))

(declare-fun m!39539 () Bool)

(assert (=> d!8719 m!39539))

(declare-fun m!39541 () Bool)

(assert (=> d!8719 m!39541))

(declare-fun m!39543 () Bool)

(assert (=> b!45141 m!39543))

(declare-fun m!39545 () Bool)

(assert (=> b!45142 m!39545))

(assert (=> b!44683 d!8719))

(declare-fun d!8721 () Bool)

(declare-fun e!28603 () Bool)

(assert (=> d!8721 e!28603))

(declare-fun res!26506 () Bool)

(assert (=> d!8721 (=> (not res!26506) (not e!28603))))

(declare-fun lt!20007 () ListLongMap!1215)

(assert (=> d!8721 (= res!26506 (contains!579 lt!20007 (_1!830 (tuple2!1639 lt!19672 (minValue!1816 lt!19337)))))))

(declare-fun lt!20005 () List!1212)

(assert (=> d!8721 (= lt!20007 (ListLongMap!1216 lt!20005))))

(declare-fun lt!20004 () Unit!1237)

(declare-fun lt!20006 () Unit!1237)

(assert (=> d!8721 (= lt!20004 lt!20006)))

(assert (=> d!8721 (= (getValueByKey!109 lt!20005 (_1!830 (tuple2!1639 lt!19672 (minValue!1816 lt!19337)))) (Some!114 (_2!830 (tuple2!1639 lt!19672 (minValue!1816 lt!19337)))))))

(assert (=> d!8721 (= lt!20006 (lemmaContainsTupThenGetReturnValue!33 lt!20005 (_1!830 (tuple2!1639 lt!19672 (minValue!1816 lt!19337))) (_2!830 (tuple2!1639 lt!19672 (minValue!1816 lt!19337)))))))

(assert (=> d!8721 (= lt!20005 (insertStrictlySorted!30 (toList!623 lt!19689) (_1!830 (tuple2!1639 lt!19672 (minValue!1816 lt!19337))) (_2!830 (tuple2!1639 lt!19672 (minValue!1816 lt!19337)))))))

(assert (=> d!8721 (= (+!72 lt!19689 (tuple2!1639 lt!19672 (minValue!1816 lt!19337))) lt!20007)))

(declare-fun b!45143 () Bool)

(declare-fun res!26505 () Bool)

(assert (=> b!45143 (=> (not res!26505) (not e!28603))))

(assert (=> b!45143 (= res!26505 (= (getValueByKey!109 (toList!623 lt!20007) (_1!830 (tuple2!1639 lt!19672 (minValue!1816 lt!19337)))) (Some!114 (_2!830 (tuple2!1639 lt!19672 (minValue!1816 lt!19337))))))))

(declare-fun b!45144 () Bool)

(assert (=> b!45144 (= e!28603 (contains!582 (toList!623 lt!20007) (tuple2!1639 lt!19672 (minValue!1816 lt!19337))))))

(assert (= (and d!8721 res!26506) b!45143))

(assert (= (and b!45143 res!26505) b!45144))

(declare-fun m!39547 () Bool)

(assert (=> d!8721 m!39547))

(declare-fun m!39549 () Bool)

(assert (=> d!8721 m!39549))

(declare-fun m!39551 () Bool)

(assert (=> d!8721 m!39551))

(declare-fun m!39553 () Bool)

(assert (=> d!8721 m!39553))

(declare-fun m!39555 () Bool)

(assert (=> b!45143 m!39555))

(declare-fun m!39557 () Bool)

(assert (=> b!45144 m!39557))

(assert (=> b!44683 d!8721))

(declare-fun d!8723 () Bool)

(assert (=> d!8723 (= (apply!63 lt!19680 lt!19677) (get!808 (getValueByKey!109 (toList!623 lt!19680) lt!19677)))))

(declare-fun bs!2061 () Bool)

(assert (= bs!2061 d!8723))

(declare-fun m!39559 () Bool)

(assert (=> bs!2061 m!39559))

(assert (=> bs!2061 m!39559))

(declare-fun m!39561 () Bool)

(assert (=> bs!2061 m!39561))

(assert (=> b!44683 d!8723))

(declare-fun d!8725 () Bool)

(assert (=> d!8725 (= (apply!63 (+!72 lt!19688 (tuple2!1639 lt!19690 (minValue!1816 lt!19337))) lt!19692) (apply!63 lt!19688 lt!19692))))

(declare-fun lt!20008 () Unit!1237)

(assert (=> d!8725 (= lt!20008 (choose!269 lt!19688 lt!19690 (minValue!1816 lt!19337) lt!19692))))

(declare-fun e!28604 () Bool)

(assert (=> d!8725 e!28604))

(declare-fun res!26507 () Bool)

(assert (=> d!8725 (=> (not res!26507) (not e!28604))))

(assert (=> d!8725 (= res!26507 (contains!579 lt!19688 lt!19692))))

(assert (=> d!8725 (= (addApplyDifferent!39 lt!19688 lt!19690 (minValue!1816 lt!19337) lt!19692) lt!20008)))

(declare-fun b!45145 () Bool)

(assert (=> b!45145 (= e!28604 (not (= lt!19692 lt!19690)))))

(assert (= (and d!8725 res!26507) b!45145))

(declare-fun m!39563 () Bool)

(assert (=> d!8725 m!39563))

(assert (=> d!8725 m!38787))

(assert (=> d!8725 m!38805))

(assert (=> d!8725 m!38787))

