; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132742 () Bool)

(assert start!132742)

(declare-fun b!1555254 () Bool)

(declare-fun e!866087 () Bool)

(declare-datatypes ((B!2284 0))(
  ( (B!2285 (val!19228 Int)) )
))
(declare-datatypes ((tuple2!24832 0))(
  ( (tuple2!24833 (_1!12427 (_ BitVec 64)) (_2!12427 B!2284)) )
))
(declare-datatypes ((List!36262 0))(
  ( (Nil!36259) (Cons!36258 (h!37704 tuple2!24832) (t!50983 List!36262)) )
))
(declare-fun lt!670267 () List!36262)

(declare-fun isStrictlySorted!921 (List!36262) Bool)

(assert (=> b!1555254 (= e!866087 (isStrictlySorted!921 lt!670267))))

(declare-fun b!1555255 () Bool)

(declare-fun e!866088 () Bool)

(declare-fun tp_is_empty!38295 () Bool)

(declare-fun tp!112275 () Bool)

(assert (=> b!1555255 (= e!866088 (and tp_is_empty!38295 tp!112275))))

(declare-fun res!1064218 () Bool)

(declare-fun e!866089 () Bool)

(assert (=> start!132742 (=> (not res!1064218) (not e!866089))))

(declare-fun l!1177 () List!36262)

(assert (=> start!132742 (= res!1064218 (isStrictlySorted!921 l!1177))))

(assert (=> start!132742 e!866089))

(assert (=> start!132742 e!866088))

(assert (=> start!132742 true))

(assert (=> start!132742 tp_is_empty!38295))

(declare-fun b!1555256 () Bool)

(declare-fun res!1064219 () Bool)

(assert (=> b!1555256 (=> (not res!1064219) (not e!866089))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1555256 (= res!1064219 (and (not (= newKey!105 otherKey!50)) ((_ is Cons!36258) l!1177) (not (= (_1!12427 (h!37704 l!1177)) otherKey!50))))))

(declare-fun b!1555257 () Bool)

(assert (=> b!1555257 (= e!866089 (not e!866087))))

(declare-fun res!1064221 () Bool)

(assert (=> b!1555257 (=> res!1064221 e!866087)))

(declare-fun containsKey!792 (List!36262 (_ BitVec 64)) Bool)

(assert (=> b!1555257 (= res!1064221 (not (= (containsKey!792 lt!670267 otherKey!50) (containsKey!792 l!1177 otherKey!50))))))

(declare-fun newValue!105 () B!2284)

(declare-fun insertStrictlySorted!532 (List!36262 (_ BitVec 64) B!2284) List!36262)

(assert (=> b!1555257 (= lt!670267 (insertStrictlySorted!532 l!1177 newKey!105 newValue!105))))

(declare-fun e!866090 () Bool)

(assert (=> b!1555257 e!866090))

(declare-fun res!1064220 () Bool)

(assert (=> b!1555257 (=> (not res!1064220) (not e!866090))))

(declare-fun lt!670268 () List!36262)

(assert (=> b!1555257 (= res!1064220 (= (containsKey!792 lt!670268 otherKey!50) (containsKey!792 (t!50983 l!1177) otherKey!50)))))

(assert (=> b!1555257 (= lt!670268 (insertStrictlySorted!532 (t!50983 l!1177) newKey!105 newValue!105))))

(declare-datatypes ((Unit!51828 0))(
  ( (Unit!51829) )
))
(declare-fun lt!670266 () Unit!51828)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!29 (List!36262 (_ BitVec 64) B!2284 (_ BitVec 64)) Unit!51828)

