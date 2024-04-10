; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36264 () Bool)

(assert start!36264)

(declare-fun res!202443 () Bool)

(declare-fun e!222409 () Bool)

(assert (=> start!36264 (=> (not res!202443) (not e!222409))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20565 0))(
  ( (array!20566 (arr!9763 (Array (_ BitVec 32) (_ BitVec 64))) (size!10115 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20565)

(assert (=> start!36264 (= res!202443 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10115 a!4337))))))

(assert (=> start!36264 e!222409))

(assert (=> start!36264 true))

(declare-fun array_inv!7205 (array!20565) Bool)

(assert (=> start!36264 (array_inv!7205 a!4337)))

(declare-fun b!363210 () Bool)

(declare-fun res!202447 () Bool)

(assert (=> b!363210 (=> (not res!202447) (not e!222409))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363210 (= res!202447 (not (validKeyInArray!0 (select (arr!9763 a!4337) i!1478))))))

(declare-fun b!363211 () Bool)

(declare-fun res!202446 () Bool)

(assert (=> b!363211 (=> (not res!202446) (not e!222409))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!363211 (= res!202446 (validKeyInArray!0 k!2980))))

(declare-fun b!363212 () Bool)

(declare-fun e!222408 () Bool)

(assert (=> b!363212 (= e!222409 (not e!222408))))

(declare-fun res!202445 () Bool)

(assert (=> b!363212 (=> res!202445 e!222408)))

