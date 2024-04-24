; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122522 () Bool)

(assert start!122522)

(declare-fun b!1419310 () Bool)

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!96947 0))(
  ( (array!96948 (arr!46795 (Array (_ BitVec 32) (_ BitVec 64))) (size!47346 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96947)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun e!803315 () Bool)

(assert (=> b!1419310 (= e!803315 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47346 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47346 a!2831)) (bvsge mask!2608 #b00000000000000000000000000000000) (bvsgt mask!2608 #b00111111111111111111111111111111)))))

(declare-fun b!1419311 () Bool)

(declare-fun res!954302 () Bool)

(assert (=> b!1419311 (=> (not res!954302) (not e!803315))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419311 (= res!954302 (validKeyInArray!0 (select (arr!46795 a!2831) j!81)))))

(declare-fun b!1419312 () Bool)

(declare-fun res!954303 () Bool)

(assert (=> b!1419312 (=> (not res!954303) (not e!803315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96947 (_ BitVec 32)) Bool)

(assert (=> b!1419312 (= res!954303 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!954306 () Bool)

(assert (=> start!122522 (=> (not res!954306) (not e!803315))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122522 (= res!954306 (validMask!0 mask!2608))))

(assert (=> start!122522 e!803315))

(assert (=> start!122522 true))

(declare-fun array_inv!36076 (array!96947) Bool)

(assert (=> start!122522 (array_inv!36076 a!2831)))

(declare-fun b!1419313 () Bool)

(declare-fun res!954305 () Bool)

(assert (=> b!1419313 (=> (not res!954305) (not e!803315))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419313 (= res!954305 (and (= (size!47346 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47346 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47346 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419314 () Bool)

(declare-fun res!954307 () Bool)

(assert (=> b!1419314 (=> (not res!954307) (not e!803315))))

(declare-datatypes ((List!33292 0))(
  ( (Nil!33289) (Cons!33288 (h!34589 (_ BitVec 64)) (t!47978 List!33292)) )
))
(declare-fun arrayNoDuplicates!0 (array!96947 (_ BitVec 32) List!33292) Bool)

(assert (=> b!1419314 (= res!954307 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33289))))

(declare-fun b!1419315 () Bool)

(declare-fun res!954304 () Bool)

(assert (=> b!1419315 (=> (not res!954304) (not e!803315))))

(assert (=> b!1419315 (= res!954304 (validKeyInArray!0 (select (arr!46795 a!2831) i!982)))))

(assert (= (and start!122522 res!954306) b!1419313))

(assert (= (and b!1419313 res!954305) b!1419315))

(assert (= (and b!1419315 res!954304) b!1419311))

(assert (= (and b!1419311 res!954302) b!1419312))

(assert (= (and b!1419312 res!954303) b!1419314))

(assert (= (and b!1419314 res!954307) b!1419310))

(declare-fun m!1310287 () Bool)

(assert (=> b!1419312 m!1310287))

(declare-fun m!1310289 () Bool)

(assert (=> b!1419314 m!1310289))

(declare-fun m!1310291 () Bool)

(assert (=> b!1419315 m!1310291))

(assert (=> b!1419315 m!1310291))

(declare-fun m!1310293 () Bool)

(assert (=> b!1419315 m!1310293))

(declare-fun m!1310295 () Bool)

(assert (=> start!122522 m!1310295))

(declare-fun m!1310297 () Bool)

(assert (=> start!122522 m!1310297))

(declare-fun m!1310299 () Bool)

(assert (=> b!1419311 m!1310299))

(assert (=> b!1419311 m!1310299))

(declare-fun m!1310301 () Bool)

(assert (=> b!1419311 m!1310301))

(check-sat (not start!122522) (not b!1419312) (not b!1419311) (not b!1419314) (not b!1419315))
(check-sat)
(get-model)

(declare-fun d!153179 () Bool)

(assert (=> d!153179 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122522 d!153179))

(declare-fun d!153181 () Bool)

(assert (=> d!153181 (= (array_inv!36076 a!2831) (bvsge (size!47346 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122522 d!153181))

(declare-fun d!153183 () Bool)

(assert (=> d!153183 (= (validKeyInArray!0 (select (arr!46795 a!2831) j!81)) (and (not (= (select (arr!46795 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46795 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1419311 d!153183))

(declare-fun b!1419370 () Bool)

(declare-fun e!803344 () Bool)

(declare-fun e!803343 () Bool)

(assert (=> b!1419370 (= e!803344 e!803343)))

(declare-fun res!954354 () Bool)

(assert (=> b!1419370 (=> (not res!954354) (not e!803343))))

(declare-fun e!803342 () Bool)

(assert (=> b!1419370 (= res!954354 (not e!803342))))

(declare-fun res!954356 () Bool)

(assert (=> b!1419370 (=> (not res!954356) (not e!803342))))

(assert (=> b!1419370 (= res!954356 (validKeyInArray!0 (select (arr!46795 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!153187 () Bool)

(declare-fun res!954355 () Bool)

(assert (=> d!153187 (=> res!954355 e!803344)))

(assert (=> d!153187 (= res!954355 (bvsge #b00000000000000000000000000000000 (size!47346 a!2831)))))

(assert (=> d!153187 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33289) e!803344)))

(declare-fun b!1419371 () Bool)

(declare-fun e!803345 () Bool)

(assert (=> b!1419371 (= e!803343 e!803345)))

(declare-fun c!131997 () Bool)

(assert (=> b!1419371 (= c!131997 (validKeyInArray!0 (select (arr!46795 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1419372 () Bool)

(declare-fun call!67313 () Bool)

(assert (=> b!1419372 (= e!803345 call!67313)))

(declare-fun b!1419373 () Bool)

(declare-fun contains!9880 (List!33292 (_ BitVec 64)) Bool)

(assert (=> b!1419373 (= e!803342 (contains!9880 Nil!33289 (select (arr!46795 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1419374 () Bool)

(assert (=> b!1419374 (= e!803345 call!67313)))

(declare-fun bm!67310 () Bool)

(assert (=> bm!67310 (= call!67313 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131997 (Cons!33288 (select (arr!46795 a!2831) #b00000000000000000000000000000000) Nil!33289) Nil!33289)))))

(assert (= (and d!153187 (not res!954355)) b!1419370))

(assert (= (and b!1419370 res!954356) b!1419373))

(assert (= (and b!1419370 res!954354) b!1419371))

(assert (= (and b!1419371 c!131997) b!1419372))

(assert (= (and b!1419371 (not c!131997)) b!1419374))

(assert (= (or b!1419372 b!1419374) bm!67310))

(declare-fun m!1310335 () Bool)

(assert (=> b!1419370 m!1310335))

(assert (=> b!1419370 m!1310335))

(declare-fun m!1310337 () Bool)

(assert (=> b!1419370 m!1310337))

(assert (=> b!1419371 m!1310335))

(assert (=> b!1419371 m!1310335))

(assert (=> b!1419371 m!1310337))

(assert (=> b!1419373 m!1310335))

(assert (=> b!1419373 m!1310335))

(declare-fun m!1310339 () Bool)

(assert (=> b!1419373 m!1310339))

(assert (=> bm!67310 m!1310335))

(declare-fun m!1310341 () Bool)

(assert (=> bm!67310 m!1310341))

(assert (=> b!1419314 d!153187))

(declare-fun d!153195 () Bool)

(assert (=> d!153195 (= (validKeyInArray!0 (select (arr!46795 a!2831) i!982)) (and (not (= (select (arr!46795 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46795 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1419315 d!153195))

(declare-fun b!1419397 () Bool)

(declare-fun e!803364 () Bool)

(declare-fun e!803365 () Bool)

(assert (=> b!1419397 (= e!803364 e!803365)))

(declare-fun lt!625947 () (_ BitVec 64))

(assert (=> b!1419397 (= lt!625947 (select (arr!46795 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48001 0))(
  ( (Unit!48002) )
))
(declare-fun lt!625948 () Unit!48001)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96947 (_ BitVec 64) (_ BitVec 32)) Unit!48001)

(assert (=> b!1419397 (= lt!625948 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625947 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1419397 (arrayContainsKey!0 a!2831 lt!625947 #b00000000000000000000000000000000)))

(declare-fun lt!625949 () Unit!48001)

(assert (=> b!1419397 (= lt!625949 lt!625948)))

(declare-fun res!954369 () Bool)

(declare-datatypes ((SeekEntryResult!10998 0))(
  ( (MissingZero!10998 (index!46384 (_ BitVec 32))) (Found!10998 (index!46385 (_ BitVec 32))) (Intermediate!10998 (undefined!11810 Bool) (index!46386 (_ BitVec 32)) (x!128164 (_ BitVec 32))) (Undefined!10998) (MissingVacant!10998 (index!46387 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96947 (_ BitVec 32)) SeekEntryResult!10998)

(assert (=> b!1419397 (= res!954369 (= (seekEntryOrOpen!0 (select (arr!46795 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!10998 #b00000000000000000000000000000000)))))

(assert (=> b!1419397 (=> (not res!954369) (not e!803365))))

(declare-fun b!1419398 () Bool)

(declare-fun call!67319 () Bool)

(assert (=> b!1419398 (= e!803364 call!67319)))

(declare-fun bm!67316 () Bool)

(assert (=> bm!67316 (= call!67319 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(declare-fun b!1419399 () Bool)

(assert (=> b!1419399 (= e!803365 call!67319)))

(declare-fun b!1419400 () Bool)

(declare-fun e!803363 () Bool)

(assert (=> b!1419400 (= e!803363 e!803364)))

(declare-fun c!132003 () Bool)

(assert (=> b!1419400 (= c!132003 (validKeyInArray!0 (select (arr!46795 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!153197 () Bool)

(declare-fun res!954370 () Bool)

(assert (=> d!153197 (=> res!954370 e!803363)))

(assert (=> d!153197 (= res!954370 (bvsge #b00000000000000000000000000000000 (size!47346 a!2831)))))

(assert (=> d!153197 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!803363)))

(assert (= (and d!153197 (not res!954370)) b!1419400))

(assert (= (and b!1419400 c!132003) b!1419397))

(assert (= (and b!1419400 (not c!132003)) b!1419398))

(assert (= (and b!1419397 res!954369) b!1419399))

(assert (= (or b!1419399 b!1419398) bm!67316))

(assert (=> b!1419397 m!1310335))

(declare-fun m!1310355 () Bool)

(assert (=> b!1419397 m!1310355))

(declare-fun m!1310357 () Bool)

(assert (=> b!1419397 m!1310357))

(assert (=> b!1419397 m!1310335))

(declare-fun m!1310359 () Bool)

(assert (=> b!1419397 m!1310359))

(declare-fun m!1310361 () Bool)

(assert (=> bm!67316 m!1310361))

(assert (=> b!1419400 m!1310335))

(assert (=> b!1419400 m!1310335))

(assert (=> b!1419400 m!1310337))

(assert (=> b!1419312 d!153197))

(check-sat (not b!1419400) (not b!1419371) (not bm!67316) (not b!1419397) (not bm!67310) (not b!1419370) (not b!1419373))
(check-sat)
