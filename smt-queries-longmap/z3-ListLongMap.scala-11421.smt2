; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133530 () Bool)

(assert start!133530)

(declare-fun b!1560123 () Bool)

(declare-fun res!1066288 () Bool)

(declare-fun e!869201 () Bool)

(assert (=> b!1560123 (=> (not res!1066288) (not e!869201))))

(declare-datatypes ((B!2402 0))(
  ( (B!2403 (val!19287 Int)) )
))
(declare-datatypes ((tuple2!25004 0))(
  ( (tuple2!25005 (_1!12513 (_ BitVec 64)) (_2!12513 B!2402)) )
))
(declare-datatypes ((List!36350 0))(
  ( (Nil!36347) (Cons!36346 (h!37810 tuple2!25004) (t!51069 List!36350)) )
))
(declare-fun l!1292 () List!36350)

(declare-fun otherKey!62 () (_ BitVec 64))

(declare-fun containsKey!827 (List!36350 (_ BitVec 64)) Bool)

(assert (=> b!1560123 (= res!1066288 (containsKey!827 (t!51069 l!1292) otherKey!62))))

(declare-fun b!1560124 () Bool)

(declare-fun e!869200 () Bool)

(declare-fun tp_is_empty!38407 () Bool)

(declare-fun tp!112557 () Bool)

(assert (=> b!1560124 (= e!869200 (and tp_is_empty!38407 tp!112557))))

(declare-fun b!1560125 () Bool)

(declare-fun res!1066289 () Bool)

(assert (=> b!1560125 (=> (not res!1066289) (not e!869201))))

(declare-fun newKey!135 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1560125 (= res!1066289 (and (not (= otherKey!62 newKey!135)) ((_ is Cons!36346) l!1292) (not (= (_1!12513 (h!37810 l!1292)) otherKey!62))))))

(declare-fun b!1560126 () Bool)

(declare-fun res!1066286 () Bool)

(assert (=> b!1560126 (=> (not res!1066286) (not e!869201))))

(declare-fun isStrictlySorted!951 (List!36350) Bool)

(assert (=> b!1560126 (= res!1066286 (isStrictlySorted!951 (t!51069 l!1292)))))

(declare-fun newValue!135 () B!2402)

(declare-fun b!1560128 () Bool)

(declare-fun insertStrictlySorted!565 (List!36350 (_ BitVec 64) B!2402) List!36350)

(assert (=> b!1560128 (= e!869201 (not (isStrictlySorted!951 (insertStrictlySorted!565 l!1292 newKey!135 newValue!135))))))

(assert (=> b!1560128 (containsKey!827 (insertStrictlySorted!565 (t!51069 l!1292) newKey!135 newValue!135) otherKey!62)))

(declare-datatypes ((Unit!51793 0))(
  ( (Unit!51794) )
))
(declare-fun lt!671635 () Unit!51793)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!7 (List!36350 (_ BitVec 64) B!2402 (_ BitVec 64)) Unit!51793)

(assert (=> b!1560128 (= lt!671635 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!7 (t!51069 l!1292) newKey!135 newValue!135 otherKey!62))))

(declare-fun b!1560127 () Bool)

(declare-fun res!1066290 () Bool)

(assert (=> b!1560127 (=> (not res!1066290) (not e!869201))))

(assert (=> b!1560127 (= res!1066290 (containsKey!827 l!1292 otherKey!62))))

(declare-fun res!1066287 () Bool)

(assert (=> start!133530 (=> (not res!1066287) (not e!869201))))

(assert (=> start!133530 (= res!1066287 (isStrictlySorted!951 l!1292))))

(assert (=> start!133530 e!869201))

(assert (=> start!133530 e!869200))

(assert (=> start!133530 true))

(assert (=> start!133530 tp_is_empty!38407))

(assert (= (and start!133530 res!1066287) b!1560127))

(assert (= (and b!1560127 res!1066290) b!1560125))

(assert (= (and b!1560125 res!1066289) b!1560126))

(assert (= (and b!1560126 res!1066286) b!1560123))

(assert (= (and b!1560123 res!1066288) b!1560128))

