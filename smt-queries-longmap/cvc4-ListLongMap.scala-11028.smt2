; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129004 () Bool)

(assert start!129004)

(declare-fun b!1512743 () Bool)

(declare-fun e!844330 () Bool)

(assert (=> b!1512743 (= e!844330 (not true))))

(declare-fun e!844326 () Bool)

(assert (=> b!1512743 e!844326))

(declare-fun res!1032658 () Bool)

(assert (=> b!1512743 (=> (not res!1032658) (not e!844326))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!100860 0))(
  ( (array!100861 (arr!48667 (Array (_ BitVec 32) (_ BitVec 64))) (size!49217 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100860)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100860 (_ BitVec 32)) Bool)

(assert (=> b!1512743 (= res!1032658 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50544 0))(
  ( (Unit!50545) )
))
(declare-fun lt!655746 () Unit!50544)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100860 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50544)

(assert (=> b!1512743 (= lt!655746 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512744 () Bool)

(declare-fun res!1032649 () Bool)

(assert (=> b!1512744 (=> (not res!1032649) (not e!844330))))

(declare-fun i!961 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12838 0))(
  ( (MissingZero!12838 (index!53747 (_ BitVec 32))) (Found!12838 (index!53748 (_ BitVec 32))) (Intermediate!12838 (undefined!13650 Bool) (index!53749 (_ BitVec 32)) (x!135468 (_ BitVec 32))) (Undefined!12838) (MissingVacant!12838 (index!53750 (_ BitVec 32))) )
))
(declare-fun lt!655747 () SeekEntryResult!12838)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100860 (_ BitVec 32)) SeekEntryResult!12838)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512744 (= res!1032649 (= lt!655747 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48667 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48667 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100861 (store (arr!48667 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49217 a!2804)) mask!2512)))))

(declare-fun b!1512745 () Bool)

(declare-fun res!1032655 () Bool)

(declare-fun e!844327 () Bool)

(assert (=> b!1512745 (=> (not res!1032655) (not e!844327))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512745 (= res!1032655 (validKeyInArray!0 (select (arr!48667 a!2804) j!70)))))

(declare-fun res!1032653 () Bool)

(assert (=> start!129004 (=> (not res!1032653) (not e!844327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129004 (= res!1032653 (validMask!0 mask!2512))))

(assert (=> start!129004 e!844327))

(assert (=> start!129004 true))

(declare-fun array_inv!37695 (array!100860) Bool)

(assert (=> start!129004 (array_inv!37695 a!2804)))

(declare-fun b!1512746 () Bool)

(assert (=> b!1512746 (= e!844327 e!844330)))

(declare-fun res!1032647 () Bool)

(assert (=> b!1512746 (=> (not res!1032647) (not e!844330))))

(declare-fun lt!655745 () SeekEntryResult!12838)

(assert (=> b!1512746 (= res!1032647 (= lt!655747 lt!655745))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1512746 (= lt!655745 (Intermediate!12838 false resIndex!21 resX!21))))

(assert (=> b!1512746 (= lt!655747 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48667 a!2804) j!70) mask!2512) (select (arr!48667 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512747 () Bool)

(declare-fun res!1032652 () Bool)

(assert (=> b!1512747 (=> (not res!1032652) (not e!844327))))

(assert (=> b!1512747 (= res!1032652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512748 () Bool)

(declare-fun res!1032654 () Bool)

(assert (=> b!1512748 (=> (not res!1032654) (not e!844327))))

(assert (=> b!1512748 (= res!1032654 (validKeyInArray!0 (select (arr!48667 a!2804) i!961)))))

(declare-fun b!1512749 () Bool)

(declare-fun res!1032650 () Bool)

(assert (=> b!1512749 (=> (not res!1032650) (not e!844330))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1512749 (= res!1032650 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48667 a!2804) j!70) a!2804 mask!2512) lt!655745))))

(declare-fun b!1512750 () Bool)

(declare-fun e!844328 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100860 (_ BitVec 32)) SeekEntryResult!12838)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100860 (_ BitVec 32)) SeekEntryResult!12838)