(assert (=> b!363212 (= res!202445 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(declare-fun lt!167388 () array!20565)

(declare-fun arrayCountValidKeys!0 (array!20565 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363212 (= (arrayCountValidKeys!0 lt!167388 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> b!363212 (= lt!167388 (array!20566 (store (arr!9763 a!4337) i!1478 k!2980) (size!10115 a!4337)))))

(declare-datatypes ((Unit!11214 0))(
  ( (Unit!11215) )
))
(declare-fun lt!167389 () Unit!11214)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20565 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11214)

(assert (=> b!363212 (= lt!167389 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!363213 () Bool)

(declare-fun res!202444 () Bool)

(assert (=> b!363213 (=> (not res!202444) (not e!222409))))

(assert (=> b!363213 (= res!202444 (bvslt (size!10115 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363214 () Bool)

(assert (=> b!363214 (= e!222408 (= (arrayCountValidKeys!0 lt!167388 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)) (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (= (and start!36264 res!202443) b!363210))

(assert (= (and b!363210 res!202447) b!363211))

(assert (= (and b!363211 res!202446) b!363213))

(assert (= (and b!363213 res!202444) b!363212))

(assert (= (and b!363212 (not res!202445)) b!363214))

(declare-fun m!360107 () Bool)

(assert (=> b!363212 m!360107))

(declare-fun m!360109 () Bool)

(assert (=> b!363212 m!360109))

(declare-fun m!360111 () Bool)

(assert (=> b!363212 m!360111))

(declare-fun m!360113 () Bool)

(assert (=> b!363212 m!360113))

(declare-fun m!360115 () Bool)

(assert (=> b!363214 m!360115))

(declare-fun m!360117 () Bool)

(assert (=> b!363214 m!360117))

(declare-fun m!360119 () Bool)

(assert (=> b!363210 m!360119))

(assert (=> b!363210 m!360119))

(declare-fun m!360121 () Bool)

(assert (=> b!363210 m!360121))

(declare-fun m!360123 () Bool)

(assert (=> start!36264 m!360123))

(declare-fun m!360125 () Bool)

(assert (=> b!363211 m!360125))

(push 1)

(assert (not b!363210))

(assert (not b!363214))

(assert (not start!36264))

(assert (not b!363212))

(assert (not b!363211))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!72111 () Bool)

(declare-fun lt!167407 () (_ BitVec 32))

(assert (=> d!72111 (and (bvsge lt!167407 #b00000000000000000000000000000000) (bvsle lt!167407 (bvsub (size!10115 lt!167388) #b00000000000000000000000000000000)))))

(declare-fun e!222439 () (_ BitVec 32))

(assert (=> d!72111 (= lt!167407 e!222439)))

(declare-fun c!53812 () Bool)

(assert (=> d!72111 (= c!53812 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72111 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10115 lt!167388)))))

(assert (=> d!72111 (= (arrayCountValidKeys!0 lt!167388 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) lt!167407)))

(declare-fun b!363265 () Bool)

(declare-fun e!222438 () (_ BitVec 32))

(declare-fun call!27233 () (_ BitVec 32))

(assert (=> b!363265 (= e!222438 (bvadd #b00000000000000000000000000000001 call!27233))))

(declare-fun b!363266 () Bool)

(assert (=> b!363266 (= e!222439 #b00000000000000000000000000000000)))

(declare-fun b!363267 () Bool)

(assert (=> b!363267 (= e!222438 call!27233)))

(declare-fun bm!27230 () Bool)

(assert (=> bm!27230 (= call!27233 (arrayCountValidKeys!0 lt!167388 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363268 () Bool)

(assert (=> b!363268 (= e!222439 e!222438)))

(declare-fun c!53813 () Bool)

(assert (=> b!363268 (= c!53813 (validKeyInArray!0 (select (arr!9763 lt!167388) #b00000000000000000000000000000000)))))

(assert (= (and d!72111 c!53812) b!363266))

(assert (= (and d!72111 (not c!53812)) b!363268))

(assert (= (and b!363268 c!53813) b!363265))

(assert (= (and b!363268 (not c!53813)) b!363267))

(assert (= (or b!363265 b!363267) bm!27230))

(declare-fun m!360173 () Bool)

(assert (=> bm!27230 m!360173))

(declare-fun m!360175 () Bool)

(assert (=> b!363268 m!360175))

(assert (=> b!363268 m!360175))

(declare-fun m!360177 () Bool)

(assert (=> b!363268 m!360177))

(assert (=> b!363212 d!72111))

(declare-fun d!72121 () Bool)

(declare-fun lt!167409 () (_ BitVec 32))

(assert (=> d!72121 (and (bvsge lt!167409 #b00000000000000000000000000000000) (bvsle lt!167409 (bvsub (size!10115 a!4337) #b00000000000000000000000000000000)))))

(declare-fun e!222443 () (_ BitVec 32))

(assert (=> d!72121 (= lt!167409 e!222443)))

(declare-fun c!53816 () Bool)

(assert (=> d!72121 (= c!53816 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72121 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10115 a!4337)))))

(assert (=> d!72121 (= (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) lt!167409)))

(declare-fun b!363273 () Bool)

(declare-fun e!222442 () (_ BitVec 32))

(declare-fun call!27235 () (_ BitVec 32))

(assert (=> b!363273 (= e!222442 (bvadd #b00000000000000000000000000000001 call!27235))))

(declare-fun b!363274 () Bool)

(assert (=> b!363274 (= e!222443 #b00000000000000000000000000000000)))

(declare-fun b!363275 () Bool)

(assert (=> b!363275 (= e!222442 call!27235)))

(declare-fun bm!27232 () Bool)

(assert (=> bm!27232 (= call!27235 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363276 () Bool)

(assert (=> b!363276 (= e!222443 e!222442)))

(declare-fun c!53817 () Bool)

(assert (=> b!363276 (= c!53817 (validKeyInArray!0 (select (arr!9763 a!4337) #b00000000000000000000000000000000)))))

(assert (= (and d!72121 c!53816) b!363274))

(assert (= (and d!72121 (not c!53816)) b!363276))

(assert (= (and b!363276 c!53817) b!363273))

(assert (= (and b!363276 (not c!53817)) b!363275))

(assert (= (or b!363273 b!363275) bm!27232))

(declare-fun m!360185 () Bool)

(assert (=> bm!27232 m!360185))

(declare-fun m!360187 () Bool)

(assert (=> b!363276 m!360187))

(assert (=> b!363276 m!360187))

(declare-fun m!360189 () Bool)

(assert (=> b!363276 m!360189))

(assert (=> b!363212 d!72121))

(declare-fun d!72125 () Bool)

(declare-fun e!222448 () Bool)

(assert (=> d!72125 e!222448))

(declare-fun res!202482 () Bool)

(assert (=> d!72125 (=> (not res!202482) (not e!222448))))

(assert (=> d!72125 (= res!202482 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10115 a!4337))))))

(declare-fun lt!167414 () Unit!11214)

(declare-fun choose!19 (array!20565 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11214)

(assert (=> d!72125 (= lt!167414 (choose!19 a!4337 i!1478 k!2980 i!1478))))

(assert (=> d!72125 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10115 a!4337)))))

(assert (=> d!72125 (= (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478) lt!167414)))

(declare-fun b!363281 () Bool)

(assert (=> b!363281 (= e!222448 (= (arrayCountValidKeys!0 (array!20566 (store (arr!9763 a!4337) i!1478 k!2980) (size!10115 a!4337)) #b00000000000000000000000000000000 (bvadd i!1478 #b00000000000000000000000000000001)) (bvadd (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd i!1478 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(assert (= (and d!72125 res!202482) b!363281))

(declare-fun m!360191 () Bool)

(assert (=> d!72125 m!360191))

(assert (=> b!363281 m!360111))

(declare-fun m!360193 () Bool)

(assert (=> b!363281 m!360193))

(declare-fun m!360195 () Bool)

(assert (=> b!363281 m!360195))

(assert (=> b!363212 d!72125))

(declare-fun d!72135 () Bool)

(assert (=> d!72135 (= (array_inv!7205 a!4337) (bvsge (size!10115 a!4337) #b00000000000000000000000000000000))))

(assert (=> start!36264 d!72135))

(declare-fun d!72139 () Bool)

(assert (=> d!72139 (= (validKeyInArray!0 k!2980) (and (not (= k!2980 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2980 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!363211 d!72139))

(declare-fun d!72143 () Bool)

(assert (=> d!72143 (= (validKeyInArray!0 (select (arr!9763 a!4337) i!1478)) (and (not (= (select (arr!9763 a!4337) i!1478) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!9763 a!4337) i!1478) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!363210 d!72143))

(declare-fun d!72145 () Bool)

(declare-fun lt!167418 () (_ BitVec 32))

(assert (=> d!72145 (and (bvsge lt!167418 #b00000000000000000000000000000000) (bvsle lt!167418 (bvsub (size!10115 lt!167388) (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun e!222455 () (_ BitVec 32))

(assert (=> d!72145 (= lt!167418 e!222455)))

(declare-fun c!53822 () Bool)

(assert (=> d!72145 (= c!53822 (bvsge (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72145 (and (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10115 lt!167388)))))

(assert (=> d!72145 (= (arrayCountValidKeys!0 lt!167388 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)) lt!167418)))

(declare-fun b!363291 () Bool)

(declare-fun e!222454 () (_ BitVec 32))

(declare-fun call!27238 () (_ BitVec 32))

(assert (=> b!363291 (= e!222454 (bvadd #b00000000000000000000000000000001 call!27238))))

(declare-fun b!363292 () Bool)

(assert (=> b!363292 (= e!222455 #b00000000000000000000000000000000)))

(declare-fun b!363293 () Bool)

(assert (=> b!363293 (= e!222454 call!27238)))

(declare-fun bm!27235 () Bool)

(assert (=> bm!27235 (= call!27238 (arrayCountValidKeys!0 lt!167388 (bvadd #b00000000000000000000000000000001 i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363294 () Bool)

(assert (=> b!363294 (= e!222455 e!222454)))

(declare-fun c!53823 () Bool)

(assert (=> b!363294 (= c!53823 (validKeyInArray!0 (select (arr!9763 lt!167388) (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (= (and d!72145 c!53822) b!363292))

(assert (= (and d!72145 (not c!53822)) b!363294))

(assert (= (and b!363294 c!53823) b!363291))

(assert (= (and b!363294 (not c!53823)) b!363293))

(assert (= (or b!363291 b!363293) bm!27235))

(declare-fun m!360215 () Bool)

(assert (=> bm!27235 m!360215))

(declare-fun m!360217 () Bool)

(assert (=> b!363294 m!360217))

(assert (=> b!363294 m!360217))

(declare-fun m!360219 () Bool)

(assert (=> b!363294 m!360219))

(assert (=> b!363214 d!72145))

(declare-fun d!72147 () Bool)

(declare-fun lt!167419 () (_ BitVec 32))

(assert (=> d!72147 (and (bvsge lt!167419 #b00000000000000000000000000000000) (bvsle lt!167419 (bvsub (size!10115 a!4337) (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun e!222457 () (_ BitVec 32))

(assert (=> d!72147 (= lt!167419 e!222457)))

(declare-fun c!53824 () Bool)

(assert (=> d!72147 (= c!53824 (bvsge (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72147 (and (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10115 a!4337)))))

(assert (=> d!72147 (= (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)) lt!167419)))

(declare-fun b!363295 () Bool)

(declare-fun e!222456 () (_ BitVec 32))

(declare-fun call!27239 () (_ BitVec 32))

(assert (=> b!363295 (= e!222456 (bvadd #b00000000000000000000000000000001 call!27239))))

(declare-fun b!363296 () Bool)

(assert (=> b!363296 (= e!222457 #b00000000000000000000000000000000)))

(declare-fun b!363297 () Bool)

(assert (=> b!363297 (= e!222456 call!27239)))

(declare-fun bm!27236 () Bool)

(assert (=> bm!27236 (= call!27239 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363298 () Bool)

(assert (=> b!363298 (= e!222457 e!222456)))

(declare-fun c!53825 () Bool)

(assert (=> b!363298 (= c!53825 (validKeyInArray!0 (select (arr!9763 a!4337) (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (= (and d!72147 c!53824) b!363296))

(assert (= (and d!72147 (not c!53824)) b!363298))

(assert (= (and b!363298 c!53825) b!363295))

(assert (= (and b!363298 (not c!53825)) b!363297))

(assert (= (or b!363295 b!363297) bm!27236))

(declare-fun m!360221 () Bool)

(assert (=> bm!27236 m!360221))

(declare-fun m!360223 () Bool)

(assert (=> b!363298 m!360223))

(assert (=> b!363298 m!360223))

(declare-fun m!360225 () Bool)

(assert (=> b!363298 m!360225))

(assert (=> b!363214 d!72147))

(push 1)

