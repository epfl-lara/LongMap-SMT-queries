; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130078 () Bool)

(assert start!130078)

(declare-fun res!1044567 () Bool)

(declare-fun e!850876 () Bool)

(assert (=> start!130078 (=> (not res!1044567) (not e!850876))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130078 (= res!1044567 (validMask!0 mask!2512))))

(assert (=> start!130078 e!850876))

(assert (=> start!130078 true))

(declare-datatypes ((array!101491 0))(
  ( (array!101492 (arr!48972 (Array (_ BitVec 32) (_ BitVec 64))) (size!49522 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101491)

(declare-fun array_inv!38000 (array!101491) Bool)

(assert (=> start!130078 (array_inv!38000 a!2804)))

(declare-fun b!1526524 () Bool)

(declare-fun e!850874 () Bool)

(assert (=> b!1526524 (= e!850874 (not true))))

(declare-fun e!850873 () Bool)

(assert (=> b!1526524 e!850873))

(declare-fun res!1044568 () Bool)

(assert (=> b!1526524 (=> (not res!1044568) (not e!850873))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101491 (_ BitVec 32)) Bool)

(assert (=> b!1526524 (= res!1044568 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51058 0))(
  ( (Unit!51059) )
))
(declare-fun lt!661104 () Unit!51058)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101491 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51058)

(assert (=> b!1526524 (= lt!661104 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526525 () Bool)

(declare-fun res!1044561 () Bool)

(assert (=> b!1526525 (=> (not res!1044561) (not e!850873))))

(declare-datatypes ((SeekEntryResult!13137 0))(
  ( (MissingZero!13137 (index!54943 (_ BitVec 32))) (Found!13137 (index!54944 (_ BitVec 32))) (Intermediate!13137 (undefined!13949 Bool) (index!54945 (_ BitVec 32)) (x!136639 (_ BitVec 32))) (Undefined!13137) (MissingVacant!13137 (index!54946 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101491 (_ BitVec 32)) SeekEntryResult!13137)

(assert (=> b!1526525 (= res!1044561 (= (seekEntry!0 (select (arr!48972 a!2804) j!70) a!2804 mask!2512) (Found!13137 j!70)))))

(declare-fun b!1526526 () Bool)

(declare-fun res!1044571 () Bool)

(assert (=> b!1526526 (=> (not res!1044571) (not e!850876))))

(declare-datatypes ((List!35455 0))(
  ( (Nil!35452) (Cons!35451 (h!36884 (_ BitVec 64)) (t!50149 List!35455)) )
))
(declare-fun arrayNoDuplicates!0 (array!101491 (_ BitVec 32) List!35455) Bool)

(assert (=> b!1526526 (= res!1044571 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35452))))

(declare-fun b!1526527 () Bool)

(declare-fun res!1044564 () Bool)

(assert (=> b!1526527 (=> (not res!1044564) (not e!850876))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1526527 (= res!1044564 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49522 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49522 a!2804))))))

(declare-fun b!1526528 () Bool)

(declare-fun e!850878 () Bool)

(assert (=> b!1526528 (= e!850876 e!850878)))

(declare-fun res!1044563 () Bool)

(assert (=> b!1526528 (=> (not res!1044563) (not e!850878))))

(declare-fun lt!661108 () SeekEntryResult!13137)

(declare-fun lt!661107 () SeekEntryResult!13137)

(assert (=> b!1526528 (= res!1044563 (= lt!661108 lt!661107))))

(assert (=> b!1526528 (= lt!661107 (Intermediate!13137 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101491 (_ BitVec 32)) SeekEntryResult!13137)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526528 (= lt!661108 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48972 a!2804) j!70) mask!2512) (select (arr!48972 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526529 () Bool)

(declare-fun res!1044560 () Bool)

(assert (=> b!1526529 (=> (not res!1044560) (not e!850876))))

(assert (=> b!1526529 (= res!1044560 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526530 () Bool)

(declare-fun res!1044565 () Bool)

(assert (=> b!1526530 (=> (not res!1044565) (not e!850876))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1526530 (= res!1044565 (and (= (size!49522 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49522 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49522 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526531 () Bool)

(declare-fun res!1044566 () Bool)

(assert (=> b!1526531 (=> (not res!1044566) (not e!850878))))

(assert (=> b!1526531 (= res!1044566 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48972 a!2804) j!70) a!2804 mask!2512) lt!661107))))

(declare-fun b!1526532 () Bool)

(declare-fun res!1044562 () Bool)

(assert (=> b!1526532 (=> (not res!1044562) (not e!850876))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526532 (= res!1044562 (validKeyInArray!0 (select (arr!48972 a!2804) j!70)))))

(declare-fun b!1526533 () Bool)

(assert (=> b!1526533 (= e!850878 e!850874)))

(declare-fun res!1044558 () Bool)

(assert (=> b!1526533 (=> (not res!1044558) (not e!850874))))

(declare-fun lt!661106 () array!101491)

(declare-fun lt!661105 () (_ BitVec 64))

(assert (=> b!1526533 (= res!1044558 (= lt!661108 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661105 mask!2512) lt!661105 lt!661106 mask!2512)))))

(assert (=> b!1526533 (= lt!661105 (select (store (arr!48972 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526533 (= lt!661106 (array!101492 (store (arr!48972 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49522 a!2804)))))

(declare-fun b!1526534 () Bool)

(declare-fun e!850877 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101491 (_ BitVec 32)) SeekEntryResult!13137)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101491 (_ BitVec 32)) SeekEntryResult!13137)

(assert (=> b!1526534 (= e!850877 (= (seekEntryOrOpen!0 lt!661105 lt!661106 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661105 lt!661106 mask!2512)))))

(declare-fun b!1526535 () Bool)

(declare-fun e!850875 () Bool)

(assert (=> b!1526535 (= e!850873 e!850875)))

(declare-fun res!1044559 () Bool)

(assert (=> b!1526535 (=> res!1044559 e!850875)))

(assert (=> b!1526535 (= res!1044559 (or (not (= (select (arr!48972 a!2804) j!70) lt!661105)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48972 a!2804) index!487) (select (arr!48972 a!2804) j!70)) (not (= (select (arr!48972 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526536 () Bool)

(declare-fun res!1044570 () Bool)

(assert (=> b!1526536 (=> (not res!1044570) (not e!850876))))

(assert (=> b!1526536 (= res!1044570 (validKeyInArray!0 (select (arr!48972 a!2804) i!961)))))

(declare-fun b!1526537 () Bool)

(assert (=> b!1526537 (= e!850875 e!850877)))

(declare-fun res!1044569 () Bool)

(assert (=> b!1526537 (=> (not res!1044569) (not e!850877))))

(assert (=> b!1526537 (= res!1044569 (= (seekEntryOrOpen!0 (select (arr!48972 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48972 a!2804) j!70) a!2804 mask!2512)))))

(assert (= (and start!130078 res!1044567) b!1526530))

(assert (= (and b!1526530 res!1044565) b!1526536))

(assert (= (and b!1526536 res!1044570) b!1526532))

(assert (= (and b!1526532 res!1044562) b!1526529))

(assert (= (and b!1526529 res!1044560) b!1526526))

(assert (= (and b!1526526 res!1044571) b!1526527))

(assert (= (and b!1526527 res!1044564) b!1526528))

(assert (= (and b!1526528 res!1044563) b!1526531))

(assert (= (and b!1526531 res!1044566) b!1526533))

(assert (= (and b!1526533 res!1044558) b!1526524))

(assert (= (and b!1526524 res!1044568) b!1526525))

(assert (= (and b!1526525 res!1044561) b!1526535))

(assert (= (and b!1526535 (not res!1044559)) b!1526537))

(assert (= (and b!1526537 res!1044569) b!1526534))

(declare-fun m!1409335 () Bool)

(assert (=> b!1526531 m!1409335))

(assert (=> b!1526531 m!1409335))

(declare-fun m!1409337 () Bool)

(assert (=> b!1526531 m!1409337))

(assert (=> b!1526525 m!1409335))

(assert (=> b!1526525 m!1409335))

(declare-fun m!1409339 () Bool)

(assert (=> b!1526525 m!1409339))

(declare-fun m!1409341 () Bool)

(assert (=> b!1526534 m!1409341))

(declare-fun m!1409343 () Bool)

(assert (=> b!1526534 m!1409343))

(declare-fun m!1409345 () Bool)

(assert (=> start!130078 m!1409345))

(declare-fun m!1409347 () Bool)

(assert (=> start!130078 m!1409347))

(assert (=> b!1526532 m!1409335))

(assert (=> b!1526532 m!1409335))

(declare-fun m!1409349 () Bool)

(assert (=> b!1526532 m!1409349))

(declare-fun m!1409351 () Bool)

(assert (=> b!1526529 m!1409351))

(declare-fun m!1409353 () Bool)

(assert (=> b!1526533 m!1409353))

(assert (=> b!1526533 m!1409353))

(declare-fun m!1409355 () Bool)

(assert (=> b!1526533 m!1409355))

(declare-fun m!1409357 () Bool)

(assert (=> b!1526533 m!1409357))

(declare-fun m!1409359 () Bool)

(assert (=> b!1526533 m!1409359))

(assert (=> b!1526537 m!1409335))

(assert (=> b!1526537 m!1409335))

(declare-fun m!1409361 () Bool)

(assert (=> b!1526537 m!1409361))

(assert (=> b!1526537 m!1409335))

(declare-fun m!1409363 () Bool)

(assert (=> b!1526537 m!1409363))

(declare-fun m!1409365 () Bool)

(assert (=> b!1526526 m!1409365))

(declare-fun m!1409367 () Bool)

(assert (=> b!1526536 m!1409367))

(assert (=> b!1526536 m!1409367))

(declare-fun m!1409369 () Bool)

(assert (=> b!1526536 m!1409369))

(assert (=> b!1526528 m!1409335))

(assert (=> b!1526528 m!1409335))

(declare-fun m!1409371 () Bool)

(assert (=> b!1526528 m!1409371))

(assert (=> b!1526528 m!1409371))

(assert (=> b!1526528 m!1409335))

(declare-fun m!1409373 () Bool)

(assert (=> b!1526528 m!1409373))

(declare-fun m!1409375 () Bool)

(assert (=> b!1526524 m!1409375))

(declare-fun m!1409377 () Bool)

(assert (=> b!1526524 m!1409377))

(assert (=> b!1526535 m!1409335))

(declare-fun m!1409379 () Bool)

(assert (=> b!1526535 m!1409379))

(check-sat (not b!1526525) (not b!1526528) (not b!1526526) (not b!1526536) (not b!1526533) (not b!1526531) (not b!1526532) (not b!1526529) (not b!1526534) (not start!130078) (not b!1526524) (not b!1526537))
(check-sat)
