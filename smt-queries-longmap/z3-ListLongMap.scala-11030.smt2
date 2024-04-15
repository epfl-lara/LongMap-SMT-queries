; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128960 () Bool)

(assert start!128960)

(declare-fun b!1512561 () Bool)

(declare-fun res!1032683 () Bool)

(declare-fun e!844191 () Bool)

(assert (=> b!1512561 (=> (not res!1032683) (not e!844191))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-datatypes ((array!100816 0))(
  ( (array!100817 (arr!48646 (Array (_ BitVec 32) (_ BitVec 64))) (size!49198 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100816)

(assert (=> b!1512561 (= res!1032683 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49198 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49198 a!2804))))))

(declare-fun b!1512562 () Bool)

(declare-fun res!1032676 () Bool)

(assert (=> b!1512562 (=> (not res!1032676) (not e!844191))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(assert (=> b!1512562 (= res!1032676 (and (= (size!49198 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49198 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49198 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512563 () Bool)

(declare-fun res!1032675 () Bool)

(assert (=> b!1512563 (=> (not res!1032675) (not e!844191))))

(declare-datatypes ((List!35207 0))(
  ( (Nil!35204) (Cons!35203 (h!36616 (_ BitVec 64)) (t!49893 List!35207)) )
))
(declare-fun arrayNoDuplicates!0 (array!100816 (_ BitVec 32) List!35207) Bool)

(assert (=> b!1512563 (= res!1032675 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35204))))

(declare-fun b!1512564 () Bool)

(declare-fun res!1032680 () Bool)

(assert (=> b!1512564 (=> (not res!1032680) (not e!844191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100816 (_ BitVec 32)) Bool)

(assert (=> b!1512564 (= res!1032680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512565 () Bool)

(declare-fun e!844188 () Bool)

(declare-datatypes ((SeekEntryResult!12840 0))(
  ( (MissingZero!12840 (index!53755 (_ BitVec 32))) (Found!12840 (index!53756 (_ BitVec 32))) (Intermediate!12840 (undefined!13652 Bool) (index!53757 (_ BitVec 32)) (x!135480 (_ BitVec 32))) (Undefined!12840) (MissingVacant!12840 (index!53758 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100816 (_ BitVec 32)) SeekEntryResult!12840)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100816 (_ BitVec 32)) SeekEntryResult!12840)

(assert (=> b!1512565 (= e!844188 (= (seekEntryOrOpen!0 (select (arr!48646 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48646 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512567 () Bool)

(declare-fun e!844187 () Bool)

(declare-fun e!844190 () Bool)

(assert (=> b!1512567 (= e!844187 (not e!844190))))

(declare-fun res!1032682 () Bool)

(assert (=> b!1512567 (=> res!1032682 e!844190)))

(declare-fun lt!655497 () (_ BitVec 64))

(assert (=> b!1512567 (= res!1032682 (or (not (= (select (arr!48646 a!2804) j!70) lt!655497)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48646 a!2804) index!487) (select (arr!48646 a!2804) j!70)) (not (= (select (arr!48646 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2512 #b00000000000000000000000000000000) (bvsge index!487 (bvadd #b00000000000000000000000000000001 mask!2512)) (not (= (select (store (arr!48646 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!844185 () Bool)

(assert (=> b!1512567 e!844185))

(declare-fun res!1032674 () Bool)

(assert (=> b!1512567 (=> (not res!1032674) (not e!844185))))

(assert (=> b!1512567 (= res!1032674 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50387 0))(
  ( (Unit!50388) )
))
(declare-fun lt!655499 () Unit!50387)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100816 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50387)

(assert (=> b!1512567 (= lt!655499 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512568 () Bool)

(declare-fun res!1032671 () Bool)

(assert (=> b!1512568 (=> (not res!1032671) (not e!844185))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100816 (_ BitVec 32)) SeekEntryResult!12840)

(assert (=> b!1512568 (= res!1032671 (= (seekEntry!0 (select (arr!48646 a!2804) j!70) a!2804 mask!2512) (Found!12840 j!70)))))

(declare-fun b!1512569 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512569 (= e!844190 (validKeyInArray!0 lt!655497))))

(declare-fun b!1512570 () Bool)

(declare-fun res!1032679 () Bool)

(declare-fun e!844189 () Bool)

(assert (=> b!1512570 (=> (not res!1032679) (not e!844189))))

(declare-fun lt!655498 () SeekEntryResult!12840)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100816 (_ BitVec 32)) SeekEntryResult!12840)

(assert (=> b!1512570 (= res!1032679 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48646 a!2804) j!70) a!2804 mask!2512) lt!655498))))

(declare-fun b!1512571 () Bool)

(assert (=> b!1512571 (= e!844189 e!844187)))

(declare-fun res!1032677 () Bool)

(assert (=> b!1512571 (=> (not res!1032677) (not e!844187))))

(declare-fun lt!655500 () SeekEntryResult!12840)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512571 (= res!1032677 (= lt!655500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655497 mask!2512) lt!655497 (array!100817 (store (arr!48646 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49198 a!2804)) mask!2512)))))

(assert (=> b!1512571 (= lt!655497 (select (store (arr!48646 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(declare-fun b!1512572 () Bool)

(declare-fun res!1032678 () Bool)

(assert (=> b!1512572 (=> (not res!1032678) (not e!844191))))

(assert (=> b!1512572 (= res!1032678 (validKeyInArray!0 (select (arr!48646 a!2804) i!961)))))

(declare-fun res!1032681 () Bool)

(assert (=> start!128960 (=> (not res!1032681) (not e!844191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128960 (= res!1032681 (validMask!0 mask!2512))))

(assert (=> start!128960 e!844191))

(assert (=> start!128960 true))

(declare-fun array_inv!37879 (array!100816) Bool)

(assert (=> start!128960 (array_inv!37879 a!2804)))

(declare-fun b!1512566 () Bool)

(assert (=> b!1512566 (= e!844191 e!844189)))

(declare-fun res!1032672 () Bool)

(assert (=> b!1512566 (=> (not res!1032672) (not e!844189))))

(assert (=> b!1512566 (= res!1032672 (= lt!655500 lt!655498))))

(assert (=> b!1512566 (= lt!655498 (Intermediate!12840 false resIndex!21 resX!21))))

(assert (=> b!1512566 (= lt!655500 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48646 a!2804) j!70) mask!2512) (select (arr!48646 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512573 () Bool)

(declare-fun res!1032670 () Bool)

(assert (=> b!1512573 (=> (not res!1032670) (not e!844191))))

(assert (=> b!1512573 (= res!1032670 (validKeyInArray!0 (select (arr!48646 a!2804) j!70)))))

(declare-fun b!1512574 () Bool)

(assert (=> b!1512574 (= e!844185 e!844188)))

(declare-fun res!1032673 () Bool)

(assert (=> b!1512574 (=> res!1032673 e!844188)))

(assert (=> b!1512574 (= res!1032673 (or (not (= (select (arr!48646 a!2804) j!70) lt!655497)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48646 a!2804) index!487) (select (arr!48646 a!2804) j!70)) (not (= (select (arr!48646 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!128960 res!1032681) b!1512562))

(assert (= (and b!1512562 res!1032676) b!1512572))

(assert (= (and b!1512572 res!1032678) b!1512573))

(assert (= (and b!1512573 res!1032670) b!1512564))

(assert (= (and b!1512564 res!1032680) b!1512563))

(assert (= (and b!1512563 res!1032675) b!1512561))

(assert (= (and b!1512561 res!1032683) b!1512566))

(assert (= (and b!1512566 res!1032672) b!1512570))

(assert (= (and b!1512570 res!1032679) b!1512571))

(assert (= (and b!1512571 res!1032677) b!1512567))

(assert (= (and b!1512567 res!1032674) b!1512568))

(assert (= (and b!1512568 res!1032671) b!1512574))

(assert (= (and b!1512574 (not res!1032673)) b!1512565))

(assert (= (and b!1512567 (not res!1032682)) b!1512569))

(declare-fun m!1394801 () Bool)

(assert (=> b!1512572 m!1394801))

(assert (=> b!1512572 m!1394801))

(declare-fun m!1394803 () Bool)

(assert (=> b!1512572 m!1394803))

(declare-fun m!1394805 () Bool)

(assert (=> b!1512566 m!1394805))

(assert (=> b!1512566 m!1394805))

(declare-fun m!1394807 () Bool)

(assert (=> b!1512566 m!1394807))

(assert (=> b!1512566 m!1394807))

(assert (=> b!1512566 m!1394805))

(declare-fun m!1394809 () Bool)

(assert (=> b!1512566 m!1394809))

(declare-fun m!1394811 () Bool)

(assert (=> start!128960 m!1394811))

(declare-fun m!1394813 () Bool)

(assert (=> start!128960 m!1394813))

(assert (=> b!1512567 m!1394805))

(declare-fun m!1394815 () Bool)

(assert (=> b!1512567 m!1394815))

(declare-fun m!1394817 () Bool)

(assert (=> b!1512567 m!1394817))

(declare-fun m!1394819 () Bool)

(assert (=> b!1512567 m!1394819))

(declare-fun m!1394821 () Bool)

(assert (=> b!1512567 m!1394821))

(declare-fun m!1394823 () Bool)

(assert (=> b!1512567 m!1394823))

(assert (=> b!1512573 m!1394805))

(assert (=> b!1512573 m!1394805))

(declare-fun m!1394825 () Bool)

(assert (=> b!1512573 m!1394825))

(declare-fun m!1394827 () Bool)

(assert (=> b!1512569 m!1394827))

(declare-fun m!1394829 () Bool)

(assert (=> b!1512571 m!1394829))

(assert (=> b!1512571 m!1394817))

(assert (=> b!1512571 m!1394829))

(declare-fun m!1394831 () Bool)

(assert (=> b!1512571 m!1394831))

(declare-fun m!1394833 () Bool)

(assert (=> b!1512571 m!1394833))

(assert (=> b!1512574 m!1394805))

(assert (=> b!1512574 m!1394819))

(declare-fun m!1394835 () Bool)

(assert (=> b!1512563 m!1394835))

(assert (=> b!1512565 m!1394805))

(assert (=> b!1512565 m!1394805))

(declare-fun m!1394837 () Bool)

(assert (=> b!1512565 m!1394837))

(assert (=> b!1512565 m!1394805))

(declare-fun m!1394839 () Bool)

(assert (=> b!1512565 m!1394839))

(declare-fun m!1394841 () Bool)

(assert (=> b!1512564 m!1394841))

(assert (=> b!1512568 m!1394805))

(assert (=> b!1512568 m!1394805))

(declare-fun m!1394843 () Bool)

(assert (=> b!1512568 m!1394843))

(assert (=> b!1512570 m!1394805))

(assert (=> b!1512570 m!1394805))

(declare-fun m!1394845 () Bool)

(assert (=> b!1512570 m!1394845))

(check-sat (not b!1512563) (not b!1512568) (not start!128960) (not b!1512571) (not b!1512566) (not b!1512569) (not b!1512570) (not b!1512572) (not b!1512573) (not b!1512567) (not b!1512565) (not b!1512564))
(check-sat)
