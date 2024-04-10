; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6738 () Bool)

(assert start!6738)

(declare-fun b_free!1515 () Bool)

(declare-fun b_next!1515 () Bool)

(assert (=> start!6738 (= b_free!1515 (not b_next!1515))))

(declare-fun tp!5960 () Bool)

(declare-fun b_and!2703 () Bool)

(assert (=> start!6738 (= tp!5960 b_and!2703)))

(declare-fun b!44081 () Bool)

(declare-fun e!27951 () Bool)

(declare-fun lt!19307 () Bool)

(assert (=> b!44081 (= e!27951 (not lt!19307))))

(declare-fun res!26044 () Bool)

(declare-fun e!27950 () Bool)

(assert (=> start!6738 (=> (not res!26044) (not e!27950))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6738 (= res!26044 (validMask!0 mask!853))))

(assert (=> start!6738 e!27950))

(assert (=> start!6738 true))

(assert (=> start!6738 tp!5960))

(declare-fun b!44082 () Bool)

(declare-fun e!27952 () Bool)

(declare-datatypes ((array!2955 0))(
  ( (array!2956 (arr!1421 (Array (_ BitVec 32) (_ BitVec 64))) (size!1624 (_ BitVec 32))) )
))
(declare-fun lt!19304 () array!2955)

(declare-datatypes ((V!2327 0))(
  ( (V!2328 (val!991 Int)) )
))
(declare-datatypes ((tuple2!1636 0))(
  ( (tuple2!1637 (_1!829 (_ BitVec 64)) (_2!829 V!2327)) )
))
(declare-fun lt!19310 () tuple2!1636)

