; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130290 () Bool)

(assert start!130290)

(declare-fun b!1529784 () Bool)

(declare-fun res!1047493 () Bool)

(declare-fun e!852474 () Bool)

(assert (=> b!1529784 (=> (not res!1047493) (not e!852474))))

(declare-datatypes ((array!101640 0))(
  ( (array!101641 (arr!49045 (Array (_ BitVec 32) (_ BitVec 64))) (size!49595 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101640)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529784 (= res!1047493 (validKeyInArray!0 (select (arr!49045 a!2804) i!961)))))

(declare-fun b!1529785 () Bool)

(declare-fun res!1047499 () Bool)

(assert (=> b!1529785 (=> (not res!1047499) (not e!852474))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1529785 (= res!1047499 (and (= (size!49595 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49595 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49595 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529786 () Bool)

(declare-fun e!852477 () Bool)

(declare-fun e!852475 () Bool)

(assert (=> b!1529786 (= e!852477 (not e!852475))))

(declare-fun res!1047502 () Bool)

(assert (=> b!1529786 (=> res!1047502 e!852475)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1529786 (= res!1047502 (or (not (= (select (arr!49045 a!2804) j!70) (select (store (arr!49045 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852476 () Bool)

(assert (=> b!1529786 e!852476))

(declare-fun res!1047491 () Bool)

(assert (=> b!1529786 (=> (not res!1047491) (not e!852476))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101640 (_ BitVec 32)) Bool)

(assert (=> b!1529786 (= res!1047491 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51204 0))(
  ( (Unit!51205) )
))
(declare-fun lt!662549 () Unit!51204)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101640 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51204)

(assert (=> b!1529786 (= lt!662549 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529787 () Bool)

(declare-fun res!1047500 () Bool)

(assert (=> b!1529787 (=> (not res!1047500) (not e!852474))))

(declare-datatypes ((List!35528 0))(
  ( (Nil!35525) (Cons!35524 (h!36960 (_ BitVec 64)) (t!50222 List!35528)) )
))
(declare-fun arrayNoDuplicates!0 (array!101640 (_ BitVec 32) List!35528) Bool)

(assert (=> b!1529787 (= res!1047500 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35525))))

(declare-fun b!1529788 () Bool)

(declare-fun res!1047494 () Bool)

(assert (=> b!1529788 (=> (not res!1047494) (not e!852474))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529788 (= res!1047494 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49595 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49595 a!2804))))))

(declare-fun b!1529789 () Bool)

(declare-datatypes ((SeekEntryResult!13210 0))(
  ( (MissingZero!13210 (index!55235 (_ BitVec 32))) (Found!13210 (index!55236 (_ BitVec 32))) (Intermediate!13210 (undefined!14022 Bool) (index!55237 (_ BitVec 32)) (x!136913 (_ BitVec 32))) (Undefined!13210) (MissingVacant!13210 (index!55238 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101640 (_ BitVec 32)) SeekEntryResult!13210)

(assert (=> b!1529789 (= e!852476 (= (seekEntry!0 (select (arr!49045 a!2804) j!70) a!2804 mask!2512) (Found!13210 j!70)))))

(declare-fun b!1529790 () Bool)

(declare-fun res!1047498 () Bool)

(assert (=> b!1529790 (=> (not res!1047498) (not e!852474))))

(assert (=> b!1529790 (= res!1047498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529791 () Bool)

(declare-fun res!1047497 () Bool)

(assert (=> b!1529791 (=> (not res!1047497) (not e!852477))))

(declare-fun lt!662551 () SeekEntryResult!13210)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101640 (_ BitVec 32)) SeekEntryResult!13210)

(assert (=> b!1529791 (= res!1047497 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49045 a!2804) j!70) a!2804 mask!2512) lt!662551))))

(declare-fun res!1047501 () Bool)

(assert (=> start!130290 (=> (not res!1047501) (not e!852474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130290 (= res!1047501 (validMask!0 mask!2512))))

(assert (=> start!130290 e!852474))

(assert (=> start!130290 true))

(declare-fun array_inv!38073 (array!101640) Bool)

(assert (=> start!130290 (array_inv!38073 a!2804)))

(declare-fun b!1529792 () Bool)

(assert (=> b!1529792 (= e!852474 e!852477)))

(declare-fun res!1047496 () Bool)

(assert (=> b!1529792 (=> (not res!1047496) (not e!852477))))

(declare-fun lt!662550 () SeekEntryResult!13210)

(assert (=> b!1529792 (= res!1047496 (= lt!662550 lt!662551))))

(assert (=> b!1529792 (= lt!662551 (Intermediate!13210 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529792 (= lt!662550 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49045 a!2804) j!70) mask!2512) (select (arr!49045 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529793 () Bool)

(assert (=> b!1529793 (= e!852475 true)))

(declare-fun lt!662548 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529793 (= lt!662548 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529794 () Bool)

(declare-fun res!1047495 () Bool)

(assert (=> b!1529794 (=> (not res!1047495) (not e!852477))))

(assert (=> b!1529794 (= res!1047495 (= lt!662550 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49045 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49045 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101641 (store (arr!49045 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49595 a!2804)) mask!2512)))))

(declare-fun b!1529795 () Bool)

(declare-fun res!1047492 () Bool)

(assert (=> b!1529795 (=> (not res!1047492) (not e!852474))))

(assert (=> b!1529795 (= res!1047492 (validKeyInArray!0 (select (arr!49045 a!2804) j!70)))))

(assert (= (and start!130290 res!1047501) b!1529785))

(assert (= (and b!1529785 res!1047499) b!1529784))

(assert (= (and b!1529784 res!1047493) b!1529795))

(assert (= (and b!1529795 res!1047492) b!1529790))

(assert (= (and b!1529790 res!1047498) b!1529787))

(assert (= (and b!1529787 res!1047500) b!1529788))

(assert (= (and b!1529788 res!1047494) b!1529792))

(assert (= (and b!1529792 res!1047496) b!1529791))

(assert (= (and b!1529791 res!1047497) b!1529794))

(assert (= (and b!1529794 res!1047495) b!1529786))

(assert (= (and b!1529786 res!1047491) b!1529789))

(assert (= (and b!1529786 (not res!1047502)) b!1529793))

(declare-fun m!1412749 () Bool)

(assert (=> b!1529787 m!1412749))

(declare-fun m!1412751 () Bool)

(assert (=> b!1529795 m!1412751))

(assert (=> b!1529795 m!1412751))

(declare-fun m!1412753 () Bool)

(assert (=> b!1529795 m!1412753))

(declare-fun m!1412755 () Bool)

(assert (=> start!130290 m!1412755))

(declare-fun m!1412757 () Bool)

(assert (=> start!130290 m!1412757))

(declare-fun m!1412759 () Bool)

(assert (=> b!1529793 m!1412759))

(assert (=> b!1529789 m!1412751))

(assert (=> b!1529789 m!1412751))

(declare-fun m!1412761 () Bool)

(assert (=> b!1529789 m!1412761))

(assert (=> b!1529791 m!1412751))

(assert (=> b!1529791 m!1412751))

(declare-fun m!1412763 () Bool)

(assert (=> b!1529791 m!1412763))

(declare-fun m!1412765 () Bool)

(assert (=> b!1529784 m!1412765))

(assert (=> b!1529784 m!1412765))

(declare-fun m!1412767 () Bool)

(assert (=> b!1529784 m!1412767))

(declare-fun m!1412769 () Bool)

(assert (=> b!1529794 m!1412769))

(declare-fun m!1412771 () Bool)

(assert (=> b!1529794 m!1412771))

(assert (=> b!1529794 m!1412771))

(declare-fun m!1412773 () Bool)

(assert (=> b!1529794 m!1412773))

(assert (=> b!1529794 m!1412773))

(assert (=> b!1529794 m!1412771))

(declare-fun m!1412775 () Bool)

(assert (=> b!1529794 m!1412775))

(declare-fun m!1412777 () Bool)

(assert (=> b!1529790 m!1412777))

(assert (=> b!1529792 m!1412751))

(assert (=> b!1529792 m!1412751))

(declare-fun m!1412779 () Bool)

(assert (=> b!1529792 m!1412779))

(assert (=> b!1529792 m!1412779))

(assert (=> b!1529792 m!1412751))

(declare-fun m!1412781 () Bool)

(assert (=> b!1529792 m!1412781))

(assert (=> b!1529786 m!1412751))

(declare-fun m!1412783 () Bool)

(assert (=> b!1529786 m!1412783))

(assert (=> b!1529786 m!1412769))

(assert (=> b!1529786 m!1412771))

(declare-fun m!1412785 () Bool)

(assert (=> b!1529786 m!1412785))

(push 1)