(assert (= (and start!133530 ((_ is Cons!36346) l!1292)) b!1560124))

(declare-fun m!1437017 () Bool)

(assert (=> b!1560123 m!1437017))

(declare-fun m!1437019 () Bool)

(assert (=> b!1560127 m!1437019))

(declare-fun m!1437021 () Bool)

(assert (=> start!133530 m!1437021))

(declare-fun m!1437023 () Bool)

(assert (=> b!1560128 m!1437023))

(declare-fun m!1437025 () Bool)

(assert (=> b!1560128 m!1437025))

(assert (=> b!1560128 m!1437023))

(declare-fun m!1437027 () Bool)

(assert (=> b!1560128 m!1437027))

(declare-fun m!1437029 () Bool)

(assert (=> b!1560128 m!1437029))

(assert (=> b!1560128 m!1437027))

(declare-fun m!1437031 () Bool)

(assert (=> b!1560128 m!1437031))

(declare-fun m!1437033 () Bool)

(assert (=> b!1560126 m!1437033))

(check-sat (not b!1560124) (not start!133530) (not b!1560128) (not b!1560127) tp_is_empty!38407 (not b!1560123) (not b!1560126))
(check-sat)
(get-model)

(declare-fun d!163211 () Bool)

(declare-fun res!1066325 () Bool)

(declare-fun e!869218 () Bool)

(assert (=> d!163211 (=> res!1066325 e!869218)))

(assert (=> d!163211 (= res!1066325 (or ((_ is Nil!36347) (t!51069 l!1292)) ((_ is Nil!36347) (t!51069 (t!51069 l!1292)))))))

(assert (=> d!163211 (= (isStrictlySorted!951 (t!51069 l!1292)) e!869218)))

(declare-fun b!1560169 () Bool)

(declare-fun e!869219 () Bool)

(assert (=> b!1560169 (= e!869218 e!869219)))

(declare-fun res!1066326 () Bool)

(assert (=> b!1560169 (=> (not res!1066326) (not e!869219))))

(assert (=> b!1560169 (= res!1066326 (bvslt (_1!12513 (h!37810 (t!51069 l!1292))) (_1!12513 (h!37810 (t!51069 (t!51069 l!1292))))))))

(declare-fun b!1560170 () Bool)

(assert (=> b!1560170 (= e!869219 (isStrictlySorted!951 (t!51069 (t!51069 l!1292))))))

(assert (= (and d!163211 (not res!1066325)) b!1560169))

(assert (= (and b!1560169 res!1066326) b!1560170))

(declare-fun m!1437071 () Bool)

(assert (=> b!1560170 m!1437071))

(assert (=> b!1560126 d!163211))

(declare-fun d!163215 () Bool)

(declare-fun res!1066337 () Bool)

(declare-fun e!869230 () Bool)

(assert (=> d!163215 (=> res!1066337 e!869230)))

(assert (=> d!163215 (= res!1066337 (and ((_ is Cons!36346) l!1292) (= (_1!12513 (h!37810 l!1292)) otherKey!62)))))

(assert (=> d!163215 (= (containsKey!827 l!1292 otherKey!62) e!869230)))

(declare-fun b!1560181 () Bool)

(declare-fun e!869231 () Bool)

(assert (=> b!1560181 (= e!869230 e!869231)))

(declare-fun res!1066338 () Bool)

(assert (=> b!1560181 (=> (not res!1066338) (not e!869231))))

(assert (=> b!1560181 (= res!1066338 (and (or (not ((_ is Cons!36346) l!1292)) (bvsle (_1!12513 (h!37810 l!1292)) otherKey!62)) ((_ is Cons!36346) l!1292) (bvslt (_1!12513 (h!37810 l!1292)) otherKey!62)))))

(declare-fun b!1560182 () Bool)

(assert (=> b!1560182 (= e!869231 (containsKey!827 (t!51069 l!1292) otherKey!62))))

(assert (= (and d!163215 (not res!1066337)) b!1560181))

(assert (= (and b!1560181 res!1066338) b!1560182))

