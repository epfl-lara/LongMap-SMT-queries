; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6736 () Bool)

(assert start!6736)

(declare-fun b_free!1513 () Bool)

(declare-fun b_next!1513 () Bool)

(assert (=> start!6736 (= b_free!1513 (not b_next!1513))))

(declare-fun tp!5957 () Bool)

(declare-fun b_and!2699 () Bool)

(assert (=> start!6736 (= tp!5957 b_and!2699)))

(declare-fun b!44064 () Bool)

(declare-fun e!27939 () Bool)

(declare-fun lt!19260 () Bool)

(assert (=> b!44064 (= e!27939 (not lt!19260))))

(declare-fun res!26037 () Bool)

(declare-fun e!27937 () Bool)

(assert (=> start!6736 (=> (not res!26037) (not e!27937))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6736 (= res!26037 (validMask!0 mask!853))))

(assert (=> start!6736 e!27937))

(assert (=> start!6736 true))

(assert (=> start!6736 tp!5957))

(declare-fun b!44065 () Bool)

(declare-fun e!27940 () Bool)

(declare-datatypes ((array!2951 0))(
  ( (array!2952 (arr!1419 (Array (_ BitVec 32) (_ BitVec 64))) (size!1622 (_ BitVec 32))) )
))
(declare-fun lt!19268 () array!2951)

(declare-datatypes ((V!2325 0))(
  ( (V!2326 (val!990 Int)) )
))
(declare-datatypes ((tuple2!1634 0))(
  ( (tuple2!1635 (_1!828 (_ BitVec 64)) (_2!828 V!2325)) )
))
(declare-fun lt!19270 () tuple2!1634)

