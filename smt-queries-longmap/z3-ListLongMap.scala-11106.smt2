; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129660 () Bool)

(assert start!129660)

(declare-fun b!1522250 () Bool)

(declare-fun e!848788 () Bool)

(declare-fun e!848787 () Bool)

(assert (=> b!1522250 (= e!848788 e!848787)))

(declare-fun res!1041477 () Bool)

(assert (=> b!1522250 (=> (not res!1041477) (not e!848787))))

(declare-datatypes ((SeekEntryResult!13065 0))(
  ( (MissingZero!13065 (index!54655 (_ BitVec 32))) (Found!13065 (index!54656 (_ BitVec 32))) (Intermediate!13065 (undefined!13877 Bool) (index!54657 (_ BitVec 32)) (x!136341 (_ BitVec 32))) (Undefined!13065) (MissingVacant!13065 (index!54658 (_ BitVec 32))) )
))
(declare-fun lt!659537 () SeekEntryResult!13065)

(declare-fun lt!659538 () SeekEntryResult!13065)

(assert (=> b!1522250 (= res!1041477 (= lt!659537 lt!659538))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1522250 (= lt!659538 (Intermediate!13065 false resIndex!21 resX!21))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101335 0))(
  ( (array!101336 (arr!48900 (Array (_ BitVec 32) (_ BitVec 64))) (size!49450 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101335)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101335 (_ BitVec 32)) SeekEntryResult!13065)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522250 (= lt!659537 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48900 a!2804) j!70) mask!2512) (select (arr!48900 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522251 () Bool)

(declare-fun res!1041478 () Bool)

(assert (=> b!1522251 (=> (not res!1041478) (not e!848788))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1522251 (= res!1041478 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49450 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49450 a!2804))))))

(declare-fun b!1522252 () Bool)

(declare-fun res!1041480 () Bool)

(assert (=> b!1522252 (=> (not res!1041480) (not e!848788))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522252 (= res!1041480 (validKeyInArray!0 (select (arr!48900 a!2804) j!70)))))

(declare-fun b!1522253 () Bool)

(declare-fun res!1041481 () Bool)