(assert (=> b!1512750 (= e!844328 (= (seekEntryOrOpen!0 (select (arr!48667 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48667 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512751 () Bool)

(declare-fun res!1032646 () Bool)

(assert (=> b!1512751 (=> (not res!1032646) (not e!844327))))

(assert (=> b!1512751 (= res!1032646 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49217 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49217 a!2804))))))

(declare-fun b!1512752 () Bool)

(assert (=> b!1512752 (= e!844326 e!844328)))

(declare-fun res!1032657 () Bool)

(assert (=> b!1512752 (=> res!1032657 e!844328)))

(assert (=> b!1512752 (= res!1032657 (or (not (= (select (arr!48667 a!2804) j!70) (select (store (arr!48667 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48667 a!2804) index!487) (select (arr!48667 a!2804) j!70)) (not (= (select (arr!48667 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1512753 () Bool)

(declare-fun res!1032656 () Bool)

(assert (=> b!1512753 (=> (not res!1032656) (not e!844327))))

(declare-datatypes ((List!35150 0))(
  ( (Nil!35147) (Cons!35146 (h!36558 (_ BitVec 64)) (t!49844 List!35150)) )
))
(declare-fun arrayNoDuplicates!0 (array!100860 (_ BitVec 32) List!35150) Bool)

(assert (=> b!1512753 (= res!1032656 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35147))))

(declare-fun b!1512754 () Bool)

(declare-fun res!1032648 () Bool)

(assert (=> b!1512754 (=> (not res!1032648) (not e!844327))))

(assert (=> b!1512754 (= res!1032648 (and (= (size!49217 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49217 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49217 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512755 () Bool)

(declare-fun res!1032651 () Bool)

(assert (=> b!1512755 (=> (not res!1032651) (not e!844326))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100860 (_ BitVec 32)) SeekEntryResult!12838)

(assert (=> b!1512755 (= res!1032651 (= (seekEntry!0 (select (arr!48667 a!2804) j!70) a!2804 mask!2512) (Found!12838 j!70)))))

(assert (= (and start!129004 res!1032653) b!1512754))

(assert (= (and b!1512754 res!1032648) b!1512748))

(assert (= (and b!1512748 res!1032654) b!1512745))

(assert (= (and b!1512745 res!1032655) b!1512747))

(assert (= (and b!1512747 res!1032652) b!1512753))

(assert (= (and b!1512753 res!1032656) b!1512751))

(assert (= (and b!1512751 res!1032646) b!1512746))

(assert (= (and b!1512746 res!1032647) b!1512749))

(assert (= (and b!1512749 res!1032650) b!1512744))

(assert (= (and b!1512744 res!1032649) b!1512743))

(assert (= (and b!1512743 res!1032658) b!1512755))

(assert (= (and b!1512755 res!1032651) b!1512752))

(assert (= (and b!1512752 (not res!1032657)) b!1512750))

(declare-fun m!1395535 () Bool)

(assert (=> b!1512745 m!1395535))

(assert (=> b!1512745 m!1395535))

(declare-fun m!1395537 () Bool)

(assert (=> b!1512745 m!1395537))

(declare-fun m!1395539 () Bool)

(assert (=> b!1512744 m!1395539))

(declare-fun m!1395541 () Bool)

(assert (=> b!1512744 m!1395541))

(assert (=> b!1512744 m!1395541))

(declare-fun m!1395543 () Bool)

(assert (=> b!1512744 m!1395543))

(assert (=> b!1512744 m!1395543))

(assert (=> b!1512744 m!1395541))

(declare-fun m!1395545 () Bool)

(assert (=> b!1512744 m!1395545))

(assert (=> b!1512752 m!1395535))

(assert (=> b!1512752 m!1395539))

(assert (=> b!1512752 m!1395541))

(declare-fun m!1395547 () Bool)

(assert (=> b!1512752 m!1395547))

(declare-fun m!1395549 () Bool)

(assert (=> b!1512743 m!1395549))

(declare-fun m!1395551 () Bool)

(assert (=> b!1512743 m!1395551))

(assert (=> b!1512755 m!1395535))

(assert (=> b!1512755 m!1395535))

(declare-fun m!1395553 () Bool)

(assert (=> b!1512755 m!1395553))

(declare-fun m!1395555 () Bool)

(assert (=> b!1512748 m!1395555))

(assert (=> b!1512748 m!1395555))

(declare-fun m!1395557 () Bool)

(assert (=> b!1512748 m!1395557))

(declare-fun m!1395559 () Bool)

(assert (=> start!129004 m!1395559))

(declare-fun m!1395561 () Bool)

(assert (=> start!129004 m!1395561))

(declare-fun m!1395563 () Bool)

(assert (=> b!1512753 m!1395563))

(declare-fun m!1395565 () Bool)

(assert (=> b!1512747 m!1395565))

(assert (=> b!1512750 m!1395535))

(assert (=> b!1512750 m!1395535))

(declare-fun m!1395567 () Bool)

(assert (=> b!1512750 m!1395567))

(assert (=> b!1512750 m!1395535))

(declare-fun m!1395569 () Bool)

(assert (=> b!1512750 m!1395569))

(assert (=> b!1512749 m!1395535))

(assert (=> b!1512749 m!1395535))

(declare-fun m!1395571 () Bool)

(assert (=> b!1512749 m!1395571))

(assert (=> b!1512746 m!1395535))

(assert (=> b!1512746 m!1395535))

(declare-fun m!1395573 () Bool)

(assert (=> b!1512746 m!1395573))

(assert (=> b!1512746 m!1395573))

(assert (=> b!1512746 m!1395535))

(declare-fun m!1395575 () Bool)

(assert (=> b!1512746 m!1395575))

(push 1)

