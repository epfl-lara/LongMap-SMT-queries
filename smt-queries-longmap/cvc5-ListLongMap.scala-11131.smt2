; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130082 () Bool)

(assert start!130082)

(declare-fun b!1526608 () Bool)

(declare-fun res!1044644 () Bool)

(declare-fun e!850920 () Bool)

(assert (=> b!1526608 (=> (not res!1044644) (not e!850920))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101495 0))(
  ( (array!101496 (arr!48974 (Array (_ BitVec 32) (_ BitVec 64))) (size!49524 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101495)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1526608 (= res!1044644 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49524 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49524 a!2804))))))

(declare-fun res!1044650 () Bool)

(assert (=> start!130082 (=> (not res!1044650) (not e!850920))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130082 (= res!1044650 (validMask!0 mask!2512))))

(assert (=> start!130082 e!850920))

(assert (=> start!130082 true))

(declare-fun array_inv!38002 (array!101495) Bool)

(assert (=> start!130082 (array_inv!38002 a!2804)))

(declare-fun b!1526609 () Bool)

(declare-fun res!1044649 () Bool)

(assert (=> b!1526609 (=> (not res!1044649) (not e!850920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101495 (_ BitVec 32)) Bool)

(assert (=> b!1526609 (= res!1044649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526610 () Bool)

(declare-fun e!850921 () Bool)

(declare-fun e!850919 () Bool)

(assert (=> b!1526610 (= e!850921 e!850919)))

(declare-fun res!1044647 () Bool)

(assert (=> b!1526610 (=> (not res!1044647) (not e!850919))))

(declare-fun lt!661137 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!13139 0))(
  ( (MissingZero!13139 (index!54951 (_ BitVec 32))) (Found!13139 (index!54952 (_ BitVec 32))) (Intermediate!13139 (undefined!13951 Bool) (index!54953 (_ BitVec 32)) (x!136649 (_ BitVec 32))) (Undefined!13139) (MissingVacant!13139 (index!54954 (_ BitVec 32))) )
))
(declare-fun lt!661136 () SeekEntryResult!13139)

(declare-fun lt!661138 () array!101495)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101495 (_ BitVec 32)) SeekEntryResult!13139)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526610 (= res!1044647 (= lt!661136 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661137 mask!2512) lt!661137 lt!661138 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1526610 (= lt!661137 (select (store (arr!48974 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526610 (= lt!661138 (array!101496 (store (arr!48974 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49524 a!2804)))))

(declare-fun b!1526611 () Bool)

(declare-fun res!1044648 () Bool)

(assert (=> b!1526611 (=> (not res!1044648) (not e!850920))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526611 (= res!1044648 (validKeyInArray!0 (select (arr!48974 a!2804) i!961)))))

(declare-fun b!1526612 () Bool)

(declare-fun e!850917 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101495 (_ BitVec 32)) SeekEntryResult!13139)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101495 (_ BitVec 32)) SeekEntryResult!13139)

(assert (=> b!1526612 (= e!850917 (= (seekEntryOrOpen!0 lt!661137 lt!661138 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661137 lt!661138 mask!2512)))))

(declare-fun b!1526613 () Bool)

(declare-fun res!1044642 () Bool)

(declare-fun e!850915 () Bool)

(assert (=> b!1526613 (=> (not res!1044642) (not e!850915))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101495 (_ BitVec 32)) SeekEntryResult!13139)

(assert (=> b!1526613 (= res!1044642 (= (seekEntry!0 (select (arr!48974 a!2804) j!70) a!2804 mask!2512) (Found!13139 j!70)))))

(declare-fun b!1526614 () Bool)

(declare-fun res!1044651 () Bool)

(assert (=> b!1526614 (=> (not res!1044651) (not e!850920))))

(assert (=> b!1526614 (= res!1044651 (and (= (size!49524 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49524 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49524 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1526615 () Bool)

(assert (=> b!1526615 (= e!850919 (not true))))

(assert (=> b!1526615 e!850915))

(declare-fun res!1044652 () Bool)

(assert (=> b!1526615 (=> (not res!1044652) (not e!850915))))

(assert (=> b!1526615 (= res!1044652 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51062 0))(
  ( (Unit!51063) )
))
(declare-fun lt!661134 () Unit!51062)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101495 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51062)

(assert (=> b!1526615 (= lt!661134 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526616 () Bool)

(declare-fun res!1044654 () Bool)

(assert (=> b!1526616 (=> (not res!1044654) (not e!850920))))

(assert (=> b!1526616 (= res!1044654 (validKeyInArray!0 (select (arr!48974 a!2804) j!70)))))

(declare-fun b!1526617 () Bool)

(declare-fun res!1044646 () Bool)

(assert (=> b!1526617 (=> (not res!1044646) (not e!850920))))

(declare-datatypes ((List!35457 0))(
  ( (Nil!35454) (Cons!35453 (h!36886 (_ BitVec 64)) (t!50151 List!35457)) )
))
(declare-fun arrayNoDuplicates!0 (array!101495 (_ BitVec 32) List!35457) Bool)

(assert (=> b!1526617 (= res!1044646 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35454))))

(declare-fun b!1526618 () Bool)

(declare-fun e!850916 () Bool)

(assert (=> b!1526618 (= e!850916 e!850917)))

(declare-fun res!1044643 () Bool)

(assert (=> b!1526618 (=> (not res!1044643) (not e!850917))))

(assert (=> b!1526618 (= res!1044643 (= (seekEntryOrOpen!0 (select (arr!48974 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48974 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1526619 () Bool)

(assert (=> b!1526619 (= e!850915 e!850916)))

(declare-fun res!1044655 () Bool)

(assert (=> b!1526619 (=> res!1044655 e!850916)))

(assert (=> b!1526619 (= res!1044655 (or (not (= (select (arr!48974 a!2804) j!70) lt!661137)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48974 a!2804) index!487) (select (arr!48974 a!2804) j!70)) (not (= (select (arr!48974 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526620 () Bool)

(declare-fun res!1044645 () Bool)

(assert (=> b!1526620 (=> (not res!1044645) (not e!850921))))

(declare-fun lt!661135 () SeekEntryResult!13139)

(assert (=> b!1526620 (= res!1044645 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48974 a!2804) j!70) a!2804 mask!2512) lt!661135))))

(declare-fun b!1526621 () Bool)

(assert (=> b!1526621 (= e!850920 e!850921)))

(declare-fun res!1044653 () Bool)

(assert (=> b!1526621 (=> (not res!1044653) (not e!850921))))

(assert (=> b!1526621 (= res!1044653 (= lt!661136 lt!661135))))

(assert (=> b!1526621 (= lt!661135 (Intermediate!13139 false resIndex!21 resX!21))))

(assert (=> b!1526621 (= lt!661136 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48974 a!2804) j!70) mask!2512) (select (arr!48974 a!2804) j!70) a!2804 mask!2512))))

(assert (= (and start!130082 res!1044650) b!1526614))

(assert (= (and b!1526614 res!1044651) b!1526611))

(assert (= (and b!1526611 res!1044648) b!1526616))

(assert (= (and b!1526616 res!1044654) b!1526609))

(assert (= (and b!1526609 res!1044649) b!1526617))

(assert (= (and b!1526617 res!1044646) b!1526608))

(assert (= (and b!1526608 res!1044644) b!1526621))

(assert (= (and b!1526621 res!1044653) b!1526620))

(assert (= (and b!1526620 res!1044645) b!1526610))

(assert (= (and b!1526610 res!1044647) b!1526615))

(assert (= (and b!1526615 res!1044652) b!1526613))

(assert (= (and b!1526613 res!1044642) b!1526619))

(assert (= (and b!1526619 (not res!1044655)) b!1526618))

(assert (= (and b!1526618 res!1044643) b!1526612))

(declare-fun m!1409427 () Bool)

(assert (=> b!1526618 m!1409427))

(assert (=> b!1526618 m!1409427))

(declare-fun m!1409429 () Bool)

(assert (=> b!1526618 m!1409429))

(assert (=> b!1526618 m!1409427))

(declare-fun m!1409431 () Bool)

(assert (=> b!1526618 m!1409431))

(declare-fun m!1409433 () Bool)

(assert (=> start!130082 m!1409433))

(declare-fun m!1409435 () Bool)

(assert (=> start!130082 m!1409435))

(declare-fun m!1409437 () Bool)

(assert (=> b!1526610 m!1409437))

(assert (=> b!1526610 m!1409437))

(declare-fun m!1409439 () Bool)

(assert (=> b!1526610 m!1409439))

(declare-fun m!1409441 () Bool)

(assert (=> b!1526610 m!1409441))

(declare-fun m!1409443 () Bool)

(assert (=> b!1526610 m!1409443))

(declare-fun m!1409445 () Bool)

(assert (=> b!1526611 m!1409445))

(assert (=> b!1526611 m!1409445))

(declare-fun m!1409447 () Bool)

(assert (=> b!1526611 m!1409447))

(assert (=> b!1526621 m!1409427))

(assert (=> b!1526621 m!1409427))

(declare-fun m!1409449 () Bool)

(assert (=> b!1526621 m!1409449))

(assert (=> b!1526621 m!1409449))

(assert (=> b!1526621 m!1409427))

(declare-fun m!1409451 () Bool)

(assert (=> b!1526621 m!1409451))

(assert (=> b!1526613 m!1409427))

(assert (=> b!1526613 m!1409427))

(declare-fun m!1409453 () Bool)

(assert (=> b!1526613 m!1409453))

(declare-fun m!1409455 () Bool)

(assert (=> b!1526615 m!1409455))

(declare-fun m!1409457 () Bool)

(assert (=> b!1526615 m!1409457))

(declare-fun m!1409459 () Bool)

(assert (=> b!1526609 m!1409459))

(declare-fun m!1409461 () Bool)

(assert (=> b!1526617 m!1409461))

(declare-fun m!1409463 () Bool)

(assert (=> b!1526612 m!1409463))

(declare-fun m!1409465 () Bool)

(assert (=> b!1526612 m!1409465))

(assert (=> b!1526616 m!1409427))

(assert (=> b!1526616 m!1409427))

(declare-fun m!1409467 () Bool)

(assert (=> b!1526616 m!1409467))

(assert (=> b!1526620 m!1409427))

(assert (=> b!1526620 m!1409427))

(declare-fun m!1409469 () Bool)

(assert (=> b!1526620 m!1409469))

(assert (=> b!1526619 m!1409427))

(declare-fun m!1409471 () Bool)

(assert (=> b!1526619 m!1409471))

(push 1)

