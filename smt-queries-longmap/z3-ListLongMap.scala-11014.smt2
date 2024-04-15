; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128864 () Bool)

(assert start!128864)

(declare-fun res!1030875 () Bool)

(declare-fun e!843486 () Bool)

(assert (=> start!128864 (=> (not res!1030875) (not e!843486))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128864 (= res!1030875 (validMask!0 mask!2512))))

(assert (=> start!128864 e!843486))

(assert (=> start!128864 true))

(declare-datatypes ((array!100720 0))(
  ( (array!100721 (arr!48598 (Array (_ BitVec 32) (_ BitVec 64))) (size!49150 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100720)

(declare-fun array_inv!37831 (array!100720) Bool)

(assert (=> start!128864 (array_inv!37831 a!2804)))

(declare-fun b!1510764 () Bool)

(declare-fun res!1030877 () Bool)

(assert (=> b!1510764 (=> (not res!1030877) (not e!843486))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1510764 (= res!1030877 (and (= (size!49150 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49150 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49150 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1510765 () Bool)

(declare-fun e!843488 () Bool)

(assert (=> b!1510765 (= e!843486 e!843488)))

(declare-fun res!1030879 () Bool)

(assert (=> b!1510765 (=> (not res!1030879) (not e!843488))))

(declare-datatypes ((SeekEntryResult!12792 0))(
  ( (MissingZero!12792 (index!53563 (_ BitVec 32))) (Found!12792 (index!53564 (_ BitVec 32))) (Intermediate!12792 (undefined!13604 Bool) (index!53565 (_ BitVec 32)) (x!135304 (_ BitVec 32))) (Undefined!12792) (MissingVacant!12792 (index!53566 (_ BitVec 32))) )
))
(declare-fun lt!655055 () SeekEntryResult!12792)

(declare-fun lt!655054 () SeekEntryResult!12792)

(assert (=> b!1510765 (= res!1030879 (= lt!655055 lt!655054))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1510765 (= lt!655054 (Intermediate!12792 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100720 (_ BitVec 32)) SeekEntryResult!12792)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1510765 (= lt!655055 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48598 a!2804) j!70) mask!2512) (select (arr!48598 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1510766 () Bool)

(declare-fun res!1030882 () Bool)

(assert (=> b!1510766 (=> (not res!1030882) (not e!843486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100720 (_ BitVec 32)) Bool)

(assert (=> b!1510766 (= res!1030882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1510767 () Bool)

(declare-fun res!1030881 () Bool)

(assert (=> b!1510767 (=> (not res!1030881) (not e!843488))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1510767 (= res!1030881 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48598 a!2804) j!70) a!2804 mask!2512) lt!655054))))

(declare-fun b!1510768 () Bool)

(declare-fun res!1030883 () Bool)

(assert (=> b!1510768 (=> (not res!1030883) (not e!843486))))

(assert (=> b!1510768 (= res!1030883 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49150 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49150 a!2804))))))

(declare-fun b!1510769 () Bool)

(declare-fun res!1030876 () Bool)

(assert (=> b!1510769 (=> (not res!1030876) (not e!843486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1510769 (= res!1030876 (validKeyInArray!0 (select (arr!48598 a!2804) j!70)))))

(declare-fun b!1510770 () Bool)

(declare-fun res!1030873 () Bool)

(assert (=> b!1510770 (=> (not res!1030873) (not e!843488))))

(assert (=> b!1510770 (= res!1030873 (= lt!655055 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48598 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48598 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100721 (store (arr!48598 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49150 a!2804)) mask!2512)))))

(declare-fun b!1510771 () Bool)

(declare-fun res!1030878 () Bool)

(assert (=> b!1510771 (=> (not res!1030878) (not e!843486))))

(declare-datatypes ((List!35159 0))(
  ( (Nil!35156) (Cons!35155 (h!36568 (_ BitVec 64)) (t!49845 List!35159)) )
))
(declare-fun arrayNoDuplicates!0 (array!100720 (_ BitVec 32) List!35159) Bool)

(assert (=> b!1510771 (= res!1030878 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35156))))

(declare-fun b!1510772 () Bool)

(assert (=> b!1510772 (= e!843488 (not (or (not (= (select (arr!48598 a!2804) j!70) (select (store (arr!48598 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48598 a!2804) index!487) (select (arr!48598 a!2804) j!70)) (not (= (select (arr!48598 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2512 #b00000000000000000000000000000000) (bvslt index!487 (bvadd #b00000000000000000000000000000001 mask!2512)))))))

(declare-fun e!843489 () Bool)

(assert (=> b!1510772 e!843489))

(declare-fun res!1030880 () Bool)

(assert (=> b!1510772 (=> (not res!1030880) (not e!843489))))

(assert (=> b!1510772 (= res!1030880 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50291 0))(
  ( (Unit!50292) )
))
(declare-fun lt!655056 () Unit!50291)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100720 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50291)

(assert (=> b!1510772 (= lt!655056 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1510773 () Bool)

(declare-fun res!1030874 () Bool)

(assert (=> b!1510773 (=> (not res!1030874) (not e!843486))))

(assert (=> b!1510773 (= res!1030874 (validKeyInArray!0 (select (arr!48598 a!2804) i!961)))))

(declare-fun b!1510774 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100720 (_ BitVec 32)) SeekEntryResult!12792)

(assert (=> b!1510774 (= e!843489 (= (seekEntry!0 (select (arr!48598 a!2804) j!70) a!2804 mask!2512) (Found!12792 j!70)))))

(assert (= (and start!128864 res!1030875) b!1510764))

(assert (= (and b!1510764 res!1030877) b!1510773))

(assert (= (and b!1510773 res!1030874) b!1510769))

(assert (= (and b!1510769 res!1030876) b!1510766))

(assert (= (and b!1510766 res!1030882) b!1510771))

(assert (= (and b!1510771 res!1030878) b!1510768))

(assert (= (and b!1510768 res!1030883) b!1510765))

(assert (= (and b!1510765 res!1030879) b!1510767))

(assert (= (and b!1510767 res!1030881) b!1510770))

(assert (= (and b!1510770 res!1030873) b!1510772))

(assert (= (and b!1510772 res!1030880) b!1510774))

(declare-fun m!1392857 () Bool)

(assert (=> b!1510771 m!1392857))

(declare-fun m!1392859 () Bool)

(assert (=> start!128864 m!1392859))

(declare-fun m!1392861 () Bool)

(assert (=> start!128864 m!1392861))

(declare-fun m!1392863 () Bool)

(assert (=> b!1510766 m!1392863))

(declare-fun m!1392865 () Bool)

(assert (=> b!1510773 m!1392865))

(assert (=> b!1510773 m!1392865))

(declare-fun m!1392867 () Bool)

(assert (=> b!1510773 m!1392867))

(declare-fun m!1392869 () Bool)

(assert (=> b!1510769 m!1392869))

(assert (=> b!1510769 m!1392869))

(declare-fun m!1392871 () Bool)

(assert (=> b!1510769 m!1392871))

(assert (=> b!1510767 m!1392869))

(assert (=> b!1510767 m!1392869))

(declare-fun m!1392873 () Bool)

(assert (=> b!1510767 m!1392873))

(assert (=> b!1510765 m!1392869))

(assert (=> b!1510765 m!1392869))

(declare-fun m!1392875 () Bool)

(assert (=> b!1510765 m!1392875))

(assert (=> b!1510765 m!1392875))

(assert (=> b!1510765 m!1392869))

(declare-fun m!1392877 () Bool)

(assert (=> b!1510765 m!1392877))

(assert (=> b!1510772 m!1392869))

(declare-fun m!1392879 () Bool)

(assert (=> b!1510772 m!1392879))

(declare-fun m!1392881 () Bool)

(assert (=> b!1510772 m!1392881))

(declare-fun m!1392883 () Bool)

(assert (=> b!1510772 m!1392883))

(declare-fun m!1392885 () Bool)

(assert (=> b!1510772 m!1392885))

(declare-fun m!1392887 () Bool)

(assert (=> b!1510772 m!1392887))

(assert (=> b!1510774 m!1392869))

(assert (=> b!1510774 m!1392869))

(declare-fun m!1392889 () Bool)

(assert (=> b!1510774 m!1392889))

(assert (=> b!1510770 m!1392881))

(assert (=> b!1510770 m!1392885))

(assert (=> b!1510770 m!1392885))

(declare-fun m!1392891 () Bool)

(assert (=> b!1510770 m!1392891))

(assert (=> b!1510770 m!1392891))

(assert (=> b!1510770 m!1392885))

(declare-fun m!1392893 () Bool)

(assert (=> b!1510770 m!1392893))

(check-sat (not b!1510765) (not b!1510770) (not b!1510766) (not b!1510767) (not start!128864) (not b!1510769) (not b!1510771) (not b!1510773) (not b!1510772) (not b!1510774))
(check-sat)