(assert (=> b!1560182 m!1437017))

(assert (=> b!1560127 d!163215))

(declare-fun d!163221 () Bool)

(declare-fun res!1066343 () Bool)

(declare-fun e!869236 () Bool)

(assert (=> d!163221 (=> res!1066343 e!869236)))

(assert (=> d!163221 (= res!1066343 (and ((_ is Cons!36346) (insertStrictlySorted!565 (t!51069 l!1292) newKey!135 newValue!135)) (= (_1!12513 (h!37810 (insertStrictlySorted!565 (t!51069 l!1292) newKey!135 newValue!135))) otherKey!62)))))

(assert (=> d!163221 (= (containsKey!827 (insertStrictlySorted!565 (t!51069 l!1292) newKey!135 newValue!135) otherKey!62) e!869236)))

(declare-fun b!1560187 () Bool)

(declare-fun e!869237 () Bool)

(assert (=> b!1560187 (= e!869236 e!869237)))

(declare-fun res!1066344 () Bool)

(assert (=> b!1560187 (=> (not res!1066344) (not e!869237))))

(assert (=> b!1560187 (= res!1066344 (and (or (not ((_ is Cons!36346) (insertStrictlySorted!565 (t!51069 l!1292) newKey!135 newValue!135))) (bvsle (_1!12513 (h!37810 (insertStrictlySorted!565 (t!51069 l!1292) newKey!135 newValue!135))) otherKey!62)) ((_ is Cons!36346) (insertStrictlySorted!565 (t!51069 l!1292) newKey!135 newValue!135)) (bvslt (_1!12513 (h!37810 (insertStrictlySorted!565 (t!51069 l!1292) newKey!135 newValue!135))) otherKey!62)))))

(declare-fun b!1560188 () Bool)

(assert (=> b!1560188 (= e!869237 (containsKey!827 (t!51069 (insertStrictlySorted!565 (t!51069 l!1292) newKey!135 newValue!135)) otherKey!62))))

(assert (= (and d!163221 (not res!1066343)) b!1560187))

(assert (= (and b!1560187 res!1066344) b!1560188))

(declare-fun m!1437075 () Bool)

(assert (=> b!1560188 m!1437075))

(assert (=> b!1560128 d!163221))

(declare-fun b!1560227 () Bool)

(declare-fun e!869261 () List!36350)

(declare-fun call!71851 () List!36350)

(assert (=> b!1560227 (= e!869261 call!71851)))

(declare-fun b!1560228 () Bool)

(declare-fun e!869259 () List!36350)

(declare-fun call!71849 () List!36350)

(assert (=> b!1560228 (= e!869259 call!71849)))

(declare-fun e!869258 () Bool)

(declare-fun lt!671648 () List!36350)

(declare-fun b!1560229 () Bool)

(declare-fun contains!10250 (List!36350 tuple2!25004) Bool)

(assert (=> b!1560229 (= e!869258 (contains!10250 lt!671648 (tuple2!25005 newKey!135 newValue!135)))))

(declare-fun bm!71846 () Bool)

(assert (=> bm!71846 (= call!71849 call!71851)))

(declare-fun bm!71847 () Bool)

(declare-fun call!71850 () List!36350)

(assert (=> bm!71847 (= call!71851 call!71850)))

(declare-fun d!163223 () Bool)

(assert (=> d!163223 e!869258))

(declare-fun res!1066352 () Bool)

(assert (=> d!163223 (=> (not res!1066352) (not e!869258))))

(assert (=> d!163223 (= res!1066352 (isStrictlySorted!951 lt!671648))))

(declare-fun e!869262 () List!36350)

(assert (=> d!163223 (= lt!671648 e!869262)))

(declare-fun c!144816 () Bool)

(assert (=> d!163223 (= c!144816 (and ((_ is Cons!36346) l!1292) (bvslt (_1!12513 (h!37810 l!1292)) newKey!135)))))

(assert (=> d!163223 (isStrictlySorted!951 l!1292)))

(assert (=> d!163223 (= (insertStrictlySorted!565 l!1292 newKey!135 newValue!135) lt!671648)))

