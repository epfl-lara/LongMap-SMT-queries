; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129296 () Bool)

(assert start!129296)

(declare-fun b!1519260 () Bool)

(declare-fun res!1039372 () Bool)

(declare-fun e!847428 () Bool)

(assert (=> b!1519260 (=> (not res!1039372) (not e!847428))))

(declare-datatypes ((array!101152 0))(
  ( (array!101153 (arr!48814 (Array (_ BitVec 32) (_ BitVec 64))) (size!49366 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101152)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101152 (_ BitVec 32)) Bool)

(assert (=> b!1519260 (= res!1039372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun e!847431 () Bool)

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun b!1519261 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1519261 (= e!847431 (not (or (not (= (select (arr!48814 a!2804) j!70) (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (= index!487 resIndex!21))))))

(declare-fun e!847429 () Bool)

(assert (=> b!1519261 e!847429))

(declare-fun res!1039374 () Bool)

(assert (=> b!1519261 (=> (not res!1039374) (not e!847429))))

(assert (=> b!1519261 (= res!1039374 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50723 0))(
  ( (Unit!50724) )
))
(declare-fun lt!658422 () Unit!50723)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101152 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50723)

(assert (=> b!1519261 (= lt!658422 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1519262 () Bool)

(declare-fun res!1039375 () Bool)

(assert (=> b!1519262 (=> (not res!1039375) (not e!847428))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1519262 (= res!1039375 (validKeyInArray!0 (select (arr!48814 a!2804) i!961)))))

(declare-fun b!1519263 () Bool)

(declare-fun res!1039379 () Bool)

(assert (=> b!1519263 (=> (not res!1039379) (not e!847431))))

(declare-datatypes ((SeekEntryResult!13008 0))(
  ( (MissingZero!13008 (index!54427 (_ BitVec 32))) (Found!13008 (index!54428 (_ BitVec 32))) (Intermediate!13008 (undefined!13820 Bool) (index!54429 (_ BitVec 32)) (x!136096 (_ BitVec 32))) (Undefined!13008) (MissingVacant!13008 (index!54430 (_ BitVec 32))) )
))
(declare-fun lt!658420 () SeekEntryResult!13008)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101152 (_ BitVec 32)) SeekEntryResult!13008)

(assert (=> b!1519263 (= res!1039379 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48814 a!2804) j!70) a!2804 mask!2512) lt!658420))))

(declare-fun b!1519264 () Bool)

(declare-fun res!1039369 () Bool)

(assert (=> b!1519264 (=> (not res!1039369) (not e!847428))))

(assert (=> b!1519264 (= res!1039369 (validKeyInArray!0 (select (arr!48814 a!2804) j!70)))))

(declare-fun b!1519265 () Bool)

(declare-fun res!1039371 () Bool)

(assert (=> b!1519265 (=> (not res!1039371) (not e!847428))))

(assert (=> b!1519265 (= res!1039371 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49366 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49366 a!2804))))))

(declare-fun b!1519267 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101152 (_ BitVec 32)) SeekEntryResult!13008)

(assert (=> b!1519267 (= e!847429 (= (seekEntry!0 (select (arr!48814 a!2804) j!70) a!2804 mask!2512) (Found!13008 j!70)))))

(declare-fun b!1519268 () Bool)

(declare-fun res!1039378 () Bool)

(assert (=> b!1519268 (=> (not res!1039378) (not e!847431))))

(declare-fun lt!658421 () SeekEntryResult!13008)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519268 (= res!1039378 (= lt!658421 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101153 (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49366 a!2804)) mask!2512)))))

(declare-fun b!1519269 () Bool)

(assert (=> b!1519269 (= e!847428 e!847431)))

(declare-fun res!1039376 () Bool)

(assert (=> b!1519269 (=> (not res!1039376) (not e!847431))))

(assert (=> b!1519269 (= res!1039376 (= lt!658421 lt!658420))))

(assert (=> b!1519269 (= lt!658420 (Intermediate!13008 false resIndex!21 resX!21))))

