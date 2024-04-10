; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130232 () Bool)

(assert start!130232)

(declare-fun b!1528740 () Bool)

(declare-fun res!1046448 () Bool)

(declare-fun e!852041 () Bool)

(assert (=> b!1528740 (=> (not res!1046448) (not e!852041))))

(declare-datatypes ((SeekEntryResult!13181 0))(
  ( (MissingZero!13181 (index!55119 (_ BitVec 32))) (Found!13181 (index!55120 (_ BitVec 32))) (Intermediate!13181 (undefined!13993 Bool) (index!55121 (_ BitVec 32)) (x!136812 (_ BitVec 32))) (Undefined!13181) (MissingVacant!13181 (index!55122 (_ BitVec 32))) )
))
(declare-fun lt!662203 () SeekEntryResult!13181)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101582 0))(
  ( (array!101583 (arr!49016 (Array (_ BitVec 32) (_ BitVec 64))) (size!49566 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101582)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101582 (_ BitVec 32)) SeekEntryResult!13181)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528740 (= res!1046448 (= lt!662203 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49016 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49016 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101583 (store (arr!49016 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49566 a!2804)) mask!2512)))))

(declare-fun b!1528741 () Bool)

(declare-fun e!852040 () Bool)

(assert (=> b!1528741 (= e!852041 (not e!852040))))

(declare-fun res!1046455 () Bool)

