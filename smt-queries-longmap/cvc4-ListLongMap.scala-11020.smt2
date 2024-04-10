; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128956 () Bool)

(assert start!128956)

(declare-fun b!1511798 () Bool)

(declare-fun e!843959 () Bool)

(declare-fun e!843960 () Bool)

(assert (=> b!1511798 (= e!843959 e!843960)))

(declare-fun res!1031713 () Bool)

(assert (=> b!1511798 (=> res!1031713 e!843960)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100812 0))(
  ( (array!100813 (arr!48643 (Array (_ BitVec 32) (_ BitVec 64))) (size!49193 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100812)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1511798 (= res!1031713 (or (not (= (select (arr!48643 a!2804) j!70) (select (store (arr!48643 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48643 a!2804) index!487) (select (arr!48643 a!2804) j!70)) (not (= (select (arr!48643 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1511799 () Bool)

(declare-fun res!1031704 () Bool)

(declare-fun e!843958 () Bool)

(assert (=> b!1511799 (=> (not res!1031704) (not e!843958))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12814 0))(
  ( (MissingZero!12814 (index!53651 (_ BitVec 32))) (Found!12814 (index!53652 (_ BitVec 32))) (Intermediate!12814 (undefined!13626 Bool) (index!53653 (_ BitVec 32)) (x!135380 (_ BitVec 32))) (Undefined!12814) (MissingVacant!12814 (index!53654 (_ BitVec 32))) )
))
(declare-fun lt!655530 () SeekEntryResult!12814)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100812 (_ BitVec 32)) SeekEntryResult!12814)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511799 (= res!1031704 (= lt!655530 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48643 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48643 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100813 (store (arr!48643 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49193 a!2804)) mask!2512)))))

(declare-fun b!1511800 () Bool)

(declare-fun res!1031701 () Bool)

(assert (=> b!1511800 (=> (not res!1031701) (not e!843959))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100812 (_ BitVec 32)) SeekEntryResult!12814)

(assert (=> b!1511800 (= res!1031701 (= (seekEntry!0 (select (arr!48643 a!2804) j!70) a!2804 mask!2512) (Found!12814 j!70)))))

(declare-fun b!1511801 () Bool)

(declare-fun res!1031705 () Bool)

(assert (=> b!1511801 (=> (not res!1031705) (not e!843958))))

(declare-fun lt!655529 () SeekEntryResult!12814)

(assert (=> b!1511801 (= res!1031705 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48643 a!2804) j!70) a!2804 mask!2512) lt!655529))))

(declare-fun b!1511803 () Bool)

(declare-fun res!1031709 () Bool)

(declare-fun e!843961 () Bool)

(assert (=> b!1511803 (=> (not res!1031709) (not e!843961))))

(declare-datatypes ((List!35126 0))(
  ( (Nil!35123) (Cons!35122 (h!36534 (_ BitVec 64)) (t!49820 List!35126)) )
))
(declare-fun arrayNoDuplicates!0 (array!100812 (_ BitVec 32) List!35126) Bool)

(assert (=> b!1511803 (= res!1031709 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35123))))

(declare-fun b!1511804 () Bool)

