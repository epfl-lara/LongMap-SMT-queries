; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128558 () Bool)

(assert start!128558)

(declare-fun b!1507347 () Bool)

(declare-fun res!1026618 () Bool)

(declare-fun e!842588 () Bool)

(assert (=> b!1507347 (=> (not res!1026618) (not e!842588))))

(declare-datatypes ((array!100525 0))(
  ( (array!100526 (arr!48508 (Array (_ BitVec 32) (_ BitVec 64))) (size!49059 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100525)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1507347 (= res!1026618 (validKeyInArray!0 (select (arr!48508 a!2804) j!70)))))

(declare-fun b!1507348 () Bool)

(assert (=> b!1507348 (= e!842588 (and (bvsle #b00000000000000000000000000000000 (size!49059 a!2804)) (bvsge (size!49059 a!2804) #b01111111111111111111111111111111)))))

(declare-fun b!1507349 () Bool)

(declare-fun res!1026619 () Bool)

(assert (=> b!1507349 (=> (not res!1026619) (not e!842588))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1507349 (= res!1026619 (validKeyInArray!0 (select (arr!48508 a!2804) i!961)))))

(declare-fun b!1507350 () Bool)

(declare-fun res!1026620 () Bool)

(assert (=> b!1507350 (=> (not res!1026620) (not e!842588))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100525 (_ BitVec 32)) Bool)

(assert (=> b!1507350 (= res!1026620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1026616 () Bool)

(assert (=> start!128558 (=> (not res!1026616) (not e!842588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128558 (= res!1026616 (validMask!0 mask!2512))))

(assert (=> start!128558 e!842588))

(assert (=> start!128558 true))

(declare-fun array_inv!37789 (array!100525) Bool)

(assert (=> start!128558 (array_inv!37789 a!2804)))

(declare-fun b!1507351 () Bool)

(declare-fun res!1026617 () Bool)

(assert (=> b!1507351 (=> (not res!1026617) (not e!842588))))

(assert (=> b!1507351 (= res!1026617 (and (= (size!49059 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49059 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49059 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128558 res!1026616) b!1507351))

(assert (= (and b!1507351 res!1026617) b!1507349))

(assert (= (and b!1507349 res!1026619) b!1507347))

(assert (= (and b!1507347 res!1026618) b!1507350))

(assert (= (and b!1507350 res!1026620) b!1507348))

(declare-fun m!1390407 () Bool)

(assert (=> b!1507347 m!1390407))

(assert (=> b!1507347 m!1390407))

(declare-fun m!1390409 () Bool)

(assert (=> b!1507347 m!1390409))

(declare-fun m!1390411 () Bool)

(assert (=> b!1507349 m!1390411))

(assert (=> b!1507349 m!1390411))

(declare-fun m!1390413 () Bool)

(assert (=> b!1507349 m!1390413))

(declare-fun m!1390415 () Bool)

(assert (=> b!1507350 m!1390415))

(declare-fun m!1390417 () Bool)

(assert (=> start!128558 m!1390417))

(declare-fun m!1390419 () Bool)

(assert (=> start!128558 m!1390419))

(check-sat (not b!1507350) (not b!1507349) (not start!128558) (not b!1507347))
(check-sat)
(get-model)

(declare-fun b!1507390 () Bool)

(declare-fun e!842610 () Bool)

(declare-fun e!842609 () Bool)

(assert (=> b!1507390 (= e!842610 e!842609)))

(declare-fun lt!654692 () (_ BitVec 64))

(assert (=> b!1507390 (= lt!654692 (select (arr!48508 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50227 0))(
  ( (Unit!50228) )
))
(declare-fun lt!654693 () Unit!50227)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100525 (_ BitVec 64) (_ BitVec 32)) Unit!50227)

(assert (=> b!1507390 (= lt!654693 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!654692 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1507390 (arrayContainsKey!0 a!2804 lt!654692 #b00000000000000000000000000000000)))

(declare-fun lt!654694 () Unit!50227)

(assert (=> b!1507390 (= lt!654694 lt!654693)))

(declare-fun res!1026656 () Bool)

(declare-datatypes ((SeekEntryResult!12593 0))(
  ( (MissingZero!12593 (index!52767 (_ BitVec 32))) (Found!12593 (index!52768 (_ BitVec 32))) (Intermediate!12593 (undefined!13405 Bool) (index!52769 (_ BitVec 32)) (x!134673 (_ BitVec 32))) (Undefined!12593) (MissingVacant!12593 (index!52770 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100525 (_ BitVec 32)) SeekEntryResult!12593)

(assert (=> b!1507390 (= res!1026656 (= (seekEntryOrOpen!0 (select (arr!48508 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12593 #b00000000000000000000000000000000)))))

(assert (=> b!1507390 (=> (not res!1026656) (not e!842609))))

(declare-fun b!1507391 () Bool)

(declare-fun call!68283 () Bool)

(assert (=> b!1507391 (= e!842610 call!68283)))

(declare-fun bm!68280 () Bool)

(assert (=> bm!68280 (= call!68283 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1507392 () Bool)

(assert (=> b!1507392 (= e!842609 call!68283)))

(declare-fun b!1507393 () Bool)

(declare-fun e!842608 () Bool)

(assert (=> b!1507393 (= e!842608 e!842610)))

(declare-fun c!139912 () Bool)

(assert (=> b!1507393 (= c!139912 (validKeyInArray!0 (select (arr!48508 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!158545 () Bool)

(declare-fun res!1026655 () Bool)

(assert (=> d!158545 (=> res!1026655 e!842608)))

(assert (=> d!158545 (= res!1026655 (bvsge #b00000000000000000000000000000000 (size!49059 a!2804)))))

(assert (=> d!158545 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!842608)))

(assert (= (and d!158545 (not res!1026655)) b!1507393))

(assert (= (and b!1507393 c!139912) b!1507390))

(assert (= (and b!1507393 (not c!139912)) b!1507391))

(assert (= (and b!1507390 res!1026656) b!1507392))

(assert (= (or b!1507392 b!1507391) bm!68280))

(declare-fun m!1390449 () Bool)

(assert (=> b!1507390 m!1390449))

(declare-fun m!1390451 () Bool)

(assert (=> b!1507390 m!1390451))

(declare-fun m!1390453 () Bool)

(assert (=> b!1507390 m!1390453))

(assert (=> b!1507390 m!1390449))

(declare-fun m!1390455 () Bool)

(assert (=> b!1507390 m!1390455))

(declare-fun m!1390457 () Bool)

(assert (=> bm!68280 m!1390457))

(assert (=> b!1507393 m!1390449))

(assert (=> b!1507393 m!1390449))

(declare-fun m!1390459 () Bool)

(assert (=> b!1507393 m!1390459))

(assert (=> b!1507350 d!158545))

(declare-fun d!158553 () Bool)

(assert (=> d!158553 (= (validKeyInArray!0 (select (arr!48508 a!2804) i!961)) (and (not (= (select (arr!48508 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48508 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1507349 d!158553))

(declare-fun d!158555 () Bool)

(assert (=> d!158555 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128558 d!158555))

(declare-fun d!158561 () Bool)

(assert (=> d!158561 (= (array_inv!37789 a!2804) (bvsge (size!49059 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128558 d!158561))

(declare-fun d!158563 () Bool)

(assert (=> d!158563 (= (validKeyInArray!0 (select (arr!48508 a!2804) j!70)) (and (not (= (select (arr!48508 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48508 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1507347 d!158563))

(check-sat (not b!1507390) (not b!1507393) (not bm!68280))
(check-sat)
