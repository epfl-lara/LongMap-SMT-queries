; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93112 () Bool)

(assert start!93112)

(declare-fun b!1056139 () Bool)

(declare-fun res!704276 () Bool)

(declare-fun e!600193 () Bool)

(assert (=> b!1056139 (=> (not res!704276) (not e!600193))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056139 (= res!704276 (validKeyInArray!0 k!2747))))

(declare-fun b!1056140 () Bool)

(declare-fun res!704280 () Bool)

(assert (=> b!1056140 (=> (not res!704280) (not e!600193))))

(declare-datatypes ((array!66587 0))(
  ( (array!66588 (arr!32019 (Array (_ BitVec 32) (_ BitVec 64))) (size!32556 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66587)

(declare-datatypes ((List!22301 0))(
  ( (Nil!22298) (Cons!22297 (h!23515 (_ BitVec 64)) (t!31600 List!22301)) )
))
(declare-fun arrayNoDuplicates!0 (array!66587 (_ BitVec 32) List!22301) Bool)

(assert (=> b!1056140 (= res!704280 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22298))))

(declare-fun res!704281 () Bool)

(assert (=> start!93112 (=> (not res!704281) (not e!600193))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> start!93112 (= res!704281 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32556 a!3488)) (bvslt (size!32556 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93112 e!600193))

(assert (=> start!93112 true))

(declare-fun array_inv!24801 (array!66587) Bool)

(assert (=> start!93112 (array_inv!24801 a!3488)))

(declare-fun b!1056141 () Bool)

(declare-fun e!600196 () Bool)

(assert (=> b!1056141 (= e!600193 e!600196)))

(declare-fun res!704274 () Bool)

(assert (=> b!1056141 (=> (not res!704274) (not e!600196))))

(declare-fun lt!466091 () array!66587)

(declare-fun arrayContainsKey!0 (array!66587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056141 (= res!704274 (arrayContainsKey!0 lt!466091 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056141 (= lt!466091 (array!66588 (store (arr!32019 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32556 a!3488)))))

(declare-fun b!1056142 () Bool)

(declare-fun res!704282 () Bool)

(assert (=> b!1056142 (=> (not res!704282) (not e!600193))))

(assert (=> b!1056142 (= res!704282 (= (select (arr!32019 a!3488) i!1381) k!2747))))

(declare-fun lt!466089 () (_ BitVec 32))

(declare-fun e!600198 () Bool)

(declare-fun b!1056143 () Bool)

(assert (=> b!1056143 (= e!600198 (arrayContainsKey!0 a!3488 k!2747 lt!466089))))

(declare-fun b!1056144 () Bool)

(declare-fun e!600194 () Bool)

(assert (=> b!1056144 (= e!600194 e!600198)))

(declare-fun res!704275 () Bool)

(assert (=> b!1056144 (=> res!704275 e!600198)))

(assert (=> b!1056144 (= res!704275 (bvsle lt!466089 i!1381))))

(declare-fun b!1056145 () Bool)

(declare-fun e!600197 () Bool)

(assert (=> b!1056145 (= e!600197 (bvslt (bvadd #b00000000000000000000000000000001 i!1381) (size!32556 a!3488)))))

(assert (=> b!1056145 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-datatypes ((Unit!34565 0))(
  ( (Unit!34566) )
))
(declare-fun lt!466090 () Unit!34565)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!66587 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34565)

(assert (=> b!1056145 (= lt!466090 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!466089 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> b!1056145 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22298)))

(declare-fun lt!466088 () Unit!34565)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66587 (_ BitVec 32) (_ BitVec 32)) Unit!34565)

(assert (=> b!1056145 (= lt!466088 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(declare-fun b!1056146 () Bool)

(declare-fun e!600195 () Bool)

(assert (=> b!1056146 (= e!600195 (not e!600197))))

(declare-fun res!704277 () Bool)

(assert (=> b!1056146 (=> res!704277 e!600197)))

(assert (=> b!1056146 (= res!704277 (bvsle lt!466089 i!1381))))

(assert (=> b!1056146 e!600194))

(declare-fun res!704278 () Bool)

(assert (=> b!1056146 (=> (not res!704278) (not e!600194))))

(assert (=> b!1056146 (= res!704278 (= (select (store (arr!32019 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466089) k!2747))))

(declare-fun b!1056147 () Bool)

(assert (=> b!1056147 (= e!600196 e!600195)))

(declare-fun res!704279 () Bool)

(assert (=> b!1056147 (=> (not res!704279) (not e!600195))))

(assert (=> b!1056147 (= res!704279 (not (= lt!466089 i!1381)))))

(declare-fun arrayScanForKey!0 (array!66587 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056147 (= lt!466089 (arrayScanForKey!0 lt!466091 k!2747 #b00000000000000000000000000000000))))

(assert (= (and start!93112 res!704281) b!1056140))

(assert (= (and b!1056140 res!704280) b!1056139))

(assert (= (and b!1056139 res!704276) b!1056142))

(assert (= (and b!1056142 res!704282) b!1056141))

(assert (= (and b!1056141 res!704274) b!1056147))

(assert (= (and b!1056147 res!704279) b!1056146))

(assert (= (and b!1056146 res!704278) b!1056144))

(assert (= (and b!1056144 (not res!704275)) b!1056143))

(assert (= (and b!1056146 (not res!704277)) b!1056145))

(declare-fun m!976533 () Bool)

(assert (=> b!1056141 m!976533))

(declare-fun m!976535 () Bool)

(assert (=> b!1056141 m!976535))

(declare-fun m!976537 () Bool)

(assert (=> b!1056139 m!976537))

(declare-fun m!976539 () Bool)

(assert (=> b!1056140 m!976539))

(declare-fun m!976541 () Bool)

(assert (=> start!93112 m!976541))

(assert (=> b!1056146 m!976535))

(declare-fun m!976543 () Bool)

(assert (=> b!1056146 m!976543))

(declare-fun m!976545 () Bool)

(assert (=> b!1056145 m!976545))

(declare-fun m!976547 () Bool)

(assert (=> b!1056145 m!976547))

(declare-fun m!976549 () Bool)

(assert (=> b!1056145 m!976549))

(declare-fun m!976551 () Bool)

(assert (=> b!1056145 m!976551))

(declare-fun m!976553 () Bool)

(assert (=> b!1056147 m!976553))

(declare-fun m!976555 () Bool)

(assert (=> b!1056143 m!976555))

(declare-fun m!976557 () Bool)

(assert (=> b!1056142 m!976557))

(push 1)

(assert (not b!1056141))

(assert (not b!1056145))

(assert (not b!1056143))

(assert (not b!1056139))

(assert (not b!1056140))

(assert (not b!1056147))

(assert (not start!93112))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!128487 () Bool)

(assert (=> d!128487 (= (validKeyInArray!0 k!2747) (and (not (= k!2747 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2747 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1056139 d!128487))

(declare-fun d!128489 () Bool)

(declare-fun res!704302 () Bool)

(declare-fun e!600222 () Bool)

(assert (=> d!128489 (=> res!704302 e!600222)))

(assert (=> d!128489 (= res!704302 (= (select (arr!32019 a!3488) lt!466089) k!2747))))

(assert (=> d!128489 (= (arrayContainsKey!0 a!3488 k!2747 lt!466089) e!600222)))

(declare-fun b!1056173 () Bool)

(declare-fun e!600223 () Bool)

(assert (=> b!1056173 (= e!600222 e!600223)))

(declare-fun res!704303 () Bool)

(assert (=> b!1056173 (=> (not res!704303) (not e!600223))))

(assert (=> b!1056173 (= res!704303 (bvslt (bvadd lt!466089 #b00000000000000000000000000000001) (size!32556 a!3488)))))

(declare-fun b!1056174 () Bool)

(assert (=> b!1056174 (= e!600223 (arrayContainsKey!0 a!3488 k!2747 (bvadd lt!466089 #b00000000000000000000000000000001)))))

(assert (= (and d!128489 (not res!704302)) b!1056173))

(assert (= (and b!1056173 res!704303) b!1056174))

(declare-fun m!976571 () Bool)

(assert (=> d!128489 m!976571))

(declare-fun m!976573 () Bool)

(assert (=> b!1056174 m!976573))

(assert (=> b!1056143 d!128489))

(declare-fun d!128493 () Bool)

(declare-fun lt!466099 () (_ BitVec 32))

(assert (=> d!128493 (and (or (bvslt lt!466099 #b00000000000000000000000000000000) (bvsge lt!466099 (size!32556 lt!466091)) (and (bvsge lt!466099 #b00000000000000000000000000000000) (bvslt lt!466099 (size!32556 lt!466091)))) (bvsge lt!466099 #b00000000000000000000000000000000) (bvslt lt!466099 (size!32556 lt!466091)) (= (select (arr!32019 lt!466091) lt!466099) k!2747))))

(declare-fun e!600236 () (_ BitVec 32))

(assert (=> d!128493 (= lt!466099 e!600236)))

(declare-fun c!107406 () Bool)

(assert (=> d!128493 (= c!107406 (= (select (arr!32019 lt!466091) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128493 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!32556 lt!466091)) (bvslt (size!32556 lt!466091) #b01111111111111111111111111111111))))

(assert (=> d!128493 (= (arrayScanForKey!0 lt!466091 k!2747 #b00000000000000000000000000000000) lt!466099)))

(declare-fun b!1056190 () Bool)

(assert (=> b!1056190 (= e!600236 #b00000000000000000000000000000000)))

(declare-fun b!1056191 () Bool)

(assert (=> b!1056191 (= e!600236 (arrayScanForKey!0 lt!466091 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128493 c!107406) b!1056190))

(assert (= (and d!128493 (not c!107406)) b!1056191))

(declare-fun m!976587 () Bool)

(assert (=> d!128493 m!976587))

(declare-fun m!976589 () Bool)

(assert (=> d!128493 m!976589))

(declare-fun m!976591 () Bool)

(assert (=> b!1056191 m!976591))

(assert (=> b!1056147 d!128493))

(declare-fun d!128503 () Bool)

(declare-fun res!704313 () Bool)

(declare-fun e!600237 () Bool)

(assert (=> d!128503 (=> res!704313 e!600237)))

(assert (=> d!128503 (= res!704313 (= (select (arr!32019 lt!466091) #b00000000000000000000000000000000) k!2747))))

(assert (=> d!128503 (= (arrayContainsKey!0 lt!466091 k!2747 #b00000000000000000000000000000000) e!600237)))

(declare-fun b!1056192 () Bool)

(declare-fun e!600238 () Bool)

(assert (=> b!1056192 (= e!600237 e!600238)))

(declare-fun res!704314 () Bool)

(assert (=> b!1056192 (=> (not res!704314) (not e!600238))))

(assert (=> b!1056192 (= res!704314 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!32556 lt!466091)))))

(declare-fun b!1056193 () Bool)

(assert (=> b!1056193 (= e!600238 (arrayContainsKey!0 lt!466091 k!2747 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!128503 (not res!704313)) b!1056192))

(assert (= (and b!1056192 res!704314) b!1056193))

(assert (=> d!128503 m!976589))

(declare-fun m!976593 () Bool)

(assert (=> b!1056193 m!976593))

(assert (=> b!1056141 d!128503))

(declare-fun d!128505 () Bool)

(assert (=> d!128505 (= (array_inv!24801 a!3488) (bvsge (size!32556 a!3488) #b00000000000000000000000000000000))))

(assert (=> start!93112 d!128505))

(declare-fun b!1056210 () Bool)

(declare-fun e!600254 () Bool)

(declare-fun e!600253 () Bool)

(assert (=> b!1056210 (= e!600254 e!600253)))

(declare-fun c!107409 () Bool)

(assert (=> b!1056210 (= c!107409 (validKeyInArray!0 (select (arr!32019 a!3488) #b00000000000000000000000000000000)))))

(declare-fun b!1056211 () Bool)

(declare-fun e!600256 () Bool)

(assert (=> b!1056211 (= e!600256 e!600254)))

(declare-fun res!704328 () Bool)

(assert (=> b!1056211 (=> (not res!704328) (not e!600254))))

(declare-fun e!600255 () Bool)

(assert (=> b!1056211 (= res!704328 (not e!600255))))

(declare-fun res!704329 () Bool)

(assert (=> b!1056211 (=> (not res!704329) (not e!600255))))

(assert (=> b!1056211 (= res!704329 (validKeyInArray!0 (select (arr!32019 a!3488) #b00000000000000000000000000000000)))))

(declare-fun d!128511 () Bool)

(declare-fun res!704327 () Bool)

(assert (=> d!128511 (=> res!704327 e!600256)))

(assert (=> d!128511 (= res!704327 (bvsge #b00000000000000000000000000000000 (size!32556 a!3488)))))

(assert (=> d!128511 (= (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22298) e!600256)))

(declare-fun b!1056212 () Bool)

(declare-fun call!44844 () Bool)

(assert (=> b!1056212 (= e!600253 call!44844)))

(declare-fun b!1056213 () Bool)

(declare-fun contains!6201 (List!22301 (_ BitVec 64)) Bool)

(assert (=> b!1056213 (= e!600255 (contains!6201 Nil!22298 (select (arr!32019 a!3488) #b00000000000000000000000000000000)))))

(declare-fun bm!44841 () Bool)

(assert (=> bm!44841 (= call!44844 (arrayNoDuplicates!0 a!3488 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107409 (Cons!22297 (select (arr!32019 a!3488) #b00000000000000000000000000000000) Nil!22298) Nil!22298)))))

(declare-fun b!1056214 () Bool)

(assert (=> b!1056214 (= e!600253 call!44844)))

(assert (= (and d!128511 (not res!704327)) b!1056211))

(assert (= (and b!1056211 res!704329) b!1056213))

(assert (= (and b!1056211 res!704328) b!1056210))

(assert (= (and b!1056210 c!107409) b!1056214))

(assert (= (and b!1056210 (not c!107409)) b!1056212))

(assert (= (or b!1056214 b!1056212) bm!44841))

(declare-fun m!976611 () Bool)

(assert (=> b!1056210 m!976611))

(assert (=> b!1056210 m!976611))

(declare-fun m!976613 () Bool)

(assert (=> b!1056210 m!976613))

(assert (=> b!1056211 m!976611))

(assert (=> b!1056211 m!976611))

(assert (=> b!1056211 m!976613))

(assert (=> b!1056213 m!976611))

(assert (=> b!1056213 m!976611))

(declare-fun m!976615 () Bool)

(assert (=> b!1056213 m!976615))

(assert (=> bm!44841 m!976611))

(declare-fun m!976617 () Bool)

(assert (=> bm!44841 m!976617))

(assert (=> b!1056140 d!128511))

(declare-fun d!128521 () Bool)

(declare-fun res!704330 () Bool)

(declare-fun e!600257 () Bool)

(assert (=> d!128521 (=> res!704330 e!600257)))

(assert (=> d!128521 (= res!704330 (= (select (arr!32019 a!3488) (bvadd #b00000000000000000000000000000001 i!1381)) k!2747))))

(assert (=> d!128521 (= (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381)) e!600257)))

(declare-fun b!1056215 () Bool)

(declare-fun e!600258 () Bool)

(assert (=> b!1056215 (= e!600257 e!600258)))

(declare-fun res!704331 () Bool)

(assert (=> b!1056215 (=> (not res!704331) (not e!600258))))

(assert (=> b!1056215 (= res!704331 (bvslt (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001) (size!32556 a!3488)))))

(declare-fun b!1056216 () Bool)

(assert (=> b!1056216 (= e!600258 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381 #b00000000000000000000000000000001)))))

(assert (= (and d!128521 (not res!704330)) b!1056215))

(assert (= (and b!1056215 res!704331) b!1056216))

(declare-fun m!976619 () Bool)

(assert (=> d!128521 m!976619))

(declare-fun m!976621 () Bool)

(assert (=> b!1056216 m!976621))

(assert (=> b!1056145 d!128521))

(declare-fun d!128523 () Bool)

(assert (=> d!128523 (arrayContainsKey!0 a!3488 k!2747 (bvadd #b00000000000000000000000000000001 i!1381))))

(declare-fun lt!466108 () Unit!34565)

(declare-fun choose!114 (array!66587 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!34565)

(assert (=> d!128523 (= lt!466108 (choose!114 a!3488 k!2747 lt!466089 (bvadd #b00000000000000000000000000000001 i!1381)))))

(assert (=> d!128523 (bvsge lt!466089 #b00000000000000000000000000000000)))

(assert (=> d!128523 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 a!3488 k!2747 lt!466089 (bvadd #b00000000000000000000000000000001 i!1381)) lt!466108)))

(declare-fun bs!30936 () Bool)

(assert (= bs!30936 d!128523))

(assert (=> bs!30936 m!976545))

(declare-fun m!976623 () Bool)

(assert (=> bs!30936 m!976623))

(assert (=> b!1056145 d!128523))

(declare-fun b!1056231 () Bool)

(declare-fun e!600270 () Bool)

(declare-fun e!600269 () Bool)

(assert (=> b!1056231 (= e!600270 e!600269)))

(declare-fun c!107414 () Bool)

(assert (=> b!1056231 (= c!107414 (validKeyInArray!0 (select (arr!32019 a!3488) i!1381)))))

(declare-fun b!1056232 () Bool)

(declare-fun e!600272 () Bool)

(assert (=> b!1056232 (= e!600272 e!600270)))

(declare-fun res!704339 () Bool)

(assert (=> b!1056232 (=> (not res!704339) (not e!600270))))

(declare-fun e!600271 () Bool)

(assert (=> b!1056232 (= res!704339 (not e!600271))))

(declare-fun res!704340 () Bool)

(assert (=> b!1056232 (=> (not res!704340) (not e!600271))))

(assert (=> b!1056232 (= res!704340 (validKeyInArray!0 (select (arr!32019 a!3488) i!1381)))))

(declare-fun d!128525 () Bool)

(declare-fun res!704338 () Bool)

(assert (=> d!128525 (=> res!704338 e!600272)))

(assert (=> d!128525 (= res!704338 (bvsge i!1381 (size!32556 a!3488)))))

(assert (=> d!128525 (= (arrayNoDuplicates!0 a!3488 i!1381 Nil!22298) e!600272)))

(declare-fun b!1056233 () Bool)

(declare-fun call!44847 () Bool)

(assert (=> b!1056233 (= e!600269 call!44847)))

(declare-fun b!1056234 () Bool)

(assert (=> b!1056234 (= e!600271 (contains!6201 Nil!22298 (select (arr!32019 a!3488) i!1381)))))

(declare-fun bm!44844 () Bool)

(assert (=> bm!44844 (= call!44847 (arrayNoDuplicates!0 a!3488 (bvadd i!1381 #b00000000000000000000000000000001) (ite c!107414 (Cons!22297 (select (arr!32019 a!3488) i!1381) Nil!22298) Nil!22298)))))

(declare-fun b!1056235 () Bool)

(assert (=> b!1056235 (= e!600269 call!44847)))

(assert (= (and d!128525 (not res!704338)) b!1056232))

(assert (= (and b!1056232 res!704340) b!1056234))

(assert (= (and b!1056232 res!704339) b!1056231))

(assert (= (and b!1056231 c!107414) b!1056235))

(assert (= (and b!1056231 (not c!107414)) b!1056233))

(assert (= (or b!1056235 b!1056233) bm!44844))

(assert (=> b!1056231 m!976557))

(assert (=> b!1056231 m!976557))

(declare-fun m!976625 () Bool)

(assert (=> b!1056231 m!976625))

(assert (=> b!1056232 m!976557))

(assert (=> b!1056232 m!976557))

(assert (=> b!1056232 m!976625))

(assert (=> b!1056234 m!976557))

(assert (=> b!1056234 m!976557))

(declare-fun m!976627 () Bool)

(assert (=> b!1056234 m!976627))

(assert (=> bm!44844 m!976557))

(declare-fun m!976629 () Bool)

(assert (=> bm!44844 m!976629))

(assert (=> b!1056145 d!128525))

(declare-fun d!128527 () Bool)

(assert (=> d!128527 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22298)))

(declare-fun lt!466112 () Unit!34565)

(declare-fun choose!39 (array!66587 (_ BitVec 32) (_ BitVec 32)) Unit!34565)

(assert (=> d!128527 (= lt!466112 (choose!39 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (=> d!128527 (bvslt (size!32556 a!3488) #b01111111111111111111111111111111)))

(assert (=> d!128527 (= (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381) lt!466112)))

(declare-fun bs!30937 () Bool)

(assert (= bs!30937 d!128527))

(assert (=> bs!30937 m!976549))

(declare-fun m!976635 () Bool)

(assert (=> bs!30937 m!976635))

(assert (=> b!1056145 d!128527))

(push 1)

(assert (not b!1056216))

(assert (not b!1056193))

(assert (not b!1056191))

(assert (not d!128523))

(assert (not bm!44844))

(assert (not b!1056174))

(assert (not b!1056232))

(assert (not b!1056234))

(assert (not bm!44841))

(assert (not b!1056213))

(assert (not b!1056211))

(assert (not d!128527))

(assert (not b!1056231))

(assert (not b!1056210))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

