; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130120 () Bool)

(assert start!130120)

(declare-fun b!1527406 () Bool)

(declare-fun res!1045442 () Bool)

(declare-fun e!851314 () Bool)

(assert (=> b!1527406 (=> (not res!1045442) (not e!851314))))

(declare-datatypes ((array!101533 0))(
  ( (array!101534 (arr!48993 (Array (_ BitVec 32) (_ BitVec 64))) (size!49543 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101533)

(declare-datatypes ((List!35476 0))(
  ( (Nil!35473) (Cons!35472 (h!36905 (_ BitVec 64)) (t!50170 List!35476)) )
))
(declare-fun arrayNoDuplicates!0 (array!101533 (_ BitVec 32) List!35476) Bool)

(assert (=> b!1527406 (= res!1045442 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35473))))

(declare-fun b!1527407 () Bool)

(declare-fun res!1045443 () Bool)

(assert (=> b!1527407 (=> (not res!1045443) (not e!851314))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1527407 (= res!1045443 (validKeyInArray!0 (select (arr!48993 a!2804) i!961)))))

(declare-fun b!1527408 () Bool)

(declare-fun res!1045447 () Bool)

(assert (=> b!1527408 (=> (not res!1045447) (not e!851314))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1527408 (= res!1045447 (validKeyInArray!0 (select (arr!48993 a!2804) j!70)))))

(declare-fun b!1527409 () Bool)

(declare-fun e!851318 () Bool)

(declare-fun e!851320 () Bool)

(assert (=> b!1527409 (= e!851318 e!851320)))

(declare-fun res!1045450 () Bool)

(assert (=> b!1527409 (=> res!1045450 e!851320)))

(declare-fun lt!661421 () (_ BitVec 64))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1527409 (= res!1045450 (or (not (= (select (arr!48993 a!2804) j!70) lt!661421)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48993 a!2804) index!487) (select (arr!48993 a!2804) j!70)) (not (= (select (arr!48993 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1527410 () Bool)

(declare-fun e!851316 () Bool)

(assert (=> b!1527410 (= e!851320 e!851316)))

(declare-fun res!1045444 () Bool)

(assert (=> b!1527410 (=> (not res!1045444) (not e!851316))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13158 0))(
  ( (MissingZero!13158 (index!55027 (_ BitVec 32))) (Found!13158 (index!55028 (_ BitVec 32))) (Intermediate!13158 (undefined!13970 Bool) (index!55029 (_ BitVec 32)) (x!136716 (_ BitVec 32))) (Undefined!13158) (MissingVacant!13158 (index!55030 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101533 (_ BitVec 32)) SeekEntryResult!13158)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101533 (_ BitVec 32)) SeekEntryResult!13158)

(assert (=> b!1527410 (= res!1045444 (= (seekEntryOrOpen!0 (select (arr!48993 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48993 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1527411 () Bool)

(declare-fun res!1045446 () Bool)

(assert (=> b!1527411 (=> (not res!1045446) (not e!851314))))

(assert (=> b!1527411 (= res!1045446 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49543 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49543 a!2804))))))

(declare-fun b!1527412 () Bool)

(declare-fun res!1045449 () Bool)

(declare-fun e!851317 () Bool)

(assert (=> b!1527412 (=> (not res!1045449) (not e!851317))))

(declare-fun lt!661420 () SeekEntryResult!13158)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101533 (_ BitVec 32)) SeekEntryResult!13158)

(assert (=> b!1527412 (= res!1045449 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48993 a!2804) j!70) a!2804 mask!2512) lt!661420))))

(declare-fun b!1527413 () Bool)

(declare-fun e!851319 () Bool)

(assert (=> b!1527413 (= e!851317 e!851319)))

(declare-fun res!1045441 () Bool)

(assert (=> b!1527413 (=> (not res!1045441) (not e!851319))))

(declare-fun lt!661423 () SeekEntryResult!13158)

(declare-fun lt!661422 () array!101533)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527413 (= res!1045441 (= lt!661423 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661421 mask!2512) lt!661421 lt!661422 mask!2512)))))

