; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130280 () Bool)

(assert start!130280)

(declare-fun b!1529604 () Bool)

(declare-fun res!1047311 () Bool)

(declare-fun e!852400 () Bool)

(assert (=> b!1529604 (=> (not res!1047311) (not e!852400))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101630 0))(
  ( (array!101631 (arr!49040 (Array (_ BitVec 32) (_ BitVec 64))) (size!49590 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101630)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529604 (= res!1047311 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49590 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49590 a!2804))))))

(declare-fun b!1529605 () Bool)

(declare-fun e!852402 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13205 0))(
  ( (MissingZero!13205 (index!55215 (_ BitVec 32))) (Found!13205 (index!55216 (_ BitVec 32))) (Intermediate!13205 (undefined!14017 Bool) (index!55217 (_ BitVec 32)) (x!136900 (_ BitVec 32))) (Undefined!13205) (MissingVacant!13205 (index!55218 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101630 (_ BitVec 32)) SeekEntryResult!13205)

(assert (=> b!1529605 (= e!852402 (= (seekEntry!0 (select (arr!49040 a!2804) j!70) a!2804 mask!2512) (Found!13205 j!70)))))

(declare-fun b!1529607 () Bool)

(declare-fun e!852399 () Bool)

(assert (=> b!1529607 (= e!852400 e!852399)))

(declare-fun res!1047319 () Bool)

(assert (=> b!1529607 (=> (not res!1047319) (not e!852399))))

(declare-fun lt!662489 () SeekEntryResult!13205)

(declare-fun lt!662491 () SeekEntryResult!13205)

(assert (=> b!1529607 (= res!1047319 (= lt!662489 lt!662491))))

(assert (=> b!1529607 (= lt!662491 (Intermediate!13205 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101630 (_ BitVec 32)) SeekEntryResult!13205)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529607 (= lt!662489 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49040 a!2804) j!70) mask!2512) (select (arr!49040 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529608 () Bool)

(declare-fun e!852403 () Bool)

(assert (=> b!1529608 (= e!852399 (not e!852403))))

(declare-fun res!1047314 () Bool)

(assert (=> b!1529608 (=> res!1047314 e!852403)))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1529608 (= res!1047314 (or (not (= (select (arr!49040 a!2804) j!70) (select (store (arr!49040 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(assert (=> b!1529608 e!852402))

(declare-fun res!1047321 () Bool)

(assert (=> b!1529608 (=> (not res!1047321) (not e!852402))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101630 (_ BitVec 32)) Bool)

(assert (=> b!1529608 (= res!1047321 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51194 0))(
  ( (Unit!51195) )
))
(declare-fun lt!662488 () Unit!51194)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101630 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51194)

(assert (=> b!1529608 (= lt!662488 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529609 () Bool)

(declare-fun res!1047317 () Bool)

(assert (=> b!1529609 (=> (not res!1047317) (not e!852399))))

(assert (=> b!1529609 (= res!1047317 (= lt!662489 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49040 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49040 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101631 (store (arr!49040 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49590 a!2804)) mask!2512)))))

(declare-fun b!1529610 () Bool)

(declare-fun res!1047313 () Bool)

(assert (=> b!1529610 (=> (not res!1047313) (not e!852400))))

(assert (=> b!1529610 (= res!1047313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529611 () Bool)

(declare-fun res!1047316 () Bool)

(assert (=> b!1529611 (=> (not res!1047316) (not e!852400))))

(declare-datatypes ((List!35523 0))(
  ( (Nil!35520) (Cons!35519 (h!36955 (_ BitVec 64)) (t!50217 List!35523)) )
))
(declare-fun arrayNoDuplicates!0 (array!101630 (_ BitVec 32) List!35523) Bool)

(assert (=> b!1529611 (= res!1047316 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35520))))

(declare-fun b!1529612 () Bool)

(declare-fun res!1047320 () Bool)

(assert (=> b!1529612 (=> (not res!1047320) (not e!852400))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529612 (= res!1047320 (validKeyInArray!0 (select (arr!49040 a!2804) i!961)))))

(declare-fun res!1047312 () Bool)

(assert (=> start!130280 (=> (not res!1047312) (not e!852400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130280 (= res!1047312 (validMask!0 mask!2512))))

(assert (=> start!130280 e!852400))

(assert (=> start!130280 true))

(declare-fun array_inv!38068 (array!101630) Bool)

(assert (=> start!130280 (array_inv!38068 a!2804)))

(declare-fun b!1529606 () Bool)

(declare-fun res!1047315 () Bool)

(assert (=> b!1529606 (=> (not res!1047315) (not e!852399))))

(assert (=> b!1529606 (= res!1047315 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49040 a!2804) j!70) a!2804 mask!2512) lt!662491))))

(declare-fun b!1529613 () Bool)

(assert (=> b!1529613 (= e!852403 true)))

(declare-fun lt!662490 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529613 (= lt!662490 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529614 () Bool)

(declare-fun res!1047322 () Bool)

(assert (=> b!1529614 (=> (not res!1047322) (not e!852400))))

(assert (=> b!1529614 (= res!1047322 (validKeyInArray!0 (select (arr!49040 a!2804) j!70)))))

(declare-fun b!1529615 () Bool)

(declare-fun res!1047318 () Bool)

(assert (=> b!1529615 (=> (not res!1047318) (not e!852400))))

(assert (=> b!1529615 (= res!1047318 (and (= (size!49590 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49590 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49590 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!130280 res!1047312) b!1529615))

(assert (= (and b!1529615 res!1047318) b!1529612))

(assert (= (and b!1529612 res!1047320) b!1529614))

(assert (= (and b!1529614 res!1047322) b!1529610))

(assert (= (and b!1529610 res!1047313) b!1529611))

(assert (= (and b!1529611 res!1047316) b!1529604))

(assert (= (and b!1529604 res!1047311) b!1529607))

(assert (= (and b!1529607 res!1047319) b!1529606))

(assert (= (and b!1529606 res!1047315) b!1529609))

(assert (= (and b!1529609 res!1047317) b!1529608))

(assert (= (and b!1529608 res!1047321) b!1529605))

(assert (= (and b!1529608 (not res!1047314)) b!1529613))

(declare-fun m!1412559 () Bool)

(assert (=> b!1529606 m!1412559))

(assert (=> b!1529606 m!1412559))

(declare-fun m!1412561 () Bool)

(assert (=> b!1529606 m!1412561))

(assert (=> b!1529605 m!1412559))

(assert (=> b!1529605 m!1412559))

(declare-fun m!1412563 () Bool)

(assert (=> b!1529605 m!1412563))

(declare-fun m!1412565 () Bool)

(assert (=> b!1529612 m!1412565))

(assert (=> b!1529612 m!1412565))

(declare-fun m!1412567 () Bool)

(assert (=> b!1529612 m!1412567))

(declare-fun m!1412569 () Bool)

(assert (=> b!1529613 m!1412569))

(declare-fun m!1412571 () Bool)

(assert (=> b!1529609 m!1412571))

(declare-fun m!1412573 () Bool)

(assert (=> b!1529609 m!1412573))

(assert (=> b!1529609 m!1412573))

(declare-fun m!1412575 () Bool)

(assert (=> b!1529609 m!1412575))

(assert (=> b!1529609 m!1412575))

(assert (=> b!1529609 m!1412573))

(declare-fun m!1412577 () Bool)

(assert (=> b!1529609 m!1412577))

(declare-fun m!1412579 () Bool)

(assert (=> b!1529611 m!1412579))

(assert (=> b!1529614 m!1412559))

(assert (=> b!1529614 m!1412559))

(declare-fun m!1412581 () Bool)

(assert (=> b!1529614 m!1412581))

(assert (=> b!1529607 m!1412559))

(assert (=> b!1529607 m!1412559))

(declare-fun m!1412583 () Bool)

(assert (=> b!1529607 m!1412583))

(assert (=> b!1529607 m!1412583))

(assert (=> b!1529607 m!1412559))

(declare-fun m!1412585 () Bool)

(assert (=> b!1529607 m!1412585))

(declare-fun m!1412587 () Bool)

(assert (=> b!1529610 m!1412587))

(declare-fun m!1412589 () Bool)

(assert (=> start!130280 m!1412589))

(declare-fun m!1412591 () Bool)

(assert (=> start!130280 m!1412591))

(assert (=> b!1529608 m!1412559))

(declare-fun m!1412593 () Bool)

(assert (=> b!1529608 m!1412593))

(assert (=> b!1529608 m!1412571))

(assert (=> b!1529608 m!1412573))

(declare-fun m!1412595 () Bool)

(assert (=> b!1529608 m!1412595))

(push 1)

