; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130126 () Bool)

(assert start!130126)

(declare-fun b!1527532 () Bool)

(declare-fun e!851379 () Bool)

(declare-fun e!851383 () Bool)

(assert (=> b!1527532 (= e!851379 e!851383)))

(declare-fun res!1045570 () Bool)

(assert (=> b!1527532 (=> (not res!1045570) (not e!851383))))

(declare-datatypes ((SeekEntryResult!13161 0))(
  ( (MissingZero!13161 (index!55039 (_ BitVec 32))) (Found!13161 (index!55040 (_ BitVec 32))) (Intermediate!13161 (undefined!13973 Bool) (index!55041 (_ BitVec 32)) (x!136727 (_ BitVec 32))) (Undefined!13161) (MissingVacant!13161 (index!55042 (_ BitVec 32))) )
))
(declare-fun lt!661468 () SeekEntryResult!13161)

(declare-datatypes ((array!101539 0))(
  ( (array!101540 (arr!48996 (Array (_ BitVec 32) (_ BitVec 64))) (size!49546 (_ BitVec 32))) )
))
(declare-fun lt!661467 () array!101539)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun lt!661464 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101539 (_ BitVec 32)) SeekEntryResult!13161)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527532 (= res!1045570 (= lt!661468 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661464 mask!2512) lt!661464 lt!661467 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun a!2804 () array!101539)