(declare-fun b!1560230 () Bool)

(assert (=> b!1560230 (= e!869259 call!71849)))

(declare-fun bm!71848 () Bool)

(declare-fun e!869260 () List!36350)

(declare-fun $colon$colon!974 (List!36350 tuple2!25004) List!36350)

(assert (=> bm!71848 (= call!71850 ($colon$colon!974 e!869260 (ite c!144816 (h!37810 l!1292) (tuple2!25005 newKey!135 newValue!135))))))

(declare-fun c!144817 () Bool)

(assert (=> bm!71848 (= c!144817 c!144816)))

(declare-fun b!1560231 () Bool)

(declare-fun c!144819 () Bool)

(assert (=> b!1560231 (= c!144819 (and ((_ is Cons!36346) l!1292) (bvsgt (_1!12513 (h!37810 l!1292)) newKey!135)))))

(assert (=> b!1560231 (= e!869261 e!869259)))

(declare-fun b!1560232 () Bool)

(assert (=> b!1560232 (= e!869260 (insertStrictlySorted!565 (t!51069 l!1292) newKey!135 newValue!135))))

(declare-fun c!144818 () Bool)

(declare-fun b!1560233 () Bool)

(assert (=> b!1560233 (= e!869260 (ite c!144818 (t!51069 l!1292) (ite c!144819 (Cons!36346 (h!37810 l!1292) (t!51069 l!1292)) Nil!36347)))))

(declare-fun b!1560234 () Bool)

(declare-fun res!1066351 () Bool)

(assert (=> b!1560234 (=> (not res!1066351) (not e!869258))))

(assert (=> b!1560234 (= res!1066351 (containsKey!827 lt!671648 newKey!135))))

(declare-fun b!1560235 () Bool)

(assert (=> b!1560235 (= e!869262 call!71850)))

(declare-fun b!1560236 () Bool)

(assert (=> b!1560236 (= e!869262 e!869261)))

(assert (=> b!1560236 (= c!144818 (and ((_ is Cons!36346) l!1292) (= (_1!12513 (h!37810 l!1292)) newKey!135)))))

(assert (= (and d!163223 c!144816) b!1560235))

(assert (= (and d!163223 (not c!144816)) b!1560236))

(assert (= (and b!1560236 c!144818) b!1560227))

(assert (= (and b!1560236 (not c!144818)) b!1560231))

(assert (= (and b!1560231 c!144819) b!1560228))

(assert (= (and b!1560231 (not c!144819)) b!1560230))

(assert (= (or b!1560228 b!1560230) bm!71846))

(assert (= (or b!1560227 bm!71846) bm!71847))

(assert (= (or b!1560235 bm!71847) bm!71848))

(assert (= (and bm!71848 c!144817) b!1560232))

(assert (= (and bm!71848 (not c!144817)) b!1560233))

(assert (= (and d!163223 res!1066352) b!1560234))

(assert (= (and b!1560234 res!1066351) b!1560229))

(declare-fun m!1437079 () Bool)

(assert (=> b!1560234 m!1437079))

(declare-fun m!1437081 () Bool)

(assert (=> d!163223 m!1437081))

(assert (=> d!163223 m!1437021))

(declare-fun m!1437083 () Bool)

(assert (=> b!1560229 m!1437083))

(declare-fun m!1437085 () Bool)

(assert (=> bm!71848 m!1437085))

(assert (=> b!1560232 m!1437023))

(assert (=> b!1560128 d!163223))

(declare-fun d!163227 () Bool)

(assert (=> d!163227 (containsKey!827 (insertStrictlySorted!565 (t!51069 l!1292) newKey!135 newValue!135) otherKey!62)))

(declare-fun lt!671651 () Unit!51793)

(declare-fun choose!2060 (List!36350 (_ BitVec 64) B!2402 (_ BitVec 64)) Unit!51793)

(assert (=> d!163227 (= lt!671651 (choose!2060 (t!51069 l!1292) newKey!135 newValue!135 otherKey!62))))

(declare-fun e!869277 () Bool)

(assert (=> d!163227 e!869277))