(assert (=> b!1528741 (=> res!1046455 e!852040)))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1528741 (= res!1046455 (or (not (= (select (arr!49016 a!2804) j!70) (select (store (arr!49016 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852042 () Bool)

(assert (=> b!1528741 e!852042))

(declare-fun res!1046454 () Bool)

(assert (=> b!1528741 (=> (not res!1046454) (not e!852042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101582 (_ BitVec 32)) Bool)

(assert (=> b!1528741 (= res!1046454 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51146 0))(
  ( (Unit!51147) )
))
(declare-fun lt!662201 () Unit!51146)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101582 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51146)

(assert (=> b!1528741 (= lt!662201 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528742 () Bool)

(declare-fun res!1046457 () Bool)

(assert (=> b!1528742 (=> (not res!1046457) (not e!852041))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!662200 () SeekEntryResult!13181)

(assert (=> b!1528742 (= res!1046457 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49016 a!2804) j!70) a!2804 mask!2512) lt!662200))))

(declare-fun b!1528743 () Bool)

(declare-fun e!852039 () Bool)

(assert (=> b!1528743 (= e!852039 e!852041)))

(declare-fun res!1046453 () Bool)

(assert (=> b!1528743 (=> (not res!1046453) (not e!852041))))

(assert (=> b!1528743 (= res!1046453 (= lt!662203 lt!662200))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1528743 (= lt!662200 (Intermediate!13181 false resIndex!21 resX!21))))

(assert (=> b!1528743 (= lt!662203 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49016 a!2804) j!70) mask!2512) (select (arr!49016 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528744 () Bool)

(declare-fun res!1046452 () Bool)

(assert (=> b!1528744 (=> (not res!1046452) (not e!852039))))

(assert (=> b!1528744 (= res!1046452 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49566 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49566 a!2804))))))

(declare-fun res!1046451 () Bool)

(assert (=> start!130232 (=> (not res!1046451) (not e!852039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130232 (= res!1046451 (validMask!0 mask!2512))))

(assert (=> start!130232 e!852039))

(assert (=> start!130232 true))

(declare-fun array_inv!38044 (array!101582) Bool)

(assert (=> start!130232 (array_inv!38044 a!2804)))

(declare-fun b!1528745 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101582 (_ BitVec 32)) SeekEntryResult!13181)

(assert (=> b!1528745 (= e!852042 (= (seekEntry!0 (select (arr!49016 a!2804) j!70) a!2804 mask!2512) (Found!13181 j!70)))))

(declare-fun b!1528746 () Bool)

(assert (=> b!1528746 (= e!852040 true)))

(declare-fun lt!662202 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528746 (= lt!662202 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1528747 () Bool)

(declare-fun res!1046450 () Bool)

(assert (=> b!1528747 (=> (not res!1046450) (not e!852039))))

(assert (=> b!1528747 (= res!1046450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528748 () Bool)

(declare-fun res!1046458 () Bool)

(assert (=> b!1528748 (=> (not res!1046458) (not e!852039))))

(declare-datatypes ((List!35499 0))(
  ( (Nil!35496) (Cons!35495 (h!36931 (_ BitVec 64)) (t!50193 List!35499)) )
))
(declare-fun arrayNoDuplicates!0 (array!101582 (_ BitVec 32) List!35499) Bool)

(assert (=> b!1528748 (= res!1046458 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35496))))

(declare-fun b!1528749 () Bool)

(declare-fun res!1046447 () Bool)

(assert (=> b!1528749 (=> (not res!1046447) (not e!852039))))

(assert (=> b!1528749 (= res!1046447 (and (= (size!49566 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49566 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49566 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528750 () Bool)

(declare-fun res!1046449 () Bool)

(assert (=> b!1528750 (=> (not res!1046449) (not e!852039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528750 (= res!1046449 (validKeyInArray!0 (select (arr!49016 a!2804) j!70)))))

(declare-fun b!1528751 () Bool)

(declare-fun res!1046456 () Bool)

(assert (=> b!1528751 (=> (not res!1046456) (not e!852039))))

(assert (=> b!1528751 (= res!1046456 (validKeyInArray!0 (select (arr!49016 a!2804) i!961)))))

(assert (= (and start!130232 res!1046451) b!1528749))

(assert (= (and b!1528749 res!1046447) b!1528751))

(assert (= (and b!1528751 res!1046456) b!1528750))

(assert (= (and b!1528750 res!1046449) b!1528747))

(assert (= (and b!1528747 res!1046450) b!1528748))

(assert (= (and b!1528748 res!1046458) b!1528744))

(assert (= (and b!1528744 res!1046452) b!1528743))

(assert (= (and b!1528743 res!1046453) b!1528742))

(assert (= (and b!1528742 res!1046457) b!1528740))

(assert (= (and b!1528740 res!1046448) b!1528741))

(assert (= (and b!1528741 res!1046454) b!1528745))

(assert (= (and b!1528741 (not res!1046455)) b!1528746))

(declare-fun m!1411647 () Bool)

(assert (=> start!130232 m!1411647))

(declare-fun m!1411649 () Bool)

(assert (=> start!130232 m!1411649))

(declare-fun m!1411651 () Bool)

(assert (=> b!1528745 m!1411651))

(assert (=> b!1528745 m!1411651))

(declare-fun m!1411653 () Bool)

(assert (=> b!1528745 m!1411653))

(assert (=> b!1528750 m!1411651))

(assert (=> b!1528750 m!1411651))

(declare-fun m!1411655 () Bool)

(assert (=> b!1528750 m!1411655))

(declare-fun m!1411657 () Bool)

(assert (=> b!1528751 m!1411657))

(assert (=> b!1528751 m!1411657))

(declare-fun m!1411659 () Bool)

(assert (=> b!1528751 m!1411659))

(declare-fun m!1411661 () Bool)

(assert (=> b!1528747 m!1411661))

(assert (=> b!1528741 m!1411651))

(declare-fun m!1411663 () Bool)

(assert (=> b!1528741 m!1411663))

(declare-fun m!1411665 () Bool)

(assert (=> b!1528741 m!1411665))

(declare-fun m!1411667 () Bool)

(assert (=> b!1528741 m!1411667))

(declare-fun m!1411669 () Bool)

(assert (=> b!1528741 m!1411669))

(assert (=> b!1528740 m!1411665))

(assert (=> b!1528740 m!1411667))

(assert (=> b!1528740 m!1411667))

(declare-fun m!1411671 () Bool)

(assert (=> b!1528740 m!1411671))

(assert (=> b!1528740 m!1411671))

(assert (=> b!1528740 m!1411667))

(declare-fun m!1411673 () Bool)

(assert (=> b!1528740 m!1411673))

(assert (=> b!1528743 m!1411651))

(assert (=> b!1528743 m!1411651))

(declare-fun m!1411675 () Bool)

(assert (=> b!1528743 m!1411675))

(assert (=> b!1528743 m!1411675))

(assert (=> b!1528743 m!1411651))

(declare-fun m!1411677 () Bool)

(assert (=> b!1528743 m!1411677))

(declare-fun m!1411679 () Bool)

(assert (=> b!1528748 m!1411679))

(declare-fun m!1411681 () Bool)

(assert (=> b!1528746 m!1411681))

(assert (=> b!1528742 m!1411651))

(assert (=> b!1528742 m!1411651))

(declare-fun m!1411683 () Bool)

(assert (=> b!1528742 m!1411683))

(push 1)

