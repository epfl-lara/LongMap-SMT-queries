; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128428 () Bool)

(assert start!128428)

(declare-fun b!1506278 () Bool)

(declare-fun res!1026640 () Bool)

(declare-fun e!841821 () Bool)

(assert (=> b!1506278 (=> (not res!1026640) (not e!841821))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100473 0))(
  ( (array!100474 (arr!48481 (Array (_ BitVec 32) (_ BitVec 64))) (size!49031 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100473)

(assert (=> b!1506278 (= res!1026640 (and (= (size!49031 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49031 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49031 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1506279 () Bool)

(declare-fun res!1026635 () Bool)

(assert (=> b!1506279 (=> (not res!1026635) (not e!841821))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506279 (= res!1026635 (validKeyInArray!0 (select (arr!48481 a!2804) j!70)))))

(declare-fun b!1506280 () Bool)

(declare-fun res!1026639 () Bool)

(assert (=> b!1506280 (=> (not res!1026639) (not e!841821))))

(assert (=> b!1506280 (= res!1026639 (validKeyInArray!0 (select (arr!48481 a!2804) i!961)))))

(declare-fun res!1026636 () Bool)

(assert (=> start!128428 (=> (not res!1026636) (not e!841821))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128428 (= res!1026636 (validMask!0 mask!2512))))

(assert (=> start!128428 e!841821))

(assert (=> start!128428 true))

(declare-fun array_inv!37509 (array!100473) Bool)

(assert (=> start!128428 (array_inv!37509 a!2804)))

(declare-fun b!1506281 () Bool)

(declare-fun res!1026637 () Bool)

(assert (=> b!1506281 (=> (not res!1026637) (not e!841821))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100473 (_ BitVec 32)) Bool)

(assert (=> b!1506281 (= res!1026637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1506282 () Bool)

(declare-fun res!1026638 () Bool)

(assert (=> b!1506282 (=> (not res!1026638) (not e!841821))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1506282 (= res!1026638 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49031 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49031 a!2804))))))

(declare-fun b!1506283 () Bool)

(declare-fun lt!654178 () (_ BitVec 32))

(assert (=> b!1506283 (= e!841821 (and (bvsge mask!2512 #b00000000000000000000000000000000) (or (bvslt lt!654178 #b00000000000000000000000000000000) (bvsge lt!654178 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506283 (= lt!654178 (toIndex!0 (select (arr!48481 a!2804) j!70) mask!2512))))

(declare-fun b!1506284 () Bool)

(declare-fun res!1026634 () Bool)

(assert (=> b!1506284 (=> (not res!1026634) (not e!841821))))

(declare-datatypes ((List!34964 0))(
  ( (Nil!34961) (Cons!34960 (h!36357 (_ BitVec 64)) (t!49658 List!34964)) )
))
(declare-fun arrayNoDuplicates!0 (array!100473 (_ BitVec 32) List!34964) Bool)

(assert (=> b!1506284 (= res!1026634 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34961))))

(assert (= (and start!128428 res!1026636) b!1506278))

(assert (= (and b!1506278 res!1026640) b!1506280))

(assert (= (and b!1506280 res!1026639) b!1506279))

(assert (= (and b!1506279 res!1026635) b!1506281))

(assert (= (and b!1506281 res!1026637) b!1506284))

(assert (= (and b!1506284 res!1026634) b!1506282))

(assert (= (and b!1506282 res!1026638) b!1506283))

(declare-fun m!1389265 () Bool)

(assert (=> b!1506284 m!1389265))

(declare-fun m!1389267 () Bool)

(assert (=> start!128428 m!1389267))

(declare-fun m!1389269 () Bool)

(assert (=> start!128428 m!1389269))

(declare-fun m!1389271 () Bool)

(assert (=> b!1506279 m!1389271))

(assert (=> b!1506279 m!1389271))

(declare-fun m!1389273 () Bool)

(assert (=> b!1506279 m!1389273))

(assert (=> b!1506283 m!1389271))

(assert (=> b!1506283 m!1389271))

(declare-fun m!1389275 () Bool)

(assert (=> b!1506283 m!1389275))

(declare-fun m!1389277 () Bool)

(assert (=> b!1506281 m!1389277))

(declare-fun m!1389279 () Bool)

(assert (=> b!1506280 m!1389279))

(assert (=> b!1506280 m!1389279))

(declare-fun m!1389281 () Bool)

(assert (=> b!1506280 m!1389281))

(push 1)

(assert (not start!128428))

(assert (not b!1506281))

(assert (not b!1506283))

(assert (not b!1506284))

(assert (not b!1506280))

(assert (not b!1506279))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!158207 () Bool)

(assert (=> d!158207 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128428 d!158207))

(declare-fun d!158215 () Bool)

(assert (=> d!158215 (= (array_inv!37509 a!2804) (bvsge (size!49031 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128428 d!158215))

(declare-fun b!1506347 () Bool)

(declare-fun e!841873 () Bool)

(declare-fun e!841871 () Bool)

(assert (=> b!1506347 (= e!841873 e!841871)))

(declare-fun lt!654217 () (_ BitVec 64))

(assert (=> b!1506347 (= lt!654217 (select (arr!48481 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50320 0))(
  ( (Unit!50321) )
))
(declare-fun lt!654216 () Unit!50320)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100473 (_ BitVec 64) (_ BitVec 32)) Unit!50320)

(assert (=> b!1506347 (= lt!654216 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654217 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1506347 (arrayContainsKey!0 a!2804 lt!654217 #b00000000000000000000000000000000)))

(declare-fun lt!654215 () Unit!50320)

(assert (=> b!1506347 (= lt!654215 lt!654216)))

(declare-fun res!1026678 () Bool)

(declare-datatypes ((SeekEntryResult!12657 0))(
  ( (MissingZero!12657 (index!53023 (_ BitVec 32))) (Found!12657 (index!53024 (_ BitVec 32))) (Intermediate!12657 (undefined!13469 Bool) (index!53025 (_ BitVec 32)) (x!134767 (_ BitVec 32))) (Undefined!12657) (MissingVacant!12657 (index!53026 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100473 (_ BitVec 32)) SeekEntryResult!12657)

(assert (=> b!1506347 (= res!1026678 (= (seekEntryOrOpen!0 (select (arr!48481 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12657 #b00000000000000000000000000000000)))))

(assert (=> b!1506347 (=> (not res!1026678) (not e!841871))))

(declare-fun b!1506348 () Bool)

(declare-fun call!68235 () Bool)

(assert (=> b!1506348 (= e!841871 call!68235)))

(declare-fun d!158217 () Bool)

(declare-fun res!1026677 () Bool)

(declare-fun e!841872 () Bool)

(assert (=> d!158217 (=> res!1026677 e!841872)))

(assert (=> d!158217 (= res!1026677 (bvsge #b00000000000000000000000000000000 (size!49031 a!2804)))))

(assert (=> d!158217 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!841872)))

(declare-fun bm!68232 () Bool)

(assert (=> bm!68232 (= call!68235 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1506349 () Bool)

(assert (=> b!1506349 (= e!841872 e!841873)))

(declare-fun c!139370 () Bool)

(assert (=> b!1506349 (= c!139370 (validKeyInArray!0 (select (arr!48481 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1506350 () Bool)

(assert (=> b!1506350 (= e!841873 call!68235)))

(assert (= (and d!158217 (not res!1026677)) b!1506349))

(assert (= (and b!1506349 c!139370) b!1506347))

(assert (= (and b!1506349 (not c!139370)) b!1506350))

(assert (= (and b!1506347 res!1026678) b!1506348))

(assert (= (or b!1506348 b!1506350) bm!68232))

(declare-fun m!1389315 () Bool)

(assert (=> b!1506347 m!1389315))

(declare-fun m!1389317 () Bool)

(assert (=> b!1506347 m!1389317))

(declare-fun m!1389319 () Bool)

(assert (=> b!1506347 m!1389319))

(assert (=> b!1506347 m!1389315))

(declare-fun m!1389321 () Bool)

(assert (=> b!1506347 m!1389321))

(declare-fun m!1389323 () Bool)

(assert (=> bm!68232 m!1389323))

(assert (=> b!1506349 m!1389315))

(assert (=> b!1506349 m!1389315))

(declare-fun m!1389325 () Bool)

(assert (=> b!1506349 m!1389325))

(assert (=> b!1506281 d!158217))

(declare-fun d!158227 () Bool)

(declare-fun res!1026687 () Bool)

(declare-fun e!841883 () Bool)

(assert (=> d!158227 (=> res!1026687 e!841883)))

(assert (=> d!158227 (= res!1026687 (bvsge #b00000000000000000000000000000000 (size!49031 a!2804)))))

(assert (=> d!158227 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!34961) e!841883)))

(declare-fun bm!68235 () Bool)

(declare-fun call!68238 () Bool)

(declare-fun c!139373 () Bool)

(assert (=> bm!68235 (= call!68238 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139373 (Cons!34960 (select (arr!48481 a!2804) #b00000000000000000000000000000000) Nil!34961) Nil!34961)))))

(declare-fun b!1506361 () Bool)

(declare-fun e!841882 () Bool)

(declare-fun e!841884 () Bool)

(assert (=> b!1506361 (= e!841882 e!841884)))

(assert (=> b!1506361 (= c!139373 (validKeyInArray!0 (select (arr!48481 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1506362 () Bool)

(assert (=> b!1506362 (= e!841884 call!68238)))

(declare-fun b!1506363 () Bool)

(assert (=> b!1506363 (= e!841884 call!68238)))

(declare-fun b!1506364 () Bool)

(assert (=> b!1506364 (= e!841883 e!841882)))

(declare-fun res!1026686 () Bool)

(assert (=> b!1506364 (=> (not res!1026686) (not e!841882))))

(declare-fun e!841885 () Bool)

(assert (=> b!1506364 (= res!1026686 (not e!841885))))

(declare-fun res!1026685 () Bool)

(assert (=> b!1506364 (=> (not res!1026685) (not e!841885))))

(assert (=> b!1506364 (= res!1026685 (validKeyInArray!0 (select (arr!48481 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1506365 () Bool)

(declare-fun contains!9965 (List!34964 (_ BitVec 64)) Bool)

(assert (=> b!1506365 (= e!841885 (contains!9965 Nil!34961 (select (arr!48481 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!158227 (not res!1026687)) b!1506364))

(assert (= (and b!1506364 res!1026685) b!1506365))

(assert (= (and b!1506364 res!1026686) b!1506361))

(assert (= (and b!1506361 c!139373) b!1506363))

(assert (= (and b!1506361 (not c!139373)) b!1506362))

(assert (= (or b!1506363 b!1506362) bm!68235))

(assert (=> bm!68235 m!1389315))

(declare-fun m!1389327 () Bool)

(assert (=> bm!68235 m!1389327))

(assert (=> b!1506361 m!1389315))

(assert (=> b!1506361 m!1389315))

(assert (=> b!1506361 m!1389325))

(assert (=> b!1506364 m!1389315))

(assert (=> b!1506364 m!1389315))

(assert (=> b!1506364 m!1389325))

(assert (=> b!1506365 m!1389315))

(assert (=> b!1506365 m!1389315))

(declare-fun m!1389329 () Bool)

(assert (=> b!1506365 m!1389329))

(assert (=> b!1506284 d!158227))

(declare-fun d!158229 () Bool)

(declare-fun lt!654223 () (_ BitVec 32))

(declare-fun lt!654222 () (_ BitVec 32))

(assert (=> d!158229 (= lt!654223 (bvmul (bvxor lt!654222 (bvlshr lt!654222 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!158229 (= lt!654222 ((_ extract 31 0) (bvand (bvxor (select (arr!48481 a!2804) j!70) (bvlshr (select (arr!48481 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!158229 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1026688 (let ((h!36360 ((_ extract 31 0) (bvand (bvxor (select (arr!48481 a!2804) j!70) (bvlshr (select (arr!48481 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!134766 (bvmul (bvxor h!36360 (bvlshr h!36360 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!134766 (bvlshr x!134766 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1026688 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1026688 #b00000000000000000000000000000000))))))

(assert (=> d!158229 (= (toIndex!0 (select (arr!48481 a!2804) j!70) mask!2512) (bvand (bvxor lt!654223 (bvlshr lt!654223 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1506283 d!158229))

(declare-fun d!158235 () Bool)

(assert (=> d!158235 (= (validKeyInArray!0 (select (arr!48481 a!2804) i!961)) (and (not (= (select (arr!48481 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48481 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1506280 d!158235))

(declare-fun d!158237 () Bool)

(assert (=> d!158237 (= (validKeyInArray!0 (select (arr!48481 a!2804) j!70)) (and (not (= (select (arr!48481 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48481 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1506279 d!158237))

(push 1)

(assert (not b!1506364))

(assert (not b!1506349))

(assert (not b!1506365))

(assert (not b!1506361))

(assert (not bm!68232))

(assert (not b!1506347))

(assert (not bm!68235))

(check-sat)

