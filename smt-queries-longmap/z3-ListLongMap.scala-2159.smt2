; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36250 () Bool)

(assert start!36250)

(declare-fun b!363161 () Bool)

(declare-fun res!202442 () Bool)

(declare-fun e!222375 () Bool)

(assert (=> b!363161 (=> (not res!202442) (not e!222375))))

(declare-fun k0!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363161 (= res!202442 (validKeyInArray!0 k0!2980))))

(declare-fun b!363162 () Bool)

(declare-fun res!202444 () Bool)

(assert (=> b!363162 (=> (not res!202444) (not e!222375))))

(declare-datatypes ((array!20546 0))(
  ( (array!20547 (arr!9753 (Array (_ BitVec 32) (_ BitVec 64))) (size!10105 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20546)

(assert (=> b!363162 (= res!202444 (bvslt (size!10105 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363163 () Bool)

(declare-fun e!222376 () Bool)

(assert (=> b!363163 (= e!222375 (not e!222376))))

(declare-fun res!202440 () Bool)

(assert (=> b!363163 (=> res!202440 e!222376)))

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!363163 (= res!202440 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(declare-fun lt!167408 () array!20546)

(declare-fun arrayCountValidKeys!0 (array!20546 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363163 (= (arrayCountValidKeys!0 lt!167408 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> b!363163 (= lt!167408 (array!20547 (store (arr!9753 a!4337) i!1478 k0!2980) (size!10105 a!4337)))))

(declare-datatypes ((Unit!11203 0))(
  ( (Unit!11204) )
))
(declare-fun lt!167407 () Unit!11203)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20546 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11203)

(assert (=> b!363163 (= lt!167407 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(declare-fun b!363164 () Bool)

(declare-fun res!202443 () Bool)

(assert (=> b!363164 (=> (not res!202443) (not e!222375))))

(assert (=> b!363164 (= res!202443 (not (validKeyInArray!0 (select (arr!9753 a!4337) i!1478))))))

(declare-fun res!202441 () Bool)

(assert (=> start!36250 (=> (not res!202441) (not e!222375))))

(assert (=> start!36250 (= res!202441 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10105 a!4337))))))

(assert (=> start!36250 e!222375))

(assert (=> start!36250 true))

(declare-fun array_inv!7225 (array!20546) Bool)

(assert (=> start!36250 (array_inv!7225 a!4337)))

(declare-fun b!363165 () Bool)

(assert (=> b!363165 (= e!222376 (= (arrayCountValidKeys!0 lt!167408 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)) (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (= (and start!36250 res!202441) b!363164))

(assert (= (and b!363164 res!202443) b!363161))

(assert (= (and b!363161 res!202442) b!363162))

(assert (= (and b!363162 res!202444) b!363163))

(assert (= (and b!363163 (not res!202440)) b!363165))

(declare-fun m!360337 () Bool)

(assert (=> b!363165 m!360337))

(declare-fun m!360339 () Bool)

(assert (=> b!363165 m!360339))

(declare-fun m!360341 () Bool)

(assert (=> b!363163 m!360341))

(declare-fun m!360343 () Bool)

(assert (=> b!363163 m!360343))

(declare-fun m!360345 () Bool)

(assert (=> b!363163 m!360345))

(declare-fun m!360347 () Bool)

(assert (=> b!363163 m!360347))

(declare-fun m!360349 () Bool)

(assert (=> start!36250 m!360349))

(declare-fun m!360351 () Bool)

(assert (=> b!363164 m!360351))

(assert (=> b!363164 m!360351))

(declare-fun m!360353 () Bool)

(assert (=> b!363164 m!360353))

(declare-fun m!360355 () Bool)

(assert (=> b!363161 m!360355))

(check-sat (not b!363164) (not start!36250) (not b!363163) (not b!363165) (not b!363161))
(check-sat)
(get-model)

(declare-fun d!72139 () Bool)

(assert (=> d!72139 (= (validKeyInArray!0 (select (arr!9753 a!4337) i!1478)) (and (not (= (select (arr!9753 a!4337) i!1478) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!9753 a!4337) i!1478) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!363164 d!72139))

(declare-fun d!72141 () Bool)

(declare-fun lt!167423 () (_ BitVec 32))

(assert (=> d!72141 (and (bvsge lt!167423 #b00000000000000000000000000000000) (bvsle lt!167423 (bvsub (size!10105 lt!167408) (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun e!222401 () (_ BitVec 32))

(assert (=> d!72141 (= lt!167423 e!222401)))

(declare-fun c!53783 () Bool)

(assert (=> d!72141 (= c!53783 (bvsge (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72141 (and (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10105 lt!167408)))))

(assert (=> d!72141 (= (arrayCountValidKeys!0 lt!167408 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)) lt!167423)))

(declare-fun b!363204 () Bool)

(declare-fun e!222400 () (_ BitVec 32))

(assert (=> b!363204 (= e!222401 e!222400)))

(declare-fun c!53784 () Bool)

(assert (=> b!363204 (= c!53784 (validKeyInArray!0 (select (arr!9753 lt!167408) (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun b!363205 () Bool)

(assert (=> b!363205 (= e!222401 #b00000000000000000000000000000000)))

(declare-fun b!363206 () Bool)

(declare-fun call!27217 () (_ BitVec 32))

(assert (=> b!363206 (= e!222400 call!27217)))

(declare-fun bm!27214 () Bool)

(assert (=> bm!27214 (= call!27217 (arrayCountValidKeys!0 lt!167408 (bvadd #b00000000000000000000000000000001 i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363207 () Bool)

(assert (=> b!363207 (= e!222400 (bvadd #b00000000000000000000000000000001 call!27217))))

(assert (= (and d!72141 c!53783) b!363205))

(assert (= (and d!72141 (not c!53783)) b!363204))

(assert (= (and b!363204 c!53784) b!363207))

(assert (= (and b!363204 (not c!53784)) b!363206))

(assert (= (or b!363207 b!363206) bm!27214))

(declare-fun m!360397 () Bool)

(assert (=> b!363204 m!360397))

(assert (=> b!363204 m!360397))

(declare-fun m!360399 () Bool)

(assert (=> b!363204 m!360399))

(declare-fun m!360401 () Bool)

(assert (=> bm!27214 m!360401))

(assert (=> b!363165 d!72141))

(declare-fun d!72143 () Bool)

(declare-fun lt!167424 () (_ BitVec 32))

(assert (=> d!72143 (and (bvsge lt!167424 #b00000000000000000000000000000000) (bvsle lt!167424 (bvsub (size!10105 a!4337) (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun e!222403 () (_ BitVec 32))

(assert (=> d!72143 (= lt!167424 e!222403)))

(declare-fun c!53785 () Bool)

(assert (=> d!72143 (= c!53785 (bvsge (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72143 (and (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10105 a!4337)))))

(assert (=> d!72143 (= (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)) lt!167424)))

(declare-fun b!363208 () Bool)

(declare-fun e!222402 () (_ BitVec 32))

(assert (=> b!363208 (= e!222403 e!222402)))

(declare-fun c!53786 () Bool)

(assert (=> b!363208 (= c!53786 (validKeyInArray!0 (select (arr!9753 a!4337) (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun b!363209 () Bool)

(assert (=> b!363209 (= e!222403 #b00000000000000000000000000000000)))

(declare-fun b!363210 () Bool)

(declare-fun call!27218 () (_ BitVec 32))

(assert (=> b!363210 (= e!222402 call!27218)))

(declare-fun bm!27215 () Bool)

(assert (=> bm!27215 (= call!27218 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363211 () Bool)

(assert (=> b!363211 (= e!222402 (bvadd #b00000000000000000000000000000001 call!27218))))

(assert (= (and d!72143 c!53785) b!363209))

(assert (= (and d!72143 (not c!53785)) b!363208))

(assert (= (and b!363208 c!53786) b!363211))

(assert (= (and b!363208 (not c!53786)) b!363210))

(assert (= (or b!363211 b!363210) bm!27215))

(declare-fun m!360403 () Bool)

(assert (=> b!363208 m!360403))

(assert (=> b!363208 m!360403))

(declare-fun m!360405 () Bool)

(assert (=> b!363208 m!360405))

(declare-fun m!360407 () Bool)

(assert (=> bm!27215 m!360407))

(assert (=> b!363165 d!72143))

(declare-fun d!72145 () Bool)

(assert (=> d!72145 (= (validKeyInArray!0 k0!2980) (and (not (= k0!2980 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2980 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!363161 d!72145))

(declare-fun d!72147 () Bool)

(declare-fun lt!167425 () (_ BitVec 32))

(assert (=> d!72147 (and (bvsge lt!167425 #b00000000000000000000000000000000) (bvsle lt!167425 (bvsub (size!10105 lt!167408) #b00000000000000000000000000000000)))))

(declare-fun e!222405 () (_ BitVec 32))

(assert (=> d!72147 (= lt!167425 e!222405)))

(declare-fun c!53787 () Bool)

(assert (=> d!72147 (= c!53787 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72147 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10105 lt!167408)))))

(assert (=> d!72147 (= (arrayCountValidKeys!0 lt!167408 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) lt!167425)))

(declare-fun b!363212 () Bool)

(declare-fun e!222404 () (_ BitVec 32))

(assert (=> b!363212 (= e!222405 e!222404)))

(declare-fun c!53788 () Bool)

(assert (=> b!363212 (= c!53788 (validKeyInArray!0 (select (arr!9753 lt!167408) #b00000000000000000000000000000000)))))

(declare-fun b!363213 () Bool)

(assert (=> b!363213 (= e!222405 #b00000000000000000000000000000000)))

(declare-fun b!363214 () Bool)

(declare-fun call!27219 () (_ BitVec 32))

(assert (=> b!363214 (= e!222404 call!27219)))

(declare-fun bm!27216 () Bool)

(assert (=> bm!27216 (= call!27219 (arrayCountValidKeys!0 lt!167408 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363215 () Bool)

(assert (=> b!363215 (= e!222404 (bvadd #b00000000000000000000000000000001 call!27219))))

(assert (= (and d!72147 c!53787) b!363213))

(assert (= (and d!72147 (not c!53787)) b!363212))

(assert (= (and b!363212 c!53788) b!363215))

(assert (= (and b!363212 (not c!53788)) b!363214))

(assert (= (or b!363215 b!363214) bm!27216))

(declare-fun m!360409 () Bool)

(assert (=> b!363212 m!360409))

(assert (=> b!363212 m!360409))

(declare-fun m!360411 () Bool)

(assert (=> b!363212 m!360411))

(declare-fun m!360413 () Bool)

(assert (=> bm!27216 m!360413))

(assert (=> b!363163 d!72147))

(declare-fun d!72149 () Bool)

(declare-fun lt!167426 () (_ BitVec 32))

(assert (=> d!72149 (and (bvsge lt!167426 #b00000000000000000000000000000000) (bvsle lt!167426 (bvsub (size!10105 a!4337) #b00000000000000000000000000000000)))))

(declare-fun e!222407 () (_ BitVec 32))

(assert (=> d!72149 (= lt!167426 e!222407)))

(declare-fun c!53789 () Bool)

(assert (=> d!72149 (= c!53789 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72149 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10105 a!4337)))))

(assert (=> d!72149 (= (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) lt!167426)))

(declare-fun b!363216 () Bool)

(declare-fun e!222406 () (_ BitVec 32))

(assert (=> b!363216 (= e!222407 e!222406)))

(declare-fun c!53790 () Bool)

(assert (=> b!363216 (= c!53790 (validKeyInArray!0 (select (arr!9753 a!4337) #b00000000000000000000000000000000)))))

(declare-fun b!363217 () Bool)

(assert (=> b!363217 (= e!222407 #b00000000000000000000000000000000)))

(declare-fun b!363218 () Bool)

(declare-fun call!27220 () (_ BitVec 32))

(assert (=> b!363218 (= e!222406 call!27220)))

(declare-fun bm!27217 () Bool)

(assert (=> bm!27217 (= call!27220 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363219 () Bool)

(assert (=> b!363219 (= e!222406 (bvadd #b00000000000000000000000000000001 call!27220))))

(assert (= (and d!72149 c!53789) b!363217))

(assert (= (and d!72149 (not c!53789)) b!363216))

(assert (= (and b!363216 c!53790) b!363219))

(assert (= (and b!363216 (not c!53790)) b!363218))

(assert (= (or b!363219 b!363218) bm!27217))

(declare-fun m!360415 () Bool)

(assert (=> b!363216 m!360415))

(assert (=> b!363216 m!360415))

(declare-fun m!360417 () Bool)

(assert (=> b!363216 m!360417))

(declare-fun m!360419 () Bool)

(assert (=> bm!27217 m!360419))

(assert (=> b!363163 d!72149))

(declare-fun d!72151 () Bool)

(declare-fun e!222418 () Bool)

(assert (=> d!72151 e!222418))

(declare-fun res!202477 () Bool)

(assert (=> d!72151 (=> (not res!202477) (not e!222418))))

(assert (=> d!72151 (= res!202477 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10105 a!4337))))))

(declare-fun lt!167433 () Unit!11203)

(declare-fun choose!19 (array!20546 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11203)

(assert (=> d!72151 (= lt!167433 (choose!19 a!4337 i!1478 k0!2980 i!1478))))

(assert (=> d!72151 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10105 a!4337)))))

(assert (=> d!72151 (= (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478) lt!167433)))

(declare-fun b!363238 () Bool)

(assert (=> b!363238 (= e!222418 (= (arrayCountValidKeys!0 (array!20547 (store (arr!9753 a!4337) i!1478 k0!2980) (size!10105 a!4337)) #b00000000000000000000000000000000 (bvadd i!1478 #b00000000000000000000000000000001)) (bvadd (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd i!1478 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(assert (= (and d!72151 res!202477) b!363238))

(declare-fun m!360421 () Bool)

(assert (=> d!72151 m!360421))

(assert (=> b!363238 m!360345))

(declare-fun m!360423 () Bool)

(assert (=> b!363238 m!360423))

(declare-fun m!360425 () Bool)

(assert (=> b!363238 m!360425))

(assert (=> b!363163 d!72151))

(declare-fun d!72163 () Bool)

(assert (=> d!72163 (= (array_inv!7225 a!4337) (bvsge (size!10105 a!4337) #b00000000000000000000000000000000))))

(assert (=> start!36250 d!72163))

(check-sat (not b!363216) (not bm!27217) (not bm!27216) (not b!363238) (not b!363212) (not bm!27215) (not d!72151) (not b!363208) (not b!363204) (not bm!27214))
(check-sat)
