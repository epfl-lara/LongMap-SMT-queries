; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130236 () Bool)

(assert start!130236)

(declare-fun b!1528812 () Bool)

(declare-fun res!1046528 () Bool)

(declare-fun e!852069 () Bool)

(assert (=> b!1528812 (=> (not res!1046528) (not e!852069))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-datatypes ((array!101586 0))(
  ( (array!101587 (arr!49018 (Array (_ BitVec 32) (_ BitVec 64))) (size!49568 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101586)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(assert (=> b!1528812 (= res!1046528 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49568 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49568 a!2804))))))

(declare-fun b!1528813 () Bool)

(declare-fun e!852070 () Bool)

(declare-fun e!852071 () Bool)

(assert (=> b!1528813 (= e!852070 (not e!852071))))

(declare-fun res!1046522 () Bool)

(assert (=> b!1528813 (=> res!1046522 e!852071)))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1528813 (= res!1046522 (or (not (= (select (arr!49018 a!2804) j!70) (select (store (arr!49018 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852073 () Bool)

(assert (=> b!1528813 e!852073))

(declare-fun res!1046529 () Bool)

(assert (=> b!1528813 (=> (not res!1046529) (not e!852073))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101586 (_ BitVec 32)) Bool)

(assert (=> b!1528813 (= res!1046529 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51150 0))(
  ( (Unit!51151) )
))
(declare-fun lt!662226 () Unit!51150)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51150)

(assert (=> b!1528813 (= lt!662226 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528814 () Bool)

(declare-fun res!1046530 () Bool)

(assert (=> b!1528814 (=> (not res!1046530) (not e!852070))))

(declare-datatypes ((SeekEntryResult!13183 0))(
  ( (MissingZero!13183 (index!55127 (_ BitVec 32))) (Found!13183 (index!55128 (_ BitVec 32))) (Intermediate!13183 (undefined!13995 Bool) (index!55129 (_ BitVec 32)) (x!136814 (_ BitVec 32))) (Undefined!13183) (MissingVacant!13183 (index!55130 (_ BitVec 32))) )
))
(declare-fun lt!662227 () SeekEntryResult!13183)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101586 (_ BitVec 32)) SeekEntryResult!13183)

(assert (=> b!1528814 (= res!1046530 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49018 a!2804) j!70) a!2804 mask!2512) lt!662227))))

(declare-fun b!1528815 () Bool)

(declare-fun res!1046519 () Bool)

(assert (=> b!1528815 (=> (not res!1046519) (not e!852069))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528815 (= res!1046519 (validKeyInArray!0 (select (arr!49018 a!2804) i!961)))))

(declare-fun b!1528816 () Bool)

(declare-fun res!1046520 () Bool)

(assert (=> b!1528816 (=> (not res!1046520) (not e!852069))))

(assert (=> b!1528816 (= res!1046520 (and (= (size!49568 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49568 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49568 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528817 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101586 (_ BitVec 32)) SeekEntryResult!13183)

(assert (=> b!1528817 (= e!852073 (= (seekEntry!0 (select (arr!49018 a!2804) j!70) a!2804 mask!2512) (Found!13183 j!70)))))

(declare-fun b!1528818 () Bool)

(declare-fun res!1046525 () Bool)

(assert (=> b!1528818 (=> (not res!1046525) (not e!852069))))

(declare-datatypes ((List!35501 0))(
  ( (Nil!35498) (Cons!35497 (h!36933 (_ BitVec 64)) (t!50195 List!35501)) )
))
(declare-fun arrayNoDuplicates!0 (array!101586 (_ BitVec 32) List!35501) Bool)

(assert (=> b!1528818 (= res!1046525 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35498))))

(declare-fun b!1528819 () Bool)

(declare-fun res!1046527 () Bool)

(assert (=> b!1528819 (=> (not res!1046527) (not e!852069))))

(assert (=> b!1528819 (= res!1046527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528820 () Bool)

(declare-fun res!1046523 () Bool)

(assert (=> b!1528820 (=> (not res!1046523) (not e!852069))))

(assert (=> b!1528820 (= res!1046523 (validKeyInArray!0 (select (arr!49018 a!2804) j!70)))))

(declare-fun b!1528821 () Bool)

(assert (=> b!1528821 (= e!852071 true)))

(declare-fun lt!662224 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528821 (= lt!662224 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun res!1046521 () Bool)

(assert (=> start!130236 (=> (not res!1046521) (not e!852069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130236 (= res!1046521 (validMask!0 mask!2512))))

(assert (=> start!130236 e!852069))

(assert (=> start!130236 true))

(declare-fun array_inv!38046 (array!101586) Bool)

(assert (=> start!130236 (array_inv!38046 a!2804)))

(declare-fun b!1528822 () Bool)

(assert (=> b!1528822 (= e!852069 e!852070)))

(declare-fun res!1046526 () Bool)

(assert (=> b!1528822 (=> (not res!1046526) (not e!852070))))

(declare-fun lt!662225 () SeekEntryResult!13183)

(assert (=> b!1528822 (= res!1046526 (= lt!662225 lt!662227))))

(assert (=> b!1528822 (= lt!662227 (Intermediate!13183 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528822 (= lt!662225 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49018 a!2804) j!70) mask!2512) (select (arr!49018 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528823 () Bool)

(declare-fun res!1046524 () Bool)

(assert (=> b!1528823 (=> (not res!1046524) (not e!852070))))

(assert (=> b!1528823 (= res!1046524 (= lt!662225 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49018 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49018 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101587 (store (arr!49018 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49568 a!2804)) mask!2512)))))

(assert (= (and start!130236 res!1046521) b!1528816))

(assert (= (and b!1528816 res!1046520) b!1528815))

(assert (= (and b!1528815 res!1046519) b!1528820))

(assert (= (and b!1528820 res!1046523) b!1528819))

(assert (= (and b!1528819 res!1046527) b!1528818))

(assert (= (and b!1528818 res!1046525) b!1528812))

(assert (= (and b!1528812 res!1046528) b!1528822))

(assert (= (and b!1528822 res!1046526) b!1528814))

(assert (= (and b!1528814 res!1046530) b!1528823))

(assert (= (and b!1528823 res!1046524) b!1528813))

(assert (= (and b!1528813 res!1046529) b!1528817))

(assert (= (and b!1528813 (not res!1046522)) b!1528821))

(declare-fun m!1411723 () Bool)

(assert (=> b!1528817 m!1411723))

(assert (=> b!1528817 m!1411723))

(declare-fun m!1411725 () Bool)

(assert (=> b!1528817 m!1411725))

(assert (=> b!1528820 m!1411723))

(assert (=> b!1528820 m!1411723))

(declare-fun m!1411727 () Bool)

(assert (=> b!1528820 m!1411727))

(declare-fun m!1411729 () Bool)

(assert (=> b!1528818 m!1411729))

(declare-fun m!1411731 () Bool)

(assert (=> start!130236 m!1411731))

(declare-fun m!1411733 () Bool)

(assert (=> start!130236 m!1411733))

(declare-fun m!1411735 () Bool)

(assert (=> b!1528823 m!1411735))

(declare-fun m!1411737 () Bool)

(assert (=> b!1528823 m!1411737))

(assert (=> b!1528823 m!1411737))

(declare-fun m!1411739 () Bool)

(assert (=> b!1528823 m!1411739))

(assert (=> b!1528823 m!1411739))

(assert (=> b!1528823 m!1411737))

(declare-fun m!1411741 () Bool)

(assert (=> b!1528823 m!1411741))

(declare-fun m!1411743 () Bool)

(assert (=> b!1528821 m!1411743))

(declare-fun m!1411745 () Bool)

(assert (=> b!1528819 m!1411745))

(assert (=> b!1528814 m!1411723))

(assert (=> b!1528814 m!1411723))

(declare-fun m!1411747 () Bool)

(assert (=> b!1528814 m!1411747))

(assert (=> b!1528822 m!1411723))

(assert (=> b!1528822 m!1411723))

(declare-fun m!1411749 () Bool)

(assert (=> b!1528822 m!1411749))

(assert (=> b!1528822 m!1411749))

(assert (=> b!1528822 m!1411723))

(declare-fun m!1411751 () Bool)

(assert (=> b!1528822 m!1411751))

(declare-fun m!1411753 () Bool)

(assert (=> b!1528815 m!1411753))

(assert (=> b!1528815 m!1411753))

(declare-fun m!1411755 () Bool)

(assert (=> b!1528815 m!1411755))

(assert (=> b!1528813 m!1411723))

(declare-fun m!1411757 () Bool)

(assert (=> b!1528813 m!1411757))

(assert (=> b!1528813 m!1411735))

(assert (=> b!1528813 m!1411737))

(declare-fun m!1411759 () Bool)

(assert (=> b!1528813 m!1411759))

(push 1)

