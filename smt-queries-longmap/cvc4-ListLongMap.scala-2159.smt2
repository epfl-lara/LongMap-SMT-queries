; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36268 () Bool)

(assert start!36268)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun e!222425 () Bool)

(declare-fun b!363240 () Bool)

(declare-datatypes ((array!20569 0))(
  ( (array!20570 (arr!9765 (Array (_ BitVec 32) (_ BitVec 64))) (size!10117 (_ BitVec 32))) )
))
(declare-fun lt!167401 () array!20569)

(declare-fun a!4337 () array!20569)

(declare-fun arrayCountValidKeys!0 (array!20569 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363240 (= e!222425 (= (arrayCountValidKeys!0 lt!167401 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)) (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun b!363241 () Bool)

(declare-fun e!222426 () Bool)

(assert (=> b!363241 (= e!222426 (not e!222425))))

(declare-fun res!202473 () Bool)

(assert (=> b!363241 (=> res!202473 e!222425)))

(assert (=> b!363241 (= res!202473 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(assert (=> b!363241 (= (arrayCountValidKeys!0 lt!167401 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!363241 (= lt!167401 (array!20570 (store (arr!9765 a!4337) i!1478 k!2980) (size!10117 a!4337)))))

(declare-datatypes ((Unit!11218 0))(
  ( (Unit!11219) )
))
(declare-fun lt!167400 () Unit!11218)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20569 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11218)

(assert (=> b!363241 (= lt!167400 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!363242 () Bool)

(declare-fun res!202476 () Bool)

(assert (=> b!363242 (=> (not res!202476) (not e!222426))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363242 (= res!202476 (validKeyInArray!0 k!2980))))

(declare-fun b!363243 () Bool)

(declare-fun res!202477 () Bool)

(assert (=> b!363243 (=> (not res!202477) (not e!222426))))

(assert (=> b!363243 (= res!202477 (not (validKeyInArray!0 (select (arr!9765 a!4337) i!1478))))))

(declare-fun b!363244 () Bool)

(declare-fun res!202474 () Bool)

(assert (=> b!363244 (=> (not res!202474) (not e!222426))))

(assert (=> b!363244 (= res!202474 (bvslt (size!10117 a!4337) #b01111111111111111111111111111111))))

(declare-fun res!202475 () Bool)

(assert (=> start!36268 (=> (not res!202475) (not e!222426))))

(assert (=> start!36268 (= res!202475 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10117 a!4337))))))

(assert (=> start!36268 e!222426))

(assert (=> start!36268 true))

(declare-fun array_inv!7207 (array!20569) Bool)

(assert (=> start!36268 (array_inv!7207 a!4337)))

(assert (= (and start!36268 res!202475) b!363243))

(assert (= (and b!363243 res!202477) b!363242))

(assert (= (and b!363242 res!202476) b!363244))

(assert (= (and b!363244 res!202474) b!363241))

(assert (= (and b!363241 (not res!202473)) b!363240))

(declare-fun m!360147 () Bool)

(assert (=> b!363241 m!360147))

(declare-fun m!360149 () Bool)

(assert (=> b!363241 m!360149))

(declare-fun m!360151 () Bool)

(assert (=> b!363241 m!360151))

(declare-fun m!360153 () Bool)

(assert (=> b!363241 m!360153))

(declare-fun m!360155 () Bool)

(assert (=> b!363243 m!360155))

(assert (=> b!363243 m!360155))

(declare-fun m!360157 () Bool)

(assert (=> b!363243 m!360157))

(declare-fun m!360159 () Bool)

(assert (=> start!36268 m!360159))

(declare-fun m!360161 () Bool)

(assert (=> b!363240 m!360161))

(declare-fun m!360163 () Bool)

(assert (=> b!363240 m!360163))

(declare-fun m!360165 () Bool)

(assert (=> b!363242 m!360165))

(push 1)

(assert (not b!363240))

(assert (not b!363243))

(assert (not b!363242))

(assert (not start!36268))

(assert (not b!363241))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!72127 () Bool)

(assert (=> d!72127 (= (validKeyInArray!0 (select (arr!9765 a!4337) i!1478)) (and (not (= (select (arr!9765 a!4337) i!1478) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!9765 a!4337) i!1478) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!363243 d!72127))

(declare-fun d!72129 () Bool)

(assert (=> d!72129 (= (validKeyInArray!0 k!2980) (and (not (= k!2980 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2980 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!363242 d!72129))

(declare-fun d!72131 () Bool)

(assert (=> d!72131 (= (array_inv!7207 a!4337) (bvsge (size!10117 a!4337) #b00000000000000000000000000000000))))

(assert (=> start!36268 d!72131))

(declare-fun b!363307 () Bool)

(declare-fun e!222462 () (_ BitVec 32))

(assert (=> b!363307 (= e!222462 #b00000000000000000000000000000000)))

(declare-fun b!363308 () Bool)

(declare-fun e!222463 () (_ BitVec 32))

(assert (=> b!363308 (= e!222462 e!222463)))

(declare-fun c!53831 () Bool)

(assert (=> b!363308 (= c!53831 (validKeyInArray!0 (select (arr!9765 lt!167401) #b00000000000000000000000000000000)))))

(declare-fun b!363309 () Bool)

(declare-fun call!27242 () (_ BitVec 32))

(assert (=> b!363309 (= e!222463 call!27242)))

(declare-fun d!72133 () Bool)

(declare-fun lt!167422 () (_ BitVec 32))

(assert (=> d!72133 (and (bvsge lt!167422 #b00000000000000000000000000000000) (bvsle lt!167422 (bvsub (size!10117 lt!167401) #b00000000000000000000000000000000)))))

(assert (=> d!72133 (= lt!167422 e!222462)))

(declare-fun c!53830 () Bool)

(assert (=> d!72133 (= c!53830 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72133 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10117 lt!167401)))))

(assert (=> d!72133 (= (arrayCountValidKeys!0 lt!167401 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) lt!167422)))

(declare-fun b!363310 () Bool)

(assert (=> b!363310 (= e!222463 (bvadd #b00000000000000000000000000000001 call!27242))))

(declare-fun bm!27239 () Bool)

(assert (=> bm!27239 (= call!27242 (arrayCountValidKeys!0 lt!167401 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (= (and d!72133 c!53830) b!363307))

(assert (= (and d!72133 (not c!53830)) b!363308))

(assert (= (and b!363308 c!53831) b!363310))

(assert (= (and b!363308 (not c!53831)) b!363309))

(assert (= (or b!363310 b!363309) bm!27239))

(declare-fun m!360227 () Bool)

(assert (=> b!363308 m!360227))

(assert (=> b!363308 m!360227))

(declare-fun m!360229 () Bool)

(assert (=> b!363308 m!360229))

(declare-fun m!360231 () Bool)

(assert (=> bm!27239 m!360231))

(assert (=> b!363241 d!72133))

(declare-fun b!363311 () Bool)

(declare-fun e!222464 () (_ BitVec 32))

(assert (=> b!363311 (= e!222464 #b00000000000000000000000000000000)))

(declare-fun b!363312 () Bool)

(declare-fun e!222465 () (_ BitVec 32))

(assert (=> b!363312 (= e!222464 e!222465)))

(declare-fun c!53833 () Bool)

(assert (=> b!363312 (= c!53833 (validKeyInArray!0 (select (arr!9765 a!4337) #b00000000000000000000000000000000)))))

(declare-fun b!363313 () Bool)

(declare-fun call!27243 () (_ BitVec 32))

(assert (=> b!363313 (= e!222465 call!27243)))

(declare-fun d!72149 () Bool)

(declare-fun lt!167423 () (_ BitVec 32))

(assert (=> d!72149 (and (bvsge lt!167423 #b00000000000000000000000000000000) (bvsle lt!167423 (bvsub (size!10117 a!4337) #b00000000000000000000000000000000)))))

(assert (=> d!72149 (= lt!167423 e!222464)))

(declare-fun c!53832 () Bool)

(assert (=> d!72149 (= c!53832 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72149 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10117 a!4337)))))

(assert (=> d!72149 (= (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) lt!167423)))

(declare-fun b!363314 () Bool)

(assert (=> b!363314 (= e!222465 (bvadd #b00000000000000000000000000000001 call!27243))))

(declare-fun bm!27240 () Bool)

(assert (=> bm!27240 (= call!27243 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (= (and d!72149 c!53832) b!363311))

(assert (= (and d!72149 (not c!53832)) b!363312))

(assert (= (and b!363312 c!53833) b!363314))

(assert (= (and b!363312 (not c!53833)) b!363313))

(assert (= (or b!363314 b!363313) bm!27240))

(declare-fun m!360233 () Bool)

(assert (=> b!363312 m!360233))

(assert (=> b!363312 m!360233))

(declare-fun m!360235 () Bool)

(assert (=> b!363312 m!360235))

(declare-fun m!360237 () Bool)

(assert (=> bm!27240 m!360237))

(assert (=> b!363241 d!72149))

(declare-fun d!72151 () Bool)

(declare-fun e!222468 () Bool)

(assert (=> d!72151 e!222468))

(declare-fun res!202486 () Bool)

(assert (=> d!72151 (=> (not res!202486) (not e!222468))))

(assert (=> d!72151 (= res!202486 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10117 a!4337))))))

(declare-fun lt!167426 () Unit!11218)

(declare-fun choose!19 (array!20569 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11218)

(assert (=> d!72151 (= lt!167426 (choose!19 a!4337 i!1478 k!2980 i!1478))))

(assert (=> d!72151 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10117 a!4337)))))

(assert (=> d!72151 (= (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478) lt!167426)))

(declare-fun b!363317 () Bool)

(assert (=> b!363317 (= e!222468 (= (arrayCountValidKeys!0 (array!20570 (store (arr!9765 a!4337) i!1478 k!2980) (size!10117 a!4337)) #b00000000000000000000000000000000 (bvadd i!1478 #b00000000000000000000000000000001)) (bvadd (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd i!1478 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(assert (= (and d!72151 res!202486) b!363317))

(declare-fun m!360239 () Bool)

(assert (=> d!72151 m!360239))

(assert (=> b!363317 m!360151))

(declare-fun m!360241 () Bool)

(assert (=> b!363317 m!360241))

(declare-fun m!360243 () Bool)

(assert (=> b!363317 m!360243))

(assert (=> b!363241 d!72151))

(declare-fun b!363318 () Bool)

(declare-fun e!222469 () (_ BitVec 32))