(declare-fun arrayContainsKey!0 (array!2955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!44082 (= e!27952 (arrayContainsKey!0 lt!19304 (_1!829 lt!19310) #b00000000000000000000000000000000))))

(declare-fun b!44083 () Bool)

(declare-datatypes ((Unit!1233 0))(
  ( (Unit!1234) )
))
(declare-fun e!27949 () Unit!1233)

(declare-fun Unit!1235 () Unit!1233)

(assert (=> b!44083 (= e!27949 Unit!1235)))

(declare-datatypes ((List!1210 0))(
  ( (Nil!1207) (Cons!1206 (h!1783 tuple2!1636) (t!4227 List!1210)) )
))
(declare-datatypes ((ListLongMap!1213 0))(
  ( (ListLongMap!1214 (toList!622 List!1210)) )
))
(declare-fun lt!19298 () ListLongMap!1213)

(declare-fun head!894 (List!1210) tuple2!1636)

(assert (=> b!44083 (= lt!19310 (head!894 (toList!622 lt!19298)))))

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!19305 () Unit!1233)

(declare-fun lt!19306 () V!2327)

(declare-datatypes ((ValueCell!705 0))(
  ( (ValueCellFull!705 (v!2087 V!2327)) (EmptyCell!705) )
))
(declare-datatypes ((array!2957 0))(
  ( (array!2958 (arr!1422 (Array (_ BitVec 32) ValueCell!705)) (size!1625 (_ BitVec 32))) )
))
(declare-fun lt!19299 () array!2957)

(declare-fun lemmaKeyInListMapIsInArray!107 (array!2955 array!2957 (_ BitVec 32) (_ BitVec 32) V!2327 V!2327 (_ BitVec 64) Int) Unit!1233)

(assert (=> b!44083 (= lt!19305 (lemmaKeyInListMapIsInArray!107 lt!19304 lt!19299 mask!853 #b00000000000000000000000000000000 lt!19306 lt!19306 (_1!829 lt!19310) defaultEntry!470))))

(declare-fun res!26045 () Bool)

(assert (=> b!44083 (= res!26045 (and (not (= (_1!829 lt!19310) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!829 lt!19310) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!44083 (=> (not res!26045) (not e!27952))))

(assert (=> b!44083 e!27952))

(declare-fun lt!19300 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2955 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!44083 (= lt!19300 (arrayScanForKey!0 lt!19304 (_1!829 lt!19310) #b00000000000000000000000000000000))))

(assert (=> b!44083 false))

(declare-fun b!44084 () Bool)

(assert (=> b!44084 (= e!27950 (not e!27951))))

(declare-fun res!26046 () Bool)

(assert (=> b!44084 (=> (not res!26046) (not e!27951))))

(declare-datatypes ((LongMapFixedSize!390 0))(
  ( (LongMapFixedSize!391 (defaultEntry!1897 Int) (mask!5474 (_ BitVec 32)) (extraKeys!1788 (_ BitVec 32)) (zeroValue!1815 V!2327) (minValue!1815 V!2327) (_size!244 (_ BitVec 32)) (_keys!3464 array!2955) (_values!1880 array!2957) (_vacant!244 (_ BitVec 32))) )
))
(declare-fun lt!19302 () LongMapFixedSize!390)

(declare-fun valid!125 (LongMapFixedSize!390) Bool)

(assert (=> b!44084 (= res!26046 (valid!125 lt!19302))))

(declare-fun lt!19308 () Unit!1233)

(assert (=> b!44084 (= lt!19308 e!27949)))

(declare-fun c!5738 () Bool)

(assert (=> b!44084 (= c!5738 lt!19307)))

(assert (=> b!44084 (= lt!19307 (not (= lt!19298 (ListLongMap!1214 Nil!1207))))))

(declare-fun map!843 (LongMapFixedSize!390) ListLongMap!1213)

(assert (=> b!44084 (= lt!19298 (map!843 lt!19302))))

(declare-datatypes ((List!1211 0))(
  ( (Nil!1208) (Cons!1207 (h!1784 (_ BitVec 64)) (t!4228 List!1211)) )
))
(declare-fun arrayNoDuplicates!0 (array!2955 (_ BitVec 32) List!1211) Bool)

(assert (=> b!44084 (arrayNoDuplicates!0 lt!19304 #b00000000000000000000000000000000 Nil!1208)))

(declare-fun lt!19301 () Unit!1233)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2955 (_ BitVec 32) (_ BitVec 32) List!1211) Unit!1233)

(assert (=> b!44084 (= lt!19301 (lemmaArrayNoDuplicatesInAll0Array!0 lt!19304 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2955 (_ BitVec 32)) Bool)

(assert (=> b!44084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19304 mask!853)))

(declare-fun lt!19309 () Unit!1233)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2955 (_ BitVec 32) (_ BitVec 32)) Unit!1233)

(assert (=> b!44084 (= lt!19309 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!19304 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2955 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!44084 (= (arrayCountValidKeys!0 lt!19304 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!19303 () Unit!1233)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2955 (_ BitVec 32) (_ BitVec 32)) Unit!1233)

(assert (=> b!44084 (= lt!19303 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!19304 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!44084 (= lt!19302 (LongMapFixedSize!391 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19306 lt!19306 #b00000000000000000000000000000000 lt!19304 lt!19299 #b00000000000000000000000000000000))))

(assert (=> b!44084 (= lt!19299 (array!2958 ((as const (Array (_ BitVec 32) ValueCell!705)) EmptyCell!705) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!44084 (= lt!19304 (array!2956 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!266 (Int (_ BitVec 64)) V!2327)

(assert (=> b!44084 (= lt!19306 (dynLambda!266 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!44085 () Bool)

(declare-fun Unit!1236 () Unit!1233)

(assert (=> b!44085 (= e!27949 Unit!1236)))

(assert (= (and start!6738 res!26044) b!44084))

(assert (= (and b!44084 c!5738) b!44083))

(assert (= (and b!44084 (not c!5738)) b!44085))

(assert (= (and b!44083 res!26045) b!44082))

(assert (= (and b!44084 res!26046) b!44081))

(declare-fun b_lambda!2311 () Bool)

(assert (=> (not b_lambda!2311) (not b!44084)))

(declare-fun t!4226 () Bool)

(declare-fun tb!1003 () Bool)

(assert (=> (and start!6738 (= defaultEntry!470 defaultEntry!470) t!4226) tb!1003))

(declare-fun result!1751 () Bool)

(declare-fun tp_is_empty!1905 () Bool)

(assert (=> tb!1003 (= result!1751 tp_is_empty!1905)))

(assert (=> b!44084 t!4226))

(declare-fun b_and!2705 () Bool)

(assert (= b_and!2703 (and (=> t!4226 result!1751) b_and!2705)))

(declare-fun m!38295 () Bool)

(assert (=> start!6738 m!38295))

(declare-fun m!38297 () Bool)

(assert (=> b!44082 m!38297))

(declare-fun m!38299 () Bool)

(assert (=> b!44083 m!38299))

(declare-fun m!38301 () Bool)

(assert (=> b!44083 m!38301))

(declare-fun m!38303 () Bool)

(assert (=> b!44083 m!38303))

(declare-fun m!38305 () Bool)

(assert (=> b!44084 m!38305))

(declare-fun m!38307 () Bool)

(assert (=> b!44084 m!38307))

(declare-fun m!38309 () Bool)

(assert (=> b!44084 m!38309))

(declare-fun m!38311 () Bool)

(assert (=> b!44084 m!38311))

(declare-fun m!38313 () Bool)

(assert (=> b!44084 m!38313))

(declare-fun m!38315 () Bool)

(assert (=> b!44084 m!38315))

(declare-fun m!38317 () Bool)

(assert (=> b!44084 m!38317))

(declare-fun m!38319 () Bool)

(assert (=> b!44084 m!38319))

(declare-fun m!38321 () Bool)

(assert (=> b!44084 m!38321))

(check-sat (not b_lambda!2311) b_and!2705 (not b!44082) (not b_next!1515) (not b!44084) tp_is_empty!1905 (not b!44083) (not start!6738))
(check-sat b_and!2705 (not b_next!1515))
(get-model)

(declare-fun b_lambda!2319 () Bool)

(assert (= b_lambda!2311 (or (and start!6738 b_free!1515) b_lambda!2319)))

(check-sat b_and!2705 (not b_lambda!2319) (not b!44082) (not b_next!1515) (not b!44084) tp_is_empty!1905 (not b!44083) (not start!6738))
(check-sat b_and!2705 (not b_next!1515))
(get-model)

(declare-fun b!44139 () Bool)

(declare-fun e!27981 () Bool)

(declare-fun call!3556 () Bool)

(assert (=> b!44139 (= e!27981 call!3556)))

(declare-fun b!44140 () Bool)

(declare-fun e!27982 () Bool)

(assert (=> b!44140 (= e!27982 call!3556)))

(declare-fun b!44141 () Bool)

(declare-fun e!27983 () Bool)

(assert (=> b!44141 (= e!27983 e!27981)))

(declare-fun c!5748 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!44141 (= c!5748 (validKeyInArray!0 (select (arr!1421 lt!19304) #b00000000000000000000000000000000)))))

(declare-fun d!8287 () Bool)

(declare-fun res!26079 () Bool)

(assert (=> d!8287 (=> res!26079 e!27983)))

(assert (=> d!8287 (= res!26079 (bvsge #b00000000000000000000000000000000 (size!1624 lt!19304)))))

(assert (=> d!8287 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19304 mask!853) e!27983)))

(declare-fun b!44142 () Bool)

(assert (=> b!44142 (= e!27981 e!27982)))

(declare-fun lt!19368 () (_ BitVec 64))

(assert (=> b!44142 (= lt!19368 (select (arr!1421 lt!19304) #b00000000000000000000000000000000))))

(declare-fun lt!19369 () Unit!1233)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2955 (_ BitVec 64) (_ BitVec 32)) Unit!1233)

(assert (=> b!44142 (= lt!19369 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19304 lt!19368 #b00000000000000000000000000000000))))

(assert (=> b!44142 (arrayContainsKey!0 lt!19304 lt!19368 #b00000000000000000000000000000000)))

(declare-fun lt!19367 () Unit!1233)

(assert (=> b!44142 (= lt!19367 lt!19369)))

(declare-fun res!26078 () Bool)

(declare-datatypes ((SeekEntryResult!203 0))(
  ( (MissingZero!203 (index!2934 (_ BitVec 32))) (Found!203 (index!2935 (_ BitVec 32))) (Intermediate!203 (undefined!1015 Bool) (index!2936 (_ BitVec 32)) (x!8357 (_ BitVec 32))) (Undefined!203) (MissingVacant!203 (index!2937 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2955 (_ BitVec 32)) SeekEntryResult!203)

(assert (=> b!44142 (= res!26078 (= (seekEntryOrOpen!0 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) lt!19304 mask!853) (Found!203 #b00000000000000000000000000000000)))))

(assert (=> b!44142 (=> (not res!26078) (not e!27982))))

(declare-fun bm!3553 () Bool)

(assert (=> bm!3553 (= call!3556 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!19304 mask!853))))

(assert (= (and d!8287 (not res!26079)) b!44141))

(assert (= (and b!44141 c!5748) b!44142))

(assert (= (and b!44141 (not c!5748)) b!44139))

(assert (= (and b!44142 res!26078) b!44140))

(assert (= (or b!44140 b!44139) bm!3553))

(declare-fun m!38377 () Bool)

(assert (=> b!44141 m!38377))

(assert (=> b!44141 m!38377))

(declare-fun m!38379 () Bool)

(assert (=> b!44141 m!38379))

(assert (=> b!44142 m!38377))

(declare-fun m!38381 () Bool)

(assert (=> b!44142 m!38381))

(declare-fun m!38383 () Bool)

(assert (=> b!44142 m!38383))

(assert (=> b!44142 m!38377))

(declare-fun m!38385 () Bool)

(assert (=> b!44142 m!38385))

(declare-fun m!38387 () Bool)

(assert (=> bm!3553 m!38387))

(assert (=> b!44084 d!8287))

(declare-fun bm!3560 () Bool)

(declare-fun call!3563 () Bool)

(declare-fun c!5759 () Bool)

(assert (=> bm!3560 (= call!3563 (arrayNoDuplicates!0 lt!19304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5759 (Cons!1207 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) Nil!1208) Nil!1208)))))

(declare-fun b!44169 () Bool)

(declare-fun e!28001 () Bool)

(declare-fun e!28002 () Bool)

(assert (=> b!44169 (= e!28001 e!28002)))

(assert (=> b!44169 (= c!5759 (validKeyInArray!0 (select (arr!1421 lt!19304) #b00000000000000000000000000000000)))))

(declare-fun d!8295 () Bool)

(declare-fun res!26088 () Bool)

(declare-fun e!28003 () Bool)

(assert (=> d!8295 (=> res!26088 e!28003)))

(assert (=> d!8295 (= res!26088 (bvsge #b00000000000000000000000000000000 (size!1624 lt!19304)))))

(assert (=> d!8295 (= (arrayNoDuplicates!0 lt!19304 #b00000000000000000000000000000000 Nil!1208) e!28003)))

(declare-fun b!44170 () Bool)

(assert (=> b!44170 (= e!28003 e!28001)))

(declare-fun res!26086 () Bool)

(assert (=> b!44170 (=> (not res!26086) (not e!28001))))

(declare-fun e!28000 () Bool)

(assert (=> b!44170 (= res!26086 (not e!28000))))

(declare-fun res!26087 () Bool)

(assert (=> b!44170 (=> (not res!26087) (not e!28000))))

(assert (=> b!44170 (= res!26087 (validKeyInArray!0 (select (arr!1421 lt!19304) #b00000000000000000000000000000000)))))

(declare-fun b!44171 () Bool)

(assert (=> b!44171 (= e!28002 call!3563)))

(declare-fun b!44172 () Bool)

(declare-fun contains!575 (List!1211 (_ BitVec 64)) Bool)

(assert (=> b!44172 (= e!28000 (contains!575 Nil!1208 (select (arr!1421 lt!19304) #b00000000000000000000000000000000)))))

(declare-fun b!44173 () Bool)

(assert (=> b!44173 (= e!28002 call!3563)))

(assert (= (and d!8295 (not res!26088)) b!44170))

(assert (= (and b!44170 res!26087) b!44172))

(assert (= (and b!44170 res!26086) b!44169))

(assert (= (and b!44169 c!5759) b!44171))

(assert (= (and b!44169 (not c!5759)) b!44173))

(assert (= (or b!44171 b!44173) bm!3560))

(assert (=> bm!3560 m!38377))

(declare-fun m!38403 () Bool)

(assert (=> bm!3560 m!38403))

(assert (=> b!44169 m!38377))

(assert (=> b!44169 m!38377))

(assert (=> b!44169 m!38379))

(assert (=> b!44170 m!38377))

(assert (=> b!44170 m!38377))

(assert (=> b!44170 m!38379))

(assert (=> b!44172 m!38377))

(assert (=> b!44172 m!38377))

(declare-fun m!38405 () Bool)

(assert (=> b!44172 m!38405))

(assert (=> b!44084 d!8295))

(declare-fun d!8303 () Bool)

(declare-fun res!26110 () Bool)

(declare-fun e!28027 () Bool)

(assert (=> d!8303 (=> (not res!26110) (not e!28027))))

(declare-fun simpleValid!32 (LongMapFixedSize!390) Bool)

(assert (=> d!8303 (= res!26110 (simpleValid!32 lt!19302))))

(assert (=> d!8303 (= (valid!125 lt!19302) e!28027)))

(declare-fun b!44207 () Bool)

(declare-fun res!26111 () Bool)

(assert (=> b!44207 (=> (not res!26111) (not e!28027))))

(assert (=> b!44207 (= res!26111 (= (arrayCountValidKeys!0 (_keys!3464 lt!19302) #b00000000000000000000000000000000 (size!1624 (_keys!3464 lt!19302))) (_size!244 lt!19302)))))

(declare-fun b!44208 () Bool)

(declare-fun res!26112 () Bool)

(assert (=> b!44208 (=> (not res!26112) (not e!28027))))

(assert (=> b!44208 (= res!26112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3464 lt!19302) (mask!5474 lt!19302)))))

(declare-fun b!44209 () Bool)

(assert (=> b!44209 (= e!28027 (arrayNoDuplicates!0 (_keys!3464 lt!19302) #b00000000000000000000000000000000 Nil!1208))))

(assert (= (and d!8303 res!26110) b!44207))

(assert (= (and b!44207 res!26111) b!44208))

(assert (= (and b!44208 res!26112) b!44209))

(declare-fun m!38419 () Bool)

(assert (=> d!8303 m!38419))

(declare-fun m!38421 () Bool)

(assert (=> b!44207 m!38421))

(declare-fun m!38423 () Bool)

(assert (=> b!44208 m!38423))

(declare-fun m!38425 () Bool)

(assert (=> b!44209 m!38425))

(assert (=> b!44084 d!8303))

(declare-fun b!44230 () Bool)

(declare-fun e!28042 () (_ BitVec 32))

(assert (=> b!44230 (= e!28042 #b00000000000000000000000000000000)))

(declare-fun b!44231 () Bool)

(declare-fun e!28041 () (_ BitVec 32))

(declare-fun call!3575 () (_ BitVec 32))

(assert (=> b!44231 (= e!28041 (bvadd #b00000000000000000000000000000001 call!3575))))

(declare-fun b!44232 () Bool)

(assert (=> b!44232 (= e!28041 call!3575)))

(declare-fun bm!3572 () Bool)

(assert (=> bm!3572 (= call!3575 (arrayCountValidKeys!0 lt!19304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun d!8309 () Bool)

(declare-fun lt!19403 () (_ BitVec 32))

(assert (=> d!8309 (and (bvsge lt!19403 #b00000000000000000000000000000000) (bvsle lt!19403 (bvsub (size!1624 lt!19304) #b00000000000000000000000000000000)))))

(assert (=> d!8309 (= lt!19403 e!28042)))

(declare-fun c!5773 () Bool)

(assert (=> d!8309 (= c!5773 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8309 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1624 lt!19304)))))

(assert (=> d!8309 (= (arrayCountValidKeys!0 lt!19304 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!19403)))

(declare-fun b!44233 () Bool)

(assert (=> b!44233 (= e!28042 e!28041)))

(declare-fun c!5774 () Bool)

(assert (=> b!44233 (= c!5774 (validKeyInArray!0 (select (arr!1421 lt!19304) #b00000000000000000000000000000000)))))

(assert (= (and d!8309 c!5773) b!44230))

(assert (= (and d!8309 (not c!5773)) b!44233))

(assert (= (and b!44233 c!5774) b!44231))

(assert (= (and b!44233 (not c!5774)) b!44232))

(assert (= (or b!44231 b!44232) bm!3572))

(declare-fun m!38439 () Bool)

(assert (=> bm!3572 m!38439))

(assert (=> b!44233 m!38377))

(assert (=> b!44233 m!38377))

(assert (=> b!44233 m!38379))

(assert (=> b!44084 d!8309))

(declare-fun d!8317 () Bool)

(assert (=> d!8317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19304 mask!853)))

(declare-fun lt!19406 () Unit!1233)

(declare-fun choose!34 (array!2955 (_ BitVec 32) (_ BitVec 32)) Unit!1233)

(assert (=> d!8317 (= lt!19406 (choose!34 lt!19304 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!8317 (validMask!0 mask!853)))

(assert (=> d!8317 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!19304 mask!853 #b00000000000000000000000000000000) lt!19406)))

(declare-fun bs!2012 () Bool)

(assert (= bs!2012 d!8317))

(assert (=> bs!2012 m!38311))

(declare-fun m!38441 () Bool)

(assert (=> bs!2012 m!38441))

(assert (=> bs!2012 m!38295))

(assert (=> b!44084 d!8317))

(declare-fun d!8319 () Bool)

(assert (=> d!8319 (arrayNoDuplicates!0 lt!19304 #b00000000000000000000000000000000 Nil!1208)))

(declare-fun lt!19409 () Unit!1233)

(declare-fun choose!111 (array!2955 (_ BitVec 32) (_ BitVec 32) List!1211) Unit!1233)

(assert (=> d!8319 (= lt!19409 (choose!111 lt!19304 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1208))))

(assert (=> d!8319 (= (size!1624 lt!19304) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!8319 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!19304 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1208) lt!19409)))

(declare-fun bs!2013 () Bool)

(assert (= bs!2013 d!8319))

(assert (=> bs!2013 m!38319))

(declare-fun m!38447 () Bool)

(assert (=> bs!2013 m!38447))

(assert (=> b!44084 d!8319))

(declare-fun d!8323 () Bool)

(declare-fun getCurrentListMap!357 (array!2955 array!2957 (_ BitVec 32) (_ BitVec 32) V!2327 V!2327 (_ BitVec 32) Int) ListLongMap!1213)

(assert (=> d!8323 (= (map!843 lt!19302) (getCurrentListMap!357 (_keys!3464 lt!19302) (_values!1880 lt!19302) (mask!5474 lt!19302) (extraKeys!1788 lt!19302) (zeroValue!1815 lt!19302) (minValue!1815 lt!19302) #b00000000000000000000000000000000 (defaultEntry!1897 lt!19302)))))

(declare-fun bs!2014 () Bool)

(assert (= bs!2014 d!8323))

(declare-fun m!38449 () Bool)

(assert (=> bs!2014 m!38449))

(assert (=> b!44084 d!8323))

(declare-fun d!8329 () Bool)

(assert (=> d!8329 (= (arrayCountValidKeys!0 lt!19304 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!19415 () Unit!1233)

(declare-fun choose!59 (array!2955 (_ BitVec 32) (_ BitVec 32)) Unit!1233)

(assert (=> d!8329 (= lt!19415 (choose!59 lt!19304 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8329 (bvslt (size!1624 lt!19304) #b01111111111111111111111111111111)))

(assert (=> d!8329 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!19304 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!19415)))

(declare-fun bs!2015 () Bool)

(assert (= bs!2015 d!8329))

(assert (=> bs!2015 m!38305))

(declare-fun m!38453 () Bool)

(assert (=> bs!2015 m!38453))

(assert (=> b!44084 d!8329))

(declare-fun d!8337 () Bool)

(assert (=> d!8337 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6738 d!8337))

(declare-fun d!8343 () Bool)

(declare-fun res!26138 () Bool)

(declare-fun e!28077 () Bool)

(assert (=> d!8343 (=> res!26138 e!28077)))

(assert (=> d!8343 (= res!26138 (= (select (arr!1421 lt!19304) #b00000000000000000000000000000000) (_1!829 lt!19310)))))

(assert (=> d!8343 (= (arrayContainsKey!0 lt!19304 (_1!829 lt!19310) #b00000000000000000000000000000000) e!28077)))

(declare-fun b!44283 () Bool)

(declare-fun e!28078 () Bool)

(assert (=> b!44283 (= e!28077 e!28078)))

(declare-fun res!26139 () Bool)

(assert (=> b!44283 (=> (not res!26139) (not e!28078))))

(assert (=> b!44283 (= res!26139 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1624 lt!19304)))))

(declare-fun b!44284 () Bool)

(assert (=> b!44284 (= e!28078 (arrayContainsKey!0 lt!19304 (_1!829 lt!19310) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8343 (not res!26138)) b!44283))

(assert (= (and b!44283 res!26139) b!44284))

(assert (=> d!8343 m!38377))

(declare-fun m!38467 () Bool)

(assert (=> b!44284 m!38467))

(assert (=> b!44082 d!8343))

(declare-fun d!8347 () Bool)

(assert (=> d!8347 (= (head!894 (toList!622 lt!19298)) (h!1783 (toList!622 lt!19298)))))

(assert (=> b!44083 d!8347))

(declare-fun d!8349 () Bool)

(declare-fun e!28087 () Bool)

(assert (=> d!8349 e!28087))

(declare-fun c!5792 () Bool)

(assert (=> d!8349 (= c!5792 (and (not (= (_1!829 lt!19310) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!829 lt!19310) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!19427 () Unit!1233)

(declare-fun choose!263 (array!2955 array!2957 (_ BitVec 32) (_ BitVec 32) V!2327 V!2327 (_ BitVec 64) Int) Unit!1233)

(assert (=> d!8349 (= lt!19427 (choose!263 lt!19304 lt!19299 mask!853 #b00000000000000000000000000000000 lt!19306 lt!19306 (_1!829 lt!19310) defaultEntry!470))))

(assert (=> d!8349 (validMask!0 mask!853)))

(assert (=> d!8349 (= (lemmaKeyInListMapIsInArray!107 lt!19304 lt!19299 mask!853 #b00000000000000000000000000000000 lt!19306 lt!19306 (_1!829 lt!19310) defaultEntry!470) lt!19427)))

(declare-fun b!44295 () Bool)

(assert (=> b!44295 (= e!28087 (arrayContainsKey!0 lt!19304 (_1!829 lt!19310) #b00000000000000000000000000000000))))

(declare-fun b!44296 () Bool)

(assert (=> b!44296 (= e!28087 (ite (= (_1!829 lt!19310) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!8349 c!5792) b!44295))

(assert (= (and d!8349 (not c!5792)) b!44296))

(declare-fun m!38471 () Bool)

(assert (=> d!8349 m!38471))

(assert (=> d!8349 m!38295))

(assert (=> b!44295 m!38297))

(assert (=> b!44083 d!8349))

(declare-fun d!8351 () Bool)

(declare-fun lt!19430 () (_ BitVec 32))

(assert (=> d!8351 (and (or (bvslt lt!19430 #b00000000000000000000000000000000) (bvsge lt!19430 (size!1624 lt!19304)) (and (bvsge lt!19430 #b00000000000000000000000000000000) (bvslt lt!19430 (size!1624 lt!19304)))) (bvsge lt!19430 #b00000000000000000000000000000000) (bvslt lt!19430 (size!1624 lt!19304)) (= (select (arr!1421 lt!19304) lt!19430) (_1!829 lt!19310)))))

(declare-fun e!28090 () (_ BitVec 32))

(assert (=> d!8351 (= lt!19430 e!28090)))

(declare-fun c!5795 () Bool)

(assert (=> d!8351 (= c!5795 (= (select (arr!1421 lt!19304) #b00000000000000000000000000000000) (_1!829 lt!19310)))))

(assert (=> d!8351 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1624 lt!19304)) (bvslt (size!1624 lt!19304) #b01111111111111111111111111111111))))

(assert (=> d!8351 (= (arrayScanForKey!0 lt!19304 (_1!829 lt!19310) #b00000000000000000000000000000000) lt!19430)))

(declare-fun b!44301 () Bool)

(assert (=> b!44301 (= e!28090 #b00000000000000000000000000000000)))

(declare-fun b!44302 () Bool)

(assert (=> b!44302 (= e!28090 (arrayScanForKey!0 lt!19304 (_1!829 lt!19310) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8351 c!5795) b!44301))

(assert (= (and d!8351 (not c!5795)) b!44302))

(declare-fun m!38473 () Bool)

(assert (=> d!8351 m!38473))

(assert (=> d!8351 m!38377))

(declare-fun m!38475 () Bool)

(assert (=> b!44302 m!38475))

(assert (=> b!44083 d!8351))

(check-sat (not b!44233) (not b!44284) b_and!2705 (not d!8323) (not b!44142) (not b!44295) (not b_next!1515) (not d!8319) (not d!8349) (not b!44207) (not b!44172) (not bm!3553) (not b!44209) (not b_lambda!2319) (not b!44141) (not d!8303) (not bm!3572) (not b!44170) (not b!44208) (not b!44302) (not bm!3560) (not d!8329) (not d!8317) tp_is_empty!1905 (not b!44169))
(check-sat b_and!2705 (not b_next!1515))
(get-model)

(declare-fun d!8355 () Bool)

(declare-fun lt!19433 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!42 (List!1211) (InoxSet (_ BitVec 64)))

(assert (=> d!8355 (= lt!19433 (select (content!42 Nil!1208) (select (arr!1421 lt!19304) #b00000000000000000000000000000000)))))

(declare-fun e!28095 () Bool)

(assert (=> d!8355 (= lt!19433 e!28095)))

(declare-fun res!26151 () Bool)

(assert (=> d!8355 (=> (not res!26151) (not e!28095))))

(get-info :version)

(assert (=> d!8355 (= res!26151 ((_ is Cons!1207) Nil!1208))))

(assert (=> d!8355 (= (contains!575 Nil!1208 (select (arr!1421 lt!19304) #b00000000000000000000000000000000)) lt!19433)))

(declare-fun b!44307 () Bool)

(declare-fun e!28096 () Bool)

(assert (=> b!44307 (= e!28095 e!28096)))

(declare-fun res!26150 () Bool)

(assert (=> b!44307 (=> res!26150 e!28096)))

(assert (=> b!44307 (= res!26150 (= (h!1784 Nil!1208) (select (arr!1421 lt!19304) #b00000000000000000000000000000000)))))

(declare-fun b!44308 () Bool)

(assert (=> b!44308 (= e!28096 (contains!575 (t!4228 Nil!1208) (select (arr!1421 lt!19304) #b00000000000000000000000000000000)))))

(assert (= (and d!8355 res!26151) b!44307))

(assert (= (and b!44307 (not res!26150)) b!44308))

(declare-fun m!38477 () Bool)

(assert (=> d!8355 m!38477))

(assert (=> d!8355 m!38377))

(declare-fun m!38479 () Bool)

(assert (=> d!8355 m!38479))

(assert (=> b!44308 m!38377))

(declare-fun m!38481 () Bool)

(assert (=> b!44308 m!38481))

(assert (=> b!44172 d!8355))

(declare-fun d!8357 () Bool)

(declare-fun lt!19434 () (_ BitVec 32))

(assert (=> d!8357 (and (or (bvslt lt!19434 #b00000000000000000000000000000000) (bvsge lt!19434 (size!1624 lt!19304)) (and (bvsge lt!19434 #b00000000000000000000000000000000) (bvslt lt!19434 (size!1624 lt!19304)))) (bvsge lt!19434 #b00000000000000000000000000000000) (bvslt lt!19434 (size!1624 lt!19304)) (= (select (arr!1421 lt!19304) lt!19434) (_1!829 lt!19310)))))

(declare-fun e!28097 () (_ BitVec 32))

(assert (=> d!8357 (= lt!19434 e!28097)))

(declare-fun c!5796 () Bool)

(assert (=> d!8357 (= c!5796 (= (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_1!829 lt!19310)))))

(assert (=> d!8357 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1624 lt!19304)) (bvslt (size!1624 lt!19304) #b01111111111111111111111111111111))))

(assert (=> d!8357 (= (arrayScanForKey!0 lt!19304 (_1!829 lt!19310) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19434)))

(declare-fun b!44309 () Bool)

(assert (=> b!44309 (= e!28097 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(declare-fun b!44310 () Bool)

(assert (=> b!44310 (= e!28097 (arrayScanForKey!0 lt!19304 (_1!829 lt!19310) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!8357 c!5796) b!44309))

(assert (= (and d!8357 (not c!5796)) b!44310))

(declare-fun m!38483 () Bool)

(assert (=> d!8357 m!38483))

(declare-fun m!38485 () Bool)

(assert (=> d!8357 m!38485))

(declare-fun m!38487 () Bool)

(assert (=> b!44310 m!38487))

(assert (=> b!44302 d!8357))

(declare-fun d!8359 () Bool)

(declare-fun e!28100 () Bool)

(assert (=> d!8359 e!28100))

(declare-fun c!5799 () Bool)

(assert (=> d!8359 (= c!5799 (and (not (= (_1!829 lt!19310) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!829 lt!19310) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!8359 true))

(declare-fun _$15!80 () Unit!1233)

(assert (=> d!8359 (= (choose!263 lt!19304 lt!19299 mask!853 #b00000000000000000000000000000000 lt!19306 lt!19306 (_1!829 lt!19310) defaultEntry!470) _$15!80)))

(declare-fun b!44315 () Bool)

(assert (=> b!44315 (= e!28100 (arrayContainsKey!0 lt!19304 (_1!829 lt!19310) #b00000000000000000000000000000000))))

(declare-fun b!44316 () Bool)

(assert (=> b!44316 (= e!28100 (ite (= (_1!829 lt!19310) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!8359 c!5799) b!44315))

(assert (= (and d!8359 (not c!5799)) b!44316))

(assert (=> b!44315 m!38297))

(assert (=> d!8349 d!8359))

(assert (=> d!8349 d!8337))

(declare-fun d!8361 () Bool)

(declare-fun res!26152 () Bool)

(declare-fun e!28101 () Bool)

(assert (=> d!8361 (=> res!26152 e!28101)))

(assert (=> d!8361 (= res!26152 (= (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_1!829 lt!19310)))))

(assert (=> d!8361 (= (arrayContainsKey!0 lt!19304 (_1!829 lt!19310) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!28101)))

(declare-fun b!44317 () Bool)

(declare-fun e!28102 () Bool)

(assert (=> b!44317 (= e!28101 e!28102)))

(declare-fun res!26153 () Bool)

(assert (=> b!44317 (=> (not res!26153) (not e!28102))))

(assert (=> b!44317 (= res!26153 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1624 lt!19304)))))

(declare-fun b!44318 () Bool)

(assert (=> b!44318 (= e!28102 (arrayContainsKey!0 lt!19304 (_1!829 lt!19310) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!8361 (not res!26152)) b!44317))

(assert (= (and b!44317 res!26153) b!44318))

(assert (=> d!8361 m!38485))

(declare-fun m!38489 () Bool)

(assert (=> b!44318 m!38489))

(assert (=> b!44284 d!8361))

(declare-fun d!8363 () Bool)

(assert (=> d!8363 (= (validKeyInArray!0 (select (arr!1421 lt!19304) #b00000000000000000000000000000000)) (and (not (= (select (arr!1421 lt!19304) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1421 lt!19304) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!44169 d!8363))

(assert (=> d!8317 d!8287))

(declare-fun d!8365 () Bool)

(assert (=> d!8365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19304 mask!853)))

(assert (=> d!8365 true))

(declare-fun _$30!69 () Unit!1233)

(assert (=> d!8365 (= (choose!34 lt!19304 mask!853 #b00000000000000000000000000000000) _$30!69)))

(declare-fun bs!2016 () Bool)

(assert (= bs!2016 d!8365))

(assert (=> bs!2016 m!38311))

(assert (=> d!8317 d!8365))

(assert (=> d!8317 d!8337))

(assert (=> b!44170 d!8363))

(declare-fun bm!3576 () Bool)

(declare-fun call!3579 () Bool)

(declare-fun c!5800 () Bool)

(assert (=> bm!3576 (= call!3579 (arrayNoDuplicates!0 (_keys!3464 lt!19302) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5800 (Cons!1207 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000) Nil!1208) Nil!1208)))))

(declare-fun b!44319 () Bool)

(declare-fun e!28104 () Bool)

(declare-fun e!28105 () Bool)

(assert (=> b!44319 (= e!28104 e!28105)))

(assert (=> b!44319 (= c!5800 (validKeyInArray!0 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)))))

(declare-fun d!8367 () Bool)

(declare-fun res!26156 () Bool)

(declare-fun e!28106 () Bool)

(assert (=> d!8367 (=> res!26156 e!28106)))

(assert (=> d!8367 (= res!26156 (bvsge #b00000000000000000000000000000000 (size!1624 (_keys!3464 lt!19302))))))

(assert (=> d!8367 (= (arrayNoDuplicates!0 (_keys!3464 lt!19302) #b00000000000000000000000000000000 Nil!1208) e!28106)))

(declare-fun b!44320 () Bool)

(assert (=> b!44320 (= e!28106 e!28104)))

(declare-fun res!26154 () Bool)

(assert (=> b!44320 (=> (not res!26154) (not e!28104))))

(declare-fun e!28103 () Bool)

(assert (=> b!44320 (= res!26154 (not e!28103))))

(declare-fun res!26155 () Bool)

(assert (=> b!44320 (=> (not res!26155) (not e!28103))))

(assert (=> b!44320 (= res!26155 (validKeyInArray!0 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)))))

(declare-fun b!44321 () Bool)

(assert (=> b!44321 (= e!28105 call!3579)))

(declare-fun b!44322 () Bool)

(assert (=> b!44322 (= e!28103 (contains!575 Nil!1208 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)))))

(declare-fun b!44323 () Bool)

(assert (=> b!44323 (= e!28105 call!3579)))

(assert (= (and d!8367 (not res!26156)) b!44320))

(assert (= (and b!44320 res!26155) b!44322))

(assert (= (and b!44320 res!26154) b!44319))

(assert (= (and b!44319 c!5800) b!44321))

(assert (= (and b!44319 (not c!5800)) b!44323))

(assert (= (or b!44321 b!44323) bm!3576))

(declare-fun m!38491 () Bool)

(assert (=> bm!3576 m!38491))

(declare-fun m!38493 () Bool)

(assert (=> bm!3576 m!38493))

(assert (=> b!44319 m!38491))

(assert (=> b!44319 m!38491))

(declare-fun m!38495 () Bool)

(assert (=> b!44319 m!38495))

(assert (=> b!44320 m!38491))

(assert (=> b!44320 m!38491))

(assert (=> b!44320 m!38495))

(assert (=> b!44322 m!38491))

(assert (=> b!44322 m!38491))

(declare-fun m!38497 () Bool)

(assert (=> b!44322 m!38497))

(assert (=> b!44209 d!8367))

(declare-fun b!44324 () Bool)

(declare-fun e!28107 () Bool)

(declare-fun call!3580 () Bool)

(assert (=> b!44324 (= e!28107 call!3580)))

(declare-fun b!44325 () Bool)

(declare-fun e!28108 () Bool)

(assert (=> b!44325 (= e!28108 call!3580)))

(declare-fun b!44326 () Bool)

(declare-fun e!28109 () Bool)

(assert (=> b!44326 (= e!28109 e!28107)))

(declare-fun c!5801 () Bool)

(assert (=> b!44326 (= c!5801 (validKeyInArray!0 (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!8369 () Bool)

(declare-fun res!26158 () Bool)

(assert (=> d!8369 (=> res!26158 e!28109)))

(assert (=> d!8369 (= res!26158 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1624 lt!19304)))))

(assert (=> d!8369 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!19304 mask!853) e!28109)))

(declare-fun b!44327 () Bool)

(assert (=> b!44327 (= e!28107 e!28108)))

(declare-fun lt!19436 () (_ BitVec 64))

(assert (=> b!44327 (= lt!19436 (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!19437 () Unit!1233)

(assert (=> b!44327 (= lt!19437 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19304 lt!19436 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!44327 (arrayContainsKey!0 lt!19304 lt!19436 #b00000000000000000000000000000000)))

(declare-fun lt!19435 () Unit!1233)

(assert (=> b!44327 (= lt!19435 lt!19437)))

(declare-fun res!26157 () Bool)

(assert (=> b!44327 (= res!26157 (= (seekEntryOrOpen!0 (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19304 mask!853) (Found!203 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!44327 (=> (not res!26157) (not e!28108))))

(declare-fun bm!3577 () Bool)

(assert (=> bm!3577 (= call!3580 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!19304 mask!853))))

(assert (= (and d!8369 (not res!26158)) b!44326))

(assert (= (and b!44326 c!5801) b!44327))

(assert (= (and b!44326 (not c!5801)) b!44324))

(assert (= (and b!44327 res!26157) b!44325))

(assert (= (or b!44325 b!44324) bm!3577))

(assert (=> b!44326 m!38485))

(assert (=> b!44326 m!38485))

(declare-fun m!38499 () Bool)

(assert (=> b!44326 m!38499))

(assert (=> b!44327 m!38485))

(declare-fun m!38501 () Bool)

(assert (=> b!44327 m!38501))

(declare-fun m!38503 () Bool)

(assert (=> b!44327 m!38503))

(assert (=> b!44327 m!38485))

(declare-fun m!38505 () Bool)

(assert (=> b!44327 m!38505))

(declare-fun m!38507 () Bool)

(assert (=> bm!3577 m!38507))

(assert (=> bm!3553 d!8369))

(assert (=> b!44295 d!8343))

(declare-fun bm!3578 () Bool)

(declare-fun call!3581 () Bool)

(declare-fun c!5802 () Bool)

(assert (=> bm!3578 (= call!3581 (arrayNoDuplicates!0 lt!19304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5802 (Cons!1207 (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5759 (Cons!1207 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) Nil!1208) Nil!1208)) (ite c!5759 (Cons!1207 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) Nil!1208) Nil!1208))))))

(declare-fun b!44328 () Bool)

(declare-fun e!28111 () Bool)

(declare-fun e!28112 () Bool)

(assert (=> b!44328 (= e!28111 e!28112)))

(assert (=> b!44328 (= c!5802 (validKeyInArray!0 (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!8371 () Bool)

(declare-fun res!26161 () Bool)

(declare-fun e!28113 () Bool)

(assert (=> d!8371 (=> res!26161 e!28113)))

(assert (=> d!8371 (= res!26161 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1624 lt!19304)))))

(assert (=> d!8371 (= (arrayNoDuplicates!0 lt!19304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5759 (Cons!1207 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) Nil!1208) Nil!1208)) e!28113)))

(declare-fun b!44329 () Bool)

(assert (=> b!44329 (= e!28113 e!28111)))

(declare-fun res!26159 () Bool)

(assert (=> b!44329 (=> (not res!26159) (not e!28111))))

(declare-fun e!28110 () Bool)

(assert (=> b!44329 (= res!26159 (not e!28110))))

(declare-fun res!26160 () Bool)

(assert (=> b!44329 (=> (not res!26160) (not e!28110))))

(assert (=> b!44329 (= res!26160 (validKeyInArray!0 (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!44330 () Bool)

(assert (=> b!44330 (= e!28112 call!3581)))

(declare-fun b!44331 () Bool)

(assert (=> b!44331 (= e!28110 (contains!575 (ite c!5759 (Cons!1207 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) Nil!1208) Nil!1208) (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!44332 () Bool)

(assert (=> b!44332 (= e!28112 call!3581)))

(assert (= (and d!8371 (not res!26161)) b!44329))

(assert (= (and b!44329 res!26160) b!44331))

(assert (= (and b!44329 res!26159) b!44328))

(assert (= (and b!44328 c!5802) b!44330))

(assert (= (and b!44328 (not c!5802)) b!44332))

(assert (= (or b!44330 b!44332) bm!3578))

(assert (=> bm!3578 m!38485))

(declare-fun m!38509 () Bool)

(assert (=> bm!3578 m!38509))

(assert (=> b!44328 m!38485))

(assert (=> b!44328 m!38485))

(assert (=> b!44328 m!38499))

(assert (=> b!44329 m!38485))

(assert (=> b!44329 m!38485))

(assert (=> b!44329 m!38499))

(assert (=> b!44331 m!38485))

(assert (=> b!44331 m!38485))

(declare-fun m!38511 () Bool)

(assert (=> b!44331 m!38511))

(assert (=> bm!3560 d!8371))

(declare-fun b!44526 () Bool)

(declare-fun e!28230 () Bool)

(declare-fun e!28234 () Bool)

(assert (=> b!44526 (= e!28230 e!28234)))

(declare-fun res!26249 () Bool)

(declare-fun call!3625 () Bool)

(assert (=> b!44526 (= res!26249 call!3625)))

(assert (=> b!44526 (=> (not res!26249) (not e!28234))))

(declare-fun b!44527 () Bool)

(declare-fun lt!19590 () ListLongMap!1213)

(declare-fun apply!62 (ListLongMap!1213 (_ BitVec 64)) V!2327)

(assert (=> b!44527 (= e!28234 (= (apply!62 lt!19590 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1815 lt!19302)))))

(declare-fun b!44528 () Bool)

(declare-fun e!28232 () Bool)

(declare-fun e!28229 () Bool)

(assert (=> b!44528 (= e!28232 e!28229)))

(declare-fun res!26250 () Bool)

(assert (=> b!44528 (=> (not res!26250) (not e!28229))))

(declare-fun contains!578 (ListLongMap!1213 (_ BitVec 64)) Bool)

(assert (=> b!44528 (= res!26250 (contains!578 lt!19590 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)))))

(assert (=> b!44528 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1624 (_keys!3464 lt!19302))))))

(declare-fun b!44529 () Bool)

(assert (=> b!44529 (= e!28230 (not call!3625))))

(declare-fun bm!3621 () Bool)

(declare-fun call!3629 () ListLongMap!1213)

(declare-fun getCurrentListMapNoExtraKeys!40 (array!2955 array!2957 (_ BitVec 32) (_ BitVec 32) V!2327 V!2327 (_ BitVec 32) Int) ListLongMap!1213)

(assert (=> bm!3621 (= call!3629 (getCurrentListMapNoExtraKeys!40 (_keys!3464 lt!19302) (_values!1880 lt!19302) (mask!5474 lt!19302) (extraKeys!1788 lt!19302) (zeroValue!1815 lt!19302) (minValue!1815 lt!19302) #b00000000000000000000000000000000 (defaultEntry!1897 lt!19302)))))

(declare-fun bm!3622 () Bool)

(declare-fun call!3630 () Bool)

(assert (=> bm!3622 (= call!3630 (contains!578 lt!19590 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!44530 () Bool)

(declare-fun e!28233 () Bool)

(declare-fun e!28240 () Bool)

(assert (=> b!44530 (= e!28233 e!28240)))

(declare-fun res!26244 () Bool)

(assert (=> b!44530 (= res!26244 call!3630)))

(assert (=> b!44530 (=> (not res!26244) (not e!28240))))

(declare-fun b!44531 () Bool)

(declare-fun e!28239 () ListLongMap!1213)

(declare-fun call!3626 () ListLongMap!1213)

(assert (=> b!44531 (= e!28239 call!3626)))

(declare-fun d!8373 () Bool)

(declare-fun e!28238 () Bool)

(assert (=> d!8373 e!28238))

(declare-fun res!26248 () Bool)

(assert (=> d!8373 (=> (not res!26248) (not e!28238))))

(assert (=> d!8373 (= res!26248 (or (bvsge #b00000000000000000000000000000000 (size!1624 (_keys!3464 lt!19302))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1624 (_keys!3464 lt!19302))))))))

(declare-fun lt!19592 () ListLongMap!1213)

(assert (=> d!8373 (= lt!19590 lt!19592)))

(declare-fun lt!19582 () Unit!1233)

(declare-fun e!28237 () Unit!1233)

(assert (=> d!8373 (= lt!19582 e!28237)))

(declare-fun c!5863 () Bool)

(declare-fun e!28235 () Bool)

(assert (=> d!8373 (= c!5863 e!28235)))

(declare-fun res!26251 () Bool)

(assert (=> d!8373 (=> (not res!26251) (not e!28235))))

(assert (=> d!8373 (= res!26251 (bvslt #b00000000000000000000000000000000 (size!1624 (_keys!3464 lt!19302))))))

(declare-fun e!28231 () ListLongMap!1213)

(assert (=> d!8373 (= lt!19592 e!28231)))

(declare-fun c!5865 () Bool)

(assert (=> d!8373 (= c!5865 (and (not (= (bvand (extraKeys!1788 lt!19302) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1788 lt!19302) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!8373 (validMask!0 (mask!5474 lt!19302))))

(assert (=> d!8373 (= (getCurrentListMap!357 (_keys!3464 lt!19302) (_values!1880 lt!19302) (mask!5474 lt!19302) (extraKeys!1788 lt!19302) (zeroValue!1815 lt!19302) (minValue!1815 lt!19302) #b00000000000000000000000000000000 (defaultEntry!1897 lt!19302)) lt!19590)))

(declare-fun call!3628 () ListLongMap!1213)

(declare-fun c!5862 () Bool)

(declare-fun call!3627 () ListLongMap!1213)

(declare-fun call!3624 () ListLongMap!1213)

(declare-fun bm!3623 () Bool)

(declare-fun +!71 (ListLongMap!1213 tuple2!1636) ListLongMap!1213)

(assert (=> bm!3623 (= call!3627 (+!71 (ite c!5865 call!3629 (ite c!5862 call!3624 call!3628)) (ite (or c!5865 c!5862) (tuple2!1637 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1815 lt!19302)) (tuple2!1637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1815 lt!19302)))))))

(declare-fun b!44532 () Bool)

(assert (=> b!44532 (= e!28240 (= (apply!62 lt!19590 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1815 lt!19302)))))

(declare-fun b!44533 () Bool)

(declare-fun c!5866 () Bool)

(assert (=> b!44533 (= c!5866 (and (not (= (bvand (extraKeys!1788 lt!19302) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1788 lt!19302) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!28236 () ListLongMap!1213)

(assert (=> b!44533 (= e!28236 e!28239)))

(declare-fun b!44534 () Bool)

(assert (=> b!44534 (= e!28235 (validKeyInArray!0 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)))))

(declare-fun b!44535 () Bool)

(declare-fun lt!19598 () Unit!1233)

(assert (=> b!44535 (= e!28237 lt!19598)))

(declare-fun lt!19588 () ListLongMap!1213)

(assert (=> b!44535 (= lt!19588 (getCurrentListMapNoExtraKeys!40 (_keys!3464 lt!19302) (_values!1880 lt!19302) (mask!5474 lt!19302) (extraKeys!1788 lt!19302) (zeroValue!1815 lt!19302) (minValue!1815 lt!19302) #b00000000000000000000000000000000 (defaultEntry!1897 lt!19302)))))

(declare-fun lt!19587 () (_ BitVec 64))

(assert (=> b!44535 (= lt!19587 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19580 () (_ BitVec 64))

(assert (=> b!44535 (= lt!19580 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000))))

(declare-fun lt!19579 () Unit!1233)

(declare-fun addStillContains!38 (ListLongMap!1213 (_ BitVec 64) V!2327 (_ BitVec 64)) Unit!1233)

(assert (=> b!44535 (= lt!19579 (addStillContains!38 lt!19588 lt!19587 (zeroValue!1815 lt!19302) lt!19580))))

(assert (=> b!44535 (contains!578 (+!71 lt!19588 (tuple2!1637 lt!19587 (zeroValue!1815 lt!19302))) lt!19580)))

(declare-fun lt!19589 () Unit!1233)

(assert (=> b!44535 (= lt!19589 lt!19579)))

(declare-fun lt!19593 () ListLongMap!1213)

(assert (=> b!44535 (= lt!19593 (getCurrentListMapNoExtraKeys!40 (_keys!3464 lt!19302) (_values!1880 lt!19302) (mask!5474 lt!19302) (extraKeys!1788 lt!19302) (zeroValue!1815 lt!19302) (minValue!1815 lt!19302) #b00000000000000000000000000000000 (defaultEntry!1897 lt!19302)))))

(declare-fun lt!19600 () (_ BitVec 64))

(assert (=> b!44535 (= lt!19600 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19585 () (_ BitVec 64))

(assert (=> b!44535 (= lt!19585 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000))))

(declare-fun lt!19599 () Unit!1233)

(declare-fun addApplyDifferent!38 (ListLongMap!1213 (_ BitVec 64) V!2327 (_ BitVec 64)) Unit!1233)

(assert (=> b!44535 (= lt!19599 (addApplyDifferent!38 lt!19593 lt!19600 (minValue!1815 lt!19302) lt!19585))))

(assert (=> b!44535 (= (apply!62 (+!71 lt!19593 (tuple2!1637 lt!19600 (minValue!1815 lt!19302))) lt!19585) (apply!62 lt!19593 lt!19585))))

(declare-fun lt!19594 () Unit!1233)

(assert (=> b!44535 (= lt!19594 lt!19599)))

(declare-fun lt!19583 () ListLongMap!1213)

(assert (=> b!44535 (= lt!19583 (getCurrentListMapNoExtraKeys!40 (_keys!3464 lt!19302) (_values!1880 lt!19302) (mask!5474 lt!19302) (extraKeys!1788 lt!19302) (zeroValue!1815 lt!19302) (minValue!1815 lt!19302) #b00000000000000000000000000000000 (defaultEntry!1897 lt!19302)))))

(declare-fun lt!19591 () (_ BitVec 64))

(assert (=> b!44535 (= lt!19591 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19595 () (_ BitVec 64))

(assert (=> b!44535 (= lt!19595 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000))))

(declare-fun lt!19581 () Unit!1233)

(assert (=> b!44535 (= lt!19581 (addApplyDifferent!38 lt!19583 lt!19591 (zeroValue!1815 lt!19302) lt!19595))))

(assert (=> b!44535 (= (apply!62 (+!71 lt!19583 (tuple2!1637 lt!19591 (zeroValue!1815 lt!19302))) lt!19595) (apply!62 lt!19583 lt!19595))))

(declare-fun lt!19586 () Unit!1233)

(assert (=> b!44535 (= lt!19586 lt!19581)))

(declare-fun lt!19596 () ListLongMap!1213)

(assert (=> b!44535 (= lt!19596 (getCurrentListMapNoExtraKeys!40 (_keys!3464 lt!19302) (_values!1880 lt!19302) (mask!5474 lt!19302) (extraKeys!1788 lt!19302) (zeroValue!1815 lt!19302) (minValue!1815 lt!19302) #b00000000000000000000000000000000 (defaultEntry!1897 lt!19302)))))

(declare-fun lt!19597 () (_ BitVec 64))

(assert (=> b!44535 (= lt!19597 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19584 () (_ BitVec 64))

(assert (=> b!44535 (= lt!19584 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000))))

(assert (=> b!44535 (= lt!19598 (addApplyDifferent!38 lt!19596 lt!19597 (minValue!1815 lt!19302) lt!19584))))

(assert (=> b!44535 (= (apply!62 (+!71 lt!19596 (tuple2!1637 lt!19597 (minValue!1815 lt!19302))) lt!19584) (apply!62 lt!19596 lt!19584))))

(declare-fun b!44536 () Bool)

(declare-fun Unit!1242 () Unit!1233)

(assert (=> b!44536 (= e!28237 Unit!1242)))

(declare-fun b!44537 () Bool)

(assert (=> b!44537 (= e!28233 (not call!3630))))

(declare-fun b!44538 () Bool)

(declare-fun get!800 (ValueCell!705 V!2327) V!2327)

(assert (=> b!44538 (= e!28229 (= (apply!62 lt!19590 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)) (get!800 (select (arr!1422 (_values!1880 lt!19302)) #b00000000000000000000000000000000) (dynLambda!266 (defaultEntry!1897 lt!19302) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!44538 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1625 (_values!1880 lt!19302))))))

(assert (=> b!44538 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1624 (_keys!3464 lt!19302))))))

(declare-fun b!44539 () Bool)

(assert (=> b!44539 (= e!28231 e!28236)))

(assert (=> b!44539 (= c!5862 (and (not (= (bvand (extraKeys!1788 lt!19302) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1788 lt!19302) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!44540 () Bool)

(declare-fun res!26245 () Bool)

(assert (=> b!44540 (=> (not res!26245) (not e!28238))))

(assert (=> b!44540 (= res!26245 e!28232)))

(declare-fun res!26247 () Bool)

(assert (=> b!44540 (=> res!26247 e!28232)))

(declare-fun e!28241 () Bool)

(assert (=> b!44540 (= res!26247 (not e!28241))))

(declare-fun res!26246 () Bool)

(assert (=> b!44540 (=> (not res!26246) (not e!28241))))

(assert (=> b!44540 (= res!26246 (bvslt #b00000000000000000000000000000000 (size!1624 (_keys!3464 lt!19302))))))

(declare-fun b!44541 () Bool)

(assert (=> b!44541 (= e!28238 e!28230)))

(declare-fun c!5867 () Bool)

(assert (=> b!44541 (= c!5867 (not (= (bvand (extraKeys!1788 lt!19302) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!44542 () Bool)

(declare-fun res!26243 () Bool)

(assert (=> b!44542 (=> (not res!26243) (not e!28238))))

(assert (=> b!44542 (= res!26243 e!28233)))

(declare-fun c!5864 () Bool)

(assert (=> b!44542 (= c!5864 (not (= (bvand (extraKeys!1788 lt!19302) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!3624 () Bool)

(assert (=> bm!3624 (= call!3628 call!3624)))

(declare-fun b!44543 () Bool)

(assert (=> b!44543 (= e!28239 call!3628)))

(declare-fun b!44544 () Bool)

(assert (=> b!44544 (= e!28236 call!3626)))

(declare-fun b!44545 () Bool)

(assert (=> b!44545 (= e!28241 (validKeyInArray!0 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)))))

(declare-fun bm!3625 () Bool)

(assert (=> bm!3625 (= call!3624 call!3629)))

(declare-fun bm!3626 () Bool)

(assert (=> bm!3626 (= call!3625 (contains!578 lt!19590 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!44546 () Bool)

(assert (=> b!44546 (= e!28231 (+!71 call!3627 (tuple2!1637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1815 lt!19302))))))

(declare-fun bm!3627 () Bool)

(assert (=> bm!3627 (= call!3626 call!3627)))

(assert (= (and d!8373 c!5865) b!44546))

(assert (= (and d!8373 (not c!5865)) b!44539))

(assert (= (and b!44539 c!5862) b!44544))

(assert (= (and b!44539 (not c!5862)) b!44533))

(assert (= (and b!44533 c!5866) b!44531))

(assert (= (and b!44533 (not c!5866)) b!44543))

(assert (= (or b!44531 b!44543) bm!3624))

(assert (= (or b!44544 bm!3624) bm!3625))

(assert (= (or b!44544 b!44531) bm!3627))

(assert (= (or b!44546 bm!3625) bm!3621))

(assert (= (or b!44546 bm!3627) bm!3623))

(assert (= (and d!8373 res!26251) b!44534))

(assert (= (and d!8373 c!5863) b!44535))

(assert (= (and d!8373 (not c!5863)) b!44536))

(assert (= (and d!8373 res!26248) b!44540))

(assert (= (and b!44540 res!26246) b!44545))

(assert (= (and b!44540 (not res!26247)) b!44528))

(assert (= (and b!44528 res!26250) b!44538))

(assert (= (and b!44540 res!26245) b!44542))

(assert (= (and b!44542 c!5864) b!44530))

(assert (= (and b!44542 (not c!5864)) b!44537))

(assert (= (and b!44530 res!26244) b!44532))

(assert (= (or b!44530 b!44537) bm!3622))

(assert (= (and b!44542 res!26243) b!44541))

(assert (= (and b!44541 c!5867) b!44526))

(assert (= (and b!44541 (not c!5867)) b!44529))

(assert (= (and b!44526 res!26249) b!44527))

(assert (= (or b!44526 b!44529) bm!3626))

(declare-fun b_lambda!2323 () Bool)

(assert (=> (not b_lambda!2323) (not b!44538)))

(declare-fun tb!1009 () Bool)

(declare-fun t!4236 () Bool)

(assert (=> (and start!6738 (= defaultEntry!470 (defaultEntry!1897 lt!19302)) t!4236) tb!1009))

(declare-fun result!1761 () Bool)

(assert (=> tb!1009 (= result!1761 tp_is_empty!1905)))

(assert (=> b!44538 t!4236))

(declare-fun b_and!2713 () Bool)

(assert (= b_and!2705 (and (=> t!4236 result!1761) b_and!2713)))

(assert (=> b!44534 m!38491))

(assert (=> b!44534 m!38491))

(assert (=> b!44534 m!38495))

(declare-fun m!38647 () Bool)

(assert (=> b!44527 m!38647))

(declare-fun m!38651 () Bool)

(assert (=> b!44535 m!38651))

(declare-fun m!38655 () Bool)

(assert (=> b!44535 m!38655))

(declare-fun m!38659 () Bool)

(assert (=> b!44535 m!38659))

(declare-fun m!38661 () Bool)

(assert (=> b!44535 m!38661))

(declare-fun m!38665 () Bool)

(assert (=> b!44535 m!38665))

(declare-fun m!38667 () Bool)

(assert (=> b!44535 m!38667))

(declare-fun m!38671 () Bool)

(assert (=> b!44535 m!38671))

(declare-fun m!38673 () Bool)

(assert (=> b!44535 m!38673))

(declare-fun m!38677 () Bool)

(assert (=> b!44535 m!38677))

(declare-fun m!38681 () Bool)

(assert (=> b!44535 m!38681))

(assert (=> b!44535 m!38655))

(declare-fun m!38683 () Bool)

(assert (=> b!44535 m!38683))

(assert (=> b!44535 m!38659))

(declare-fun m!38685 () Bool)

(assert (=> b!44535 m!38685))

(declare-fun m!38687 () Bool)

(assert (=> b!44535 m!38687))

(assert (=> b!44535 m!38685))

(declare-fun m!38689 () Bool)

(assert (=> b!44535 m!38689))

(assert (=> b!44535 m!38491))

(assert (=> b!44535 m!38681))

(declare-fun m!38691 () Bool)

(assert (=> b!44535 m!38691))

(declare-fun m!38693 () Bool)

(assert (=> b!44535 m!38693))

(declare-fun m!38695 () Bool)

(assert (=> b!44546 m!38695))

(assert (=> b!44538 m!38491))

(declare-fun m!38697 () Bool)

(assert (=> b!44538 m!38697))

(declare-fun m!38699 () Bool)

(assert (=> b!44538 m!38699))

(declare-fun m!38701 () Bool)

(assert (=> b!44538 m!38701))

(declare-fun m!38703 () Bool)

(assert (=> b!44538 m!38703))

(assert (=> b!44538 m!38491))

(assert (=> b!44538 m!38699))

(assert (=> b!44538 m!38701))

(declare-fun m!38705 () Bool)

(assert (=> bm!3626 m!38705))

(declare-fun m!38707 () Bool)

(assert (=> b!44532 m!38707))

(assert (=> b!44545 m!38491))

(assert (=> b!44545 m!38491))

(assert (=> b!44545 m!38495))

(assert (=> bm!3621 m!38687))

(declare-fun m!38713 () Bool)

(assert (=> bm!3622 m!38713))

(declare-fun m!38715 () Bool)

(assert (=> bm!3623 m!38715))

(assert (=> b!44528 m!38491))

(assert (=> b!44528 m!38491))

(declare-fun m!38717 () Bool)

(assert (=> b!44528 m!38717))

(declare-fun m!38719 () Bool)

(assert (=> d!8373 m!38719))

(assert (=> d!8323 d!8373))

(declare-fun b!44558 () Bool)

(declare-fun e!28250 () (_ BitVec 32))

(assert (=> b!44558 (= e!28250 #b00000000000000000000000000000000)))

(declare-fun b!44559 () Bool)

(declare-fun e!28249 () (_ BitVec 32))

(declare-fun call!3632 () (_ BitVec 32))

(assert (=> b!44559 (= e!28249 (bvadd #b00000000000000000000000000000001 call!3632))))

(declare-fun b!44560 () Bool)

(assert (=> b!44560 (= e!28249 call!3632)))

(declare-fun bm!3629 () Bool)

(assert (=> bm!3629 (= call!3632 (arrayCountValidKeys!0 lt!19304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun d!8429 () Bool)

(declare-fun lt!19604 () (_ BitVec 32))

(assert (=> d!8429 (and (bvsge lt!19604 #b00000000000000000000000000000000) (bvsle lt!19604 (bvsub (size!1624 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!8429 (= lt!19604 e!28250)))

(declare-fun c!5872 () Bool)

(assert (=> d!8429 (= c!5872 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8429 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1624 lt!19304)))))

(assert (=> d!8429 (= (arrayCountValidKeys!0 lt!19304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!19604)))

(declare-fun b!44561 () Bool)

(assert (=> b!44561 (= e!28250 e!28249)))

(declare-fun c!5873 () Bool)

(assert (=> b!44561 (= c!5873 (validKeyInArray!0 (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!8429 c!5872) b!44558))

(assert (= (and d!8429 (not c!5872)) b!44561))

(assert (= (and b!44561 c!5873) b!44559))

(assert (= (and b!44561 (not c!5873)) b!44560))

(assert (= (or b!44559 b!44560) bm!3629))

(declare-fun m!38721 () Bool)

(assert (=> bm!3629 m!38721))

(assert (=> b!44561 m!38485))

(assert (=> b!44561 m!38485))

(assert (=> b!44561 m!38499))

(assert (=> bm!3572 d!8429))

(declare-fun b!44562 () Bool)

(declare-fun e!28252 () (_ BitVec 32))

(assert (=> b!44562 (= e!28252 #b00000000000000000000000000000000)))

(declare-fun b!44563 () Bool)

(declare-fun e!28251 () (_ BitVec 32))

(declare-fun call!3633 () (_ BitVec 32))

(assert (=> b!44563 (= e!28251 (bvadd #b00000000000000000000000000000001 call!3633))))

(declare-fun b!44564 () Bool)

(assert (=> b!44564 (= e!28251 call!3633)))

(declare-fun bm!3630 () Bool)

(assert (=> bm!3630 (= call!3633 (arrayCountValidKeys!0 (_keys!3464 lt!19302) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1624 (_keys!3464 lt!19302))))))

(declare-fun d!8431 () Bool)

(declare-fun lt!19605 () (_ BitVec 32))

(assert (=> d!8431 (and (bvsge lt!19605 #b00000000000000000000000000000000) (bvsle lt!19605 (bvsub (size!1624 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)))))

(assert (=> d!8431 (= lt!19605 e!28252)))

(declare-fun c!5874 () Bool)

(assert (=> d!8431 (= c!5874 (bvsge #b00000000000000000000000000000000 (size!1624 (_keys!3464 lt!19302))))))

(assert (=> d!8431 (and (bvsle #b00000000000000000000000000000000 (size!1624 (_keys!3464 lt!19302))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1624 (_keys!3464 lt!19302)) (size!1624 (_keys!3464 lt!19302))))))

(assert (=> d!8431 (= (arrayCountValidKeys!0 (_keys!3464 lt!19302) #b00000000000000000000000000000000 (size!1624 (_keys!3464 lt!19302))) lt!19605)))

(declare-fun b!44565 () Bool)

(assert (=> b!44565 (= e!28252 e!28251)))

(declare-fun c!5875 () Bool)

(assert (=> b!44565 (= c!5875 (validKeyInArray!0 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)))))

(assert (= (and d!8431 c!5874) b!44562))

(assert (= (and d!8431 (not c!5874)) b!44565))

(assert (= (and b!44565 c!5875) b!44563))

(assert (= (and b!44565 (not c!5875)) b!44564))

(assert (= (or b!44563 b!44564) bm!3630))

(declare-fun m!38723 () Bool)

(assert (=> bm!3630 m!38723))

(assert (=> b!44565 m!38491))

(assert (=> b!44565 m!38491))

(assert (=> b!44565 m!38495))

(assert (=> b!44207 d!8431))

(assert (=> b!44141 d!8363))

(assert (=> b!44233 d!8363))

(declare-fun b!44570 () Bool)

(declare-fun e!28255 () Bool)

(declare-fun call!3634 () Bool)

(assert (=> b!44570 (= e!28255 call!3634)))

(declare-fun b!44571 () Bool)

(declare-fun e!28256 () Bool)

(assert (=> b!44571 (= e!28256 call!3634)))

(declare-fun b!44572 () Bool)

(declare-fun e!28257 () Bool)

(assert (=> b!44572 (= e!28257 e!28255)))

(declare-fun c!5878 () Bool)

(assert (=> b!44572 (= c!5878 (validKeyInArray!0 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)))))

(declare-fun d!8433 () Bool)

(declare-fun res!26256 () Bool)

(assert (=> d!8433 (=> res!26256 e!28257)))

(assert (=> d!8433 (= res!26256 (bvsge #b00000000000000000000000000000000 (size!1624 (_keys!3464 lt!19302))))))

(assert (=> d!8433 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3464 lt!19302) (mask!5474 lt!19302)) e!28257)))

(declare-fun b!44573 () Bool)

(assert (=> b!44573 (= e!28255 e!28256)))

(declare-fun lt!19607 () (_ BitVec 64))

(assert (=> b!44573 (= lt!19607 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000))))

(declare-fun lt!19608 () Unit!1233)

(assert (=> b!44573 (= lt!19608 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3464 lt!19302) lt!19607 #b00000000000000000000000000000000))))

(assert (=> b!44573 (arrayContainsKey!0 (_keys!3464 lt!19302) lt!19607 #b00000000000000000000000000000000)))

(declare-fun lt!19606 () Unit!1233)

(assert (=> b!44573 (= lt!19606 lt!19608)))

(declare-fun res!26255 () Bool)

(assert (=> b!44573 (= res!26255 (= (seekEntryOrOpen!0 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000) (_keys!3464 lt!19302) (mask!5474 lt!19302)) (Found!203 #b00000000000000000000000000000000)))))

(assert (=> b!44573 (=> (not res!26255) (not e!28256))))

(declare-fun bm!3631 () Bool)

(assert (=> bm!3631 (= call!3634 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3464 lt!19302) (mask!5474 lt!19302)))))

(assert (= (and d!8433 (not res!26256)) b!44572))

(assert (= (and b!44572 c!5878) b!44573))

(assert (= (and b!44572 (not c!5878)) b!44570))

(assert (= (and b!44573 res!26255) b!44571))

(assert (= (or b!44571 b!44570) bm!3631))

(assert (=> b!44572 m!38491))

(assert (=> b!44572 m!38491))

(assert (=> b!44572 m!38495))

(assert (=> b!44573 m!38491))

(declare-fun m!38725 () Bool)

(assert (=> b!44573 m!38725))

(declare-fun m!38727 () Bool)

(assert (=> b!44573 m!38727))

(assert (=> b!44573 m!38491))

(declare-fun m!38729 () Bool)

(assert (=> b!44573 m!38729))

(declare-fun m!38731 () Bool)

(assert (=> bm!3631 m!38731))

(assert (=> b!44208 d!8433))

(declare-fun d!8435 () Bool)

(assert (=> d!8435 (arrayContainsKey!0 lt!19304 lt!19368 #b00000000000000000000000000000000)))

(declare-fun lt!19611 () Unit!1233)

(declare-fun choose!13 (array!2955 (_ BitVec 64) (_ BitVec 32)) Unit!1233)

(assert (=> d!8435 (= lt!19611 (choose!13 lt!19304 lt!19368 #b00000000000000000000000000000000))))

(assert (=> d!8435 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!8435 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19304 lt!19368 #b00000000000000000000000000000000) lt!19611)))

(declare-fun bs!2023 () Bool)

(assert (= bs!2023 d!8435))

(assert (=> bs!2023 m!38383))

(declare-fun m!38733 () Bool)

(assert (=> bs!2023 m!38733))

(assert (=> b!44142 d!8435))

(declare-fun d!8439 () Bool)

(declare-fun res!26261 () Bool)

(declare-fun e!28263 () Bool)

(assert (=> d!8439 (=> res!26261 e!28263)))

(assert (=> d!8439 (= res!26261 (= (select (arr!1421 lt!19304) #b00000000000000000000000000000000) lt!19368))))

(assert (=> d!8439 (= (arrayContainsKey!0 lt!19304 lt!19368 #b00000000000000000000000000000000) e!28263)))

(declare-fun b!44580 () Bool)

(declare-fun e!28264 () Bool)

(assert (=> b!44580 (= e!28263 e!28264)))

(declare-fun res!26262 () Bool)

(assert (=> b!44580 (=> (not res!26262) (not e!28264))))

(assert (=> b!44580 (= res!26262 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1624 lt!19304)))))

(declare-fun b!44581 () Bool)

(assert (=> b!44581 (= e!28264 (arrayContainsKey!0 lt!19304 lt!19368 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8439 (not res!26261)) b!44580))

(assert (= (and b!44580 res!26262) b!44581))

(assert (=> d!8439 m!38377))

(declare-fun m!38735 () Bool)

(assert (=> b!44581 m!38735))

(assert (=> b!44142 d!8439))

(declare-fun b!44609 () Bool)

(declare-fun e!28283 () SeekEntryResult!203)

(declare-fun lt!19627 () SeekEntryResult!203)

(assert (=> b!44609 (= e!28283 (Found!203 (index!2936 lt!19627)))))

(declare-fun b!44610 () Bool)

(declare-fun c!5891 () Bool)

(declare-fun lt!19626 () (_ BitVec 64))

(assert (=> b!44610 (= c!5891 (= lt!19626 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!28282 () SeekEntryResult!203)

(assert (=> b!44610 (= e!28283 e!28282)))

(declare-fun b!44611 () Bool)

(declare-fun e!28284 () SeekEntryResult!203)

(assert (=> b!44611 (= e!28284 Undefined!203)))

(declare-fun b!44612 () Bool)

(assert (=> b!44612 (= e!28284 e!28283)))

(assert (=> b!44612 (= lt!19626 (select (arr!1421 lt!19304) (index!2936 lt!19627)))))

(declare-fun c!5890 () Bool)

(assert (=> b!44612 (= c!5890 (= lt!19626 (select (arr!1421 lt!19304) #b00000000000000000000000000000000)))))

(declare-fun d!8441 () Bool)

(declare-fun lt!19625 () SeekEntryResult!203)

(assert (=> d!8441 (and (or ((_ is Undefined!203) lt!19625) (not ((_ is Found!203) lt!19625)) (and (bvsge (index!2935 lt!19625) #b00000000000000000000000000000000) (bvslt (index!2935 lt!19625) (size!1624 lt!19304)))) (or ((_ is Undefined!203) lt!19625) ((_ is Found!203) lt!19625) (not ((_ is MissingZero!203) lt!19625)) (and (bvsge (index!2934 lt!19625) #b00000000000000000000000000000000) (bvslt (index!2934 lt!19625) (size!1624 lt!19304)))) (or ((_ is Undefined!203) lt!19625) ((_ is Found!203) lt!19625) ((_ is MissingZero!203) lt!19625) (not ((_ is MissingVacant!203) lt!19625)) (and (bvsge (index!2937 lt!19625) #b00000000000000000000000000000000) (bvslt (index!2937 lt!19625) (size!1624 lt!19304)))) (or ((_ is Undefined!203) lt!19625) (ite ((_ is Found!203) lt!19625) (= (select (arr!1421 lt!19304) (index!2935 lt!19625)) (select (arr!1421 lt!19304) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!203) lt!19625) (= (select (arr!1421 lt!19304) (index!2934 lt!19625)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!203) lt!19625) (= (select (arr!1421 lt!19304) (index!2937 lt!19625)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!8441 (= lt!19625 e!28284)))

(declare-fun c!5892 () Bool)

(assert (=> d!8441 (= c!5892 (and ((_ is Intermediate!203) lt!19627) (undefined!1015 lt!19627)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2955 (_ BitVec 32)) SeekEntryResult!203)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!8441 (= lt!19627 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) mask!853) (select (arr!1421 lt!19304) #b00000000000000000000000000000000) lt!19304 mask!853))))

(assert (=> d!8441 (validMask!0 mask!853)))

(assert (=> d!8441 (= (seekEntryOrOpen!0 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) lt!19304 mask!853) lt!19625)))

(declare-fun b!44613 () Bool)

(assert (=> b!44613 (= e!28282 (MissingZero!203 (index!2936 lt!19627)))))

(declare-fun b!44614 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2955 (_ BitVec 32)) SeekEntryResult!203)

(assert (=> b!44614 (= e!28282 (seekKeyOrZeroReturnVacant!0 (x!8357 lt!19627) (index!2936 lt!19627) (index!2936 lt!19627) (select (arr!1421 lt!19304) #b00000000000000000000000000000000) lt!19304 mask!853))))

(assert (= (and d!8441 c!5892) b!44611))

(assert (= (and d!8441 (not c!5892)) b!44612))

(assert (= (and b!44612 c!5890) b!44609))

(assert (= (and b!44612 (not c!5890)) b!44610))

(assert (= (and b!44610 c!5891) b!44613))

(assert (= (and b!44610 (not c!5891)) b!44614))

(declare-fun m!38757 () Bool)

(assert (=> b!44612 m!38757))

(declare-fun m!38759 () Bool)

(assert (=> d!8441 m!38759))

(declare-fun m!38761 () Bool)

(assert (=> d!8441 m!38761))

(declare-fun m!38763 () Bool)

(assert (=> d!8441 m!38763))

(assert (=> d!8441 m!38377))

(declare-fun m!38765 () Bool)

(assert (=> d!8441 m!38765))

(declare-fun m!38767 () Bool)

(assert (=> d!8441 m!38767))

(assert (=> d!8441 m!38377))

(assert (=> d!8441 m!38763))

(assert (=> d!8441 m!38295))

(assert (=> b!44614 m!38377))

(declare-fun m!38769 () Bool)

(assert (=> b!44614 m!38769))

(assert (=> b!44142 d!8441))

(declare-fun b!44635 () Bool)

(declare-fun res!26281 () Bool)

(declare-fun e!28293 () Bool)

(assert (=> b!44635 (=> (not res!26281) (not e!28293))))

(assert (=> b!44635 (= res!26281 (and (= (size!1625 (_values!1880 lt!19302)) (bvadd (mask!5474 lt!19302) #b00000000000000000000000000000001)) (= (size!1624 (_keys!3464 lt!19302)) (size!1625 (_values!1880 lt!19302))) (bvsge (_size!244 lt!19302) #b00000000000000000000000000000000) (bvsle (_size!244 lt!19302) (bvadd (mask!5474 lt!19302) #b00000000000000000000000000000001))))))

(declare-fun b!44637 () Bool)

(declare-fun res!26280 () Bool)

(assert (=> b!44637 (=> (not res!26280) (not e!28293))))

(declare-fun size!1641 (LongMapFixedSize!390) (_ BitVec 32))

(assert (=> b!44637 (= res!26280 (= (size!1641 lt!19302) (bvadd (_size!244 lt!19302) (bvsdiv (bvadd (extraKeys!1788 lt!19302) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!44638 () Bool)

(assert (=> b!44638 (= e!28293 (and (bvsge (extraKeys!1788 lt!19302) #b00000000000000000000000000000000) (bvsle (extraKeys!1788 lt!19302) #b00000000000000000000000000000011) (bvsge (_vacant!244 lt!19302) #b00000000000000000000000000000000)))))

(declare-fun d!8453 () Bool)

(declare-fun res!26279 () Bool)

(assert (=> d!8453 (=> (not res!26279) (not e!28293))))

(assert (=> d!8453 (= res!26279 (validMask!0 (mask!5474 lt!19302)))))

(assert (=> d!8453 (= (simpleValid!32 lt!19302) e!28293)))

(declare-fun b!44636 () Bool)

(declare-fun res!26278 () Bool)

(assert (=> b!44636 (=> (not res!26278) (not e!28293))))

(assert (=> b!44636 (= res!26278 (bvsge (size!1641 lt!19302) (_size!244 lt!19302)))))

(assert (= (and d!8453 res!26279) b!44635))

(assert (= (and b!44635 res!26281) b!44636))

(assert (= (and b!44636 res!26278) b!44637))

(assert (= (and b!44637 res!26280) b!44638))

(declare-fun m!38771 () Bool)

(assert (=> b!44637 m!38771))

(assert (=> d!8453 m!38719))

(assert (=> b!44636 m!38771))

(assert (=> d!8303 d!8453))

(assert (=> d!8319 d!8295))

(declare-fun d!8455 () Bool)

(assert (=> d!8455 (arrayNoDuplicates!0 lt!19304 #b00000000000000000000000000000000 Nil!1208)))

(assert (=> d!8455 true))

(declare-fun res!26284 () Unit!1233)

(assert (=> d!8455 (= (choose!111 lt!19304 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1208) res!26284)))

(declare-fun bs!2026 () Bool)

(assert (= bs!2026 d!8455))

(assert (=> bs!2026 m!38319))

(assert (=> d!8319 d!8455))

(assert (=> d!8329 d!8309))

(declare-fun d!8457 () Bool)

(assert (=> d!8457 (= (arrayCountValidKeys!0 lt!19304 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(assert (=> d!8457 true))

(declare-fun _$88!61 () Unit!1233)

(assert (=> d!8457 (= (choose!59 lt!19304 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) _$88!61)))

(declare-fun bs!2027 () Bool)

(assert (= bs!2027 d!8457))

(assert (=> bs!2027 m!38305))

(assert (=> d!8329 d!8457))

(check-sat (not d!8455) (not b!44532) (not bm!3626) (not b_next!1515) (not bm!3621) (not d!8453) (not bm!3629) tp_is_empty!1905 (not b!44327) (not bm!3630) (not b!44637) (not bm!3622) (not b!44315) (not b!44527) (not b!44534) (not b_lambda!2319) (not bm!3576) (not b!44331) b_and!2713 (not b!44320) (not b!44319) (not b!44546) (not b!44538) (not b!44565) (not b!44326) (not b!44573) (not b!44572) (not b!44528) (not b!44561) (not b!44310) (not b!44318) (not b!44322) (not b!44535) (not b!44614) (not d!8457) (not bm!3631) (not d!8435) (not bm!3577) (not b!44581) (not b!44329) (not b!44636) (not b!44328) (not d!8441) (not d!8373) (not b!44308) (not bm!3623) (not d!8355) (not b!44545) (not b_lambda!2323) (not bm!3578) (not d!8365))
(check-sat b_and!2713 (not b_next!1515))
(get-model)

(declare-fun d!8467 () Bool)

(declare-fun lt!19701 () (_ BitVec 32))

(assert (=> d!8467 (and (or (bvslt lt!19701 #b00000000000000000000000000000000) (bvsge lt!19701 (size!1624 lt!19304)) (and (bvsge lt!19701 #b00000000000000000000000000000000) (bvslt lt!19701 (size!1624 lt!19304)))) (bvsge lt!19701 #b00000000000000000000000000000000) (bvslt lt!19701 (size!1624 lt!19304)) (= (select (arr!1421 lt!19304) lt!19701) (_1!829 lt!19310)))))

(declare-fun e!28340 () (_ BitVec 32))

(assert (=> d!8467 (= lt!19701 e!28340)))

(declare-fun c!5913 () Bool)

(assert (=> d!8467 (= c!5913 (= (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (_1!829 lt!19310)))))

(assert (=> d!8467 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1624 lt!19304)) (bvslt (size!1624 lt!19304) #b01111111111111111111111111111111))))

(assert (=> d!8467 (= (arrayScanForKey!0 lt!19304 (_1!829 lt!19310) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!19701)))

(declare-fun b!44714 () Bool)

(assert (=> b!44714 (= e!28340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))

(declare-fun b!44715 () Bool)

(assert (=> b!44715 (= e!28340 (arrayScanForKey!0 lt!19304 (_1!829 lt!19310) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!8467 c!5913) b!44714))

(assert (= (and d!8467 (not c!5913)) b!44715))

(declare-fun m!38849 () Bool)

(assert (=> d!8467 m!38849))

(declare-fun m!38851 () Bool)

(assert (=> d!8467 m!38851))

(declare-fun m!38853 () Bool)

(assert (=> b!44715 m!38853))

(assert (=> b!44310 d!8467))

(declare-fun d!8469 () Bool)

(declare-fun e!28346 () Bool)

(assert (=> d!8469 e!28346))

(declare-fun res!26334 () Bool)

(assert (=> d!8469 (=> res!26334 e!28346)))

(declare-fun lt!19711 () Bool)

(assert (=> d!8469 (= res!26334 (not lt!19711))))

(declare-fun lt!19712 () Bool)

(assert (=> d!8469 (= lt!19711 lt!19712)))

(declare-fun lt!19713 () Unit!1233)

(declare-fun e!28345 () Unit!1233)

(assert (=> d!8469 (= lt!19713 e!28345)))

(declare-fun c!5916 () Bool)

(assert (=> d!8469 (= c!5916 lt!19712)))

(declare-fun containsKey!75 (List!1210 (_ BitVec 64)) Bool)

(assert (=> d!8469 (= lt!19712 (containsKey!75 (toList!622 lt!19590) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8469 (= (contains!578 lt!19590 #b0000000000000000000000000000000000000000000000000000000000000000) lt!19711)))

(declare-fun b!44722 () Bool)

(declare-fun lt!19710 () Unit!1233)

(assert (=> b!44722 (= e!28345 lt!19710)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!63 (List!1210 (_ BitVec 64)) Unit!1233)

(assert (=> b!44722 (= lt!19710 (lemmaContainsKeyImpliesGetValueByKeyDefined!63 (toList!622 lt!19590) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!113 0))(
  ( (Some!112 (v!2092 V!2327)) (None!111) )
))
(declare-fun isDefined!64 (Option!113) Bool)

(declare-fun getValueByKey!107 (List!1210 (_ BitVec 64)) Option!113)

(assert (=> b!44722 (isDefined!64 (getValueByKey!107 (toList!622 lt!19590) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!44723 () Bool)

(declare-fun Unit!1244 () Unit!1233)

(assert (=> b!44723 (= e!28345 Unit!1244)))

(declare-fun b!44724 () Bool)

(assert (=> b!44724 (= e!28346 (isDefined!64 (getValueByKey!107 (toList!622 lt!19590) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!8469 c!5916) b!44722))

(assert (= (and d!8469 (not c!5916)) b!44723))

(assert (= (and d!8469 (not res!26334)) b!44724))

(declare-fun m!38855 () Bool)

(assert (=> d!8469 m!38855))

(declare-fun m!38857 () Bool)

(assert (=> b!44722 m!38857))

(declare-fun m!38859 () Bool)

(assert (=> b!44722 m!38859))

(assert (=> b!44722 m!38859))

(declare-fun m!38861 () Bool)

(assert (=> b!44722 m!38861))

(assert (=> b!44724 m!38859))

(assert (=> b!44724 m!38859))

(assert (=> b!44724 m!38861))

(assert (=> bm!3622 d!8469))

(declare-fun d!8471 () Bool)

(declare-fun e!28349 () Bool)

(assert (=> d!8471 e!28349))

(declare-fun res!26339 () Bool)

(assert (=> d!8471 (=> (not res!26339) (not e!28349))))

(declare-fun lt!19723 () ListLongMap!1213)

(assert (=> d!8471 (= res!26339 (contains!578 lt!19723 (_1!829 (tuple2!1637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1815 lt!19302)))))))

(declare-fun lt!19724 () List!1210)

(assert (=> d!8471 (= lt!19723 (ListLongMap!1214 lt!19724))))

(declare-fun lt!19722 () Unit!1233)

(declare-fun lt!19725 () Unit!1233)

(assert (=> d!8471 (= lt!19722 lt!19725)))

(assert (=> d!8471 (= (getValueByKey!107 lt!19724 (_1!829 (tuple2!1637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1815 lt!19302)))) (Some!112 (_2!829 (tuple2!1637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1815 lt!19302)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!31 (List!1210 (_ BitVec 64) V!2327) Unit!1233)

(assert (=> d!8471 (= lt!19725 (lemmaContainsTupThenGetReturnValue!31 lt!19724 (_1!829 (tuple2!1637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1815 lt!19302))) (_2!829 (tuple2!1637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1815 lt!19302)))))))

(declare-fun insertStrictlySorted!28 (List!1210 (_ BitVec 64) V!2327) List!1210)

(assert (=> d!8471 (= lt!19724 (insertStrictlySorted!28 (toList!622 call!3627) (_1!829 (tuple2!1637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1815 lt!19302))) (_2!829 (tuple2!1637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1815 lt!19302)))))))

(assert (=> d!8471 (= (+!71 call!3627 (tuple2!1637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1815 lt!19302))) lt!19723)))

(declare-fun b!44729 () Bool)

(declare-fun res!26340 () Bool)

(assert (=> b!44729 (=> (not res!26340) (not e!28349))))

(assert (=> b!44729 (= res!26340 (= (getValueByKey!107 (toList!622 lt!19723) (_1!829 (tuple2!1637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1815 lt!19302)))) (Some!112 (_2!829 (tuple2!1637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1815 lt!19302))))))))

(declare-fun b!44730 () Bool)

(declare-fun contains!580 (List!1210 tuple2!1636) Bool)

(assert (=> b!44730 (= e!28349 (contains!580 (toList!622 lt!19723) (tuple2!1637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1815 lt!19302))))))

(assert (= (and d!8471 res!26339) b!44729))

(assert (= (and b!44729 res!26340) b!44730))

(declare-fun m!38863 () Bool)

(assert (=> d!8471 m!38863))

(declare-fun m!38865 () Bool)

(assert (=> d!8471 m!38865))

(declare-fun m!38867 () Bool)

(assert (=> d!8471 m!38867))

(declare-fun m!38869 () Bool)

(assert (=> d!8471 m!38869))

(declare-fun m!38871 () Bool)

(assert (=> b!44729 m!38871))

(declare-fun m!38873 () Bool)

(assert (=> b!44730 m!38873))

(assert (=> b!44546 d!8471))

(declare-fun d!8473 () Bool)

(assert (=> d!8473 (= (validKeyInArray!0 (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!44329 d!8473))

(declare-fun d!8475 () Bool)

(declare-fun get!802 (Option!113) V!2327)

(assert (=> d!8475 (= (apply!62 lt!19590 #b0000000000000000000000000000000000000000000000000000000000000000) (get!802 (getValueByKey!107 (toList!622 lt!19590) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2028 () Bool)

(assert (= bs!2028 d!8475))

(assert (=> bs!2028 m!38859))

(assert (=> bs!2028 m!38859))

(declare-fun m!38875 () Bool)

(assert (=> bs!2028 m!38875))

(assert (=> b!44532 d!8475))

(assert (=> b!44561 d!8473))

(assert (=> d!8435 d!8439))

(declare-fun d!8477 () Bool)

(assert (=> d!8477 (arrayContainsKey!0 lt!19304 lt!19368 #b00000000000000000000000000000000)))

(assert (=> d!8477 true))

(declare-fun _$60!350 () Unit!1233)

(assert (=> d!8477 (= (choose!13 lt!19304 lt!19368 #b00000000000000000000000000000000) _$60!350)))

(declare-fun bs!2029 () Bool)

(assert (= bs!2029 d!8477))

(assert (=> bs!2029 m!38383))

(assert (=> d!8435 d!8477))

(declare-fun d!8479 () Bool)

(declare-fun res!26341 () Bool)

(declare-fun e!28350 () Bool)

(assert (=> d!8479 (=> res!26341 e!28350)))

(assert (=> d!8479 (= res!26341 (= (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (_1!829 lt!19310)))))

(assert (=> d!8479 (= (arrayContainsKey!0 lt!19304 (_1!829 lt!19310) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) e!28350)))

(declare-fun b!44731 () Bool)

(declare-fun e!28351 () Bool)

(assert (=> b!44731 (= e!28350 e!28351)))

(declare-fun res!26342 () Bool)

(assert (=> b!44731 (=> (not res!26342) (not e!28351))))

(assert (=> b!44731 (= res!26342 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1624 lt!19304)))))

(declare-fun b!44732 () Bool)

(assert (=> b!44732 (= e!28351 (arrayContainsKey!0 lt!19304 (_1!829 lt!19310) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!8479 (not res!26341)) b!44731))

(assert (= (and b!44731 res!26342) b!44732))

(assert (=> d!8479 m!38851))

(declare-fun m!38877 () Bool)

(assert (=> b!44732 m!38877))

(assert (=> b!44318 d!8479))

(declare-fun d!8481 () Bool)

(declare-fun e!28352 () Bool)

(assert (=> d!8481 e!28352))

(declare-fun res!26343 () Bool)

(assert (=> d!8481 (=> (not res!26343) (not e!28352))))

(declare-fun lt!19727 () ListLongMap!1213)

(assert (=> d!8481 (= res!26343 (contains!578 lt!19727 (_1!829 (ite (or c!5865 c!5862) (tuple2!1637 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1815 lt!19302)) (tuple2!1637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1815 lt!19302))))))))

(declare-fun lt!19728 () List!1210)

(assert (=> d!8481 (= lt!19727 (ListLongMap!1214 lt!19728))))

(declare-fun lt!19726 () Unit!1233)

(declare-fun lt!19729 () Unit!1233)

(assert (=> d!8481 (= lt!19726 lt!19729)))

(assert (=> d!8481 (= (getValueByKey!107 lt!19728 (_1!829 (ite (or c!5865 c!5862) (tuple2!1637 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1815 lt!19302)) (tuple2!1637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1815 lt!19302))))) (Some!112 (_2!829 (ite (or c!5865 c!5862) (tuple2!1637 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1815 lt!19302)) (tuple2!1637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1815 lt!19302))))))))

(assert (=> d!8481 (= lt!19729 (lemmaContainsTupThenGetReturnValue!31 lt!19728 (_1!829 (ite (or c!5865 c!5862) (tuple2!1637 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1815 lt!19302)) (tuple2!1637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1815 lt!19302)))) (_2!829 (ite (or c!5865 c!5862) (tuple2!1637 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1815 lt!19302)) (tuple2!1637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1815 lt!19302))))))))

(assert (=> d!8481 (= lt!19728 (insertStrictlySorted!28 (toList!622 (ite c!5865 call!3629 (ite c!5862 call!3624 call!3628))) (_1!829 (ite (or c!5865 c!5862) (tuple2!1637 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1815 lt!19302)) (tuple2!1637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1815 lt!19302)))) (_2!829 (ite (or c!5865 c!5862) (tuple2!1637 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1815 lt!19302)) (tuple2!1637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1815 lt!19302))))))))

(assert (=> d!8481 (= (+!71 (ite c!5865 call!3629 (ite c!5862 call!3624 call!3628)) (ite (or c!5865 c!5862) (tuple2!1637 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1815 lt!19302)) (tuple2!1637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1815 lt!19302)))) lt!19727)))

(declare-fun b!44733 () Bool)

(declare-fun res!26344 () Bool)

(assert (=> b!44733 (=> (not res!26344) (not e!28352))))

(assert (=> b!44733 (= res!26344 (= (getValueByKey!107 (toList!622 lt!19727) (_1!829 (ite (or c!5865 c!5862) (tuple2!1637 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1815 lt!19302)) (tuple2!1637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1815 lt!19302))))) (Some!112 (_2!829 (ite (or c!5865 c!5862) (tuple2!1637 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1815 lt!19302)) (tuple2!1637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1815 lt!19302)))))))))

(declare-fun b!44734 () Bool)

(assert (=> b!44734 (= e!28352 (contains!580 (toList!622 lt!19727) (ite (or c!5865 c!5862) (tuple2!1637 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1815 lt!19302)) (tuple2!1637 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1815 lt!19302)))))))

(assert (= (and d!8481 res!26343) b!44733))

(assert (= (and b!44733 res!26344) b!44734))

(declare-fun m!38879 () Bool)

(assert (=> d!8481 m!38879))

(declare-fun m!38881 () Bool)

(assert (=> d!8481 m!38881))

(declare-fun m!38883 () Bool)

(assert (=> d!8481 m!38883))

(declare-fun m!38885 () Bool)

(assert (=> d!8481 m!38885))

(declare-fun m!38887 () Bool)

(assert (=> b!44733 m!38887))

(declare-fun m!38889 () Bool)

(assert (=> b!44734 m!38889))

(assert (=> bm!3623 d!8481))

(declare-fun b!44735 () Bool)

(declare-fun e!28354 () (_ BitVec 32))

(assert (=> b!44735 (= e!28354 #b00000000000000000000000000000000)))

(declare-fun b!44736 () Bool)

(declare-fun e!28353 () (_ BitVec 32))

(declare-fun call!3660 () (_ BitVec 32))

(assert (=> b!44736 (= e!28353 (bvadd #b00000000000000000000000000000001 call!3660))))

(declare-fun b!44737 () Bool)

(assert (=> b!44737 (= e!28353 call!3660)))

(declare-fun bm!3657 () Bool)

(assert (=> bm!3657 (= call!3660 (arrayCountValidKeys!0 lt!19304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun d!8483 () Bool)

(declare-fun lt!19730 () (_ BitVec 32))

(assert (=> d!8483 (and (bvsge lt!19730 #b00000000000000000000000000000000) (bvsle lt!19730 (bvsub (size!1624 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!8483 (= lt!19730 e!28354)))

(declare-fun c!5917 () Bool)

(assert (=> d!8483 (= c!5917 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8483 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1624 lt!19304)))))

(assert (=> d!8483 (= (arrayCountValidKeys!0 lt!19304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!19730)))

(declare-fun b!44738 () Bool)

(assert (=> b!44738 (= e!28354 e!28353)))

(declare-fun c!5918 () Bool)

(assert (=> b!44738 (= c!5918 (validKeyInArray!0 (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!8483 c!5917) b!44735))

(assert (= (and d!8483 (not c!5917)) b!44738))

(assert (= (and b!44738 c!5918) b!44736))

(assert (= (and b!44738 (not c!5918)) b!44737))

(assert (= (or b!44736 b!44737) bm!3657))

(declare-fun m!38891 () Bool)

(assert (=> bm!3657 m!38891))

(assert (=> b!44738 m!38851))

(assert (=> b!44738 m!38851))

(declare-fun m!38893 () Bool)

(assert (=> b!44738 m!38893))

(assert (=> bm!3629 d!8483))

(declare-fun d!8485 () Bool)

(declare-fun lt!19731 () Bool)

(assert (=> d!8485 (= lt!19731 (select (content!42 (ite c!5759 (Cons!1207 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) Nil!1208) Nil!1208)) (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!28355 () Bool)

(assert (=> d!8485 (= lt!19731 e!28355)))

(declare-fun res!26346 () Bool)

(assert (=> d!8485 (=> (not res!26346) (not e!28355))))

(assert (=> d!8485 (= res!26346 ((_ is Cons!1207) (ite c!5759 (Cons!1207 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) Nil!1208) Nil!1208)))))

(assert (=> d!8485 (= (contains!575 (ite c!5759 (Cons!1207 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) Nil!1208) Nil!1208) (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!19731)))

(declare-fun b!44739 () Bool)

(declare-fun e!28356 () Bool)

(assert (=> b!44739 (= e!28355 e!28356)))

(declare-fun res!26345 () Bool)

(assert (=> b!44739 (=> res!26345 e!28356)))

(assert (=> b!44739 (= res!26345 (= (h!1784 (ite c!5759 (Cons!1207 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) Nil!1208) Nil!1208)) (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!44740 () Bool)

(assert (=> b!44740 (= e!28356 (contains!575 (t!4228 (ite c!5759 (Cons!1207 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) Nil!1208) Nil!1208)) (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!8485 res!26346) b!44739))

(assert (= (and b!44739 (not res!26345)) b!44740))

(declare-fun m!38895 () Bool)

(assert (=> d!8485 m!38895))

(assert (=> d!8485 m!38485))

(declare-fun m!38897 () Bool)

(assert (=> d!8485 m!38897))

(assert (=> b!44740 m!38485))

(declare-fun m!38899 () Bool)

(assert (=> b!44740 m!38899))

(assert (=> b!44331 d!8485))

(declare-fun b!44741 () Bool)

(declare-fun e!28357 () Bool)

(declare-fun call!3661 () Bool)

(assert (=> b!44741 (= e!28357 call!3661)))

(declare-fun b!44742 () Bool)

(declare-fun e!28358 () Bool)

(assert (=> b!44742 (= e!28358 call!3661)))

(declare-fun b!44743 () Bool)

(declare-fun e!28359 () Bool)

(assert (=> b!44743 (= e!28359 e!28357)))

(declare-fun c!5919 () Bool)

(assert (=> b!44743 (= c!5919 (validKeyInArray!0 (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!8487 () Bool)

(declare-fun res!26348 () Bool)

(assert (=> d!8487 (=> res!26348 e!28359)))

(assert (=> d!8487 (= res!26348 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1624 lt!19304)))))

(assert (=> d!8487 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!19304 mask!853) e!28359)))

(declare-fun b!44744 () Bool)

(assert (=> b!44744 (= e!28357 e!28358)))

(declare-fun lt!19733 () (_ BitVec 64))

(assert (=> b!44744 (= lt!19733 (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!19734 () Unit!1233)

(assert (=> b!44744 (= lt!19734 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19304 lt!19733 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!44744 (arrayContainsKey!0 lt!19304 lt!19733 #b00000000000000000000000000000000)))

(declare-fun lt!19732 () Unit!1233)

(assert (=> b!44744 (= lt!19732 lt!19734)))

(declare-fun res!26347 () Bool)

(assert (=> b!44744 (= res!26347 (= (seekEntryOrOpen!0 (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!19304 mask!853) (Found!203 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!44744 (=> (not res!26347) (not e!28358))))

(declare-fun bm!3658 () Bool)

(assert (=> bm!3658 (= call!3661 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!19304 mask!853))))

(assert (= (and d!8487 (not res!26348)) b!44743))

(assert (= (and b!44743 c!5919) b!44744))

(assert (= (and b!44743 (not c!5919)) b!44741))

(assert (= (and b!44744 res!26347) b!44742))

(assert (= (or b!44742 b!44741) bm!3658))

(assert (=> b!44743 m!38851))

(assert (=> b!44743 m!38851))

(assert (=> b!44743 m!38893))

(assert (=> b!44744 m!38851))

(declare-fun m!38901 () Bool)

(assert (=> b!44744 m!38901))

(declare-fun m!38903 () Bool)

(assert (=> b!44744 m!38903))

(assert (=> b!44744 m!38851))

(declare-fun m!38905 () Bool)

(assert (=> b!44744 m!38905))

(declare-fun m!38907 () Bool)

(assert (=> bm!3658 m!38907))

(assert (=> bm!3577 d!8487))

(declare-fun b!44745 () Bool)

(declare-fun e!28361 () (_ BitVec 32))

(assert (=> b!44745 (= e!28361 #b00000000000000000000000000000000)))

(declare-fun b!44746 () Bool)

(declare-fun e!28360 () (_ BitVec 32))

(declare-fun call!3662 () (_ BitVec 32))

(assert (=> b!44746 (= e!28360 (bvadd #b00000000000000000000000000000001 call!3662))))

(declare-fun b!44747 () Bool)

(assert (=> b!44747 (= e!28360 call!3662)))

(declare-fun bm!3659 () Bool)

(assert (=> bm!3659 (= call!3662 (arrayCountValidKeys!0 (_keys!3464 lt!19302) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1624 (_keys!3464 lt!19302))))))

(declare-fun d!8489 () Bool)

(declare-fun lt!19735 () (_ BitVec 32))

(assert (=> d!8489 (and (bvsge lt!19735 #b00000000000000000000000000000000) (bvsle lt!19735 (bvsub (size!1624 (_keys!3464 lt!19302)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!8489 (= lt!19735 e!28361)))

(declare-fun c!5920 () Bool)

(assert (=> d!8489 (= c!5920 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1624 (_keys!3464 lt!19302))))))

(assert (=> d!8489 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1624 (_keys!3464 lt!19302))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1624 (_keys!3464 lt!19302)) (size!1624 (_keys!3464 lt!19302))))))

(assert (=> d!8489 (= (arrayCountValidKeys!0 (_keys!3464 lt!19302) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1624 (_keys!3464 lt!19302))) lt!19735)))

(declare-fun b!44748 () Bool)

(assert (=> b!44748 (= e!28361 e!28360)))

(declare-fun c!5921 () Bool)

(assert (=> b!44748 (= c!5921 (validKeyInArray!0 (select (arr!1421 (_keys!3464 lt!19302)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!8489 c!5920) b!44745))

(assert (= (and d!8489 (not c!5920)) b!44748))

(assert (= (and b!44748 c!5921) b!44746))

(assert (= (and b!44748 (not c!5921)) b!44747))

(assert (= (or b!44746 b!44747) bm!3659))

(declare-fun m!38909 () Bool)

(assert (=> bm!3659 m!38909))

(declare-fun m!38911 () Bool)

(assert (=> b!44748 m!38911))

(assert (=> b!44748 m!38911))

(declare-fun m!38913 () Bool)

(assert (=> b!44748 m!38913))

(assert (=> bm!3630 d!8489))

(declare-fun d!8491 () Bool)

(assert (=> d!8491 (= (apply!62 lt!19590 #b1000000000000000000000000000000000000000000000000000000000000000) (get!802 (getValueByKey!107 (toList!622 lt!19590) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2030 () Bool)

(assert (= bs!2030 d!8491))

(declare-fun m!38915 () Bool)

(assert (=> bs!2030 m!38915))

(assert (=> bs!2030 m!38915))

(declare-fun m!38917 () Bool)

(assert (=> bs!2030 m!38917))

(assert (=> b!44527 d!8491))

(declare-fun c!5922 () Bool)

(declare-fun bm!3660 () Bool)

(declare-fun call!3663 () Bool)

(assert (=> bm!3660 (= call!3663 (arrayNoDuplicates!0 lt!19304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5922 (Cons!1207 (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!5802 (Cons!1207 (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5759 (Cons!1207 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) Nil!1208) Nil!1208)) (ite c!5759 (Cons!1207 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) Nil!1208) Nil!1208))) (ite c!5802 (Cons!1207 (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5759 (Cons!1207 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) Nil!1208) Nil!1208)) (ite c!5759 (Cons!1207 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) Nil!1208) Nil!1208)))))))

(declare-fun b!44749 () Bool)

(declare-fun e!28363 () Bool)

(declare-fun e!28364 () Bool)

(assert (=> b!44749 (= e!28363 e!28364)))

(assert (=> b!44749 (= c!5922 (validKeyInArray!0 (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!8493 () Bool)

(declare-fun res!26351 () Bool)

(declare-fun e!28365 () Bool)

(assert (=> d!8493 (=> res!26351 e!28365)))

(assert (=> d!8493 (= res!26351 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1624 lt!19304)))))

(assert (=> d!8493 (= (arrayNoDuplicates!0 lt!19304 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5802 (Cons!1207 (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5759 (Cons!1207 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) Nil!1208) Nil!1208)) (ite c!5759 (Cons!1207 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) Nil!1208) Nil!1208))) e!28365)))

(declare-fun b!44750 () Bool)

(assert (=> b!44750 (= e!28365 e!28363)))

(declare-fun res!26349 () Bool)

(assert (=> b!44750 (=> (not res!26349) (not e!28363))))

(declare-fun e!28362 () Bool)

(assert (=> b!44750 (= res!26349 (not e!28362))))

(declare-fun res!26350 () Bool)

(assert (=> b!44750 (=> (not res!26350) (not e!28362))))

(assert (=> b!44750 (= res!26350 (validKeyInArray!0 (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!44751 () Bool)

(assert (=> b!44751 (= e!28364 call!3663)))

(declare-fun b!44752 () Bool)

(assert (=> b!44752 (= e!28362 (contains!575 (ite c!5802 (Cons!1207 (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5759 (Cons!1207 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) Nil!1208) Nil!1208)) (ite c!5759 (Cons!1207 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) Nil!1208) Nil!1208)) (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!44753 () Bool)

(assert (=> b!44753 (= e!28364 call!3663)))

(assert (= (and d!8493 (not res!26351)) b!44750))

(assert (= (and b!44750 res!26350) b!44752))

(assert (= (and b!44750 res!26349) b!44749))

(assert (= (and b!44749 c!5922) b!44751))

(assert (= (and b!44749 (not c!5922)) b!44753))

(assert (= (or b!44751 b!44753) bm!3660))

(assert (=> bm!3660 m!38851))

(declare-fun m!38919 () Bool)

(assert (=> bm!3660 m!38919))

(assert (=> b!44749 m!38851))

(assert (=> b!44749 m!38851))

(assert (=> b!44749 m!38893))

(assert (=> b!44750 m!38851))

(assert (=> b!44750 m!38851))

(assert (=> b!44750 m!38893))

(assert (=> b!44752 m!38851))

(assert (=> b!44752 m!38851))

(declare-fun m!38921 () Bool)

(assert (=> b!44752 m!38921))

(assert (=> bm!3578 d!8493))

(assert (=> b!44328 d!8473))

(declare-fun d!8495 () Bool)

(assert (=> d!8495 (= (size!1641 lt!19302) (bvadd (_size!244 lt!19302) (bvsdiv (bvadd (extraKeys!1788 lt!19302) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!44637 d!8495))

(declare-fun b!44807 () Bool)

(declare-fun e!28400 () Bool)

(declare-fun e!28403 () Bool)

(assert (=> b!44807 (= e!28400 e!28403)))

(assert (=> b!44807 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1624 (_keys!3464 lt!19302))))))

(declare-fun res!26371 () Bool)

(declare-fun lt!19764 () ListLongMap!1213)

(assert (=> b!44807 (= res!26371 (contains!578 lt!19764 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)))))

(assert (=> b!44807 (=> (not res!26371) (not e!28403))))

(declare-fun b!44808 () Bool)

(declare-fun e!28405 () Bool)

(assert (=> b!44808 (= e!28400 e!28405)))

(declare-fun c!5943 () Bool)

(assert (=> b!44808 (= c!5943 (bvslt #b00000000000000000000000000000000 (size!1624 (_keys!3464 lt!19302))))))

(declare-fun b!44809 () Bool)

(declare-fun isEmpty!288 (ListLongMap!1213) Bool)

(assert (=> b!44809 (= e!28405 (isEmpty!288 lt!19764))))

(declare-fun b!44810 () Bool)

(declare-fun e!28401 () ListLongMap!1213)

(declare-fun e!28402 () ListLongMap!1213)

(assert (=> b!44810 (= e!28401 e!28402)))

(declare-fun c!5941 () Bool)

(assert (=> b!44810 (= c!5941 (validKeyInArray!0 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)))))

(declare-fun d!8497 () Bool)

(declare-fun e!28404 () Bool)

(assert (=> d!8497 e!28404))

(declare-fun res!26372 () Bool)

(assert (=> d!8497 (=> (not res!26372) (not e!28404))))

(assert (=> d!8497 (= res!26372 (not (contains!578 lt!19764 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!8497 (= lt!19764 e!28401)))

(declare-fun c!5942 () Bool)

(assert (=> d!8497 (= c!5942 (bvsge #b00000000000000000000000000000000 (size!1624 (_keys!3464 lt!19302))))))

(assert (=> d!8497 (validMask!0 (mask!5474 lt!19302))))

(assert (=> d!8497 (= (getCurrentListMapNoExtraKeys!40 (_keys!3464 lt!19302) (_values!1880 lt!19302) (mask!5474 lt!19302) (extraKeys!1788 lt!19302) (zeroValue!1815 lt!19302) (minValue!1815 lt!19302) #b00000000000000000000000000000000 (defaultEntry!1897 lt!19302)) lt!19764)))

(declare-fun b!44811 () Bool)

(assert (=> b!44811 (= e!28405 (= lt!19764 (getCurrentListMapNoExtraKeys!40 (_keys!3464 lt!19302) (_values!1880 lt!19302) (mask!5474 lt!19302) (extraKeys!1788 lt!19302) (zeroValue!1815 lt!19302) (minValue!1815 lt!19302) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1897 lt!19302))))))

(declare-fun b!44812 () Bool)

(declare-fun e!28399 () Bool)

(assert (=> b!44812 (= e!28399 (validKeyInArray!0 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)))))

(assert (=> b!44812 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun bm!3666 () Bool)

(declare-fun call!3669 () ListLongMap!1213)

(assert (=> bm!3666 (= call!3669 (getCurrentListMapNoExtraKeys!40 (_keys!3464 lt!19302) (_values!1880 lt!19302) (mask!5474 lt!19302) (extraKeys!1788 lt!19302) (zeroValue!1815 lt!19302) (minValue!1815 lt!19302) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1897 lt!19302)))))

(declare-fun b!44813 () Bool)

(declare-fun lt!19767 () Unit!1233)

(declare-fun lt!19766 () Unit!1233)

(assert (=> b!44813 (= lt!19767 lt!19766)))

(declare-fun lt!19765 () ListLongMap!1213)

(declare-fun lt!19762 () V!2327)

(declare-fun lt!19763 () (_ BitVec 64))

(declare-fun lt!19768 () (_ BitVec 64))

(assert (=> b!44813 (not (contains!578 (+!71 lt!19765 (tuple2!1637 lt!19763 lt!19762)) lt!19768))))

(declare-fun addStillNotContains!12 (ListLongMap!1213 (_ BitVec 64) V!2327 (_ BitVec 64)) Unit!1233)

(assert (=> b!44813 (= lt!19766 (addStillNotContains!12 lt!19765 lt!19763 lt!19762 lt!19768))))

(assert (=> b!44813 (= lt!19768 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!44813 (= lt!19762 (get!800 (select (arr!1422 (_values!1880 lt!19302)) #b00000000000000000000000000000000) (dynLambda!266 (defaultEntry!1897 lt!19302) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44813 (= lt!19763 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000))))

(assert (=> b!44813 (= lt!19765 call!3669)))

(assert (=> b!44813 (= e!28402 (+!71 call!3669 (tuple2!1637 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000) (get!800 (select (arr!1422 (_values!1880 lt!19302)) #b00000000000000000000000000000000) (dynLambda!266 (defaultEntry!1897 lt!19302) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!44814 () Bool)

(assert (=> b!44814 (= e!28404 e!28400)))

(declare-fun c!5944 () Bool)

(assert (=> b!44814 (= c!5944 e!28399)))

(declare-fun res!26370 () Bool)

(assert (=> b!44814 (=> (not res!26370) (not e!28399))))

(assert (=> b!44814 (= res!26370 (bvslt #b00000000000000000000000000000000 (size!1624 (_keys!3464 lt!19302))))))

(declare-fun b!44815 () Bool)

(assert (=> b!44815 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1624 (_keys!3464 lt!19302))))))

(assert (=> b!44815 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1625 (_values!1880 lt!19302))))))

(assert (=> b!44815 (= e!28403 (= (apply!62 lt!19764 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)) (get!800 (select (arr!1422 (_values!1880 lt!19302)) #b00000000000000000000000000000000) (dynLambda!266 (defaultEntry!1897 lt!19302) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!44816 () Bool)

(declare-fun res!26369 () Bool)

(assert (=> b!44816 (=> (not res!26369) (not e!28404))))

(assert (=> b!44816 (= res!26369 (not (contains!578 lt!19764 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!44817 () Bool)

(assert (=> b!44817 (= e!28402 call!3669)))

(declare-fun b!44818 () Bool)

(assert (=> b!44818 (= e!28401 (ListLongMap!1214 Nil!1207))))

(assert (= (and d!8497 c!5942) b!44818))

(assert (= (and d!8497 (not c!5942)) b!44810))

(assert (= (and b!44810 c!5941) b!44813))

(assert (= (and b!44810 (not c!5941)) b!44817))

(assert (= (or b!44813 b!44817) bm!3666))

(assert (= (and d!8497 res!26372) b!44816))

(assert (= (and b!44816 res!26369) b!44814))

(assert (= (and b!44814 res!26370) b!44812))

(assert (= (and b!44814 c!5944) b!44807))

(assert (= (and b!44814 (not c!5944)) b!44808))

(assert (= (and b!44807 res!26371) b!44815))

(assert (= (and b!44808 c!5943) b!44811))

(assert (= (and b!44808 (not c!5943)) b!44809))

(declare-fun b_lambda!2327 () Bool)

(assert (=> (not b_lambda!2327) (not b!44813)))

(assert (=> b!44813 t!4236))

(declare-fun b_and!2717 () Bool)

(assert (= b_and!2713 (and (=> t!4236 result!1761) b_and!2717)))

(declare-fun b_lambda!2329 () Bool)

(assert (=> (not b_lambda!2329) (not b!44815)))

(assert (=> b!44815 t!4236))

(declare-fun b_and!2719 () Bool)

(assert (= b_and!2717 (and (=> t!4236 result!1761) b_and!2719)))

(declare-fun m!38983 () Bool)

(assert (=> b!44811 m!38983))

(declare-fun m!38985 () Bool)

(assert (=> b!44809 m!38985))

(declare-fun m!38987 () Bool)

(assert (=> b!44816 m!38987))

(declare-fun m!38989 () Bool)

(assert (=> d!8497 m!38989))

(assert (=> d!8497 m!38719))

(declare-fun m!38991 () Bool)

(assert (=> b!44813 m!38991))

(declare-fun m!38993 () Bool)

(assert (=> b!44813 m!38993))

(assert (=> b!44813 m!38699))

(declare-fun m!38995 () Bool)

(assert (=> b!44813 m!38995))

(declare-fun m!38997 () Bool)

(assert (=> b!44813 m!38997))

(assert (=> b!44813 m!38991))

(assert (=> b!44813 m!38699))

(assert (=> b!44813 m!38701))

(assert (=> b!44813 m!38703))

(assert (=> b!44813 m!38701))

(assert (=> b!44813 m!38491))

(assert (=> bm!3666 m!38983))

(assert (=> b!44812 m!38491))

(assert (=> b!44812 m!38491))

(assert (=> b!44812 m!38495))

(assert (=> b!44815 m!38699))

(assert (=> b!44815 m!38491))

(declare-fun m!38999 () Bool)

(assert (=> b!44815 m!38999))

(assert (=> b!44815 m!38699))

(assert (=> b!44815 m!38701))

(assert (=> b!44815 m!38703))

(assert (=> b!44815 m!38701))

(assert (=> b!44815 m!38491))

(assert (=> b!44810 m!38491))

(assert (=> b!44810 m!38491))

(assert (=> b!44810 m!38495))

(assert (=> b!44807 m!38491))

(assert (=> b!44807 m!38491))

(declare-fun m!39003 () Bool)

(assert (=> b!44807 m!39003))

(assert (=> bm!3621 d!8497))

(declare-fun d!8529 () Bool)

(declare-fun e!28409 () Bool)

(assert (=> d!8529 e!28409))

(declare-fun res!26375 () Bool)

(assert (=> d!8529 (=> res!26375 e!28409)))

(declare-fun lt!19770 () Bool)

(assert (=> d!8529 (= res!26375 (not lt!19770))))

(declare-fun lt!19771 () Bool)

(assert (=> d!8529 (= lt!19770 lt!19771)))

(declare-fun lt!19772 () Unit!1233)

(declare-fun e!28408 () Unit!1233)

(assert (=> d!8529 (= lt!19772 e!28408)))

(declare-fun c!5945 () Bool)

(assert (=> d!8529 (= c!5945 lt!19771)))

(assert (=> d!8529 (= lt!19771 (containsKey!75 (toList!622 lt!19590) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8529 (= (contains!578 lt!19590 #b1000000000000000000000000000000000000000000000000000000000000000) lt!19770)))

(declare-fun b!44821 () Bool)

(declare-fun lt!19769 () Unit!1233)

(assert (=> b!44821 (= e!28408 lt!19769)))

(assert (=> b!44821 (= lt!19769 (lemmaContainsKeyImpliesGetValueByKeyDefined!63 (toList!622 lt!19590) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!44821 (isDefined!64 (getValueByKey!107 (toList!622 lt!19590) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!44822 () Bool)

(declare-fun Unit!1245 () Unit!1233)

(assert (=> b!44822 (= e!28408 Unit!1245)))

(declare-fun b!44823 () Bool)

(assert (=> b!44823 (= e!28409 (isDefined!64 (getValueByKey!107 (toList!622 lt!19590) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!8529 c!5945) b!44821))

(assert (= (and d!8529 (not c!5945)) b!44822))

(assert (= (and d!8529 (not res!26375)) b!44823))

(declare-fun m!39007 () Bool)

(assert (=> d!8529 m!39007))

(declare-fun m!39009 () Bool)

(assert (=> b!44821 m!39009))

(assert (=> b!44821 m!38915))

(assert (=> b!44821 m!38915))

(declare-fun m!39013 () Bool)

(assert (=> b!44821 m!39013))

(assert (=> b!44823 m!38915))

(assert (=> b!44823 m!38915))

(assert (=> b!44823 m!39013))

(assert (=> bm!3626 d!8529))

(assert (=> b!44326 d!8473))

(assert (=> b!44636 d!8495))

(declare-fun d!8535 () Bool)

(assert (=> d!8535 (arrayContainsKey!0 lt!19304 lt!19436 #b00000000000000000000000000000000)))

(declare-fun lt!19777 () Unit!1233)

(assert (=> d!8535 (= lt!19777 (choose!13 lt!19304 lt!19436 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!8535 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!8535 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19304 lt!19436 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19777)))

(declare-fun bs!2034 () Bool)

(assert (= bs!2034 d!8535))

(assert (=> bs!2034 m!38503))

(declare-fun m!39017 () Bool)

(assert (=> bs!2034 m!39017))

(assert (=> b!44327 d!8535))

(declare-fun d!8537 () Bool)

(declare-fun res!26380 () Bool)

(declare-fun e!28415 () Bool)

(assert (=> d!8537 (=> res!26380 e!28415)))

(assert (=> d!8537 (= res!26380 (= (select (arr!1421 lt!19304) #b00000000000000000000000000000000) lt!19436))))

(assert (=> d!8537 (= (arrayContainsKey!0 lt!19304 lt!19436 #b00000000000000000000000000000000) e!28415)))

(declare-fun b!44830 () Bool)

(declare-fun e!28416 () Bool)

(assert (=> b!44830 (= e!28415 e!28416)))

(declare-fun res!26381 () Bool)

(assert (=> b!44830 (=> (not res!26381) (not e!28416))))

(assert (=> b!44830 (= res!26381 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1624 lt!19304)))))

(declare-fun b!44831 () Bool)

(assert (=> b!44831 (= e!28416 (arrayContainsKey!0 lt!19304 lt!19436 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8537 (not res!26380)) b!44830))

(assert (= (and b!44830 res!26381) b!44831))

(assert (=> d!8537 m!38377))

(declare-fun m!39027 () Bool)

(assert (=> b!44831 m!39027))

(assert (=> b!44327 d!8537))

(declare-fun b!44832 () Bool)

(declare-fun e!28418 () SeekEntryResult!203)

(declare-fun lt!19780 () SeekEntryResult!203)

(assert (=> b!44832 (= e!28418 (Found!203 (index!2936 lt!19780)))))

(declare-fun b!44833 () Bool)

(declare-fun c!5948 () Bool)

(declare-fun lt!19779 () (_ BitVec 64))

(assert (=> b!44833 (= c!5948 (= lt!19779 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!28417 () SeekEntryResult!203)

(assert (=> b!44833 (= e!28418 e!28417)))

(declare-fun b!44834 () Bool)

(declare-fun e!28419 () SeekEntryResult!203)

(assert (=> b!44834 (= e!28419 Undefined!203)))

(declare-fun b!44835 () Bool)

(assert (=> b!44835 (= e!28419 e!28418)))

(assert (=> b!44835 (= lt!19779 (select (arr!1421 lt!19304) (index!2936 lt!19780)))))

(declare-fun c!5947 () Bool)

(assert (=> b!44835 (= c!5947 (= lt!19779 (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!8541 () Bool)

(declare-fun lt!19778 () SeekEntryResult!203)

(assert (=> d!8541 (and (or ((_ is Undefined!203) lt!19778) (not ((_ is Found!203) lt!19778)) (and (bvsge (index!2935 lt!19778) #b00000000000000000000000000000000) (bvslt (index!2935 lt!19778) (size!1624 lt!19304)))) (or ((_ is Undefined!203) lt!19778) ((_ is Found!203) lt!19778) (not ((_ is MissingZero!203) lt!19778)) (and (bvsge (index!2934 lt!19778) #b00000000000000000000000000000000) (bvslt (index!2934 lt!19778) (size!1624 lt!19304)))) (or ((_ is Undefined!203) lt!19778) ((_ is Found!203) lt!19778) ((_ is MissingZero!203) lt!19778) (not ((_ is MissingVacant!203) lt!19778)) (and (bvsge (index!2937 lt!19778) #b00000000000000000000000000000000) (bvslt (index!2937 lt!19778) (size!1624 lt!19304)))) (or ((_ is Undefined!203) lt!19778) (ite ((_ is Found!203) lt!19778) (= (select (arr!1421 lt!19304) (index!2935 lt!19778)) (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!203) lt!19778) (= (select (arr!1421 lt!19304) (index!2934 lt!19778)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!203) lt!19778) (= (select (arr!1421 lt!19304) (index!2937 lt!19778)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!8541 (= lt!19778 e!28419)))

(declare-fun c!5949 () Bool)

(assert (=> d!8541 (= c!5949 (and ((_ is Intermediate!203) lt!19780) (undefined!1015 lt!19780)))))

(assert (=> d!8541 (= lt!19780 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!853) (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19304 mask!853))))

(assert (=> d!8541 (validMask!0 mask!853)))

(assert (=> d!8541 (= (seekEntryOrOpen!0 (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19304 mask!853) lt!19778)))

(declare-fun b!44836 () Bool)

(assert (=> b!44836 (= e!28417 (MissingZero!203 (index!2936 lt!19780)))))

(declare-fun b!44837 () Bool)

(assert (=> b!44837 (= e!28417 (seekKeyOrZeroReturnVacant!0 (x!8357 lt!19780) (index!2936 lt!19780) (index!2936 lt!19780) (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19304 mask!853))))

(assert (= (and d!8541 c!5949) b!44834))

(assert (= (and d!8541 (not c!5949)) b!44835))

(assert (= (and b!44835 c!5947) b!44832))

(assert (= (and b!44835 (not c!5947)) b!44833))

(assert (= (and b!44833 c!5948) b!44836))

(assert (= (and b!44833 (not c!5948)) b!44837))

(declare-fun m!39029 () Bool)

(assert (=> b!44835 m!39029))

(declare-fun m!39031 () Bool)

(assert (=> d!8541 m!39031))

(declare-fun m!39033 () Bool)

(assert (=> d!8541 m!39033))

(declare-fun m!39035 () Bool)

(assert (=> d!8541 m!39035))

(assert (=> d!8541 m!38485))

(declare-fun m!39037 () Bool)

(assert (=> d!8541 m!39037))

(declare-fun m!39039 () Bool)

(assert (=> d!8541 m!39039))

(assert (=> d!8541 m!38485))

(assert (=> d!8541 m!39035))

(assert (=> d!8541 m!38295))

(assert (=> b!44837 m!38485))

(declare-fun m!39041 () Bool)

(assert (=> b!44837 m!39041))

(assert (=> b!44327 d!8541))

(declare-fun d!8543 () Bool)

(assert (=> d!8543 (= (validKeyInArray!0 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!44565 d!8543))

(declare-fun d!8545 () Bool)

(declare-fun e!28421 () Bool)

(assert (=> d!8545 e!28421))

(declare-fun res!26382 () Bool)

(assert (=> d!8545 (=> res!26382 e!28421)))

(declare-fun lt!19782 () Bool)

(assert (=> d!8545 (= res!26382 (not lt!19782))))

(declare-fun lt!19783 () Bool)

(assert (=> d!8545 (= lt!19782 lt!19783)))

(declare-fun lt!19784 () Unit!1233)

(declare-fun e!28420 () Unit!1233)

(assert (=> d!8545 (= lt!19784 e!28420)))

(declare-fun c!5950 () Bool)

(assert (=> d!8545 (= c!5950 lt!19783)))

(assert (=> d!8545 (= lt!19783 (containsKey!75 (toList!622 lt!19590) (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)))))

(assert (=> d!8545 (= (contains!578 lt!19590 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)) lt!19782)))

(declare-fun b!44838 () Bool)

(declare-fun lt!19781 () Unit!1233)

(assert (=> b!44838 (= e!28420 lt!19781)))

(assert (=> b!44838 (= lt!19781 (lemmaContainsKeyImpliesGetValueByKeyDefined!63 (toList!622 lt!19590) (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)))))

(assert (=> b!44838 (isDefined!64 (getValueByKey!107 (toList!622 lt!19590) (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)))))

(declare-fun b!44839 () Bool)

(declare-fun Unit!1246 () Unit!1233)

(assert (=> b!44839 (= e!28420 Unit!1246)))

(declare-fun b!44840 () Bool)

(assert (=> b!44840 (= e!28421 (isDefined!64 (getValueByKey!107 (toList!622 lt!19590) (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000))))))

(assert (= (and d!8545 c!5950) b!44838))

(assert (= (and d!8545 (not c!5950)) b!44839))

(assert (= (and d!8545 (not res!26382)) b!44840))

(assert (=> d!8545 m!38491))

(declare-fun m!39043 () Bool)

(assert (=> d!8545 m!39043))

(assert (=> b!44838 m!38491))

(declare-fun m!39045 () Bool)

(assert (=> b!44838 m!39045))

(assert (=> b!44838 m!38491))

(declare-fun m!39047 () Bool)

(assert (=> b!44838 m!39047))

(assert (=> b!44838 m!39047))

(declare-fun m!39049 () Bool)

(assert (=> b!44838 m!39049))

(assert (=> b!44840 m!38491))

(assert (=> b!44840 m!39047))

(assert (=> b!44840 m!39047))

(assert (=> b!44840 m!39049))

(assert (=> b!44528 d!8545))

(assert (=> b!44545 d!8543))

(assert (=> b!44315 d!8343))

(declare-fun d!8547 () Bool)

(declare-fun lt!19785 () Bool)

(assert (=> d!8547 (= lt!19785 (select (content!42 Nil!1208) (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)))))

(declare-fun e!28422 () Bool)

(assert (=> d!8547 (= lt!19785 e!28422)))

(declare-fun res!26384 () Bool)

(assert (=> d!8547 (=> (not res!26384) (not e!28422))))

(assert (=> d!8547 (= res!26384 ((_ is Cons!1207) Nil!1208))))

(assert (=> d!8547 (= (contains!575 Nil!1208 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)) lt!19785)))

(declare-fun b!44841 () Bool)

(declare-fun e!28423 () Bool)

(assert (=> b!44841 (= e!28422 e!28423)))

(declare-fun res!26383 () Bool)

(assert (=> b!44841 (=> res!26383 e!28423)))

(assert (=> b!44841 (= res!26383 (= (h!1784 Nil!1208) (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)))))

(declare-fun b!44842 () Bool)

(assert (=> b!44842 (= e!28423 (contains!575 (t!4228 Nil!1208) (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)))))

(assert (= (and d!8547 res!26384) b!44841))

(assert (= (and b!44841 (not res!26383)) b!44842))

(assert (=> d!8547 m!38477))

(assert (=> d!8547 m!38491))

(declare-fun m!39051 () Bool)

(assert (=> d!8547 m!39051))

(assert (=> b!44842 m!38491))

(declare-fun m!39053 () Bool)

(assert (=> b!44842 m!39053))

(assert (=> b!44322 d!8547))

(declare-fun d!8549 () Bool)

(assert (=> d!8549 (= (apply!62 lt!19590 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)) (get!802 (getValueByKey!107 (toList!622 lt!19590) (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000))))))

(declare-fun bs!2035 () Bool)

(assert (= bs!2035 d!8549))

(assert (=> bs!2035 m!38491))

(assert (=> bs!2035 m!39047))

(assert (=> bs!2035 m!39047))

(declare-fun m!39055 () Bool)

(assert (=> bs!2035 m!39055))

(assert (=> b!44538 d!8549))

(declare-fun d!8551 () Bool)

(declare-fun c!5953 () Bool)

(assert (=> d!8551 (= c!5953 ((_ is ValueCellFull!705) (select (arr!1422 (_values!1880 lt!19302)) #b00000000000000000000000000000000)))))

(declare-fun e!28426 () V!2327)

(assert (=> d!8551 (= (get!800 (select (arr!1422 (_values!1880 lt!19302)) #b00000000000000000000000000000000) (dynLambda!266 (defaultEntry!1897 lt!19302) #b0000000000000000000000000000000000000000000000000000000000000000)) e!28426)))

(declare-fun b!44847 () Bool)

(declare-fun get!803 (ValueCell!705 V!2327) V!2327)

(assert (=> b!44847 (= e!28426 (get!803 (select (arr!1422 (_values!1880 lt!19302)) #b00000000000000000000000000000000) (dynLambda!266 (defaultEntry!1897 lt!19302) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!44848 () Bool)

(declare-fun get!804 (ValueCell!705 V!2327) V!2327)

(assert (=> b!44848 (= e!28426 (get!804 (select (arr!1422 (_values!1880 lt!19302)) #b00000000000000000000000000000000) (dynLambda!266 (defaultEntry!1897 lt!19302) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!8551 c!5953) b!44847))

(assert (= (and d!8551 (not c!5953)) b!44848))

(assert (=> b!44847 m!38699))

(assert (=> b!44847 m!38701))

(declare-fun m!39057 () Bool)

(assert (=> b!44847 m!39057))

(assert (=> b!44848 m!38699))

(assert (=> b!44848 m!38701))

(declare-fun m!39059 () Bool)

(assert (=> b!44848 m!39059))

(assert (=> b!44538 d!8551))

(declare-fun b!44849 () Bool)

(declare-fun e!28427 () Bool)

(declare-fun call!3671 () Bool)

(assert (=> b!44849 (= e!28427 call!3671)))

(declare-fun b!44850 () Bool)

(declare-fun e!28428 () Bool)

(assert (=> b!44850 (= e!28428 call!3671)))

(declare-fun b!44851 () Bool)

(declare-fun e!28429 () Bool)

(assert (=> b!44851 (= e!28429 e!28427)))

(declare-fun c!5954 () Bool)

(assert (=> b!44851 (= c!5954 (validKeyInArray!0 (select (arr!1421 (_keys!3464 lt!19302)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!8553 () Bool)

(declare-fun res!26386 () Bool)

(assert (=> d!8553 (=> res!26386 e!28429)))

(assert (=> d!8553 (= res!26386 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1624 (_keys!3464 lt!19302))))))

(assert (=> d!8553 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3464 lt!19302) (mask!5474 lt!19302)) e!28429)))

(declare-fun b!44852 () Bool)

(assert (=> b!44852 (= e!28427 e!28428)))

(declare-fun lt!19795 () (_ BitVec 64))

(assert (=> b!44852 (= lt!19795 (select (arr!1421 (_keys!3464 lt!19302)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!19796 () Unit!1233)

(assert (=> b!44852 (= lt!19796 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3464 lt!19302) lt!19795 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!44852 (arrayContainsKey!0 (_keys!3464 lt!19302) lt!19795 #b00000000000000000000000000000000)))

(declare-fun lt!19794 () Unit!1233)

(assert (=> b!44852 (= lt!19794 lt!19796)))

(declare-fun res!26385 () Bool)

(assert (=> b!44852 (= res!26385 (= (seekEntryOrOpen!0 (select (arr!1421 (_keys!3464 lt!19302)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3464 lt!19302) (mask!5474 lt!19302)) (Found!203 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!44852 (=> (not res!26385) (not e!28428))))

(declare-fun bm!3668 () Bool)

(assert (=> bm!3668 (= call!3671 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3464 lt!19302) (mask!5474 lt!19302)))))

(assert (= (and d!8553 (not res!26386)) b!44851))

(assert (= (and b!44851 c!5954) b!44852))

(assert (= (and b!44851 (not c!5954)) b!44849))

(assert (= (and b!44852 res!26385) b!44850))

(assert (= (or b!44850 b!44849) bm!3668))

(assert (=> b!44851 m!38911))

(assert (=> b!44851 m!38911))

(assert (=> b!44851 m!38913))

(assert (=> b!44852 m!38911))

(declare-fun m!39061 () Bool)

(assert (=> b!44852 m!39061))

(declare-fun m!39063 () Bool)

(assert (=> b!44852 m!39063))

(assert (=> b!44852 m!38911))

(declare-fun m!39065 () Bool)

(assert (=> b!44852 m!39065))

(declare-fun m!39067 () Bool)

(assert (=> bm!3668 m!39067))

(assert (=> bm!3631 d!8553))

(assert (=> b!44319 d!8543))

(declare-fun b!44871 () Bool)

(declare-fun e!28441 () SeekEntryResult!203)

(assert (=> b!44871 (= e!28441 (Found!203 (index!2936 lt!19627)))))

(declare-fun b!44872 () Bool)

(declare-fun e!28440 () SeekEntryResult!203)

(assert (=> b!44872 (= e!28440 e!28441)))

(declare-fun c!5961 () Bool)

(declare-fun lt!19806 () (_ BitVec 64))

(assert (=> b!44872 (= c!5961 (= lt!19806 (select (arr!1421 lt!19304) #b00000000000000000000000000000000)))))

(declare-fun b!44873 () Bool)

(declare-fun c!5963 () Bool)

(assert (=> b!44873 (= c!5963 (= lt!19806 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!28439 () SeekEntryResult!203)

(assert (=> b!44873 (= e!28441 e!28439)))

(declare-fun b!44874 () Bool)

(assert (=> b!44874 (= e!28440 Undefined!203)))

(declare-fun d!8555 () Bool)

(declare-fun lt!19805 () SeekEntryResult!203)

(assert (=> d!8555 (and (or ((_ is Undefined!203) lt!19805) (not ((_ is Found!203) lt!19805)) (and (bvsge (index!2935 lt!19805) #b00000000000000000000000000000000) (bvslt (index!2935 lt!19805) (size!1624 lt!19304)))) (or ((_ is Undefined!203) lt!19805) ((_ is Found!203) lt!19805) (not ((_ is MissingVacant!203) lt!19805)) (not (= (index!2937 lt!19805) (index!2936 lt!19627))) (and (bvsge (index!2937 lt!19805) #b00000000000000000000000000000000) (bvslt (index!2937 lt!19805) (size!1624 lt!19304)))) (or ((_ is Undefined!203) lt!19805) (ite ((_ is Found!203) lt!19805) (= (select (arr!1421 lt!19304) (index!2935 lt!19805)) (select (arr!1421 lt!19304) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!203) lt!19805) (= (index!2937 lt!19805) (index!2936 lt!19627)) (= (select (arr!1421 lt!19304) (index!2937 lt!19805)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!8555 (= lt!19805 e!28440)))

(declare-fun c!5962 () Bool)

(assert (=> d!8555 (= c!5962 (bvsge (x!8357 lt!19627) #b01111111111111111111111111111110))))

(assert (=> d!8555 (= lt!19806 (select (arr!1421 lt!19304) (index!2936 lt!19627)))))

(assert (=> d!8555 (validMask!0 mask!853)))

(assert (=> d!8555 (= (seekKeyOrZeroReturnVacant!0 (x!8357 lt!19627) (index!2936 lt!19627) (index!2936 lt!19627) (select (arr!1421 lt!19304) #b00000000000000000000000000000000) lt!19304 mask!853) lt!19805)))

(declare-fun b!44875 () Bool)

(assert (=> b!44875 (= e!28439 (MissingVacant!203 (index!2936 lt!19627)))))

(declare-fun b!44876 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!44876 (= e!28439 (seekKeyOrZeroReturnVacant!0 (bvadd (x!8357 lt!19627) #b00000000000000000000000000000001) (nextIndex!0 (index!2936 lt!19627) (x!8357 lt!19627) mask!853) (index!2936 lt!19627) (select (arr!1421 lt!19304) #b00000000000000000000000000000000) lt!19304 mask!853))))

(assert (= (and d!8555 c!5962) b!44874))

(assert (= (and d!8555 (not c!5962)) b!44872))

(assert (= (and b!44872 c!5961) b!44871))

(assert (= (and b!44872 (not c!5961)) b!44873))

(assert (= (and b!44873 c!5963) b!44875))

(assert (= (and b!44873 (not c!5963)) b!44876))

(declare-fun m!39081 () Bool)

(assert (=> d!8555 m!39081))

(declare-fun m!39083 () Bool)

(assert (=> d!8555 m!39083))

(assert (=> d!8555 m!38757))

(assert (=> d!8555 m!38295))

(declare-fun m!39085 () Bool)

(assert (=> b!44876 m!39085))

(assert (=> b!44876 m!39085))

(assert (=> b!44876 m!38377))

(declare-fun m!39087 () Bool)

(assert (=> b!44876 m!39087))

(assert (=> b!44614 d!8555))

(declare-fun d!8561 () Bool)

(assert (not d!8561))

(assert (=> b!44308 d!8561))

(declare-fun d!8563 () Bool)

(assert (=> d!8563 (arrayContainsKey!0 (_keys!3464 lt!19302) lt!19607 #b00000000000000000000000000000000)))

(declare-fun lt!19807 () Unit!1233)

(assert (=> d!8563 (= lt!19807 (choose!13 (_keys!3464 lt!19302) lt!19607 #b00000000000000000000000000000000))))

(assert (=> d!8563 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!8563 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3464 lt!19302) lt!19607 #b00000000000000000000000000000000) lt!19807)))

(declare-fun bs!2036 () Bool)

(assert (= bs!2036 d!8563))

(assert (=> bs!2036 m!38727))

(declare-fun m!39089 () Bool)

(assert (=> bs!2036 m!39089))

(assert (=> b!44573 d!8563))

(declare-fun d!8565 () Bool)

(declare-fun res!26393 () Bool)

(declare-fun e!28442 () Bool)

(assert (=> d!8565 (=> res!26393 e!28442)))

(assert (=> d!8565 (= res!26393 (= (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000) lt!19607))))

(assert (=> d!8565 (= (arrayContainsKey!0 (_keys!3464 lt!19302) lt!19607 #b00000000000000000000000000000000) e!28442)))

(declare-fun b!44877 () Bool)

(declare-fun e!28443 () Bool)

(assert (=> b!44877 (= e!28442 e!28443)))

(declare-fun res!26394 () Bool)

(assert (=> b!44877 (=> (not res!26394) (not e!28443))))

(assert (=> b!44877 (= res!26394 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1624 (_keys!3464 lt!19302))))))

(declare-fun b!44878 () Bool)

(assert (=> b!44878 (= e!28443 (arrayContainsKey!0 (_keys!3464 lt!19302) lt!19607 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8565 (not res!26393)) b!44877))

(assert (= (and b!44877 res!26394) b!44878))

(assert (=> d!8565 m!38491))

(declare-fun m!39091 () Bool)

(assert (=> b!44878 m!39091))

(assert (=> b!44573 d!8565))

(declare-fun b!44879 () Bool)

(declare-fun e!28445 () SeekEntryResult!203)

(declare-fun lt!19810 () SeekEntryResult!203)

(assert (=> b!44879 (= e!28445 (Found!203 (index!2936 lt!19810)))))

(declare-fun b!44880 () Bool)

(declare-fun c!5965 () Bool)

(declare-fun lt!19809 () (_ BitVec 64))

(assert (=> b!44880 (= c!5965 (= lt!19809 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!28444 () SeekEntryResult!203)

(assert (=> b!44880 (= e!28445 e!28444)))

(declare-fun b!44881 () Bool)

(declare-fun e!28446 () SeekEntryResult!203)

(assert (=> b!44881 (= e!28446 Undefined!203)))

(declare-fun b!44882 () Bool)

(assert (=> b!44882 (= e!28446 e!28445)))

(assert (=> b!44882 (= lt!19809 (select (arr!1421 (_keys!3464 lt!19302)) (index!2936 lt!19810)))))

(declare-fun c!5964 () Bool)

(assert (=> b!44882 (= c!5964 (= lt!19809 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)))))

(declare-fun d!8567 () Bool)

(declare-fun lt!19808 () SeekEntryResult!203)

(assert (=> d!8567 (and (or ((_ is Undefined!203) lt!19808) (not ((_ is Found!203) lt!19808)) (and (bvsge (index!2935 lt!19808) #b00000000000000000000000000000000) (bvslt (index!2935 lt!19808) (size!1624 (_keys!3464 lt!19302))))) (or ((_ is Undefined!203) lt!19808) ((_ is Found!203) lt!19808) (not ((_ is MissingZero!203) lt!19808)) (and (bvsge (index!2934 lt!19808) #b00000000000000000000000000000000) (bvslt (index!2934 lt!19808) (size!1624 (_keys!3464 lt!19302))))) (or ((_ is Undefined!203) lt!19808) ((_ is Found!203) lt!19808) ((_ is MissingZero!203) lt!19808) (not ((_ is MissingVacant!203) lt!19808)) (and (bvsge (index!2937 lt!19808) #b00000000000000000000000000000000) (bvslt (index!2937 lt!19808) (size!1624 (_keys!3464 lt!19302))))) (or ((_ is Undefined!203) lt!19808) (ite ((_ is Found!203) lt!19808) (= (select (arr!1421 (_keys!3464 lt!19302)) (index!2935 lt!19808)) (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!203) lt!19808) (= (select (arr!1421 (_keys!3464 lt!19302)) (index!2934 lt!19808)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!203) lt!19808) (= (select (arr!1421 (_keys!3464 lt!19302)) (index!2937 lt!19808)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!8567 (= lt!19808 e!28446)))

(declare-fun c!5966 () Bool)

(assert (=> d!8567 (= c!5966 (and ((_ is Intermediate!203) lt!19810) (undefined!1015 lt!19810)))))

(assert (=> d!8567 (= lt!19810 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000) (mask!5474 lt!19302)) (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000) (_keys!3464 lt!19302) (mask!5474 lt!19302)))))

(assert (=> d!8567 (validMask!0 (mask!5474 lt!19302))))

(assert (=> d!8567 (= (seekEntryOrOpen!0 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000) (_keys!3464 lt!19302) (mask!5474 lt!19302)) lt!19808)))

(declare-fun b!44883 () Bool)

(assert (=> b!44883 (= e!28444 (MissingZero!203 (index!2936 lt!19810)))))

(declare-fun b!44884 () Bool)

(assert (=> b!44884 (= e!28444 (seekKeyOrZeroReturnVacant!0 (x!8357 lt!19810) (index!2936 lt!19810) (index!2936 lt!19810) (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000) (_keys!3464 lt!19302) (mask!5474 lt!19302)))))

(assert (= (and d!8567 c!5966) b!44881))

(assert (= (and d!8567 (not c!5966)) b!44882))

(assert (= (and b!44882 c!5964) b!44879))

(assert (= (and b!44882 (not c!5964)) b!44880))

(assert (= (and b!44880 c!5965) b!44883))

(assert (= (and b!44880 (not c!5965)) b!44884))

(declare-fun m!39093 () Bool)

(assert (=> b!44882 m!39093))

(declare-fun m!39095 () Bool)

(assert (=> d!8567 m!39095))

(declare-fun m!39097 () Bool)

(assert (=> d!8567 m!39097))

(declare-fun m!39099 () Bool)

(assert (=> d!8567 m!39099))

(assert (=> d!8567 m!38491))

(declare-fun m!39101 () Bool)

(assert (=> d!8567 m!39101))

(declare-fun m!39103 () Bool)

(assert (=> d!8567 m!39103))

(assert (=> d!8567 m!38491))

(assert (=> d!8567 m!39099))

(assert (=> d!8567 m!38719))

(assert (=> b!44884 m!38491))

(declare-fun m!39105 () Bool)

(assert (=> b!44884 m!39105))

(assert (=> b!44573 d!8567))

(assert (=> b!44320 d!8543))

(assert (=> b!44572 d!8543))

(declare-fun d!8569 () Bool)

(declare-fun e!28448 () Bool)

(assert (=> d!8569 e!28448))

(declare-fun res!26395 () Bool)

(assert (=> d!8569 (=> res!26395 e!28448)))

(declare-fun lt!19812 () Bool)

(assert (=> d!8569 (= res!26395 (not lt!19812))))

(declare-fun lt!19813 () Bool)

(assert (=> d!8569 (= lt!19812 lt!19813)))

(declare-fun lt!19814 () Unit!1233)

(declare-fun e!28447 () Unit!1233)

(assert (=> d!8569 (= lt!19814 e!28447)))

(declare-fun c!5967 () Bool)

(assert (=> d!8569 (= c!5967 lt!19813)))

(assert (=> d!8569 (= lt!19813 (containsKey!75 (toList!622 (+!71 lt!19588 (tuple2!1637 lt!19587 (zeroValue!1815 lt!19302)))) lt!19580))))

(assert (=> d!8569 (= (contains!578 (+!71 lt!19588 (tuple2!1637 lt!19587 (zeroValue!1815 lt!19302))) lt!19580) lt!19812)))

(declare-fun b!44885 () Bool)

(declare-fun lt!19811 () Unit!1233)

(assert (=> b!44885 (= e!28447 lt!19811)))

(assert (=> b!44885 (= lt!19811 (lemmaContainsKeyImpliesGetValueByKeyDefined!63 (toList!622 (+!71 lt!19588 (tuple2!1637 lt!19587 (zeroValue!1815 lt!19302)))) lt!19580))))

(assert (=> b!44885 (isDefined!64 (getValueByKey!107 (toList!622 (+!71 lt!19588 (tuple2!1637 lt!19587 (zeroValue!1815 lt!19302)))) lt!19580))))

(declare-fun b!44886 () Bool)

(declare-fun Unit!1247 () Unit!1233)

(assert (=> b!44886 (= e!28447 Unit!1247)))

(declare-fun b!44887 () Bool)

(assert (=> b!44887 (= e!28448 (isDefined!64 (getValueByKey!107 (toList!622 (+!71 lt!19588 (tuple2!1637 lt!19587 (zeroValue!1815 lt!19302)))) lt!19580)))))

(assert (= (and d!8569 c!5967) b!44885))

(assert (= (and d!8569 (not c!5967)) b!44886))

(assert (= (and d!8569 (not res!26395)) b!44887))

(declare-fun m!39107 () Bool)

(assert (=> d!8569 m!39107))

(declare-fun m!39109 () Bool)

(assert (=> b!44885 m!39109))

(declare-fun m!39111 () Bool)

(assert (=> b!44885 m!39111))

(assert (=> b!44885 m!39111))

(declare-fun m!39113 () Bool)

(assert (=> b!44885 m!39113))

(assert (=> b!44887 m!39111))

(assert (=> b!44887 m!39111))

(assert (=> b!44887 m!39113))

(assert (=> b!44535 d!8569))

(declare-fun d!8571 () Bool)

(assert (=> d!8571 (= (apply!62 lt!19593 lt!19585) (get!802 (getValueByKey!107 (toList!622 lt!19593) lt!19585)))))

(declare-fun bs!2037 () Bool)

(assert (= bs!2037 d!8571))

(declare-fun m!39115 () Bool)

(assert (=> bs!2037 m!39115))

(assert (=> bs!2037 m!39115))

(declare-fun m!39117 () Bool)

(assert (=> bs!2037 m!39117))

(assert (=> b!44535 d!8571))

(declare-fun d!8573 () Bool)

(declare-fun e!28449 () Bool)

(assert (=> d!8573 e!28449))

(declare-fun res!26396 () Bool)

(assert (=> d!8573 (=> (not res!26396) (not e!28449))))

(declare-fun lt!19816 () ListLongMap!1213)

(assert (=> d!8573 (= res!26396 (contains!578 lt!19816 (_1!829 (tuple2!1637 lt!19587 (zeroValue!1815 lt!19302)))))))

(declare-fun lt!19817 () List!1210)

(assert (=> d!8573 (= lt!19816 (ListLongMap!1214 lt!19817))))

(declare-fun lt!19815 () Unit!1233)

(declare-fun lt!19818 () Unit!1233)

(assert (=> d!8573 (= lt!19815 lt!19818)))

(assert (=> d!8573 (= (getValueByKey!107 lt!19817 (_1!829 (tuple2!1637 lt!19587 (zeroValue!1815 lt!19302)))) (Some!112 (_2!829 (tuple2!1637 lt!19587 (zeroValue!1815 lt!19302)))))))

(assert (=> d!8573 (= lt!19818 (lemmaContainsTupThenGetReturnValue!31 lt!19817 (_1!829 (tuple2!1637 lt!19587 (zeroValue!1815 lt!19302))) (_2!829 (tuple2!1637 lt!19587 (zeroValue!1815 lt!19302)))))))

(assert (=> d!8573 (= lt!19817 (insertStrictlySorted!28 (toList!622 lt!19588) (_1!829 (tuple2!1637 lt!19587 (zeroValue!1815 lt!19302))) (_2!829 (tuple2!1637 lt!19587 (zeroValue!1815 lt!19302)))))))

(assert (=> d!8573 (= (+!71 lt!19588 (tuple2!1637 lt!19587 (zeroValue!1815 lt!19302))) lt!19816)))

(declare-fun b!44888 () Bool)

(declare-fun res!26397 () Bool)

(assert (=> b!44888 (=> (not res!26397) (not e!28449))))

(assert (=> b!44888 (= res!26397 (= (getValueByKey!107 (toList!622 lt!19816) (_1!829 (tuple2!1637 lt!19587 (zeroValue!1815 lt!19302)))) (Some!112 (_2!829 (tuple2!1637 lt!19587 (zeroValue!1815 lt!19302))))))))

(declare-fun b!44889 () Bool)

(assert (=> b!44889 (= e!28449 (contains!580 (toList!622 lt!19816) (tuple2!1637 lt!19587 (zeroValue!1815 lt!19302))))))

(assert (= (and d!8573 res!26396) b!44888))

(assert (= (and b!44888 res!26397) b!44889))

(declare-fun m!39119 () Bool)

(assert (=> d!8573 m!39119))

(declare-fun m!39121 () Bool)

(assert (=> d!8573 m!39121))

(declare-fun m!39123 () Bool)

(assert (=> d!8573 m!39123))

(declare-fun m!39125 () Bool)

(assert (=> d!8573 m!39125))

(declare-fun m!39127 () Bool)

(assert (=> b!44888 m!39127))

(declare-fun m!39129 () Bool)

(assert (=> b!44889 m!39129))

(assert (=> b!44535 d!8573))

(declare-fun d!8575 () Bool)

(declare-fun e!28450 () Bool)

(assert (=> d!8575 e!28450))

(declare-fun res!26398 () Bool)

(assert (=> d!8575 (=> (not res!26398) (not e!28450))))

(declare-fun lt!19820 () ListLongMap!1213)

(assert (=> d!8575 (= res!26398 (contains!578 lt!19820 (_1!829 (tuple2!1637 lt!19591 (zeroValue!1815 lt!19302)))))))

(declare-fun lt!19821 () List!1210)

(assert (=> d!8575 (= lt!19820 (ListLongMap!1214 lt!19821))))

(declare-fun lt!19819 () Unit!1233)

(declare-fun lt!19822 () Unit!1233)

(assert (=> d!8575 (= lt!19819 lt!19822)))

(assert (=> d!8575 (= (getValueByKey!107 lt!19821 (_1!829 (tuple2!1637 lt!19591 (zeroValue!1815 lt!19302)))) (Some!112 (_2!829 (tuple2!1637 lt!19591 (zeroValue!1815 lt!19302)))))))

(assert (=> d!8575 (= lt!19822 (lemmaContainsTupThenGetReturnValue!31 lt!19821 (_1!829 (tuple2!1637 lt!19591 (zeroValue!1815 lt!19302))) (_2!829 (tuple2!1637 lt!19591 (zeroValue!1815 lt!19302)))))))

(assert (=> d!8575 (= lt!19821 (insertStrictlySorted!28 (toList!622 lt!19583) (_1!829 (tuple2!1637 lt!19591 (zeroValue!1815 lt!19302))) (_2!829 (tuple2!1637 lt!19591 (zeroValue!1815 lt!19302)))))))

(assert (=> d!8575 (= (+!71 lt!19583 (tuple2!1637 lt!19591 (zeroValue!1815 lt!19302))) lt!19820)))

(declare-fun b!44890 () Bool)

(declare-fun res!26399 () Bool)

(assert (=> b!44890 (=> (not res!26399) (not e!28450))))

(assert (=> b!44890 (= res!26399 (= (getValueByKey!107 (toList!622 lt!19820) (_1!829 (tuple2!1637 lt!19591 (zeroValue!1815 lt!19302)))) (Some!112 (_2!829 (tuple2!1637 lt!19591 (zeroValue!1815 lt!19302))))))))

(declare-fun b!44891 () Bool)

(assert (=> b!44891 (= e!28450 (contains!580 (toList!622 lt!19820) (tuple2!1637 lt!19591 (zeroValue!1815 lt!19302))))))

(assert (= (and d!8575 res!26398) b!44890))

(assert (= (and b!44890 res!26399) b!44891))

(declare-fun m!39131 () Bool)

(assert (=> d!8575 m!39131))

(declare-fun m!39133 () Bool)

(assert (=> d!8575 m!39133))

(declare-fun m!39135 () Bool)

(assert (=> d!8575 m!39135))

(declare-fun m!39137 () Bool)

(assert (=> d!8575 m!39137))

(declare-fun m!39139 () Bool)

(assert (=> b!44890 m!39139))

(declare-fun m!39141 () Bool)

(assert (=> b!44891 m!39141))

(assert (=> b!44535 d!8575))

(declare-fun d!8577 () Bool)

(assert (=> d!8577 (= (apply!62 (+!71 lt!19596 (tuple2!1637 lt!19597 (minValue!1815 lt!19302))) lt!19584) (get!802 (getValueByKey!107 (toList!622 (+!71 lt!19596 (tuple2!1637 lt!19597 (minValue!1815 lt!19302)))) lt!19584)))))

(declare-fun bs!2038 () Bool)

(assert (= bs!2038 d!8577))

(declare-fun m!39143 () Bool)

(assert (=> bs!2038 m!39143))

(assert (=> bs!2038 m!39143))

(declare-fun m!39145 () Bool)

(assert (=> bs!2038 m!39145))

(assert (=> b!44535 d!8577))

(assert (=> b!44535 d!8497))

(declare-fun d!8579 () Bool)

(assert (=> d!8579 (= (apply!62 (+!71 lt!19593 (tuple2!1637 lt!19600 (minValue!1815 lt!19302))) lt!19585) (get!802 (getValueByKey!107 (toList!622 (+!71 lt!19593 (tuple2!1637 lt!19600 (minValue!1815 lt!19302)))) lt!19585)))))

(declare-fun bs!2039 () Bool)

(assert (= bs!2039 d!8579))

(declare-fun m!39147 () Bool)

(assert (=> bs!2039 m!39147))

(assert (=> bs!2039 m!39147))

(declare-fun m!39149 () Bool)

(assert (=> bs!2039 m!39149))

(assert (=> b!44535 d!8579))

(declare-fun d!8581 () Bool)

(assert (=> d!8581 (= (apply!62 (+!71 lt!19583 (tuple2!1637 lt!19591 (zeroValue!1815 lt!19302))) lt!19595) (apply!62 lt!19583 lt!19595))))

(declare-fun lt!19839 () Unit!1233)

(declare-fun choose!265 (ListLongMap!1213 (_ BitVec 64) V!2327 (_ BitVec 64)) Unit!1233)

(assert (=> d!8581 (= lt!19839 (choose!265 lt!19583 lt!19591 (zeroValue!1815 lt!19302) lt!19595))))

(declare-fun e!28457 () Bool)

(assert (=> d!8581 e!28457))

(declare-fun res!26402 () Bool)

(assert (=> d!8581 (=> (not res!26402) (not e!28457))))

(assert (=> d!8581 (= res!26402 (contains!578 lt!19583 lt!19595))))

(assert (=> d!8581 (= (addApplyDifferent!38 lt!19583 lt!19591 (zeroValue!1815 lt!19302) lt!19595) lt!19839)))

(declare-fun b!44903 () Bool)

(assert (=> b!44903 (= e!28457 (not (= lt!19595 lt!19591)))))

(assert (= (and d!8581 res!26402) b!44903))

(assert (=> d!8581 m!38651))

(assert (=> d!8581 m!38655))

(assert (=> d!8581 m!38683))

(declare-fun m!39151 () Bool)

(assert (=> d!8581 m!39151))

(assert (=> d!8581 m!38655))

(declare-fun m!39153 () Bool)

(assert (=> d!8581 m!39153))

(assert (=> b!44535 d!8581))

(declare-fun d!8583 () Bool)

(declare-fun e!28458 () Bool)

(assert (=> d!8583 e!28458))

(declare-fun res!26403 () Bool)

(assert (=> d!8583 (=> (not res!26403) (not e!28458))))

(declare-fun lt!19841 () ListLongMap!1213)

(assert (=> d!8583 (= res!26403 (contains!578 lt!19841 (_1!829 (tuple2!1637 lt!19600 (minValue!1815 lt!19302)))))))

(declare-fun lt!19842 () List!1210)

(assert (=> d!8583 (= lt!19841 (ListLongMap!1214 lt!19842))))

(declare-fun lt!19840 () Unit!1233)

(declare-fun lt!19843 () Unit!1233)

(assert (=> d!8583 (= lt!19840 lt!19843)))

(assert (=> d!8583 (= (getValueByKey!107 lt!19842 (_1!829 (tuple2!1637 lt!19600 (minValue!1815 lt!19302)))) (Some!112 (_2!829 (tuple2!1637 lt!19600 (minValue!1815 lt!19302)))))))

(assert (=> d!8583 (= lt!19843 (lemmaContainsTupThenGetReturnValue!31 lt!19842 (_1!829 (tuple2!1637 lt!19600 (minValue!1815 lt!19302))) (_2!829 (tuple2!1637 lt!19600 (minValue!1815 lt!19302)))))))

(assert (=> d!8583 (= lt!19842 (insertStrictlySorted!28 (toList!622 lt!19593) (_1!829 (tuple2!1637 lt!19600 (minValue!1815 lt!19302))) (_2!829 (tuple2!1637 lt!19600 (minValue!1815 lt!19302)))))))

(assert (=> d!8583 (= (+!71 lt!19593 (tuple2!1637 lt!19600 (minValue!1815 lt!19302))) lt!19841)))

(declare-fun b!44904 () Bool)

(declare-fun res!26404 () Bool)

(assert (=> b!44904 (=> (not res!26404) (not e!28458))))

(assert (=> b!44904 (= res!26404 (= (getValueByKey!107 (toList!622 lt!19841) (_1!829 (tuple2!1637 lt!19600 (minValue!1815 lt!19302)))) (Some!112 (_2!829 (tuple2!1637 lt!19600 (minValue!1815 lt!19302))))))))

(declare-fun b!44905 () Bool)

(assert (=> b!44905 (= e!28458 (contains!580 (toList!622 lt!19841) (tuple2!1637 lt!19600 (minValue!1815 lt!19302))))))

(assert (= (and d!8583 res!26403) b!44904))

(assert (= (and b!44904 res!26404) b!44905))

(declare-fun m!39155 () Bool)

(assert (=> d!8583 m!39155))

(declare-fun m!39157 () Bool)

(assert (=> d!8583 m!39157))

(declare-fun m!39159 () Bool)

(assert (=> d!8583 m!39159))

(declare-fun m!39161 () Bool)

(assert (=> d!8583 m!39161))

(declare-fun m!39163 () Bool)

(assert (=> b!44904 m!39163))

(declare-fun m!39165 () Bool)

(assert (=> b!44905 m!39165))

(assert (=> b!44535 d!8583))

(declare-fun d!8585 () Bool)

(declare-fun e!28461 () Bool)

(assert (=> d!8585 e!28461))

(declare-fun res!26406 () Bool)

(assert (=> d!8585 (=> (not res!26406) (not e!28461))))

(declare-fun lt!19845 () ListLongMap!1213)

(assert (=> d!8585 (= res!26406 (contains!578 lt!19845 (_1!829 (tuple2!1637 lt!19597 (minValue!1815 lt!19302)))))))

(declare-fun lt!19846 () List!1210)

(assert (=> d!8585 (= lt!19845 (ListLongMap!1214 lt!19846))))

(declare-fun lt!19844 () Unit!1233)

(declare-fun lt!19847 () Unit!1233)

(assert (=> d!8585 (= lt!19844 lt!19847)))

(assert (=> d!8585 (= (getValueByKey!107 lt!19846 (_1!829 (tuple2!1637 lt!19597 (minValue!1815 lt!19302)))) (Some!112 (_2!829 (tuple2!1637 lt!19597 (minValue!1815 lt!19302)))))))

(assert (=> d!8585 (= lt!19847 (lemmaContainsTupThenGetReturnValue!31 lt!19846 (_1!829 (tuple2!1637 lt!19597 (minValue!1815 lt!19302))) (_2!829 (tuple2!1637 lt!19597 (minValue!1815 lt!19302)))))))

(assert (=> d!8585 (= lt!19846 (insertStrictlySorted!28 (toList!622 lt!19596) (_1!829 (tuple2!1637 lt!19597 (minValue!1815 lt!19302))) (_2!829 (tuple2!1637 lt!19597 (minValue!1815 lt!19302)))))))

(assert (=> d!8585 (= (+!71 lt!19596 (tuple2!1637 lt!19597 (minValue!1815 lt!19302))) lt!19845)))

(declare-fun b!44906 () Bool)

(declare-fun res!26408 () Bool)

(assert (=> b!44906 (=> (not res!26408) (not e!28461))))

(assert (=> b!44906 (= res!26408 (= (getValueByKey!107 (toList!622 lt!19845) (_1!829 (tuple2!1637 lt!19597 (minValue!1815 lt!19302)))) (Some!112 (_2!829 (tuple2!1637 lt!19597 (minValue!1815 lt!19302))))))))

(declare-fun b!44907 () Bool)

(assert (=> b!44907 (= e!28461 (contains!580 (toList!622 lt!19845) (tuple2!1637 lt!19597 (minValue!1815 lt!19302))))))

(assert (= (and d!8585 res!26406) b!44906))

(assert (= (and b!44906 res!26408) b!44907))

(declare-fun m!39167 () Bool)

(assert (=> d!8585 m!39167))

(declare-fun m!39169 () Bool)

(assert (=> d!8585 m!39169))

(declare-fun m!39171 () Bool)

(assert (=> d!8585 m!39171))

(declare-fun m!39173 () Bool)

(assert (=> d!8585 m!39173))

(declare-fun m!39175 () Bool)

(assert (=> b!44906 m!39175))

(declare-fun m!39177 () Bool)

(assert (=> b!44907 m!39177))

(assert (=> b!44535 d!8585))

(declare-fun d!8587 () Bool)

(assert (=> d!8587 (= (apply!62 lt!19583 lt!19595) (get!802 (getValueByKey!107 (toList!622 lt!19583) lt!19595)))))

(declare-fun bs!2040 () Bool)

(assert (= bs!2040 d!8587))

(declare-fun m!39179 () Bool)

(assert (=> bs!2040 m!39179))

(assert (=> bs!2040 m!39179))

(declare-fun m!39181 () Bool)

(assert (=> bs!2040 m!39181))

(assert (=> b!44535 d!8587))

(declare-fun d!8589 () Bool)

(assert (=> d!8589 (= (apply!62 lt!19596 lt!19584) (get!802 (getValueByKey!107 (toList!622 lt!19596) lt!19584)))))

(declare-fun bs!2041 () Bool)

(assert (= bs!2041 d!8589))

(declare-fun m!39183 () Bool)

(assert (=> bs!2041 m!39183))

(assert (=> bs!2041 m!39183))

(declare-fun m!39185 () Bool)

(assert (=> bs!2041 m!39185))

(assert (=> b!44535 d!8589))

(declare-fun d!8591 () Bool)

(assert (=> d!8591 (contains!578 (+!71 lt!19588 (tuple2!1637 lt!19587 (zeroValue!1815 lt!19302))) lt!19580)))

(declare-fun lt!19850 () Unit!1233)

(declare-fun choose!267 (ListLongMap!1213 (_ BitVec 64) V!2327 (_ BitVec 64)) Unit!1233)

(assert (=> d!8591 (= lt!19850 (choose!267 lt!19588 lt!19587 (zeroValue!1815 lt!19302) lt!19580))))

(assert (=> d!8591 (contains!578 lt!19588 lt!19580)))

(assert (=> d!8591 (= (addStillContains!38 lt!19588 lt!19587 (zeroValue!1815 lt!19302) lt!19580) lt!19850)))

(declare-fun bs!2042 () Bool)

(assert (= bs!2042 d!8591))

(assert (=> bs!2042 m!38681))

(assert (=> bs!2042 m!38681))

(assert (=> bs!2042 m!38691))

(declare-fun m!39187 () Bool)

(assert (=> bs!2042 m!39187))

(declare-fun m!39189 () Bool)

(assert (=> bs!2042 m!39189))

(assert (=> b!44535 d!8591))

(declare-fun d!8593 () Bool)

(assert (=> d!8593 (= (apply!62 (+!71 lt!19583 (tuple2!1637 lt!19591 (zeroValue!1815 lt!19302))) lt!19595) (get!802 (getValueByKey!107 (toList!622 (+!71 lt!19583 (tuple2!1637 lt!19591 (zeroValue!1815 lt!19302)))) lt!19595)))))

(declare-fun bs!2043 () Bool)

(assert (= bs!2043 d!8593))

(declare-fun m!39191 () Bool)

(assert (=> bs!2043 m!39191))

(assert (=> bs!2043 m!39191))

(declare-fun m!39193 () Bool)

(assert (=> bs!2043 m!39193))

(assert (=> b!44535 d!8593))

(declare-fun d!8595 () Bool)

(assert (=> d!8595 (= (apply!62 (+!71 lt!19593 (tuple2!1637 lt!19600 (minValue!1815 lt!19302))) lt!19585) (apply!62 lt!19593 lt!19585))))

(declare-fun lt!19851 () Unit!1233)

(assert (=> d!8595 (= lt!19851 (choose!265 lt!19593 lt!19600 (minValue!1815 lt!19302) lt!19585))))

(declare-fun e!28470 () Bool)

(assert (=> d!8595 e!28470))

(declare-fun res!26415 () Bool)

(assert (=> d!8595 (=> (not res!26415) (not e!28470))))

(assert (=> d!8595 (= res!26415 (contains!578 lt!19593 lt!19585))))

(assert (=> d!8595 (= (addApplyDifferent!38 lt!19593 lt!19600 (minValue!1815 lt!19302) lt!19585) lt!19851)))

(declare-fun b!44925 () Bool)

(assert (=> b!44925 (= e!28470 (not (= lt!19585 lt!19600)))))

(assert (= (and d!8595 res!26415) b!44925))

(assert (=> d!8595 m!38671))

(assert (=> d!8595 m!38685))

(assert (=> d!8595 m!38689))

(declare-fun m!39195 () Bool)

(assert (=> d!8595 m!39195))

(assert (=> d!8595 m!38685))

(declare-fun m!39197 () Bool)

(assert (=> d!8595 m!39197))

(assert (=> b!44535 d!8595))

(declare-fun d!8597 () Bool)

(assert (=> d!8597 (= (apply!62 (+!71 lt!19596 (tuple2!1637 lt!19597 (minValue!1815 lt!19302))) lt!19584) (apply!62 lt!19596 lt!19584))))

(declare-fun lt!19852 () Unit!1233)

(assert (=> d!8597 (= lt!19852 (choose!265 lt!19596 lt!19597 (minValue!1815 lt!19302) lt!19584))))

(declare-fun e!28471 () Bool)

(assert (=> d!8597 e!28471))

(declare-fun res!26416 () Bool)

(assert (=> d!8597 (=> (not res!26416) (not e!28471))))

(assert (=> d!8597 (= res!26416 (contains!578 lt!19596 lt!19584))))

(assert (=> d!8597 (= (addApplyDifferent!38 lt!19596 lt!19597 (minValue!1815 lt!19302) lt!19584) lt!19852)))

(declare-fun b!44926 () Bool)

(assert (=> b!44926 (= e!28471 (not (= lt!19584 lt!19597)))))

(assert (= (and d!8597 res!26416) b!44926))

(assert (=> d!8597 m!38665))

(assert (=> d!8597 m!38659))

(assert (=> d!8597 m!38661))

(declare-fun m!39199 () Bool)

(assert (=> d!8597 m!39199))

(assert (=> d!8597 m!38659))

(declare-fun m!39201 () Bool)

(assert (=> d!8597 m!39201))

(assert (=> b!44535 d!8597))

(assert (=> d!8457 d!8309))

(declare-fun d!8599 () Bool)

(assert (=> d!8599 (= (validMask!0 (mask!5474 lt!19302)) (and (or (= (mask!5474 lt!19302) #b00000000000000000000000000000111) (= (mask!5474 lt!19302) #b00000000000000000000000000001111) (= (mask!5474 lt!19302) #b00000000000000000000000000011111) (= (mask!5474 lt!19302) #b00000000000000000000000000111111) (= (mask!5474 lt!19302) #b00000000000000000000000001111111) (= (mask!5474 lt!19302) #b00000000000000000000000011111111) (= (mask!5474 lt!19302) #b00000000000000000000000111111111) (= (mask!5474 lt!19302) #b00000000000000000000001111111111) (= (mask!5474 lt!19302) #b00000000000000000000011111111111) (= (mask!5474 lt!19302) #b00000000000000000000111111111111) (= (mask!5474 lt!19302) #b00000000000000000001111111111111) (= (mask!5474 lt!19302) #b00000000000000000011111111111111) (= (mask!5474 lt!19302) #b00000000000000000111111111111111) (= (mask!5474 lt!19302) #b00000000000000001111111111111111) (= (mask!5474 lt!19302) #b00000000000000011111111111111111) (= (mask!5474 lt!19302) #b00000000000000111111111111111111) (= (mask!5474 lt!19302) #b00000000000001111111111111111111) (= (mask!5474 lt!19302) #b00000000000011111111111111111111) (= (mask!5474 lt!19302) #b00000000000111111111111111111111) (= (mask!5474 lt!19302) #b00000000001111111111111111111111) (= (mask!5474 lt!19302) #b00000000011111111111111111111111) (= (mask!5474 lt!19302) #b00000000111111111111111111111111) (= (mask!5474 lt!19302) #b00000001111111111111111111111111) (= (mask!5474 lt!19302) #b00000011111111111111111111111111) (= (mask!5474 lt!19302) #b00000111111111111111111111111111) (= (mask!5474 lt!19302) #b00001111111111111111111111111111) (= (mask!5474 lt!19302) #b00011111111111111111111111111111) (= (mask!5474 lt!19302) #b00111111111111111111111111111111)) (bvsle (mask!5474 lt!19302) #b00111111111111111111111111111111)))))

(assert (=> d!8373 d!8599))

(assert (=> b!44534 d!8543))

(declare-fun bm!3672 () Bool)

(declare-fun call!3675 () Bool)

(declare-fun c!5980 () Bool)

(assert (=> bm!3672 (= call!3675 (arrayNoDuplicates!0 (_keys!3464 lt!19302) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5980 (Cons!1207 (select (arr!1421 (_keys!3464 lt!19302)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5800 (Cons!1207 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000) Nil!1208) Nil!1208)) (ite c!5800 (Cons!1207 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000) Nil!1208) Nil!1208))))))

(declare-fun b!44939 () Bool)

(declare-fun e!28480 () Bool)

(declare-fun e!28481 () Bool)

(assert (=> b!44939 (= e!28480 e!28481)))

(assert (=> b!44939 (= c!5980 (validKeyInArray!0 (select (arr!1421 (_keys!3464 lt!19302)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!8601 () Bool)

(declare-fun res!26423 () Bool)

(declare-fun e!28482 () Bool)

(assert (=> d!8601 (=> res!26423 e!28482)))

(assert (=> d!8601 (= res!26423 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1624 (_keys!3464 lt!19302))))))

(assert (=> d!8601 (= (arrayNoDuplicates!0 (_keys!3464 lt!19302) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5800 (Cons!1207 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000) Nil!1208) Nil!1208)) e!28482)))

(declare-fun b!44940 () Bool)

(assert (=> b!44940 (= e!28482 e!28480)))

(declare-fun res!26421 () Bool)

(assert (=> b!44940 (=> (not res!26421) (not e!28480))))

(declare-fun e!28479 () Bool)

(assert (=> b!44940 (= res!26421 (not e!28479))))

(declare-fun res!26422 () Bool)

(assert (=> b!44940 (=> (not res!26422) (not e!28479))))

(assert (=> b!44940 (= res!26422 (validKeyInArray!0 (select (arr!1421 (_keys!3464 lt!19302)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!44941 () Bool)

(assert (=> b!44941 (= e!28481 call!3675)))

(declare-fun b!44942 () Bool)

(assert (=> b!44942 (= e!28479 (contains!575 (ite c!5800 (Cons!1207 (select (arr!1421 (_keys!3464 lt!19302)) #b00000000000000000000000000000000) Nil!1208) Nil!1208) (select (arr!1421 (_keys!3464 lt!19302)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!44943 () Bool)

(assert (=> b!44943 (= e!28481 call!3675)))

(assert (= (and d!8601 (not res!26423)) b!44940))

(assert (= (and b!44940 res!26422) b!44942))

(assert (= (and b!44940 res!26421) b!44939))

(assert (= (and b!44939 c!5980) b!44941))

(assert (= (and b!44939 (not c!5980)) b!44943))

(assert (= (or b!44941 b!44943) bm!3672))

(assert (=> bm!3672 m!38911))

(declare-fun m!39203 () Bool)

(assert (=> bm!3672 m!39203))

(assert (=> b!44939 m!38911))

(assert (=> b!44939 m!38911))

(assert (=> b!44939 m!38913))

(assert (=> b!44940 m!38911))

(assert (=> b!44940 m!38911))

(assert (=> b!44940 m!38913))

(assert (=> b!44942 m!38911))

(assert (=> b!44942 m!38911))

(declare-fun m!39205 () Bool)

(assert (=> b!44942 m!39205))

(assert (=> bm!3576 d!8601))

(declare-fun d!8603 () Bool)

(declare-fun res!26424 () Bool)

(declare-fun e!28483 () Bool)

(assert (=> d!8603 (=> res!26424 e!28483)))

(assert (=> d!8603 (= res!26424 (= (select (arr!1421 lt!19304) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19368))))

(assert (=> d!8603 (= (arrayContainsKey!0 lt!19304 lt!19368 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!28483)))

(declare-fun b!44944 () Bool)

(declare-fun e!28484 () Bool)

(assert (=> b!44944 (= e!28483 e!28484)))

(declare-fun res!26425 () Bool)

(assert (=> b!44944 (=> (not res!26425) (not e!28484))))

(assert (=> b!44944 (= res!26425 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1624 lt!19304)))))

(declare-fun b!44945 () Bool)

(assert (=> b!44945 (= e!28484 (arrayContainsKey!0 lt!19304 lt!19368 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!8603 (not res!26424)) b!44944))

(assert (= (and b!44944 res!26425) b!44945))

(assert (=> d!8603 m!38485))

(declare-fun m!39207 () Bool)

(assert (=> b!44945 m!39207))

(assert (=> b!44581 d!8603))

(assert (=> d!8365 d!8287))

(assert (=> d!8453 d!8599))

(declare-fun b!44984 () Bool)

(declare-fun e!28511 () SeekEntryResult!203)

(assert (=> b!44984 (= e!28511 (Intermediate!203 false (toIndex!0 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun d!8605 () Bool)

(declare-fun e!28512 () Bool)

(assert (=> d!8605 e!28512))

(declare-fun c!5991 () Bool)

(declare-fun lt!19892 () SeekEntryResult!203)

(assert (=> d!8605 (= c!5991 (and ((_ is Intermediate!203) lt!19892) (undefined!1015 lt!19892)))))

(declare-fun e!28510 () SeekEntryResult!203)

(assert (=> d!8605 (= lt!19892 e!28510)))

(declare-fun c!5992 () Bool)

(assert (=> d!8605 (= c!5992 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!19893 () (_ BitVec 64))

(assert (=> d!8605 (= lt!19893 (select (arr!1421 lt!19304) (toIndex!0 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) mask!853)))))

(assert (=> d!8605 (validMask!0 mask!853)))

(assert (=> d!8605 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) mask!853) (select (arr!1421 lt!19304) #b00000000000000000000000000000000) lt!19304 mask!853) lt!19892)))

(declare-fun b!44985 () Bool)

(assert (=> b!44985 (= e!28512 (bvsge (x!8357 lt!19892) #b01111111111111111111111111111110))))

(declare-fun b!44986 () Bool)

(assert (=> b!44986 (and (bvsge (index!2936 lt!19892) #b00000000000000000000000000000000) (bvslt (index!2936 lt!19892) (size!1624 lt!19304)))))

(declare-fun e!28508 () Bool)

(assert (=> b!44986 (= e!28508 (= (select (arr!1421 lt!19304) (index!2936 lt!19892)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!44987 () Bool)

(assert (=> b!44987 (and (bvsge (index!2936 lt!19892) #b00000000000000000000000000000000) (bvslt (index!2936 lt!19892) (size!1624 lt!19304)))))

(declare-fun res!26447 () Bool)

(assert (=> b!44987 (= res!26447 (= (select (arr!1421 lt!19304) (index!2936 lt!19892)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!44987 (=> res!26447 e!28508)))

(declare-fun b!44988 () Bool)

(assert (=> b!44988 (= e!28510 e!28511)))

(declare-fun c!5990 () Bool)

(assert (=> b!44988 (= c!5990 (or (= lt!19893 (select (arr!1421 lt!19304) #b00000000000000000000000000000000)) (= (bvadd lt!19893 lt!19893) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!44989 () Bool)

(assert (=> b!44989 (= e!28510 (Intermediate!203 true (toIndex!0 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun b!44990 () Bool)

(assert (=> b!44990 (= e!28511 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000 mask!853) (select (arr!1421 lt!19304) #b00000000000000000000000000000000) lt!19304 mask!853))))

(declare-fun b!44991 () Bool)

(declare-fun e!28509 () Bool)

(assert (=> b!44991 (= e!28512 e!28509)))

(declare-fun res!26446 () Bool)

(assert (=> b!44991 (= res!26446 (and ((_ is Intermediate!203) lt!19892) (not (undefined!1015 lt!19892)) (bvslt (x!8357 lt!19892) #b01111111111111111111111111111110) (bvsge (x!8357 lt!19892) #b00000000000000000000000000000000) (bvsge (x!8357 lt!19892) #b00000000000000000000000000000000)))))

(assert (=> b!44991 (=> (not res!26446) (not e!28509))))

(declare-fun b!44992 () Bool)

(assert (=> b!44992 (and (bvsge (index!2936 lt!19892) #b00000000000000000000000000000000) (bvslt (index!2936 lt!19892) (size!1624 lt!19304)))))

(declare-fun res!26445 () Bool)

(assert (=> b!44992 (= res!26445 (= (select (arr!1421 lt!19304) (index!2936 lt!19892)) (select (arr!1421 lt!19304) #b00000000000000000000000000000000)))))

(assert (=> b!44992 (=> res!26445 e!28508)))

(assert (=> b!44992 (= e!28509 e!28508)))

(assert (= (and d!8605 c!5992) b!44989))

(assert (= (and d!8605 (not c!5992)) b!44988))

(assert (= (and b!44988 c!5990) b!44984))

(assert (= (and b!44988 (not c!5990)) b!44990))

(assert (= (and d!8605 c!5991) b!44985))

(assert (= (and d!8605 (not c!5991)) b!44991))

(assert (= (and b!44991 res!26446) b!44992))

(assert (= (and b!44992 (not res!26445)) b!44987))

(assert (= (and b!44987 (not res!26447)) b!44986))

(assert (=> b!44990 m!38763))

(declare-fun m!39293 () Bool)

(assert (=> b!44990 m!39293))

(assert (=> b!44990 m!39293))

(assert (=> b!44990 m!38377))

(declare-fun m!39295 () Bool)

(assert (=> b!44990 m!39295))

(declare-fun m!39297 () Bool)

(assert (=> b!44986 m!39297))

(assert (=> b!44992 m!39297))

(assert (=> b!44987 m!39297))

(assert (=> d!8605 m!38763))

(declare-fun m!39299 () Bool)

(assert (=> d!8605 m!39299))

(assert (=> d!8605 m!38295))

(assert (=> d!8441 d!8605))

(declare-fun d!8627 () Bool)

(declare-fun lt!19903 () (_ BitVec 32))

(declare-fun lt!19902 () (_ BitVec 32))

(assert (=> d!8627 (= lt!19903 (bvmul (bvxor lt!19902 (bvlshr lt!19902 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!8627 (= lt!19902 ((_ extract 31 0) (bvand (bvxor (select (arr!1421 lt!19304) #b00000000000000000000000000000000) (bvlshr (select (arr!1421 lt!19304) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!8627 (and (bvsge mask!853 #b00000000000000000000000000000000) (let ((res!26449 (let ((h!1787 ((_ extract 31 0) (bvand (bvxor (select (arr!1421 lt!19304) #b00000000000000000000000000000000) (bvlshr (select (arr!1421 lt!19304) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!8379 (bvmul (bvxor h!1787 (bvlshr h!1787 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!8379 (bvlshr x!8379 #b00000000000000000000000000001101)) mask!853))))) (and (bvslt res!26449 (bvadd mask!853 #b00000000000000000000000000000001)) (bvsge res!26449 #b00000000000000000000000000000000))))))

(assert (=> d!8627 (= (toIndex!0 (select (arr!1421 lt!19304) #b00000000000000000000000000000000) mask!853) (bvand (bvxor lt!19903 (bvlshr lt!19903 #b00000000000000000000000000001101)) mask!853))))

(assert (=> d!8441 d!8627))

(assert (=> d!8441 d!8337))

(assert (=> d!8455 d!8295))

(declare-fun d!8635 () Bool)

(assert (=> d!8635 (= (content!42 Nil!1208) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!8355 d!8635))

(declare-fun b_lambda!2335 () Bool)

(assert (= b_lambda!2323 (or (and start!6738 b_free!1515 (= defaultEntry!470 (defaultEntry!1897 lt!19302))) b_lambda!2335)))

(check-sat (not b!44733) (not b!44884) (not b!44809) (not b!44811) (not b!44837) (not b_lambda!2329) (not b!44847) (not b!44734) (not b_lambda!2327) (not bm!3657) (not b!44810) (not d!8547) (not b!44729) (not d!8577) (not b!44942) (not b!44752) (not d!8469) (not b!44891) b_and!2719 (not b_lambda!2319) (not d!8549) (not b!44885) (not bm!3659) (not d!8567) (not b!44744) (not d!8605) (not d!8597) (not b!44740) (not b!44748) (not d!8545) (not d!8485) (not b!44888) (not b!44823) (not bm!3668) (not b!44842) (not d!8593) (not b!44738) (not b!44907) (not d!8563) (not d!8585) (not b!44816) (not d!8471) (not d!8535) (not d!8475) (not b_next!1515) (not bm!3658) (not d!8579) (not bm!3660) (not b!44732) (not b!44750) (not b!44812) (not bm!3672) (not d!8581) (not d!8491) (not b!44852) (not d!8541) (not d!8575) (not d!8589) (not b!44807) (not b!44876) (not b!44851) (not b!44722) (not d!8587) (not b_lambda!2335) (not bm!3666) (not d!8529) (not b!44724) (not b!44945) (not d!8573) (not b!44905) (not b!44890) (not d!8595) (not d!8569) (not b!44848) (not b!44715) (not b!44821) (not d!8591) (not b!44743) (not b!44887) (not b!44813) (not d!8583) (not b!44904) (not d!8497) (not b!44990) (not b!44815) (not b!44840) (not b!44906) (not b!44730) (not b!44831) (not b!44838) (not b!44940) (not d!8571) (not b!44878) (not d!8477) (not d!8555) (not b!44749) (not d!8481) (not b!44939) tp_is_empty!1905 (not b!44889))
(check-sat b_and!2719 (not b_next!1515))
