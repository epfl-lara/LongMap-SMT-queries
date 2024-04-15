; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128666 () Bool)

(assert start!128666)

(declare-fun b!1508150 () Bool)

(declare-fun res!1028368 () Bool)

(declare-fun e!842506 () Bool)

(assert (=> b!1508150 (=> (not res!1028368) (not e!842506))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100561 0))(
  ( (array!100562 (arr!48520 (Array (_ BitVec 32) (_ BitVec 64))) (size!49072 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100561)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1508150 (= res!1028368 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49072 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49072 a!2804))))))

(declare-fun b!1508151 () Bool)

(declare-fun res!1028369 () Bool)

(assert (=> b!1508151 (=> (not res!1028369) (not e!842506))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508151 (= res!1028369 (validKeyInArray!0 (select (arr!48520 a!2804) j!70)))))

(declare-fun b!1508152 () Bool)

(declare-fun res!1028372 () Bool)

(assert (=> b!1508152 (=> (not res!1028372) (not e!842506))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100561 (_ BitVec 32)) Bool)

(assert (=> b!1508152 (= res!1028372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508153 () Bool)

(declare-fun res!1028364 () Bool)

(assert (=> b!1508153 (=> (not res!1028364) (not e!842506))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1508153 (= res!1028364 (and (= (size!49072 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49072 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49072 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508154 () Bool)

(declare-fun e!842507 () Bool)

(declare-fun lt!654347 () (_ BitVec 32))

(assert (=> b!1508154 (= e!842507 (and (bvsge mask!2512 #b00000000000000000000000000000000) (or (bvslt lt!654347 #b00000000000000000000000000000000) (bvsge lt!654347 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508154 (= lt!654347 (toIndex!0 (select (store (arr!48520 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512))))

(declare-fun res!1028367 () Bool)

(assert (=> start!128666 (=> (not res!1028367) (not e!842506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128666 (= res!1028367 (validMask!0 mask!2512))))

(assert (=> start!128666 e!842506))

(assert (=> start!128666 true))

(declare-fun array_inv!37753 (array!100561) Bool)

(assert (=> start!128666 (array_inv!37753 a!2804)))

(declare-fun b!1508155 () Bool)

(declare-fun res!1028371 () Bool)

(assert (=> b!1508155 (=> (not res!1028371) (not e!842507))))

(declare-datatypes ((SeekEntryResult!12714 0))(
  ( (MissingZero!12714 (index!53251 (_ BitVec 32))) (Found!12714 (index!53252 (_ BitVec 32))) (Intermediate!12714 (undefined!13526 Bool) (index!53253 (_ BitVec 32)) (x!135012 (_ BitVec 32))) (Undefined!12714) (MissingVacant!12714 (index!53254 (_ BitVec 32))) )
))
(declare-fun lt!654348 () SeekEntryResult!12714)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100561 (_ BitVec 32)) SeekEntryResult!12714)

(assert (=> b!1508155 (= res!1028371 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48520 a!2804) j!70) a!2804 mask!2512) lt!654348))))

(declare-fun b!1508156 () Bool)

(declare-fun res!1028370 () Bool)

(assert (=> b!1508156 (=> (not res!1028370) (not e!842506))))

(declare-datatypes ((List!35081 0))(
  ( (Nil!35078) (Cons!35077 (h!36487 (_ BitVec 64)) (t!49767 List!35081)) )
))
(declare-fun arrayNoDuplicates!0 (array!100561 (_ BitVec 32) List!35081) Bool)

(assert (=> b!1508156 (= res!1028370 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35078))))

(declare-fun b!1508157 () Bool)

(assert (=> b!1508157 (= e!842506 e!842507)))

(declare-fun res!1028366 () Bool)

(assert (=> b!1508157 (=> (not res!1028366) (not e!842507))))

(assert (=> b!1508157 (= res!1028366 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48520 a!2804) j!70) mask!2512) (select (arr!48520 a!2804) j!70) a!2804 mask!2512) lt!654348))))

(assert (=> b!1508157 (= lt!654348 (Intermediate!12714 false resIndex!21 resX!21))))

(declare-fun b!1508158 () Bool)

(declare-fun res!1028365 () Bool)

(assert (=> b!1508158 (=> (not res!1028365) (not e!842506))))

(assert (=> b!1508158 (= res!1028365 (validKeyInArray!0 (select (arr!48520 a!2804) i!961)))))

(assert (= (and start!128666 res!1028367) b!1508153))

(assert (= (and b!1508153 res!1028364) b!1508158))

(assert (= (and b!1508158 res!1028365) b!1508151))

(assert (= (and b!1508151 res!1028369) b!1508152))

(assert (= (and b!1508152 res!1028372) b!1508156))

(assert (= (and b!1508156 res!1028370) b!1508150))

(assert (= (and b!1508150 res!1028368) b!1508157))

(assert (= (and b!1508157 res!1028366) b!1508155))

(assert (= (and b!1508155 res!1028371) b!1508154))

(declare-fun m!1390091 () Bool)

(assert (=> b!1508155 m!1390091))

(assert (=> b!1508155 m!1390091))

(declare-fun m!1390093 () Bool)

(assert (=> b!1508155 m!1390093))

(declare-fun m!1390095 () Bool)

(assert (=> b!1508154 m!1390095))

(declare-fun m!1390097 () Bool)

(assert (=> b!1508154 m!1390097))

(assert (=> b!1508154 m!1390097))

(declare-fun m!1390099 () Bool)

(assert (=> b!1508154 m!1390099))

(declare-fun m!1390101 () Bool)

(assert (=> start!128666 m!1390101))

(declare-fun m!1390103 () Bool)

(assert (=> start!128666 m!1390103))

(declare-fun m!1390105 () Bool)

(assert (=> b!1508158 m!1390105))

(assert (=> b!1508158 m!1390105))

(declare-fun m!1390107 () Bool)

(assert (=> b!1508158 m!1390107))

(assert (=> b!1508151 m!1390091))

(assert (=> b!1508151 m!1390091))

(declare-fun m!1390109 () Bool)

(assert (=> b!1508151 m!1390109))

(assert (=> b!1508157 m!1390091))

(assert (=> b!1508157 m!1390091))

(declare-fun m!1390111 () Bool)

(assert (=> b!1508157 m!1390111))

(assert (=> b!1508157 m!1390111))

(assert (=> b!1508157 m!1390091))

(declare-fun m!1390113 () Bool)

(assert (=> b!1508157 m!1390113))

(declare-fun m!1390115 () Bool)

(assert (=> b!1508152 m!1390115))

(declare-fun m!1390117 () Bool)

(assert (=> b!1508156 m!1390117))

(check-sat (not b!1508155) (not b!1508151) (not b!1508154) (not start!128666) (not b!1508152) (not b!1508156) (not b!1508157) (not b!1508158))
(check-sat)
(get-model)

(declare-fun d!158183 () Bool)

(assert (=> d!158183 (= (validKeyInArray!0 (select (arr!48520 a!2804) i!961)) (and (not (= (select (arr!48520 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48520 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1508158 d!158183))

(declare-fun d!158185 () Bool)

(assert (=> d!158185 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128666 d!158185))

(declare-fun d!158187 () Bool)

(assert (=> d!158187 (= (array_inv!37753 a!2804) (bvsge (size!49072 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128666 d!158187))

(declare-fun d!158189 () Bool)

(declare-fun lt!654366 () (_ BitVec 32))

(declare-fun lt!654365 () (_ BitVec 32))

(assert (=> d!158189 (= lt!654366 (bvmul (bvxor lt!654365 (bvlshr lt!654365 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158189 (= lt!654365 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48520 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48520 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158189 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1028427 (let ((h!36490 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48520 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48520 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!135015 (bvmul (bvxor h!36490 (bvlshr h!36490 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!135015 (bvlshr x!135015 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1028427 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1028427 #b00000000000000000000000000000000))))))

(assert (=> d!158189 (= (toIndex!0 (select (store (arr!48520 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!654366 (bvlshr lt!654366 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1508154 d!158189))

(declare-fun b!1508280 () Bool)

(declare-fun e!842577 () SeekEntryResult!12714)

(declare-fun e!842579 () SeekEntryResult!12714)

(assert (=> b!1508280 (= e!842577 e!842579)))

(declare-fun c!139455 () Bool)

(declare-fun lt!654395 () (_ BitVec 64))

(assert (=> b!1508280 (= c!139455 (or (= lt!654395 (select (arr!48520 a!2804) j!70)) (= (bvadd lt!654395 lt!654395) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1508281 () Bool)

(declare-fun e!842575 () Bool)

(declare-fun e!842576 () Bool)

(assert (=> b!1508281 (= e!842575 e!842576)))

(declare-fun res!1028462 () Bool)

(declare-fun lt!654396 () SeekEntryResult!12714)

(get-info :version)

(assert (=> b!1508281 (= res!1028462 (and ((_ is Intermediate!12714) lt!654396) (not (undefined!13526 lt!654396)) (bvslt (x!135012 lt!654396) #b01111111111111111111111111111110) (bvsge (x!135012 lt!654396) #b00000000000000000000000000000000) (bvsge (x!135012 lt!654396) x!534)))))

(assert (=> b!1508281 (=> (not res!1028462) (not e!842576))))

(declare-fun d!158193 () Bool)

(assert (=> d!158193 e!842575))

(declare-fun c!139453 () Bool)

(assert (=> d!158193 (= c!139453 (and ((_ is Intermediate!12714) lt!654396) (undefined!13526 lt!654396)))))

(assert (=> d!158193 (= lt!654396 e!842577)))

(declare-fun c!139454 () Bool)

(assert (=> d!158193 (= c!139454 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!158193 (= lt!654395 (select (arr!48520 a!2804) index!487))))

(assert (=> d!158193 (validMask!0 mask!2512)))

(assert (=> d!158193 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48520 a!2804) j!70) a!2804 mask!2512) lt!654396)))

(declare-fun b!1508282 () Bool)

(assert (=> b!1508282 (= e!842575 (bvsge (x!135012 lt!654396) #b01111111111111111111111111111110))))

(declare-fun b!1508283 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508283 (= e!842579 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48520 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1508284 () Bool)

(assert (=> b!1508284 (= e!842579 (Intermediate!12714 false index!487 x!534))))

(declare-fun b!1508285 () Bool)

(assert (=> b!1508285 (and (bvsge (index!53253 lt!654396) #b00000000000000000000000000000000) (bvslt (index!53253 lt!654396) (size!49072 a!2804)))))

(declare-fun e!842578 () Bool)

(assert (=> b!1508285 (= e!842578 (= (select (arr!48520 a!2804) (index!53253 lt!654396)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1508286 () Bool)

(assert (=> b!1508286 (and (bvsge (index!53253 lt!654396) #b00000000000000000000000000000000) (bvslt (index!53253 lt!654396) (size!49072 a!2804)))))

(declare-fun res!1028463 () Bool)

(assert (=> b!1508286 (= res!1028463 (= (select (arr!48520 a!2804) (index!53253 lt!654396)) (select (arr!48520 a!2804) j!70)))))

(assert (=> b!1508286 (=> res!1028463 e!842578)))

(assert (=> b!1508286 (= e!842576 e!842578)))

(declare-fun b!1508287 () Bool)

(assert (=> b!1508287 (and (bvsge (index!53253 lt!654396) #b00000000000000000000000000000000) (bvslt (index!53253 lt!654396) (size!49072 a!2804)))))

(declare-fun res!1028464 () Bool)

(assert (=> b!1508287 (= res!1028464 (= (select (arr!48520 a!2804) (index!53253 lt!654396)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1508287 (=> res!1028464 e!842578)))

(declare-fun b!1508288 () Bool)

(assert (=> b!1508288 (= e!842577 (Intermediate!12714 true index!487 x!534))))

(assert (= (and d!158193 c!139454) b!1508288))

(assert (= (and d!158193 (not c!139454)) b!1508280))

(assert (= (and b!1508280 c!139455) b!1508284))

(assert (= (and b!1508280 (not c!139455)) b!1508283))

(assert (= (and d!158193 c!139453) b!1508282))

(assert (= (and d!158193 (not c!139453)) b!1508281))

(assert (= (and b!1508281 res!1028462) b!1508286))

(assert (= (and b!1508286 (not res!1028463)) b!1508287))

(assert (= (and b!1508287 (not res!1028464)) b!1508285))

(declare-fun m!1390203 () Bool)

(assert (=> b!1508283 m!1390203))

(assert (=> b!1508283 m!1390203))

(assert (=> b!1508283 m!1390091))

(declare-fun m!1390205 () Bool)

(assert (=> b!1508283 m!1390205))

(declare-fun m!1390207 () Bool)

(assert (=> b!1508285 m!1390207))

(assert (=> b!1508287 m!1390207))

(assert (=> b!1508286 m!1390207))

(declare-fun m!1390211 () Bool)

(assert (=> d!158193 m!1390211))

(assert (=> d!158193 m!1390101))

(assert (=> b!1508155 d!158193))

(declare-fun b!1508322 () Bool)

(declare-fun e!842604 () Bool)

(declare-fun contains!9939 (List!35081 (_ BitVec 64)) Bool)

(assert (=> b!1508322 (= e!842604 (contains!9939 Nil!35078 (select (arr!48520 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1508323 () Bool)

(declare-fun e!842602 () Bool)

(declare-fun call!68270 () Bool)

(assert (=> b!1508323 (= e!842602 call!68270)))

(declare-fun b!1508324 () Bool)

(assert (=> b!1508324 (= e!842602 call!68270)))

(declare-fun b!1508325 () Bool)

(declare-fun e!842603 () Bool)

(declare-fun e!842605 () Bool)

(assert (=> b!1508325 (= e!842603 e!842605)))

(declare-fun res!1028481 () Bool)

(assert (=> b!1508325 (=> (not res!1028481) (not e!842605))))

(assert (=> b!1508325 (= res!1028481 (not e!842604))))

(declare-fun res!1028482 () Bool)

(assert (=> b!1508325 (=> (not res!1028482) (not e!842604))))

(assert (=> b!1508325 (= res!1028482 (validKeyInArray!0 (select (arr!48520 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1508326 () Bool)

(assert (=> b!1508326 (= e!842605 e!842602)))

(declare-fun c!139465 () Bool)

(assert (=> b!1508326 (= c!139465 (validKeyInArray!0 (select (arr!48520 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!158207 () Bool)

(declare-fun res!1028480 () Bool)

(assert (=> d!158207 (=> res!1028480 e!842603)))

(assert (=> d!158207 (= res!1028480 (bvsge #b00000000000000000000000000000000 (size!49072 a!2804)))))

(assert (=> d!158207 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35078) e!842603)))

(declare-fun bm!68267 () Bool)

(assert (=> bm!68267 (= call!68270 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139465 (Cons!35077 (select (arr!48520 a!2804) #b00000000000000000000000000000000) Nil!35078) Nil!35078)))))

(assert (= (and d!158207 (not res!1028480)) b!1508325))

(assert (= (and b!1508325 res!1028482) b!1508322))

(assert (= (and b!1508325 res!1028481) b!1508326))

(assert (= (and b!1508326 c!139465) b!1508323))

(assert (= (and b!1508326 (not c!139465)) b!1508324))

(assert (= (or b!1508323 b!1508324) bm!68267))

(declare-fun m!1390215 () Bool)

(assert (=> b!1508322 m!1390215))

(assert (=> b!1508322 m!1390215))

(declare-fun m!1390217 () Bool)

(assert (=> b!1508322 m!1390217))

(assert (=> b!1508325 m!1390215))

(assert (=> b!1508325 m!1390215))

(declare-fun m!1390219 () Bool)

(assert (=> b!1508325 m!1390219))

(assert (=> b!1508326 m!1390215))

(assert (=> b!1508326 m!1390215))

(assert (=> b!1508326 m!1390219))

(assert (=> bm!68267 m!1390215))

(declare-fun m!1390221 () Bool)

(assert (=> bm!68267 m!1390221))

(assert (=> b!1508156 d!158207))

(declare-fun d!158211 () Bool)

(assert (=> d!158211 (= (validKeyInArray!0 (select (arr!48520 a!2804) j!70)) (and (not (= (select (arr!48520 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48520 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1508151 d!158211))

(declare-fun b!1508327 () Bool)

(declare-fun e!842608 () SeekEntryResult!12714)

(declare-fun e!842610 () SeekEntryResult!12714)

(assert (=> b!1508327 (= e!842608 e!842610)))

(declare-fun c!139468 () Bool)

(declare-fun lt!654401 () (_ BitVec 64))

(assert (=> b!1508327 (= c!139468 (or (= lt!654401 (select (arr!48520 a!2804) j!70)) (= (bvadd lt!654401 lt!654401) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1508328 () Bool)

(declare-fun e!842606 () Bool)

(declare-fun e!842607 () Bool)

(assert (=> b!1508328 (= e!842606 e!842607)))

(declare-fun res!1028483 () Bool)

(declare-fun lt!654402 () SeekEntryResult!12714)

(assert (=> b!1508328 (= res!1028483 (and ((_ is Intermediate!12714) lt!654402) (not (undefined!13526 lt!654402)) (bvslt (x!135012 lt!654402) #b01111111111111111111111111111110) (bvsge (x!135012 lt!654402) #b00000000000000000000000000000000) (bvsge (x!135012 lt!654402) #b00000000000000000000000000000000)))))

(assert (=> b!1508328 (=> (not res!1028483) (not e!842607))))

(declare-fun d!158213 () Bool)

(assert (=> d!158213 e!842606))

(declare-fun c!139466 () Bool)

(assert (=> d!158213 (= c!139466 (and ((_ is Intermediate!12714) lt!654402) (undefined!13526 lt!654402)))))

(assert (=> d!158213 (= lt!654402 e!842608)))

(declare-fun c!139467 () Bool)

(assert (=> d!158213 (= c!139467 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!158213 (= lt!654401 (select (arr!48520 a!2804) (toIndex!0 (select (arr!48520 a!2804) j!70) mask!2512)))))

(assert (=> d!158213 (validMask!0 mask!2512)))

(assert (=> d!158213 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48520 a!2804) j!70) mask!2512) (select (arr!48520 a!2804) j!70) a!2804 mask!2512) lt!654402)))

(declare-fun b!1508329 () Bool)

(assert (=> b!1508329 (= e!842606 (bvsge (x!135012 lt!654402) #b01111111111111111111111111111110))))

(declare-fun b!1508330 () Bool)

(assert (=> b!1508330 (= e!842610 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48520 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48520 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1508331 () Bool)

(assert (=> b!1508331 (= e!842610 (Intermediate!12714 false (toIndex!0 (select (arr!48520 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1508332 () Bool)

(assert (=> b!1508332 (and (bvsge (index!53253 lt!654402) #b00000000000000000000000000000000) (bvslt (index!53253 lt!654402) (size!49072 a!2804)))))

(declare-fun e!842609 () Bool)

(assert (=> b!1508332 (= e!842609 (= (select (arr!48520 a!2804) (index!53253 lt!654402)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1508333 () Bool)

(assert (=> b!1508333 (and (bvsge (index!53253 lt!654402) #b00000000000000000000000000000000) (bvslt (index!53253 lt!654402) (size!49072 a!2804)))))

(declare-fun res!1028484 () Bool)

(assert (=> b!1508333 (= res!1028484 (= (select (arr!48520 a!2804) (index!53253 lt!654402)) (select (arr!48520 a!2804) j!70)))))

(assert (=> b!1508333 (=> res!1028484 e!842609)))

(assert (=> b!1508333 (= e!842607 e!842609)))

(declare-fun b!1508334 () Bool)

(assert (=> b!1508334 (and (bvsge (index!53253 lt!654402) #b00000000000000000000000000000000) (bvslt (index!53253 lt!654402) (size!49072 a!2804)))))

(declare-fun res!1028485 () Bool)

(assert (=> b!1508334 (= res!1028485 (= (select (arr!48520 a!2804) (index!53253 lt!654402)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1508334 (=> res!1028485 e!842609)))

(declare-fun b!1508335 () Bool)

(assert (=> b!1508335 (= e!842608 (Intermediate!12714 true (toIndex!0 (select (arr!48520 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(assert (= (and d!158213 c!139467) b!1508335))

(assert (= (and d!158213 (not c!139467)) b!1508327))

(assert (= (and b!1508327 c!139468) b!1508331))

(assert (= (and b!1508327 (not c!139468)) b!1508330))

(assert (= (and d!158213 c!139466) b!1508329))

(assert (= (and d!158213 (not c!139466)) b!1508328))

(assert (= (and b!1508328 res!1028483) b!1508333))

(assert (= (and b!1508333 (not res!1028484)) b!1508334))

(assert (= (and b!1508334 (not res!1028485)) b!1508332))

(assert (=> b!1508330 m!1390111))

(declare-fun m!1390223 () Bool)

(assert (=> b!1508330 m!1390223))

(assert (=> b!1508330 m!1390223))

(assert (=> b!1508330 m!1390091))

(declare-fun m!1390225 () Bool)

(assert (=> b!1508330 m!1390225))

(declare-fun m!1390227 () Bool)

(assert (=> b!1508332 m!1390227))

(assert (=> b!1508334 m!1390227))

(assert (=> b!1508333 m!1390227))

(assert (=> d!158213 m!1390111))

(declare-fun m!1390235 () Bool)

(assert (=> d!158213 m!1390235))

(assert (=> d!158213 m!1390101))

(assert (=> b!1508157 d!158213))

(declare-fun d!158215 () Bool)

(declare-fun lt!654406 () (_ BitVec 32))

(declare-fun lt!654405 () (_ BitVec 32))

(assert (=> d!158215 (= lt!654406 (bvmul (bvxor lt!654405 (bvlshr lt!654405 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158215 (= lt!654405 ((_ extract 31 0) (bvand (bvxor (select (arr!48520 a!2804) j!70) (bvlshr (select (arr!48520 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158215 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1028427 (let ((h!36490 ((_ extract 31 0) (bvand (bvxor (select (arr!48520 a!2804) j!70) (bvlshr (select (arr!48520 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!135015 (bvmul (bvxor h!36490 (bvlshr h!36490 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!135015 (bvlshr x!135015 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1028427 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1028427 #b00000000000000000000000000000000))))))

(assert (=> d!158215 (= (toIndex!0 (select (arr!48520 a!2804) j!70) mask!2512) (bvand (bvxor lt!654406 (bvlshr lt!654406 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1508157 d!158215))

(declare-fun b!1508353 () Bool)

(declare-fun e!842623 () Bool)

(declare-fun e!842622 () Bool)

(assert (=> b!1508353 (= e!842623 e!842622)))

(declare-fun lt!654419 () (_ BitVec 64))

(assert (=> b!1508353 (= lt!654419 (select (arr!48520 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50181 0))(
  ( (Unit!50182) )
))
(declare-fun lt!654420 () Unit!50181)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100561 (_ BitVec 64) (_ BitVec 32)) Unit!50181)

(assert (=> b!1508353 (= lt!654420 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654419 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1508353 (arrayContainsKey!0 a!2804 lt!654419 #b00000000000000000000000000000000)))

(declare-fun lt!654421 () Unit!50181)

(assert (=> b!1508353 (= lt!654421 lt!654420)))

(declare-fun res!1028494 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100561 (_ BitVec 32)) SeekEntryResult!12714)

(assert (=> b!1508353 (= res!1028494 (= (seekEntryOrOpen!0 (select (arr!48520 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12714 #b00000000000000000000000000000000)))))

(assert (=> b!1508353 (=> (not res!1028494) (not e!842622))))

(declare-fun b!1508354 () Bool)

(declare-fun call!68273 () Bool)

(assert (=> b!1508354 (= e!842622 call!68273)))

(declare-fun b!1508355 () Bool)

(assert (=> b!1508355 (= e!842623 call!68273)))

(declare-fun bm!68270 () Bool)

(assert (=> bm!68270 (= call!68273 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun d!158219 () Bool)

(declare-fun res!1028495 () Bool)

(declare-fun e!842624 () Bool)

(assert (=> d!158219 (=> res!1028495 e!842624)))

(assert (=> d!158219 (= res!1028495 (bvsge #b00000000000000000000000000000000 (size!49072 a!2804)))))

(assert (=> d!158219 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!842624)))

(declare-fun b!1508356 () Bool)

(assert (=> b!1508356 (= e!842624 e!842623)))

(declare-fun c!139474 () Bool)

(assert (=> b!1508356 (= c!139474 (validKeyInArray!0 (select (arr!48520 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158219 (not res!1028495)) b!1508356))

(assert (= (and b!1508356 c!139474) b!1508353))

(assert (= (and b!1508356 (not c!139474)) b!1508355))

(assert (= (and b!1508353 res!1028494) b!1508354))

(assert (= (or b!1508354 b!1508355) bm!68270))

(assert (=> b!1508353 m!1390215))

(declare-fun m!1390239 () Bool)

(assert (=> b!1508353 m!1390239))

(declare-fun m!1390241 () Bool)

(assert (=> b!1508353 m!1390241))

(assert (=> b!1508353 m!1390215))

(declare-fun m!1390243 () Bool)

(assert (=> b!1508353 m!1390243))

(declare-fun m!1390245 () Bool)

(assert (=> bm!68270 m!1390245))

(assert (=> b!1508356 m!1390215))

(assert (=> b!1508356 m!1390215))

(assert (=> b!1508356 m!1390219))

(assert (=> b!1508152 d!158219))

(check-sat (not b!1508330) (not bm!68270) (not d!158213) (not b!1508326) (not b!1508353) (not bm!68267) (not b!1508283) (not b!1508322) (not d!158193) (not b!1508325) (not b!1508356))
(check-sat)
