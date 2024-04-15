; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128846 () Bool)

(assert start!128846)

(declare-fun b!1510467 () Bool)

(declare-fun res!1030585 () Bool)

(declare-fun e!843378 () Bool)

(assert (=> b!1510467 (=> (not res!1030585) (not e!843378))))

(declare-datatypes ((SeekEntryResult!12783 0))(
  ( (MissingZero!12783 (index!53527 (_ BitVec 32))) (Found!12783 (index!53528 (_ BitVec 32))) (Intermediate!12783 (undefined!13595 Bool) (index!53529 (_ BitVec 32)) (x!135271 (_ BitVec 32))) (Undefined!12783) (MissingVacant!12783 (index!53530 (_ BitVec 32))) )
))
(declare-fun lt!654975 () SeekEntryResult!12783)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100702 0))(
  ( (array!100703 (arr!48589 (Array (_ BitVec 32) (_ BitVec 64))) (size!49141 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100702)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100702 (_ BitVec 32)) SeekEntryResult!12783)

(assert (=> b!1510467 (= res!1030585 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48589 a!2804) j!70) a!2804 mask!2512) lt!654975))))

(declare-fun b!1510468 () Bool)

(assert (=> b!1510468 (= e!843378 (not true))))

(declare-fun e!843379 () Bool)

(assert (=> b!1510468 e!843379))

(declare-fun res!1030582 () Bool)

(assert (=> b!1510468 (=> (not res!1030582) (not e!843379))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100702 (_ BitVec 32)) Bool)

(assert (=> b!1510468 (= res!1030582 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50273 0))(
  ( (Unit!50274) )
))
(declare-fun lt!654973 () Unit!50273)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100702 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50273)

(assert (=> b!1510468 (= lt!654973 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun res!1030577 () Bool)

(declare-fun e!843380 () Bool)

(assert (=> start!128846 (=> (not res!1030577) (not e!843380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128846 (= res!1030577 (validMask!0 mask!2512))))

(assert (=> start!128846 e!843380))

(assert (=> start!128846 true))

(declare-fun array_inv!37822 (array!100702) Bool)

(assert (=> start!128846 (array_inv!37822 a!2804)))

(declare-fun b!1510469 () Bool)

(declare-fun res!1030583 () Bool)

(assert (=> b!1510469 (=> (not res!1030583) (not e!843380))))

(declare-datatypes ((List!35150 0))(
  ( (Nil!35147) (Cons!35146 (h!36559 (_ BitVec 64)) (t!49836 List!35150)) )
))
(declare-fun arrayNoDuplicates!0 (array!100702 (_ BitVec 32) List!35150) Bool)

(assert (=> b!1510469 (= res!1030583 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35147))))

(declare-fun b!1510470 () Bool)

(declare-fun res!1030576 () Bool)

(assert (=> b!1510470 (=> (not res!1030576) (not e!843378))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!654974 () SeekEntryResult!12783)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510470 (= res!1030576 (= lt!654974 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48589 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48589 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100703 (store (arr!48589 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49141 a!2804)) mask!2512)))))

(declare-fun b!1510471 () Bool)

(declare-fun res!1030586 () Bool)

(assert (=> b!1510471 (=> (not res!1030586) (not e!843380))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510471 (= res!1030586 (validKeyInArray!0 (select (arr!48589 a!2804) j!70)))))

(declare-fun b!1510472 () Bool)

(declare-fun res!1030580 () Bool)

(assert (=> b!1510472 (=> (not res!1030580) (not e!843380))))

(assert (=> b!1510472 (= res!1030580 (validKeyInArray!0 (select (arr!48589 a!2804) i!961)))))

(declare-fun b!1510473 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100702 (_ BitVec 32)) SeekEntryResult!12783)

(assert (=> b!1510473 (= e!843379 (= (seekEntry!0 (select (arr!48589 a!2804) j!70) a!2804 mask!2512) (Found!12783 j!70)))))

(declare-fun b!1510474 () Bool)

(assert (=> b!1510474 (= e!843380 e!843378)))

(declare-fun res!1030584 () Bool)

(assert (=> b!1510474 (=> (not res!1030584) (not e!843378))))