(declare-fun res!1066365 () Bool)

(assert (=> d!163227 (=> (not res!1066365) (not e!869277))))

(assert (=> d!163227 (= res!1066365 (isStrictlySorted!951 (t!51069 l!1292)))))

(assert (=> d!163227 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!7 (t!51069 l!1292) newKey!135 newValue!135 otherKey!62) lt!671651)))

(declare-fun b!1560265 () Bool)

(declare-fun res!1066366 () Bool)

(assert (=> b!1560265 (=> (not res!1066366) (not e!869277))))

(assert (=> b!1560265 (= res!1066366 (containsKey!827 (t!51069 l!1292) otherKey!62))))

(declare-fun b!1560266 () Bool)

(assert (=> b!1560266 (= e!869277 (not (= otherKey!62 newKey!135)))))

(assert (= (and d!163227 res!1066365) b!1560265))

(assert (= (and b!1560265 res!1066366) b!1560266))

(assert (=> d!163227 m!1437023))

(assert (=> d!163227 m!1437023))

(assert (=> d!163227 m!1437025))

(declare-fun m!1437087 () Bool)

(assert (=> d!163227 m!1437087))

(assert (=> d!163227 m!1437033))

(assert (=> b!1560265 m!1437017))

(assert (=> b!1560128 d!163227))

(declare-fun d!163229 () Bool)

(declare-fun res!1066367 () Bool)

(declare-fun e!869278 () Bool)

(assert (=> d!163229 (=> res!1066367 e!869278)))

(assert (=> d!163229 (= res!1066367 (or ((_ is Nil!36347) (insertStrictlySorted!565 l!1292 newKey!135 newValue!135)) ((_ is Nil!36347) (t!51069 (insertStrictlySorted!565 l!1292 newKey!135 newValue!135)))))))

(assert (=> d!163229 (= (isStrictlySorted!951 (insertStrictlySorted!565 l!1292 newKey!135 newValue!135)) e!869278)))

(declare-fun b!1560267 () Bool)

(declare-fun e!869279 () Bool)

(assert (=> b!1560267 (= e!869278 e!869279)))

(declare-fun res!1066368 () Bool)

(assert (=> b!1560267 (=> (not res!1066368) (not e!869279))))

(assert (=> b!1560267 (= res!1066368 (bvslt (_1!12513 (h!37810 (insertStrictlySorted!565 l!1292 newKey!135 newValue!135))) (_1!12513 (h!37810 (t!51069 (insertStrictlySorted!565 l!1292 newKey!135 newValue!135))))))))

(declare-fun b!1560268 () Bool)

(assert (=> b!1560268 (= e!869279 (isStrictlySorted!951 (t!51069 (insertStrictlySorted!565 l!1292 newKey!135 newValue!135))))))

(assert (= (and d!163229 (not res!1066367)) b!1560267))

(assert (= (and b!1560267 res!1066368) b!1560268))

(declare-fun m!1437089 () Bool)

(assert (=> b!1560268 m!1437089))

(assert (=> b!1560128 d!163229))

(declare-fun b!1560269 () Bool)

(declare-fun e!869283 () List!36350)

(declare-fun call!71862 () List!36350)

(assert (=> b!1560269 (= e!869283 call!71862)))

(declare-fun b!1560270 () Bool)

(declare-fun e!869281 () List!36350)

(declare-fun call!71860 () List!36350)

(assert (=> b!1560270 (= e!869281 call!71860)))

(declare-fun lt!671652 () List!36350)

(declare-fun e!869280 () Bool)

(declare-fun b!1560271 () Bool)

(assert (=> b!1560271 (= e!869280 (contains!10250 lt!671652 (tuple2!25005 newKey!135 newValue!135)))))

(declare-fun bm!71857 () Bool)

(assert (=> bm!71857 (= call!71860 call!71862)))

(declare-fun bm!71858 () Bool)

(declare-fun call!71861 () List!36350)

(assert (=> bm!71858 (= call!71862 call!71861)))

(declare-fun d!163231 () Bool)

(assert (=> d!163231 e!869280))