(assert (=> b!1519269 (= lt!658421 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48814 a!2804) j!70) mask!2512) (select (arr!48814 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519270 () Bool)

(declare-fun res!1039373 () Bool)

(assert (=> b!1519270 (=> (not res!1039373) (not e!847428))))

(assert (=> b!1519270 (= res!1039373 (and (= (size!49366 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49366 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49366 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1519266 () Bool)

(declare-fun res!1039377 () Bool)

(assert (=> b!1519266 (=> (not res!1039377) (not e!847428))))

(declare-datatypes ((List!35375 0))(
  ( (Nil!35372) (Cons!35371 (h!36784 (_ BitVec 64)) (t!50061 List!35375)) )
))
(declare-fun arrayNoDuplicates!0 (array!101152 (_ BitVec 32) List!35375) Bool)

(assert (=> b!1519266 (= res!1039377 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35372))))

(declare-fun res!1039370 () Bool)

(assert (=> start!129296 (=> (not res!1039370) (not e!847428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129296 (= res!1039370 (validMask!0 mask!2512))))

(assert (=> start!129296 e!847428))

(assert (=> start!129296 true))

(declare-fun array_inv!38047 (array!101152) Bool)

(assert (=> start!129296 (array_inv!38047 a!2804)))

(assert (= (and start!129296 res!1039370) b!1519270))

(assert (= (and b!1519270 res!1039373) b!1519262))

(assert (= (and b!1519262 res!1039375) b!1519264))

(assert (= (and b!1519264 res!1039369) b!1519260))

(assert (= (and b!1519260 res!1039372) b!1519266))

(assert (= (and b!1519266 res!1039377) b!1519265))

(assert (= (and b!1519265 res!1039371) b!1519269))

(assert (= (and b!1519269 res!1039376) b!1519263))

(assert (= (and b!1519263 res!1039379) b!1519268))

(assert (= (and b!1519268 res!1039378) b!1519261))

(assert (= (and b!1519261 res!1039374) b!1519267))

(declare-fun m!1402115 () Bool)

(assert (=> b!1519263 m!1402115))

(assert (=> b!1519263 m!1402115))

(declare-fun m!1402117 () Bool)

(assert (=> b!1519263 m!1402117))

(declare-fun m!1402119 () Bool)

(assert (=> start!129296 m!1402119))

(declare-fun m!1402121 () Bool)

(assert (=> start!129296 m!1402121))

(assert (=> b!1519264 m!1402115))

(assert (=> b!1519264 m!1402115))

(declare-fun m!1402123 () Bool)

(assert (=> b!1519264 m!1402123))

(assert (=> b!1519269 m!1402115))

(assert (=> b!1519269 m!1402115))

(declare-fun m!1402125 () Bool)

(assert (=> b!1519269 m!1402125))

(assert (=> b!1519269 m!1402125))

(assert (=> b!1519269 m!1402115))

(declare-fun m!1402127 () Bool)

(assert (=> b!1519269 m!1402127))

(assert (=> b!1519261 m!1402115))

(declare-fun m!1402129 () Bool)

(assert (=> b!1519261 m!1402129))

(declare-fun m!1402131 () Bool)

(assert (=> b!1519261 m!1402131))

(declare-fun m!1402133 () Bool)

(assert (=> b!1519261 m!1402133))

(declare-fun m!1402135 () Bool)

(assert (=> b!1519261 m!1402135))

(declare-fun m!1402137 () Bool)

(assert (=> b!1519266 m!1402137))

(assert (=> b!1519268 m!1402131))

(assert (=> b!1519268 m!1402133))

(assert (=> b!1519268 m!1402133))

(declare-fun m!1402139 () Bool)

(assert (=> b!1519268 m!1402139))

(assert (=> b!1519268 m!1402139))

(assert (=> b!1519268 m!1402133))

(declare-fun m!1402141 () Bool)

(assert (=> b!1519268 m!1402141))

(assert (=> b!1519267 m!1402115))

(assert (=> b!1519267 m!1402115))

(declare-fun m!1402143 () Bool)

(assert (=> b!1519267 m!1402143))

(declare-fun m!1402145 () Bool)

(assert (=> b!1519260 m!1402145))

(declare-fun m!1402147 () Bool)

(assert (=> b!1519262 m!1402147))

(assert (=> b!1519262 m!1402147))

(declare-fun m!1402149 () Bool)

(assert (=> b!1519262 m!1402149))

(check-sat (not b!1519266) (not b!1519269) (not b!1519267) (not b!1519260) (not b!1519262) (not b!1519264) (not b!1519261) (not start!129296) (not b!1519268) (not b!1519263))
(check-sat)
(get-model)

(declare-fun b!1519345 () Bool)

(declare-fun e!847463 () Bool)

(declare-fun e!847462 () Bool)

(assert (=> b!1519345 (= e!847463 e!847462)))

(declare-fun lt!658449 () (_ BitVec 64))

(assert (=> b!1519345 (= lt!658449 (select (arr!48814 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!658447 () Unit!50723)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101152 (_ BitVec 64) (_ BitVec 32)) Unit!50723)

(assert (=> b!1519345 (= lt!658447 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!658449 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!101152 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1519345 (arrayContainsKey!0 a!2804 lt!658449 #b00000000000000000000000000000000)))

(declare-fun lt!658448 () Unit!50723)

(assert (=> b!1519345 (= lt!658448 lt!658447)))

(declare-fun res!1039451 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101152 (_ BitVec 32)) SeekEntryResult!13008)

(assert (=> b!1519345 (= res!1039451 (= (seekEntryOrOpen!0 (select (arr!48814 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13008 #b00000000000000000000000000000000)))))

(assert (=> b!1519345 (=> (not res!1039451) (not e!847462))))

(declare-fun b!1519346 () Bool)

(declare-fun call!68276 () Bool)

(assert (=> b!1519346 (= e!847462 call!68276)))

(declare-fun b!1519347 () Bool)

(declare-fun e!847464 () Bool)

(assert (=> b!1519347 (= e!847464 e!847463)))

(declare-fun c!139492 () Bool)

(assert (=> b!1519347 (= c!139492 (validKeyInArray!0 (select (arr!48814 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!158439 () Bool)

(declare-fun res!1039450 () Bool)

(assert (=> d!158439 (=> res!1039450 e!847464)))

(assert (=> d!158439 (= res!1039450 (bvsge #b00000000000000000000000000000000 (size!49366 a!2804)))))

(assert (=> d!158439 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!847464)))

(declare-fun b!1519348 () Bool)

(assert (=> b!1519348 (= e!847463 call!68276)))

(declare-fun bm!68273 () Bool)

(assert (=> bm!68273 (= call!68276 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!158439 (not res!1039450)) b!1519347))

(assert (= (and b!1519347 c!139492) b!1519345))

(assert (= (and b!1519347 (not c!139492)) b!1519348))

(assert (= (and b!1519345 res!1039451) b!1519346))

(assert (= (or b!1519346 b!1519348) bm!68273))

(declare-fun m!1402223 () Bool)

(assert (=> b!1519345 m!1402223))

(declare-fun m!1402225 () Bool)

(assert (=> b!1519345 m!1402225))

(declare-fun m!1402227 () Bool)

(assert (=> b!1519345 m!1402227))

(assert (=> b!1519345 m!1402223))

(declare-fun m!1402229 () Bool)

(assert (=> b!1519345 m!1402229))

(assert (=> b!1519347 m!1402223))

(assert (=> b!1519347 m!1402223))

(declare-fun m!1402231 () Bool)

(assert (=> b!1519347 m!1402231))

(declare-fun m!1402233 () Bool)

(assert (=> bm!68273 m!1402233))

(assert (=> b!1519260 d!158439))

(declare-fun bm!68276 () Bool)

(declare-fun call!68279 () Bool)

(declare-fun c!139495 () Bool)

(assert (=> bm!68276 (= call!68279 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139495 (Cons!35371 (select (arr!48814 a!2804) #b00000000000000000000000000000000) Nil!35372) Nil!35372)))))

(declare-fun b!1519360 () Bool)

(declare-fun e!847473 () Bool)

(declare-fun e!847475 () Bool)

(assert (=> b!1519360 (= e!847473 e!847475)))

(declare-fun res!1039458 () Bool)

(assert (=> b!1519360 (=> (not res!1039458) (not e!847475))))

(declare-fun e!847476 () Bool)

(assert (=> b!1519360 (= res!1039458 (not e!847476))))

(declare-fun res!1039460 () Bool)

(assert (=> b!1519360 (=> (not res!1039460) (not e!847476))))

(assert (=> b!1519360 (= res!1039460 (validKeyInArray!0 (select (arr!48814 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1519361 () Bool)

(declare-fun e!847474 () Bool)

(assert (=> b!1519361 (= e!847475 e!847474)))

(assert (=> b!1519361 (= c!139495 (validKeyInArray!0 (select (arr!48814 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1519362 () Bool)

(assert (=> b!1519362 (= e!847474 call!68279)))

(declare-fun b!1519363 () Bool)

(declare-fun contains!9941 (List!35375 (_ BitVec 64)) Bool)

(assert (=> b!1519363 (= e!847476 (contains!9941 Nil!35372 (select (arr!48814 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!158441 () Bool)

(declare-fun res!1039459 () Bool)

(assert (=> d!158441 (=> res!1039459 e!847473)))

(assert (=> d!158441 (= res!1039459 (bvsge #b00000000000000000000000000000000 (size!49366 a!2804)))))

(assert (=> d!158441 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35372) e!847473)))

(declare-fun b!1519359 () Bool)

(assert (=> b!1519359 (= e!847474 call!68279)))

(assert (= (and d!158441 (not res!1039459)) b!1519360))

(assert (= (and b!1519360 res!1039460) b!1519363))

(assert (= (and b!1519360 res!1039458) b!1519361))

(assert (= (and b!1519361 c!139495) b!1519362))

(assert (= (and b!1519361 (not c!139495)) b!1519359))

(assert (= (or b!1519362 b!1519359) bm!68276))

(assert (=> bm!68276 m!1402223))

(declare-fun m!1402235 () Bool)

(assert (=> bm!68276 m!1402235))

(assert (=> b!1519360 m!1402223))

(assert (=> b!1519360 m!1402223))

(assert (=> b!1519360 m!1402231))

(assert (=> b!1519361 m!1402223))

(assert (=> b!1519361 m!1402223))

(assert (=> b!1519361 m!1402231))

(assert (=> b!1519363 m!1402223))

(assert (=> b!1519363 m!1402223))

(declare-fun m!1402237 () Bool)

(assert (=> b!1519363 m!1402237))

(assert (=> b!1519266 d!158441))

(declare-fun b!1519412 () Bool)

(declare-fun lt!658471 () SeekEntryResult!13008)

(assert (=> b!1519412 (and (bvsge (index!54429 lt!658471) #b00000000000000000000000000000000) (bvslt (index!54429 lt!658471) (size!49366 a!2804)))))

(declare-fun res!1039480 () Bool)

(assert (=> b!1519412 (= res!1039480 (= (select (arr!48814 a!2804) (index!54429 lt!658471)) (select (arr!48814 a!2804) j!70)))))

(declare-fun e!847510 () Bool)

(assert (=> b!1519412 (=> res!1039480 e!847510)))

(declare-fun e!847508 () Bool)

(assert (=> b!1519412 (= e!847508 e!847510)))

(declare-fun e!847507 () SeekEntryResult!13008)

(declare-fun b!1519413 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1519413 (= e!847507 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48814 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48814 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519414 () Bool)

(declare-fun e!847506 () SeekEntryResult!13008)

(assert (=> b!1519414 (= e!847506 e!847507)))

(declare-fun c!139513 () Bool)

(declare-fun lt!658470 () (_ BitVec 64))

(assert (=> b!1519414 (= c!139513 (or (= lt!658470 (select (arr!48814 a!2804) j!70)) (= (bvadd lt!658470 lt!658470) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!158445 () Bool)

(declare-fun e!847509 () Bool)

(assert (=> d!158445 e!847509))

(declare-fun c!139512 () Bool)

(get-info :version)

(assert (=> d!158445 (= c!139512 (and ((_ is Intermediate!13008) lt!658471) (undefined!13820 lt!658471)))))

(assert (=> d!158445 (= lt!658471 e!847506)))

(declare-fun c!139511 () Bool)

(assert (=> d!158445 (= c!139511 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!158445 (= lt!658470 (select (arr!48814 a!2804) (toIndex!0 (select (arr!48814 a!2804) j!70) mask!2512)))))

(assert (=> d!158445 (validMask!0 mask!2512)))

(assert (=> d!158445 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48814 a!2804) j!70) mask!2512) (select (arr!48814 a!2804) j!70) a!2804 mask!2512) lt!658471)))

(declare-fun b!1519415 () Bool)

(assert (=> b!1519415 (and (bvsge (index!54429 lt!658471) #b00000000000000000000000000000000) (bvslt (index!54429 lt!658471) (size!49366 a!2804)))))

(declare-fun res!1039481 () Bool)

(assert (=> b!1519415 (= res!1039481 (= (select (arr!48814 a!2804) (index!54429 lt!658471)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1519415 (=> res!1039481 e!847510)))

(declare-fun b!1519416 () Bool)

(assert (=> b!1519416 (= e!847509 (bvsge (x!136096 lt!658471) #b01111111111111111111111111111110))))

(declare-fun b!1519417 () Bool)

(assert (=> b!1519417 (= e!847509 e!847508)))

(declare-fun res!1039479 () Bool)

(assert (=> b!1519417 (= res!1039479 (and ((_ is Intermediate!13008) lt!658471) (not (undefined!13820 lt!658471)) (bvslt (x!136096 lt!658471) #b01111111111111111111111111111110) (bvsge (x!136096 lt!658471) #b00000000000000000000000000000000) (bvsge (x!136096 lt!658471) #b00000000000000000000000000000000)))))

(assert (=> b!1519417 (=> (not res!1039479) (not e!847508))))

(declare-fun b!1519418 () Bool)

(assert (=> b!1519418 (and (bvsge (index!54429 lt!658471) #b00000000000000000000000000000000) (bvslt (index!54429 lt!658471) (size!49366 a!2804)))))

(assert (=> b!1519418 (= e!847510 (= (select (arr!48814 a!2804) (index!54429 lt!658471)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1519419 () Bool)

(assert (=> b!1519419 (= e!847506 (Intermediate!13008 true (toIndex!0 (select (arr!48814 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1519420 () Bool)

(assert (=> b!1519420 (= e!847507 (Intermediate!13008 false (toIndex!0 (select (arr!48814 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(assert (= (and d!158445 c!139511) b!1519419))

(assert (= (and d!158445 (not c!139511)) b!1519414))

(assert (= (and b!1519414 c!139513) b!1519420))

(assert (= (and b!1519414 (not c!139513)) b!1519413))

(assert (= (and d!158445 c!139512) b!1519416))

(assert (= (and d!158445 (not c!139512)) b!1519417))

(assert (= (and b!1519417 res!1039479) b!1519412))

(assert (= (and b!1519412 (not res!1039480)) b!1519415))

(assert (= (and b!1519415 (not res!1039481)) b!1519418))

(declare-fun m!1402249 () Bool)

(assert (=> b!1519418 m!1402249))

(assert (=> d!158445 m!1402125))

(declare-fun m!1402251 () Bool)

(assert (=> d!158445 m!1402251))

(assert (=> d!158445 m!1402119))

(assert (=> b!1519413 m!1402125))

(declare-fun m!1402253 () Bool)

(assert (=> b!1519413 m!1402253))

(assert (=> b!1519413 m!1402253))

(assert (=> b!1519413 m!1402115))

(declare-fun m!1402255 () Bool)

(assert (=> b!1519413 m!1402255))

(assert (=> b!1519415 m!1402249))

(assert (=> b!1519412 m!1402249))

(assert (=> b!1519269 d!158445))

(declare-fun d!158453 () Bool)

(declare-fun lt!658479 () (_ BitVec 32))

(declare-fun lt!658478 () (_ BitVec 32))

(assert (=> d!158453 (= lt!658479 (bvmul (bvxor lt!658478 (bvlshr lt!658478 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158453 (= lt!658478 ((_ extract 31 0) (bvand (bvxor (select (arr!48814 a!2804) j!70) (bvlshr (select (arr!48814 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158453 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1039485 (let ((h!36787 ((_ extract 31 0) (bvand (bvxor (select (arr!48814 a!2804) j!70) (bvlshr (select (arr!48814 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136101 (bvmul (bvxor h!36787 (bvlshr h!36787 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136101 (bvlshr x!136101 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1039485 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1039485 #b00000000000000000000000000000000))))))

(assert (=> d!158453 (= (toIndex!0 (select (arr!48814 a!2804) j!70) mask!2512) (bvand (bvxor lt!658479 (bvlshr lt!658479 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1519269 d!158453))

(declare-fun d!158461 () Bool)

(assert (=> d!158461 (= (validKeyInArray!0 (select (arr!48814 a!2804) j!70)) (and (not (= (select (arr!48814 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48814 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1519264 d!158461))

(declare-fun b!1519438 () Bool)

(declare-fun lt!658485 () SeekEntryResult!13008)

(assert (=> b!1519438 (and (bvsge (index!54429 lt!658485) #b00000000000000000000000000000000) (bvslt (index!54429 lt!658485) (size!49366 (array!101153 (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49366 a!2804)))))))

(declare-fun res!1039487 () Bool)

(assert (=> b!1519438 (= res!1039487 (= (select (arr!48814 (array!101153 (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49366 a!2804))) (index!54429 lt!658485)) (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(declare-fun e!847524 () Bool)

(assert (=> b!1519438 (=> res!1039487 e!847524)))

(declare-fun e!847522 () Bool)

(assert (=> b!1519438 (= e!847522 e!847524)))

(declare-fun b!1519439 () Bool)

(declare-fun e!847521 () SeekEntryResult!13008)

(assert (=> b!1519439 (= e!847521 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101153 (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49366 a!2804)) mask!2512))))

(declare-fun b!1519440 () Bool)

(declare-fun e!847520 () SeekEntryResult!13008)

(assert (=> b!1519440 (= e!847520 e!847521)))

(declare-fun lt!658484 () (_ BitVec 64))

(declare-fun c!139523 () Bool)

(assert (=> b!1519440 (= c!139523 (or (= lt!658484 (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!658484 lt!658484) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!158463 () Bool)

(declare-fun e!847523 () Bool)

(assert (=> d!158463 e!847523))

(declare-fun c!139522 () Bool)

(assert (=> d!158463 (= c!139522 (and ((_ is Intermediate!13008) lt!658485) (undefined!13820 lt!658485)))))

(assert (=> d!158463 (= lt!658485 e!847520)))

(declare-fun c!139521 () Bool)

(assert (=> d!158463 (= c!139521 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!158463 (= lt!658484 (select (arr!48814 (array!101153 (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49366 a!2804))) (toIndex!0 (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!158463 (validMask!0 mask!2512)))

(assert (=> d!158463 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101153 (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49366 a!2804)) mask!2512) lt!658485)))

(declare-fun b!1519441 () Bool)

(assert (=> b!1519441 (and (bvsge (index!54429 lt!658485) #b00000000000000000000000000000000) (bvslt (index!54429 lt!658485) (size!49366 (array!101153 (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49366 a!2804)))))))

(declare-fun res!1039488 () Bool)

(assert (=> b!1519441 (= res!1039488 (= (select (arr!48814 (array!101153 (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49366 a!2804))) (index!54429 lt!658485)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1519441 (=> res!1039488 e!847524)))

(declare-fun b!1519442 () Bool)

(assert (=> b!1519442 (= e!847523 (bvsge (x!136096 lt!658485) #b01111111111111111111111111111110))))

(declare-fun b!1519443 () Bool)

(assert (=> b!1519443 (= e!847523 e!847522)))

(declare-fun res!1039486 () Bool)

(assert (=> b!1519443 (= res!1039486 (and ((_ is Intermediate!13008) lt!658485) (not (undefined!13820 lt!658485)) (bvslt (x!136096 lt!658485) #b01111111111111111111111111111110) (bvsge (x!136096 lt!658485) #b00000000000000000000000000000000) (bvsge (x!136096 lt!658485) #b00000000000000000000000000000000)))))

(assert (=> b!1519443 (=> (not res!1039486) (not e!847522))))

(declare-fun b!1519444 () Bool)

(assert (=> b!1519444 (and (bvsge (index!54429 lt!658485) #b00000000000000000000000000000000) (bvslt (index!54429 lt!658485) (size!49366 (array!101153 (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49366 a!2804)))))))

(assert (=> b!1519444 (= e!847524 (= (select (arr!48814 (array!101153 (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49366 a!2804))) (index!54429 lt!658485)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1519445 () Bool)

(assert (=> b!1519445 (= e!847520 (Intermediate!13008 true (toIndex!0 (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1519446 () Bool)

(assert (=> b!1519446 (= e!847521 (Intermediate!13008 false (toIndex!0 (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(assert (= (and d!158463 c!139521) b!1519445))

(assert (= (and d!158463 (not c!139521)) b!1519440))

(assert (= (and b!1519440 c!139523) b!1519446))

(assert (= (and b!1519440 (not c!139523)) b!1519439))

(assert (= (and d!158463 c!139522) b!1519442))

(assert (= (and d!158463 (not c!139522)) b!1519443))

(assert (= (and b!1519443 res!1039486) b!1519438))

(assert (= (and b!1519438 (not res!1039487)) b!1519441))

(assert (= (and b!1519441 (not res!1039488)) b!1519444))

(declare-fun m!1402265 () Bool)

(assert (=> b!1519444 m!1402265))

(assert (=> d!158463 m!1402139))

(declare-fun m!1402267 () Bool)

(assert (=> d!158463 m!1402267))

(assert (=> d!158463 m!1402119))

(assert (=> b!1519439 m!1402139))

(declare-fun m!1402269 () Bool)

(assert (=> b!1519439 m!1402269))

(assert (=> b!1519439 m!1402269))

(assert (=> b!1519439 m!1402133))

(declare-fun m!1402271 () Bool)

(assert (=> b!1519439 m!1402271))

(assert (=> b!1519441 m!1402265))

(assert (=> b!1519438 m!1402265))

(assert (=> b!1519268 d!158463))

(declare-fun d!158465 () Bool)

(declare-fun lt!658487 () (_ BitVec 32))

(declare-fun lt!658486 () (_ BitVec 32))

(assert (=> d!158465 (= lt!658487 (bvmul (bvxor lt!658486 (bvlshr lt!658486 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158465 (= lt!658486 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158465 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1039485 (let ((h!36787 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136101 (bvmul (bvxor h!36787 (bvlshr h!36787 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136101 (bvlshr x!136101 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1039485 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1039485 #b00000000000000000000000000000000))))))

(assert (=> d!158465 (= (toIndex!0 (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!658487 (bvlshr lt!658487 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1519268 d!158465))

(declare-fun d!158467 () Bool)

(assert (=> d!158467 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129296 d!158467))

(declare-fun d!158479 () Bool)

(assert (=> d!158479 (= (array_inv!38047 a!2804) (bvsge (size!49366 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129296 d!158479))

(declare-fun b!1519497 () Bool)

(declare-fun lt!658506 () SeekEntryResult!13008)

(assert (=> b!1519497 (and (bvsge (index!54429 lt!658506) #b00000000000000000000000000000000) (bvslt (index!54429 lt!658506) (size!49366 a!2804)))))

(declare-fun res!1039515 () Bool)

(assert (=> b!1519497 (= res!1039515 (= (select (arr!48814 a!2804) (index!54429 lt!658506)) (select (arr!48814 a!2804) j!70)))))

(declare-fun e!847562 () Bool)

(assert (=> b!1519497 (=> res!1039515 e!847562)))

(declare-fun e!847560 () Bool)

(assert (=> b!1519497 (= e!847560 e!847562)))

(declare-fun b!1519498 () Bool)

(declare-fun e!847559 () SeekEntryResult!13008)

(assert (=> b!1519498 (= e!847559 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48814 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519499 () Bool)

(declare-fun e!847558 () SeekEntryResult!13008)

(assert (=> b!1519499 (= e!847558 e!847559)))

(declare-fun lt!658503 () (_ BitVec 64))

(declare-fun c!139539 () Bool)

(assert (=> b!1519499 (= c!139539 (or (= lt!658503 (select (arr!48814 a!2804) j!70)) (= (bvadd lt!658503 lt!658503) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!158481 () Bool)

(declare-fun e!847561 () Bool)

(assert (=> d!158481 e!847561))

(declare-fun c!139538 () Bool)

(assert (=> d!158481 (= c!139538 (and ((_ is Intermediate!13008) lt!658506) (undefined!13820 lt!658506)))))

(assert (=> d!158481 (= lt!658506 e!847558)))

(declare-fun c!139537 () Bool)

(assert (=> d!158481 (= c!139537 (bvsge x!534 #b01111111111111111111111111111110))))

(assert (=> d!158481 (= lt!658503 (select (arr!48814 a!2804) index!487))))

(assert (=> d!158481 (validMask!0 mask!2512)))

(assert (=> d!158481 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48814 a!2804) j!70) a!2804 mask!2512) lt!658506)))

(declare-fun b!1519500 () Bool)

(assert (=> b!1519500 (and (bvsge (index!54429 lt!658506) #b00000000000000000000000000000000) (bvslt (index!54429 lt!658506) (size!49366 a!2804)))))

(declare-fun res!1039516 () Bool)

(assert (=> b!1519500 (= res!1039516 (= (select (arr!48814 a!2804) (index!54429 lt!658506)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1519500 (=> res!1039516 e!847562)))

(declare-fun b!1519501 () Bool)

(assert (=> b!1519501 (= e!847561 (bvsge (x!136096 lt!658506) #b01111111111111111111111111111110))))

(declare-fun b!1519502 () Bool)

(assert (=> b!1519502 (= e!847561 e!847560)))

(declare-fun res!1039514 () Bool)

(assert (=> b!1519502 (= res!1039514 (and ((_ is Intermediate!13008) lt!658506) (not (undefined!13820 lt!658506)) (bvslt (x!136096 lt!658506) #b01111111111111111111111111111110) (bvsge (x!136096 lt!658506) #b00000000000000000000000000000000) (bvsge (x!136096 lt!658506) x!534)))))

(assert (=> b!1519502 (=> (not res!1039514) (not e!847560))))

(declare-fun b!1519503 () Bool)

(assert (=> b!1519503 (and (bvsge (index!54429 lt!658506) #b00000000000000000000000000000000) (bvslt (index!54429 lt!658506) (size!49366 a!2804)))))

(assert (=> b!1519503 (= e!847562 (= (select (arr!48814 a!2804) (index!54429 lt!658506)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1519504 () Bool)

(assert (=> b!1519504 (= e!847558 (Intermediate!13008 true index!487 x!534))))

(declare-fun b!1519505 () Bool)

(assert (=> b!1519505 (= e!847559 (Intermediate!13008 false index!487 x!534))))

(assert (= (and d!158481 c!139537) b!1519504))

(assert (= (and d!158481 (not c!139537)) b!1519499))

(assert (= (and b!1519499 c!139539) b!1519505))

(assert (= (and b!1519499 (not c!139539)) b!1519498))

(assert (= (and d!158481 c!139538) b!1519501))

(assert (= (and d!158481 (not c!139538)) b!1519502))

(assert (= (and b!1519502 res!1039514) b!1519497))

(assert (= (and b!1519497 (not res!1039515)) b!1519500))

(assert (= (and b!1519500 (not res!1039516)) b!1519503))

(declare-fun m!1402301 () Bool)

(assert (=> b!1519503 m!1402301))

(declare-fun m!1402305 () Bool)

(assert (=> d!158481 m!1402305))

(assert (=> d!158481 m!1402119))

(declare-fun m!1402307 () Bool)

(assert (=> b!1519498 m!1402307))

(assert (=> b!1519498 m!1402307))

(assert (=> b!1519498 m!1402115))

(declare-fun m!1402311 () Bool)

(assert (=> b!1519498 m!1402311))

(assert (=> b!1519500 m!1402301))

(assert (=> b!1519497 m!1402301))

(assert (=> b!1519263 d!158481))

(declare-fun b!1519511 () Bool)

(declare-fun e!847569 () Bool)

(declare-fun e!847567 () Bool)

(assert (=> b!1519511 (= e!847569 e!847567)))

(declare-fun lt!658511 () (_ BitVec 64))

(assert (=> b!1519511 (= lt!658511 (select (arr!48814 a!2804) j!70))))

(declare-fun lt!658509 () Unit!50723)

(assert (=> b!1519511 (= lt!658509 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!658511 j!70))))

(assert (=> b!1519511 (arrayContainsKey!0 a!2804 lt!658511 #b00000000000000000000000000000000)))

(declare-fun lt!658510 () Unit!50723)

(assert (=> b!1519511 (= lt!658510 lt!658509)))

(declare-fun res!1039521 () Bool)

(assert (=> b!1519511 (= res!1039521 (= (seekEntryOrOpen!0 (select (arr!48814 a!2804) j!70) a!2804 mask!2512) (Found!13008 j!70)))))

(assert (=> b!1519511 (=> (not res!1039521) (not e!847567))))

(declare-fun b!1519512 () Bool)

(declare-fun call!68290 () Bool)

(assert (=> b!1519512 (= e!847567 call!68290)))

(declare-fun b!1519513 () Bool)

(declare-fun e!847571 () Bool)

(assert (=> b!1519513 (= e!847571 e!847569)))

(declare-fun c!139541 () Bool)

(assert (=> b!1519513 (= c!139541 (validKeyInArray!0 (select (arr!48814 a!2804) j!70)))))

(declare-fun d!158487 () Bool)

(declare-fun res!1039520 () Bool)

(assert (=> d!158487 (=> res!1039520 e!847571)))

(assert (=> d!158487 (= res!1039520 (bvsge j!70 (size!49366 a!2804)))))

(assert (=> d!158487 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!847571)))

(declare-fun b!1519514 () Bool)

(assert (=> b!1519514 (= e!847569 call!68290)))

(declare-fun bm!68286 () Bool)

(assert (=> bm!68286 (= call!68290 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!158487 (not res!1039520)) b!1519513))

(assert (= (and b!1519513 c!139541) b!1519511))

(assert (= (and b!1519513 (not c!139541)) b!1519514))

(assert (= (and b!1519511 res!1039521) b!1519512))

(assert (= (or b!1519512 b!1519514) bm!68286))

(assert (=> b!1519511 m!1402115))

(declare-fun m!1402315 () Bool)

(assert (=> b!1519511 m!1402315))

(declare-fun m!1402317 () Bool)

(assert (=> b!1519511 m!1402317))

(assert (=> b!1519511 m!1402115))

(declare-fun m!1402323 () Bool)

(assert (=> b!1519511 m!1402323))

(assert (=> b!1519513 m!1402115))

(assert (=> b!1519513 m!1402115))

(assert (=> b!1519513 m!1402123))

(declare-fun m!1402329 () Bool)

(assert (=> bm!68286 m!1402329))

(assert (=> b!1519261 d!158487))

(declare-fun d!158489 () Bool)

(assert (=> d!158489 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!658517 () Unit!50723)

(declare-fun choose!38 (array!101152 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50723)

(assert (=> d!158489 (= lt!658517 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!158489 (validMask!0 mask!2512)))

(assert (=> d!158489 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!658517)))

(declare-fun bs!43570 () Bool)

(assert (= bs!43570 d!158489))

(assert (=> bs!43570 m!1402135))

(declare-fun m!1402333 () Bool)

(assert (=> bs!43570 m!1402333))

(assert (=> bs!43570 m!1402119))

(assert (=> b!1519261 d!158489))

(declare-fun b!1519572 () Bool)

(declare-fun e!847605 () SeekEntryResult!13008)

(assert (=> b!1519572 (= e!847605 Undefined!13008)))

(declare-fun b!1519573 () Bool)

(declare-fun e!847606 () SeekEntryResult!13008)

(declare-fun lt!658547 () SeekEntryResult!13008)

(assert (=> b!1519573 (= e!847606 (ite ((_ is MissingVacant!13008) lt!658547) (MissingZero!13008 (index!54430 lt!658547)) lt!658547))))

(declare-fun lt!658546 () SeekEntryResult!13008)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101152 (_ BitVec 32)) SeekEntryResult!13008)

(assert (=> b!1519573 (= lt!658547 (seekKeyOrZeroReturnVacant!0 (x!136096 lt!658546) (index!54429 lt!658546) (index!54429 lt!658546) (select (arr!48814 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519574 () Bool)

(assert (=> b!1519574 (= e!847606 (MissingZero!13008 (index!54429 lt!658546)))))

(declare-fun b!1519575 () Bool)

(declare-fun e!847604 () SeekEntryResult!13008)

(assert (=> b!1519575 (= e!847604 (Found!13008 (index!54429 lt!658546)))))

(declare-fun b!1519576 () Bool)

(assert (=> b!1519576 (= e!847605 e!847604)))

(declare-fun lt!658549 () (_ BitVec 64))

(assert (=> b!1519576 (= lt!658549 (select (arr!48814 a!2804) (index!54429 lt!658546)))))

(declare-fun c!139564 () Bool)

(assert (=> b!1519576 (= c!139564 (= lt!658549 (select (arr!48814 a!2804) j!70)))))

(declare-fun b!1519577 () Bool)

(declare-fun c!139565 () Bool)

(assert (=> b!1519577 (= c!139565 (= lt!658549 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1519577 (= e!847604 e!847606)))

(declare-fun d!158493 () Bool)

(declare-fun lt!658548 () SeekEntryResult!13008)

(assert (=> d!158493 (and (or ((_ is MissingVacant!13008) lt!658548) (not ((_ is Found!13008) lt!658548)) (and (bvsge (index!54428 lt!658548) #b00000000000000000000000000000000) (bvslt (index!54428 lt!658548) (size!49366 a!2804)))) (not ((_ is MissingVacant!13008) lt!658548)) (or (not ((_ is Found!13008) lt!658548)) (= (select (arr!48814 a!2804) (index!54428 lt!658548)) (select (arr!48814 a!2804) j!70))))))

(assert (=> d!158493 (= lt!658548 e!847605)))

(declare-fun c!139566 () Bool)

(assert (=> d!158493 (= c!139566 (and ((_ is Intermediate!13008) lt!658546) (undefined!13820 lt!658546)))))

(assert (=> d!158493 (= lt!658546 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48814 a!2804) j!70) mask!2512) (select (arr!48814 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!158493 (validMask!0 mask!2512)))

(assert (=> d!158493 (= (seekEntry!0 (select (arr!48814 a!2804) j!70) a!2804 mask!2512) lt!658548)))

(assert (= (and d!158493 c!139566) b!1519572))

(assert (= (and d!158493 (not c!139566)) b!1519576))

(assert (= (and b!1519576 c!139564) b!1519575))

(assert (= (and b!1519576 (not c!139564)) b!1519577))

(assert (= (and b!1519577 c!139565) b!1519574))

(assert (= (and b!1519577 (not c!139565)) b!1519573))

(assert (=> b!1519573 m!1402115))

(declare-fun m!1402359 () Bool)

(assert (=> b!1519573 m!1402359))

(declare-fun m!1402361 () Bool)

(assert (=> b!1519576 m!1402361))

(declare-fun m!1402363 () Bool)

(assert (=> d!158493 m!1402363))

(assert (=> d!158493 m!1402115))

(assert (=> d!158493 m!1402125))

(assert (=> d!158493 m!1402125))

(assert (=> d!158493 m!1402115))

(assert (=> d!158493 m!1402127))

(assert (=> d!158493 m!1402119))

(assert (=> b!1519267 d!158493))

(declare-fun d!158507 () Bool)

(assert (=> d!158507 (= (validKeyInArray!0 (select (arr!48814 a!2804) i!961)) (and (not (= (select (arr!48814 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48814 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1519262 d!158507))

(check-sat (not d!158445) (not d!158463) (not b!1519345) (not d!158493) (not bm!68286) (not b!1519511) (not d!158481) (not b!1519360) (not b!1519363) (not d!158489) (not b!1519413) (not bm!68273) (not b!1519513) (not b!1519498) (not b!1519347) (not b!1519361) (not bm!68276) (not b!1519439) (not b!1519573))
(check-sat)
(get-model)

(declare-fun b!1519619 () Bool)

(declare-fun e!847631 () Bool)

(declare-fun e!847630 () Bool)

(assert (=> b!1519619 (= e!847631 e!847630)))

(declare-fun lt!658578 () (_ BitVec 64))

(assert (=> b!1519619 (= lt!658578 (select (arr!48814 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!658576 () Unit!50723)

(assert (=> b!1519619 (= lt!658576 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!658578 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1519619 (arrayContainsKey!0 a!2804 lt!658578 #b00000000000000000000000000000000)))

(declare-fun lt!658577 () Unit!50723)

(assert (=> b!1519619 (= lt!658577 lt!658576)))

(declare-fun res!1039546 () Bool)

(assert (=> b!1519619 (= res!1039546 (= (seekEntryOrOpen!0 (select (arr!48814 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2804 mask!2512) (Found!13008 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1519619 (=> (not res!1039546) (not e!847630))))

(declare-fun b!1519620 () Bool)

(declare-fun call!68295 () Bool)

(assert (=> b!1519620 (= e!847630 call!68295)))

(declare-fun b!1519621 () Bool)

(declare-fun e!847632 () Bool)

(assert (=> b!1519621 (= e!847632 e!847631)))

(declare-fun c!139583 () Bool)

(assert (=> b!1519621 (= c!139583 (validKeyInArray!0 (select (arr!48814 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!158523 () Bool)

(declare-fun res!1039545 () Bool)

(assert (=> d!158523 (=> res!1039545 e!847632)))

(assert (=> d!158523 (= res!1039545 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49366 a!2804)))))

(assert (=> d!158523 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512) e!847632)))

(declare-fun b!1519622 () Bool)

(assert (=> b!1519622 (= e!847631 call!68295)))

(declare-fun bm!68292 () Bool)

(assert (=> bm!68292 (= call!68295 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!158523 (not res!1039545)) b!1519621))

(assert (= (and b!1519621 c!139583) b!1519619))

(assert (= (and b!1519621 (not c!139583)) b!1519622))

(assert (= (and b!1519619 res!1039546) b!1519620))

(assert (= (or b!1519620 b!1519622) bm!68292))

(declare-fun m!1402391 () Bool)

(assert (=> b!1519619 m!1402391))

(declare-fun m!1402393 () Bool)

(assert (=> b!1519619 m!1402393))

(declare-fun m!1402395 () Bool)

(assert (=> b!1519619 m!1402395))

(assert (=> b!1519619 m!1402391))

(declare-fun m!1402397 () Bool)

(assert (=> b!1519619 m!1402397))

(assert (=> b!1519621 m!1402391))

(assert (=> b!1519621 m!1402391))

(declare-fun m!1402399 () Bool)

(assert (=> b!1519621 m!1402399))

(declare-fun m!1402401 () Bool)

(assert (=> bm!68292 m!1402401))

(assert (=> bm!68273 d!158523))

(declare-fun d!158525 () Bool)

(assert (=> d!158525 (= (validKeyInArray!0 (select (arr!48814 a!2804) #b00000000000000000000000000000000)) (and (not (= (select (arr!48814 a!2804) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48814 a!2804) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1519361 d!158525))

(declare-fun d!158527 () Bool)

(assert (=> d!158527 (arrayContainsKey!0 a!2804 lt!658511 #b00000000000000000000000000000000)))

(declare-fun lt!658581 () Unit!50723)

(declare-fun choose!13 (array!101152 (_ BitVec 64) (_ BitVec 32)) Unit!50723)

(assert (=> d!158527 (= lt!658581 (choose!13 a!2804 lt!658511 j!70))))

(assert (=> d!158527 (bvsge j!70 #b00000000000000000000000000000000)))

(assert (=> d!158527 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!658511 j!70) lt!658581)))

(declare-fun bs!43572 () Bool)

(assert (= bs!43572 d!158527))

(assert (=> bs!43572 m!1402317))

(declare-fun m!1402403 () Bool)

(assert (=> bs!43572 m!1402403))

(assert (=> b!1519511 d!158527))

(declare-fun d!158529 () Bool)

(declare-fun res!1039551 () Bool)

(declare-fun e!847637 () Bool)

(assert (=> d!158529 (=> res!1039551 e!847637)))

(assert (=> d!158529 (= res!1039551 (= (select (arr!48814 a!2804) #b00000000000000000000000000000000) lt!658511))))

(assert (=> d!158529 (= (arrayContainsKey!0 a!2804 lt!658511 #b00000000000000000000000000000000) e!847637)))

(declare-fun b!1519627 () Bool)

(declare-fun e!847638 () Bool)

(assert (=> b!1519627 (= e!847637 e!847638)))

(declare-fun res!1039552 () Bool)

(assert (=> b!1519627 (=> (not res!1039552) (not e!847638))))

(assert (=> b!1519627 (= res!1039552 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49366 a!2804)))))

(declare-fun b!1519628 () Bool)

(assert (=> b!1519628 (= e!847638 (arrayContainsKey!0 a!2804 lt!658511 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!158529 (not res!1039551)) b!1519627))

(assert (= (and b!1519627 res!1039552) b!1519628))

(assert (=> d!158529 m!1402223))

(declare-fun m!1402405 () Bool)

(assert (=> b!1519628 m!1402405))

(assert (=> b!1519511 d!158529))

(declare-fun d!158531 () Bool)

(declare-fun lt!658589 () SeekEntryResult!13008)

(assert (=> d!158531 (and (or ((_ is Undefined!13008) lt!658589) (not ((_ is Found!13008) lt!658589)) (and (bvsge (index!54428 lt!658589) #b00000000000000000000000000000000) (bvslt (index!54428 lt!658589) (size!49366 a!2804)))) (or ((_ is Undefined!13008) lt!658589) ((_ is Found!13008) lt!658589) (not ((_ is MissingZero!13008) lt!658589)) (and (bvsge (index!54427 lt!658589) #b00000000000000000000000000000000) (bvslt (index!54427 lt!658589) (size!49366 a!2804)))) (or ((_ is Undefined!13008) lt!658589) ((_ is Found!13008) lt!658589) ((_ is MissingZero!13008) lt!658589) (not ((_ is MissingVacant!13008) lt!658589)) (and (bvsge (index!54430 lt!658589) #b00000000000000000000000000000000) (bvslt (index!54430 lt!658589) (size!49366 a!2804)))) (or ((_ is Undefined!13008) lt!658589) (ite ((_ is Found!13008) lt!658589) (= (select (arr!48814 a!2804) (index!54428 lt!658589)) (select (arr!48814 a!2804) j!70)) (ite ((_ is MissingZero!13008) lt!658589) (= (select (arr!48814 a!2804) (index!54427 lt!658589)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13008) lt!658589) (= (select (arr!48814 a!2804) (index!54430 lt!658589)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!847647 () SeekEntryResult!13008)

(assert (=> d!158531 (= lt!658589 e!847647)))

(declare-fun c!139590 () Bool)

(declare-fun lt!658588 () SeekEntryResult!13008)

(assert (=> d!158531 (= c!139590 (and ((_ is Intermediate!13008) lt!658588) (undefined!13820 lt!658588)))))

(assert (=> d!158531 (= lt!658588 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48814 a!2804) j!70) mask!2512) (select (arr!48814 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!158531 (validMask!0 mask!2512)))

(assert (=> d!158531 (= (seekEntryOrOpen!0 (select (arr!48814 a!2804) j!70) a!2804 mask!2512) lt!658589)))

(declare-fun b!1519641 () Bool)

(declare-fun e!847646 () SeekEntryResult!13008)

(assert (=> b!1519641 (= e!847646 (MissingZero!13008 (index!54429 lt!658588)))))

(declare-fun b!1519642 () Bool)

(declare-fun e!847645 () SeekEntryResult!13008)

(assert (=> b!1519642 (= e!847647 e!847645)))

(declare-fun lt!658590 () (_ BitVec 64))

(assert (=> b!1519642 (= lt!658590 (select (arr!48814 a!2804) (index!54429 lt!658588)))))

(declare-fun c!139591 () Bool)

(assert (=> b!1519642 (= c!139591 (= lt!658590 (select (arr!48814 a!2804) j!70)))))

(declare-fun b!1519643 () Bool)

(assert (=> b!1519643 (= e!847645 (Found!13008 (index!54429 lt!658588)))))

(declare-fun b!1519644 () Bool)

(assert (=> b!1519644 (= e!847646 (seekKeyOrZeroReturnVacant!0 (x!136096 lt!658588) (index!54429 lt!658588) (index!54429 lt!658588) (select (arr!48814 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519645 () Bool)

(declare-fun c!139592 () Bool)

(assert (=> b!1519645 (= c!139592 (= lt!658590 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1519645 (= e!847645 e!847646)))

(declare-fun b!1519646 () Bool)

(assert (=> b!1519646 (= e!847647 Undefined!13008)))

(assert (= (and d!158531 c!139590) b!1519646))

(assert (= (and d!158531 (not c!139590)) b!1519642))

(assert (= (and b!1519642 c!139591) b!1519643))

(assert (= (and b!1519642 (not c!139591)) b!1519645))

(assert (= (and b!1519645 c!139592) b!1519641))

(assert (= (and b!1519645 (not c!139592)) b!1519644))

(assert (=> d!158531 m!1402125))

(assert (=> d!158531 m!1402115))

(assert (=> d!158531 m!1402127))

(declare-fun m!1402407 () Bool)

(assert (=> d!158531 m!1402407))

(assert (=> d!158531 m!1402115))

(assert (=> d!158531 m!1402125))

(declare-fun m!1402409 () Bool)

(assert (=> d!158531 m!1402409))

(assert (=> d!158531 m!1402119))

(declare-fun m!1402411 () Bool)

(assert (=> d!158531 m!1402411))

(declare-fun m!1402413 () Bool)

(assert (=> b!1519642 m!1402413))

(assert (=> b!1519644 m!1402115))

(declare-fun m!1402415 () Bool)

(assert (=> b!1519644 m!1402415))

(assert (=> b!1519511 d!158531))

(declare-fun d!158533 () Bool)

(declare-fun lt!658593 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!776 (List!35375) (InoxSet (_ BitVec 64)))

(assert (=> d!158533 (= lt!658593 (select (content!776 Nil!35372) (select (arr!48814 a!2804) #b00000000000000000000000000000000)))))

(declare-fun e!847652 () Bool)

(assert (=> d!158533 (= lt!658593 e!847652)))

(declare-fun res!1039558 () Bool)

(assert (=> d!158533 (=> (not res!1039558) (not e!847652))))

(assert (=> d!158533 (= res!1039558 ((_ is Cons!35371) Nil!35372))))

(assert (=> d!158533 (= (contains!9941 Nil!35372 (select (arr!48814 a!2804) #b00000000000000000000000000000000)) lt!658593)))

(declare-fun b!1519651 () Bool)

(declare-fun e!847653 () Bool)

(assert (=> b!1519651 (= e!847652 e!847653)))

(declare-fun res!1039557 () Bool)

(assert (=> b!1519651 (=> res!1039557 e!847653)))

(assert (=> b!1519651 (= res!1039557 (= (h!36784 Nil!35372) (select (arr!48814 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1519652 () Bool)

(assert (=> b!1519652 (= e!847653 (contains!9941 (t!50061 Nil!35372) (select (arr!48814 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158533 res!1039558) b!1519651))

(assert (= (and b!1519651 (not res!1039557)) b!1519652))

(declare-fun m!1402417 () Bool)

(assert (=> d!158533 m!1402417))

(assert (=> d!158533 m!1402223))

(declare-fun m!1402419 () Bool)

(assert (=> d!158533 m!1402419))

(assert (=> b!1519652 m!1402223))

(declare-fun m!1402421 () Bool)

(assert (=> b!1519652 m!1402421))

(assert (=> b!1519363 d!158533))

(assert (=> d!158489 d!158487))

(declare-fun d!158535 () Bool)

(assert (=> d!158535 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(assert (=> d!158535 true))

(declare-fun _$72!152 () Unit!50723)

(assert (=> d!158535 (= (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) _$72!152)))

(declare-fun bs!43573 () Bool)

(assert (= bs!43573 d!158535))

(assert (=> bs!43573 m!1402135))

(assert (=> d!158489 d!158535))

(assert (=> d!158489 d!158467))

(declare-fun b!1519653 () Bool)

(declare-fun lt!658595 () SeekEntryResult!13008)

(assert (=> b!1519653 (and (bvsge (index!54429 lt!658595) #b00000000000000000000000000000000) (bvslt (index!54429 lt!658595) (size!49366 a!2804)))))

(declare-fun res!1039560 () Bool)

(assert (=> b!1519653 (= res!1039560 (= (select (arr!48814 a!2804) (index!54429 lt!658595)) (select (arr!48814 a!2804) j!70)))))

(declare-fun e!847658 () Bool)

(assert (=> b!1519653 (=> res!1039560 e!847658)))

(declare-fun e!847656 () Bool)

(assert (=> b!1519653 (= e!847656 e!847658)))

(declare-fun b!1519654 () Bool)

(declare-fun e!847655 () SeekEntryResult!13008)

(assert (=> b!1519654 (= e!847655 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!487 x!534 mask!2512) (bvadd x!534 #b00000000000000000000000000000001) mask!2512) (select (arr!48814 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519655 () Bool)

(declare-fun e!847654 () SeekEntryResult!13008)

(assert (=> b!1519655 (= e!847654 e!847655)))

(declare-fun lt!658594 () (_ BitVec 64))

(declare-fun c!139595 () Bool)

(assert (=> b!1519655 (= c!139595 (or (= lt!658594 (select (arr!48814 a!2804) j!70)) (= (bvadd lt!658594 lt!658594) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!158537 () Bool)

(declare-fun e!847657 () Bool)

(assert (=> d!158537 e!847657))

(declare-fun c!139594 () Bool)

(assert (=> d!158537 (= c!139594 (and ((_ is Intermediate!13008) lt!658595) (undefined!13820 lt!658595)))))

(assert (=> d!158537 (= lt!658595 e!847654)))

(declare-fun c!139593 () Bool)

(assert (=> d!158537 (= c!139593 (bvsge (bvadd x!534 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!158537 (= lt!658594 (select (arr!48814 a!2804) (nextIndex!0 index!487 x!534 mask!2512)))))

(assert (=> d!158537 (validMask!0 mask!2512)))

(assert (=> d!158537 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48814 a!2804) j!70) a!2804 mask!2512) lt!658595)))

(declare-fun b!1519656 () Bool)

(assert (=> b!1519656 (and (bvsge (index!54429 lt!658595) #b00000000000000000000000000000000) (bvslt (index!54429 lt!658595) (size!49366 a!2804)))))

(declare-fun res!1039561 () Bool)

(assert (=> b!1519656 (= res!1039561 (= (select (arr!48814 a!2804) (index!54429 lt!658595)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1519656 (=> res!1039561 e!847658)))

(declare-fun b!1519657 () Bool)

(assert (=> b!1519657 (= e!847657 (bvsge (x!136096 lt!658595) #b01111111111111111111111111111110))))

(declare-fun b!1519658 () Bool)

(assert (=> b!1519658 (= e!847657 e!847656)))

(declare-fun res!1039559 () Bool)

(assert (=> b!1519658 (= res!1039559 (and ((_ is Intermediate!13008) lt!658595) (not (undefined!13820 lt!658595)) (bvslt (x!136096 lt!658595) #b01111111111111111111111111111110) (bvsge (x!136096 lt!658595) #b00000000000000000000000000000000) (bvsge (x!136096 lt!658595) (bvadd x!534 #b00000000000000000000000000000001))))))

(assert (=> b!1519658 (=> (not res!1039559) (not e!847656))))

(declare-fun b!1519659 () Bool)

(assert (=> b!1519659 (and (bvsge (index!54429 lt!658595) #b00000000000000000000000000000000) (bvslt (index!54429 lt!658595) (size!49366 a!2804)))))

(assert (=> b!1519659 (= e!847658 (= (select (arr!48814 a!2804) (index!54429 lt!658595)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1519660 () Bool)

(assert (=> b!1519660 (= e!847654 (Intermediate!13008 true (nextIndex!0 index!487 x!534 mask!2512) (bvadd x!534 #b00000000000000000000000000000001)))))

(declare-fun b!1519661 () Bool)

(assert (=> b!1519661 (= e!847655 (Intermediate!13008 false (nextIndex!0 index!487 x!534 mask!2512) (bvadd x!534 #b00000000000000000000000000000001)))))

(assert (= (and d!158537 c!139593) b!1519660))

(assert (= (and d!158537 (not c!139593)) b!1519655))

(assert (= (and b!1519655 c!139595) b!1519661))

(assert (= (and b!1519655 (not c!139595)) b!1519654))

(assert (= (and d!158537 c!139594) b!1519657))

(assert (= (and d!158537 (not c!139594)) b!1519658))

(assert (= (and b!1519658 res!1039559) b!1519653))

(assert (= (and b!1519653 (not res!1039560)) b!1519656))

(assert (= (and b!1519656 (not res!1039561)) b!1519659))

(declare-fun m!1402423 () Bool)

(assert (=> b!1519659 m!1402423))

(assert (=> d!158537 m!1402307))

(declare-fun m!1402425 () Bool)

(assert (=> d!158537 m!1402425))

(assert (=> d!158537 m!1402119))

(assert (=> b!1519654 m!1402307))

(declare-fun m!1402427 () Bool)

(assert (=> b!1519654 m!1402427))

(assert (=> b!1519654 m!1402427))

(assert (=> b!1519654 m!1402115))

(declare-fun m!1402429 () Bool)

(assert (=> b!1519654 m!1402429))

(assert (=> b!1519656 m!1402423))

(assert (=> b!1519653 m!1402423))

(assert (=> b!1519498 d!158537))

(declare-fun d!158539 () Bool)

(declare-fun lt!658598 () (_ BitVec 32))

(assert (=> d!158539 (and (bvsge lt!658598 #b00000000000000000000000000000000) (bvslt lt!658598 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!158539 (= lt!658598 (choose!52 index!487 x!534 mask!2512))))

(assert (=> d!158539 (validMask!0 mask!2512)))

(assert (=> d!158539 (= (nextIndex!0 index!487 x!534 mask!2512) lt!658598)))

(declare-fun bs!43574 () Bool)

(assert (= bs!43574 d!158539))

(declare-fun m!1402431 () Bool)

(assert (=> bs!43574 m!1402431))

(assert (=> bs!43574 m!1402119))

(assert (=> b!1519498 d!158539))

(declare-fun d!158541 () Bool)

(declare-fun lt!658603 () SeekEntryResult!13008)

(assert (=> d!158541 (and (or ((_ is Undefined!13008) lt!658603) (not ((_ is Found!13008) lt!658603)) (and (bvsge (index!54428 lt!658603) #b00000000000000000000000000000000) (bvslt (index!54428 lt!658603) (size!49366 a!2804)))) (or ((_ is Undefined!13008) lt!658603) ((_ is Found!13008) lt!658603) (not ((_ is MissingVacant!13008) lt!658603)) (not (= (index!54430 lt!658603) (index!54429 lt!658546))) (and (bvsge (index!54430 lt!658603) #b00000000000000000000000000000000) (bvslt (index!54430 lt!658603) (size!49366 a!2804)))) (or ((_ is Undefined!13008) lt!658603) (ite ((_ is Found!13008) lt!658603) (= (select (arr!48814 a!2804) (index!54428 lt!658603)) (select (arr!48814 a!2804) j!70)) (and ((_ is MissingVacant!13008) lt!658603) (= (index!54430 lt!658603) (index!54429 lt!658546)) (= (select (arr!48814 a!2804) (index!54430 lt!658603)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!847667 () SeekEntryResult!13008)

(assert (=> d!158541 (= lt!658603 e!847667)))

(declare-fun c!139603 () Bool)

(assert (=> d!158541 (= c!139603 (bvsge (x!136096 lt!658546) #b01111111111111111111111111111110))))

(declare-fun lt!658604 () (_ BitVec 64))

(assert (=> d!158541 (= lt!658604 (select (arr!48814 a!2804) (index!54429 lt!658546)))))

(assert (=> d!158541 (validMask!0 mask!2512)))

(assert (=> d!158541 (= (seekKeyOrZeroReturnVacant!0 (x!136096 lt!658546) (index!54429 lt!658546) (index!54429 lt!658546) (select (arr!48814 a!2804) j!70) a!2804 mask!2512) lt!658603)))

(declare-fun b!1519674 () Bool)

(declare-fun e!847665 () SeekEntryResult!13008)

(assert (=> b!1519674 (= e!847665 (MissingVacant!13008 (index!54429 lt!658546)))))

(declare-fun b!1519675 () Bool)

(declare-fun e!847666 () SeekEntryResult!13008)

(assert (=> b!1519675 (= e!847667 e!847666)))

(declare-fun c!139604 () Bool)

(assert (=> b!1519675 (= c!139604 (= lt!658604 (select (arr!48814 a!2804) j!70)))))

(declare-fun b!1519676 () Bool)

(assert (=> b!1519676 (= e!847667 Undefined!13008)))

(declare-fun b!1519677 () Bool)

(assert (=> b!1519677 (= e!847665 (seekKeyOrZeroReturnVacant!0 (bvadd (x!136096 lt!658546) #b00000000000000000000000000000001) (nextIndex!0 (index!54429 lt!658546) (x!136096 lt!658546) mask!2512) (index!54429 lt!658546) (select (arr!48814 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519678 () Bool)

(declare-fun c!139602 () Bool)

(assert (=> b!1519678 (= c!139602 (= lt!658604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1519678 (= e!847666 e!847665)))

(declare-fun b!1519679 () Bool)

(assert (=> b!1519679 (= e!847666 (Found!13008 (index!54429 lt!658546)))))

(assert (= (and d!158541 c!139603) b!1519676))

(assert (= (and d!158541 (not c!139603)) b!1519675))

(assert (= (and b!1519675 c!139604) b!1519679))

(assert (= (and b!1519675 (not c!139604)) b!1519678))

(assert (= (and b!1519678 c!139602) b!1519674))

(assert (= (and b!1519678 (not c!139602)) b!1519677))

(declare-fun m!1402433 () Bool)

(assert (=> d!158541 m!1402433))

(declare-fun m!1402435 () Bool)

(assert (=> d!158541 m!1402435))

(assert (=> d!158541 m!1402361))

(assert (=> d!158541 m!1402119))

(declare-fun m!1402437 () Bool)

(assert (=> b!1519677 m!1402437))

(assert (=> b!1519677 m!1402437))

(assert (=> b!1519677 m!1402115))

(declare-fun m!1402439 () Bool)

(assert (=> b!1519677 m!1402439))

(assert (=> b!1519573 d!158541))

(assert (=> b!1519513 d!158461))

(assert (=> d!158481 d!158467))

(declare-fun d!158543 () Bool)

(assert (=> d!158543 (arrayContainsKey!0 a!2804 lt!658449 #b00000000000000000000000000000000)))

(declare-fun lt!658605 () Unit!50723)

(assert (=> d!158543 (= lt!658605 (choose!13 a!2804 lt!658449 #b00000000000000000000000000000000))))

(assert (=> d!158543 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!158543 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!658449 #b00000000000000000000000000000000) lt!658605)))

(declare-fun bs!43575 () Bool)

(assert (= bs!43575 d!158543))

(assert (=> bs!43575 m!1402227))

(declare-fun m!1402441 () Bool)

(assert (=> bs!43575 m!1402441))

(assert (=> b!1519345 d!158543))

(declare-fun d!158545 () Bool)

(declare-fun res!1039562 () Bool)

(declare-fun e!847668 () Bool)

(assert (=> d!158545 (=> res!1039562 e!847668)))

(assert (=> d!158545 (= res!1039562 (= (select (arr!48814 a!2804) #b00000000000000000000000000000000) lt!658449))))

(assert (=> d!158545 (= (arrayContainsKey!0 a!2804 lt!658449 #b00000000000000000000000000000000) e!847668)))

(declare-fun b!1519680 () Bool)

(declare-fun e!847669 () Bool)

(assert (=> b!1519680 (= e!847668 e!847669)))

(declare-fun res!1039563 () Bool)

(assert (=> b!1519680 (=> (not res!1039563) (not e!847669))))

(assert (=> b!1519680 (= res!1039563 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49366 a!2804)))))

(declare-fun b!1519681 () Bool)

(assert (=> b!1519681 (= e!847669 (arrayContainsKey!0 a!2804 lt!658449 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!158545 (not res!1039562)) b!1519680))

(assert (= (and b!1519680 res!1039563) b!1519681))

(assert (=> d!158545 m!1402223))

(declare-fun m!1402443 () Bool)

(assert (=> b!1519681 m!1402443))

(assert (=> b!1519345 d!158545))

(declare-fun d!158547 () Bool)

(declare-fun lt!658607 () SeekEntryResult!13008)

(assert (=> d!158547 (and (or ((_ is Undefined!13008) lt!658607) (not ((_ is Found!13008) lt!658607)) (and (bvsge (index!54428 lt!658607) #b00000000000000000000000000000000) (bvslt (index!54428 lt!658607) (size!49366 a!2804)))) (or ((_ is Undefined!13008) lt!658607) ((_ is Found!13008) lt!658607) (not ((_ is MissingZero!13008) lt!658607)) (and (bvsge (index!54427 lt!658607) #b00000000000000000000000000000000) (bvslt (index!54427 lt!658607) (size!49366 a!2804)))) (or ((_ is Undefined!13008) lt!658607) ((_ is Found!13008) lt!658607) ((_ is MissingZero!13008) lt!658607) (not ((_ is MissingVacant!13008) lt!658607)) (and (bvsge (index!54430 lt!658607) #b00000000000000000000000000000000) (bvslt (index!54430 lt!658607) (size!49366 a!2804)))) (or ((_ is Undefined!13008) lt!658607) (ite ((_ is Found!13008) lt!658607) (= (select (arr!48814 a!2804) (index!54428 lt!658607)) (select (arr!48814 a!2804) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!13008) lt!658607) (= (select (arr!48814 a!2804) (index!54427 lt!658607)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!13008) lt!658607) (= (select (arr!48814 a!2804) (index!54430 lt!658607)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!847672 () SeekEntryResult!13008)

(assert (=> d!158547 (= lt!658607 e!847672)))

(declare-fun c!139605 () Bool)

(declare-fun lt!658606 () SeekEntryResult!13008)

(assert (=> d!158547 (= c!139605 (and ((_ is Intermediate!13008) lt!658606) (undefined!13820 lt!658606)))))

(assert (=> d!158547 (= lt!658606 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48814 a!2804) #b00000000000000000000000000000000) mask!2512) (select (arr!48814 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512))))

(assert (=> d!158547 (validMask!0 mask!2512)))

(assert (=> d!158547 (= (seekEntryOrOpen!0 (select (arr!48814 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) lt!658607)))

(declare-fun b!1519682 () Bool)

(declare-fun e!847671 () SeekEntryResult!13008)

(assert (=> b!1519682 (= e!847671 (MissingZero!13008 (index!54429 lt!658606)))))

(declare-fun b!1519683 () Bool)

(declare-fun e!847670 () SeekEntryResult!13008)

(assert (=> b!1519683 (= e!847672 e!847670)))

(declare-fun lt!658608 () (_ BitVec 64))

(assert (=> b!1519683 (= lt!658608 (select (arr!48814 a!2804) (index!54429 lt!658606)))))

(declare-fun c!139606 () Bool)

(assert (=> b!1519683 (= c!139606 (= lt!658608 (select (arr!48814 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1519684 () Bool)

(assert (=> b!1519684 (= e!847670 (Found!13008 (index!54429 lt!658606)))))

(declare-fun b!1519685 () Bool)

(assert (=> b!1519685 (= e!847671 (seekKeyOrZeroReturnVacant!0 (x!136096 lt!658606) (index!54429 lt!658606) (index!54429 lt!658606) (select (arr!48814 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512))))

(declare-fun b!1519686 () Bool)

(declare-fun c!139607 () Bool)

(assert (=> b!1519686 (= c!139607 (= lt!658608 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1519686 (= e!847670 e!847671)))

(declare-fun b!1519687 () Bool)

(assert (=> b!1519687 (= e!847672 Undefined!13008)))

(assert (= (and d!158547 c!139605) b!1519687))

(assert (= (and d!158547 (not c!139605)) b!1519683))

(assert (= (and b!1519683 c!139606) b!1519684))

(assert (= (and b!1519683 (not c!139606)) b!1519686))

(assert (= (and b!1519686 c!139607) b!1519682))

(assert (= (and b!1519686 (not c!139607)) b!1519685))

(declare-fun m!1402445 () Bool)

(assert (=> d!158547 m!1402445))

(assert (=> d!158547 m!1402223))

(declare-fun m!1402447 () Bool)

(assert (=> d!158547 m!1402447))

(declare-fun m!1402449 () Bool)

(assert (=> d!158547 m!1402449))

(assert (=> d!158547 m!1402223))

(assert (=> d!158547 m!1402445))

(declare-fun m!1402451 () Bool)

(assert (=> d!158547 m!1402451))

(assert (=> d!158547 m!1402119))

(declare-fun m!1402453 () Bool)

(assert (=> d!158547 m!1402453))

(declare-fun m!1402455 () Bool)

(assert (=> b!1519683 m!1402455))

(assert (=> b!1519685 m!1402223))

(declare-fun m!1402457 () Bool)

(assert (=> b!1519685 m!1402457))

(assert (=> b!1519345 d!158547))

(assert (=> b!1519347 d!158525))

(assert (=> d!158445 d!158467))

(assert (=> d!158463 d!158467))

(declare-fun c!139608 () Bool)

(declare-fun call!68296 () Bool)

(declare-fun bm!68293 () Bool)

(assert (=> bm!68293 (= call!68296 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!139608 (Cons!35371 (select (arr!48814 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!139495 (Cons!35371 (select (arr!48814 a!2804) #b00000000000000000000000000000000) Nil!35372) Nil!35372)) (ite c!139495 (Cons!35371 (select (arr!48814 a!2804) #b00000000000000000000000000000000) Nil!35372) Nil!35372))))))

(declare-fun b!1519689 () Bool)

(declare-fun e!847673 () Bool)

(declare-fun e!847675 () Bool)

(assert (=> b!1519689 (= e!847673 e!847675)))

(declare-fun res!1039564 () Bool)

(assert (=> b!1519689 (=> (not res!1039564) (not e!847675))))

(declare-fun e!847676 () Bool)

(assert (=> b!1519689 (= res!1039564 (not e!847676))))

(declare-fun res!1039566 () Bool)

(assert (=> b!1519689 (=> (not res!1039566) (not e!847676))))

(assert (=> b!1519689 (= res!1039566 (validKeyInArray!0 (select (arr!48814 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1519690 () Bool)

(declare-fun e!847674 () Bool)

(assert (=> b!1519690 (= e!847675 e!847674)))

(assert (=> b!1519690 (= c!139608 (validKeyInArray!0 (select (arr!48814 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1519691 () Bool)

(assert (=> b!1519691 (= e!847674 call!68296)))

(declare-fun b!1519692 () Bool)

(assert (=> b!1519692 (= e!847676 (contains!9941 (ite c!139495 (Cons!35371 (select (arr!48814 a!2804) #b00000000000000000000000000000000) Nil!35372) Nil!35372) (select (arr!48814 a!2804) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!158549 () Bool)

(declare-fun res!1039565 () Bool)

(assert (=> d!158549 (=> res!1039565 e!847673)))

(assert (=> d!158549 (= res!1039565 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49366 a!2804)))))

(assert (=> d!158549 (= (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139495 (Cons!35371 (select (arr!48814 a!2804) #b00000000000000000000000000000000) Nil!35372) Nil!35372)) e!847673)))

(declare-fun b!1519688 () Bool)

(assert (=> b!1519688 (= e!847674 call!68296)))

(assert (= (and d!158549 (not res!1039565)) b!1519689))

(assert (= (and b!1519689 res!1039566) b!1519692))

(assert (= (and b!1519689 res!1039564) b!1519690))

(assert (= (and b!1519690 c!139608) b!1519691))

(assert (= (and b!1519690 (not c!139608)) b!1519688))

(assert (= (or b!1519691 b!1519688) bm!68293))

(assert (=> bm!68293 m!1402391))

(declare-fun m!1402459 () Bool)

(assert (=> bm!68293 m!1402459))

(assert (=> b!1519689 m!1402391))

(assert (=> b!1519689 m!1402391))

(assert (=> b!1519689 m!1402399))

(assert (=> b!1519690 m!1402391))

(assert (=> b!1519690 m!1402391))

(assert (=> b!1519690 m!1402399))

(assert (=> b!1519692 m!1402391))

(assert (=> b!1519692 m!1402391))

(declare-fun m!1402461 () Bool)

(assert (=> b!1519692 m!1402461))

(assert (=> bm!68276 d!158549))

(declare-fun b!1519693 () Bool)

(declare-fun e!847678 () Bool)

(declare-fun e!847677 () Bool)

(assert (=> b!1519693 (= e!847678 e!847677)))

(declare-fun lt!658611 () (_ BitVec 64))

(assert (=> b!1519693 (= lt!658611 (select (arr!48814 a!2804) (bvadd j!70 #b00000000000000000000000000000001)))))

(declare-fun lt!658609 () Unit!50723)

(assert (=> b!1519693 (= lt!658609 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!658611 (bvadd j!70 #b00000000000000000000000000000001)))))

(assert (=> b!1519693 (arrayContainsKey!0 a!2804 lt!658611 #b00000000000000000000000000000000)))

(declare-fun lt!658610 () Unit!50723)

(assert (=> b!1519693 (= lt!658610 lt!658609)))

(declare-fun res!1039568 () Bool)

(assert (=> b!1519693 (= res!1039568 (= (seekEntryOrOpen!0 (select (arr!48814 a!2804) (bvadd j!70 #b00000000000000000000000000000001)) a!2804 mask!2512) (Found!13008 (bvadd j!70 #b00000000000000000000000000000001))))))

(assert (=> b!1519693 (=> (not res!1039568) (not e!847677))))

(declare-fun b!1519694 () Bool)

(declare-fun call!68297 () Bool)

(assert (=> b!1519694 (= e!847677 call!68297)))

(declare-fun b!1519695 () Bool)

(declare-fun e!847679 () Bool)

(assert (=> b!1519695 (= e!847679 e!847678)))

(declare-fun c!139609 () Bool)

(assert (=> b!1519695 (= c!139609 (validKeyInArray!0 (select (arr!48814 a!2804) (bvadd j!70 #b00000000000000000000000000000001))))))

(declare-fun d!158551 () Bool)

(declare-fun res!1039567 () Bool)

(assert (=> d!158551 (=> res!1039567 e!847679)))

(assert (=> d!158551 (= res!1039567 (bvsge (bvadd j!70 #b00000000000000000000000000000001) (size!49366 a!2804)))))

(assert (=> d!158551 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512) e!847679)))

(declare-fun b!1519696 () Bool)

(assert (=> b!1519696 (= e!847678 call!68297)))

(declare-fun bm!68294 () Bool)

(assert (=> bm!68294 (= call!68297 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!158551 (not res!1039567)) b!1519695))

(assert (= (and b!1519695 c!139609) b!1519693))

(assert (= (and b!1519695 (not c!139609)) b!1519696))

(assert (= (and b!1519693 res!1039568) b!1519694))

(assert (= (or b!1519694 b!1519696) bm!68294))

(declare-fun m!1402463 () Bool)

(assert (=> b!1519693 m!1402463))

(declare-fun m!1402465 () Bool)

(assert (=> b!1519693 m!1402465))

(declare-fun m!1402467 () Bool)

(assert (=> b!1519693 m!1402467))

(assert (=> b!1519693 m!1402463))

(declare-fun m!1402469 () Bool)

(assert (=> b!1519693 m!1402469))

(assert (=> b!1519695 m!1402463))

(assert (=> b!1519695 m!1402463))

(declare-fun m!1402471 () Bool)

(assert (=> b!1519695 m!1402471))

(declare-fun m!1402473 () Bool)

(assert (=> bm!68294 m!1402473))

(assert (=> bm!68286 d!158551))

(assert (=> b!1519360 d!158525))

(declare-fun b!1519697 () Bool)

(declare-fun lt!658613 () SeekEntryResult!13008)

(assert (=> b!1519697 (and (bvsge (index!54429 lt!658613) #b00000000000000000000000000000000) (bvslt (index!54429 lt!658613) (size!49366 (array!101153 (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49366 a!2804)))))))

(declare-fun res!1039570 () Bool)

(assert (=> b!1519697 (= res!1039570 (= (select (arr!48814 (array!101153 (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49366 a!2804))) (index!54429 lt!658613)) (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(declare-fun e!847684 () Bool)

(assert (=> b!1519697 (=> res!1039570 e!847684)))

(declare-fun e!847682 () Bool)

(assert (=> b!1519697 (= e!847682 e!847684)))

(declare-fun e!847681 () SeekEntryResult!13008)

(declare-fun b!1519698 () Bool)

(assert (=> b!1519698 (= e!847681 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101153 (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49366 a!2804)) mask!2512))))

(declare-fun b!1519699 () Bool)

(declare-fun e!847680 () SeekEntryResult!13008)

(assert (=> b!1519699 (= e!847680 e!847681)))

(declare-fun lt!658612 () (_ BitVec 64))

(declare-fun c!139612 () Bool)

(assert (=> b!1519699 (= c!139612 (or (= lt!658612 (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!658612 lt!658612) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!158553 () Bool)

(declare-fun e!847683 () Bool)

(assert (=> d!158553 e!847683))

(declare-fun c!139611 () Bool)

(assert (=> d!158553 (= c!139611 (and ((_ is Intermediate!13008) lt!658613) (undefined!13820 lt!658613)))))

(assert (=> d!158553 (= lt!658613 e!847680)))

(declare-fun c!139610 () Bool)

(assert (=> d!158553 (= c!139610 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!158553 (= lt!658612 (select (arr!48814 (array!101153 (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49366 a!2804))) (nextIndex!0 (toIndex!0 (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512)))))

(assert (=> d!158553 (validMask!0 mask!2512)))

(assert (=> d!158553 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101153 (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49366 a!2804)) mask!2512) lt!658613)))

(declare-fun b!1519700 () Bool)

(assert (=> b!1519700 (and (bvsge (index!54429 lt!658613) #b00000000000000000000000000000000) (bvslt (index!54429 lt!658613) (size!49366 (array!101153 (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49366 a!2804)))))))

(declare-fun res!1039571 () Bool)

(assert (=> b!1519700 (= res!1039571 (= (select (arr!48814 (array!101153 (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49366 a!2804))) (index!54429 lt!658613)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1519700 (=> res!1039571 e!847684)))

(declare-fun b!1519701 () Bool)

(assert (=> b!1519701 (= e!847683 (bvsge (x!136096 lt!658613) #b01111111111111111111111111111110))))

(declare-fun b!1519702 () Bool)

(assert (=> b!1519702 (= e!847683 e!847682)))

(declare-fun res!1039569 () Bool)

(assert (=> b!1519702 (= res!1039569 (and ((_ is Intermediate!13008) lt!658613) (not (undefined!13820 lt!658613)) (bvslt (x!136096 lt!658613) #b01111111111111111111111111111110) (bvsge (x!136096 lt!658613) #b00000000000000000000000000000000) (bvsge (x!136096 lt!658613) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1519702 (=> (not res!1039569) (not e!847682))))

(declare-fun b!1519703 () Bool)

(assert (=> b!1519703 (and (bvsge (index!54429 lt!658613) #b00000000000000000000000000000000) (bvslt (index!54429 lt!658613) (size!49366 (array!101153 (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49366 a!2804)))))))

(assert (=> b!1519703 (= e!847684 (= (select (arr!48814 (array!101153 (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49366 a!2804))) (index!54429 lt!658613)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1519704 () Bool)

(assert (=> b!1519704 (= e!847680 (Intermediate!13008 true (nextIndex!0 (toIndex!0 (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1519705 () Bool)

(assert (=> b!1519705 (= e!847681 (Intermediate!13008 false (nextIndex!0 (toIndex!0 (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!158553 c!139610) b!1519704))

(assert (= (and d!158553 (not c!139610)) b!1519699))

(assert (= (and b!1519699 c!139612) b!1519705))

(assert (= (and b!1519699 (not c!139612)) b!1519698))

(assert (= (and d!158553 c!139611) b!1519701))

(assert (= (and d!158553 (not c!139611)) b!1519702))

(assert (= (and b!1519702 res!1039569) b!1519697))

(assert (= (and b!1519697 (not res!1039570)) b!1519700))

(assert (= (and b!1519700 (not res!1039571)) b!1519703))

(declare-fun m!1402475 () Bool)

(assert (=> b!1519703 m!1402475))

(assert (=> d!158553 m!1402269))

(declare-fun m!1402477 () Bool)

(assert (=> d!158553 m!1402477))

(assert (=> d!158553 m!1402119))

(assert (=> b!1519698 m!1402269))

(declare-fun m!1402479 () Bool)

(assert (=> b!1519698 m!1402479))

(assert (=> b!1519698 m!1402479))

(assert (=> b!1519698 m!1402133))

(declare-fun m!1402481 () Bool)

(assert (=> b!1519698 m!1402481))

(assert (=> b!1519700 m!1402475))

(assert (=> b!1519697 m!1402475))

(assert (=> b!1519439 d!158553))

(declare-fun d!158555 () Bool)

(declare-fun lt!658614 () (_ BitVec 32))

(assert (=> d!158555 (and (bvsge lt!658614 #b00000000000000000000000000000000) (bvslt lt!658614 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(assert (=> d!158555 (= lt!658614 (choose!52 (toIndex!0 (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512))))

(assert (=> d!158555 (validMask!0 mask!2512)))

(assert (=> d!158555 (= (nextIndex!0 (toIndex!0 (select (store (arr!48814 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) lt!658614)))

(declare-fun bs!43576 () Bool)

(assert (= bs!43576 d!158555))

(assert (=> bs!43576 m!1402139))

(declare-fun m!1402483 () Bool)

(assert (=> bs!43576 m!1402483))

(assert (=> bs!43576 m!1402119))

(assert (=> b!1519439 d!158555))

(declare-fun b!1519706 () Bool)

(declare-fun lt!658616 () SeekEntryResult!13008)

(assert (=> b!1519706 (and (bvsge (index!54429 lt!658616) #b00000000000000000000000000000000) (bvslt (index!54429 lt!658616) (size!49366 a!2804)))))

(declare-fun res!1039573 () Bool)

(assert (=> b!1519706 (= res!1039573 (= (select (arr!48814 a!2804) (index!54429 lt!658616)) (select (arr!48814 a!2804) j!70)))))

(declare-fun e!847689 () Bool)

(assert (=> b!1519706 (=> res!1039573 e!847689)))

(declare-fun e!847687 () Bool)

(assert (=> b!1519706 (= e!847687 e!847689)))

(declare-fun e!847686 () SeekEntryResult!13008)

(declare-fun b!1519707 () Bool)

(assert (=> b!1519707 (= e!847686 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 (toIndex!0 (select (arr!48814 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2512) (select (arr!48814 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1519708 () Bool)

(declare-fun e!847685 () SeekEntryResult!13008)

(assert (=> b!1519708 (= e!847685 e!847686)))

(declare-fun c!139615 () Bool)

(declare-fun lt!658615 () (_ BitVec 64))

(assert (=> b!1519708 (= c!139615 (or (= lt!658615 (select (arr!48814 a!2804) j!70)) (= (bvadd lt!658615 lt!658615) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!158557 () Bool)

(declare-fun e!847688 () Bool)

(assert (=> d!158557 e!847688))

(declare-fun c!139614 () Bool)

(assert (=> d!158557 (= c!139614 (and ((_ is Intermediate!13008) lt!658616) (undefined!13820 lt!658616)))))

(assert (=> d!158557 (= lt!658616 e!847685)))

(declare-fun c!139613 () Bool)

(assert (=> d!158557 (= c!139613 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!158557 (= lt!658615 (select (arr!48814 a!2804) (nextIndex!0 (toIndex!0 (select (arr!48814 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512)))))

(assert (=> d!158557 (validMask!0 mask!2512)))

(assert (=> d!158557 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48814 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48814 a!2804) j!70) a!2804 mask!2512) lt!658616)))

(declare-fun b!1519709 () Bool)

(assert (=> b!1519709 (and (bvsge (index!54429 lt!658616) #b00000000000000000000000000000000) (bvslt (index!54429 lt!658616) (size!49366 a!2804)))))

(declare-fun res!1039574 () Bool)

(assert (=> b!1519709 (= res!1039574 (= (select (arr!48814 a!2804) (index!54429 lt!658616)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1519709 (=> res!1039574 e!847689)))

(declare-fun b!1519710 () Bool)

(assert (=> b!1519710 (= e!847688 (bvsge (x!136096 lt!658616) #b01111111111111111111111111111110))))

(declare-fun b!1519711 () Bool)

(assert (=> b!1519711 (= e!847688 e!847687)))

(declare-fun res!1039572 () Bool)

(assert (=> b!1519711 (= res!1039572 (and ((_ is Intermediate!13008) lt!658616) (not (undefined!13820 lt!658616)) (bvslt (x!136096 lt!658616) #b01111111111111111111111111111110) (bvsge (x!136096 lt!658616) #b00000000000000000000000000000000) (bvsge (x!136096 lt!658616) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1519711 (=> (not res!1039572) (not e!847687))))

(declare-fun b!1519712 () Bool)

(assert (=> b!1519712 (and (bvsge (index!54429 lt!658616) #b00000000000000000000000000000000) (bvslt (index!54429 lt!658616) (size!49366 a!2804)))))

(assert (=> b!1519712 (= e!847689 (= (select (arr!48814 a!2804) (index!54429 lt!658616)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1519713 () Bool)

(assert (=> b!1519713 (= e!847685 (Intermediate!13008 true (nextIndex!0 (toIndex!0 (select (arr!48814 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun b!1519714 () Bool)

(assert (=> b!1519714 (= e!847686 (Intermediate!13008 false (nextIndex!0 (toIndex!0 (select (arr!48814 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!158557 c!139613) b!1519713))

(assert (= (and d!158557 (not c!139613)) b!1519708))

(assert (= (and b!1519708 c!139615) b!1519714))

(assert (= (and b!1519708 (not c!139615)) b!1519707))

(assert (= (and d!158557 c!139614) b!1519710))

(assert (= (and d!158557 (not c!139614)) b!1519711))

(assert (= (and b!1519711 res!1039572) b!1519706))

(assert (= (and b!1519706 (not res!1039573)) b!1519709))

(assert (= (and b!1519709 (not res!1039574)) b!1519712))

(declare-fun m!1402485 () Bool)

(assert (=> b!1519712 m!1402485))

(assert (=> d!158557 m!1402253))

(declare-fun m!1402487 () Bool)

(assert (=> d!158557 m!1402487))

(assert (=> d!158557 m!1402119))

(assert (=> b!1519707 m!1402253))

(declare-fun m!1402489 () Bool)

(assert (=> b!1519707 m!1402489))

(assert (=> b!1519707 m!1402489))

(assert (=> b!1519707 m!1402115))

(declare-fun m!1402491 () Bool)

(assert (=> b!1519707 m!1402491))

(assert (=> b!1519709 m!1402485))

(assert (=> b!1519706 m!1402485))

(assert (=> b!1519413 d!158557))

(declare-fun d!158559 () Bool)

(declare-fun lt!658617 () (_ BitVec 32))

(assert (=> d!158559 (and (bvsge lt!658617 #b00000000000000000000000000000000) (bvslt lt!658617 (bvadd mask!2512 #b00000000000000000000000000000001)))))

(assert (=> d!158559 (= lt!658617 (choose!52 (toIndex!0 (select (arr!48814 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512))))

(assert (=> d!158559 (validMask!0 mask!2512)))

(assert (=> d!158559 (= (nextIndex!0 (toIndex!0 (select (arr!48814 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) lt!658617)))

(declare-fun bs!43577 () Bool)

(assert (= bs!43577 d!158559))

(assert (=> bs!43577 m!1402125))

(declare-fun m!1402493 () Bool)

(assert (=> bs!43577 m!1402493))

(assert (=> bs!43577 m!1402119))

(assert (=> b!1519413 d!158559))

(assert (=> d!158493 d!158445))

(assert (=> d!158493 d!158453))

(assert (=> d!158493 d!158467))

(check-sat (not b!1519644) (not bm!68292) (not b!1519692) (not d!158531) (not b!1519707) (not b!1519677) (not d!158535) (not d!158553) (not d!158555) (not b!1519695) (not d!158557) (not b!1519689) (not b!1519621) (not b!1519628) (not d!158543) (not d!158527) (not b!1519698) (not b!1519693) (not bm!68293) (not bm!68294) (not b!1519654) (not d!158533) (not b!1519681) (not d!158547) (not d!158541) (not d!158559) (not b!1519685) (not b!1519619) (not d!158537) (not d!158539) (not b!1519690) (not b!1519652))
(check-sat)