(assert (=> b!1527413 (= lt!661421 (select (store (arr!48993 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1527413 (= lt!661422 (array!101534 (store (arr!48993 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49543 a!2804)))))

(declare-fun b!1527414 () Bool)

(assert (=> b!1527414 (= e!851314 e!851317)))

(declare-fun res!1045440 () Bool)

(assert (=> b!1527414 (=> (not res!1045440) (not e!851317))))

(assert (=> b!1527414 (= res!1045440 (= lt!661423 lt!661420))))

(assert (=> b!1527414 (= lt!661420 (Intermediate!13158 false resIndex!21 resX!21))))

(assert (=> b!1527414 (= lt!661423 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48993 a!2804) j!70) mask!2512) (select (arr!48993 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527415 () Bool)

(assert (=> b!1527415 (= e!851316 (= (seekEntryOrOpen!0 lt!661421 lt!661422 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661421 lt!661422 mask!2512)))))

(declare-fun b!1527416 () Bool)

(declare-fun res!1045451 () Bool)

(assert (=> b!1527416 (=> (not res!1045451) (not e!851314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101533 (_ BitVec 32)) Bool)

(assert (=> b!1527416 (= res!1045451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1527417 () Bool)

(declare-fun res!1045448 () Bool)

(assert (=> b!1527417 (=> (not res!1045448) (not e!851314))))

(assert (=> b!1527417 (= res!1045448 (and (= (size!49543 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49543 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49543 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1527418 () Bool)

(assert (=> b!1527418 (= e!851319 (not true))))

(assert (=> b!1527418 e!851318))

(declare-fun res!1045453 () Bool)

(assert (=> b!1527418 (=> (not res!1045453) (not e!851318))))

(assert (=> b!1527418 (= res!1045453 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51100 0))(
  ( (Unit!51101) )
))
(declare-fun lt!661419 () Unit!51100)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101533 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51100)

(assert (=> b!1527418 (= lt!661419 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1045445 () Bool)

(assert (=> start!130120 (=> (not res!1045445) (not e!851314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130120 (= res!1045445 (validMask!0 mask!2512))))

(assert (=> start!130120 e!851314))

(assert (=> start!130120 true))

(declare-fun array_inv!38021 (array!101533) Bool)

(assert (=> start!130120 (array_inv!38021 a!2804)))

(declare-fun b!1527419 () Bool)

(declare-fun res!1045452 () Bool)

(assert (=> b!1527419 (=> (not res!1045452) (not e!851318))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101533 (_ BitVec 32)) SeekEntryResult!13158)

(assert (=> b!1527419 (= res!1045452 (= (seekEntry!0 (select (arr!48993 a!2804) j!70) a!2804 mask!2512) (Found!13158 j!70)))))

(assert (= (and start!130120 res!1045445) b!1527417))

(assert (= (and b!1527417 res!1045448) b!1527407))

(assert (= (and b!1527407 res!1045443) b!1527408))

(assert (= (and b!1527408 res!1045447) b!1527416))

(assert (= (and b!1527416 res!1045451) b!1527406))

(assert (= (and b!1527406 res!1045442) b!1527411))

(assert (= (and b!1527411 res!1045446) b!1527414))

(assert (= (and b!1527414 res!1045440) b!1527412))

(assert (= (and b!1527412 res!1045449) b!1527413))

(assert (= (and b!1527413 res!1045441) b!1527418))

(assert (= (and b!1527418 res!1045453) b!1527419))

(assert (= (and b!1527419 res!1045452) b!1527409))

(assert (= (and b!1527409 (not res!1045450)) b!1527410))

(assert (= (and b!1527410 res!1045444) b!1527415))

(declare-fun m!1410301 () Bool)

(assert (=> b!1527415 m!1410301))

(declare-fun m!1410303 () Bool)

(assert (=> b!1527415 m!1410303))

(declare-fun m!1410305 () Bool)

(assert (=> b!1527410 m!1410305))

(assert (=> b!1527410 m!1410305))

(declare-fun m!1410307 () Bool)

(assert (=> b!1527410 m!1410307))

(assert (=> b!1527410 m!1410305))

(declare-fun m!1410309 () Bool)

(assert (=> b!1527410 m!1410309))

(assert (=> b!1527412 m!1410305))

(assert (=> b!1527412 m!1410305))

(declare-fun m!1410311 () Bool)

(assert (=> b!1527412 m!1410311))

(declare-fun m!1410313 () Bool)

(assert (=> b!1527413 m!1410313))

(assert (=> b!1527413 m!1410313))

(declare-fun m!1410315 () Bool)

(assert (=> b!1527413 m!1410315))

(declare-fun m!1410317 () Bool)

(assert (=> b!1527413 m!1410317))

(declare-fun m!1410319 () Bool)

(assert (=> b!1527413 m!1410319))

(declare-fun m!1410321 () Bool)

(assert (=> b!1527418 m!1410321))

(declare-fun m!1410323 () Bool)

(assert (=> b!1527418 m!1410323))

(assert (=> b!1527419 m!1410305))

(assert (=> b!1527419 m!1410305))

(declare-fun m!1410325 () Bool)

(assert (=> b!1527419 m!1410325))

(assert (=> b!1527414 m!1410305))

(assert (=> b!1527414 m!1410305))

(declare-fun m!1410327 () Bool)

(assert (=> b!1527414 m!1410327))

(assert (=> b!1527414 m!1410327))

(assert (=> b!1527414 m!1410305))

(declare-fun m!1410329 () Bool)

(assert (=> b!1527414 m!1410329))

(assert (=> b!1527409 m!1410305))

(declare-fun m!1410331 () Bool)

(assert (=> b!1527409 m!1410331))

(assert (=> b!1527408 m!1410305))

(assert (=> b!1527408 m!1410305))

(declare-fun m!1410333 () Bool)

(assert (=> b!1527408 m!1410333))

(declare-fun m!1410335 () Bool)

(assert (=> b!1527416 m!1410335))

(declare-fun m!1410337 () Bool)

(assert (=> b!1527407 m!1410337))

(assert (=> b!1527407 m!1410337))

(declare-fun m!1410339 () Bool)

(assert (=> b!1527407 m!1410339))

(declare-fun m!1410341 () Bool)

(assert (=> b!1527406 m!1410341))

(declare-fun m!1410343 () Bool)

(assert (=> start!130120 m!1410343))

(declare-fun m!1410345 () Bool)

(assert (=> start!130120 m!1410345))

(check-sat (not b!1527408) (not b!1527413) (not b!1527418) (not b!1527412) (not start!130120) (not b!1527410) (not b!1527406) (not b!1527414) (not b!1527416) (not b!1527407) (not b!1527419) (not b!1527415))
(check-sat)