(assert (=> b!1527532 (= lt!661464 (select (store (arr!48996 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1527532 (= lt!661467 (array!101540 (store (arr!48996 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49546 a!2804)))))

(declare-fun b!1527533 () Bool)

(declare-fun e!851381 () Bool)

(assert (=> b!1527533 (= e!851381 e!851379)))

(declare-fun res!1045571 () Bool)

(assert (=> b!1527533 (=> (not res!1045571) (not e!851379))))

(declare-fun lt!661466 () SeekEntryResult!13161)

(assert (=> b!1527533 (= res!1045571 (= lt!661468 lt!661466))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1527533 (= lt!661466 (Intermediate!13161 false resIndex!21 resX!21))))

(assert (=> b!1527533 (= lt!661468 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48996 a!2804) j!70) mask!2512) (select (arr!48996 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527534 () Bool)

(declare-fun res!1045568 () Bool)

(assert (=> b!1527534 (=> (not res!1045568) (not e!851381))))

(declare-datatypes ((List!35479 0))(
  ( (Nil!35476) (Cons!35475 (h!36908 (_ BitVec 64)) (t!50173 List!35479)) )
))
(declare-fun arrayNoDuplicates!0 (array!101539 (_ BitVec 32) List!35479) Bool)

(assert (=> b!1527534 (= res!1045568 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35476))))

(declare-fun b!1527535 () Bool)

(declare-fun res!1045579 () Bool)

(assert (=> b!1527535 (=> (not res!1045579) (not e!851381))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1527535 (= res!1045579 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49546 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49546 a!2804))))))

(declare-fun b!1527536 () Bool)

(declare-fun res!1045566 () Bool)

(assert (=> b!1527536 (=> (not res!1045566) (not e!851381))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1527536 (= res!1045566 (validKeyInArray!0 (select (arr!48996 a!2804) j!70)))))

(declare-fun b!1527537 () Bool)

(declare-fun e!851378 () Bool)

(declare-fun e!851382 () Bool)

(assert (=> b!1527537 (= e!851378 e!851382)))

(declare-fun res!1045576 () Bool)

(assert (=> b!1527537 (=> res!1045576 e!851382)))

(assert (=> b!1527537 (= res!1045576 (or (not (= (select (arr!48996 a!2804) j!70) lt!661464)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48996 a!2804) index!487) (select (arr!48996 a!2804) j!70)) (not (= (select (arr!48996 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!851380 () Bool)

(declare-fun b!1527538 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101539 (_ BitVec 32)) SeekEntryResult!13161)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101539 (_ BitVec 32)) SeekEntryResult!13161)

(assert (=> b!1527538 (= e!851380 (= (seekEntryOrOpen!0 lt!661464 lt!661467 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661464 lt!661467 mask!2512)))))

(declare-fun b!1527539 () Bool)

(declare-fun res!1045572 () Bool)

(assert (=> b!1527539 (=> (not res!1045572) (not e!851381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101539 (_ BitVec 32)) Bool)

(assert (=> b!1527539 (= res!1045572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1527540 () Bool)

(assert (=> b!1527540 (= e!851383 (not true))))

(assert (=> b!1527540 e!851378))

(declare-fun res!1045567 () Bool)

(assert (=> b!1527540 (=> (not res!1045567) (not e!851378))))

(assert (=> b!1527540 (= res!1045567 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51106 0))(
  ( (Unit!51107) )
))
(declare-fun lt!661465 () Unit!51106)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101539 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51106)

(assert (=> b!1527540 (= lt!661465 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1527541 () Bool)

(declare-fun res!1045577 () Bool)

(assert (=> b!1527541 (=> (not res!1045577) (not e!851381))))

(assert (=> b!1527541 (= res!1045577 (and (= (size!49546 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49546 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49546 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1527542 () Bool)

(declare-fun res!1045574 () Bool)

(assert (=> b!1527542 (=> (not res!1045574) (not e!851379))))

(assert (=> b!1527542 (= res!1045574 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48996 a!2804) j!70) a!2804 mask!2512) lt!661466))))

(declare-fun b!1527543 () Bool)

(declare-fun res!1045575 () Bool)

(assert (=> b!1527543 (=> (not res!1045575) (not e!851381))))

(assert (=> b!1527543 (= res!1045575 (validKeyInArray!0 (select (arr!48996 a!2804) i!961)))))

(declare-fun b!1527544 () Bool)

(assert (=> b!1527544 (= e!851382 e!851380)))

(declare-fun res!1045578 () Bool)

(assert (=> b!1527544 (=> (not res!1045578) (not e!851380))))

(assert (=> b!1527544 (= res!1045578 (= (seekEntryOrOpen!0 (select (arr!48996 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48996 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun res!1045569 () Bool)

(assert (=> start!130126 (=> (not res!1045569) (not e!851381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130126 (= res!1045569 (validMask!0 mask!2512))))

(assert (=> start!130126 e!851381))

(assert (=> start!130126 true))

(declare-fun array_inv!38024 (array!101539) Bool)

(assert (=> start!130126 (array_inv!38024 a!2804)))

(declare-fun b!1527545 () Bool)

(declare-fun res!1045573 () Bool)

(assert (=> b!1527545 (=> (not res!1045573) (not e!851378))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101539 (_ BitVec 32)) SeekEntryResult!13161)

(assert (=> b!1527545 (= res!1045573 (= (seekEntry!0 (select (arr!48996 a!2804) j!70) a!2804 mask!2512) (Found!13161 j!70)))))

(assert (= (and start!130126 res!1045569) b!1527541))

(assert (= (and b!1527541 res!1045577) b!1527543))

(assert (= (and b!1527543 res!1045575) b!1527536))

(assert (= (and b!1527536 res!1045566) b!1527539))

(assert (= (and b!1527539 res!1045572) b!1527534))

(assert (= (and b!1527534 res!1045568) b!1527535))

(assert (= (and b!1527535 res!1045579) b!1527533))

(assert (= (and b!1527533 res!1045571) b!1527542))

(assert (= (and b!1527542 res!1045574) b!1527532))

(assert (= (and b!1527532 res!1045570) b!1527540))

(assert (= (and b!1527540 res!1045567) b!1527545))

(assert (= (and b!1527545 res!1045573) b!1527537))

(assert (= (and b!1527537 (not res!1045576)) b!1527544))

(assert (= (and b!1527544 res!1045578) b!1527538))

(declare-fun m!1410439 () Bool)

(assert (=> b!1527536 m!1410439))

(assert (=> b!1527536 m!1410439))

(declare-fun m!1410441 () Bool)

(assert (=> b!1527536 m!1410441))

(declare-fun m!1410443 () Bool)

(assert (=> b!1527543 m!1410443))

(assert (=> b!1527543 m!1410443))

(declare-fun m!1410445 () Bool)

(assert (=> b!1527543 m!1410445))

(declare-fun m!1410447 () Bool)

(assert (=> b!1527532 m!1410447))

(assert (=> b!1527532 m!1410447))

(declare-fun m!1410449 () Bool)

(assert (=> b!1527532 m!1410449))

(declare-fun m!1410451 () Bool)

(assert (=> b!1527532 m!1410451))

(declare-fun m!1410453 () Bool)

(assert (=> b!1527532 m!1410453))

(declare-fun m!1410455 () Bool)

(assert (=> b!1527540 m!1410455))

(declare-fun m!1410457 () Bool)

(assert (=> b!1527540 m!1410457))

(declare-fun m!1410459 () Bool)

(assert (=> b!1527539 m!1410459))

(declare-fun m!1410461 () Bool)

(assert (=> b!1527538 m!1410461))

(declare-fun m!1410463 () Bool)

(assert (=> b!1527538 m!1410463))

(declare-fun m!1410465 () Bool)

(assert (=> start!130126 m!1410465))

(declare-fun m!1410467 () Bool)

(assert (=> start!130126 m!1410467))

(assert (=> b!1527545 m!1410439))

(assert (=> b!1527545 m!1410439))

(declare-fun m!1410469 () Bool)

(assert (=> b!1527545 m!1410469))

(declare-fun m!1410471 () Bool)

(assert (=> b!1527534 m!1410471))

(assert (=> b!1527537 m!1410439))

(declare-fun m!1410473 () Bool)

(assert (=> b!1527537 m!1410473))

(assert (=> b!1527533 m!1410439))

(assert (=> b!1527533 m!1410439))

(declare-fun m!1410475 () Bool)

(assert (=> b!1527533 m!1410475))

(assert (=> b!1527533 m!1410475))

(assert (=> b!1527533 m!1410439))

(declare-fun m!1410477 () Bool)

(assert (=> b!1527533 m!1410477))

(assert (=> b!1527542 m!1410439))

(assert (=> b!1527542 m!1410439))

(declare-fun m!1410479 () Bool)

(assert (=> b!1527542 m!1410479))

(assert (=> b!1527544 m!1410439))

(assert (=> b!1527544 m!1410439))

(declare-fun m!1410481 () Bool)

(assert (=> b!1527544 m!1410481))

(assert (=> b!1527544 m!1410439))

(declare-fun m!1410483 () Bool)

(assert (=> b!1527544 m!1410483))

(check-sat (not b!1527544) (not b!1527538) (not b!1527536) (not b!1527545) (not b!1527532) (not b!1527540) (not start!130126) (not b!1527543) (not b!1527533) (not b!1527542) (not b!1527534) (not b!1527539))
(check-sat)
