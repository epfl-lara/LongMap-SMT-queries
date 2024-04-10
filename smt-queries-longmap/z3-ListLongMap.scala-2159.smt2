; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36266 () Bool)

(assert start!36266)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun e!222418 () Bool)

(declare-datatypes ((array!20567 0))(
  ( (array!20568 (arr!9764 (Array (_ BitVec 32) (_ BitVec 64))) (size!10116 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20567)

(declare-fun b!363225 () Bool)

(declare-fun lt!167395 () array!20567)

(declare-fun arrayCountValidKeys!0 (array!20567 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363225 (= e!222418 (= (arrayCountValidKeys!0 lt!167395 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)) (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun b!363226 () Bool)

(declare-fun e!222417 () Bool)

(assert (=> b!363226 (= e!222417 (not e!222418))))

(declare-fun res!202460 () Bool)

(assert (=> b!363226 (=> res!202460 e!222418)))

(assert (=> b!363226 (= res!202460 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) i!1478)))))

(assert (=> b!363226 (= (arrayCountValidKeys!0 lt!167395 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun k0!2980 () (_ BitVec 64))

(assert (=> b!363226 (= lt!167395 (array!20568 (store (arr!9764 a!4337) i!1478 k0!2980) (size!10116 a!4337)))))

(declare-datatypes ((Unit!11216 0))(
  ( (Unit!11217) )
))
(declare-fun lt!167394 () Unit!11216)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20567 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11216)

(assert (=> b!363226 (= lt!167394 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(declare-fun b!363227 () Bool)

(declare-fun res!202462 () Bool)

(assert (=> b!363227 (=> (not res!202462) (not e!222417))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363227 (= res!202462 (not (validKeyInArray!0 (select (arr!9764 a!4337) i!1478))))))

(declare-fun res!202459 () Bool)

(assert (=> start!36266 (=> (not res!202459) (not e!222417))))

(assert (=> start!36266 (= res!202459 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10116 a!4337))))))

(assert (=> start!36266 e!222417))

(assert (=> start!36266 true))

(declare-fun array_inv!7206 (array!20567) Bool)

(assert (=> start!36266 (array_inv!7206 a!4337)))

(declare-fun b!363228 () Bool)

(declare-fun res!202461 () Bool)

(assert (=> b!363228 (=> (not res!202461) (not e!222417))))

(assert (=> b!363228 (= res!202461 (bvslt (size!10116 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363229 () Bool)

(declare-fun res!202458 () Bool)

(assert (=> b!363229 (=> (not res!202458) (not e!222417))))

(assert (=> b!363229 (= res!202458 (validKeyInArray!0 k0!2980))))

(assert (= (and start!36266 res!202459) b!363227))

(assert (= (and b!363227 res!202462) b!363229))

(assert (= (and b!363229 res!202458) b!363228))

(assert (= (and b!363228 res!202461) b!363226))

(assert (= (and b!363226 (not res!202460)) b!363225))

(declare-fun m!360127 () Bool)

(assert (=> b!363229 m!360127))

(declare-fun m!360129 () Bool)

(assert (=> start!36266 m!360129))

(declare-fun m!360131 () Bool)

(assert (=> b!363225 m!360131))

(declare-fun m!360133 () Bool)

(assert (=> b!363225 m!360133))

(declare-fun m!360135 () Bool)

(assert (=> b!363227 m!360135))

(assert (=> b!363227 m!360135))

(declare-fun m!360137 () Bool)

(assert (=> b!363227 m!360137))

(declare-fun m!360139 () Bool)

(assert (=> b!363226 m!360139))

(declare-fun m!360141 () Bool)

(assert (=> b!363226 m!360141))

(declare-fun m!360143 () Bool)

(assert (=> b!363226 m!360143))

(declare-fun m!360145 () Bool)

(assert (=> b!363226 m!360145))

(check-sat (not b!363225) (not b!363226) (not start!36266) (not b!363229) (not b!363227))
(check-sat)
(get-model)

(declare-fun d!72109 () Bool)

(assert (=> d!72109 (= (validKeyInArray!0 k0!2980) (and (not (= k0!2980 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2980 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!363229 d!72109))

(declare-fun d!72113 () Bool)

(assert (=> d!72113 (= (validKeyInArray!0 (select (arr!9764 a!4337) i!1478)) (and (not (= (select (arr!9764 a!4337) i!1478) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!9764 a!4337) i!1478) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!363227 d!72113))

(declare-fun d!72115 () Bool)

(assert (=> d!72115 (= (array_inv!7206 a!4337) (bvsge (size!10116 a!4337) #b00000000000000000000000000000000))))

(assert (=> start!36266 d!72115))

(declare-fun b!363261 () Bool)

(declare-fun e!222437 () (_ BitVec 32))

(declare-fun call!27232 () (_ BitVec 32))

(assert (=> b!363261 (= e!222437 (bvadd #b00000000000000000000000000000001 call!27232))))

(declare-fun b!363262 () Bool)

(declare-fun e!222436 () (_ BitVec 32))

(assert (=> b!363262 (= e!222436 e!222437)))

(declare-fun c!53811 () Bool)

(assert (=> b!363262 (= c!53811 (validKeyInArray!0 (select (arr!9764 lt!167395) #b00000000000000000000000000000000)))))

(declare-fun d!72117 () Bool)

(declare-fun lt!167406 () (_ BitVec 32))

(assert (=> d!72117 (and (bvsge lt!167406 #b00000000000000000000000000000000) (bvsle lt!167406 (bvsub (size!10116 lt!167395) #b00000000000000000000000000000000)))))

(assert (=> d!72117 (= lt!167406 e!222436)))

(declare-fun c!53810 () Bool)

(assert (=> d!72117 (= c!53810 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72117 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10116 lt!167395)))))

(assert (=> d!72117 (= (arrayCountValidKeys!0 lt!167395 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) lt!167406)))

(declare-fun b!363263 () Bool)

(assert (=> b!363263 (= e!222436 #b00000000000000000000000000000000)))

(declare-fun bm!27229 () Bool)

(assert (=> bm!27229 (= call!27232 (arrayCountValidKeys!0 lt!167395 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363264 () Bool)

(assert (=> b!363264 (= e!222437 call!27232)))

(assert (= (and d!72117 c!53810) b!363263))

(assert (= (and d!72117 (not c!53810)) b!363262))

(assert (= (and b!363262 c!53811) b!363261))

(assert (= (and b!363262 (not c!53811)) b!363264))

(assert (= (or b!363261 b!363264) bm!27229))

(declare-fun m!360167 () Bool)

(assert (=> b!363262 m!360167))

(assert (=> b!363262 m!360167))

(declare-fun m!360169 () Bool)

(assert (=> b!363262 m!360169))

(declare-fun m!360171 () Bool)

(assert (=> bm!27229 m!360171))

(assert (=> b!363226 d!72117))

(declare-fun b!363269 () Bool)

(declare-fun e!222441 () (_ BitVec 32))

(declare-fun call!27234 () (_ BitVec 32))

(assert (=> b!363269 (= e!222441 (bvadd #b00000000000000000000000000000001 call!27234))))

(declare-fun b!363270 () Bool)

(declare-fun e!222440 () (_ BitVec 32))

(assert (=> b!363270 (= e!222440 e!222441)))

(declare-fun c!53815 () Bool)

(assert (=> b!363270 (= c!53815 (validKeyInArray!0 (select (arr!9764 a!4337) #b00000000000000000000000000000000)))))

(declare-fun d!72119 () Bool)

(declare-fun lt!167408 () (_ BitVec 32))

(assert (=> d!72119 (and (bvsge lt!167408 #b00000000000000000000000000000000) (bvsle lt!167408 (bvsub (size!10116 a!4337) #b00000000000000000000000000000000)))))

(assert (=> d!72119 (= lt!167408 e!222440)))

(declare-fun c!53814 () Bool)

(assert (=> d!72119 (= c!53814 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72119 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10116 a!4337)))))

(assert (=> d!72119 (= (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) lt!167408)))

(declare-fun b!363271 () Bool)

(assert (=> b!363271 (= e!222440 #b00000000000000000000000000000000)))

(declare-fun bm!27231 () Bool)

(assert (=> bm!27231 (= call!27234 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363272 () Bool)

(assert (=> b!363272 (= e!222441 call!27234)))

(assert (= (and d!72119 c!53814) b!363271))

(assert (= (and d!72119 (not c!53814)) b!363270))

(assert (= (and b!363270 c!53815) b!363269))

(assert (= (and b!363270 (not c!53815)) b!363272))

(assert (= (or b!363269 b!363272) bm!27231))

(declare-fun m!360179 () Bool)

(assert (=> b!363270 m!360179))

(assert (=> b!363270 m!360179))

(declare-fun m!360181 () Bool)

(assert (=> b!363270 m!360181))

(declare-fun m!360183 () Bool)

(assert (=> bm!27231 m!360183))

(assert (=> b!363226 d!72119))

(declare-fun d!72123 () Bool)

(declare-fun e!222449 () Bool)

(assert (=> d!72123 e!222449))

(declare-fun res!202483 () Bool)

(assert (=> d!72123 (=> (not res!202483) (not e!222449))))

(assert (=> d!72123 (= res!202483 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10116 a!4337))))))

(declare-fun lt!167415 () Unit!11216)

(declare-fun choose!19 (array!20567 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11216)

(assert (=> d!72123 (= lt!167415 (choose!19 a!4337 i!1478 k0!2980 i!1478))))

(assert (=> d!72123 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10116 a!4337)))))

(assert (=> d!72123 (= (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478) lt!167415)))

(declare-fun b!363282 () Bool)

(assert (=> b!363282 (= e!222449 (= (arrayCountValidKeys!0 (array!20568 (store (arr!9764 a!4337) i!1478 k0!2980) (size!10116 a!4337)) #b00000000000000000000000000000000 (bvadd i!1478 #b00000000000000000000000000000001)) (bvadd (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd i!1478 #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))))

(assert (= (and d!72123 res!202483) b!363282))

(declare-fun m!360197 () Bool)

(assert (=> d!72123 m!360197))

(assert (=> b!363282 m!360143))

(declare-fun m!360199 () Bool)

(assert (=> b!363282 m!360199))

(declare-fun m!360201 () Bool)

(assert (=> b!363282 m!360201))

(assert (=> b!363226 d!72123))

(declare-fun b!363283 () Bool)

(declare-fun e!222451 () (_ BitVec 32))

(declare-fun call!27236 () (_ BitVec 32))

(assert (=> b!363283 (= e!222451 (bvadd #b00000000000000000000000000000001 call!27236))))

(declare-fun b!363284 () Bool)

(declare-fun e!222450 () (_ BitVec 32))

(assert (=> b!363284 (= e!222450 e!222451)))

(declare-fun c!53819 () Bool)

(assert (=> b!363284 (= c!53819 (validKeyInArray!0 (select (arr!9764 lt!167395) (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun d!72137 () Bool)

(declare-fun lt!167416 () (_ BitVec 32))

(assert (=> d!72137 (and (bvsge lt!167416 #b00000000000000000000000000000000) (bvsle lt!167416 (bvsub (size!10116 lt!167395) (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> d!72137 (= lt!167416 e!222450)))

(declare-fun c!53818 () Bool)

(assert (=> d!72137 (= c!53818 (bvsge (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72137 (and (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10116 lt!167395)))))

(assert (=> d!72137 (= (arrayCountValidKeys!0 lt!167395 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)) lt!167416)))

(declare-fun b!363285 () Bool)

(assert (=> b!363285 (= e!222450 #b00000000000000000000000000000000)))

(declare-fun bm!27233 () Bool)

(assert (=> bm!27233 (= call!27236 (arrayCountValidKeys!0 lt!167395 (bvadd #b00000000000000000000000000000001 i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363286 () Bool)

(assert (=> b!363286 (= e!222451 call!27236)))

(assert (= (and d!72137 c!53818) b!363285))

(assert (= (and d!72137 (not c!53818)) b!363284))

(assert (= (and b!363284 c!53819) b!363283))

(assert (= (and b!363284 (not c!53819)) b!363286))

(assert (= (or b!363283 b!363286) bm!27233))

(declare-fun m!360203 () Bool)

(assert (=> b!363284 m!360203))

(assert (=> b!363284 m!360203))

(declare-fun m!360205 () Bool)

(assert (=> b!363284 m!360205))

(declare-fun m!360207 () Bool)

(assert (=> bm!27233 m!360207))

(assert (=> b!363225 d!72137))

(declare-fun b!363287 () Bool)

(declare-fun e!222453 () (_ BitVec 32))

(declare-fun call!27237 () (_ BitVec 32))

(assert (=> b!363287 (= e!222453 (bvadd #b00000000000000000000000000000001 call!27237))))

(declare-fun b!363288 () Bool)

(declare-fun e!222452 () (_ BitVec 32))

(assert (=> b!363288 (= e!222452 e!222453)))

(declare-fun c!53821 () Bool)

(assert (=> b!363288 (= c!53821 (validKeyInArray!0 (select (arr!9764 a!4337) (bvadd #b00000000000000000000000000000001 i!1478))))))

(declare-fun d!72141 () Bool)

(declare-fun lt!167417 () (_ BitVec 32))

(assert (=> d!72141 (and (bvsge lt!167417 #b00000000000000000000000000000000) (bvsle lt!167417 (bvsub (size!10116 a!4337) (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> d!72141 (= lt!167417 e!222452)))

(declare-fun c!53820 () Bool)

(assert (=> d!72141 (= c!53820 (bvsge (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!72141 (and (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10116 a!4337)))))

(assert (=> d!72141 (= (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (bvadd #b00000000000000000000000000000001 i!1478)) lt!167417)))

(declare-fun b!363289 () Bool)

(assert (=> b!363289 (= e!222452 #b00000000000000000000000000000000)))

(declare-fun bm!27234 () Bool)

(assert (=> bm!27234 (= call!27237 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363290 () Bool)

(assert (=> b!363290 (= e!222453 call!27237)))

(assert (= (and d!72141 c!53820) b!363289))

(assert (= (and d!72141 (not c!53820)) b!363288))

(assert (= (and b!363288 c!53821) b!363287))

(assert (= (and b!363288 (not c!53821)) b!363290))

(assert (= (or b!363287 b!363290) bm!27234))

(declare-fun m!360209 () Bool)

(assert (=> b!363288 m!360209))

(assert (=> b!363288 m!360209))

(declare-fun m!360211 () Bool)

(assert (=> b!363288 m!360211))

(declare-fun m!360213 () Bool)

(assert (=> bm!27234 m!360213))

(assert (=> b!363225 d!72141))

(check-sat (not bm!27233) (not b!363288) (not bm!27231) (not b!363270) (not b!363282) (not b!363262) (not bm!27229) (not b!363284) (not bm!27234) (not d!72123))
(check-sat)