(assert (=> b!1510474 (= res!1030584 (= lt!654974 lt!654975))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510474 (= lt!654975 (Intermediate!12783 false resIndex!21 resX!21))))

(assert (=> b!1510474 (= lt!654974 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48589 a!2804) j!70) mask!2512) (select (arr!48589 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510475 () Bool)

(declare-fun res!1030581 () Bool)

(assert (=> b!1510475 (=> (not res!1030581) (not e!843380))))

(assert (=> b!1510475 (= res!1030581 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49141 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49141 a!2804))))))

(declare-fun b!1510476 () Bool)

(declare-fun res!1030578 () Bool)

(assert (=> b!1510476 (=> (not res!1030578) (not e!843380))))

(assert (=> b!1510476 (= res!1030578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510477 () Bool)

(declare-fun res!1030579 () Bool)

(assert (=> b!1510477 (=> (not res!1030579) (not e!843380))))

(assert (=> b!1510477 (= res!1030579 (and (= (size!49141 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49141 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49141 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128846 res!1030577) b!1510477))

(assert (= (and b!1510477 res!1030579) b!1510472))

(assert (= (and b!1510472 res!1030580) b!1510471))

(assert (= (and b!1510471 res!1030586) b!1510476))

(assert (= (and b!1510476 res!1030578) b!1510469))

(assert (= (and b!1510469 res!1030583) b!1510475))

(assert (= (and b!1510475 res!1030581) b!1510474))

(assert (= (and b!1510474 res!1030584) b!1510467))

(assert (= (and b!1510467 res!1030585) b!1510470))

(assert (= (and b!1510470 res!1030576) b!1510468))

(assert (= (and b!1510468 res!1030582) b!1510473))

(declare-fun m!1392527 () Bool)

(assert (=> b!1510470 m!1392527))

(declare-fun m!1392529 () Bool)

(assert (=> b!1510470 m!1392529))

(assert (=> b!1510470 m!1392529))

(declare-fun m!1392531 () Bool)

(assert (=> b!1510470 m!1392531))

(assert (=> b!1510470 m!1392531))

(assert (=> b!1510470 m!1392529))

(declare-fun m!1392533 () Bool)

(assert (=> b!1510470 m!1392533))

(declare-fun m!1392535 () Bool)

(assert (=> b!1510471 m!1392535))

(assert (=> b!1510471 m!1392535))

(declare-fun m!1392537 () Bool)

(assert (=> b!1510471 m!1392537))

(declare-fun m!1392539 () Bool)

(assert (=> b!1510472 m!1392539))

(assert (=> b!1510472 m!1392539))

(declare-fun m!1392541 () Bool)

(assert (=> b!1510472 m!1392541))

(assert (=> b!1510473 m!1392535))

(assert (=> b!1510473 m!1392535))

(declare-fun m!1392543 () Bool)

(assert (=> b!1510473 m!1392543))

(declare-fun m!1392545 () Bool)

(assert (=> start!128846 m!1392545))

(declare-fun m!1392547 () Bool)

(assert (=> start!128846 m!1392547))

(assert (=> b!1510467 m!1392535))

(assert (=> b!1510467 m!1392535))

(declare-fun m!1392549 () Bool)

(assert (=> b!1510467 m!1392549))

(declare-fun m!1392551 () Bool)

(assert (=> b!1510476 m!1392551))

(assert (=> b!1510474 m!1392535))

(assert (=> b!1510474 m!1392535))

(declare-fun m!1392553 () Bool)

(assert (=> b!1510474 m!1392553))

(assert (=> b!1510474 m!1392553))

(assert (=> b!1510474 m!1392535))

(declare-fun m!1392555 () Bool)

(assert (=> b!1510474 m!1392555))

(declare-fun m!1392557 () Bool)

(assert (=> b!1510468 m!1392557))

(declare-fun m!1392559 () Bool)

(assert (=> b!1510468 m!1392559))

(declare-fun m!1392561 () Bool)

(assert (=> b!1510469 m!1392561))

(check-sat (not b!1510467) (not b!1510471) (not start!128846) (not b!1510476) (not b!1510469) (not b!1510470) (not b!1510474) (not b!1510468) (not b!1510472) (not b!1510473))
(check-sat)