(assert (=> b!1522253 (=> (not res!1041481) (not e!848788))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1522253 (= res!1041481 (and (= (size!49450 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49450 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49450 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1522254 () Bool)

(declare-fun res!1041474 () Bool)

(assert (=> b!1522254 (=> (not res!1041474) (not e!848787))))

(assert (=> b!1522254 (= res!1041474 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48900 a!2804) j!70) a!2804 mask!2512) lt!659538))))

(declare-fun b!1522256 () Bool)

(declare-fun res!1041475 () Bool)

(assert (=> b!1522256 (=> (not res!1041475) (not e!848788))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101335 (_ BitVec 32)) Bool)

(assert (=> b!1522256 (= res!1041475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1522257 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101335 (_ BitVec 32)) SeekEntryResult!13065)

(assert (=> b!1522257 (= e!848787 (not (= (seekEntry!0 (select (arr!48900 a!2804) j!70) a!2804 mask!2512) (Found!13065 j!70))))))

(assert (=> b!1522257 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-datatypes ((Unit!50914 0))(
  ( (Unit!50915) )
))
(declare-fun lt!659539 () Unit!50914)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101335 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50914)

(assert (=> b!1522257 (= lt!659539 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1522258 () Bool)

(declare-fun res!1041479 () Bool)

(assert (=> b!1522258 (=> (not res!1041479) (not e!848788))))

(assert (=> b!1522258 (= res!1041479 (validKeyInArray!0 (select (arr!48900 a!2804) i!961)))))

(declare-fun b!1522259 () Bool)

(declare-fun res!1041472 () Bool)

(assert (=> b!1522259 (=> (not res!1041472) (not e!848788))))

(declare-datatypes ((List!35383 0))(
  ( (Nil!35380) (Cons!35379 (h!36800 (_ BitVec 64)) (t!50077 List!35383)) )
))
(declare-fun arrayNoDuplicates!0 (array!101335 (_ BitVec 32) List!35383) Bool)

(assert (=> b!1522259 (= res!1041472 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35380))))

(declare-fun b!1522255 () Bool)

(declare-fun res!1041473 () Bool)

(assert (=> b!1522255 (=> (not res!1041473) (not e!848787))))

(assert (=> b!1522255 (= res!1041473 (= lt!659537 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101336 (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49450 a!2804)) mask!2512)))))

(declare-fun res!1041476 () Bool)

(assert (=> start!129660 (=> (not res!1041476) (not e!848788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129660 (= res!1041476 (validMask!0 mask!2512))))

(assert (=> start!129660 e!848788))

(assert (=> start!129660 true))

(declare-fun array_inv!37928 (array!101335) Bool)

(assert (=> start!129660 (array_inv!37928 a!2804)))

(assert (= (and start!129660 res!1041476) b!1522253))

(assert (= (and b!1522253 res!1041481) b!1522258))

(assert (= (and b!1522258 res!1041479) b!1522252))

(assert (= (and b!1522252 res!1041480) b!1522256))

(assert (= (and b!1522256 res!1041475) b!1522259))

(assert (= (and b!1522259 res!1041472) b!1522251))

(assert (= (and b!1522251 res!1041478) b!1522250))

(assert (= (and b!1522250 res!1041477) b!1522254))

(assert (= (and b!1522254 res!1041474) b!1522255))

(assert (= (and b!1522255 res!1041473) b!1522257))

(declare-fun m!1405397 () Bool)

(assert (=> b!1522255 m!1405397))

(declare-fun m!1405399 () Bool)

(assert (=> b!1522255 m!1405399))

(assert (=> b!1522255 m!1405399))

(declare-fun m!1405401 () Bool)

(assert (=> b!1522255 m!1405401))

(assert (=> b!1522255 m!1405401))

(assert (=> b!1522255 m!1405399))

(declare-fun m!1405403 () Bool)

(assert (=> b!1522255 m!1405403))

(declare-fun m!1405405 () Bool)

(assert (=> b!1522259 m!1405405))

(declare-fun m!1405407 () Bool)

(assert (=> b!1522252 m!1405407))

(assert (=> b!1522252 m!1405407))

(declare-fun m!1405409 () Bool)

(assert (=> b!1522252 m!1405409))

(declare-fun m!1405411 () Bool)

(assert (=> b!1522256 m!1405411))

(assert (=> b!1522254 m!1405407))

(assert (=> b!1522254 m!1405407))

(declare-fun m!1405413 () Bool)

(assert (=> b!1522254 m!1405413))

(declare-fun m!1405415 () Bool)

(assert (=> b!1522258 m!1405415))

(assert (=> b!1522258 m!1405415))

(declare-fun m!1405417 () Bool)

(assert (=> b!1522258 m!1405417))

(assert (=> b!1522250 m!1405407))

(assert (=> b!1522250 m!1405407))

(declare-fun m!1405419 () Bool)

(assert (=> b!1522250 m!1405419))

(assert (=> b!1522250 m!1405419))

(assert (=> b!1522250 m!1405407))

(declare-fun m!1405421 () Bool)

(assert (=> b!1522250 m!1405421))

(declare-fun m!1405423 () Bool)

(assert (=> start!129660 m!1405423))

(declare-fun m!1405425 () Bool)

(assert (=> start!129660 m!1405425))

(assert (=> b!1522257 m!1405407))

(assert (=> b!1522257 m!1405407))

(declare-fun m!1405427 () Bool)

(assert (=> b!1522257 m!1405427))

(declare-fun m!1405429 () Bool)

(assert (=> b!1522257 m!1405429))

(declare-fun m!1405431 () Bool)

(assert (=> b!1522257 m!1405431))

(check-sat (not start!129660) (not b!1522252) (not b!1522255) (not b!1522250) (not b!1522257) (not b!1522254) (not b!1522256) (not b!1522259) (not b!1522258))
(check-sat)
(get-model)

(declare-fun d!159069 () Bool)

(assert (=> d!159069 (= (validKeyInArray!0 (select (arr!48900 a!2804) i!961)) (and (not (= (select (arr!48900 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48900 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1522258 d!159069))

(declare-fun bm!68379 () Bool)

(declare-fun call!68382 () Bool)

(declare-fun c!139937 () Bool)

(assert (=> bm!68379 (= call!68382 (arrayNoDuplicates!0 a!2804 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139937 (Cons!35379 (select (arr!48900 a!2804) #b00000000000000000000000000000000) Nil!35380) Nil!35380)))))

(declare-fun b!1522300 () Bool)

(declare-fun e!848806 () Bool)

(declare-fun e!848809 () Bool)

(assert (=> b!1522300 (= e!848806 e!848809)))

(assert (=> b!1522300 (= c!139937 (validKeyInArray!0 (select (arr!48900 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1522301 () Bool)

(assert (=> b!1522301 (= e!848809 call!68382)))

(declare-fun d!159071 () Bool)

(declare-fun res!1041518 () Bool)

(declare-fun e!848807 () Bool)

(assert (=> d!159071 (=> res!1041518 e!848807)))

(assert (=> d!159071 (= res!1041518 (bvsge #b00000000000000000000000000000000 (size!49450 a!2804)))))

(assert (=> d!159071 (= (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35380) e!848807)))

(declare-fun b!1522302 () Bool)

(declare-fun e!848808 () Bool)

(declare-fun contains!9985 (List!35383 (_ BitVec 64)) Bool)

(assert (=> b!1522302 (= e!848808 (contains!9985 Nil!35380 (select (arr!48900 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1522303 () Bool)

(assert (=> b!1522303 (= e!848809 call!68382)))

(declare-fun b!1522304 () Bool)

(assert (=> b!1522304 (= e!848807 e!848806)))

(declare-fun res!1041520 () Bool)

(assert (=> b!1522304 (=> (not res!1041520) (not e!848806))))

(assert (=> b!1522304 (= res!1041520 (not e!848808))))

(declare-fun res!1041519 () Bool)

(assert (=> b!1522304 (=> (not res!1041519) (not e!848808))))

(assert (=> b!1522304 (= res!1041519 (validKeyInArray!0 (select (arr!48900 a!2804) #b00000000000000000000000000000000)))))

(assert (= (and d!159071 (not res!1041518)) b!1522304))

(assert (= (and b!1522304 res!1041519) b!1522302))

(assert (= (and b!1522304 res!1041520) b!1522300))

(assert (= (and b!1522300 c!139937) b!1522303))

(assert (= (and b!1522300 (not c!139937)) b!1522301))

(assert (= (or b!1522303 b!1522301) bm!68379))

(declare-fun m!1405469 () Bool)

(assert (=> bm!68379 m!1405469))

(declare-fun m!1405471 () Bool)

(assert (=> bm!68379 m!1405471))

(assert (=> b!1522300 m!1405469))

(assert (=> b!1522300 m!1405469))

(declare-fun m!1405473 () Bool)

(assert (=> b!1522300 m!1405473))

(assert (=> b!1522302 m!1405469))

(assert (=> b!1522302 m!1405469))

(declare-fun m!1405475 () Bool)

(assert (=> b!1522302 m!1405475))

(assert (=> b!1522304 m!1405469))

(assert (=> b!1522304 m!1405469))

(assert (=> b!1522304 m!1405473))

(assert (=> b!1522259 d!159071))

(declare-fun b!1522317 () Bool)

(declare-fun e!848816 () SeekEntryResult!13065)

(assert (=> b!1522317 (= e!848816 Undefined!13065)))

(declare-fun b!1522318 () Bool)

(declare-fun e!848817 () SeekEntryResult!13065)

(declare-fun lt!659558 () SeekEntryResult!13065)

(assert (=> b!1522318 (= e!848817 (Found!13065 (index!54657 lt!659558)))))

(declare-fun b!1522319 () Bool)

(assert (=> b!1522319 (= e!848816 e!848817)))

(declare-fun lt!659557 () (_ BitVec 64))

(assert (=> b!1522319 (= lt!659557 (select (arr!48900 a!2804) (index!54657 lt!659558)))))

(declare-fun c!139944 () Bool)

(assert (=> b!1522319 (= c!139944 (= lt!659557 (select (arr!48900 a!2804) j!70)))))

(declare-fun b!1522320 () Bool)

(declare-fun e!848818 () SeekEntryResult!13065)

(declare-fun lt!659560 () SeekEntryResult!13065)

(get-info :version)

(assert (=> b!1522320 (= e!848818 (ite ((_ is MissingVacant!13065) lt!659560) (MissingZero!13065 (index!54658 lt!659560)) lt!659560))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101335 (_ BitVec 32)) SeekEntryResult!13065)

(assert (=> b!1522320 (= lt!659560 (seekKeyOrZeroReturnVacant!0 (x!136341 lt!659558) (index!54657 lt!659558) (index!54657 lt!659558) (select (arr!48900 a!2804) j!70) a!2804 mask!2512))))

(declare-fun d!159073 () Bool)

(declare-fun lt!659559 () SeekEntryResult!13065)

(assert (=> d!159073 (and (or ((_ is MissingVacant!13065) lt!659559) (not ((_ is Found!13065) lt!659559)) (and (bvsge (index!54656 lt!659559) #b00000000000000000000000000000000) (bvslt (index!54656 lt!659559) (size!49450 a!2804)))) (not ((_ is MissingVacant!13065) lt!659559)) (or (not ((_ is Found!13065) lt!659559)) (= (select (arr!48900 a!2804) (index!54656 lt!659559)) (select (arr!48900 a!2804) j!70))))))

(assert (=> d!159073 (= lt!659559 e!848816)))

(declare-fun c!139945 () Bool)

(assert (=> d!159073 (= c!139945 (and ((_ is Intermediate!13065) lt!659558) (undefined!13877 lt!659558)))))

(assert (=> d!159073 (= lt!659558 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48900 a!2804) j!70) mask!2512) (select (arr!48900 a!2804) j!70) a!2804 mask!2512))))

(assert (=> d!159073 (validMask!0 mask!2512)))

(assert (=> d!159073 (= (seekEntry!0 (select (arr!48900 a!2804) j!70) a!2804 mask!2512) lt!659559)))

(declare-fun b!1522321 () Bool)

(declare-fun c!139946 () Bool)

(assert (=> b!1522321 (= c!139946 (= lt!659557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522321 (= e!848817 e!848818)))

(declare-fun b!1522322 () Bool)

(assert (=> b!1522322 (= e!848818 (MissingZero!13065 (index!54657 lt!659558)))))

(assert (= (and d!159073 c!139945) b!1522317))

(assert (= (and d!159073 (not c!139945)) b!1522319))

(assert (= (and b!1522319 c!139944) b!1522318))

(assert (= (and b!1522319 (not c!139944)) b!1522321))

(assert (= (and b!1522321 c!139946) b!1522322))

(assert (= (and b!1522321 (not c!139946)) b!1522320))

(declare-fun m!1405477 () Bool)

(assert (=> b!1522319 m!1405477))

(assert (=> b!1522320 m!1405407))

(declare-fun m!1405479 () Bool)

(assert (=> b!1522320 m!1405479))

(declare-fun m!1405481 () Bool)

(assert (=> d!159073 m!1405481))

(assert (=> d!159073 m!1405407))

(assert (=> d!159073 m!1405419))

(assert (=> d!159073 m!1405419))

(assert (=> d!159073 m!1405407))

(assert (=> d!159073 m!1405421))

(assert (=> d!159073 m!1405423))

(assert (=> b!1522257 d!159073))

(declare-fun b!1522331 () Bool)

(declare-fun e!848826 () Bool)

(declare-fun e!848825 () Bool)

(assert (=> b!1522331 (= e!848826 e!848825)))

(declare-fun c!139949 () Bool)

(assert (=> b!1522331 (= c!139949 (validKeyInArray!0 (select (arr!48900 a!2804) j!70)))))

(declare-fun b!1522332 () Bool)

(declare-fun e!848827 () Bool)

(declare-fun call!68385 () Bool)

(assert (=> b!1522332 (= e!848827 call!68385)))

(declare-fun b!1522333 () Bool)

(assert (=> b!1522333 (= e!848825 call!68385)))

(declare-fun b!1522334 () Bool)

(assert (=> b!1522334 (= e!848825 e!848827)))

(declare-fun lt!659567 () (_ BitVec 64))

(assert (=> b!1522334 (= lt!659567 (select (arr!48900 a!2804) j!70))))

(declare-fun lt!659568 () Unit!50914)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!101335 (_ BitVec 64) (_ BitVec 32)) Unit!50914)

(assert (=> b!1522334 (= lt!659568 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659567 j!70))))

(declare-fun arrayContainsKey!0 (array!101335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1522334 (arrayContainsKey!0 a!2804 lt!659567 #b00000000000000000000000000000000)))

(declare-fun lt!659569 () Unit!50914)

(assert (=> b!1522334 (= lt!659569 lt!659568)))

(declare-fun res!1041526 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101335 (_ BitVec 32)) SeekEntryResult!13065)

(assert (=> b!1522334 (= res!1041526 (= (seekEntryOrOpen!0 (select (arr!48900 a!2804) j!70) a!2804 mask!2512) (Found!13065 j!70)))))

(assert (=> b!1522334 (=> (not res!1041526) (not e!848827))))

(declare-fun d!159085 () Bool)

(declare-fun res!1041525 () Bool)

(assert (=> d!159085 (=> res!1041525 e!848826)))

(assert (=> d!159085 (= res!1041525 (bvsge j!70 (size!49450 a!2804)))))

(assert (=> d!159085 (= (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512) e!848826)))

(declare-fun bm!68382 () Bool)

(assert (=> bm!68382 (= call!68385 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!70 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!159085 (not res!1041525)) b!1522331))

(assert (= (and b!1522331 c!139949) b!1522334))

(assert (= (and b!1522331 (not c!139949)) b!1522333))

(assert (= (and b!1522334 res!1041526) b!1522332))

(assert (= (or b!1522332 b!1522333) bm!68382))

(assert (=> b!1522331 m!1405407))

(assert (=> b!1522331 m!1405407))

(assert (=> b!1522331 m!1405409))

(assert (=> b!1522334 m!1405407))

(declare-fun m!1405483 () Bool)

(assert (=> b!1522334 m!1405483))

(declare-fun m!1405485 () Bool)

(assert (=> b!1522334 m!1405485))

(assert (=> b!1522334 m!1405407))

(declare-fun m!1405487 () Bool)

(assert (=> b!1522334 m!1405487))

(declare-fun m!1405489 () Bool)

(assert (=> bm!68382 m!1405489))

(assert (=> b!1522257 d!159085))

(declare-fun d!159091 () Bool)

(assert (=> d!159091 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512)))

(declare-fun lt!659576 () Unit!50914)

(declare-fun choose!38 (array!101335 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50914)

(assert (=> d!159091 (= lt!659576 (choose!38 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (=> d!159091 (validMask!0 mask!2512)))

(assert (=> d!159091 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70) lt!659576)))

(declare-fun bs!43696 () Bool)

(assert (= bs!43696 d!159091))

(assert (=> bs!43696 m!1405429))

(declare-fun m!1405491 () Bool)

(assert (=> bs!43696 m!1405491))

(assert (=> bs!43696 m!1405423))

(assert (=> b!1522257 d!159091))

(declare-fun d!159093 () Bool)

(assert (=> d!159093 (= (validKeyInArray!0 (select (arr!48900 a!2804) j!70)) (and (not (= (select (arr!48900 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48900 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1522252 d!159093))

(declare-fun b!1522434 () Bool)

(declare-fun e!848892 () SeekEntryResult!13065)

(assert (=> b!1522434 (= e!848892 (Intermediate!13065 false (toIndex!0 (select (arr!48900 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1522435 () Bool)

(declare-fun e!848889 () Bool)

(declare-fun e!848888 () Bool)

(assert (=> b!1522435 (= e!848889 e!848888)))

(declare-fun res!1041562 () Bool)

(declare-fun lt!659613 () SeekEntryResult!13065)

(assert (=> b!1522435 (= res!1041562 (and ((_ is Intermediate!13065) lt!659613) (not (undefined!13877 lt!659613)) (bvslt (x!136341 lt!659613) #b01111111111111111111111111111110) (bvsge (x!136341 lt!659613) #b00000000000000000000000000000000) (bvsge (x!136341 lt!659613) #b00000000000000000000000000000000)))))

(assert (=> b!1522435 (=> (not res!1041562) (not e!848888))))

(declare-fun b!1522436 () Bool)

(assert (=> b!1522436 (and (bvsge (index!54657 lt!659613) #b00000000000000000000000000000000) (bvslt (index!54657 lt!659613) (size!49450 a!2804)))))

(declare-fun e!848891 () Bool)

(assert (=> b!1522436 (= e!848891 (= (select (arr!48900 a!2804) (index!54657 lt!659613)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522437 () Bool)

(assert (=> b!1522437 (= e!848889 (bvsge (x!136341 lt!659613) #b01111111111111111111111111111110))))

(declare-fun d!159095 () Bool)

(assert (=> d!159095 e!848889))

(declare-fun c!139985 () Bool)

(assert (=> d!159095 (= c!139985 (and ((_ is Intermediate!13065) lt!659613) (undefined!13877 lt!659613)))))

(declare-fun e!848890 () SeekEntryResult!13065)

(assert (=> d!159095 (= lt!659613 e!848890)))

(declare-fun c!139984 () Bool)

(assert (=> d!159095 (= c!139984 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!659612 () (_ BitVec 64))

(assert (=> d!159095 (= lt!659612 (select (arr!48900 a!2804) (toIndex!0 (select (arr!48900 a!2804) j!70) mask!2512)))))

(assert (=> d!159095 (validMask!0 mask!2512)))

(assert (=> d!159095 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48900 a!2804) j!70) mask!2512) (select (arr!48900 a!2804) j!70) a!2804 mask!2512) lt!659613)))

(declare-fun b!1522438 () Bool)

(assert (=> b!1522438 (= e!848890 e!848892)))

(declare-fun c!139983 () Bool)

(assert (=> b!1522438 (= c!139983 (or (= lt!659612 (select (arr!48900 a!2804) j!70)) (= (bvadd lt!659612 lt!659612) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1522439 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1522439 (= e!848892 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!48900 a!2804) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (arr!48900 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522440 () Bool)

(assert (=> b!1522440 (and (bvsge (index!54657 lt!659613) #b00000000000000000000000000000000) (bvslt (index!54657 lt!659613) (size!49450 a!2804)))))

(declare-fun res!1041563 () Bool)

(assert (=> b!1522440 (= res!1041563 (= (select (arr!48900 a!2804) (index!54657 lt!659613)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522440 (=> res!1041563 e!848891)))

(declare-fun b!1522441 () Bool)

(assert (=> b!1522441 (and (bvsge (index!54657 lt!659613) #b00000000000000000000000000000000) (bvslt (index!54657 lt!659613) (size!49450 a!2804)))))

(declare-fun res!1041561 () Bool)

(assert (=> b!1522441 (= res!1041561 (= (select (arr!48900 a!2804) (index!54657 lt!659613)) (select (arr!48900 a!2804) j!70)))))

(assert (=> b!1522441 (=> res!1041561 e!848891)))

(assert (=> b!1522441 (= e!848888 e!848891)))

(declare-fun b!1522442 () Bool)

(assert (=> b!1522442 (= e!848890 (Intermediate!13065 true (toIndex!0 (select (arr!48900 a!2804) j!70) mask!2512) #b00000000000000000000000000000000))))

(assert (= (and d!159095 c!139984) b!1522442))

(assert (= (and d!159095 (not c!139984)) b!1522438))

(assert (= (and b!1522438 c!139983) b!1522434))

(assert (= (and b!1522438 (not c!139983)) b!1522439))

(assert (= (and d!159095 c!139985) b!1522437))

(assert (= (and d!159095 (not c!139985)) b!1522435))

(assert (= (and b!1522435 res!1041562) b!1522441))

(assert (= (and b!1522441 (not res!1041561)) b!1522440))

(assert (= (and b!1522440 (not res!1041563)) b!1522436))

(declare-fun m!1405531 () Bool)

(assert (=> b!1522440 m!1405531))

(assert (=> d!159095 m!1405419))

(declare-fun m!1405533 () Bool)

(assert (=> d!159095 m!1405533))

(assert (=> d!159095 m!1405423))

(assert (=> b!1522441 m!1405531))

(assert (=> b!1522436 m!1405531))

(assert (=> b!1522439 m!1405419))

(declare-fun m!1405535 () Bool)

(assert (=> b!1522439 m!1405535))

(assert (=> b!1522439 m!1405535))

(assert (=> b!1522439 m!1405407))

(declare-fun m!1405537 () Bool)

(assert (=> b!1522439 m!1405537))

(assert (=> b!1522250 d!159095))

(declare-fun d!159111 () Bool)

(declare-fun lt!659630 () (_ BitVec 32))

(declare-fun lt!659629 () (_ BitVec 32))

(assert (=> d!159111 (= lt!659630 (bvmul (bvxor lt!659629 (bvlshr lt!659629 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159111 (= lt!659629 ((_ extract 31 0) (bvand (bvxor (select (arr!48900 a!2804) j!70) (bvlshr (select (arr!48900 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159111 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1041564 (let ((h!36803 ((_ extract 31 0) (bvand (bvxor (select (arr!48900 a!2804) j!70) (bvlshr (select (arr!48900 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136346 (bvmul (bvxor h!36803 (bvlshr h!36803 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136346 (bvlshr x!136346 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1041564 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1041564 #b00000000000000000000000000000000))))))

(assert (=> d!159111 (= (toIndex!0 (select (arr!48900 a!2804) j!70) mask!2512) (bvand (bvxor lt!659630 (bvlshr lt!659630 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1522250 d!159111))

(declare-fun d!159115 () Bool)

(assert (=> d!159115 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!129660 d!159115))

(declare-fun d!159121 () Bool)

(assert (=> d!159121 (= (array_inv!37928 a!2804) (bvsge (size!49450 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!129660 d!159121))

(declare-fun b!1522484 () Bool)

(declare-fun e!848921 () Bool)

(declare-fun e!848920 () Bool)

(assert (=> b!1522484 (= e!848921 e!848920)))

(declare-fun c!140000 () Bool)

(assert (=> b!1522484 (= c!140000 (validKeyInArray!0 (select (arr!48900 a!2804) #b00000000000000000000000000000000)))))

(declare-fun b!1522485 () Bool)

(declare-fun e!848922 () Bool)

(declare-fun call!68397 () Bool)

(assert (=> b!1522485 (= e!848922 call!68397)))

(declare-fun b!1522486 () Bool)

(assert (=> b!1522486 (= e!848920 call!68397)))

(declare-fun b!1522487 () Bool)

(assert (=> b!1522487 (= e!848920 e!848922)))

(declare-fun lt!659641 () (_ BitVec 64))

(assert (=> b!1522487 (= lt!659641 (select (arr!48900 a!2804) #b00000000000000000000000000000000))))

(declare-fun lt!659642 () Unit!50914)

(assert (=> b!1522487 (= lt!659642 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!659641 #b00000000000000000000000000000000))))

(assert (=> b!1522487 (arrayContainsKey!0 a!2804 lt!659641 #b00000000000000000000000000000000)))

(declare-fun lt!659643 () Unit!50914)

(assert (=> b!1522487 (= lt!659643 lt!659642)))

(declare-fun res!1041579 () Bool)

(assert (=> b!1522487 (= res!1041579 (= (seekEntryOrOpen!0 (select (arr!48900 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!13065 #b00000000000000000000000000000000)))))

(assert (=> b!1522487 (=> (not res!1041579) (not e!848922))))

(declare-fun d!159123 () Bool)

(declare-fun res!1041578 () Bool)

(assert (=> d!159123 (=> res!1041578 e!848921)))

(assert (=> d!159123 (= res!1041578 (bvsge #b00000000000000000000000000000000 (size!49450 a!2804)))))

(assert (=> d!159123 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!848921)))

(declare-fun bm!68394 () Bool)

(assert (=> bm!68394 (= call!68397 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(assert (= (and d!159123 (not res!1041578)) b!1522484))

(assert (= (and b!1522484 c!140000) b!1522487))

(assert (= (and b!1522484 (not c!140000)) b!1522486))

(assert (= (and b!1522487 res!1041579) b!1522485))

(assert (= (or b!1522485 b!1522486) bm!68394))

(assert (=> b!1522484 m!1405469))

(assert (=> b!1522484 m!1405469))

(assert (=> b!1522484 m!1405473))

(assert (=> b!1522487 m!1405469))

(declare-fun m!1405555 () Bool)

(assert (=> b!1522487 m!1405555))

(declare-fun m!1405557 () Bool)

(assert (=> b!1522487 m!1405557))

(assert (=> b!1522487 m!1405469))

(declare-fun m!1405559 () Bool)

(assert (=> b!1522487 m!1405559))

(declare-fun m!1405561 () Bool)

(assert (=> bm!68394 m!1405561))

(assert (=> b!1522256 d!159123))

(declare-fun b!1522488 () Bool)

(declare-fun e!848927 () SeekEntryResult!13065)

(assert (=> b!1522488 (= e!848927 (Intermediate!13065 false index!487 x!534))))

(declare-fun b!1522489 () Bool)

(declare-fun e!848924 () Bool)

(declare-fun e!848923 () Bool)

(assert (=> b!1522489 (= e!848924 e!848923)))

(declare-fun res!1041581 () Bool)

(declare-fun lt!659645 () SeekEntryResult!13065)

(assert (=> b!1522489 (= res!1041581 (and ((_ is Intermediate!13065) lt!659645) (not (undefined!13877 lt!659645)) (bvslt (x!136341 lt!659645) #b01111111111111111111111111111110) (bvsge (x!136341 lt!659645) #b00000000000000000000000000000000) (bvsge (x!136341 lt!659645) x!534)))))

(assert (=> b!1522489 (=> (not res!1041581) (not e!848923))))

(declare-fun b!1522490 () Bool)

(assert (=> b!1522490 (and (bvsge (index!54657 lt!659645) #b00000000000000000000000000000000) (bvslt (index!54657 lt!659645) (size!49450 a!2804)))))

(declare-fun e!848926 () Bool)

(assert (=> b!1522490 (= e!848926 (= (select (arr!48900 a!2804) (index!54657 lt!659645)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522491 () Bool)

(assert (=> b!1522491 (= e!848924 (bvsge (x!136341 lt!659645) #b01111111111111111111111111111110))))

(declare-fun d!159125 () Bool)

(assert (=> d!159125 e!848924))

(declare-fun c!140003 () Bool)

(assert (=> d!159125 (= c!140003 (and ((_ is Intermediate!13065) lt!659645) (undefined!13877 lt!659645)))))

(declare-fun e!848925 () SeekEntryResult!13065)

(assert (=> d!159125 (= lt!659645 e!848925)))

(declare-fun c!140002 () Bool)

(assert (=> d!159125 (= c!140002 (bvsge x!534 #b01111111111111111111111111111110))))

(declare-fun lt!659644 () (_ BitVec 64))

(assert (=> d!159125 (= lt!659644 (select (arr!48900 a!2804) index!487))))

(assert (=> d!159125 (validMask!0 mask!2512)))

(assert (=> d!159125 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48900 a!2804) j!70) a!2804 mask!2512) lt!659645)))

(declare-fun b!1522492 () Bool)

(assert (=> b!1522492 (= e!848925 e!848927)))

(declare-fun c!140001 () Bool)

(assert (=> b!1522492 (= c!140001 (or (= lt!659644 (select (arr!48900 a!2804) j!70)) (= (bvadd lt!659644 lt!659644) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1522493 () Bool)

(assert (=> b!1522493 (= e!848927 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!534 #b00000000000000000000000000000001) (nextIndex!0 index!487 x!534 mask!2512) (select (arr!48900 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1522494 () Bool)

(assert (=> b!1522494 (and (bvsge (index!54657 lt!659645) #b00000000000000000000000000000000) (bvslt (index!54657 lt!659645) (size!49450 a!2804)))))

(declare-fun res!1041582 () Bool)

(assert (=> b!1522494 (= res!1041582 (= (select (arr!48900 a!2804) (index!54657 lt!659645)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522494 (=> res!1041582 e!848926)))

(declare-fun b!1522495 () Bool)

(assert (=> b!1522495 (and (bvsge (index!54657 lt!659645) #b00000000000000000000000000000000) (bvslt (index!54657 lt!659645) (size!49450 a!2804)))))

(declare-fun res!1041580 () Bool)

(assert (=> b!1522495 (= res!1041580 (= (select (arr!48900 a!2804) (index!54657 lt!659645)) (select (arr!48900 a!2804) j!70)))))

(assert (=> b!1522495 (=> res!1041580 e!848926)))

(assert (=> b!1522495 (= e!848923 e!848926)))

(declare-fun b!1522496 () Bool)

(assert (=> b!1522496 (= e!848925 (Intermediate!13065 true index!487 x!534))))

(assert (= (and d!159125 c!140002) b!1522496))

(assert (= (and d!159125 (not c!140002)) b!1522492))

(assert (= (and b!1522492 c!140001) b!1522488))

(assert (= (and b!1522492 (not c!140001)) b!1522493))

(assert (= (and d!159125 c!140003) b!1522491))

(assert (= (and d!159125 (not c!140003)) b!1522489))

(assert (= (and b!1522489 res!1041581) b!1522495))

(assert (= (and b!1522495 (not res!1041580)) b!1522494))

(assert (= (and b!1522494 (not res!1041582)) b!1522490))

(declare-fun m!1405563 () Bool)

(assert (=> b!1522494 m!1405563))

(declare-fun m!1405565 () Bool)

(assert (=> d!159125 m!1405565))

(assert (=> d!159125 m!1405423))

(assert (=> b!1522495 m!1405563))

(assert (=> b!1522490 m!1405563))

(declare-fun m!1405567 () Bool)

(assert (=> b!1522493 m!1405567))

(assert (=> b!1522493 m!1405567))

(assert (=> b!1522493 m!1405407))

(declare-fun m!1405569 () Bool)

(assert (=> b!1522493 m!1405569))

(assert (=> b!1522254 d!159125))

(declare-fun b!1522501 () Bool)

(declare-fun e!848935 () SeekEntryResult!13065)

(assert (=> b!1522501 (= e!848935 (Intermediate!13065 false (toIndex!0 (select (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(declare-fun b!1522502 () Bool)

(declare-fun e!848930 () Bool)

(declare-fun e!848928 () Bool)

(assert (=> b!1522502 (= e!848930 e!848928)))

(declare-fun res!1041586 () Bool)

(declare-fun lt!659650 () SeekEntryResult!13065)

(assert (=> b!1522502 (= res!1041586 (and ((_ is Intermediate!13065) lt!659650) (not (undefined!13877 lt!659650)) (bvslt (x!136341 lt!659650) #b01111111111111111111111111111110) (bvsge (x!136341 lt!659650) #b00000000000000000000000000000000) (bvsge (x!136341 lt!659650) #b00000000000000000000000000000000)))))

(assert (=> b!1522502 (=> (not res!1041586) (not e!848928))))

(declare-fun b!1522503 () Bool)

(assert (=> b!1522503 (and (bvsge (index!54657 lt!659650) #b00000000000000000000000000000000) (bvslt (index!54657 lt!659650) (size!49450 (array!101336 (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49450 a!2804)))))))

(declare-fun e!848934 () Bool)

(assert (=> b!1522503 (= e!848934 (= (select (arr!48900 (array!101336 (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49450 a!2804))) (index!54657 lt!659650)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1522504 () Bool)

(assert (=> b!1522504 (= e!848930 (bvsge (x!136341 lt!659650) #b01111111111111111111111111111110))))

(declare-fun d!159127 () Bool)

(assert (=> d!159127 e!848930))

(declare-fun c!140007 () Bool)

(assert (=> d!159127 (= c!140007 (and ((_ is Intermediate!13065) lt!659650) (undefined!13877 lt!659650)))))

(declare-fun e!848933 () SeekEntryResult!13065)

(assert (=> d!159127 (= lt!659650 e!848933)))

(declare-fun c!140006 () Bool)

(assert (=> d!159127 (= c!140006 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!659649 () (_ BitVec 64))

(assert (=> d!159127 (= lt!659649 (select (arr!48900 (array!101336 (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49450 a!2804))) (toIndex!0 (select (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512)))))

(assert (=> d!159127 (validMask!0 mask!2512)))

(assert (=> d!159127 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101336 (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49450 a!2804)) mask!2512) lt!659650)))

(declare-fun b!1522505 () Bool)

(assert (=> b!1522505 (= e!848933 e!848935)))

(declare-fun c!140005 () Bool)

(assert (=> b!1522505 (= c!140005 (or (= lt!659649 (select (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)) (= (bvadd lt!659649 lt!659649) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1522506 () Bool)

(assert (=> b!1522506 (= e!848935 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000 mask!2512) (select (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101336 (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49450 a!2804)) mask!2512))))

(declare-fun b!1522507 () Bool)

(assert (=> b!1522507 (and (bvsge (index!54657 lt!659650) #b00000000000000000000000000000000) (bvslt (index!54657 lt!659650) (size!49450 (array!101336 (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49450 a!2804)))))))

(declare-fun res!1041587 () Bool)

(assert (=> b!1522507 (= res!1041587 (= (select (arr!48900 (array!101336 (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49450 a!2804))) (index!54657 lt!659650)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1522507 (=> res!1041587 e!848934)))

(declare-fun b!1522508 () Bool)

(assert (=> b!1522508 (and (bvsge (index!54657 lt!659650) #b00000000000000000000000000000000) (bvslt (index!54657 lt!659650) (size!49450 (array!101336 (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49450 a!2804)))))))

(declare-fun res!1041585 () Bool)

(assert (=> b!1522508 (= res!1041585 (= (select (arr!48900 (array!101336 (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49450 a!2804))) (index!54657 lt!659650)) (select (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70)))))

(assert (=> b!1522508 (=> res!1041585 e!848934)))

(assert (=> b!1522508 (= e!848928 e!848934)))

(declare-fun b!1522509 () Bool)

(assert (=> b!1522509 (= e!848933 (Intermediate!13065 true (toIndex!0 (select (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) #b00000000000000000000000000000000))))

(assert (= (and d!159127 c!140006) b!1522509))

(assert (= (and d!159127 (not c!140006)) b!1522505))

(assert (= (and b!1522505 c!140005) b!1522501))

(assert (= (and b!1522505 (not c!140005)) b!1522506))

(assert (= (and d!159127 c!140007) b!1522504))

(assert (= (and d!159127 (not c!140007)) b!1522502))

(assert (= (and b!1522502 res!1041586) b!1522508))

(assert (= (and b!1522508 (not res!1041585)) b!1522507))

(assert (= (and b!1522507 (not res!1041587)) b!1522503))

(declare-fun m!1405579 () Bool)

(assert (=> b!1522507 m!1405579))

(assert (=> d!159127 m!1405401))

(declare-fun m!1405581 () Bool)

(assert (=> d!159127 m!1405581))

(assert (=> d!159127 m!1405423))

(assert (=> b!1522508 m!1405579))

(assert (=> b!1522503 m!1405579))

(assert (=> b!1522506 m!1405401))

(declare-fun m!1405583 () Bool)

(assert (=> b!1522506 m!1405583))

(assert (=> b!1522506 m!1405583))

(assert (=> b!1522506 m!1405399))

(declare-fun m!1405585 () Bool)

(assert (=> b!1522506 m!1405585))

(assert (=> b!1522255 d!159127))

(declare-fun d!159131 () Bool)

(declare-fun lt!659652 () (_ BitVec 32))

(declare-fun lt!659651 () (_ BitVec 32))

(assert (=> d!159131 (= lt!659652 (bvmul (bvxor lt!659651 (bvlshr lt!659651 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!159131 (= lt!659651 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!159131 (and (bvsge mask!2512 #b00000000000000000000000000000000) (let ((res!1041564 (let ((h!36803 ((_ extract 31 0) (bvand (bvxor (select (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (bvlshr (select (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!136346 (bvmul (bvxor h!36803 (bvlshr h!36803 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!136346 (bvlshr x!136346 #b00000000000000000000000000001101)) mask!2512))))) (and (bvslt res!1041564 (bvadd mask!2512 #b00000000000000000000000000000001)) (bvsge res!1041564 #b00000000000000000000000000000000))))))

(assert (=> d!159131 (= (toIndex!0 (select (store (arr!48900 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (bvand (bvxor lt!659652 (bvlshr lt!659652 #b00000000000000000000000000001101)) mask!2512))))

(assert (=> b!1522255 d!159131))

(check-sat (not bm!68382) (not b!1522304) (not b!1522493) (not d!159073) (not b!1522439) (not b!1522300) (not b!1522320) (not bm!68379) (not b!1522302) (not d!159127) (not b!1522484) (not b!1522487) (not d!159095) (not b!1522506) (not b!1522331) (not bm!68394) (not d!159091) (not b!1522334) (not d!159125))
(check-sat)