(declare-fun res!1066370 () Bool)

(assert (=> d!163231 (=> (not res!1066370) (not e!869280))))

(assert (=> d!163231 (= res!1066370 (isStrictlySorted!951 lt!671652))))

(declare-fun e!869284 () List!36350)

(assert (=> d!163231 (= lt!671652 e!869284)))

(declare-fun c!144828 () Bool)

(assert (=> d!163231 (= c!144828 (and ((_ is Cons!36346) (t!51069 l!1292)) (bvslt (_1!12513 (h!37810 (t!51069 l!1292))) newKey!135)))))

(assert (=> d!163231 (isStrictlySorted!951 (t!51069 l!1292))))

(assert (=> d!163231 (= (insertStrictlySorted!565 (t!51069 l!1292) newKey!135 newValue!135) lt!671652)))

(declare-fun b!1560272 () Bool)

(assert (=> b!1560272 (= e!869281 call!71860)))

(declare-fun e!869282 () List!36350)

(declare-fun bm!71859 () Bool)

(assert (=> bm!71859 (= call!71861 ($colon$colon!974 e!869282 (ite c!144828 (h!37810 (t!51069 l!1292)) (tuple2!25005 newKey!135 newValue!135))))))

(declare-fun c!144829 () Bool)

(assert (=> bm!71859 (= c!144829 c!144828)))

(declare-fun b!1560273 () Bool)

(declare-fun c!144831 () Bool)

(assert (=> b!1560273 (= c!144831 (and ((_ is Cons!36346) (t!51069 l!1292)) (bvsgt (_1!12513 (h!37810 (t!51069 l!1292))) newKey!135)))))

(assert (=> b!1560273 (= e!869283 e!869281)))

(declare-fun b!1560274 () Bool)

(assert (=> b!1560274 (= e!869282 (insertStrictlySorted!565 (t!51069 (t!51069 l!1292)) newKey!135 newValue!135))))

(declare-fun b!1560275 () Bool)

(declare-fun c!144830 () Bool)

(assert (=> b!1560275 (= e!869282 (ite c!144830 (t!51069 (t!51069 l!1292)) (ite c!144831 (Cons!36346 (h!37810 (t!51069 l!1292)) (t!51069 (t!51069 l!1292))) Nil!36347)))))

(declare-fun b!1560276 () Bool)

(declare-fun res!1066369 () Bool)

(assert (=> b!1560276 (=> (not res!1066369) (not e!869280))))

(assert (=> b!1560276 (= res!1066369 (containsKey!827 lt!671652 newKey!135))))

(declare-fun b!1560277 () Bool)

(assert (=> b!1560277 (= e!869284 call!71861)))

(declare-fun b!1560278 () Bool)

(assert (=> b!1560278 (= e!869284 e!869283)))

(assert (=> b!1560278 (= c!144830 (and ((_ is Cons!36346) (t!51069 l!1292)) (= (_1!12513 (h!37810 (t!51069 l!1292))) newKey!135)))))

(assert (= (and d!163231 c!144828) b!1560277))

(assert (= (and d!163231 (not c!144828)) b!1560278))

(assert (= (and b!1560278 c!144830) b!1560269))

(assert (= (and b!1560278 (not c!144830)) b!1560273))

(assert (= (and b!1560273 c!144831) b!1560270))

(assert (= (and b!1560273 (not c!144831)) b!1560272))

(assert (= (or b!1560270 b!1560272) bm!71857))

(assert (= (or b!1560269 bm!71857) bm!71858))

(assert (= (or b!1560277 bm!71858) bm!71859))

(assert (= (and bm!71859 c!144829) b!1560274))

(assert (= (and bm!71859 (not c!144829)) b!1560275))

(assert (= (and d!163231 res!1066370) b!1560276))

(assert (= (and b!1560276 res!1066369) b!1560271))

(declare-fun m!1437091 () Bool)

(assert (=> b!1560276 m!1437091))

(declare-fun m!1437093 () Bool)

(assert (=> d!163231 m!1437093))

(assert (=> d!163231 m!1437033))

(declare-fun m!1437095 () Bool)