(assert (=> b!1555257 (= lt!670266 (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!29 (t!50983 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun b!1555258 () Bool)

(declare-fun res!1064217 () Bool)

(assert (=> b!1555258 (=> (not res!1064217) (not e!866089))))

(assert (=> b!1555258 (= res!1064217 (isStrictlySorted!921 (t!50983 l!1177)))))

(declare-fun b!1555259 () Bool)

(declare-datatypes ((Option!846 0))(
  ( (Some!845 (v!22030 B!2284)) (None!844) )
))
(declare-fun getValueByKey!770 (List!36262 (_ BitVec 64)) Option!846)

(assert (=> b!1555259 (= e!866090 (= (getValueByKey!770 lt!670268 otherKey!50) (getValueByKey!770 (t!50983 l!1177) otherKey!50)))))

(assert (= (and start!132742 res!1064218) b!1555256))

(assert (= (and b!1555256 res!1064219) b!1555258))

(assert (= (and b!1555258 res!1064217) b!1555257))

(assert (= (and b!1555257 res!1064220) b!1555259))

(assert (= (and b!1555257 (not res!1064221)) b!1555254))

(assert (= (and start!132742 ((_ is Cons!36258) l!1177)) b!1555255))

(declare-fun m!1433349 () Bool)

(assert (=> b!1555259 m!1433349))

(declare-fun m!1433351 () Bool)

(assert (=> b!1555259 m!1433351))

(declare-fun m!1433353 () Bool)

(assert (=> b!1555257 m!1433353))

(declare-fun m!1433355 () Bool)

(assert (=> b!1555257 m!1433355))

(declare-fun m!1433357 () Bool)

(assert (=> b!1555257 m!1433357))

(declare-fun m!1433359 () Bool)

(assert (=> b!1555257 m!1433359))

(declare-fun m!1433361 () Bool)

(assert (=> b!1555257 m!1433361))

(declare-fun m!1433363 () Bool)

(assert (=> b!1555257 m!1433363))

(declare-fun m!1433365 () Bool)

(assert (=> b!1555257 m!1433365))

(declare-fun m!1433367 () Bool)

(assert (=> b!1555258 m!1433367))

(declare-fun m!1433369 () Bool)

(assert (=> start!132742 m!1433369))

(declare-fun m!1433371 () Bool)

(assert (=> b!1555254 m!1433371))

(check-sat (not b!1555255) (not b!1555258) (not b!1555259) (not b!1555254) tp_is_empty!38295 (not b!1555257) (not start!132742))
(check-sat)
(get-model)

(declare-fun d!161913 () Bool)

(declare-fun res!1064241 () Bool)

(declare-fun e!866107 () Bool)

(assert (=> d!161913 (=> res!1064241 e!866107)))

(assert (=> d!161913 (= res!1064241 (or ((_ is Nil!36259) lt!670267) ((_ is Nil!36259) (t!50983 lt!670267))))))

(assert (=> d!161913 (= (isStrictlySorted!921 lt!670267) e!866107)))

(declare-fun b!1555282 () Bool)

(declare-fun e!866108 () Bool)

(assert (=> b!1555282 (= e!866107 e!866108)))

(declare-fun res!1064242 () Bool)

(assert (=> b!1555282 (=> (not res!1064242) (not e!866108))))

(assert (=> b!1555282 (= res!1064242 (bvslt (_1!12427 (h!37704 lt!670267)) (_1!12427 (h!37704 (t!50983 lt!670267)))))))

(declare-fun b!1555283 () Bool)

(assert (=> b!1555283 (= e!866108 (isStrictlySorted!921 (t!50983 lt!670267)))))

(assert (= (and d!161913 (not res!1064241)) b!1555282))

(assert (= (and b!1555282 res!1064242) b!1555283))

(declare-fun m!1433397 () Bool)

(assert (=> b!1555283 m!1433397))

(assert (=> b!1555254 d!161913))

(declare-fun b!1555295 () Bool)

(declare-fun e!866114 () Option!846)

(assert (=> b!1555295 (= e!866114 None!844)))

(declare-fun d!161917 () Bool)

(declare-fun c!143566 () Bool)

(assert (=> d!161917 (= c!143566 (and ((_ is Cons!36258) lt!670268) (= (_1!12427 (h!37704 lt!670268)) otherKey!50)))))

(declare-fun e!866113 () Option!846)

(assert (=> d!161917 (= (getValueByKey!770 lt!670268 otherKey!50) e!866113)))

(declare-fun b!1555292 () Bool)

(assert (=> b!1555292 (= e!866113 (Some!845 (_2!12427 (h!37704 lt!670268))))))

(declare-fun b!1555294 () Bool)

(assert (=> b!1555294 (= e!866114 (getValueByKey!770 (t!50983 lt!670268) otherKey!50))))

(declare-fun b!1555293 () Bool)

(assert (=> b!1555293 (= e!866113 e!866114)))

(declare-fun c!143567 () Bool)

(assert (=> b!1555293 (= c!143567 (and ((_ is Cons!36258) lt!670268) (not (= (_1!12427 (h!37704 lt!670268)) otherKey!50))))))

(assert (= (and d!161917 c!143566) b!1555292))

(assert (= (and d!161917 (not c!143566)) b!1555293))

(assert (= (and b!1555293 c!143567) b!1555294))

(assert (= (and b!1555293 (not c!143567)) b!1555295))

(declare-fun m!1433399 () Bool)

(assert (=> b!1555294 m!1433399))

(assert (=> b!1555259 d!161917))

(declare-fun b!1555301 () Bool)

(declare-fun e!866116 () Option!846)

(assert (=> b!1555301 (= e!866116 None!844)))

(declare-fun d!161921 () Bool)

(declare-fun c!143568 () Bool)

(assert (=> d!161921 (= c!143568 (and ((_ is Cons!36258) (t!50983 l!1177)) (= (_1!12427 (h!37704 (t!50983 l!1177))) otherKey!50)))))

(declare-fun e!866115 () Option!846)

(assert (=> d!161921 (= (getValueByKey!770 (t!50983 l!1177) otherKey!50) e!866115)))

(declare-fun b!1555298 () Bool)

(assert (=> b!1555298 (= e!866115 (Some!845 (_2!12427 (h!37704 (t!50983 l!1177)))))))

(declare-fun b!1555300 () Bool)

(assert (=> b!1555300 (= e!866116 (getValueByKey!770 (t!50983 (t!50983 l!1177)) otherKey!50))))

(declare-fun b!1555299 () Bool)

(assert (=> b!1555299 (= e!866115 e!866116)))

(declare-fun c!143569 () Bool)

(assert (=> b!1555299 (= c!143569 (and ((_ is Cons!36258) (t!50983 l!1177)) (not (= (_1!12427 (h!37704 (t!50983 l!1177))) otherKey!50))))))

(assert (= (and d!161921 c!143568) b!1555298))

(assert (= (and d!161921 (not c!143568)) b!1555299))

(assert (= (and b!1555299 c!143569) b!1555300))

(assert (= (and b!1555299 (not c!143569)) b!1555301))

(declare-fun m!1433401 () Bool)

(assert (=> b!1555300 m!1433401))

(assert (=> b!1555259 d!161921))

(declare-fun d!161923 () Bool)

(declare-fun res!1064243 () Bool)

(declare-fun e!866121 () Bool)

(assert (=> d!161923 (=> res!1064243 e!866121)))

(assert (=> d!161923 (= res!1064243 (or ((_ is Nil!36259) l!1177) ((_ is Nil!36259) (t!50983 l!1177))))))

(assert (=> d!161923 (= (isStrictlySorted!921 l!1177) e!866121)))

(declare-fun b!1555308 () Bool)

(declare-fun e!866122 () Bool)

(assert (=> b!1555308 (= e!866121 e!866122)))

(declare-fun res!1064244 () Bool)

(assert (=> b!1555308 (=> (not res!1064244) (not e!866122))))

(assert (=> b!1555308 (= res!1064244 (bvslt (_1!12427 (h!37704 l!1177)) (_1!12427 (h!37704 (t!50983 l!1177)))))))

(declare-fun b!1555309 () Bool)

(assert (=> b!1555309 (= e!866122 (isStrictlySorted!921 (t!50983 l!1177)))))

(assert (= (and d!161923 (not res!1064243)) b!1555308))

(assert (= (and b!1555308 res!1064244) b!1555309))

(assert (=> b!1555309 m!1433367))

(assert (=> start!132742 d!161923))

(declare-fun d!161925 () Bool)

(declare-fun res!1064245 () Bool)

(declare-fun e!866123 () Bool)

(assert (=> d!161925 (=> res!1064245 e!866123)))

(assert (=> d!161925 (= res!1064245 (or ((_ is Nil!36259) (t!50983 l!1177)) ((_ is Nil!36259) (t!50983 (t!50983 l!1177)))))))

(assert (=> d!161925 (= (isStrictlySorted!921 (t!50983 l!1177)) e!866123)))

(declare-fun b!1555310 () Bool)

(declare-fun e!866124 () Bool)

(assert (=> b!1555310 (= e!866123 e!866124)))

(declare-fun res!1064246 () Bool)

(assert (=> b!1555310 (=> (not res!1064246) (not e!866124))))

(assert (=> b!1555310 (= res!1064246 (bvslt (_1!12427 (h!37704 (t!50983 l!1177))) (_1!12427 (h!37704 (t!50983 (t!50983 l!1177))))))))

(declare-fun b!1555311 () Bool)

(assert (=> b!1555311 (= e!866124 (isStrictlySorted!921 (t!50983 (t!50983 l!1177))))))

(assert (= (and d!161925 (not res!1064245)) b!1555310))

(assert (= (and b!1555310 res!1064246) b!1555311))

(declare-fun m!1433403 () Bool)

(assert (=> b!1555311 m!1433403))

(assert (=> b!1555258 d!161925))

(declare-fun b!1555396 () Bool)

(declare-fun e!866172 () List!36262)

(declare-fun call!71514 () List!36262)

(assert (=> b!1555396 (= e!866172 call!71514)))

(declare-fun bm!71509 () Bool)

(declare-fun call!71513 () List!36262)

(assert (=> bm!71509 (= call!71514 call!71513)))

(declare-fun b!1555397 () Bool)

(assert (=> b!1555397 (= e!866172 call!71514)))

(declare-fun b!1555398 () Bool)

(declare-fun res!1064268 () Bool)

(declare-fun e!866171 () Bool)

(assert (=> b!1555398 (=> (not res!1064268) (not e!866171))))

(declare-fun lt!670285 () List!36262)

(assert (=> b!1555398 (= res!1064268 (containsKey!792 lt!670285 newKey!105))))

(declare-fun b!1555400 () Bool)

(declare-fun e!866170 () List!36262)

(declare-fun call!71512 () List!36262)

(assert (=> b!1555400 (= e!866170 call!71512)))

(declare-fun c!143609 () Bool)

(declare-fun e!866174 () List!36262)

(declare-fun bm!71510 () Bool)

(declare-fun $colon$colon!958 (List!36262 tuple2!24832) List!36262)

(assert (=> bm!71510 (= call!71512 ($colon$colon!958 e!866174 (ite c!143609 (h!37704 l!1177) (tuple2!24833 newKey!105 newValue!105))))))

(declare-fun c!143607 () Bool)

(assert (=> bm!71510 (= c!143607 c!143609)))

(declare-fun b!1555401 () Bool)

(assert (=> b!1555401 (= e!866174 (insertStrictlySorted!532 (t!50983 l!1177) newKey!105 newValue!105))))

(declare-fun c!143606 () Bool)

(declare-fun b!1555402 () Bool)

(declare-fun c!143608 () Bool)

(assert (=> b!1555402 (= e!866174 (ite c!143608 (t!50983 l!1177) (ite c!143606 (Cons!36258 (h!37704 l!1177) (t!50983 l!1177)) Nil!36259)))))

(declare-fun b!1555403 () Bool)

(declare-fun contains!10176 (List!36262 tuple2!24832) Bool)

(assert (=> b!1555403 (= e!866171 (contains!10176 lt!670285 (tuple2!24833 newKey!105 newValue!105)))))

(declare-fun b!1555404 () Bool)

(assert (=> b!1555404 (= c!143606 (and ((_ is Cons!36258) l!1177) (bvsgt (_1!12427 (h!37704 l!1177)) newKey!105)))))

(declare-fun e!866173 () List!36262)

(assert (=> b!1555404 (= e!866173 e!866172)))

(declare-fun d!161927 () Bool)

(assert (=> d!161927 e!866171))

(declare-fun res!1064267 () Bool)

(assert (=> d!161927 (=> (not res!1064267) (not e!866171))))

(assert (=> d!161927 (= res!1064267 (isStrictlySorted!921 lt!670285))))

(assert (=> d!161927 (= lt!670285 e!866170)))

(assert (=> d!161927 (= c!143609 (and ((_ is Cons!36258) l!1177) (bvslt (_1!12427 (h!37704 l!1177)) newKey!105)))))

(assert (=> d!161927 (isStrictlySorted!921 l!1177)))

(assert (=> d!161927 (= (insertStrictlySorted!532 l!1177 newKey!105 newValue!105) lt!670285)))

(declare-fun b!1555399 () Bool)

(assert (=> b!1555399 (= e!866170 e!866173)))

(assert (=> b!1555399 (= c!143608 (and ((_ is Cons!36258) l!1177) (= (_1!12427 (h!37704 l!1177)) newKey!105)))))

(declare-fun b!1555405 () Bool)

(assert (=> b!1555405 (= e!866173 call!71513)))

(declare-fun bm!71511 () Bool)

(assert (=> bm!71511 (= call!71513 call!71512)))

(assert (= (and d!161927 c!143609) b!1555400))

(assert (= (and d!161927 (not c!143609)) b!1555399))

(assert (= (and b!1555399 c!143608) b!1555405))

(assert (= (and b!1555399 (not c!143608)) b!1555404))

(assert (= (and b!1555404 c!143606) b!1555397))

(assert (= (and b!1555404 (not c!143606)) b!1555396))

(assert (= (or b!1555397 b!1555396) bm!71509))

(assert (= (or b!1555405 bm!71509) bm!71511))

(assert (= (or b!1555400 bm!71511) bm!71510))

(assert (= (and bm!71510 c!143607) b!1555401))

(assert (= (and bm!71510 (not c!143607)) b!1555402))

(assert (= (and d!161927 res!1064267) b!1555398))

(assert (= (and b!1555398 res!1064268) b!1555403))

(assert (=> b!1555401 m!1433359))

(declare-fun m!1433419 () Bool)

(assert (=> b!1555403 m!1433419))

(declare-fun m!1433421 () Bool)

(assert (=> bm!71510 m!1433421))

(declare-fun m!1433423 () Bool)

(assert (=> b!1555398 m!1433423))

(declare-fun m!1433425 () Bool)

(assert (=> d!161927 m!1433425))

(assert (=> d!161927 m!1433369))

(assert (=> b!1555257 d!161927))

(declare-fun d!161937 () Bool)

(declare-fun res!1064279 () Bool)

(declare-fun e!866188 () Bool)

(assert (=> d!161937 (=> res!1064279 e!866188)))

(assert (=> d!161937 (= res!1064279 (and ((_ is Cons!36258) lt!670267) (= (_1!12427 (h!37704 lt!670267)) otherKey!50)))))

(assert (=> d!161937 (= (containsKey!792 lt!670267 otherKey!50) e!866188)))

(declare-fun b!1555424 () Bool)

(declare-fun e!866189 () Bool)

(assert (=> b!1555424 (= e!866188 e!866189)))

(declare-fun res!1064280 () Bool)

(assert (=> b!1555424 (=> (not res!1064280) (not e!866189))))

(assert (=> b!1555424 (= res!1064280 (and (or (not ((_ is Cons!36258) lt!670267)) (bvsle (_1!12427 (h!37704 lt!670267)) otherKey!50)) ((_ is Cons!36258) lt!670267) (bvslt (_1!12427 (h!37704 lt!670267)) otherKey!50)))))

(declare-fun b!1555425 () Bool)

(assert (=> b!1555425 (= e!866189 (containsKey!792 (t!50983 lt!670267) otherKey!50))))

(assert (= (and d!161937 (not res!1064279)) b!1555424))

(assert (= (and b!1555424 res!1064280) b!1555425))

(declare-fun m!1433435 () Bool)

(assert (=> b!1555425 m!1433435))

(assert (=> b!1555257 d!161937))

(declare-fun d!161941 () Bool)

(declare-fun e!866220 () Bool)

(assert (=> d!161941 e!866220))

(declare-fun res!1064308 () Bool)

(assert (=> d!161941 (=> (not res!1064308) (not e!866220))))

(assert (=> d!161941 (= res!1064308 (= (containsKey!792 (insertStrictlySorted!532 (t!50983 l!1177) newKey!105 newValue!105) otherKey!50) (containsKey!792 (t!50983 l!1177) otherKey!50)))))

(declare-fun lt!670296 () Unit!51828)

(declare-fun choose!2060 (List!36262 (_ BitVec 64) B!2284 (_ BitVec 64)) Unit!51828)

(assert (=> d!161941 (= lt!670296 (choose!2060 (t!50983 l!1177) newKey!105 newValue!105 otherKey!50))))

(declare-fun e!866219 () Bool)

(assert (=> d!161941 e!866219))

(declare-fun res!1064307 () Bool)

(assert (=> d!161941 (=> (not res!1064307) (not e!866219))))

(assert (=> d!161941 (= res!1064307 (isStrictlySorted!921 (t!50983 l!1177)))))

(assert (=> d!161941 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeyValues!29 (t!50983 l!1177) newKey!105 newValue!105 otherKey!50) lt!670296)))

(declare-fun b!1555460 () Bool)

(assert (=> b!1555460 (= e!866219 (not (= newKey!105 otherKey!50)))))

(declare-fun b!1555461 () Bool)

(assert (=> b!1555461 (= e!866220 (= (getValueByKey!770 (insertStrictlySorted!532 (t!50983 l!1177) newKey!105 newValue!105) otherKey!50) (getValueByKey!770 (t!50983 l!1177) otherKey!50)))))

(assert (= (and d!161941 res!1064307) b!1555460))

(assert (= (and d!161941 res!1064308) b!1555461))

(assert (=> d!161941 m!1433367))

(assert (=> d!161941 m!1433359))

(assert (=> d!161941 m!1433359))

(declare-fun m!1433465 () Bool)

(assert (=> d!161941 m!1433465))

(declare-fun m!1433467 () Bool)

(assert (=> d!161941 m!1433467))

(assert (=> d!161941 m!1433361))

(assert (=> b!1555461 m!1433359))

(assert (=> b!1555461 m!1433359))

(declare-fun m!1433469 () Bool)

(assert (=> b!1555461 m!1433469))

(assert (=> b!1555461 m!1433351))

(assert (=> b!1555257 d!161941))

(declare-fun d!161959 () Bool)

(declare-fun res!1064313 () Bool)

(declare-fun e!866225 () Bool)

(assert (=> d!161959 (=> res!1064313 e!866225)))

(assert (=> d!161959 (= res!1064313 (and ((_ is Cons!36258) lt!670268) (= (_1!12427 (h!37704 lt!670268)) otherKey!50)))))

(assert (=> d!161959 (= (containsKey!792 lt!670268 otherKey!50) e!866225)))

(declare-fun b!1555464 () Bool)

(declare-fun e!866226 () Bool)

(assert (=> b!1555464 (= e!866225 e!866226)))

(declare-fun res!1064314 () Bool)

(assert (=> b!1555464 (=> (not res!1064314) (not e!866226))))

(assert (=> b!1555464 (= res!1064314 (and (or (not ((_ is Cons!36258) lt!670268)) (bvsle (_1!12427 (h!37704 lt!670268)) otherKey!50)) ((_ is Cons!36258) lt!670268) (bvslt (_1!12427 (h!37704 lt!670268)) otherKey!50)))))

(declare-fun b!1555465 () Bool)

(assert (=> b!1555465 (= e!866226 (containsKey!792 (t!50983 lt!670268) otherKey!50))))

(assert (= (and d!161959 (not res!1064313)) b!1555464))

(assert (= (and b!1555464 res!1064314) b!1555465))

(declare-fun m!1433471 () Bool)

(assert (=> b!1555465 m!1433471))

(assert (=> b!1555257 d!161959))

(declare-fun d!161961 () Bool)

(declare-fun res!1064317 () Bool)

(declare-fun e!866229 () Bool)

(assert (=> d!161961 (=> res!1064317 e!866229)))

(assert (=> d!161961 (= res!1064317 (and ((_ is Cons!36258) l!1177) (= (_1!12427 (h!37704 l!1177)) otherKey!50)))))

(assert (=> d!161961 (= (containsKey!792 l!1177 otherKey!50) e!866229)))

(declare-fun b!1555470 () Bool)

(declare-fun e!866230 () Bool)

(assert (=> b!1555470 (= e!866229 e!866230)))

(declare-fun res!1064318 () Bool)

(assert (=> b!1555470 (=> (not res!1064318) (not e!866230))))

(assert (=> b!1555470 (= res!1064318 (and (or (not ((_ is Cons!36258) l!1177)) (bvsle (_1!12427 (h!37704 l!1177)) otherKey!50)) ((_ is Cons!36258) l!1177) (bvslt (_1!12427 (h!37704 l!1177)) otherKey!50)))))

(declare-fun b!1555471 () Bool)

(assert (=> b!1555471 (= e!866230 (containsKey!792 (t!50983 l!1177) otherKey!50))))

(assert (= (and d!161961 (not res!1064317)) b!1555470))

(assert (= (and b!1555470 res!1064318) b!1555471))

(assert (=> b!1555471 m!1433361))

(assert (=> b!1555257 d!161961))

(declare-fun b!1555472 () Bool)

(declare-fun e!866233 () List!36262)

(declare-fun call!71523 () List!36262)

(assert (=> b!1555472 (= e!866233 call!71523)))

(declare-fun bm!71518 () Bool)

(declare-fun call!71522 () List!36262)

(assert (=> bm!71518 (= call!71523 call!71522)))

(declare-fun b!1555473 () Bool)

(assert (=> b!1555473 (= e!866233 call!71523)))

(declare-fun b!1555474 () Bool)

(declare-fun res!1064320 () Bool)

(declare-fun e!866232 () Bool)

(assert (=> b!1555474 (=> (not res!1064320) (not e!866232))))

(declare-fun lt!670297 () List!36262)

(assert (=> b!1555474 (= res!1064320 (containsKey!792 lt!670297 newKey!105))))

(declare-fun b!1555476 () Bool)

(declare-fun e!866231 () List!36262)

(declare-fun call!71521 () List!36262)

(assert (=> b!1555476 (= e!866231 call!71521)))

(declare-fun c!143621 () Bool)

(declare-fun e!866235 () List!36262)

(declare-fun bm!71519 () Bool)

(assert (=> bm!71519 (= call!71521 ($colon$colon!958 e!866235 (ite c!143621 (h!37704 (t!50983 l!1177)) (tuple2!24833 newKey!105 newValue!105))))))

(declare-fun c!143619 () Bool)

(assert (=> bm!71519 (= c!143619 c!143621)))

(declare-fun b!1555477 () Bool)

(assert (=> b!1555477 (= e!866235 (insertStrictlySorted!532 (t!50983 (t!50983 l!1177)) newKey!105 newValue!105))))

(declare-fun b!1555478 () Bool)

(declare-fun c!143618 () Bool)

(declare-fun c!143620 () Bool)

(assert (=> b!1555478 (= e!866235 (ite c!143620 (t!50983 (t!50983 l!1177)) (ite c!143618 (Cons!36258 (h!37704 (t!50983 l!1177)) (t!50983 (t!50983 l!1177))) Nil!36259)))))

(declare-fun b!1555479 () Bool)

(assert (=> b!1555479 (= e!866232 (contains!10176 lt!670297 (tuple2!24833 newKey!105 newValue!105)))))

(declare-fun b!1555480 () Bool)

(assert (=> b!1555480 (= c!143618 (and ((_ is Cons!36258) (t!50983 l!1177)) (bvsgt (_1!12427 (h!37704 (t!50983 l!1177))) newKey!105)))))

(declare-fun e!866234 () List!36262)

(assert (=> b!1555480 (= e!866234 e!866233)))

(declare-fun d!161963 () Bool)

(assert (=> d!161963 e!866232))

(declare-fun res!1064319 () Bool)

(assert (=> d!161963 (=> (not res!1064319) (not e!866232))))

(assert (=> d!161963 (= res!1064319 (isStrictlySorted!921 lt!670297))))

(assert (=> d!161963 (= lt!670297 e!866231)))

(assert (=> d!161963 (= c!143621 (and ((_ is Cons!36258) (t!50983 l!1177)) (bvslt (_1!12427 (h!37704 (t!50983 l!1177))) newKey!105)))))

(assert (=> d!161963 (isStrictlySorted!921 (t!50983 l!1177))))

(assert (=> d!161963 (= (insertStrictlySorted!532 (t!50983 l!1177) newKey!105 newValue!105) lt!670297)))

(declare-fun b!1555475 () Bool)

(assert (=> b!1555475 (= e!866231 e!866234)))

(assert (=> b!1555475 (= c!143620 (and ((_ is Cons!36258) (t!50983 l!1177)) (= (_1!12427 (h!37704 (t!50983 l!1177))) newKey!105)))))

(declare-fun b!1555481 () Bool)

(assert (=> b!1555481 (= e!866234 call!71522)))

(declare-fun bm!71520 () Bool)

(assert (=> bm!71520 (= call!71522 call!71521)))

(assert (= (and d!161963 c!143621) b!1555476))

(assert (= (and d!161963 (not c!143621)) b!1555475))

(assert (= (and b!1555475 c!143620) b!1555481))

(assert (= (and b!1555475 (not c!143620)) b!1555480))

(assert (= (and b!1555480 c!143618) b!1555473))

(assert (= (and b!1555480 (not c!143618)) b!1555472))

(assert (= (or b!1555473 b!1555472) bm!71518))

(assert (= (or b!1555481 bm!71518) bm!71520))

(assert (= (or b!1555476 bm!71520) bm!71519))

(assert (= (and bm!71519 c!143619) b!1555477))

(assert (= (and bm!71519 (not c!143619)) b!1555478))

(assert (= (and d!161963 res!1064319) b!1555474))

(assert (= (and b!1555474 res!1064320) b!1555479))

(declare-fun m!1433473 () Bool)

(assert (=> b!1555477 m!1433473))

(declare-fun m!1433475 () Bool)

(assert (=> b!1555479 m!1433475))

(declare-fun m!1433477 () Bool)

(assert (=> bm!71519 m!1433477))

(declare-fun m!1433479 () Bool)

(assert (=> b!1555474 m!1433479))

(declare-fun m!1433481 () Bool)

(assert (=> d!161963 m!1433481))

(assert (=> d!161963 m!1433367))

(assert (=> b!1555257 d!161963))

(declare-fun d!161967 () Bool)

(declare-fun res!1064325 () Bool)

(declare-fun e!866247 () Bool)

(assert (=> d!161967 (=> res!1064325 e!866247)))

(assert (=> d!161967 (= res!1064325 (and ((_ is Cons!36258) (t!50983 l!1177)) (= (_1!12427 (h!37704 (t!50983 l!1177))) otherKey!50)))))

(assert (=> d!161967 (= (containsKey!792 (t!50983 l!1177) otherKey!50) e!866247)))

(declare-fun b!1555502 () Bool)

(declare-fun e!866248 () Bool)

(assert (=> b!1555502 (= e!866247 e!866248)))

(declare-fun res!1064326 () Bool)

(assert (=> b!1555502 (=> (not res!1064326) (not e!866248))))

(assert (=> b!1555502 (= res!1064326 (and (or (not ((_ is Cons!36258) (t!50983 l!1177))) (bvsle (_1!12427 (h!37704 (t!50983 l!1177))) otherKey!50)) ((_ is Cons!36258) (t!50983 l!1177)) (bvslt (_1!12427 (h!37704 (t!50983 l!1177))) otherKey!50)))))

(declare-fun b!1555503 () Bool)

(assert (=> b!1555503 (= e!866248 (containsKey!792 (t!50983 (t!50983 l!1177)) otherKey!50))))

(assert (= (and d!161967 (not res!1064325)) b!1555502))

(assert (= (and b!1555502 res!1064326) b!1555503))

(declare-fun m!1433483 () Bool)

(assert (=> b!1555503 m!1433483))

(assert (=> b!1555257 d!161967))

(declare-fun b!1555510 () Bool)

(declare-fun e!866253 () Bool)

(declare-fun tp!112281 () Bool)

(assert (=> b!1555510 (= e!866253 (and tp_is_empty!38295 tp!112281))))

(assert (=> b!1555255 (= tp!112275 e!866253)))

(assert (= (and b!1555255 ((_ is Cons!36258) (t!50983 l!1177))) b!1555510))

(check-sat (not b!1555477) (not b!1555398) (not b!1555294) (not b!1555309) (not b!1555503) (not b!1555283) (not b!1555479) (not bm!71519) (not b!1555474) (not b!1555403) (not b!1555300) (not b!1555465) (not b!1555311) (not b!1555510) (not d!161927) (not bm!71510) (not b!1555471) (not d!161941) (not b!1555461) (not d!161963) (not b!1555401) tp_is_empty!38295 (not b!1555425))
(check-sat)