(assert (=> b!1511804 (= e!843958 (not (or (not (= (select (arr!48643 a!2804) j!70) (select (store (arr!48643 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48643 a!2804) index!487) (select (arr!48643 a!2804) j!70)) (not (= (select (arr!48643 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(assert (=> b!1511804 e!843959))

(declare-fun res!1031710 () Bool)

(assert (=> b!1511804 (=> (not res!1031710) (not e!843959))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100812 (_ BitVec 32)) Bool)

(assert (=> b!1511804 (= res!1031710 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50496 0))(
  ( (Unit!50497) )
))
(declare-fun lt!655531 () Unit!50496)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100812 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50496)

(assert (=> b!1511804 (= lt!655531 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511805 () Bool)

(declare-fun res!1031702 () Bool)

(assert (=> b!1511805 (=> (not res!1031702) (not e!843961))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511805 (= res!1031702 (validKeyInArray!0 (select (arr!48643 a!2804) i!961)))))

(declare-fun b!1511806 () Bool)

(declare-fun res!1031703 () Bool)

(assert (=> b!1511806 (=> (not res!1031703) (not e!843961))))

(assert (=> b!1511806 (= res!1031703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511807 () Bool)

(assert (=> b!1511807 (= e!843961 e!843958)))

(declare-fun res!1031707 () Bool)

(assert (=> b!1511807 (=> (not res!1031707) (not e!843958))))

(assert (=> b!1511807 (= res!1031707 (= lt!655530 lt!655529))))

(assert (=> b!1511807 (= lt!655529 (Intermediate!12814 false resIndex!21 resX!21))))

(assert (=> b!1511807 (= lt!655530 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48643 a!2804) j!70) mask!2512) (select (arr!48643 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511808 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100812 (_ BitVec 32)) SeekEntryResult!12814)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100812 (_ BitVec 32)) SeekEntryResult!12814)

(assert (=> b!1511808 (= e!843960 (= (seekEntryOrOpen!0 (select (arr!48643 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48643 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun res!1031712 () Bool)

(assert (=> start!128956 (=> (not res!1031712) (not e!843961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128956 (= res!1031712 (validMask!0 mask!2512))))

(assert (=> start!128956 e!843961))

(assert (=> start!128956 true))

(declare-fun array_inv!37671 (array!100812) Bool)

(assert (=> start!128956 (array_inv!37671 a!2804)))

(declare-fun b!1511802 () Bool)

(declare-fun res!1031711 () Bool)

(assert (=> b!1511802 (=> (not res!1031711) (not e!843961))))

(assert (=> b!1511802 (= res!1031711 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49193 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49193 a!2804))))))

(declare-fun b!1511809 () Bool)

(declare-fun res!1031708 () Bool)

(assert (=> b!1511809 (=> (not res!1031708) (not e!843961))))

(assert (=> b!1511809 (= res!1031708 (validKeyInArray!0 (select (arr!48643 a!2804) j!70)))))

(declare-fun b!1511810 () Bool)

(declare-fun res!1031706 () Bool)

(assert (=> b!1511810 (=> (not res!1031706) (not e!843961))))

(assert (=> b!1511810 (= res!1031706 (and (= (size!49193 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49193 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49193 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!128956 res!1031712) b!1511810))

(assert (= (and b!1511810 res!1031706) b!1511805))

(assert (= (and b!1511805 res!1031702) b!1511809))

(assert (= (and b!1511809 res!1031708) b!1511806))

(assert (= (and b!1511806 res!1031703) b!1511803))

(assert (= (and b!1511803 res!1031709) b!1511802))

(assert (= (and b!1511802 res!1031711) b!1511807))

(assert (= (and b!1511807 res!1031707) b!1511801))

(assert (= (and b!1511801 res!1031705) b!1511799))

(assert (= (and b!1511799 res!1031704) b!1511804))

(assert (= (and b!1511804 res!1031710) b!1511800))

(assert (= (and b!1511800 res!1031701) b!1511798))

(assert (= (and b!1511798 (not res!1031713)) b!1511808))

(declare-fun m!1394521 () Bool)

(assert (=> b!1511801 m!1394521))

(assert (=> b!1511801 m!1394521))

(declare-fun m!1394523 () Bool)

(assert (=> b!1511801 m!1394523))

(declare-fun m!1394525 () Bool)

(assert (=> b!1511803 m!1394525))

(assert (=> b!1511808 m!1394521))

(assert (=> b!1511808 m!1394521))

(declare-fun m!1394527 () Bool)

(assert (=> b!1511808 m!1394527))

(assert (=> b!1511808 m!1394521))

(declare-fun m!1394529 () Bool)

(assert (=> b!1511808 m!1394529))

(declare-fun m!1394531 () Bool)

(assert (=> b!1511806 m!1394531))

(declare-fun m!1394533 () Bool)

(assert (=> start!128956 m!1394533))

(declare-fun m!1394535 () Bool)

(assert (=> start!128956 m!1394535))

(declare-fun m!1394537 () Bool)

(assert (=> b!1511805 m!1394537))

(assert (=> b!1511805 m!1394537))

(declare-fun m!1394539 () Bool)

(assert (=> b!1511805 m!1394539))

(assert (=> b!1511798 m!1394521))

(declare-fun m!1394541 () Bool)

(assert (=> b!1511798 m!1394541))

(declare-fun m!1394543 () Bool)

(assert (=> b!1511798 m!1394543))

(declare-fun m!1394545 () Bool)

(assert (=> b!1511798 m!1394545))

(assert (=> b!1511809 m!1394521))

(assert (=> b!1511809 m!1394521))

(declare-fun m!1394547 () Bool)

(assert (=> b!1511809 m!1394547))

(assert (=> b!1511804 m!1394521))

(declare-fun m!1394549 () Bool)

(assert (=> b!1511804 m!1394549))

(assert (=> b!1511804 m!1394541))

(assert (=> b!1511804 m!1394545))

(assert (=> b!1511804 m!1394543))

(declare-fun m!1394551 () Bool)

(assert (=> b!1511804 m!1394551))

(assert (=> b!1511799 m!1394541))

(assert (=> b!1511799 m!1394543))

(assert (=> b!1511799 m!1394543))

(declare-fun m!1394553 () Bool)

(assert (=> b!1511799 m!1394553))

(assert (=> b!1511799 m!1394553))

(assert (=> b!1511799 m!1394543))

(declare-fun m!1394555 () Bool)

(assert (=> b!1511799 m!1394555))

(assert (=> b!1511807 m!1394521))

(assert (=> b!1511807 m!1394521))

(declare-fun m!1394557 () Bool)

(assert (=> b!1511807 m!1394557))

(assert (=> b!1511807 m!1394557))

(assert (=> b!1511807 m!1394521))

(declare-fun m!1394559 () Bool)

(assert (=> b!1511807 m!1394559))

(assert (=> b!1511800 m!1394521))

(assert (=> b!1511800 m!1394521))

(declare-fun m!1394561 () Bool)

(assert (=> b!1511800 m!1394561))

(push 1)

(assert (not b!1511807))

(assert (not b!1511800))

(assert (not b!1511803))