(assert (=> b!1560271 m!1437095))

(declare-fun m!1437097 () Bool)

(assert (=> bm!71859 m!1437097))

(declare-fun m!1437099 () Bool)

(assert (=> b!1560274 m!1437099))

(assert (=> b!1560128 d!163231))

(declare-fun d!163233 () Bool)

(declare-fun res!1066373 () Bool)

(declare-fun e!869290 () Bool)

(assert (=> d!163233 (=> res!1066373 e!869290)))

(assert (=> d!163233 (= res!1066373 (and ((_ is Cons!36346) (t!51069 l!1292)) (= (_1!12513 (h!37810 (t!51069 l!1292))) otherKey!62)))))

(assert (=> d!163233 (= (containsKey!827 (t!51069 l!1292) otherKey!62) e!869290)))

(declare-fun b!1560289 () Bool)

(declare-fun e!869291 () Bool)

(assert (=> b!1560289 (= e!869290 e!869291)))

(declare-fun res!1066374 () Bool)

(assert (=> b!1560289 (=> (not res!1066374) (not e!869291))))

(assert (=> b!1560289 (= res!1066374 (and (or (not ((_ is Cons!36346) (t!51069 l!1292))) (bvsle (_1!12513 (h!37810 (t!51069 l!1292))) otherKey!62)) ((_ is Cons!36346) (t!51069 l!1292)) (bvslt (_1!12513 (h!37810 (t!51069 l!1292))) otherKey!62)))))

(declare-fun b!1560290 () Bool)

(assert (=> b!1560290 (= e!869291 (containsKey!827 (t!51069 (t!51069 l!1292)) otherKey!62))))

(assert (= (and d!163233 (not res!1066373)) b!1560289))

(assert (= (and b!1560289 res!1066374) b!1560290))

(declare-fun m!1437101 () Bool)

(assert (=> b!1560290 m!1437101))

(assert (=> b!1560123 d!163233))

(declare-fun d!163235 () Bool)

(declare-fun res!1066375 () Bool)

(declare-fun e!869292 () Bool)

(assert (=> d!163235 (=> res!1066375 e!869292)))

(assert (=> d!163235 (= res!1066375 (or ((_ is Nil!36347) l!1292) ((_ is Nil!36347) (t!51069 l!1292))))))

(assert (=> d!163235 (= (isStrictlySorted!951 l!1292) e!869292)))

(declare-fun b!1560291 () Bool)

(declare-fun e!869293 () Bool)

(assert (=> b!1560291 (= e!869292 e!869293)))

(declare-fun res!1066376 () Bool)

(assert (=> b!1560291 (=> (not res!1066376) (not e!869293))))

(assert (=> b!1560291 (= res!1066376 (bvslt (_1!12513 (h!37810 l!1292)) (_1!12513 (h!37810 (t!51069 l!1292)))))))

(declare-fun b!1560292 () Bool)

(assert (=> b!1560292 (= e!869293 (isStrictlySorted!951 (t!51069 l!1292)))))

(assert (= (and d!163235 (not res!1066375)) b!1560291))

(assert (= (and b!1560291 res!1066376) b!1560292))

(assert (=> b!1560292 m!1437033))

(assert (=> start!133530 d!163235))

(declare-fun b!1560297 () Bool)

(declare-fun e!869296 () Bool)

(declare-fun tp!112566 () Bool)

(assert (=> b!1560297 (= e!869296 (and tp_is_empty!38407 tp!112566))))

(assert (=> b!1560124 (= tp!112557 e!869296)))

(assert (= (and b!1560124 ((_ is Cons!36346) (t!51069 l!1292))) b!1560297))

(check-sat (not b!1560232) (not b!1560290) (not b!1560274) (not b!1560170) (not b!1560271) (not bm!71848) (not b!1560276) (not b!1560188) (not b!1560234) (not bm!71859) (not b!1560268) (not d!163227) (not b!1560182) (not b!1560297) (not d!163223) (not b!1560229) tp_is_empty!38407 (not b!1560265) (not d!163231) (not b!1560292))
(check-sat)
