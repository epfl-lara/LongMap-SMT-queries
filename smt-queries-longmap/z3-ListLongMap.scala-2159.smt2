; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36250 () Bool)

(assert start!36250)

(declare-fun b!362939 () Bool)

(declare-fun res!202314 () Bool)

(declare-fun e!222235 () Bool)

(assert (=> b!362939 (=> (not res!202314) (not e!222235))))

(declare-datatypes ((array!20547 0))(
  ( (array!20548 (arr!9754 (Array (_ BitVec 32) (_ BitVec 64))) (size!10107 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20547)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362939 (= res!202314 (not (validKeyInArray!0 (select (arr!9754 a!4337) i!1478))))))

(declare-fun b!362940 () Bool)

(declare-fun res!202316 () Bool)

(assert (=> b!362940 (=> (not res!202316) (not e!222235))))

(assert (=> b!362940 (= res!202316 (bvslt (size!10107 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362941 () Bool)

(declare-fun res!202315 () Bool)

(assert (=> b!362941 (=> (not res!202315) (not e!222235))))

(declare-fun k0!2980 () (_ BitVec 64))

(assert (=> b!362941 (= res!202315 (validKeyInArray!0 k0!2980))))

(declare-fun lt!167154 () array!20547)

(declare-fun e!222233 () Bool)

(declare-fun b!362942 () Bool)

(declare-fun arrayCountValidKeys!0 (array!20547 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362942 (= e!222233 (= (arrayCountValidKeys!0 lt!167154 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)) (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun b!362943 () Bool)

(assert (=> b!362943 (= e!222235 (not e!222233))))

(declare-fun res!202318 () Bool)

(assert (=> b!362943 (=> res!202318 e!222233)))

(assert (=> b!362943 (= res!202318 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(assert (=> b!362943 (= (arrayCountValidKeys!0 lt!167154 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> b!362943 (= lt!167154 (array!20548 (store (arr!9754 a!4337) i!1478 k0!2980) (size!10107 a!4337)))))

(declare-datatypes ((Unit!11192 0))(
  ( (Unit!11193) )
))
(declare-fun lt!167155 () Unit!11192)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20547 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11192)

(assert (=> b!362943 (= lt!167155 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(declare-fun res!202317 () Bool)

(assert (=> start!36250 (=> (not res!202317) (not e!222235))))

(assert (=> start!36250 (= res!202317 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10107 a!4337))))))

(assert (=> start!36250 e!222235))

(assert (=> start!36250 true))

(declare-fun array_inv!7203 (array!20547) Bool)

(assert (=> start!36250 (array_inv!7203 a!4337)))

(assert (= (and start!36250 res!202317) b!362939))

(assert (= (and b!362939 res!202314) b!362941))

(assert (= (and b!362941 res!202315) b!362940))

(assert (= (and b!362940 res!202316) b!362943))

(assert (= (and b!362943 (not res!202318)) b!362942))

(declare-fun m!359383 () Bool)

(assert (=> b!362943 m!359383))

(declare-fun m!359385 () Bool)

(assert (=> b!362943 m!359385))

(declare-fun m!359387 () Bool)

(assert (=> b!362943 m!359387))

(declare-fun m!359389 () Bool)

(assert (=> b!362943 m!359389))

(declare-fun m!359391 () Bool)

(assert (=> b!362939 m!359391))

(assert (=> b!362939 m!359391))

(declare-fun m!359393 () Bool)

(assert (=> b!362939 m!359393))

(declare-fun m!359395 () Bool)

(assert (=> start!36250 m!359395))

(declare-fun m!359397 () Bool)

(assert (=> b!362942 m!359397))

(declare-fun m!359399 () Bool)

(assert (=> b!362942 m!359399))

(declare-fun m!359401 () Bool)

(assert (=> b!362941 m!359401))

(check-sat (not start!36250) (not b!362942) (not b!362943) (not b!362939) (not b!362941))
(check-sat)
(get-model)

(declare-fun d!71905 () Bool)

(assert (=> d!71905 (= (array_inv!7203 a!4337) (bvsge (size!10107 a!4337) #b00000000000000000000000000000000))))

(assert (=> start!36250 d!71905))

(declare-fun d!71907 () Bool)

(assert (=> d!71907 (= (validKeyInArray!0 k0!2980) (and (not (= k0!2980 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2980 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!362941 d!71907))

(declare-fun b!362982 () Bool)

(declare-fun e!222259 () (_ BitVec 32))

(declare-fun call!27205 () (_ BitVec 32))

(assert (=> b!362982 (= e!222259 call!27205)))

(declare-fun b!362983 () Bool)

(declare-fun e!222258 () (_ BitVec 32))

(assert (=> b!362983 (= e!222258 e!222259)))

(declare-fun c!53735 () Bool)

(assert (=> b!362983 (= c!53735 (validKeyInArray!0 (select (arr!9754 lt!167154) (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun bm!27202 () Bool)

(assert (=> bm!27202 (= call!27205 (arrayCountValidKeys!0 lt!167154 (bvadd #b00000000000000000000000000000001 i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun d!71909 () Bool)

(declare-fun lt!167170 () (_ BitVec 32))

(assert (=> d!71909 (and (bvsge lt!167170 #b00000000000000000000000000000000) (bvsle lt!167170 (bvsub (size!10107 lt!167154) (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> d!71909 (= lt!167170 e!222258)))

(declare-fun c!53736 () Bool)

(assert (=> d!71909 (= c!53736 (bvsge (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!71909 (and (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10107 lt!167154)))))

(assert (=> d!71909 (= (arrayCountValidKeys!0 lt!167154 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)) lt!167170)))

(declare-fun b!362984 () Bool)

(assert (=> b!362984 (= e!222258 #b00000000000000000000000000000000)))

(declare-fun b!362985 () Bool)

(assert (=> b!362985 (= e!222259 (bvadd #b00000000000000000000000000000001 call!27205))))

(assert (= (and d!71909 c!53736) b!362984))

(assert (= (and d!71909 (not c!53736)) b!362983))

(assert (= (and b!362983 c!53735) b!362985))

(assert (= (and b!362983 (not c!53735)) b!362982))

(assert (= (or b!362985 b!362982) bm!27202))

(declare-fun m!359443 () Bool)

(assert (=> b!362983 m!359443))

(assert (=> b!362983 m!359443))

(declare-fun m!359445 () Bool)

(assert (=> b!362983 m!359445))

(declare-fun m!359447 () Bool)

(assert (=> bm!27202 m!359447))

(assert (=> b!362942 d!71909))

(declare-fun b!362994 () Bool)

(declare-fun e!222265 () (_ BitVec 32))

(declare-fun call!27208 () (_ BitVec 32))

(assert (=> b!362994 (= e!222265 call!27208)))

(declare-fun b!362995 () Bool)

(declare-fun e!222264 () (_ BitVec 32))

(assert (=> b!362995 (= e!222264 e!222265)))

(declare-fun c!53741 () Bool)

(assert (=> b!362995 (= c!53741 (validKeyInArray!0 (select (arr!9754 a!4337) (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun bm!27205 () Bool)

(assert (=> bm!27205 (= call!27208 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun d!71913 () Bool)

(declare-fun lt!167173 () (_ BitVec 32))

(assert (=> d!71913 (and (bvsge lt!167173 #b00000000000000000000000000000000) (bvsle lt!167173 (bvsub (size!10107 a!4337) (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> d!71913 (= lt!167173 e!222264)))

(declare-fun c!53742 () Bool)

(assert (=> d!71913 (= c!53742 (bvsge (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!71913 (and (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10107 a!4337)))))

(assert (=> d!71913 (= (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)) lt!167173)))

(declare-fun b!362996 () Bool)

(assert (=> b!362996 (= e!222264 #b00000000000000000000000000000000)))

(declare-fun b!362997 () Bool)

(assert (=> b!362997 (= e!222265 (bvadd #b00000000000000000000000000000001 call!27208))))

(assert (= (and d!71913 c!53742) b!362996))

(assert (= (and d!71913 (not c!53742)) b!362995))

(assert (= (and b!362995 c!53741) b!362997))

(assert (= (and b!362995 (not c!53741)) b!362994))

(assert (= (or b!362997 b!362994) bm!27205))

(declare-fun m!359449 () Bool)

(assert (=> b!362995 m!359449))

(assert (=> b!362995 m!359449))

(declare-fun m!359451 () Bool)

(assert (=> b!362995 m!359451))

(declare-fun m!359453 () Bool)

(assert (=> bm!27205 m!359453))

(assert (=> b!362942 d!71913))

(declare-fun b!362998 () Bool)

(declare-fun e!222267 () (_ BitVec 32))

(declare-fun call!27209 () (_ BitVec 32))

(assert (=> b!362998 (= e!222267 call!27209)))

(declare-fun b!362999 () Bool)

(declare-fun e!222266 () (_ BitVec 32))

(assert (=> b!362999 (= e!222266 e!222267)))

(declare-fun c!53743 () Bool)

(assert (=> b!362999 (= c!53743 (validKeyInArray!0 (select (arr!9754 lt!167154) #b00000000000000000000000000000000)))))

(declare-fun bm!27206 () Bool)

(assert (=> bm!27206 (= call!27209 (arrayCountValidKeys!0 lt!167154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun d!71915 () Bool)

(declare-fun lt!167174 () (_ BitVec 32))

(assert (=> d!71915 (and (bvsge lt!167174 #b00000000000000000000000000000000) (bvsle lt!167174 (bvsub (size!10107 lt!167154) #b00000000000000000000000000000000)))))

(assert (=> d!71915 (= lt!167174 e!222266)))

(declare-fun c!53744 () Bool)

(assert (=> d!71915 (= c!53744 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!71915 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10107 lt!167154)))))

(assert (=> d!71915 (= (arrayCountValidKeys!0 lt!167154 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) lt!167174)))

(declare-fun b!363000 () Bool)

(assert (=> b!363000 (= e!222266 #b00000000000000000000000000000000)))

(declare-fun b!363001 () Bool)

(assert (=> b!363001 (= e!222267 (bvadd #b00000000000000000000000000000001 call!27209))))

(assert (= (and d!71915 c!53744) b!363000))

(assert (= (and d!71915 (not c!53744)) b!362999))

(assert (= (and b!362999 c!53743) b!363001))

(assert (= (and b!362999 (not c!53743)) b!362998))

(assert (= (or b!363001 b!362998) bm!27206))

(declare-fun m!359455 () Bool)

(assert (=> b!362999 m!359455))

(assert (=> b!362999 m!359455))

(declare-fun m!359457 () Bool)

(assert (=> b!362999 m!359457))

(declare-fun m!359459 () Bool)

(assert (=> bm!27206 m!359459))

(assert (=> b!362943 d!71915))

(declare-fun b!363004 () Bool)

(declare-fun e!222271 () (_ BitVec 32))

(declare-fun call!27211 () (_ BitVec 32))

(assert (=> b!363004 (= e!222271 call!27211)))

(declare-fun b!363006 () Bool)

(declare-fun e!222269 () (_ BitVec 32))

(assert (=> b!363006 (= e!222269 e!222271)))

(declare-fun c!53746 () Bool)

(assert (=> b!363006 (= c!53746 (validKeyInArray!0 (select (arr!9754 a!4337) #b00000000000000000000000000000000)))))

(declare-fun bm!27208 () Bool)

(assert (=> bm!27208 (= call!27211 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun d!71917 () Bool)

(declare-fun lt!167176 () (_ BitVec 32))

(assert (=> d!71917 (and (bvsge lt!167176 #b00000000000000000000000000000000) (bvsle lt!167176 (bvsub (size!10107 a!4337) #b00000000000000000000000000000000)))))

(assert (=> d!71917 (= lt!167176 e!222269)))

(declare-fun c!53747 () Bool)

(assert (=> d!71917 (= c!53747 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!71917 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10107 a!4337)))))

(assert (=> d!71917 (= (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) lt!167176)))

(declare-fun b!363008 () Bool)

(assert (=> b!363008 (= e!222269 #b00000000000000000000000000000000)))

(declare-fun b!363009 () Bool)

(assert (=> b!363009 (= e!222271 (bvadd #b00000000000000000000000000000001 call!27211))))

(assert (= (and d!71917 c!53747) b!363008))

(assert (= (and d!71917 (not c!53747)) b!363006))

(assert (= (and b!363006 c!53746) b!363009))

(assert (= (and b!363006 (not c!53746)) b!363004))

(assert (= (or b!363009 b!363004) bm!27208))

(declare-fun m!359467 () Bool)

(assert (=> b!363006 m!359467))

(assert (=> b!363006 m!359467))

(declare-fun m!359469 () Bool)

(assert (=> b!363006 m!359469))

(declare-fun m!359471 () Bool)

(assert (=> bm!27208 m!359471))

(assert (=> b!362943 d!71917))

(declare-fun d!71921 () Bool)

(declare-fun e!222281 () Bool)

(assert (=> d!71921 e!222281))

(declare-fun res!202354 () Bool)

(assert (=> d!71921 (=> (not res!202354) (not e!222281))))

(assert (=> d!71921 (= res!202354 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10107 a!4337))))))

(declare-fun lt!167184 () Unit!11192)

(declare-fun choose!19 (array!20547 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11192)

(assert (=> d!71921 (= lt!167184 (choose!19 a!4337 i!1478 k0!2980 i!1478))))

(assert (=> d!71921 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10107 a!4337)))))

(assert (=> d!71921 (= (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478) lt!167184)))

(declare-fun b!363023 () Bool)

(assert (=> b!363023 (= e!222281 (= (arrayCountValidKeys!0 (array!20548 (store (arr!9754 a!4337) i!1478 k0!2980) (size!10107 a!4337)) #b00000000000000000000000000000000 (bvadd i!1478 #b00000000000000000000000000000001)) (bvadd (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd i!1478 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(assert (= (and d!71921 res!202354) b!363023))

(declare-fun m!359491 () Bool)

(assert (=> d!71921 m!359491))

(assert (=> b!363023 m!359387))

(declare-fun m!359493 () Bool)

(assert (=> b!363023 m!359493))

(declare-fun m!359495 () Bool)

(assert (=> b!363023 m!359495))

(assert (=> b!362943 d!71921))

(declare-fun d!71937 () Bool)

(assert (=> d!71937 (= (validKeyInArray!0 (select (arr!9754 a!4337) i!1478)) (and (not (= (select (arr!9754 a!4337) i!1478) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!9754 a!4337) i!1478) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!362939 d!71937))

(check-sat (not b!362983) (not b!363023) (not bm!27208) (not b!362999) (not b!363006) (not b!362995) (not d!71921) (not bm!27202) (not bm!27205) (not bm!27206))
(check-sat)