(declare-fun arrayContainsKey!0 (array!2951 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!44065 (= e!27940 (arrayContainsKey!0 lt!19268 (_1!828 lt!19270) #b00000000000000000000000000000000))))

(declare-fun b!44066 () Bool)

(declare-datatypes ((Unit!1229 0))(
  ( (Unit!1230) )
))
(declare-fun e!27938 () Unit!1229)

(declare-fun Unit!1231 () Unit!1229)

(assert (=> b!44066 (= e!27938 Unit!1231)))

(declare-datatypes ((List!1208 0))(
  ( (Nil!1205) (Cons!1204 (h!1781 tuple2!1634) (t!4223 List!1208)) )
))
(declare-datatypes ((ListLongMap!1211 0))(
  ( (ListLongMap!1212 (toList!621 List!1208)) )
))
(declare-fun lt!19269 () ListLongMap!1211)

(declare-fun head!893 (List!1208) tuple2!1634)

(assert (=> b!44066 (= lt!19270 (head!893 (toList!621 lt!19269)))))

(declare-fun lt!19266 () Unit!1229)

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!19271 () V!2325)

(declare-datatypes ((ValueCell!704 0))(
  ( (ValueCellFull!704 (v!2086 V!2325)) (EmptyCell!704) )
))
(declare-datatypes ((array!2953 0))(
  ( (array!2954 (arr!1420 (Array (_ BitVec 32) ValueCell!704)) (size!1623 (_ BitVec 32))) )
))
(declare-fun lt!19261 () array!2953)

(declare-fun lemmaKeyInListMapIsInArray!106 (array!2951 array!2953 (_ BitVec 32) (_ BitVec 32) V!2325 V!2325 (_ BitVec 64) Int) Unit!1229)

(assert (=> b!44066 (= lt!19266 (lemmaKeyInListMapIsInArray!106 lt!19268 lt!19261 mask!853 #b00000000000000000000000000000000 lt!19271 lt!19271 (_1!828 lt!19270) defaultEntry!470))))

(declare-fun res!26035 () Bool)

(assert (=> b!44066 (= res!26035 (and (not (= (_1!828 lt!19270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!828 lt!19270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!44066 (=> (not res!26035) (not e!27940))))

(assert (=> b!44066 e!27940))

(declare-fun lt!19265 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2951 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!44066 (= lt!19265 (arrayScanForKey!0 lt!19268 (_1!828 lt!19270) #b00000000000000000000000000000000))))

(assert (=> b!44066 false))

(declare-fun b!44067 () Bool)

(declare-fun Unit!1232 () Unit!1229)

(assert (=> b!44067 (= e!27938 Unit!1232)))

(declare-fun b!44068 () Bool)

(assert (=> b!44068 (= e!27937 (not e!27939))))

(declare-fun res!26036 () Bool)

(assert (=> b!44068 (=> (not res!26036) (not e!27939))))

(declare-datatypes ((LongMapFixedSize!388 0))(
  ( (LongMapFixedSize!389 (defaultEntry!1896 Int) (mask!5473 (_ BitVec 32)) (extraKeys!1787 (_ BitVec 32)) (zeroValue!1814 V!2325) (minValue!1814 V!2325) (_size!243 (_ BitVec 32)) (_keys!3463 array!2951) (_values!1879 array!2953) (_vacant!243 (_ BitVec 32))) )
))
(declare-fun lt!19259 () LongMapFixedSize!388)

(declare-fun valid!124 (LongMapFixedSize!388) Bool)

(assert (=> b!44068 (= res!26036 (valid!124 lt!19259))))

(declare-fun lt!19264 () Unit!1229)

(assert (=> b!44068 (= lt!19264 e!27938)))

(declare-fun c!5735 () Bool)

(assert (=> b!44068 (= c!5735 lt!19260)))

(assert (=> b!44068 (= lt!19260 (not (= lt!19269 (ListLongMap!1212 Nil!1205))))))

(declare-fun map!842 (LongMapFixedSize!388) ListLongMap!1211)

(assert (=> b!44068 (= lt!19269 (map!842 lt!19259))))

(declare-datatypes ((List!1209 0))(
  ( (Nil!1206) (Cons!1205 (h!1782 (_ BitVec 64)) (t!4224 List!1209)) )
))
(declare-fun arrayNoDuplicates!0 (array!2951 (_ BitVec 32) List!1209) Bool)

(assert (=> b!44068 (arrayNoDuplicates!0 lt!19268 #b00000000000000000000000000000000 Nil!1206)))

(declare-fun lt!19262 () Unit!1229)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2951 (_ BitVec 32) (_ BitVec 32) List!1209) Unit!1229)

(assert (=> b!44068 (= lt!19262 (lemmaArrayNoDuplicatesInAll0Array!0 lt!19268 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2951 (_ BitVec 32)) Bool)

(assert (=> b!44068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19268 mask!853)))

(declare-fun lt!19267 () Unit!1229)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2951 (_ BitVec 32) (_ BitVec 32)) Unit!1229)

(assert (=> b!44068 (= lt!19267 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!19268 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2951 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!44068 (= (arrayCountValidKeys!0 lt!19268 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!19263 () Unit!1229)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2951 (_ BitVec 32) (_ BitVec 32)) Unit!1229)

(assert (=> b!44068 (= lt!19263 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!19268 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!44068 (= lt!19259 (LongMapFixedSize!389 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19271 lt!19271 #b00000000000000000000000000000000 lt!19268 lt!19261 #b00000000000000000000000000000000))))

(assert (=> b!44068 (= lt!19261 (array!2954 ((as const (Array (_ BitVec 32) ValueCell!704)) EmptyCell!704) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!44068 (= lt!19268 (array!2952 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!265 (Int (_ BitVec 64)) V!2325)

(assert (=> b!44068 (= lt!19271 (dynLambda!265 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6736 res!26037) b!44068))

(assert (= (and b!44068 c!5735) b!44066))

(assert (= (and b!44068 (not c!5735)) b!44067))

(assert (= (and b!44066 res!26035) b!44065))

(assert (= (and b!44068 res!26036) b!44064))

(declare-fun b_lambda!2309 () Bool)

(assert (=> (not b_lambda!2309) (not b!44068)))

(declare-fun t!4222 () Bool)

(declare-fun tb!1001 () Bool)

(assert (=> (and start!6736 (= defaultEntry!470 defaultEntry!470) t!4222) tb!1001))

(declare-fun result!1747 () Bool)

(declare-fun tp_is_empty!1903 () Bool)

(assert (=> tb!1001 (= result!1747 tp_is_empty!1903)))

(assert (=> b!44068 t!4222))

(declare-fun b_and!2701 () Bool)

(assert (= b_and!2699 (and (=> t!4222 result!1747) b_and!2701)))

(declare-fun m!38267 () Bool)

(assert (=> start!6736 m!38267))

(declare-fun m!38269 () Bool)

(assert (=> b!44065 m!38269))

(declare-fun m!38271 () Bool)

(assert (=> b!44066 m!38271))

(declare-fun m!38273 () Bool)

(assert (=> b!44066 m!38273))

(declare-fun m!38275 () Bool)

(assert (=> b!44066 m!38275))

(declare-fun m!38277 () Bool)

(assert (=> b!44068 m!38277))

(declare-fun m!38279 () Bool)

(assert (=> b!44068 m!38279))

(declare-fun m!38281 () Bool)

(assert (=> b!44068 m!38281))

(declare-fun m!38283 () Bool)

(assert (=> b!44068 m!38283))

(declare-fun m!38285 () Bool)

(assert (=> b!44068 m!38285))

(declare-fun m!38287 () Bool)

(assert (=> b!44068 m!38287))

(declare-fun m!38289 () Bool)

(assert (=> b!44068 m!38289))

(declare-fun m!38291 () Bool)

(assert (=> b!44068 m!38291))

(declare-fun m!38293 () Bool)

(assert (=> b!44068 m!38293))

(push 1)

(assert (not start!6736))

(assert b_and!2701)

(assert (not b!44066))

(assert (not b_lambda!2309))

(assert (not b!44068))

(assert tp_is_empty!1903)

(assert (not b!44065))

(assert (not b_next!1513))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2701)

(assert (not b_next!1513))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!2315 () Bool)

(assert (= b_lambda!2309 (or (and start!6736 b_free!1513) b_lambda!2315)))

(push 1)

(assert (not start!6736))

(assert b_and!2701)

(assert (not b!44066))

(assert (not b_lambda!2315))

(assert (not b!44068))

(assert tp_is_empty!1903)

(assert (not b!44065))

(assert (not b_next!1513))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2701)

(assert (not b_next!1513))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!8275 () Bool)

(assert (=> d!8275 (= (arrayCountValidKeys!0 lt!19268 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!19352 () Unit!1229)

(declare-fun choose!59 (array!2951 (_ BitVec 32) (_ BitVec 32)) Unit!1229)

(assert (=> d!8275 (= lt!19352 (choose!59 lt!19268 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8275 (bvslt (size!1622 lt!19268) #b01111111111111111111111111111111)))

(assert (=> d!8275 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!19268 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!19352)))

(declare-fun bs!2004 () Bool)

(assert (= bs!2004 d!8275))

(assert (=> bs!2004 m!38293))

(declare-fun m!38351 () Bool)

(assert (=> bs!2004 m!38351))

(assert (=> b!44068 d!8275))

(declare-fun d!8277 () Bool)

(assert (=> d!8277 (arrayNoDuplicates!0 lt!19268 #b00000000000000000000000000000000 Nil!1206)))

(declare-fun lt!19355 () Unit!1229)

(declare-fun choose!111 (array!2951 (_ BitVec 32) (_ BitVec 32) List!1209) Unit!1229)

(assert (=> d!8277 (= lt!19355 (choose!111 lt!19268 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1206))))

(assert (=> d!8277 (= (size!1622 lt!19268) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!8277 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!19268 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1206) lt!19355)))

(declare-fun bs!2005 () Bool)

(assert (= bs!2005 d!8277))

(assert (=> bs!2005 m!38277))

(declare-fun m!38353 () Bool)

(assert (=> bs!2005 m!38353))

(assert (=> b!44068 d!8277))

(declare-fun d!8281 () Bool)

(declare-fun getCurrentListMap!355 (array!2951 array!2953 (_ BitVec 32) (_ BitVec 32) V!2325 V!2325 (_ BitVec 32) Int) ListLongMap!1211)

(assert (=> d!8281 (= (map!842 lt!19259) (getCurrentListMap!355 (_keys!3463 lt!19259) (_values!1879 lt!19259) (mask!5473 lt!19259) (extraKeys!1787 lt!19259) (zeroValue!1814 lt!19259) (minValue!1814 lt!19259) #b00000000000000000000000000000000 (defaultEntry!1896 lt!19259)))))

(declare-fun bs!2007 () Bool)

(assert (= bs!2007 d!8281))

(declare-fun m!38357 () Bool)

(assert (=> bs!2007 m!38357))

(assert (=> b!44068 d!8281))

(declare-fun d!8285 () Bool)

(declare-fun res!26071 () Bool)

(declare-fun e!27970 () Bool)

(assert (=> d!8285 (=> (not res!26071) (not e!27970))))

(declare-fun simpleValid!30 (LongMapFixedSize!388) Bool)

(assert (=> d!8285 (= res!26071 (simpleValid!30 lt!19259))))

(assert (=> d!8285 (= (valid!124 lt!19259) e!27970)))

(declare-fun b!44120 () Bool)

(declare-fun res!26072 () Bool)

(assert (=> b!44120 (=> (not res!26072) (not e!27970))))

(assert (=> b!44120 (= res!26072 (= (arrayCountValidKeys!0 (_keys!3463 lt!19259) #b00000000000000000000000000000000 (size!1622 (_keys!3463 lt!19259))) (_size!243 lt!19259)))))

(declare-fun b!44121 () Bool)

(declare-fun res!26073 () Bool)

(assert (=> b!44121 (=> (not res!26073) (not e!27970))))

(assert (=> b!44121 (= res!26073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3463 lt!19259) (mask!5473 lt!19259)))))

(declare-fun b!44122 () Bool)

(assert (=> b!44122 (= e!27970 (arrayNoDuplicates!0 (_keys!3463 lt!19259) #b00000000000000000000000000000000 Nil!1206))))

(assert (= (and d!8285 res!26071) b!44120))

(assert (= (and b!44120 res!26072) b!44121))

(assert (= (and b!44121 res!26073) b!44122))

(declare-fun m!38362 () Bool)

(assert (=> d!8285 m!38362))

(declare-fun m!38367 () Bool)

(assert (=> b!44120 m!38367))

(declare-fun m!38371 () Bool)

(assert (=> b!44121 m!38371))

(declare-fun m!38373 () Bool)

(assert (=> b!44122 m!38373))

(assert (=> b!44068 d!8285))

(declare-fun d!8291 () Bool)

(assert (=> d!8291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19268 mask!853)))

(declare-fun lt!19366 () Unit!1229)

(declare-fun choose!34 (array!2951 (_ BitVec 32) (_ BitVec 32)) Unit!1229)

(assert (=> d!8291 (= lt!19366 (choose!34 lt!19268 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!8291 (validMask!0 mask!853)))

(assert (=> d!8291 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!19268 mask!853 #b00000000000000000000000000000000) lt!19366)))

(declare-fun bs!2008 () Bool)

(assert (= bs!2008 d!8291))

(assert (=> bs!2008 m!38289))

(declare-fun m!38375 () Bool)

(assert (=> bs!2008 m!38375))

(assert (=> bs!2008 m!38267))

(assert (=> b!44068 d!8291))

(declare-fun b!44165 () Bool)

(declare-fun e!27998 () (_ BitVec 32))

(declare-fun call!3562 () (_ BitVec 32))

(assert (=> b!44165 (= e!27998 (bvadd #b00000000000000000000000000000001 call!3562))))

(declare-fun b!44166 () Bool)

(declare-fun e!27999 () (_ BitVec 32))

(assert (=> b!44166 (= e!27999 #b00000000000000000000000000000000)))

(declare-fun b!44167 () Bool)

(assert (=> b!44167 (= e!27999 e!27998)))

(declare-fun c!5758 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!44167 (= c!5758 (validKeyInArray!0 (select (arr!1419 lt!19268) #b00000000000000000000000000000000)))))

(declare-fun d!8293 () Bool)

(declare-fun lt!19376 () (_ BitVec 32))

(assert (=> d!8293 (and (bvsge lt!19376 #b00000000000000000000000000000000) (bvsle lt!19376 (bvsub (size!1622 lt!19268) #b00000000000000000000000000000000)))))

(assert (=> d!8293 (= lt!19376 e!27999)))

(declare-fun c!5757 () Bool)

(assert (=> d!8293 (= c!5757 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8293 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1622 lt!19268)))))

(assert (=> d!8293 (= (arrayCountValidKeys!0 lt!19268 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!19376)))

(declare-fun bm!3559 () Bool)

(assert (=> bm!3559 (= call!3562 (arrayCountValidKeys!0 lt!19268 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!44168 () Bool)

(assert (=> b!44168 (= e!27998 call!3562)))

(assert (= (and d!8293 c!5757) b!44166))

(assert (= (and d!8293 (not c!5757)) b!44167))

(assert (= (and b!44167 c!5758) b!44165))

(assert (= (and b!44167 (not c!5758)) b!44168))

(assert (= (or b!44165 b!44168) bm!3559))

(declare-fun m!38397 () Bool)

(assert (=> b!44167 m!38397))

(assert (=> b!44167 m!38397))

(declare-fun m!38399 () Bool)

(assert (=> b!44167 m!38399))

(declare-fun m!38401 () Bool)

(assert (=> bm!3559 m!38401))

(assert (=> b!44068 d!8293))

(declare-fun b!44192 () Bool)

(declare-fun e!28020 () Bool)

(declare-fun e!28018 () Bool)

(assert (=> b!44192 (= e!28020 e!28018)))

(declare-fun res!26099 () Bool)

(assert (=> b!44192 (=> (not res!26099) (not e!28018))))

(declare-fun e!28021 () Bool)

(assert (=> b!44192 (= res!26099 (not e!28021))))

(declare-fun res!26100 () Bool)

(assert (=> b!44192 (=> (not res!26100) (not e!28021))))

(assert (=> b!44192 (= res!26100 (validKeyInArray!0 (select (arr!1419 lt!19268) #b00000000000000000000000000000000)))))

(declare-fun b!44193 () Bool)

(declare-fun e!28019 () Bool)

(declare-fun call!3568 () Bool)

(assert (=> b!44193 (= e!28019 call!3568)))

(declare-fun b!44194 () Bool)

(assert (=> b!44194 (= e!28018 e!28019)))

(declare-fun c!5764 () Bool)

(assert (=> b!44194 (= c!5764 (validKeyInArray!0 (select (arr!1419 lt!19268) #b00000000000000000000000000000000)))))

(declare-fun b!44195 () Bool)

(assert (=> b!44195 (= e!28019 call!3568)))

(declare-fun b!44196 () Bool)

(declare-fun contains!574 (List!1209 (_ BitVec 64)) Bool)

(assert (=> b!44196 (= e!28021 (contains!574 Nil!1206 (select (arr!1419 lt!19268) #b00000000000000000000000000000000)))))

(declare-fun bm!3565 () Bool)

(assert (=> bm!3565 (= call!3568 (arrayNoDuplicates!0 lt!19268 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5764 (Cons!1205 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) Nil!1206) Nil!1206)))))

(declare-fun d!8301 () Bool)

(declare-fun res!26101 () Bool)

(assert (=> d!8301 (=> res!26101 e!28020)))

(assert (=> d!8301 (= res!26101 (bvsge #b00000000000000000000000000000000 (size!1622 lt!19268)))))

(assert (=> d!8301 (= (arrayNoDuplicates!0 lt!19268 #b00000000000000000000000000000000 Nil!1206) e!28020)))

(assert (= (and d!8301 (not res!26101)) b!44192))

(assert (= (and b!44192 res!26100) b!44196))

(assert (= (and b!44192 res!26099) b!44194))

(assert (= (and b!44194 c!5764) b!44195))

(assert (= (and b!44194 (not c!5764)) b!44193))

(assert (= (or b!44195 b!44193) bm!3565))

(assert (=> b!44192 m!38397))

(assert (=> b!44192 m!38397))

(assert (=> b!44192 m!38399))

(assert (=> b!44194 m!38397))

(assert (=> b!44194 m!38397))

(assert (=> b!44194 m!38399))

(assert (=> b!44196 m!38397))

(assert (=> b!44196 m!38397))

(declare-fun m!38407 () Bool)

(assert (=> b!44196 m!38407))

(assert (=> bm!3565 m!38397))

(declare-fun m!38409 () Bool)

(assert (=> bm!3565 m!38409))

(assert (=> b!44068 d!8301))

(declare-fun bm!3571 () Bool)

(declare-fun call!3574 () Bool)

(assert (=> bm!3571 (= call!3574 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!19268 mask!853))))

(declare-fun b!44226 () Bool)

(declare-fun e!28039 () Bool)

(assert (=> b!44226 (= e!28039 call!3574)))

(declare-fun b!44227 () Bool)

(declare-fun e!28040 () Bool)

(declare-fun e!28038 () Bool)

(assert (=> b!44227 (= e!28040 e!28038)))

(declare-fun c!5772 () Bool)

(assert (=> b!44227 (= c!5772 (validKeyInArray!0 (select (arr!1419 lt!19268) #b00000000000000000000000000000000)))))

(declare-fun d!8305 () Bool)

(declare-fun res!26118 () Bool)

(assert (=> d!8305 (=> res!26118 e!28040)))

(assert (=> d!8305 (= res!26118 (bvsge #b00000000000000000000000000000000 (size!1622 lt!19268)))))

(assert (=> d!8305 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19268 mask!853) e!28040)))

(declare-fun b!44228 () Bool)

(assert (=> b!44228 (= e!28038 call!3574)))

(declare-fun b!44229 () Bool)

(assert (=> b!44229 (= e!28038 e!28039)))

(declare-fun lt!19402 () (_ BitVec 64))

(assert (=> b!44229 (= lt!19402 (select (arr!1419 lt!19268) #b00000000000000000000000000000000))))

(declare-fun lt!19400 () Unit!1229)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2951 (_ BitVec 64) (_ BitVec 32)) Unit!1229)

(assert (=> b!44229 (= lt!19400 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19268 lt!19402 #b00000000000000000000000000000000))))

(assert (=> b!44229 (arrayContainsKey!0 lt!19268 lt!19402 #b00000000000000000000000000000000)))

(declare-fun lt!19401 () Unit!1229)

(assert (=> b!44229 (= lt!19401 lt!19400)))

(declare-fun res!26117 () Bool)

(declare-datatypes ((SeekEntryResult!202 0))(
  ( (MissingZero!202 (index!2930 (_ BitVec 32))) (Found!202 (index!2931 (_ BitVec 32))) (Intermediate!202 (undefined!1014 Bool) (index!2932 (_ BitVec 32)) (x!8356 (_ BitVec 32))) (Undefined!202) (MissingVacant!202 (index!2933 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2951 (_ BitVec 32)) SeekEntryResult!202)

(assert (=> b!44229 (= res!26117 (= (seekEntryOrOpen!0 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) lt!19268 mask!853) (Found!202 #b00000000000000000000000000000000)))))

(assert (=> b!44229 (=> (not res!26117) (not e!28039))))

(assert (= (and d!8305 (not res!26118)) b!44227))

(assert (= (and b!44227 c!5772) b!44229))

(assert (= (and b!44227 (not c!5772)) b!44228))

(assert (= (and b!44229 res!26117) b!44226))

(assert (= (or b!44226 b!44228) bm!3571))

(declare-fun m!38431 () Bool)

(assert (=> bm!3571 m!38431))

(assert (=> b!44227 m!38397))

(assert (=> b!44227 m!38397))

(assert (=> b!44227 m!38399))

(assert (=> b!44229 m!38397))

(declare-fun m!38433 () Bool)

(assert (=> b!44229 m!38433))

(declare-fun m!38435 () Bool)

(assert (=> b!44229 m!38435))

(assert (=> b!44229 m!38397))

(declare-fun m!38437 () Bool)

(assert (=> b!44229 m!38437))

(assert (=> b!44068 d!8305))

(declare-fun d!8315 () Bool)

(assert (=> d!8315 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6736 d!8315))

(declare-fun d!8325 () Bool)

(assert (=> d!8325 (= (head!893 (toList!621 lt!19269)) (h!1781 (toList!621 lt!19269)))))

(assert (=> b!44066 d!8325))

(declare-fun d!8327 () Bool)

(declare-fun e!28057 () Bool)

(assert (=> d!8327 e!28057))

(declare-fun c!5780 () Bool)

(assert (=> d!8327 (= c!5780 (and (not (= (_1!828 lt!19270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!828 lt!19270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!19412 () Unit!1229)

(declare-fun choose!262 (array!2951 array!2953 (_ BitVec 32) (_ BitVec 32) V!2325 V!2325 (_ BitVec 64) Int) Unit!1229)

(assert (=> d!8327 (= lt!19412 (choose!262 lt!19268 lt!19261 mask!853 #b00000000000000000000000000000000 lt!19271 lt!19271 (_1!828 lt!19270) defaultEntry!470))))

(assert (=> d!8327 (validMask!0 mask!853)))

(assert (=> d!8327 (= (lemmaKeyInListMapIsInArray!106 lt!19268 lt!19261 mask!853 #b00000000000000000000000000000000 lt!19271 lt!19271 (_1!828 lt!19270) defaultEntry!470) lt!19412)))

(declare-fun b!44253 () Bool)

(assert (=> b!44253 (= e!28057 (arrayContainsKey!0 lt!19268 (_1!828 lt!19270) #b00000000000000000000000000000000))))

(declare-fun b!44254 () Bool)

(assert (=> b!44254 (= e!28057 (ite (= (_1!828 lt!19270) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!8327 c!5780) b!44253))

(assert (= (and d!8327 (not c!5780)) b!44254))

(declare-fun m!38451 () Bool)

(assert (=> d!8327 m!38451))

(assert (=> d!8327 m!38267))

(assert (=> b!44253 m!38269))

(assert (=> b!44066 d!8327))

(declare-fun d!8335 () Bool)

(declare-fun lt!19421 () (_ BitVec 32))

(assert (=> d!8335 (and (or (bvslt lt!19421 #b00000000000000000000000000000000) (bvsge lt!19421 (size!1622 lt!19268)) (and (bvsge lt!19421 #b00000000000000000000000000000000) (bvslt lt!19421 (size!1622 lt!19268)))) (bvsge lt!19421 #b00000000000000000000000000000000) (bvslt lt!19421 (size!1622 lt!19268)) (= (select (arr!1419 lt!19268) lt!19421) (_1!828 lt!19270)))))

(declare-fun e!28063 () (_ BitVec 32))

(assert (=> d!8335 (= lt!19421 e!28063)))

(declare-fun c!5786 () Bool)

(assert (=> d!8335 (= c!5786 (= (select (arr!1419 lt!19268) #b00000000000000000000000000000000) (_1!828 lt!19270)))))

(assert (=> d!8335 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1622 lt!19268)) (bvslt (size!1622 lt!19268) #b01111111111111111111111111111111))))

(assert (=> d!8335 (= (arrayScanForKey!0 lt!19268 (_1!828 lt!19270) #b00000000000000000000000000000000) lt!19421)))

(declare-fun b!44265 () Bool)

(assert (=> b!44265 (= e!28063 #b00000000000000000000000000000000)))

(declare-fun b!44266 () Bool)

(assert (=> b!44266 (= e!28063 (arrayScanForKey!0 lt!19268 (_1!828 lt!19270) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8335 c!5786) b!44265))

(assert (= (and d!8335 (not c!5786)) b!44266))

(declare-fun m!38457 () Bool)

(assert (=> d!8335 m!38457))

(assert (=> d!8335 m!38397))

(declare-fun m!38459 () Bool)

(assert (=> b!44266 m!38459))

(assert (=> b!44066 d!8335))

(declare-fun d!8341 () Bool)

(declare-fun res!26132 () Bool)

(declare-fun e!28068 () Bool)

(assert (=> d!8341 (=> res!26132 e!28068)))

(assert (=> d!8341 (= res!26132 (= (select (arr!1419 lt!19268) #b00000000000000000000000000000000) (_1!828 lt!19270)))))

(assert (=> d!8341 (= (arrayContainsKey!0 lt!19268 (_1!828 lt!19270) #b00000000000000000000000000000000) e!28068)))

(declare-fun b!44271 () Bool)

(declare-fun e!28069 () Bool)

(assert (=> b!44271 (= e!28068 e!28069)))

(declare-fun res!26133 () Bool)

(assert (=> b!44271 (=> (not res!26133) (not e!28069))))

(assert (=> b!44271 (= res!26133 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1622 lt!19268)))))

(declare-fun b!44272 () Bool)

(assert (=> b!44272 (= e!28069 (arrayContainsKey!0 lt!19268 (_1!828 lt!19270) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8341 (not res!26132)) b!44271))

(assert (= (and b!44271 res!26133) b!44272))

(assert (=> d!8341 m!38397))

(declare-fun m!38461 () Bool)

(assert (=> b!44272 m!38461))

(assert (=> b!44065 d!8341))

(push 1)

(assert (not b!44192))

(assert b_and!2701)

(assert (not b!44120))

(assert (not bm!3571))

(assert (not b!44253))

(assert (not b_lambda!2315))

(assert (not b!44167))

(assert (not d!8285))

(assert (not b_next!1513))

(assert (not d!8281))

(assert (not b!44229))

(assert (not d!8277))

(assert (not d!8327))

(assert (not d!8291))

(assert (not bm!3565))

(assert (not b!44194))

(assert (not b!44196))

(assert (not b!44121))

(assert (not bm!3559))

(assert (not b!44227))

(assert (not b!44122))

(assert (not b!44266))

(assert tp_is_empty!1903)

(assert (not b!44272))

(assert (not d!8275))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2701)

(assert (not b_next!1513))

(check-sat)

(get-model)

(pop 1)

(declare-fun b!44425 () Bool)

(declare-fun e!28172 () Bool)

(declare-fun e!28171 () Bool)

(assert (=> b!44425 (= e!28172 e!28171)))

(declare-fun c!5836 () Bool)

(assert (=> b!44425 (= c!5836 (not (= (bvand (extraKeys!1787 lt!19259) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!3598 () Bool)

(declare-fun call!3605 () ListLongMap!1211)

(declare-fun getCurrentListMapNoExtraKeys!39 (array!2951 array!2953 (_ BitVec 32) (_ BitVec 32) V!2325 V!2325 (_ BitVec 32) Int) ListLongMap!1211)

(assert (=> bm!3598 (= call!3605 (getCurrentListMapNoExtraKeys!39 (_keys!3463 lt!19259) (_values!1879 lt!19259) (mask!5473 lt!19259) (extraKeys!1787 lt!19259) (zeroValue!1814 lt!19259) (minValue!1814 lt!19259) #b00000000000000000000000000000000 (defaultEntry!1896 lt!19259)))))

(declare-fun b!44426 () Bool)

(declare-fun c!5835 () Bool)

(assert (=> b!44426 (= c!5835 (and (not (= (bvand (extraKeys!1787 lt!19259) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1787 lt!19259) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!28182 () ListLongMap!1211)

(declare-fun e!28181 () ListLongMap!1211)

(assert (=> b!44426 (= e!28182 e!28181)))

(declare-fun c!5834 () Bool)

(declare-fun call!3607 () ListLongMap!1211)

(declare-fun call!3604 () ListLongMap!1211)

(declare-fun call!3606 () ListLongMap!1211)

(declare-fun bm!3599 () Bool)

(declare-fun c!5837 () Bool)

(declare-fun +!70 (ListLongMap!1211 tuple2!1634) ListLongMap!1211)

(assert (=> bm!3599 (= call!3607 (+!70 (ite c!5834 call!3605 (ite c!5837 call!3606 call!3604)) (ite (or c!5834 c!5837) (tuple2!1635 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19259)) (tuple2!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19259)))))))

(declare-fun b!44427 () Bool)

(declare-fun e!28173 () ListLongMap!1211)

(assert (=> b!44427 (= e!28173 e!28182)))

(assert (=> b!44427 (= c!5837 (and (not (= (bvand (extraKeys!1787 lt!19259) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1787 lt!19259) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!44428 () Bool)

(declare-fun e!28174 () Unit!1229)

(declare-fun lt!19519 () Unit!1229)

(assert (=> b!44428 (= e!28174 lt!19519)))

(declare-fun lt!19509 () ListLongMap!1211)

(assert (=> b!44428 (= lt!19509 (getCurrentListMapNoExtraKeys!39 (_keys!3463 lt!19259) (_values!1879 lt!19259) (mask!5473 lt!19259) (extraKeys!1787 lt!19259) (zeroValue!1814 lt!19259) (minValue!1814 lt!19259) #b00000000000000000000000000000000 (defaultEntry!1896 lt!19259)))))

(declare-fun lt!19503 () (_ BitVec 64))

(assert (=> b!44428 (= lt!19503 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19510 () (_ BitVec 64))

(assert (=> b!44428 (= lt!19510 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000))))

(declare-fun lt!19502 () Unit!1229)

(declare-fun addStillContains!37 (ListLongMap!1211 (_ BitVec 64) V!2325 (_ BitVec 64)) Unit!1229)

(assert (=> b!44428 (= lt!19502 (addStillContains!37 lt!19509 lt!19503 (zeroValue!1814 lt!19259) lt!19510))))

(declare-fun contains!577 (ListLongMap!1211 (_ BitVec 64)) Bool)

(assert (=> b!44428 (contains!577 (+!70 lt!19509 (tuple2!1635 lt!19503 (zeroValue!1814 lt!19259))) lt!19510)))

(declare-fun lt!19504 () Unit!1229)

(assert (=> b!44428 (= lt!19504 lt!19502)))

(declare-fun lt!19520 () ListLongMap!1211)

(assert (=> b!44428 (= lt!19520 (getCurrentListMapNoExtraKeys!39 (_keys!3463 lt!19259) (_values!1879 lt!19259) (mask!5473 lt!19259) (extraKeys!1787 lt!19259) (zeroValue!1814 lt!19259) (minValue!1814 lt!19259) #b00000000000000000000000000000000 (defaultEntry!1896 lt!19259)))))

(declare-fun lt!19501 () (_ BitVec 64))

(assert (=> b!44428 (= lt!19501 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19508 () (_ BitVec 64))

(assert (=> b!44428 (= lt!19508 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000))))

(declare-fun lt!19500 () Unit!1229)

(declare-fun addApplyDifferent!37 (ListLongMap!1211 (_ BitVec 64) V!2325 (_ BitVec 64)) Unit!1229)

(assert (=> b!44428 (= lt!19500 (addApplyDifferent!37 lt!19520 lt!19501 (minValue!1814 lt!19259) lt!19508))))

(declare-fun apply!61 (ListLongMap!1211 (_ BitVec 64)) V!2325)

(assert (=> b!44428 (= (apply!61 (+!70 lt!19520 (tuple2!1635 lt!19501 (minValue!1814 lt!19259))) lt!19508) (apply!61 lt!19520 lt!19508))))

(declare-fun lt!19515 () Unit!1229)

(assert (=> b!44428 (= lt!19515 lt!19500)))

(declare-fun lt!19516 () ListLongMap!1211)

(assert (=> b!44428 (= lt!19516 (getCurrentListMapNoExtraKeys!39 (_keys!3463 lt!19259) (_values!1879 lt!19259) (mask!5473 lt!19259) (extraKeys!1787 lt!19259) (zeroValue!1814 lt!19259) (minValue!1814 lt!19259) #b00000000000000000000000000000000 (defaultEntry!1896 lt!19259)))))

(declare-fun lt!19507 () (_ BitVec 64))

(assert (=> b!44428 (= lt!19507 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19499 () (_ BitVec 64))

(assert (=> b!44428 (= lt!19499 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000))))

(declare-fun lt!19513 () Unit!1229)

(assert (=> b!44428 (= lt!19513 (addApplyDifferent!37 lt!19516 lt!19507 (zeroValue!1814 lt!19259) lt!19499))))

(assert (=> b!44428 (= (apply!61 (+!70 lt!19516 (tuple2!1635 lt!19507 (zeroValue!1814 lt!19259))) lt!19499) (apply!61 lt!19516 lt!19499))))

(declare-fun lt!19511 () Unit!1229)

(assert (=> b!44428 (= lt!19511 lt!19513)))

(declare-fun lt!19506 () ListLongMap!1211)

(assert (=> b!44428 (= lt!19506 (getCurrentListMapNoExtraKeys!39 (_keys!3463 lt!19259) (_values!1879 lt!19259) (mask!5473 lt!19259) (extraKeys!1787 lt!19259) (zeroValue!1814 lt!19259) (minValue!1814 lt!19259) #b00000000000000000000000000000000 (defaultEntry!1896 lt!19259)))))

(declare-fun lt!19518 () (_ BitVec 64))

(assert (=> b!44428 (= lt!19518 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19517 () (_ BitVec 64))

(assert (=> b!44428 (= lt!19517 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000))))

(assert (=> b!44428 (= lt!19519 (addApplyDifferent!37 lt!19506 lt!19518 (minValue!1814 lt!19259) lt!19517))))

(assert (=> b!44428 (= (apply!61 (+!70 lt!19506 (tuple2!1635 lt!19518 (minValue!1814 lt!19259))) lt!19517) (apply!61 lt!19506 lt!19517))))

(declare-fun b!44429 () Bool)

(declare-fun call!3603 () Bool)

(assert (=> b!44429 (= e!28171 (not call!3603))))

(declare-fun b!44430 () Bool)

(declare-fun res!26196 () Bool)

(assert (=> b!44430 (=> (not res!26196) (not e!28172))))

(declare-fun e!28180 () Bool)

(assert (=> b!44430 (= res!26196 e!28180)))

(declare-fun res!26200 () Bool)

(assert (=> b!44430 (=> res!26200 e!28180)))

(declare-fun e!28179 () Bool)

(assert (=> b!44430 (= res!26200 (not e!28179))))

(declare-fun res!26198 () Bool)

(assert (=> b!44430 (=> (not res!26198) (not e!28179))))

(assert (=> b!44430 (= res!26198 (bvslt #b00000000000000000000000000000000 (size!1622 (_keys!3463 lt!19259))))))

(declare-fun b!44431 () Bool)

(assert (=> b!44431 (= e!28181 call!3604)))

(declare-fun b!44432 () Bool)

(declare-fun e!28176 () Bool)

(declare-fun lt!19512 () ListLongMap!1211)

(assert (=> b!44432 (= e!28176 (= (apply!61 lt!19512 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1814 lt!19259)))))

(declare-fun b!44433 () Bool)

(declare-fun e!28183 () Bool)

(declare-fun e!28178 () Bool)

(assert (=> b!44433 (= e!28183 e!28178)))

(declare-fun res!26197 () Bool)

(declare-fun call!3602 () Bool)

(assert (=> b!44433 (= res!26197 call!3602)))

(assert (=> b!44433 (=> (not res!26197) (not e!28178))))

(declare-fun b!44434 () Bool)

(assert (=> b!44434 (= e!28178 (= (apply!61 lt!19512 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1814 lt!19259)))))

(declare-fun b!44435 () Bool)

(declare-fun call!3601 () ListLongMap!1211)

(assert (=> b!44435 (= e!28182 call!3601)))

(declare-fun b!44436 () Bool)

(assert (=> b!44436 (= e!28181 call!3601)))

(declare-fun bm!3601 () Bool)

(assert (=> bm!3601 (= call!3601 call!3607)))

(declare-fun b!44437 () Bool)

(assert (=> b!44437 (= e!28183 (not call!3602))))

(declare-fun bm!3602 () Bool)

(assert (=> bm!3602 (= call!3603 (contains!577 lt!19512 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!44438 () Bool)

(declare-fun res!26195 () Bool)

(assert (=> b!44438 (=> (not res!26195) (not e!28172))))

(assert (=> b!44438 (= res!26195 e!28183)))

(declare-fun c!5838 () Bool)

(assert (=> b!44438 (= c!5838 (not (= (bvand (extraKeys!1787 lt!19259) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!44439 () Bool)

(assert (=> b!44439 (= e!28171 e!28176)))

(declare-fun res!26202 () Bool)

(assert (=> b!44439 (= res!26202 call!3603)))

(assert (=> b!44439 (=> (not res!26202) (not e!28176))))

(declare-fun b!44440 () Bool)

(declare-fun e!28177 () Bool)

(assert (=> b!44440 (= e!28180 e!28177)))

(declare-fun res!26199 () Bool)

(assert (=> b!44440 (=> (not res!26199) (not e!28177))))

(assert (=> b!44440 (= res!26199 (contains!577 lt!19512 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000)))))

(assert (=> b!44440 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1622 (_keys!3463 lt!19259))))))

(declare-fun d!8353 () Bool)

(assert (=> d!8353 e!28172))

(declare-fun res!26203 () Bool)

(assert (=> d!8353 (=> (not res!26203) (not e!28172))))

(assert (=> d!8353 (= res!26203 (or (bvsge #b00000000000000000000000000000000 (size!1622 (_keys!3463 lt!19259))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1622 (_keys!3463 lt!19259))))))))

(declare-fun lt!19505 () ListLongMap!1211)

(assert (=> d!8353 (= lt!19512 lt!19505)))

(declare-fun lt!19514 () Unit!1229)

(assert (=> d!8353 (= lt!19514 e!28174)))

(declare-fun c!5839 () Bool)

(declare-fun e!28175 () Bool)

(assert (=> d!8353 (= c!5839 e!28175)))

(declare-fun res!26201 () Bool)

(assert (=> d!8353 (=> (not res!26201) (not e!28175))))

(assert (=> d!8353 (= res!26201 (bvslt #b00000000000000000000000000000000 (size!1622 (_keys!3463 lt!19259))))))

(assert (=> d!8353 (= lt!19505 e!28173)))

(assert (=> d!8353 (= c!5834 (and (not (= (bvand (extraKeys!1787 lt!19259) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1787 lt!19259) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!8353 (validMask!0 (mask!5473 lt!19259))))

(assert (=> d!8353 (= (getCurrentListMap!355 (_keys!3463 lt!19259) (_values!1879 lt!19259) (mask!5473 lt!19259) (extraKeys!1787 lt!19259) (zeroValue!1814 lt!19259) (minValue!1814 lt!19259) #b00000000000000000000000000000000 (defaultEntry!1896 lt!19259)) lt!19512)))

(declare-fun bm!3600 () Bool)

(assert (=> bm!3600 (= call!3606 call!3605)))

(declare-fun b!44441 () Bool)

(declare-fun get!799 (ValueCell!704 V!2325) V!2325)

(assert (=> b!44441 (= e!28177 (= (apply!61 lt!19512 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000)) (get!799 (select (arr!1420 (_values!1879 lt!19259)) #b00000000000000000000000000000000) (dynLambda!265 (defaultEntry!1896 lt!19259) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!44441 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1623 (_values!1879 lt!19259))))))

(assert (=> b!44441 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1622 (_keys!3463 lt!19259))))))

(declare-fun b!44442 () Bool)

(assert (=> b!44442 (= e!28173 (+!70 call!3607 (tuple2!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19259))))))

(declare-fun bm!3603 () Bool)

(assert (=> bm!3603 (= call!3604 call!3606)))

(declare-fun b!44443 () Bool)

(assert (=> b!44443 (= e!28179 (validKeyInArray!0 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000)))))

(declare-fun b!44444 () Bool)

(declare-fun Unit!1241 () Unit!1229)

(assert (=> b!44444 (= e!28174 Unit!1241)))

(declare-fun b!44445 () Bool)

(assert (=> b!44445 (= e!28175 (validKeyInArray!0 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000)))))

(declare-fun bm!3604 () Bool)

(assert (=> bm!3604 (= call!3602 (contains!577 lt!19512 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!8353 c!5834) b!44442))

(assert (= (and d!8353 (not c!5834)) b!44427))

(assert (= (and b!44427 c!5837) b!44435))

(assert (= (and b!44427 (not c!5837)) b!44426))

(assert (= (and b!44426 c!5835) b!44436))

(assert (= (and b!44426 (not c!5835)) b!44431))

(assert (= (or b!44436 b!44431) bm!3603))

(assert (= (or b!44435 bm!3603) bm!3600))

(assert (= (or b!44435 b!44436) bm!3601))

(assert (= (or b!44442 bm!3600) bm!3598))

(assert (= (or b!44442 bm!3601) bm!3599))

(assert (= (and d!8353 res!26201) b!44445))

(assert (= (and d!8353 c!5839) b!44428))

(assert (= (and d!8353 (not c!5839)) b!44444))

(assert (= (and d!8353 res!26203) b!44430))

(assert (= (and b!44430 res!26198) b!44443))

(assert (= (and b!44430 (not res!26200)) b!44440))

(assert (= (and b!44440 res!26199) b!44441))

(assert (= (and b!44430 res!26196) b!44438))

(assert (= (and b!44438 c!5838) b!44433))

(assert (= (and b!44438 (not c!5838)) b!44437))

(assert (= (and b!44433 res!26197) b!44434))

(assert (= (or b!44433 b!44437) bm!3604))

(assert (= (and b!44438 res!26195) b!44425))

(assert (= (and b!44425 c!5836) b!44439))

(assert (= (and b!44425 (not c!5836)) b!44429))

(assert (= (and b!44439 res!26202) b!44432))

(assert (= (or b!44439 b!44429) bm!3602))

(declare-fun b_lambda!2321 () Bool)

(assert (=> (not b_lambda!2321) (not b!44441)))

(declare-fun tb!1007 () Bool)

(declare-fun t!4234 () Bool)

(assert (=> (and start!6736 (= defaultEntry!470 (defaultEntry!1896 lt!19259)) t!4234) tb!1007))

(declare-fun result!1759 () Bool)

(assert (=> tb!1007 (= result!1759 tp_is_empty!1903)))

(assert (=> b!44441 t!4234))

(declare-fun b_and!2711 () Bool)

(assert (= b_and!2701 (and (=> t!4234 result!1759) b_and!2711)))

(declare-fun m!38561 () Bool)

(assert (=> b!44445 m!38561))

(assert (=> b!44445 m!38561))

(declare-fun m!38563 () Bool)

(assert (=> b!44445 m!38563))

(declare-fun m!38565 () Bool)

(assert (=> b!44432 m!38565))

(declare-fun m!38567 () Bool)

(assert (=> bm!3604 m!38567))

(declare-fun m!38569 () Bool)

(assert (=> bm!3602 m!38569))

(declare-fun m!38571 () Bool)

(assert (=> b!44434 m!38571))

(declare-fun m!38573 () Bool)

(assert (=> b!44428 m!38573))

(declare-fun m!38575 () Bool)

(assert (=> b!44428 m!38575))

(declare-fun m!38577 () Bool)

(assert (=> b!44428 m!38577))

(declare-fun m!38579 () Bool)

(assert (=> b!44428 m!38579))

(assert (=> b!44428 m!38573))

(declare-fun m!38581 () Bool)

(assert (=> b!44428 m!38581))

(declare-fun m!38583 () Bool)

(assert (=> b!44428 m!38583))

(declare-fun m!38585 () Bool)

(assert (=> b!44428 m!38585))

(declare-fun m!38587 () Bool)

(assert (=> b!44428 m!38587))

(declare-fun m!38589 () Bool)

(assert (=> b!44428 m!38589))

(assert (=> b!44428 m!38561))

(assert (=> b!44428 m!38583))

(declare-fun m!38591 () Bool)

(assert (=> b!44428 m!38591))

(assert (=> b!44428 m!38577))

(declare-fun m!38593 () Bool)

(assert (=> b!44428 m!38593))

(declare-fun m!38595 () Bool)

(assert (=> b!44428 m!38595))

(declare-fun m!38597 () Bool)

(assert (=> b!44428 m!38597))

(declare-fun m!38599 () Bool)

(assert (=> b!44428 m!38599))

(assert (=> b!44428 m!38597))

(declare-fun m!38601 () Bool)

(assert (=> b!44428 m!38601))

(declare-fun m!38603 () Bool)

(assert (=> b!44428 m!38603))

(declare-fun m!38605 () Bool)

(assert (=> bm!3599 m!38605))

(assert (=> bm!3598 m!38575))

(assert (=> b!44443 m!38561))

(assert (=> b!44443 m!38561))

(assert (=> b!44443 m!38563))

(declare-fun m!38607 () Bool)

(assert (=> d!8353 m!38607))

(assert (=> b!44440 m!38561))

(assert (=> b!44440 m!38561))

(declare-fun m!38609 () Bool)

(assert (=> b!44440 m!38609))

(assert (=> b!44441 m!38561))

(declare-fun m!38611 () Bool)

(assert (=> b!44441 m!38611))

(declare-fun m!38613 () Bool)

(assert (=> b!44441 m!38613))

(declare-fun m!38615 () Bool)

(assert (=> b!44441 m!38615))

(declare-fun m!38617 () Bool)

(assert (=> b!44441 m!38617))

(assert (=> b!44441 m!38561))

(assert (=> b!44441 m!38613))

(assert (=> b!44441 m!38615))

(declare-fun m!38619 () Bool)

(assert (=> b!44442 m!38619))

(assert (=> d!8281 d!8353))

(declare-fun bm!3605 () Bool)

(declare-fun call!3608 () Bool)

(assert (=> bm!3605 (= call!3608 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!19268 mask!853))))

(declare-fun b!44446 () Bool)

(declare-fun e!28185 () Bool)

(assert (=> b!44446 (= e!28185 call!3608)))

(declare-fun b!44447 () Bool)

(declare-fun e!28186 () Bool)

(declare-fun e!28184 () Bool)

(assert (=> b!44447 (= e!28186 e!28184)))

(declare-fun c!5840 () Bool)

(assert (=> b!44447 (= c!5840 (validKeyInArray!0 (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!8405 () Bool)

(declare-fun res!26205 () Bool)

(assert (=> d!8405 (=> res!26205 e!28186)))

(assert (=> d!8405 (= res!26205 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1622 lt!19268)))))

(assert (=> d!8405 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!19268 mask!853) e!28186)))

(declare-fun b!44448 () Bool)

(assert (=> b!44448 (= e!28184 call!3608)))

(declare-fun b!44449 () Bool)

(assert (=> b!44449 (= e!28184 e!28185)))

(declare-fun lt!19523 () (_ BitVec 64))

(assert (=> b!44449 (= lt!19523 (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!19521 () Unit!1229)

(assert (=> b!44449 (= lt!19521 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19268 lt!19523 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!44449 (arrayContainsKey!0 lt!19268 lt!19523 #b00000000000000000000000000000000)))

(declare-fun lt!19522 () Unit!1229)

(assert (=> b!44449 (= lt!19522 lt!19521)))

(declare-fun res!26204 () Bool)

(assert (=> b!44449 (= res!26204 (= (seekEntryOrOpen!0 (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19268 mask!853) (Found!202 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!44449 (=> (not res!26204) (not e!28185))))

(assert (= (and d!8405 (not res!26205)) b!44447))

(assert (= (and b!44447 c!5840) b!44449))

(assert (= (and b!44447 (not c!5840)) b!44448))

(assert (= (and b!44449 res!26204) b!44446))

(assert (= (or b!44446 b!44448) bm!3605))

(declare-fun m!38621 () Bool)

(assert (=> bm!3605 m!38621))

(declare-fun m!38623 () Bool)

(assert (=> b!44447 m!38623))

(assert (=> b!44447 m!38623))

(declare-fun m!38625 () Bool)

(assert (=> b!44447 m!38625))

(assert (=> b!44449 m!38623))

(declare-fun m!38627 () Bool)

(assert (=> b!44449 m!38627))

(declare-fun m!38629 () Bool)

(assert (=> b!44449 m!38629))

(assert (=> b!44449 m!38623))

(declare-fun m!38631 () Bool)

(assert (=> b!44449 m!38631))

(assert (=> bm!3571 d!8405))

(assert (=> d!8277 d!8301))

(declare-fun d!8407 () Bool)

(assert (=> d!8407 (arrayNoDuplicates!0 lt!19268 #b00000000000000000000000000000000 Nil!1206)))

(assert (=> d!8407 true))

(declare-fun res!26208 () Unit!1229)

(assert (=> d!8407 (= (choose!111 lt!19268 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1206) res!26208)))

(declare-fun bs!2021 () Bool)

(assert (= bs!2021 d!8407))

(assert (=> bs!2021 m!38277))

(assert (=> d!8277 d!8407))

(declare-fun d!8409 () Bool)

(assert (=> d!8409 (= (validKeyInArray!0 (select (arr!1419 lt!19268) #b00000000000000000000000000000000)) (and (not (= (select (arr!1419 lt!19268) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1419 lt!19268) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!44192 d!8409))

(assert (=> b!44167 d!8409))

(declare-fun d!8411 () Bool)

(declare-fun lt!19524 () (_ BitVec 32))

(assert (=> d!8411 (and (or (bvslt lt!19524 #b00000000000000000000000000000000) (bvsge lt!19524 (size!1622 lt!19268)) (and (bvsge lt!19524 #b00000000000000000000000000000000) (bvslt lt!19524 (size!1622 lt!19268)))) (bvsge lt!19524 #b00000000000000000000000000000000) (bvslt lt!19524 (size!1622 lt!19268)) (= (select (arr!1419 lt!19268) lt!19524) (_1!828 lt!19270)))))

(declare-fun e!28187 () (_ BitVec 32))

(assert (=> d!8411 (= lt!19524 e!28187)))

(declare-fun c!5841 () Bool)

(assert (=> d!8411 (= c!5841 (= (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_1!828 lt!19270)))))

(assert (=> d!8411 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1622 lt!19268)) (bvslt (size!1622 lt!19268) #b01111111111111111111111111111111))))

(assert (=> d!8411 (= (arrayScanForKey!0 lt!19268 (_1!828 lt!19270) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19524)))

(declare-fun b!44450 () Bool)

(assert (=> b!44450 (= e!28187 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(declare-fun b!44451 () Bool)

(assert (=> b!44451 (= e!28187 (arrayScanForKey!0 lt!19268 (_1!828 lt!19270) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!8411 c!5841) b!44450))

(assert (= (and d!8411 (not c!5841)) b!44451))

(declare-fun m!38633 () Bool)

(assert (=> d!8411 m!38633))

(assert (=> d!8411 m!38623))

(declare-fun m!38635 () Bool)

(assert (=> b!44451 m!38635))

(assert (=> b!44266 d!8411))

(declare-fun b!44462 () Bool)

(declare-fun res!26217 () Bool)

(declare-fun e!28190 () Bool)

(assert (=> b!44462 (=> (not res!26217) (not e!28190))))

(assert (=> b!44462 (= res!26217 (and (= (size!1623 (_values!1879 lt!19259)) (bvadd (mask!5473 lt!19259) #b00000000000000000000000000000001)) (= (size!1622 (_keys!3463 lt!19259)) (size!1623 (_values!1879 lt!19259))) (bvsge (_size!243 lt!19259) #b00000000000000000000000000000000) (bvsle (_size!243 lt!19259) (bvadd (mask!5473 lt!19259) #b00000000000000000000000000000001))))))

(declare-fun d!8413 () Bool)

(declare-fun res!26219 () Bool)

(assert (=> d!8413 (=> (not res!26219) (not e!28190))))

(assert (=> d!8413 (= res!26219 (validMask!0 (mask!5473 lt!19259)))))

(assert (=> d!8413 (= (simpleValid!30 lt!19259) e!28190)))

(declare-fun b!44464 () Bool)

(declare-fun res!26218 () Bool)

(assert (=> b!44464 (=> (not res!26218) (not e!28190))))

(declare-fun size!1640 (LongMapFixedSize!388) (_ BitVec 32))

(assert (=> b!44464 (= res!26218 (= (size!1640 lt!19259) (bvadd (_size!243 lt!19259) (bvsdiv (bvadd (extraKeys!1787 lt!19259) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!44463 () Bool)

(declare-fun res!26220 () Bool)

(assert (=> b!44463 (=> (not res!26220) (not e!28190))))

(assert (=> b!44463 (= res!26220 (bvsge (size!1640 lt!19259) (_size!243 lt!19259)))))

(declare-fun b!44465 () Bool)

(assert (=> b!44465 (= e!28190 (and (bvsge (extraKeys!1787 lt!19259) #b00000000000000000000000000000000) (bvsle (extraKeys!1787 lt!19259) #b00000000000000000000000000000011) (bvsge (_vacant!243 lt!19259) #b00000000000000000000000000000000)))))

(assert (= (and d!8413 res!26219) b!44462))

(assert (= (and b!44462 res!26217) b!44463))

(assert (= (and b!44463 res!26220) b!44464))

(assert (= (and b!44464 res!26218) b!44465))

(assert (=> d!8413 m!38607))

(declare-fun m!38637 () Bool)

(assert (=> b!44464 m!38637))

(assert (=> b!44463 m!38637))

(assert (=> d!8285 d!8413))

(declare-fun b!44476 () Bool)

(declare-fun e!28197 () (_ BitVec 32))

(declare-fun call!3611 () (_ BitVec 32))

(assert (=> b!44476 (= e!28197 (bvadd #b00000000000000000000000000000001 call!3611))))

(declare-fun b!44477 () Bool)

(declare-fun e!28198 () (_ BitVec 32))

(assert (=> b!44477 (= e!28198 #b00000000000000000000000000000000)))

(declare-fun b!44478 () Bool)

(assert (=> b!44478 (= e!28198 e!28197)))

(declare-fun c!5849 () Bool)

(assert (=> b!44478 (= c!5849 (validKeyInArray!0 (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!8415 () Bool)

(declare-fun lt!19529 () (_ BitVec 32))

(assert (=> d!8415 (and (bvsge lt!19529 #b00000000000000000000000000000000) (bvsle lt!19529 (bvsub (size!1622 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!8415 (= lt!19529 e!28198)))

(declare-fun c!5848 () Bool)

(assert (=> d!8415 (= c!5848 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8415 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1622 lt!19268)))))

(assert (=> d!8415 (= (arrayCountValidKeys!0 lt!19268 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!19529)))

(declare-fun bm!3608 () Bool)

(assert (=> bm!3608 (= call!3611 (arrayCountValidKeys!0 lt!19268 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!44479 () Bool)

(assert (=> b!44479 (= e!28197 call!3611)))

(assert (= (and d!8415 c!5848) b!44477))

(assert (= (and d!8415 (not c!5848)) b!44478))

(assert (= (and b!44478 c!5849) b!44476))

(assert (= (and b!44478 (not c!5849)) b!44479))

(assert (= (or b!44476 b!44479) bm!3608))

(assert (=> b!44478 m!38623))

(assert (=> b!44478 m!38623))

(assert (=> b!44478 m!38625))

(declare-fun m!38639 () Bool)

(assert (=> bm!3608 m!38639))

(assert (=> bm!3559 d!8415))

(declare-fun d!8417 () Bool)

(declare-fun res!26221 () Bool)

(declare-fun e!28199 () Bool)

(assert (=> d!8417 (=> res!26221 e!28199)))

(assert (=> d!8417 (= res!26221 (= (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_1!828 lt!19270)))))

(assert (=> d!8417 (= (arrayContainsKey!0 lt!19268 (_1!828 lt!19270) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!28199)))

(declare-fun b!44480 () Bool)

(declare-fun e!28200 () Bool)

(assert (=> b!44480 (= e!28199 e!28200)))

(declare-fun res!26222 () Bool)

(assert (=> b!44480 (=> (not res!26222) (not e!28200))))

(assert (=> b!44480 (= res!26222 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1622 lt!19268)))))

(declare-fun b!44481 () Bool)

(assert (=> b!44481 (= e!28200 (arrayContainsKey!0 lt!19268 (_1!828 lt!19270) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!8417 (not res!26221)) b!44480))

(assert (= (and b!44480 res!26222) b!44481))

(assert (=> d!8417 m!38623))

(declare-fun m!38641 () Bool)

(assert (=> b!44481 m!38641))

(assert (=> b!44272 d!8417))

(assert (=> b!44253 d!8341))

(declare-fun d!8419 () Bool)

(assert (=> d!8419 (arrayContainsKey!0 lt!19268 lt!19402 #b00000000000000000000000000000000)))

(declare-fun lt!19532 () Unit!1229)

(declare-fun choose!13 (array!2951 (_ BitVec 64) (_ BitVec 32)) Unit!1229)

(assert (=> d!8419 (= lt!19532 (choose!13 lt!19268 lt!19402 #b00000000000000000000000000000000))))

(assert (=> d!8419 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!8419 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19268 lt!19402 #b00000000000000000000000000000000) lt!19532)))

(declare-fun bs!2022 () Bool)

(assert (= bs!2022 d!8419))

(assert (=> bs!2022 m!38435))

(declare-fun m!38643 () Bool)

(assert (=> bs!2022 m!38643))

(assert (=> b!44229 d!8419))

(declare-fun d!8421 () Bool)

(declare-fun res!26223 () Bool)

(declare-fun e!28201 () Bool)

(assert (=> d!8421 (=> res!26223 e!28201)))

(assert (=> d!8421 (= res!26223 (= (select (arr!1419 lt!19268) #b00000000000000000000000000000000) lt!19402))))

(assert (=> d!8421 (= (arrayContainsKey!0 lt!19268 lt!19402 #b00000000000000000000000000000000) e!28201)))

(declare-fun b!44482 () Bool)

(declare-fun e!28202 () Bool)

(assert (=> b!44482 (= e!28201 e!28202)))

(declare-fun res!26224 () Bool)

(assert (=> b!44482 (=> (not res!26224) (not e!28202))))

(assert (=> b!44482 (= res!26224 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1622 lt!19268)))))

(declare-fun b!44483 () Bool)

(assert (=> b!44483 (= e!28202 (arrayContainsKey!0 lt!19268 lt!19402 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8421 (not res!26223)) b!44482))

(assert (= (and b!44482 res!26224) b!44483))

(assert (=> d!8421 m!38397))

(declare-fun m!38645 () Bool)

(assert (=> b!44483 m!38645))

(assert (=> b!44229 d!8421))

(declare-fun d!8423 () Bool)

(declare-fun lt!19603 () SeekEntryResult!202)

(assert (=> d!8423 (and (or (is-Undefined!202 lt!19603) (not (is-Found!202 lt!19603)) (and (bvsge (index!2931 lt!19603) #b00000000000000000000000000000000) (bvslt (index!2931 lt!19603) (size!1622 lt!19268)))) (or (is-Undefined!202 lt!19603) (is-Found!202 lt!19603) (not (is-MissingZero!202 lt!19603)) (and (bvsge (index!2930 lt!19603) #b00000000000000000000000000000000) (bvslt (index!2930 lt!19603) (size!1622 lt!19268)))) (or (is-Undefined!202 lt!19603) (is-Found!202 lt!19603) (is-MissingZero!202 lt!19603) (not (is-MissingVacant!202 lt!19603)) (and (bvsge (index!2933 lt!19603) #b00000000000000000000000000000000) (bvslt (index!2933 lt!19603) (size!1622 lt!19268)))) (or (is-Undefined!202 lt!19603) (ite (is-Found!202 lt!19603) (= (select (arr!1419 lt!19268) (index!2931 lt!19603)) (select (arr!1419 lt!19268) #b00000000000000000000000000000000)) (ite (is-MissingZero!202 lt!19603) (= (select (arr!1419 lt!19268) (index!2930 lt!19603)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!202 lt!19603) (= (select (arr!1419 lt!19268) (index!2933 lt!19603)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!28244 () SeekEntryResult!202)

(assert (=> d!8423 (= lt!19603 e!28244)))

(declare-fun c!5869 () Bool)

(declare-fun lt!19602 () SeekEntryResult!202)

(assert (=> d!8423 (= c!5869 (and (is-Intermediate!202 lt!19602) (undefined!1014 lt!19602)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2951 (_ BitVec 32)) SeekEntryResult!202)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!8423 (= lt!19602 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) mask!853) (select (arr!1419 lt!19268) #b00000000000000000000000000000000) lt!19268 mask!853))))

(assert (=> d!8423 (validMask!0 mask!853)))

(assert (=> d!8423 (= (seekEntryOrOpen!0 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) lt!19268 mask!853) lt!19603)))

(declare-fun b!44547 () Bool)

(declare-fun e!28243 () SeekEntryResult!202)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2951 (_ BitVec 32)) SeekEntryResult!202)

(assert (=> b!44547 (= e!28243 (seekKeyOrZeroReturnVacant!0 (x!8356 lt!19602) (index!2932 lt!19602) (index!2932 lt!19602) (select (arr!1419 lt!19268) #b00000000000000000000000000000000) lt!19268 mask!853))))

(declare-fun b!44548 () Bool)

(declare-fun e!28242 () SeekEntryResult!202)

(assert (=> b!44548 (= e!28244 e!28242)))

(declare-fun lt!19601 () (_ BitVec 64))

(assert (=> b!44548 (= lt!19601 (select (arr!1419 lt!19268) (index!2932 lt!19602)))))

(declare-fun c!5870 () Bool)

(assert (=> b!44548 (= c!5870 (= lt!19601 (select (arr!1419 lt!19268) #b00000000000000000000000000000000)))))

(declare-fun b!44549 () Bool)

(assert (=> b!44549 (= e!28242 (Found!202 (index!2932 lt!19602)))))

(declare-fun b!44550 () Bool)

(declare-fun c!5868 () Bool)

(assert (=> b!44550 (= c!5868 (= lt!19601 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!44550 (= e!28242 e!28243)))

(declare-fun b!44551 () Bool)

(assert (=> b!44551 (= e!28243 (MissingZero!202 (index!2932 lt!19602)))))

(declare-fun b!44552 () Bool)

(assert (=> b!44552 (= e!28244 Undefined!202)))

(assert (= (and d!8423 c!5869) b!44552))

(assert (= (and d!8423 (not c!5869)) b!44548))

(assert (= (and b!44548 c!5870) b!44549))

(assert (= (and b!44548 (not c!5870)) b!44550))

(assert (= (and b!44550 c!5868) b!44551))

(assert (= (and b!44550 (not c!5868)) b!44547))

(declare-fun m!38649 () Bool)

(assert (=> d!8423 m!38649))

(declare-fun m!38653 () Bool)

(assert (=> d!8423 m!38653))

(assert (=> d!8423 m!38397))

(declare-fun m!38657 () Bool)

(assert (=> d!8423 m!38657))

(assert (=> d!8423 m!38397))

(assert (=> d!8423 m!38653))

(declare-fun m!38663 () Bool)

(assert (=> d!8423 m!38663))

(assert (=> d!8423 m!38267))

(declare-fun m!38669 () Bool)

(assert (=> d!8423 m!38669))

(assert (=> b!44547 m!38397))

(declare-fun m!38675 () Bool)

(assert (=> b!44547 m!38675))

(declare-fun m!38679 () Bool)

(assert (=> b!44548 m!38679))

(assert (=> b!44229 d!8423))

(declare-fun b!44553 () Bool)

(declare-fun e!28247 () Bool)

(declare-fun e!28245 () Bool)

(assert (=> b!44553 (= e!28247 e!28245)))

(declare-fun res!26252 () Bool)

(assert (=> b!44553 (=> (not res!26252) (not e!28245))))

(declare-fun e!28248 () Bool)

(assert (=> b!44553 (= res!26252 (not e!28248))))

(declare-fun res!26253 () Bool)

(assert (=> b!44553 (=> (not res!26253) (not e!28248))))

(assert (=> b!44553 (= res!26253 (validKeyInArray!0 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000)))))

(declare-fun b!44554 () Bool)

(declare-fun e!28246 () Bool)

(declare-fun call!3631 () Bool)

(assert (=> b!44554 (= e!28246 call!3631)))

(declare-fun b!44555 () Bool)

(assert (=> b!44555 (= e!28245 e!28246)))

(declare-fun c!5871 () Bool)

(assert (=> b!44555 (= c!5871 (validKeyInArray!0 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000)))))

(declare-fun b!44556 () Bool)

(assert (=> b!44556 (= e!28246 call!3631)))

(declare-fun b!44557 () Bool)

(assert (=> b!44557 (= e!28248 (contains!574 Nil!1206 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000)))))

(declare-fun bm!3628 () Bool)

(assert (=> bm!3628 (= call!3631 (arrayNoDuplicates!0 (_keys!3463 lt!19259) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5871 (Cons!1205 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000) Nil!1206) Nil!1206)))))

(declare-fun d!8425 () Bool)

(declare-fun res!26254 () Bool)

(assert (=> d!8425 (=> res!26254 e!28247)))

(assert (=> d!8425 (= res!26254 (bvsge #b00000000000000000000000000000000 (size!1622 (_keys!3463 lt!19259))))))

(assert (=> d!8425 (= (arrayNoDuplicates!0 (_keys!3463 lt!19259) #b00000000000000000000000000000000 Nil!1206) e!28247)))

(assert (= (and d!8425 (not res!26254)) b!44553))

(assert (= (and b!44553 res!26253) b!44557))

(assert (= (and b!44553 res!26252) b!44555))

(assert (= (and b!44555 c!5871) b!44556))

(assert (= (and b!44555 (not c!5871)) b!44554))

(assert (= (or b!44556 b!44554) bm!3628))

(assert (=> b!44553 m!38561))

(assert (=> b!44553 m!38561))

(assert (=> b!44553 m!38563))

(assert (=> b!44555 m!38561))

(assert (=> b!44555 m!38561))

(assert (=> b!44555 m!38563))

(assert (=> b!44557 m!38561))

(assert (=> b!44557 m!38561))

(declare-fun m!38709 () Bool)

(assert (=> b!44557 m!38709))

(assert (=> bm!3628 m!38561))

(declare-fun m!38711 () Bool)

(assert (=> bm!3628 m!38711))

(assert (=> b!44122 d!8425))

(declare-fun d!8427 () Bool)

(declare-fun e!28258 () Bool)

(assert (=> d!8427 e!28258))

(declare-fun c!5879 () Bool)

(assert (=> d!8427 (= c!5879 (and (not (= (_1!828 lt!19270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!828 lt!19270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!8427 true))

(declare-fun _$15!86 () Unit!1229)

(assert (=> d!8427 (= (choose!262 lt!19268 lt!19261 mask!853 #b00000000000000000000000000000000 lt!19271 lt!19271 (_1!828 lt!19270) defaultEntry!470) _$15!86)))

(declare-fun b!44574 () Bool)

(assert (=> b!44574 (= e!28258 (arrayContainsKey!0 lt!19268 (_1!828 lt!19270) #b00000000000000000000000000000000))))

(declare-fun b!44575 () Bool)

(assert (=> b!44575 (= e!28258 (ite (= (_1!828 lt!19270) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!8427 c!5879) b!44574))

(assert (= (and d!8427 (not c!5879)) b!44575))

(assert (=> b!44574 m!38269))

(assert (=> d!8327 d!8427))

(assert (=> d!8327 d!8315))

(declare-fun d!8437 () Bool)

(declare-fun lt!19614 () Bool)

(declare-fun content!43 (List!1209) (Set (_ BitVec 64)))

(assert (=> d!8437 (= lt!19614 (set.member (select (arr!1419 lt!19268) #b00000000000000000000000000000000) (content!43 Nil!1206)))))

(declare-fun e!28266 () Bool)

(assert (=> d!8437 (= lt!19614 e!28266)))

(declare-fun res!26263 () Bool)

(assert (=> d!8437 (=> (not res!26263) (not e!28266))))

(assert (=> d!8437 (= res!26263 (is-Cons!1205 Nil!1206))))

(assert (=> d!8437 (= (contains!574 Nil!1206 (select (arr!1419 lt!19268) #b00000000000000000000000000000000)) lt!19614)))

(declare-fun b!44582 () Bool)

(declare-fun e!28265 () Bool)

(assert (=> b!44582 (= e!28266 e!28265)))

(declare-fun res!26264 () Bool)

(assert (=> b!44582 (=> res!26264 e!28265)))

(assert (=> b!44582 (= res!26264 (= (h!1782 Nil!1206) (select (arr!1419 lt!19268) #b00000000000000000000000000000000)))))

(declare-fun b!44583 () Bool)

(assert (=> b!44583 (= e!28265 (contains!574 (t!4224 Nil!1206) (select (arr!1419 lt!19268) #b00000000000000000000000000000000)))))

(assert (= (and d!8437 res!26263) b!44582))

(assert (= (and b!44582 (not res!26264)) b!44583))

(declare-fun m!38737 () Bool)

(assert (=> d!8437 m!38737))

(assert (=> d!8437 m!38397))

(declare-fun m!38739 () Bool)

(assert (=> d!8437 m!38739))

(assert (=> b!44583 m!38397))

(declare-fun m!38741 () Bool)

(assert (=> b!44583 m!38741))

(assert (=> b!44196 d!8437))

(declare-fun b!44584 () Bool)

(declare-fun e!28269 () Bool)

(declare-fun e!28267 () Bool)

(assert (=> b!44584 (= e!28269 e!28267)))

(declare-fun res!26265 () Bool)

(assert (=> b!44584 (=> (not res!26265) (not e!28267))))

(declare-fun e!28270 () Bool)

(assert (=> b!44584 (= res!26265 (not e!28270))))

(declare-fun res!26266 () Bool)

(assert (=> b!44584 (=> (not res!26266) (not e!28270))))

(assert (=> b!44584 (= res!26266 (validKeyInArray!0 (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!44585 () Bool)

(declare-fun e!28268 () Bool)

(declare-fun call!3635 () Bool)

(assert (=> b!44585 (= e!28268 call!3635)))

(declare-fun b!44586 () Bool)

(assert (=> b!44586 (= e!28267 e!28268)))

(declare-fun c!5880 () Bool)

(assert (=> b!44586 (= c!5880 (validKeyInArray!0 (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!44587 () Bool)

(assert (=> b!44587 (= e!28268 call!3635)))

(declare-fun b!44588 () Bool)

(assert (=> b!44588 (= e!28270 (contains!574 (ite c!5764 (Cons!1205 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) Nil!1206) Nil!1206) (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3632 () Bool)

(assert (=> bm!3632 (= call!3635 (arrayNoDuplicates!0 lt!19268 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5880 (Cons!1205 (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5764 (Cons!1205 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) Nil!1206) Nil!1206)) (ite c!5764 (Cons!1205 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) Nil!1206) Nil!1206))))))

(declare-fun d!8443 () Bool)

(declare-fun res!26267 () Bool)

(assert (=> d!8443 (=> res!26267 e!28269)))

(assert (=> d!8443 (= res!26267 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1622 lt!19268)))))

(assert (=> d!8443 (= (arrayNoDuplicates!0 lt!19268 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5764 (Cons!1205 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) Nil!1206) Nil!1206)) e!28269)))

(assert (= (and d!8443 (not res!26267)) b!44584))

(assert (= (and b!44584 res!26266) b!44588))

(assert (= (and b!44584 res!26265) b!44586))

(assert (= (and b!44586 c!5880) b!44587))

(assert (= (and b!44586 (not c!5880)) b!44585))

(assert (= (or b!44587 b!44585) bm!3632))

(assert (=> b!44584 m!38623))

(assert (=> b!44584 m!38623))

(assert (=> b!44584 m!38625))

(assert (=> b!44586 m!38623))

(assert (=> b!44586 m!38623))

(assert (=> b!44586 m!38625))

(assert (=> b!44588 m!38623))

(assert (=> b!44588 m!38623))

(declare-fun m!38743 () Bool)

(assert (=> b!44588 m!38743))

(assert (=> bm!3632 m!38623))

(declare-fun m!38745 () Bool)

(assert (=> bm!3632 m!38745))

(assert (=> bm!3565 d!8443))

(assert (=> d!8275 d!8293))

(declare-fun d!8445 () Bool)

(assert (=> d!8445 (= (arrayCountValidKeys!0 lt!19268 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(assert (=> d!8445 true))

(declare-fun _$88!58 () Unit!1229)

(assert (=> d!8445 (= (choose!59 lt!19268 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) _$88!58)))

(declare-fun bs!2024 () Bool)

(assert (= bs!2024 d!8445))

(assert (=> bs!2024 m!38293))

(assert (=> d!8275 d!8445))

(assert (=> b!44227 d!8409))

(declare-fun b!44589 () Bool)

(declare-fun e!28271 () (_ BitVec 32))

(declare-fun call!3636 () (_ BitVec 32))

(assert (=> b!44589 (= e!28271 (bvadd #b00000000000000000000000000000001 call!3636))))

(declare-fun b!44590 () Bool)

(declare-fun e!28272 () (_ BitVec 32))

(assert (=> b!44590 (= e!28272 #b00000000000000000000000000000000)))

(declare-fun b!44591 () Bool)

(assert (=> b!44591 (= e!28272 e!28271)))

(declare-fun c!5882 () Bool)

(assert (=> b!44591 (= c!5882 (validKeyInArray!0 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000)))))

(declare-fun d!8447 () Bool)

(declare-fun lt!19615 () (_ BitVec 32))

(assert (=> d!8447 (and (bvsge lt!19615 #b00000000000000000000000000000000) (bvsle lt!19615 (bvsub (size!1622 (_keys!3463 lt!19259)) #b00000000000000000000000000000000)))))

(assert (=> d!8447 (= lt!19615 e!28272)))

(declare-fun c!5881 () Bool)

(assert (=> d!8447 (= c!5881 (bvsge #b00000000000000000000000000000000 (size!1622 (_keys!3463 lt!19259))))))

(assert (=> d!8447 (and (bvsle #b00000000000000000000000000000000 (size!1622 (_keys!3463 lt!19259))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1622 (_keys!3463 lt!19259)) (size!1622 (_keys!3463 lt!19259))))))

(assert (=> d!8447 (= (arrayCountValidKeys!0 (_keys!3463 lt!19259) #b00000000000000000000000000000000 (size!1622 (_keys!3463 lt!19259))) lt!19615)))

(declare-fun bm!3633 () Bool)

(assert (=> bm!3633 (= call!3636 (arrayCountValidKeys!0 (_keys!3463 lt!19259) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1622 (_keys!3463 lt!19259))))))

(declare-fun b!44592 () Bool)

(assert (=> b!44592 (= e!28271 call!3636)))

(assert (= (and d!8447 c!5881) b!44590))

(assert (= (and d!8447 (not c!5881)) b!44591))

(assert (= (and b!44591 c!5882) b!44589))

(assert (= (and b!44591 (not c!5882)) b!44592))

(assert (= (or b!44589 b!44592) bm!3633))

(assert (=> b!44591 m!38561))

(assert (=> b!44591 m!38561))

(assert (=> b!44591 m!38563))

(declare-fun m!38747 () Bool)

(assert (=> bm!3633 m!38747))

(assert (=> b!44120 d!8447))

(declare-fun bm!3634 () Bool)

(declare-fun call!3637 () Bool)

(assert (=> bm!3634 (= call!3637 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3463 lt!19259) (mask!5473 lt!19259)))))

(declare-fun b!44593 () Bool)

(declare-fun e!28274 () Bool)

(assert (=> b!44593 (= e!28274 call!3637)))

(declare-fun b!44594 () Bool)

(declare-fun e!28275 () Bool)

(declare-fun e!28273 () Bool)

(assert (=> b!44594 (= e!28275 e!28273)))

(declare-fun c!5883 () Bool)

(assert (=> b!44594 (= c!5883 (validKeyInArray!0 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000)))))

(declare-fun d!8449 () Bool)

(declare-fun res!26269 () Bool)

(assert (=> d!8449 (=> res!26269 e!28275)))

(assert (=> d!8449 (= res!26269 (bvsge #b00000000000000000000000000000000 (size!1622 (_keys!3463 lt!19259))))))

(assert (=> d!8449 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3463 lt!19259) (mask!5473 lt!19259)) e!28275)))

(declare-fun b!44595 () Bool)

(assert (=> b!44595 (= e!28273 call!3637)))

(declare-fun b!44596 () Bool)

(assert (=> b!44596 (= e!28273 e!28274)))

(declare-fun lt!19618 () (_ BitVec 64))

(assert (=> b!44596 (= lt!19618 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000))))

(declare-fun lt!19616 () Unit!1229)

(assert (=> b!44596 (= lt!19616 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3463 lt!19259) lt!19618 #b00000000000000000000000000000000))))

(assert (=> b!44596 (arrayContainsKey!0 (_keys!3463 lt!19259) lt!19618 #b00000000000000000000000000000000)))

(declare-fun lt!19617 () Unit!1229)

(assert (=> b!44596 (= lt!19617 lt!19616)))

(declare-fun res!26268 () Bool)

(assert (=> b!44596 (= res!26268 (= (seekEntryOrOpen!0 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000) (_keys!3463 lt!19259) (mask!5473 lt!19259)) (Found!202 #b00000000000000000000000000000000)))))

(assert (=> b!44596 (=> (not res!26268) (not e!28274))))

(assert (= (and d!8449 (not res!26269)) b!44594))

(assert (= (and b!44594 c!5883) b!44596))

(assert (= (and b!44594 (not c!5883)) b!44595))

(assert (= (and b!44596 res!26268) b!44593))

(assert (= (or b!44593 b!44595) bm!3634))

(declare-fun m!38749 () Bool)

(assert (=> bm!3634 m!38749))

(assert (=> b!44594 m!38561))

(assert (=> b!44594 m!38561))

(assert (=> b!44594 m!38563))

(assert (=> b!44596 m!38561))

(declare-fun m!38751 () Bool)

(assert (=> b!44596 m!38751))

(declare-fun m!38753 () Bool)

(assert (=> b!44596 m!38753))

(assert (=> b!44596 m!38561))

(declare-fun m!38755 () Bool)

(assert (=> b!44596 m!38755))

(assert (=> b!44121 d!8449))

(assert (=> b!44194 d!8409))

(assert (=> d!8291 d!8305))

(declare-fun d!8451 () Bool)

(assert (=> d!8451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19268 mask!853)))

(assert (=> d!8451 true))

(declare-fun _$30!75 () Unit!1229)

(assert (=> d!8451 (= (choose!34 lt!19268 mask!853 #b00000000000000000000000000000000) _$30!75)))

(declare-fun bs!2025 () Bool)

(assert (= bs!2025 d!8451))

(assert (=> bs!2025 m!38289))

(assert (=> d!8291 d!8451))

(assert (=> d!8291 d!8315))

(push 1)

(assert (not b!44442))

(assert (not b!44445))

(assert (not b!44557))

(assert (not b!44451))

(assert (not d!8419))

(assert (not b!44447))

(assert (not bm!3605))

(assert (not b!44464))

(assert (not b!44553))

(assert (not d!8407))

(assert tp_is_empty!1903)

(assert (not b!44555))

(assert (not bm!3599))

(assert (not b!44586))

(assert (not d!8437))

(assert (not d!8451))

(assert (not b!44428))

(assert (not b!44596))

(assert (not bm!3608))

(assert (not bm!3602))

(assert (not b!44574))

(assert (not d!8445))

(assert (not b!44584))

(assert (not b!44432))

(assert (not bm!3632))

(assert (not b!44449))

(assert (not b!44594))

(assert (not b!44441))

(assert (not b!44547))

(assert (not bm!3628))

(assert (not b_lambda!2315))

(assert (not d!8353))

(assert (not d!8423))

(assert (not b_lambda!2321))

(assert (not b!44588))

(assert (not b!44478))

(assert (not b!44483))

(assert (not b!44481))

(assert (not bm!3634))

(assert (not bm!3598))

(assert (not b_next!1513))

(assert (not b!44583))

(assert (not bm!3633))

(assert b_and!2711)

(assert (not b!44443))

(assert (not d!8413))

(assert (not b!44591))

(assert (not b!44463))

(assert (not b!44434))

(assert (not b!44440))

(assert (not bm!3604))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2711)

(assert (not b_next!1513))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!8499 () Bool)

(assert (=> d!8499 (= (validKeyInArray!0 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!44594 d!8499))

(declare-fun d!8501 () Bool)

(assert (=> d!8501 (= (size!1640 lt!19259) (bvadd (_size!243 lt!19259) (bvsdiv (bvadd (extraKeys!1787 lt!19259) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!44463 d!8501))

(declare-fun b!44774 () Bool)

(declare-fun e!28378 () (_ BitVec 32))

(declare-fun call!3666 () (_ BitVec 32))

(assert (=> b!44774 (= e!28378 (bvadd #b00000000000000000000000000000001 call!3666))))

(declare-fun b!44775 () Bool)

(declare-fun e!28379 () (_ BitVec 32))

(assert (=> b!44775 (= e!28379 #b00000000000000000000000000000000)))

(declare-fun b!44776 () Bool)

(assert (=> b!44776 (= e!28379 e!28378)))

(declare-fun c!5930 () Bool)

(assert (=> b!44776 (= c!5930 (validKeyInArray!0 (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!8503 () Bool)

(declare-fun lt!19750 () (_ BitVec 32))

(assert (=> d!8503 (and (bvsge lt!19750 #b00000000000000000000000000000000) (bvsle lt!19750 (bvsub (size!1622 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!8503 (= lt!19750 e!28379)))

(declare-fun c!5929 () Bool)

(assert (=> d!8503 (= c!5929 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8503 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1622 lt!19268)))))

(assert (=> d!8503 (= (arrayCountValidKeys!0 lt!19268 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!19750)))

(declare-fun bm!3663 () Bool)

(assert (=> bm!3663 (= call!3666 (arrayCountValidKeys!0 lt!19268 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!44777 () Bool)

(assert (=> b!44777 (= e!28378 call!3666)))

(assert (= (and d!8503 c!5929) b!44775))

(assert (= (and d!8503 (not c!5929)) b!44776))

(assert (= (and b!44776 c!5930) b!44774))

(assert (= (and b!44776 (not c!5930)) b!44777))

(assert (= (or b!44774 b!44777) bm!3663))

(declare-fun m!38923 () Bool)

(assert (=> b!44776 m!38923))

(assert (=> b!44776 m!38923))

(declare-fun m!38925 () Bool)

(assert (=> b!44776 m!38925))

(declare-fun m!38927 () Bool)

(assert (=> bm!3663 m!38927))

(assert (=> bm!3608 d!8503))

(declare-fun d!8505 () Bool)

(assert (=> d!8505 (arrayContainsKey!0 lt!19268 lt!19523 #b00000000000000000000000000000000)))

(declare-fun lt!19751 () Unit!1229)

(assert (=> d!8505 (= lt!19751 (choose!13 lt!19268 lt!19523 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!8505 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!8505 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19268 lt!19523 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19751)))

(declare-fun bs!2031 () Bool)

(assert (= bs!2031 d!8505))

(assert (=> bs!2031 m!38629))

(declare-fun m!38929 () Bool)

(assert (=> bs!2031 m!38929))

(assert (=> b!44449 d!8505))

(declare-fun d!8507 () Bool)

(declare-fun res!26360 () Bool)

(declare-fun e!28382 () Bool)

(assert (=> d!8507 (=> res!26360 e!28382)))

(assert (=> d!8507 (= res!26360 (= (select (arr!1419 lt!19268) #b00000000000000000000000000000000) lt!19523))))

(assert (=> d!8507 (= (arrayContainsKey!0 lt!19268 lt!19523 #b00000000000000000000000000000000) e!28382)))

(declare-fun b!44782 () Bool)

(declare-fun e!28383 () Bool)

(assert (=> b!44782 (= e!28382 e!28383)))

(declare-fun res!26361 () Bool)

(assert (=> b!44782 (=> (not res!26361) (not e!28383))))

(assert (=> b!44782 (= res!26361 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1622 lt!19268)))))

(declare-fun b!44783 () Bool)

(assert (=> b!44783 (= e!28383 (arrayContainsKey!0 lt!19268 lt!19523 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8507 (not res!26360)) b!44782))

(assert (= (and b!44782 res!26361) b!44783))

(assert (=> d!8507 m!38397))

(declare-fun m!38931 () Bool)

(assert (=> b!44783 m!38931))

(assert (=> b!44449 d!8507))

(declare-fun d!8509 () Bool)

(declare-fun lt!19754 () SeekEntryResult!202)

(assert (=> d!8509 (and (or (is-Undefined!202 lt!19754) (not (is-Found!202 lt!19754)) (and (bvsge (index!2931 lt!19754) #b00000000000000000000000000000000) (bvslt (index!2931 lt!19754) (size!1622 lt!19268)))) (or (is-Undefined!202 lt!19754) (is-Found!202 lt!19754) (not (is-MissingZero!202 lt!19754)) (and (bvsge (index!2930 lt!19754) #b00000000000000000000000000000000) (bvslt (index!2930 lt!19754) (size!1622 lt!19268)))) (or (is-Undefined!202 lt!19754) (is-Found!202 lt!19754) (is-MissingZero!202 lt!19754) (not (is-MissingVacant!202 lt!19754)) (and (bvsge (index!2933 lt!19754) #b00000000000000000000000000000000) (bvslt (index!2933 lt!19754) (size!1622 lt!19268)))) (or (is-Undefined!202 lt!19754) (ite (is-Found!202 lt!19754) (= (select (arr!1419 lt!19268) (index!2931 lt!19754)) (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite (is-MissingZero!202 lt!19754) (= (select (arr!1419 lt!19268) (index!2930 lt!19754)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!202 lt!19754) (= (select (arr!1419 lt!19268) (index!2933 lt!19754)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!28386 () SeekEntryResult!202)

(assert (=> d!8509 (= lt!19754 e!28386)))

(declare-fun c!5934 () Bool)

(declare-fun lt!19753 () SeekEntryResult!202)

(assert (=> d!8509 (= c!5934 (and (is-Intermediate!202 lt!19753) (undefined!1014 lt!19753)))))

(assert (=> d!8509 (= lt!19753 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!853) (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19268 mask!853))))

(assert (=> d!8509 (validMask!0 mask!853)))

(assert (=> d!8509 (= (seekEntryOrOpen!0 (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19268 mask!853) lt!19754)))

(declare-fun e!28385 () SeekEntryResult!202)

(declare-fun b!44784 () Bool)

(assert (=> b!44784 (= e!28385 (seekKeyOrZeroReturnVacant!0 (x!8356 lt!19753) (index!2932 lt!19753) (index!2932 lt!19753) (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19268 mask!853))))

(declare-fun b!44785 () Bool)

(declare-fun e!28384 () SeekEntryResult!202)

(assert (=> b!44785 (= e!28386 e!28384)))

(declare-fun lt!19752 () (_ BitVec 64))

(assert (=> b!44785 (= lt!19752 (select (arr!1419 lt!19268) (index!2932 lt!19753)))))

(declare-fun c!5935 () Bool)

(assert (=> b!44785 (= c!5935 (= lt!19752 (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!44786 () Bool)

(assert (=> b!44786 (= e!28384 (Found!202 (index!2932 lt!19753)))))

(declare-fun b!44787 () Bool)

(declare-fun c!5933 () Bool)

(assert (=> b!44787 (= c!5933 (= lt!19752 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!44787 (= e!28384 e!28385)))

(declare-fun b!44788 () Bool)

(assert (=> b!44788 (= e!28385 (MissingZero!202 (index!2932 lt!19753)))))

(declare-fun b!44789 () Bool)

(assert (=> b!44789 (= e!28386 Undefined!202)))

(assert (= (and d!8509 c!5934) b!44789))

(assert (= (and d!8509 (not c!5934)) b!44785))

(assert (= (and b!44785 c!5935) b!44786))

(assert (= (and b!44785 (not c!5935)) b!44787))

(assert (= (and b!44787 c!5933) b!44788))

(assert (= (and b!44787 (not c!5933)) b!44784))

(declare-fun m!38933 () Bool)

(assert (=> d!8509 m!38933))

(declare-fun m!38935 () Bool)

(assert (=> d!8509 m!38935))

(assert (=> d!8509 m!38623))

(declare-fun m!38937 () Bool)

(assert (=> d!8509 m!38937))

(assert (=> d!8509 m!38623))

(assert (=> d!8509 m!38935))

(declare-fun m!38939 () Bool)

(assert (=> d!8509 m!38939))

(assert (=> d!8509 m!38267))

(declare-fun m!38941 () Bool)

(assert (=> d!8509 m!38941))

(assert (=> b!44784 m!38623))

(declare-fun m!38943 () Bool)

(assert (=> b!44784 m!38943))

(declare-fun m!38945 () Bool)

(assert (=> b!44785 m!38945))

(assert (=> b!44449 d!8509))

(declare-fun bm!3664 () Bool)

(declare-fun call!3667 () Bool)

(assert (=> bm!3664 (= call!3667 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3463 lt!19259) (mask!5473 lt!19259)))))

(declare-fun b!44790 () Bool)

(declare-fun e!28388 () Bool)

(assert (=> b!44790 (= e!28388 call!3667)))

(declare-fun b!44791 () Bool)

(declare-fun e!28389 () Bool)

(declare-fun e!28387 () Bool)

(assert (=> b!44791 (= e!28389 e!28387)))

(declare-fun c!5936 () Bool)

(assert (=> b!44791 (= c!5936 (validKeyInArray!0 (select (arr!1419 (_keys!3463 lt!19259)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!8511 () Bool)

(declare-fun res!26363 () Bool)

(assert (=> d!8511 (=> res!26363 e!28389)))

(assert (=> d!8511 (= res!26363 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1622 (_keys!3463 lt!19259))))))

(assert (=> d!8511 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3463 lt!19259) (mask!5473 lt!19259)) e!28389)))

(declare-fun b!44792 () Bool)

(assert (=> b!44792 (= e!28387 call!3667)))

(declare-fun b!44793 () Bool)

(assert (=> b!44793 (= e!28387 e!28388)))

(declare-fun lt!19757 () (_ BitVec 64))

(assert (=> b!44793 (= lt!19757 (select (arr!1419 (_keys!3463 lt!19259)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!19755 () Unit!1229)

(assert (=> b!44793 (= lt!19755 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3463 lt!19259) lt!19757 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!44793 (arrayContainsKey!0 (_keys!3463 lt!19259) lt!19757 #b00000000000000000000000000000000)))

(declare-fun lt!19756 () Unit!1229)

(assert (=> b!44793 (= lt!19756 lt!19755)))

(declare-fun res!26362 () Bool)

(assert (=> b!44793 (= res!26362 (= (seekEntryOrOpen!0 (select (arr!1419 (_keys!3463 lt!19259)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3463 lt!19259) (mask!5473 lt!19259)) (Found!202 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!44793 (=> (not res!26362) (not e!28388))))

(assert (= (and d!8511 (not res!26363)) b!44791))

(assert (= (and b!44791 c!5936) b!44793))

(assert (= (and b!44791 (not c!5936)) b!44792))

(assert (= (and b!44793 res!26362) b!44790))

(assert (= (or b!44790 b!44792) bm!3664))

(declare-fun m!38947 () Bool)

(assert (=> bm!3664 m!38947))

(declare-fun m!38949 () Bool)

(assert (=> b!44791 m!38949))

(assert (=> b!44791 m!38949))

(declare-fun m!38951 () Bool)

(assert (=> b!44791 m!38951))

(assert (=> b!44793 m!38949))

(declare-fun m!38953 () Bool)

(assert (=> b!44793 m!38953))

(declare-fun m!38955 () Bool)

(assert (=> b!44793 m!38955))

(assert (=> b!44793 m!38949))

(declare-fun m!38957 () Bool)

(assert (=> b!44793 m!38957))

(assert (=> bm!3634 d!8511))

(declare-fun d!8513 () Bool)

(assert (=> d!8513 (= (validMask!0 (mask!5473 lt!19259)) (and (or (= (mask!5473 lt!19259) #b00000000000000000000000000000111) (= (mask!5473 lt!19259) #b00000000000000000000000000001111) (= (mask!5473 lt!19259) #b00000000000000000000000000011111) (= (mask!5473 lt!19259) #b00000000000000000000000000111111) (= (mask!5473 lt!19259) #b00000000000000000000000001111111) (= (mask!5473 lt!19259) #b00000000000000000000000011111111) (= (mask!5473 lt!19259) #b00000000000000000000000111111111) (= (mask!5473 lt!19259) #b00000000000000000000001111111111) (= (mask!5473 lt!19259) #b00000000000000000000011111111111) (= (mask!5473 lt!19259) #b00000000000000000000111111111111) (= (mask!5473 lt!19259) #b00000000000000000001111111111111) (= (mask!5473 lt!19259) #b00000000000000000011111111111111) (= (mask!5473 lt!19259) #b00000000000000000111111111111111) (= (mask!5473 lt!19259) #b00000000000000001111111111111111) (= (mask!5473 lt!19259) #b00000000000000011111111111111111) (= (mask!5473 lt!19259) #b00000000000000111111111111111111) (= (mask!5473 lt!19259) #b00000000000001111111111111111111) (= (mask!5473 lt!19259) #b00000000000011111111111111111111) (= (mask!5473 lt!19259) #b00000000000111111111111111111111) (= (mask!5473 lt!19259) #b00000000001111111111111111111111) (= (mask!5473 lt!19259) #b00000000011111111111111111111111) (= (mask!5473 lt!19259) #b00000000111111111111111111111111) (= (mask!5473 lt!19259) #b00000001111111111111111111111111) (= (mask!5473 lt!19259) #b00000011111111111111111111111111) (= (mask!5473 lt!19259) #b00000111111111111111111111111111) (= (mask!5473 lt!19259) #b00001111111111111111111111111111) (= (mask!5473 lt!19259) #b00011111111111111111111111111111) (= (mask!5473 lt!19259) #b00111111111111111111111111111111)) (bvsle (mask!5473 lt!19259) #b00111111111111111111111111111111)))))

(assert (=> d!8413 d!8513))

(declare-fun b!44794 () Bool)

(declare-fun e!28392 () Bool)

(declare-fun e!28390 () Bool)

(assert (=> b!44794 (= e!28392 e!28390)))

(declare-fun res!26364 () Bool)

(assert (=> b!44794 (=> (not res!26364) (not e!28390))))

(declare-fun e!28393 () Bool)

(assert (=> b!44794 (= res!26364 (not e!28393))))

(declare-fun res!26365 () Bool)

(assert (=> b!44794 (=> (not res!26365) (not e!28393))))

(assert (=> b!44794 (= res!26365 (validKeyInArray!0 (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!44795 () Bool)

(declare-fun e!28391 () Bool)

(declare-fun call!3668 () Bool)

(assert (=> b!44795 (= e!28391 call!3668)))

(declare-fun b!44796 () Bool)

(assert (=> b!44796 (= e!28390 e!28391)))

(declare-fun c!5937 () Bool)

(assert (=> b!44796 (= c!5937 (validKeyInArray!0 (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!44797 () Bool)

(assert (=> b!44797 (= e!28391 call!3668)))

(declare-fun b!44798 () Bool)

(assert (=> b!44798 (= e!28393 (contains!574 (ite c!5880 (Cons!1205 (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5764 (Cons!1205 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) Nil!1206) Nil!1206)) (ite c!5764 (Cons!1205 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) Nil!1206) Nil!1206)) (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun bm!3665 () Bool)

(assert (=> bm!3665 (= call!3668 (arrayNoDuplicates!0 lt!19268 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5937 (Cons!1205 (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!5880 (Cons!1205 (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5764 (Cons!1205 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) Nil!1206) Nil!1206)) (ite c!5764 (Cons!1205 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) Nil!1206) Nil!1206))) (ite c!5880 (Cons!1205 (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5764 (Cons!1205 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) Nil!1206) Nil!1206)) (ite c!5764 (Cons!1205 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) Nil!1206) Nil!1206)))))))

(declare-fun d!8515 () Bool)

(declare-fun res!26366 () Bool)

(assert (=> d!8515 (=> res!26366 e!28392)))

(assert (=> d!8515 (= res!26366 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1622 lt!19268)))))

(assert (=> d!8515 (= (arrayNoDuplicates!0 lt!19268 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5880 (Cons!1205 (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5764 (Cons!1205 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) Nil!1206) Nil!1206)) (ite c!5764 (Cons!1205 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) Nil!1206) Nil!1206))) e!28392)))

(assert (= (and d!8515 (not res!26366)) b!44794))

(assert (= (and b!44794 res!26365) b!44798))

(assert (= (and b!44794 res!26364) b!44796))

(assert (= (and b!44796 c!5937) b!44797))

(assert (= (and b!44796 (not c!5937)) b!44795))

(assert (= (or b!44797 b!44795) bm!3665))

(assert (=> b!44794 m!38923))

(assert (=> b!44794 m!38923))

(assert (=> b!44794 m!38925))

(assert (=> b!44796 m!38923))

(assert (=> b!44796 m!38923))

(assert (=> b!44796 m!38925))

(assert (=> b!44798 m!38923))

(assert (=> b!44798 m!38923))

(declare-fun m!38959 () Bool)

(assert (=> b!44798 m!38959))

(assert (=> bm!3665 m!38923))

(declare-fun m!38961 () Bool)

(assert (=> bm!3665 m!38961))

(assert (=> bm!3632 d!8515))

(declare-fun d!8517 () Bool)

(assert (=> d!8517 (= (validKeyInArray!0 (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!44478 d!8517))

(assert (=> b!44591 d!8499))

(declare-fun d!8519 () Bool)

(assert (=> d!8519 (arrayContainsKey!0 (_keys!3463 lt!19259) lt!19618 #b00000000000000000000000000000000)))

(declare-fun lt!19758 () Unit!1229)

(assert (=> d!8519 (= lt!19758 (choose!13 (_keys!3463 lt!19259) lt!19618 #b00000000000000000000000000000000))))

(assert (=> d!8519 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!8519 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3463 lt!19259) lt!19618 #b00000000000000000000000000000000) lt!19758)))

(declare-fun bs!2032 () Bool)

(assert (= bs!2032 d!8519))

(assert (=> bs!2032 m!38753))

(declare-fun m!38963 () Bool)

(assert (=> bs!2032 m!38963))

(assert (=> b!44596 d!8519))

(declare-fun d!8521 () Bool)

(declare-fun res!26367 () Bool)

(declare-fun e!28394 () Bool)

(assert (=> d!8521 (=> res!26367 e!28394)))

(assert (=> d!8521 (= res!26367 (= (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000) lt!19618))))

(assert (=> d!8521 (= (arrayContainsKey!0 (_keys!3463 lt!19259) lt!19618 #b00000000000000000000000000000000) e!28394)))

(declare-fun b!44799 () Bool)

(declare-fun e!28395 () Bool)

(assert (=> b!44799 (= e!28394 e!28395)))

(declare-fun res!26368 () Bool)

(assert (=> b!44799 (=> (not res!26368) (not e!28395))))

(assert (=> b!44799 (= res!26368 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1622 (_keys!3463 lt!19259))))))

(declare-fun b!44800 () Bool)

(assert (=> b!44800 (= e!28395 (arrayContainsKey!0 (_keys!3463 lt!19259) lt!19618 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8521 (not res!26367)) b!44799))

(assert (= (and b!44799 res!26368) b!44800))

(assert (=> d!8521 m!38561))

(declare-fun m!38965 () Bool)

(assert (=> b!44800 m!38965))

(assert (=> b!44596 d!8521))

(declare-fun d!8523 () Bool)

(declare-fun lt!19761 () SeekEntryResult!202)

(assert (=> d!8523 (and (or (is-Undefined!202 lt!19761) (not (is-Found!202 lt!19761)) (and (bvsge (index!2931 lt!19761) #b00000000000000000000000000000000) (bvslt (index!2931 lt!19761) (size!1622 (_keys!3463 lt!19259))))) (or (is-Undefined!202 lt!19761) (is-Found!202 lt!19761) (not (is-MissingZero!202 lt!19761)) (and (bvsge (index!2930 lt!19761) #b00000000000000000000000000000000) (bvslt (index!2930 lt!19761) (size!1622 (_keys!3463 lt!19259))))) (or (is-Undefined!202 lt!19761) (is-Found!202 lt!19761) (is-MissingZero!202 lt!19761) (not (is-MissingVacant!202 lt!19761)) (and (bvsge (index!2933 lt!19761) #b00000000000000000000000000000000) (bvslt (index!2933 lt!19761) (size!1622 (_keys!3463 lt!19259))))) (or (is-Undefined!202 lt!19761) (ite (is-Found!202 lt!19761) (= (select (arr!1419 (_keys!3463 lt!19259)) (index!2931 lt!19761)) (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000)) (ite (is-MissingZero!202 lt!19761) (= (select (arr!1419 (_keys!3463 lt!19259)) (index!2930 lt!19761)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!202 lt!19761) (= (select (arr!1419 (_keys!3463 lt!19259)) (index!2933 lt!19761)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!28398 () SeekEntryResult!202)

(assert (=> d!8523 (= lt!19761 e!28398)))

(declare-fun c!5939 () Bool)

(declare-fun lt!19760 () SeekEntryResult!202)

(assert (=> d!8523 (= c!5939 (and (is-Intermediate!202 lt!19760) (undefined!1014 lt!19760)))))

(assert (=> d!8523 (= lt!19760 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000) (mask!5473 lt!19259)) (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000) (_keys!3463 lt!19259) (mask!5473 lt!19259)))))

(assert (=> d!8523 (validMask!0 (mask!5473 lt!19259))))

(assert (=> d!8523 (= (seekEntryOrOpen!0 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000) (_keys!3463 lt!19259) (mask!5473 lt!19259)) lt!19761)))

(declare-fun b!44801 () Bool)

(declare-fun e!28397 () SeekEntryResult!202)

(assert (=> b!44801 (= e!28397 (seekKeyOrZeroReturnVacant!0 (x!8356 lt!19760) (index!2932 lt!19760) (index!2932 lt!19760) (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000) (_keys!3463 lt!19259) (mask!5473 lt!19259)))))

(declare-fun b!44802 () Bool)

(declare-fun e!28396 () SeekEntryResult!202)

(assert (=> b!44802 (= e!28398 e!28396)))

(declare-fun lt!19759 () (_ BitVec 64))

(assert (=> b!44802 (= lt!19759 (select (arr!1419 (_keys!3463 lt!19259)) (index!2932 lt!19760)))))

(declare-fun c!5940 () Bool)

(assert (=> b!44802 (= c!5940 (= lt!19759 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000)))))

(declare-fun b!44803 () Bool)

(assert (=> b!44803 (= e!28396 (Found!202 (index!2932 lt!19760)))))

(declare-fun b!44804 () Bool)

(declare-fun c!5938 () Bool)

(assert (=> b!44804 (= c!5938 (= lt!19759 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!44804 (= e!28396 e!28397)))

(declare-fun b!44805 () Bool)

(assert (=> b!44805 (= e!28397 (MissingZero!202 (index!2932 lt!19760)))))

(declare-fun b!44806 () Bool)

(assert (=> b!44806 (= e!28398 Undefined!202)))

(assert (= (and d!8523 c!5939) b!44806))

(assert (= (and d!8523 (not c!5939)) b!44802))

(assert (= (and b!44802 c!5940) b!44803))

(assert (= (and b!44802 (not c!5940)) b!44804))

(assert (= (and b!44804 c!5938) b!44805))

(assert (= (and b!44804 (not c!5938)) b!44801))

(declare-fun m!38967 () Bool)

(assert (=> d!8523 m!38967))

(declare-fun m!38969 () Bool)

(assert (=> d!8523 m!38969))

(assert (=> d!8523 m!38561))

(declare-fun m!38971 () Bool)

(assert (=> d!8523 m!38971))

(assert (=> d!8523 m!38561))

(assert (=> d!8523 m!38969))

(declare-fun m!38973 () Bool)

(assert (=> d!8523 m!38973))

(assert (=> d!8523 m!38607))

(declare-fun m!38975 () Bool)

(assert (=> d!8523 m!38975))

(assert (=> b!44801 m!38561))

(declare-fun m!38977 () Bool)

(assert (=> b!44801 m!38977))

(declare-fun m!38979 () Bool)

(assert (=> b!44802 m!38979))

(assert (=> b!44596 d!8523))

(declare-fun d!8525 () Bool)

(declare-fun res!26373 () Bool)

(declare-fun e!28406 () Bool)

(assert (=> d!8525 (=> res!26373 e!28406)))

(assert (=> d!8525 (= res!26373 (= (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19402))))

(assert (=> d!8525 (= (arrayContainsKey!0 lt!19268 lt!19402 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!28406)))

(declare-fun b!44819 () Bool)

(declare-fun e!28407 () Bool)

(assert (=> b!44819 (= e!28406 e!28407)))

(declare-fun res!26374 () Bool)

(assert (=> b!44819 (=> (not res!26374) (not e!28407))))

(assert (=> b!44819 (= res!26374 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1622 lt!19268)))))

(declare-fun b!44820 () Bool)

(assert (=> b!44820 (= e!28407 (arrayContainsKey!0 lt!19268 lt!19402 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!8525 (not res!26373)) b!44819))

(assert (= (and b!44819 res!26374) b!44820))

(assert (=> d!8525 m!38623))

(declare-fun m!38981 () Bool)

(assert (=> b!44820 m!38981))

(assert (=> b!44483 d!8525))

(declare-fun d!8527 () Bool)

(declare-datatypes ((Option!114 0))(
  ( (Some!113 (v!2093 V!2325)) (None!112) )
))
(declare-fun get!805 (Option!114) V!2325)

(declare-fun getValueByKey!108 (List!1208 (_ BitVec 64)) Option!114)

(assert (=> d!8527 (= (apply!61 lt!19512 #b1000000000000000000000000000000000000000000000000000000000000000) (get!805 (getValueByKey!108 (toList!621 lt!19512) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2033 () Bool)

(assert (= bs!2033 d!8527))

(declare-fun m!39001 () Bool)

(assert (=> bs!2033 m!39001))

(assert (=> bs!2033 m!39001))

(declare-fun m!39005 () Bool)

(assert (=> bs!2033 m!39005))

(assert (=> b!44432 d!8527))

(assert (=> b!44464 d!8501))

(assert (=> b!44586 d!8517))

(declare-fun d!8531 () Bool)

(declare-fun lt!19773 () Bool)

(assert (=> d!8531 (= lt!19773 (set.member (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000) (content!43 Nil!1206)))))

(declare-fun e!28411 () Bool)

(assert (=> d!8531 (= lt!19773 e!28411)))

(declare-fun res!26376 () Bool)

(assert (=> d!8531 (=> (not res!26376) (not e!28411))))

(assert (=> d!8531 (= res!26376 (is-Cons!1205 Nil!1206))))

(assert (=> d!8531 (= (contains!574 Nil!1206 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000)) lt!19773)))

(declare-fun b!44824 () Bool)

(declare-fun e!28410 () Bool)

(assert (=> b!44824 (= e!28411 e!28410)))

(declare-fun res!26377 () Bool)

(assert (=> b!44824 (=> res!26377 e!28410)))

(assert (=> b!44824 (= res!26377 (= (h!1782 Nil!1206) (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000)))))

(declare-fun b!44825 () Bool)

(assert (=> b!44825 (= e!28410 (contains!574 (t!4224 Nil!1206) (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000)))))

(assert (= (and d!8531 res!26376) b!44824))

(assert (= (and b!44824 (not res!26377)) b!44825))

(assert (=> d!8531 m!38737))

(assert (=> d!8531 m!38561))

(declare-fun m!39011 () Bool)

(assert (=> d!8531 m!39011))

(assert (=> b!44825 m!38561))

(declare-fun m!39015 () Bool)

(assert (=> b!44825 m!39015))

(assert (=> b!44557 d!8531))

(declare-fun bm!3667 () Bool)

(declare-fun call!3670 () Bool)

(assert (=> bm!3667 (= call!3670 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!19268 mask!853))))

(declare-fun b!44826 () Bool)

(declare-fun e!28413 () Bool)

(assert (=> b!44826 (= e!28413 call!3670)))

(declare-fun b!44827 () Bool)

(declare-fun e!28414 () Bool)

(declare-fun e!28412 () Bool)

(assert (=> b!44827 (= e!28414 e!28412)))

(declare-fun c!5946 () Bool)

(assert (=> b!44827 (= c!5946 (validKeyInArray!0 (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!8533 () Bool)

(declare-fun res!26379 () Bool)

(assert (=> d!8533 (=> res!26379 e!28414)))

(assert (=> d!8533 (= res!26379 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1622 lt!19268)))))

(assert (=> d!8533 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!19268 mask!853) e!28414)))

(declare-fun b!44828 () Bool)

(assert (=> b!44828 (= e!28412 call!3670)))

(declare-fun b!44829 () Bool)

(assert (=> b!44829 (= e!28412 e!28413)))

(declare-fun lt!19776 () (_ BitVec 64))

(assert (=> b!44829 (= lt!19776 (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!19774 () Unit!1229)

(assert (=> b!44829 (= lt!19774 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19268 lt!19776 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!44829 (arrayContainsKey!0 lt!19268 lt!19776 #b00000000000000000000000000000000)))

(declare-fun lt!19775 () Unit!1229)

(assert (=> b!44829 (= lt!19775 lt!19774)))

(declare-fun res!26378 () Bool)

(assert (=> b!44829 (= res!26378 (= (seekEntryOrOpen!0 (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!19268 mask!853) (Found!202 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!44829 (=> (not res!26378) (not e!28413))))

(assert (= (and d!8533 (not res!26379)) b!44827))

(assert (= (and b!44827 c!5946) b!44829))

(assert (= (and b!44827 (not c!5946)) b!44828))

(assert (= (and b!44829 res!26378) b!44826))

(assert (= (or b!44826 b!44828) bm!3667))

(declare-fun m!39019 () Bool)

(assert (=> bm!3667 m!39019))

(assert (=> b!44827 m!38923))

(assert (=> b!44827 m!38923))

(assert (=> b!44827 m!38925))

(assert (=> b!44829 m!38923))

(declare-fun m!39021 () Bool)

(assert (=> b!44829 m!39021))

(declare-fun m!39023 () Bool)

(assert (=> b!44829 m!39023))

(assert (=> b!44829 m!38923))

(declare-fun m!39025 () Bool)

(assert (=> b!44829 m!39025))

(assert (=> bm!3605 d!8533))

(declare-fun d!8539 () Bool)

(declare-fun e!28432 () Bool)

(assert (=> d!8539 e!28432))

(declare-fun res!26391 () Bool)

(assert (=> d!8539 (=> (not res!26391) (not e!28432))))

(declare-fun lt!19797 () ListLongMap!1211)

(assert (=> d!8539 (= res!26391 (contains!577 lt!19797 (_1!828 (ite (or c!5834 c!5837) (tuple2!1635 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19259)) (tuple2!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19259))))))))

(declare-fun lt!19800 () List!1208)

(assert (=> d!8539 (= lt!19797 (ListLongMap!1212 lt!19800))))

(declare-fun lt!19798 () Unit!1229)

(declare-fun lt!19799 () Unit!1229)

(assert (=> d!8539 (= lt!19798 lt!19799)))

(assert (=> d!8539 (= (getValueByKey!108 lt!19800 (_1!828 (ite (or c!5834 c!5837) (tuple2!1635 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19259)) (tuple2!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19259))))) (Some!113 (_2!828 (ite (or c!5834 c!5837) (tuple2!1635 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19259)) (tuple2!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19259))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!32 (List!1208 (_ BitVec 64) V!2325) Unit!1229)

(assert (=> d!8539 (= lt!19799 (lemmaContainsTupThenGetReturnValue!32 lt!19800 (_1!828 (ite (or c!5834 c!5837) (tuple2!1635 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19259)) (tuple2!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19259)))) (_2!828 (ite (or c!5834 c!5837) (tuple2!1635 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19259)) (tuple2!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19259))))))))

(declare-fun insertStrictlySorted!29 (List!1208 (_ BitVec 64) V!2325) List!1208)

(assert (=> d!8539 (= lt!19800 (insertStrictlySorted!29 (toList!621 (ite c!5834 call!3605 (ite c!5837 call!3606 call!3604))) (_1!828 (ite (or c!5834 c!5837) (tuple2!1635 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19259)) (tuple2!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19259)))) (_2!828 (ite (or c!5834 c!5837) (tuple2!1635 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19259)) (tuple2!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19259))))))))

(assert (=> d!8539 (= (+!70 (ite c!5834 call!3605 (ite c!5837 call!3606 call!3604)) (ite (or c!5834 c!5837) (tuple2!1635 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19259)) (tuple2!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19259)))) lt!19797)))

(declare-fun b!44857 () Bool)

(declare-fun res!26392 () Bool)

(assert (=> b!44857 (=> (not res!26392) (not e!28432))))

(assert (=> b!44857 (= res!26392 (= (getValueByKey!108 (toList!621 lt!19797) (_1!828 (ite (or c!5834 c!5837) (tuple2!1635 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19259)) (tuple2!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19259))))) (Some!113 (_2!828 (ite (or c!5834 c!5837) (tuple2!1635 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19259)) (tuple2!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19259)))))))))

(declare-fun b!44858 () Bool)

(declare-fun contains!581 (List!1208 tuple2!1634) Bool)

(assert (=> b!44858 (= e!28432 (contains!581 (toList!621 lt!19797) (ite (or c!5834 c!5837) (tuple2!1635 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19259)) (tuple2!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19259)))))))

(assert (= (and d!8539 res!26391) b!44857))

(assert (= (and b!44857 res!26392) b!44858))

(declare-fun m!39069 () Bool)

(assert (=> d!8539 m!39069))

(declare-fun m!39071 () Bool)

(assert (=> d!8539 m!39071))

(declare-fun m!39073 () Bool)

(assert (=> d!8539 m!39073))

(declare-fun m!39075 () Bool)

(assert (=> d!8539 m!39075))

(declare-fun m!39077 () Bool)

(assert (=> b!44857 m!39077))

(declare-fun m!39079 () Bool)

(assert (=> b!44858 m!39079))

(assert (=> bm!3599 d!8539))

(assert (=> b!44443 d!8499))

(declare-fun d!8557 () Bool)

(assert (not d!8557))

(assert (=> b!44583 d!8557))

(assert (=> b!44584 d!8517))

(assert (=> b!44555 d!8499))

(assert (=> d!8353 d!8513))

(declare-fun d!8559 () Bool)

(declare-fun e!28474 () Bool)

(assert (=> d!8559 e!28474))

(declare-fun res!26419 () Bool)

(assert (=> d!8559 (=> (not res!26419) (not e!28474))))

(declare-fun lt!19857 () ListLongMap!1211)

(assert (=> d!8559 (= res!26419 (not (contains!577 lt!19857 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!28473 () ListLongMap!1211)

(assert (=> d!8559 (= lt!19857 e!28473)))

(declare-fun c!5979 () Bool)

(assert (=> d!8559 (= c!5979 (bvsge #b00000000000000000000000000000000 (size!1622 (_keys!3463 lt!19259))))))

(assert (=> d!8559 (validMask!0 (mask!5473 lt!19259))))

(assert (=> d!8559 (= (getCurrentListMapNoExtraKeys!39 (_keys!3463 lt!19259) (_values!1879 lt!19259) (mask!5473 lt!19259) (extraKeys!1787 lt!19259) (zeroValue!1814 lt!19259) (minValue!1814 lt!19259) #b00000000000000000000000000000000 (defaultEntry!1896 lt!19259)) lt!19857)))

(declare-fun b!44927 () Bool)

(declare-fun e!28472 () Bool)

(declare-fun e!28476 () Bool)

(assert (=> b!44927 (= e!28472 e!28476)))

(declare-fun c!5976 () Bool)

(assert (=> b!44927 (= c!5976 (bvslt #b00000000000000000000000000000000 (size!1622 (_keys!3463 lt!19259))))))

(declare-fun b!44928 () Bool)

(assert (=> b!44928 (= e!28474 e!28472)))

(declare-fun c!5978 () Bool)

(declare-fun e!28477 () Bool)

(assert (=> b!44928 (= c!5978 e!28477)))

(declare-fun res!26418 () Bool)

(assert (=> b!44928 (=> (not res!26418) (not e!28477))))

(assert (=> b!44928 (= res!26418 (bvslt #b00000000000000000000000000000000 (size!1622 (_keys!3463 lt!19259))))))

(declare-fun b!44929 () Bool)

(assert (=> b!44929 (= e!28473 (ListLongMap!1212 Nil!1205))))

(declare-fun bm!3671 () Bool)

(declare-fun call!3674 () ListLongMap!1211)

(assert (=> bm!3671 (= call!3674 (getCurrentListMapNoExtraKeys!39 (_keys!3463 lt!19259) (_values!1879 lt!19259) (mask!5473 lt!19259) (extraKeys!1787 lt!19259) (zeroValue!1814 lt!19259) (minValue!1814 lt!19259) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1896 lt!19259)))))

(declare-fun b!44930 () Bool)

(declare-fun lt!19853 () Unit!1229)

(declare-fun lt!19859 () Unit!1229)

(assert (=> b!44930 (= lt!19853 lt!19859)))

(declare-fun lt!19856 () (_ BitVec 64))

(declare-fun lt!19854 () ListLongMap!1211)

(declare-fun lt!19858 () (_ BitVec 64))

(declare-fun lt!19855 () V!2325)

(assert (=> b!44930 (not (contains!577 (+!70 lt!19854 (tuple2!1635 lt!19856 lt!19855)) lt!19858))))

(declare-fun addStillNotContains!13 (ListLongMap!1211 (_ BitVec 64) V!2325 (_ BitVec 64)) Unit!1229)

(assert (=> b!44930 (= lt!19859 (addStillNotContains!13 lt!19854 lt!19856 lt!19855 lt!19858))))

(assert (=> b!44930 (= lt!19858 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!44930 (= lt!19855 (get!799 (select (arr!1420 (_values!1879 lt!19259)) #b00000000000000000000000000000000) (dynLambda!265 (defaultEntry!1896 lt!19259) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44930 (= lt!19856 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000))))

(assert (=> b!44930 (= lt!19854 call!3674)))

(declare-fun e!28478 () ListLongMap!1211)

(assert (=> b!44930 (= e!28478 (+!70 call!3674 (tuple2!1635 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000) (get!799 (select (arr!1420 (_values!1879 lt!19259)) #b00000000000000000000000000000000) (dynLambda!265 (defaultEntry!1896 lt!19259) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!44931 () Bool)

(assert (=> b!44931 (= e!28477 (validKeyInArray!0 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000)))))

(assert (=> b!44931 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!44932 () Bool)

(declare-fun res!26420 () Bool)

(assert (=> b!44932 (=> (not res!26420) (not e!28474))))

(assert (=> b!44932 (= res!26420 (not (contains!577 lt!19857 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!44933 () Bool)

(assert (=> b!44933 (= e!28473 e!28478)))

(declare-fun c!5977 () Bool)

(assert (=> b!44933 (= c!5977 (validKeyInArray!0 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000)))))

(declare-fun b!44934 () Bool)

(assert (=> b!44934 (= e!28476 (= lt!19857 (getCurrentListMapNoExtraKeys!39 (_keys!3463 lt!19259) (_values!1879 lt!19259) (mask!5473 lt!19259) (extraKeys!1787 lt!19259) (zeroValue!1814 lt!19259) (minValue!1814 lt!19259) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1896 lt!19259))))))

(declare-fun b!44935 () Bool)

(declare-fun e!28475 () Bool)

(assert (=> b!44935 (= e!28472 e!28475)))

(assert (=> b!44935 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1622 (_keys!3463 lt!19259))))))

(declare-fun res!26417 () Bool)

(assert (=> b!44935 (= res!26417 (contains!577 lt!19857 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000)))))

(assert (=> b!44935 (=> (not res!26417) (not e!28475))))

(declare-fun b!44936 () Bool)

(assert (=> b!44936 (= e!28478 call!3674)))

(declare-fun b!44937 () Bool)

(declare-fun isEmpty!289 (ListLongMap!1211) Bool)

(assert (=> b!44937 (= e!28476 (isEmpty!289 lt!19857))))

(declare-fun b!44938 () Bool)

(assert (=> b!44938 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1622 (_keys!3463 lt!19259))))))

(assert (=> b!44938 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1623 (_values!1879 lt!19259))))))

(assert (=> b!44938 (= e!28475 (= (apply!61 lt!19857 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000)) (get!799 (select (arr!1420 (_values!1879 lt!19259)) #b00000000000000000000000000000000) (dynLambda!265 (defaultEntry!1896 lt!19259) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!8559 c!5979) b!44929))

(assert (= (and d!8559 (not c!5979)) b!44933))

(assert (= (and b!44933 c!5977) b!44930))

(assert (= (and b!44933 (not c!5977)) b!44936))

(assert (= (or b!44930 b!44936) bm!3671))

(assert (= (and d!8559 res!26419) b!44932))

(assert (= (and b!44932 res!26420) b!44928))

(assert (= (and b!44928 res!26418) b!44931))

(assert (= (and b!44928 c!5978) b!44935))

(assert (= (and b!44928 (not c!5978)) b!44927))

(assert (= (and b!44935 res!26417) b!44938))

(assert (= (and b!44927 c!5976) b!44934))

(assert (= (and b!44927 (not c!5976)) b!44937))

(declare-fun b_lambda!2331 () Bool)

(assert (=> (not b_lambda!2331) (not b!44930)))

(assert (=> b!44930 t!4234))

(declare-fun b_and!2721 () Bool)

(assert (= b_and!2711 (and (=> t!4234 result!1759) b_and!2721)))

(declare-fun b_lambda!2333 () Bool)

(assert (=> (not b_lambda!2333) (not b!44938)))

(assert (=> b!44938 t!4234))

(declare-fun b_and!2723 () Bool)

(assert (= b_and!2721 (and (=> t!4234 result!1759) b_and!2723)))

(assert (=> b!44930 m!38613))

(declare-fun m!39209 () Bool)

(assert (=> b!44930 m!39209))

(declare-fun m!39211 () Bool)

(assert (=> b!44930 m!39211))

(assert (=> b!44930 m!38615))

(declare-fun m!39213 () Bool)

(assert (=> b!44930 m!39213))

(assert (=> b!44930 m!38613))

(assert (=> b!44930 m!38615))

(assert (=> b!44930 m!38617))

(assert (=> b!44930 m!38561))

(assert (=> b!44930 m!39211))

(declare-fun m!39215 () Bool)

(assert (=> b!44930 m!39215))

(declare-fun m!39217 () Bool)

(assert (=> b!44937 m!39217))

(declare-fun m!39219 () Bool)

(assert (=> d!8559 m!39219))

(assert (=> d!8559 m!38607))

(declare-fun m!39221 () Bool)

(assert (=> b!44932 m!39221))

(assert (=> b!44938 m!38613))

(assert (=> b!44938 m!38561))

(assert (=> b!44938 m!38615))

(assert (=> b!44938 m!38561))

(declare-fun m!39223 () Bool)

(assert (=> b!44938 m!39223))

(assert (=> b!44938 m!38613))

(assert (=> b!44938 m!38615))

(assert (=> b!44938 m!38617))

(assert (=> b!44933 m!38561))

(assert (=> b!44933 m!38561))

(assert (=> b!44933 m!38563))

(assert (=> b!44931 m!38561))

(assert (=> b!44931 m!38561))

(assert (=> b!44931 m!38563))

(assert (=> b!44935 m!38561))

(assert (=> b!44935 m!38561))

(declare-fun m!39225 () Bool)

(assert (=> b!44935 m!39225))

(declare-fun m!39227 () Bool)

(assert (=> bm!3671 m!39227))

(assert (=> b!44934 m!39227))

(assert (=> bm!3598 d!8559))

(declare-fun d!8607 () Bool)

(assert (=> d!8607 (= (apply!61 lt!19506 lt!19517) (get!805 (getValueByKey!108 (toList!621 lt!19506) lt!19517)))))

(declare-fun bs!2044 () Bool)

(assert (= bs!2044 d!8607))

(declare-fun m!39229 () Bool)

(assert (=> bs!2044 m!39229))

(assert (=> bs!2044 m!39229))

(declare-fun m!39231 () Bool)

(assert (=> bs!2044 m!39231))

(assert (=> b!44428 d!8607))

(declare-fun d!8609 () Bool)

(declare-fun e!28485 () Bool)

(assert (=> d!8609 e!28485))

(declare-fun res!26426 () Bool)

(assert (=> d!8609 (=> (not res!26426) (not e!28485))))

(declare-fun lt!19860 () ListLongMap!1211)

(assert (=> d!8609 (= res!26426 (contains!577 lt!19860 (_1!828 (tuple2!1635 lt!19503 (zeroValue!1814 lt!19259)))))))

(declare-fun lt!19863 () List!1208)

(assert (=> d!8609 (= lt!19860 (ListLongMap!1212 lt!19863))))

(declare-fun lt!19861 () Unit!1229)

(declare-fun lt!19862 () Unit!1229)

(assert (=> d!8609 (= lt!19861 lt!19862)))

(assert (=> d!8609 (= (getValueByKey!108 lt!19863 (_1!828 (tuple2!1635 lt!19503 (zeroValue!1814 lt!19259)))) (Some!113 (_2!828 (tuple2!1635 lt!19503 (zeroValue!1814 lt!19259)))))))

(assert (=> d!8609 (= lt!19862 (lemmaContainsTupThenGetReturnValue!32 lt!19863 (_1!828 (tuple2!1635 lt!19503 (zeroValue!1814 lt!19259))) (_2!828 (tuple2!1635 lt!19503 (zeroValue!1814 lt!19259)))))))

(assert (=> d!8609 (= lt!19863 (insertStrictlySorted!29 (toList!621 lt!19509) (_1!828 (tuple2!1635 lt!19503 (zeroValue!1814 lt!19259))) (_2!828 (tuple2!1635 lt!19503 (zeroValue!1814 lt!19259)))))))

(assert (=> d!8609 (= (+!70 lt!19509 (tuple2!1635 lt!19503 (zeroValue!1814 lt!19259))) lt!19860)))

(declare-fun b!44946 () Bool)

(declare-fun res!26427 () Bool)

(assert (=> b!44946 (=> (not res!26427) (not e!28485))))

(assert (=> b!44946 (= res!26427 (= (getValueByKey!108 (toList!621 lt!19860) (_1!828 (tuple2!1635 lt!19503 (zeroValue!1814 lt!19259)))) (Some!113 (_2!828 (tuple2!1635 lt!19503 (zeroValue!1814 lt!19259))))))))

(declare-fun b!44947 () Bool)

(assert (=> b!44947 (= e!28485 (contains!581 (toList!621 lt!19860) (tuple2!1635 lt!19503 (zeroValue!1814 lt!19259))))))

(assert (= (and d!8609 res!26426) b!44946))

(assert (= (and b!44946 res!26427) b!44947))

(declare-fun m!39233 () Bool)

(assert (=> d!8609 m!39233))

(declare-fun m!39235 () Bool)

(assert (=> d!8609 m!39235))

(declare-fun m!39237 () Bool)

(assert (=> d!8609 m!39237))

(declare-fun m!39239 () Bool)

(assert (=> d!8609 m!39239))

(declare-fun m!39241 () Bool)

(assert (=> b!44946 m!39241))

(declare-fun m!39243 () Bool)

(assert (=> b!44947 m!39243))

(assert (=> b!44428 d!8609))

(declare-fun d!8611 () Bool)

(assert (=> d!8611 (= (apply!61 (+!70 lt!19516 (tuple2!1635 lt!19507 (zeroValue!1814 lt!19259))) lt!19499) (get!805 (getValueByKey!108 (toList!621 (+!70 lt!19516 (tuple2!1635 lt!19507 (zeroValue!1814 lt!19259)))) lt!19499)))))

(declare-fun bs!2045 () Bool)

(assert (= bs!2045 d!8611))

(declare-fun m!39245 () Bool)

(assert (=> bs!2045 m!39245))

(assert (=> bs!2045 m!39245))

(declare-fun m!39247 () Bool)

(assert (=> bs!2045 m!39247))

(assert (=> b!44428 d!8611))

(declare-fun d!8613 () Bool)

(assert (=> d!8613 (= (apply!61 lt!19516 lt!19499) (get!805 (getValueByKey!108 (toList!621 lt!19516) lt!19499)))))

(declare-fun bs!2046 () Bool)

(assert (= bs!2046 d!8613))

(declare-fun m!39249 () Bool)

(assert (=> bs!2046 m!39249))

(assert (=> bs!2046 m!39249))

(declare-fun m!39251 () Bool)

(assert (=> bs!2046 m!39251))

(assert (=> b!44428 d!8613))

(declare-fun d!8615 () Bool)

(declare-fun e!28486 () Bool)

(assert (=> d!8615 e!28486))

(declare-fun res!26428 () Bool)

(assert (=> d!8615 (=> (not res!26428) (not e!28486))))

(declare-fun lt!19864 () ListLongMap!1211)

(assert (=> d!8615 (= res!26428 (contains!577 lt!19864 (_1!828 (tuple2!1635 lt!19507 (zeroValue!1814 lt!19259)))))))

(declare-fun lt!19867 () List!1208)

(assert (=> d!8615 (= lt!19864 (ListLongMap!1212 lt!19867))))

(declare-fun lt!19865 () Unit!1229)

(declare-fun lt!19866 () Unit!1229)

(assert (=> d!8615 (= lt!19865 lt!19866)))

(assert (=> d!8615 (= (getValueByKey!108 lt!19867 (_1!828 (tuple2!1635 lt!19507 (zeroValue!1814 lt!19259)))) (Some!113 (_2!828 (tuple2!1635 lt!19507 (zeroValue!1814 lt!19259)))))))

(assert (=> d!8615 (= lt!19866 (lemmaContainsTupThenGetReturnValue!32 lt!19867 (_1!828 (tuple2!1635 lt!19507 (zeroValue!1814 lt!19259))) (_2!828 (tuple2!1635 lt!19507 (zeroValue!1814 lt!19259)))))))

(assert (=> d!8615 (= lt!19867 (insertStrictlySorted!29 (toList!621 lt!19516) (_1!828 (tuple2!1635 lt!19507 (zeroValue!1814 lt!19259))) (_2!828 (tuple2!1635 lt!19507 (zeroValue!1814 lt!19259)))))))

(assert (=> d!8615 (= (+!70 lt!19516 (tuple2!1635 lt!19507 (zeroValue!1814 lt!19259))) lt!19864)))

(declare-fun b!44948 () Bool)

(declare-fun res!26429 () Bool)

(assert (=> b!44948 (=> (not res!26429) (not e!28486))))

(assert (=> b!44948 (= res!26429 (= (getValueByKey!108 (toList!621 lt!19864) (_1!828 (tuple2!1635 lt!19507 (zeroValue!1814 lt!19259)))) (Some!113 (_2!828 (tuple2!1635 lt!19507 (zeroValue!1814 lt!19259))))))))

(declare-fun b!44949 () Bool)

(assert (=> b!44949 (= e!28486 (contains!581 (toList!621 lt!19864) (tuple2!1635 lt!19507 (zeroValue!1814 lt!19259))))))

(assert (= (and d!8615 res!26428) b!44948))

(assert (= (and b!44948 res!26429) b!44949))

(declare-fun m!39253 () Bool)

(assert (=> d!8615 m!39253))

(declare-fun m!39255 () Bool)

(assert (=> d!8615 m!39255))

(declare-fun m!39257 () Bool)

(assert (=> d!8615 m!39257))

(declare-fun m!39259 () Bool)

(assert (=> d!8615 m!39259))

(declare-fun m!39261 () Bool)

(assert (=> b!44948 m!39261))

(declare-fun m!39263 () Bool)

(assert (=> b!44949 m!39263))

(assert (=> b!44428 d!8615))

(declare-fun d!8617 () Bool)

(assert (=> d!8617 (= (apply!61 (+!70 lt!19506 (tuple2!1635 lt!19518 (minValue!1814 lt!19259))) lt!19517) (apply!61 lt!19506 lt!19517))))

(declare-fun lt!19870 () Unit!1229)

(declare-fun choose!266 (ListLongMap!1211 (_ BitVec 64) V!2325 (_ BitVec 64)) Unit!1229)

(assert (=> d!8617 (= lt!19870 (choose!266 lt!19506 lt!19518 (minValue!1814 lt!19259) lt!19517))))

(declare-fun e!28489 () Bool)

(assert (=> d!8617 e!28489))

(declare-fun res!26432 () Bool)

(assert (=> d!8617 (=> (not res!26432) (not e!28489))))

(assert (=> d!8617 (= res!26432 (contains!577 lt!19506 lt!19517))))

(assert (=> d!8617 (= (addApplyDifferent!37 lt!19506 lt!19518 (minValue!1814 lt!19259) lt!19517) lt!19870)))

(declare-fun b!44953 () Bool)

(assert (=> b!44953 (= e!28489 (not (= lt!19517 lt!19518)))))

(assert (= (and d!8617 res!26432) b!44953))

(assert (=> d!8617 m!38583))

(declare-fun m!39265 () Bool)

(assert (=> d!8617 m!39265))

(assert (=> d!8617 m!38593))

(assert (=> d!8617 m!38583))

(assert (=> d!8617 m!38585))

(declare-fun m!39267 () Bool)

(assert (=> d!8617 m!39267))

(assert (=> b!44428 d!8617))

(declare-fun d!8619 () Bool)

(assert (=> d!8619 (= (apply!61 (+!70 lt!19516 (tuple2!1635 lt!19507 (zeroValue!1814 lt!19259))) lt!19499) (apply!61 lt!19516 lt!19499))))

(declare-fun lt!19871 () Unit!1229)

(assert (=> d!8619 (= lt!19871 (choose!266 lt!19516 lt!19507 (zeroValue!1814 lt!19259) lt!19499))))

(declare-fun e!28490 () Bool)

(assert (=> d!8619 e!28490))

(declare-fun res!26433 () Bool)

(assert (=> d!8619 (=> (not res!26433) (not e!28490))))

(assert (=> d!8619 (= res!26433 (contains!577 lt!19516 lt!19499))))

(assert (=> d!8619 (= (addApplyDifferent!37 lt!19516 lt!19507 (zeroValue!1814 lt!19259) lt!19499) lt!19871)))

(declare-fun b!44954 () Bool)

(assert (=> b!44954 (= e!28490 (not (= lt!19499 lt!19507)))))

(assert (= (and d!8619 res!26433) b!44954))

(assert (=> d!8619 m!38573))

(declare-fun m!39269 () Bool)

(assert (=> d!8619 m!39269))

(assert (=> d!8619 m!38587))

(assert (=> d!8619 m!38573))

(assert (=> d!8619 m!38581))

(declare-fun m!39271 () Bool)

(assert (=> d!8619 m!39271))

(assert (=> b!44428 d!8619))

(declare-fun d!8621 () Bool)

(declare-fun e!28506 () Bool)

(assert (=> d!8621 e!28506))

(declare-fun res!26442 () Bool)

(assert (=> d!8621 (=> res!26442 e!28506)))

(declare-fun lt!19886 () Bool)

(assert (=> d!8621 (= res!26442 (not lt!19886))))

(declare-fun lt!19885 () Bool)

(assert (=> d!8621 (= lt!19886 lt!19885)))

(declare-fun lt!19884 () Unit!1229)

(declare-fun e!28505 () Unit!1229)

(assert (=> d!8621 (= lt!19884 e!28505)))

(declare-fun c!5989 () Bool)

(assert (=> d!8621 (= c!5989 lt!19885)))

(declare-fun containsKey!76 (List!1208 (_ BitVec 64)) Bool)

(assert (=> d!8621 (= lt!19885 (containsKey!76 (toList!621 (+!70 lt!19509 (tuple2!1635 lt!19503 (zeroValue!1814 lt!19259)))) lt!19510))))

(assert (=> d!8621 (= (contains!577 (+!70 lt!19509 (tuple2!1635 lt!19503 (zeroValue!1814 lt!19259))) lt!19510) lt!19886)))

(declare-fun b!44979 () Bool)

(declare-fun lt!19887 () Unit!1229)

(assert (=> b!44979 (= e!28505 lt!19887)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!64 (List!1208 (_ BitVec 64)) Unit!1229)

(assert (=> b!44979 (= lt!19887 (lemmaContainsKeyImpliesGetValueByKeyDefined!64 (toList!621 (+!70 lt!19509 (tuple2!1635 lt!19503 (zeroValue!1814 lt!19259)))) lt!19510))))

(declare-fun isDefined!65 (Option!114) Bool)

(assert (=> b!44979 (isDefined!65 (getValueByKey!108 (toList!621 (+!70 lt!19509 (tuple2!1635 lt!19503 (zeroValue!1814 lt!19259)))) lt!19510))))

(declare-fun b!44980 () Bool)

(declare-fun Unit!1248 () Unit!1229)

(assert (=> b!44980 (= e!28505 Unit!1248)))

(declare-fun b!44981 () Bool)

(assert (=> b!44981 (= e!28506 (isDefined!65 (getValueByKey!108 (toList!621 (+!70 lt!19509 (tuple2!1635 lt!19503 (zeroValue!1814 lt!19259)))) lt!19510)))))

(assert (= (and d!8621 c!5989) b!44979))

(assert (= (and d!8621 (not c!5989)) b!44980))

(assert (= (and d!8621 (not res!26442)) b!44981))

(declare-fun m!39273 () Bool)

(assert (=> d!8621 m!39273))

(declare-fun m!39275 () Bool)

(assert (=> b!44979 m!39275))

(declare-fun m!39277 () Bool)

(assert (=> b!44979 m!39277))

(assert (=> b!44979 m!39277))

(declare-fun m!39279 () Bool)

(assert (=> b!44979 m!39279))

(assert (=> b!44981 m!39277))

(assert (=> b!44981 m!39277))

(assert (=> b!44981 m!39279))

(assert (=> b!44428 d!8621))

(assert (=> b!44428 d!8559))

(declare-fun d!8623 () Bool)

(declare-fun e!28507 () Bool)

(assert (=> d!8623 e!28507))

(declare-fun res!26443 () Bool)

(assert (=> d!8623 (=> (not res!26443) (not e!28507))))

(declare-fun lt!19888 () ListLongMap!1211)

(assert (=> d!8623 (= res!26443 (contains!577 lt!19888 (_1!828 (tuple2!1635 lt!19518 (minValue!1814 lt!19259)))))))

(declare-fun lt!19891 () List!1208)

(assert (=> d!8623 (= lt!19888 (ListLongMap!1212 lt!19891))))

(declare-fun lt!19889 () Unit!1229)

(declare-fun lt!19890 () Unit!1229)

(assert (=> d!8623 (= lt!19889 lt!19890)))

(assert (=> d!8623 (= (getValueByKey!108 lt!19891 (_1!828 (tuple2!1635 lt!19518 (minValue!1814 lt!19259)))) (Some!113 (_2!828 (tuple2!1635 lt!19518 (minValue!1814 lt!19259)))))))

(assert (=> d!8623 (= lt!19890 (lemmaContainsTupThenGetReturnValue!32 lt!19891 (_1!828 (tuple2!1635 lt!19518 (minValue!1814 lt!19259))) (_2!828 (tuple2!1635 lt!19518 (minValue!1814 lt!19259)))))))

(assert (=> d!8623 (= lt!19891 (insertStrictlySorted!29 (toList!621 lt!19506) (_1!828 (tuple2!1635 lt!19518 (minValue!1814 lt!19259))) (_2!828 (tuple2!1635 lt!19518 (minValue!1814 lt!19259)))))))

(assert (=> d!8623 (= (+!70 lt!19506 (tuple2!1635 lt!19518 (minValue!1814 lt!19259))) lt!19888)))

(declare-fun b!44982 () Bool)

(declare-fun res!26444 () Bool)

(assert (=> b!44982 (=> (not res!26444) (not e!28507))))

(assert (=> b!44982 (= res!26444 (= (getValueByKey!108 (toList!621 lt!19888) (_1!828 (tuple2!1635 lt!19518 (minValue!1814 lt!19259)))) (Some!113 (_2!828 (tuple2!1635 lt!19518 (minValue!1814 lt!19259))))))))

(declare-fun b!44983 () Bool)

(assert (=> b!44983 (= e!28507 (contains!581 (toList!621 lt!19888) (tuple2!1635 lt!19518 (minValue!1814 lt!19259))))))

(assert (= (and d!8623 res!26443) b!44982))

(assert (= (and b!44982 res!26444) b!44983))

(declare-fun m!39281 () Bool)

(assert (=> d!8623 m!39281))

(declare-fun m!39283 () Bool)

(assert (=> d!8623 m!39283))

(declare-fun m!39285 () Bool)

(assert (=> d!8623 m!39285))

(declare-fun m!39287 () Bool)

(assert (=> d!8623 m!39287))

(declare-fun m!39289 () Bool)

(assert (=> b!44982 m!39289))

(declare-fun m!39291 () Bool)

(assert (=> b!44983 m!39291))

(assert (=> b!44428 d!8623))

(declare-fun d!8625 () Bool)

(assert (=> d!8625 (= (apply!61 (+!70 lt!19520 (tuple2!1635 lt!19501 (minValue!1814 lt!19259))) lt!19508) (apply!61 lt!19520 lt!19508))))

(declare-fun lt!19894 () Unit!1229)

(assert (=> d!8625 (= lt!19894 (choose!266 lt!19520 lt!19501 (minValue!1814 lt!19259) lt!19508))))

(declare-fun e!28513 () Bool)

(assert (=> d!8625 e!28513))

(declare-fun res!26448 () Bool)

(assert (=> d!8625 (=> (not res!26448) (not e!28513))))

(assert (=> d!8625 (= res!26448 (contains!577 lt!19520 lt!19508))))

(assert (=> d!8625 (= (addApplyDifferent!37 lt!19520 lt!19501 (minValue!1814 lt!19259) lt!19508) lt!19894)))

(declare-fun b!44993 () Bool)

(assert (=> b!44993 (= e!28513 (not (= lt!19508 lt!19501)))))

(assert (= (and d!8625 res!26448) b!44993))

(assert (=> d!8625 m!38597))

(declare-fun m!39301 () Bool)

(assert (=> d!8625 m!39301))

(assert (=> d!8625 m!38595))

(assert (=> d!8625 m!38597))

(assert (=> d!8625 m!38599))

(declare-fun m!39303 () Bool)

(assert (=> d!8625 m!39303))

(assert (=> b!44428 d!8625))

(declare-fun d!8629 () Bool)

(assert (=> d!8629 (contains!577 (+!70 lt!19509 (tuple2!1635 lt!19503 (zeroValue!1814 lt!19259))) lt!19510)))

(declare-fun lt!19899 () Unit!1229)

(declare-fun choose!268 (ListLongMap!1211 (_ BitVec 64) V!2325 (_ BitVec 64)) Unit!1229)

(assert (=> d!8629 (= lt!19899 (choose!268 lt!19509 lt!19503 (zeroValue!1814 lt!19259) lt!19510))))

(assert (=> d!8629 (contains!577 lt!19509 lt!19510)))

(assert (=> d!8629 (= (addStillContains!37 lt!19509 lt!19503 (zeroValue!1814 lt!19259) lt!19510) lt!19899)))

(declare-fun bs!2047 () Bool)

(assert (= bs!2047 d!8629))

(assert (=> bs!2047 m!38577))

(assert (=> bs!2047 m!38577))

(assert (=> bs!2047 m!38579))

(declare-fun m!39305 () Bool)

(assert (=> bs!2047 m!39305))

(declare-fun m!39307 () Bool)

(assert (=> bs!2047 m!39307))

(assert (=> b!44428 d!8629))

(declare-fun d!8631 () Bool)

(assert (=> d!8631 (= (apply!61 (+!70 lt!19506 (tuple2!1635 lt!19518 (minValue!1814 lt!19259))) lt!19517) (get!805 (getValueByKey!108 (toList!621 (+!70 lt!19506 (tuple2!1635 lt!19518 (minValue!1814 lt!19259)))) lt!19517)))))

(declare-fun bs!2048 () Bool)

(assert (= bs!2048 d!8631))

(declare-fun m!39309 () Bool)

(assert (=> bs!2048 m!39309))

(assert (=> bs!2048 m!39309))

(declare-fun m!39311 () Bool)

(assert (=> bs!2048 m!39311))

(assert (=> b!44428 d!8631))

(declare-fun d!8633 () Bool)

(declare-fun e!28514 () Bool)

(assert (=> d!8633 e!28514))

(declare-fun res!26450 () Bool)

(assert (=> d!8633 (=> (not res!26450) (not e!28514))))

(declare-fun lt!19904 () ListLongMap!1211)

(assert (=> d!8633 (= res!26450 (contains!577 lt!19904 (_1!828 (tuple2!1635 lt!19501 (minValue!1814 lt!19259)))))))

(declare-fun lt!19907 () List!1208)

(assert (=> d!8633 (= lt!19904 (ListLongMap!1212 lt!19907))))

(declare-fun lt!19905 () Unit!1229)

(declare-fun lt!19906 () Unit!1229)

(assert (=> d!8633 (= lt!19905 lt!19906)))

(assert (=> d!8633 (= (getValueByKey!108 lt!19907 (_1!828 (tuple2!1635 lt!19501 (minValue!1814 lt!19259)))) (Some!113 (_2!828 (tuple2!1635 lt!19501 (minValue!1814 lt!19259)))))))

(assert (=> d!8633 (= lt!19906 (lemmaContainsTupThenGetReturnValue!32 lt!19907 (_1!828 (tuple2!1635 lt!19501 (minValue!1814 lt!19259))) (_2!828 (tuple2!1635 lt!19501 (minValue!1814 lt!19259)))))))

(assert (=> d!8633 (= lt!19907 (insertStrictlySorted!29 (toList!621 lt!19520) (_1!828 (tuple2!1635 lt!19501 (minValue!1814 lt!19259))) (_2!828 (tuple2!1635 lt!19501 (minValue!1814 lt!19259)))))))

(assert (=> d!8633 (= (+!70 lt!19520 (tuple2!1635 lt!19501 (minValue!1814 lt!19259))) lt!19904)))

(declare-fun b!44995 () Bool)

(declare-fun res!26451 () Bool)

(assert (=> b!44995 (=> (not res!26451) (not e!28514))))

(assert (=> b!44995 (= res!26451 (= (getValueByKey!108 (toList!621 lt!19904) (_1!828 (tuple2!1635 lt!19501 (minValue!1814 lt!19259)))) (Some!113 (_2!828 (tuple2!1635 lt!19501 (minValue!1814 lt!19259))))))))

(declare-fun b!44996 () Bool)

(assert (=> b!44996 (= e!28514 (contains!581 (toList!621 lt!19904) (tuple2!1635 lt!19501 (minValue!1814 lt!19259))))))

(assert (= (and d!8633 res!26450) b!44995))

(assert (= (and b!44995 res!26451) b!44996))

(declare-fun m!39313 () Bool)

(assert (=> d!8633 m!39313))

(declare-fun m!39315 () Bool)

(assert (=> d!8633 m!39315))

(declare-fun m!39317 () Bool)

(assert (=> d!8633 m!39317))

(declare-fun m!39319 () Bool)

(assert (=> d!8633 m!39319))

(declare-fun m!39321 () Bool)

(assert (=> b!44995 m!39321))

(declare-fun m!39323 () Bool)

(assert (=> b!44996 m!39323))

(assert (=> b!44428 d!8633))

(declare-fun d!8637 () Bool)

(assert (=> d!8637 (= (apply!61 lt!19520 lt!19508) (get!805 (getValueByKey!108 (toList!621 lt!19520) lt!19508)))))

(declare-fun bs!2049 () Bool)

(assert (= bs!2049 d!8637))

(declare-fun m!39325 () Bool)

(assert (=> bs!2049 m!39325))

(assert (=> bs!2049 m!39325))

(declare-fun m!39327 () Bool)

(assert (=> bs!2049 m!39327))

(assert (=> b!44428 d!8637))

(declare-fun d!8639 () Bool)

(assert (=> d!8639 (= (apply!61 (+!70 lt!19520 (tuple2!1635 lt!19501 (minValue!1814 lt!19259))) lt!19508) (get!805 (getValueByKey!108 (toList!621 (+!70 lt!19520 (tuple2!1635 lt!19501 (minValue!1814 lt!19259)))) lt!19508)))))

(declare-fun bs!2050 () Bool)

(assert (= bs!2050 d!8639))

(declare-fun m!39329 () Bool)

(assert (=> bs!2050 m!39329))

(assert (=> bs!2050 m!39329))

(declare-fun m!39331 () Bool)

(assert (=> bs!2050 m!39331))

(assert (=> b!44428 d!8639))

(declare-fun d!8641 () Bool)

(declare-fun e!28516 () Bool)

(assert (=> d!8641 e!28516))

(declare-fun res!26452 () Bool)

(assert (=> d!8641 (=> res!26452 e!28516)))

(declare-fun lt!19910 () Bool)

(assert (=> d!8641 (= res!26452 (not lt!19910))))

(declare-fun lt!19909 () Bool)

(assert (=> d!8641 (= lt!19910 lt!19909)))

(declare-fun lt!19908 () Unit!1229)

(declare-fun e!28515 () Unit!1229)

(assert (=> d!8641 (= lt!19908 e!28515)))

(declare-fun c!5993 () Bool)

(assert (=> d!8641 (= c!5993 lt!19909)))

(assert (=> d!8641 (= lt!19909 (containsKey!76 (toList!621 lt!19512) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8641 (= (contains!577 lt!19512 #b0000000000000000000000000000000000000000000000000000000000000000) lt!19910)))

(declare-fun b!44997 () Bool)

(declare-fun lt!19911 () Unit!1229)

(assert (=> b!44997 (= e!28515 lt!19911)))

(assert (=> b!44997 (= lt!19911 (lemmaContainsKeyImpliesGetValueByKeyDefined!64 (toList!621 lt!19512) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!44997 (isDefined!65 (getValueByKey!108 (toList!621 lt!19512) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!44998 () Bool)

(declare-fun Unit!1250 () Unit!1229)

(assert (=> b!44998 (= e!28515 Unit!1250)))

(declare-fun b!44999 () Bool)

(assert (=> b!44999 (= e!28516 (isDefined!65 (getValueByKey!108 (toList!621 lt!19512) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!8641 c!5993) b!44997))

(assert (= (and d!8641 (not c!5993)) b!44998))

(assert (= (and d!8641 (not res!26452)) b!44999))

(declare-fun m!39333 () Bool)

(assert (=> d!8641 m!39333))

(declare-fun m!39335 () Bool)

(assert (=> b!44997 m!39335))

(declare-fun m!39337 () Bool)

(assert (=> b!44997 m!39337))

(assert (=> b!44997 m!39337))

(declare-fun m!39339 () Bool)

(assert (=> b!44997 m!39339))

(assert (=> b!44999 m!39337))

(assert (=> b!44999 m!39337))

(assert (=> b!44999 m!39339))

(assert (=> bm!3604 d!8641))

(declare-fun d!8643 () Bool)

(declare-fun lt!19912 () Bool)

(assert (=> d!8643 (= lt!19912 (set.member (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (content!43 (ite c!5764 (Cons!1205 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) Nil!1206) Nil!1206))))))

(declare-fun e!28518 () Bool)

(assert (=> d!8643 (= lt!19912 e!28518)))

(declare-fun res!26453 () Bool)

(assert (=> d!8643 (=> (not res!26453) (not e!28518))))

(assert (=> d!8643 (= res!26453 (is-Cons!1205 (ite c!5764 (Cons!1205 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) Nil!1206) Nil!1206)))))

(assert (=> d!8643 (= (contains!574 (ite c!5764 (Cons!1205 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) Nil!1206) Nil!1206) (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!19912)))

(declare-fun b!45000 () Bool)

(declare-fun e!28517 () Bool)

(assert (=> b!45000 (= e!28518 e!28517)))

(declare-fun res!26454 () Bool)

(assert (=> b!45000 (=> res!26454 e!28517)))

(assert (=> b!45000 (= res!26454 (= (h!1782 (ite c!5764 (Cons!1205 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) Nil!1206) Nil!1206)) (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!45001 () Bool)

(assert (=> b!45001 (= e!28517 (contains!574 (t!4224 (ite c!5764 (Cons!1205 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) Nil!1206) Nil!1206)) (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!8643 res!26453) b!45000))

(assert (= (and b!45000 (not res!26454)) b!45001))

(declare-fun m!39341 () Bool)

(assert (=> d!8643 m!39341))

(assert (=> d!8643 m!38623))

(declare-fun m!39343 () Bool)

(assert (=> d!8643 m!39343))

(assert (=> b!45001 m!38623))

(declare-fun m!39345 () Bool)

(assert (=> b!45001 m!39345))

(assert (=> b!44588 d!8643))

(assert (=> b!44447 d!8517))

(assert (=> d!8419 d!8421))

(declare-fun d!8645 () Bool)

(assert (=> d!8645 (arrayContainsKey!0 lt!19268 lt!19402 #b00000000000000000000000000000000)))

(assert (=> d!8645 true))

(declare-fun _$60!353 () Unit!1229)

(assert (=> d!8645 (= (choose!13 lt!19268 lt!19402 #b00000000000000000000000000000000) _$60!353)))

(declare-fun bs!2051 () Bool)

(assert (= bs!2051 d!8645))

(assert (=> bs!2051 m!38435))

(assert (=> d!8419 d!8645))

(assert (=> b!44445 d!8499))

(declare-fun b!45002 () Bool)

(declare-fun e!28521 () Bool)

(declare-fun e!28519 () Bool)

(assert (=> b!45002 (= e!28521 e!28519)))

(declare-fun res!26455 () Bool)

(assert (=> b!45002 (=> (not res!26455) (not e!28519))))

(declare-fun e!28522 () Bool)

(assert (=> b!45002 (= res!26455 (not e!28522))))

(declare-fun res!26456 () Bool)

(assert (=> b!45002 (=> (not res!26456) (not e!28522))))

(assert (=> b!45002 (= res!26456 (validKeyInArray!0 (select (arr!1419 (_keys!3463 lt!19259)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!45003 () Bool)

(declare-fun e!28520 () Bool)

(declare-fun call!3676 () Bool)

(assert (=> b!45003 (= e!28520 call!3676)))

(declare-fun b!45004 () Bool)

(assert (=> b!45004 (= e!28519 e!28520)))

(declare-fun c!5994 () Bool)

(assert (=> b!45004 (= c!5994 (validKeyInArray!0 (select (arr!1419 (_keys!3463 lt!19259)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!45005 () Bool)

(assert (=> b!45005 (= e!28520 call!3676)))

(declare-fun b!45006 () Bool)

(assert (=> b!45006 (= e!28522 (contains!574 (ite c!5871 (Cons!1205 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000) Nil!1206) Nil!1206) (select (arr!1419 (_keys!3463 lt!19259)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3673 () Bool)

(assert (=> bm!3673 (= call!3676 (arrayNoDuplicates!0 (_keys!3463 lt!19259) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5994 (Cons!1205 (select (arr!1419 (_keys!3463 lt!19259)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5871 (Cons!1205 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000) Nil!1206) Nil!1206)) (ite c!5871 (Cons!1205 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000) Nil!1206) Nil!1206))))))

(declare-fun d!8647 () Bool)

(declare-fun res!26457 () Bool)

(assert (=> d!8647 (=> res!26457 e!28521)))

(assert (=> d!8647 (= res!26457 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1622 (_keys!3463 lt!19259))))))

(assert (=> d!8647 (= (arrayNoDuplicates!0 (_keys!3463 lt!19259) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5871 (Cons!1205 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000) Nil!1206) Nil!1206)) e!28521)))

(assert (= (and d!8647 (not res!26457)) b!45002))

(assert (= (and b!45002 res!26456) b!45006))

(assert (= (and b!45002 res!26455) b!45004))

(assert (= (and b!45004 c!5994) b!45005))

(assert (= (and b!45004 (not c!5994)) b!45003))

(assert (= (or b!45005 b!45003) bm!3673))

(assert (=> b!45002 m!38949))

(assert (=> b!45002 m!38949))

(assert (=> b!45002 m!38951))

(assert (=> b!45004 m!38949))

(assert (=> b!45004 m!38949))

(assert (=> b!45004 m!38951))

(assert (=> b!45006 m!38949))

(assert (=> b!45006 m!38949))

(declare-fun m!39347 () Bool)

(assert (=> b!45006 m!39347))

(assert (=> bm!3673 m!38949))

(declare-fun m!39349 () Bool)

(assert (=> bm!3673 m!39349))

(assert (=> bm!3628 d!8647))

(declare-fun b!45025 () Bool)

(declare-fun e!28533 () SeekEntryResult!202)

(assert (=> b!45025 (= e!28533 (Intermediate!202 true (toIndex!0 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun b!45026 () Bool)

(declare-fun e!28535 () SeekEntryResult!202)

(assert (=> b!45026 (= e!28533 e!28535)))

(declare-fun c!6002 () Bool)

(declare-fun lt!19918 () (_ BitVec 64))

(assert (=> b!45026 (= c!6002 (or (= lt!19918 (select (arr!1419 lt!19268) #b00000000000000000000000000000000)) (= (bvadd lt!19918 lt!19918) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!45027 () Bool)

(declare-fun e!28537 () Bool)

(declare-fun lt!19917 () SeekEntryResult!202)

(assert (=> b!45027 (= e!28537 (bvsge (x!8356 lt!19917) #b01111111111111111111111111111110))))

(declare-fun b!45028 () Bool)

(assert (=> b!45028 (= e!28535 (Intermediate!202 false (toIndex!0 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun b!45029 () Bool)

(assert (=> b!45029 (and (bvsge (index!2932 lt!19917) #b00000000000000000000000000000000) (bvslt (index!2932 lt!19917) (size!1622 lt!19268)))))

(declare-fun res!26466 () Bool)

(assert (=> b!45029 (= res!26466 (= (select (arr!1419 lt!19268) (index!2932 lt!19917)) (select (arr!1419 lt!19268) #b00000000000000000000000000000000)))))

(declare-fun e!28534 () Bool)

(assert (=> b!45029 (=> res!26466 e!28534)))

(declare-fun e!28536 () Bool)

(assert (=> b!45029 (= e!28536 e!28534)))

(declare-fun b!45030 () Bool)

(assert (=> b!45030 (and (bvsge (index!2932 lt!19917) #b00000000000000000000000000000000) (bvslt (index!2932 lt!19917) (size!1622 lt!19268)))))

(assert (=> b!45030 (= e!28534 (= (select (arr!1419 lt!19268) (index!2932 lt!19917)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!45031 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!45031 (= e!28535 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000 mask!853) (select (arr!1419 lt!19268) #b00000000000000000000000000000000) lt!19268 mask!853))))

(declare-fun b!45032 () Bool)

(assert (=> b!45032 (= e!28537 e!28536)))

(declare-fun res!26465 () Bool)

(assert (=> b!45032 (= res!26465 (and (is-Intermediate!202 lt!19917) (not (undefined!1014 lt!19917)) (bvslt (x!8356 lt!19917) #b01111111111111111111111111111110) (bvsge (x!8356 lt!19917) #b00000000000000000000000000000000) (bvsge (x!8356 lt!19917) #b00000000000000000000000000000000)))))

(assert (=> b!45032 (=> (not res!26465) (not e!28536))))

(declare-fun d!8649 () Bool)

(assert (=> d!8649 e!28537))

(declare-fun c!6003 () Bool)

(assert (=> d!8649 (= c!6003 (and (is-Intermediate!202 lt!19917) (undefined!1014 lt!19917)))))

(assert (=> d!8649 (= lt!19917 e!28533)))

(declare-fun c!6001 () Bool)

(assert (=> d!8649 (= c!6001 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!8649 (= lt!19918 (select (arr!1419 lt!19268) (toIndex!0 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) mask!853)))))

(assert (=> d!8649 (validMask!0 mask!853)))

(assert (=> d!8649 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) mask!853) (select (arr!1419 lt!19268) #b00000000000000000000000000000000) lt!19268 mask!853) lt!19917)))

(declare-fun b!45033 () Bool)

(assert (=> b!45033 (and (bvsge (index!2932 lt!19917) #b00000000000000000000000000000000) (bvslt (index!2932 lt!19917) (size!1622 lt!19268)))))

(declare-fun res!26464 () Bool)

(assert (=> b!45033 (= res!26464 (= (select (arr!1419 lt!19268) (index!2932 lt!19917)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!45033 (=> res!26464 e!28534)))

(assert (= (and d!8649 c!6001) b!45025))

(assert (= (and d!8649 (not c!6001)) b!45026))

(assert (= (and b!45026 c!6002) b!45028))

(assert (= (and b!45026 (not c!6002)) b!45031))

(assert (= (and d!8649 c!6003) b!45027))

(assert (= (and d!8649 (not c!6003)) b!45032))

(assert (= (and b!45032 res!26465) b!45029))

(assert (= (and b!45029 (not res!26466)) b!45033))

(assert (= (and b!45033 (not res!26464)) b!45030))

(declare-fun m!39351 () Bool)

(assert (=> b!45033 m!39351))

(assert (=> b!45031 m!38653))

(declare-fun m!39353 () Bool)

(assert (=> b!45031 m!39353))

(assert (=> b!45031 m!39353))

(assert (=> b!45031 m!38397))

(declare-fun m!39355 () Bool)

(assert (=> b!45031 m!39355))

(assert (=> b!45029 m!39351))

(assert (=> b!45030 m!39351))

(assert (=> d!8649 m!38653))

(declare-fun m!39357 () Bool)

(assert (=> d!8649 m!39357))

(assert (=> d!8649 m!38267))

(assert (=> d!8423 d!8649))

(declare-fun d!8651 () Bool)

(declare-fun lt!19924 () (_ BitVec 32))

(declare-fun lt!19923 () (_ BitVec 32))

(assert (=> d!8651 (= lt!19924 (bvmul (bvxor lt!19923 (bvlshr lt!19923 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!8651 (= lt!19923 ((_ extract 31 0) (bvand (bvxor (select (arr!1419 lt!19268) #b00000000000000000000000000000000) (bvlshr (select (arr!1419 lt!19268) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!8651 (and (bvsge mask!853 #b00000000000000000000000000000000) (let ((res!26467 (let ((h!1788 ((_ extract 31 0) (bvand (bvxor (select (arr!1419 lt!19268) #b00000000000000000000000000000000) (bvlshr (select (arr!1419 lt!19268) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!8381 (bvmul (bvxor h!1788 (bvlshr h!1788 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!8381 (bvlshr x!8381 #b00000000000000000000000000001101)) mask!853))))) (and (bvslt res!26467 (bvadd mask!853 #b00000000000000000000000000000001)) (bvsge res!26467 #b00000000000000000000000000000000))))))

(assert (=> d!8651 (= (toIndex!0 (select (arr!1419 lt!19268) #b00000000000000000000000000000000) mask!853) (bvand (bvxor lt!19924 (bvlshr lt!19924 #b00000000000000000000000000001101)) mask!853))))

(assert (=> d!8423 d!8651))

(assert (=> d!8423 d!8315))

(declare-fun d!8657 () Bool)

(declare-fun res!26470 () Bool)

(declare-fun e!28540 () Bool)

(assert (=> d!8657 (=> res!26470 e!28540)))

(assert (=> d!8657 (= res!26470 (= (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (_1!828 lt!19270)))))

(assert (=> d!8657 (= (arrayContainsKey!0 lt!19268 (_1!828 lt!19270) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) e!28540)))

(declare-fun b!45036 () Bool)

(declare-fun e!28541 () Bool)

(assert (=> b!45036 (= e!28540 e!28541)))

(declare-fun res!26471 () Bool)

(assert (=> b!45036 (=> (not res!26471) (not e!28541))))

(assert (=> b!45036 (= res!26471 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1622 lt!19268)))))

(declare-fun b!45037 () Bool)

(assert (=> b!45037 (= e!28541 (arrayContainsKey!0 lt!19268 (_1!828 lt!19270) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!8657 (not res!26470)) b!45036))

(assert (= (and b!45036 res!26471) b!45037))

(assert (=> d!8657 m!38923))

(declare-fun m!39361 () Bool)

(assert (=> b!45037 m!39361))

(assert (=> b!44481 d!8657))

(declare-fun d!8659 () Bool)

(assert (=> d!8659 (= (content!43 Nil!1206) (as set.empty (Set (_ BitVec 64))))))

(assert (=> d!8437 d!8659))

(declare-fun d!8661 () Bool)

(declare-fun e!28543 () Bool)

(assert (=> d!8661 e!28543))

(declare-fun res!26472 () Bool)

(assert (=> d!8661 (=> res!26472 e!28543)))

(declare-fun lt!19927 () Bool)

(assert (=> d!8661 (= res!26472 (not lt!19927))))

(declare-fun lt!19926 () Bool)

(assert (=> d!8661 (= lt!19927 lt!19926)))

(declare-fun lt!19925 () Unit!1229)

(declare-fun e!28542 () Unit!1229)

(assert (=> d!8661 (= lt!19925 e!28542)))

(declare-fun c!6004 () Bool)

(assert (=> d!8661 (= c!6004 lt!19926)))

(assert (=> d!8661 (= lt!19926 (containsKey!76 (toList!621 lt!19512) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8661 (= (contains!577 lt!19512 #b1000000000000000000000000000000000000000000000000000000000000000) lt!19927)))

(declare-fun b!45038 () Bool)

(declare-fun lt!19928 () Unit!1229)

(assert (=> b!45038 (= e!28542 lt!19928)))

(assert (=> b!45038 (= lt!19928 (lemmaContainsKeyImpliesGetValueByKeyDefined!64 (toList!621 lt!19512) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!45038 (isDefined!65 (getValueByKey!108 (toList!621 lt!19512) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!45039 () Bool)

(declare-fun Unit!1251 () Unit!1229)

(assert (=> b!45039 (= e!28542 Unit!1251)))

(declare-fun b!45040 () Bool)

(assert (=> b!45040 (= e!28543 (isDefined!65 (getValueByKey!108 (toList!621 lt!19512) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!8661 c!6004) b!45038))

(assert (= (and d!8661 (not c!6004)) b!45039))

(assert (= (and d!8661 (not res!26472)) b!45040))

(declare-fun m!39363 () Bool)

(assert (=> d!8661 m!39363))

(declare-fun m!39365 () Bool)

(assert (=> b!45038 m!39365))

(assert (=> b!45038 m!39001))

(assert (=> b!45038 m!39001))

(declare-fun m!39367 () Bool)

(assert (=> b!45038 m!39367))

(assert (=> b!45040 m!39001))

(assert (=> b!45040 m!39001))

(assert (=> b!45040 m!39367))

(assert (=> bm!3602 d!8661))

(declare-fun d!8663 () Bool)

(declare-fun lt!19929 () (_ BitVec 32))

(assert (=> d!8663 (and (or (bvslt lt!19929 #b00000000000000000000000000000000) (bvsge lt!19929 (size!1622 lt!19268)) (and (bvsge lt!19929 #b00000000000000000000000000000000) (bvslt lt!19929 (size!1622 lt!19268)))) (bvsge lt!19929 #b00000000000000000000000000000000) (bvslt lt!19929 (size!1622 lt!19268)) (= (select (arr!1419 lt!19268) lt!19929) (_1!828 lt!19270)))))

(declare-fun e!28544 () (_ BitVec 32))

(assert (=> d!8663 (= lt!19929 e!28544)))

(declare-fun c!6005 () Bool)

(assert (=> d!8663 (= c!6005 (= (select (arr!1419 lt!19268) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (_1!828 lt!19270)))))

(assert (=> d!8663 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1622 lt!19268)) (bvslt (size!1622 lt!19268) #b01111111111111111111111111111111))))

(assert (=> d!8663 (= (arrayScanForKey!0 lt!19268 (_1!828 lt!19270) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!19929)))

(declare-fun b!45041 () Bool)

(assert (=> b!45041 (= e!28544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))

(declare-fun b!45042 () Bool)

(assert (=> b!45042 (= e!28544 (arrayScanForKey!0 lt!19268 (_1!828 lt!19270) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!8663 c!6005) b!45041))

(assert (= (and d!8663 (not c!6005)) b!45042))

(declare-fun m!39369 () Bool)

(assert (=> d!8663 m!39369))

(assert (=> d!8663 m!38923))

(declare-fun m!39371 () Bool)

(assert (=> b!45042 m!39371))

(assert (=> b!44451 d!8663))

(declare-fun d!8665 () Bool)

(declare-fun e!28545 () Bool)

(assert (=> d!8665 e!28545))

(declare-fun res!26473 () Bool)

(assert (=> d!8665 (=> (not res!26473) (not e!28545))))

(declare-fun lt!19930 () ListLongMap!1211)

(assert (=> d!8665 (= res!26473 (contains!577 lt!19930 (_1!828 (tuple2!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19259)))))))

(declare-fun lt!19933 () List!1208)

(assert (=> d!8665 (= lt!19930 (ListLongMap!1212 lt!19933))))

(declare-fun lt!19931 () Unit!1229)

(declare-fun lt!19932 () Unit!1229)

(assert (=> d!8665 (= lt!19931 lt!19932)))

(assert (=> d!8665 (= (getValueByKey!108 lt!19933 (_1!828 (tuple2!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19259)))) (Some!113 (_2!828 (tuple2!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19259)))))))

(assert (=> d!8665 (= lt!19932 (lemmaContainsTupThenGetReturnValue!32 lt!19933 (_1!828 (tuple2!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19259))) (_2!828 (tuple2!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19259)))))))

(assert (=> d!8665 (= lt!19933 (insertStrictlySorted!29 (toList!621 call!3607) (_1!828 (tuple2!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19259))) (_2!828 (tuple2!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19259)))))))

(assert (=> d!8665 (= (+!70 call!3607 (tuple2!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19259))) lt!19930)))

(declare-fun b!45043 () Bool)

(declare-fun res!26474 () Bool)

(assert (=> b!45043 (=> (not res!26474) (not e!28545))))

(assert (=> b!45043 (= res!26474 (= (getValueByKey!108 (toList!621 lt!19930) (_1!828 (tuple2!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19259)))) (Some!113 (_2!828 (tuple2!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19259))))))))

(declare-fun b!45044 () Bool)

(assert (=> b!45044 (= e!28545 (contains!581 (toList!621 lt!19930) (tuple2!1635 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19259))))))

(assert (= (and d!8665 res!26473) b!45043))

(assert (= (and b!45043 res!26474) b!45044))

(declare-fun m!39373 () Bool)

(assert (=> d!8665 m!39373))

(declare-fun m!39375 () Bool)

(assert (=> d!8665 m!39375))

(declare-fun m!39377 () Bool)

(assert (=> d!8665 m!39377))

(declare-fun m!39379 () Bool)

(assert (=> d!8665 m!39379))

(declare-fun m!39381 () Bool)

(assert (=> b!45043 m!39381))

(declare-fun m!39383 () Bool)

(assert (=> b!45044 m!39383))

(assert (=> b!44442 d!8665))

(assert (=> d!8407 d!8301))

(declare-fun d!8667 () Bool)

(assert (=> d!8667 (= (apply!61 lt!19512 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000)) (get!805 (getValueByKey!108 (toList!621 lt!19512) (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000))))))

(declare-fun bs!2052 () Bool)

(assert (= bs!2052 d!8667))

(assert (=> bs!2052 m!38561))

(declare-fun m!39385 () Bool)

(assert (=> bs!2052 m!39385))

(assert (=> bs!2052 m!39385))

(declare-fun m!39387 () Bool)

(assert (=> bs!2052 m!39387))

(assert (=> b!44441 d!8667))

(declare-fun d!8669 () Bool)

(declare-fun c!6008 () Bool)

(assert (=> d!8669 (= c!6008 (is-ValueCellFull!704 (select (arr!1420 (_values!1879 lt!19259)) #b00000000000000000000000000000000)))))

(declare-fun e!28548 () V!2325)

(assert (=> d!8669 (= (get!799 (select (arr!1420 (_values!1879 lt!19259)) #b00000000000000000000000000000000) (dynLambda!265 (defaultEntry!1896 lt!19259) #b0000000000000000000000000000000000000000000000000000000000000000)) e!28548)))

(declare-fun b!45049 () Bool)

(declare-fun get!806 (ValueCell!704 V!2325) V!2325)

(assert (=> b!45049 (= e!28548 (get!806 (select (arr!1420 (_values!1879 lt!19259)) #b00000000000000000000000000000000) (dynLambda!265 (defaultEntry!1896 lt!19259) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!45050 () Bool)

(declare-fun get!807 (ValueCell!704 V!2325) V!2325)

(assert (=> b!45050 (= e!28548 (get!807 (select (arr!1420 (_values!1879 lt!19259)) #b00000000000000000000000000000000) (dynLambda!265 (defaultEntry!1896 lt!19259) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!8669 c!6008) b!45049))

(assert (= (and d!8669 (not c!6008)) b!45050))

(assert (=> b!45049 m!38613))

(assert (=> b!45049 m!38615))

(declare-fun m!39389 () Bool)

(assert (=> b!45049 m!39389))

(assert (=> b!45050 m!38613))

(assert (=> b!45050 m!38615))

(declare-fun m!39391 () Bool)

(assert (=> b!45050 m!39391))

(assert (=> b!44441 d!8669))

(assert (=> d!8451 d!8305))

(assert (=> b!44553 d!8499))

(declare-fun d!8671 () Bool)

(declare-fun e!28550 () Bool)

(assert (=> d!8671 e!28550))

(declare-fun res!26475 () Bool)

(assert (=> d!8671 (=> res!26475 e!28550)))

(declare-fun lt!19936 () Bool)

(assert (=> d!8671 (= res!26475 (not lt!19936))))

(declare-fun lt!19935 () Bool)

(assert (=> d!8671 (= lt!19936 lt!19935)))

(declare-fun lt!19934 () Unit!1229)

(declare-fun e!28549 () Unit!1229)

(assert (=> d!8671 (= lt!19934 e!28549)))

(declare-fun c!6009 () Bool)

(assert (=> d!8671 (= c!6009 lt!19935)))

(assert (=> d!8671 (= lt!19935 (containsKey!76 (toList!621 lt!19512) (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000)))))

(assert (=> d!8671 (= (contains!577 lt!19512 (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000)) lt!19936)))

(declare-fun b!45051 () Bool)

(declare-fun lt!19937 () Unit!1229)

(assert (=> b!45051 (= e!28549 lt!19937)))

(assert (=> b!45051 (= lt!19937 (lemmaContainsKeyImpliesGetValueByKeyDefined!64 (toList!621 lt!19512) (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000)))))

(assert (=> b!45051 (isDefined!65 (getValueByKey!108 (toList!621 lt!19512) (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000)))))

(declare-fun b!45052 () Bool)

(declare-fun Unit!1253 () Unit!1229)

(assert (=> b!45052 (= e!28549 Unit!1253)))

(declare-fun b!45053 () Bool)

(assert (=> b!45053 (= e!28550 (isDefined!65 (getValueByKey!108 (toList!621 lt!19512) (select (arr!1419 (_keys!3463 lt!19259)) #b00000000000000000000000000000000))))))

(assert (= (and d!8671 c!6009) b!45051))

(assert (= (and d!8671 (not c!6009)) b!45052))

(assert (= (and d!8671 (not res!26475)) b!45053))

(assert (=> d!8671 m!38561))

(declare-fun m!39393 () Bool)

(assert (=> d!8671 m!39393))

(assert (=> b!45051 m!38561))

(declare-fun m!39395 () Bool)

(assert (=> b!45051 m!39395))

(assert (=> b!45051 m!38561))

(assert (=> b!45051 m!39385))

(assert (=> b!45051 m!39385))

(declare-fun m!39397 () Bool)

(assert (=> b!45051 m!39397))

(assert (=> b!45053 m!38561))

(assert (=> b!45053 m!39385))

(assert (=> b!45053 m!39385))

(assert (=> b!45053 m!39397))

(assert (=> b!44440 d!8671))

(declare-fun b!45080 () Bool)

(declare-fun c!6021 () Bool)

(declare-fun lt!19954 () (_ BitVec 64))

(assert (=> b!45080 (= c!6021 (= lt!19954 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!28569 () SeekEntryResult!202)

(declare-fun e!28567 () SeekEntryResult!202)

(assert (=> b!45080 (= e!28569 e!28567)))

(declare-fun b!45081 () Bool)

(assert (=> b!45081 (= e!28567 (seekKeyOrZeroReturnVacant!0 (bvadd (x!8356 lt!19602) #b00000000000000000000000000000001) (nextIndex!0 (index!2932 lt!19602) (x!8356 lt!19602) mask!853) (index!2932 lt!19602) (select (arr!1419 lt!19268) #b00000000000000000000000000000000) lt!19268 mask!853))))

(declare-fun b!45082 () Bool)

(declare-fun e!28568 () SeekEntryResult!202)

(assert (=> b!45082 (= e!28568 e!28569)))

(declare-fun c!6022 () Bool)

(assert (=> b!45082 (= c!6022 (= lt!19954 (select (arr!1419 lt!19268) #b00000000000000000000000000000000)))))

(declare-fun b!45083 () Bool)

(assert (=> b!45083 (= e!28569 (Found!202 (index!2932 lt!19602)))))

(declare-fun b!45084 () Bool)

(assert (=> b!45084 (= e!28568 Undefined!202)))

(declare-fun d!8673 () Bool)

(declare-fun lt!19955 () SeekEntryResult!202)

(assert (=> d!8673 (and (or (is-Undefined!202 lt!19955) (not (is-Found!202 lt!19955)) (and (bvsge (index!2931 lt!19955) #b00000000000000000000000000000000) (bvslt (index!2931 lt!19955) (size!1622 lt!19268)))) (or (is-Undefined!202 lt!19955) (is-Found!202 lt!19955) (not (is-MissingVacant!202 lt!19955)) (not (= (index!2933 lt!19955) (index!2932 lt!19602))) (and (bvsge (index!2933 lt!19955) #b00000000000000000000000000000000) (bvslt (index!2933 lt!19955) (size!1622 lt!19268)))) (or (is-Undefined!202 lt!19955) (ite (is-Found!202 lt!19955) (= (select (arr!1419 lt!19268) (index!2931 lt!19955)) (select (arr!1419 lt!19268) #b00000000000000000000000000000000)) (and (is-MissingVacant!202 lt!19955) (= (index!2933 lt!19955) (index!2932 lt!19602)) (= (select (arr!1419 lt!19268) (index!2933 lt!19955)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!8673 (= lt!19955 e!28568)))

(declare-fun c!6020 () Bool)

(assert (=> d!8673 (= c!6020 (bvsge (x!8356 lt!19602) #b01111111111111111111111111111110))))

(assert (=> d!8673 (= lt!19954 (select (arr!1419 lt!19268) (index!2932 lt!19602)))))

(assert (=> d!8673 (validMask!0 mask!853)))

(assert (=> d!8673 (= (seekKeyOrZeroReturnVacant!0 (x!8356 lt!19602) (index!2932 lt!19602) (index!2932 lt!19602) (select (arr!1419 lt!19268) #b00000000000000000000000000000000) lt!19268 mask!853) lt!19955)))

(declare-fun b!45085 () Bool)

(assert (=> b!45085 (= e!28567 (MissingVacant!202 (index!2932 lt!19602)))))

(assert (= (and d!8673 c!6020) b!45084))

(assert (= (and d!8673 (not c!6020)) b!45082))

(assert (= (and b!45082 c!6022) b!45083))

(assert (= (and b!45082 (not c!6022)) b!45080))

(assert (= (and b!45080 c!6021) b!45085))

(assert (= (and b!45080 (not c!6021)) b!45081))

(declare-fun m!39415 () Bool)

(assert (=> b!45081 m!39415))

(assert (=> b!45081 m!39415))

(assert (=> b!45081 m!38397))

(declare-fun m!39417 () Bool)

(assert (=> b!45081 m!39417))

(declare-fun m!39419 () Bool)

(assert (=> d!8673 m!39419))

(declare-fun m!39421 () Bool)

(assert (=> d!8673 m!39421))

(assert (=> d!8673 m!38679))

(assert (=> d!8673 m!38267))

(assert (=> b!44547 d!8673))

(assert (=> d!8445 d!8293))

(declare-fun b!45086 () Bool)

(declare-fun e!28570 () (_ BitVec 32))

(declare-fun call!3678 () (_ BitVec 32))

(assert (=> b!45086 (= e!28570 (bvadd #b00000000000000000000000000000001 call!3678))))

(declare-fun b!45087 () Bool)

(declare-fun e!28571 () (_ BitVec 32))

(assert (=> b!45087 (= e!28571 #b00000000000000000000000000000000)))

(declare-fun b!45088 () Bool)

(assert (=> b!45088 (= e!28571 e!28570)))

(declare-fun c!6024 () Bool)

(assert (=> b!45088 (= c!6024 (validKeyInArray!0 (select (arr!1419 (_keys!3463 lt!19259)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!8681 () Bool)

(declare-fun lt!19956 () (_ BitVec 32))

(assert (=> d!8681 (and (bvsge lt!19956 #b00000000000000000000000000000000) (bvsle lt!19956 (bvsub (size!1622 (_keys!3463 lt!19259)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!8681 (= lt!19956 e!28571)))

(declare-fun c!6023 () Bool)

(assert (=> d!8681 (= c!6023 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1622 (_keys!3463 lt!19259))))))

(assert (=> d!8681 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1622 (_keys!3463 lt!19259))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1622 (_keys!3463 lt!19259)) (size!1622 (_keys!3463 lt!19259))))))

(assert (=> d!8681 (= (arrayCountValidKeys!0 (_keys!3463 lt!19259) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1622 (_keys!3463 lt!19259))) lt!19956)))

(declare-fun bm!3675 () Bool)

(assert (=> bm!3675 (= call!3678 (arrayCountValidKeys!0 (_keys!3463 lt!19259) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1622 (_keys!3463 lt!19259))))))

(declare-fun b!45089 () Bool)

(assert (=> b!45089 (= e!28570 call!3678)))

(assert (= (and d!8681 c!6023) b!45087))

(assert (= (and d!8681 (not c!6023)) b!45088))

(assert (= (and b!45088 c!6024) b!45086))

(assert (= (and b!45088 (not c!6024)) b!45089))

(assert (= (or b!45086 b!45089) bm!3675))

(assert (=> b!45088 m!38949))

(assert (=> b!45088 m!38949))

(assert (=> b!45088 m!38951))

(declare-fun m!39423 () Bool)

(assert (=> bm!3675 m!39423))

(assert (=> bm!3633 d!8681))

(declare-fun d!8683 () Bool)

(assert (=> d!8683 (= (apply!61 lt!19512 #b0000000000000000000000000000000000000000000000000000000000000000) (get!805 (getValueByKey!108 (toList!621 lt!19512) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2053 () Bool)

(assert (= bs!2053 d!8683))

(assert (=> bs!2053 m!39337))

(assert (=> bs!2053 m!39337))

(declare-fun m!39425 () Bool)

(assert (=> bs!2053 m!39425))

(assert (=> b!44434 d!8683))

(assert (=> b!44574 d!8341))

(declare-fun b_lambda!2337 () Bool)

(assert (= b_lambda!2321 (or (and start!6736 b_free!1513 (= defaultEntry!470 (defaultEntry!1896 lt!19259))) b_lambda!2337)))

(push 1)

