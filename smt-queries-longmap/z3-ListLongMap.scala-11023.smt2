; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128918 () Bool)

(assert start!128918)

(declare-fun b!1511740 () Bool)

(declare-fun res!1031852 () Bool)

(declare-fun e!843861 () Bool)

(assert (=> b!1511740 (=> (not res!1031852) (not e!843861))))

(declare-datatypes ((SeekEntryResult!12819 0))(
  ( (MissingZero!12819 (index!53671 (_ BitVec 32))) (Found!12819 (index!53672 (_ BitVec 32))) (Intermediate!12819 (undefined!13631 Bool) (index!53673 (_ BitVec 32)) (x!135403 (_ BitVec 32))) (Undefined!12819) (MissingVacant!12819 (index!53674 (_ BitVec 32))) )
))
(declare-fun lt!655299 () SeekEntryResult!12819)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!100774 0))(
  ( (array!100775 (arr!48625 (Array (_ BitVec 32) (_ BitVec 64))) (size!49177 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100774)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100774 (_ BitVec 32)) SeekEntryResult!12819)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1511740 (= res!1031852 (= lt!655299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48625 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48625 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100775 (store (arr!48625 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49177 a!2804)) mask!2512)))))

(declare-fun b!1511741 () Bool)

(declare-fun res!1031858 () Bool)

(declare-fun e!843858 () Bool)

(assert (=> b!1511741 (=> (not res!1031858) (not e!843858))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100774 (_ BitVec 32)) SeekEntryResult!12819)

(assert (=> b!1511741 (= res!1031858 (= (seekEntry!0 (select (arr!48625 a!2804) j!70) a!2804 mask!2512) (Found!12819 j!70)))))

(declare-fun b!1511742 () Bool)

(declare-fun res!1031851 () Bool)

(declare-fun e!843860 () Bool)

(assert (=> b!1511742 (=> (not res!1031851) (not e!843860))))

(assert (=> b!1511742 (= res!1031851 (and (= (size!49177 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49177 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49177 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1511743 () Bool)

(declare-fun res!1031854 () Bool)

(assert (=> b!1511743 (=> (not res!1031854) (not e!843861))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!655298 () SeekEntryResult!12819)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1511743 (= res!1031854 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48625 a!2804) j!70) a!2804 mask!2512) lt!655298))))

(declare-fun b!1511744 () Bool)

(declare-fun res!1031861 () Bool)

(assert (=> b!1511744 (=> (not res!1031861) (not e!843860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100774 (_ BitVec 32)) Bool)

(assert (=> b!1511744 (= res!1031861 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1511745 () Bool)

(assert (=> b!1511745 (= e!843860 e!843861)))

(declare-fun res!1031849 () Bool)

(assert (=> b!1511745 (=> (not res!1031849) (not e!843861))))

(assert (=> b!1511745 (= res!1031849 (= lt!655299 lt!655298))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1511745 (= lt!655298 (Intermediate!12819 false resIndex!21 resX!21))))

(assert (=> b!1511745 (= lt!655299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48625 a!2804) j!70) mask!2512) (select (arr!48625 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1511746 () Bool)

(declare-fun e!843857 () Bool)

(assert (=> b!1511746 (= e!843858 e!843857)))

(declare-fun res!1031855 () Bool)

(assert (=> b!1511746 (=> res!1031855 e!843857)))

(assert (=> b!1511746 (= res!1031855 (or (not (= (select (arr!48625 a!2804) j!70) (select (store (arr!48625 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48625 a!2804) index!487) (select (arr!48625 a!2804) j!70)) (not (= (select (arr!48625 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1031853 () Bool)

(assert (=> start!128918 (=> (not res!1031853) (not e!843860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128918 (= res!1031853 (validMask!0 mask!2512))))

(assert (=> start!128918 e!843860))

(assert (=> start!128918 true))

(declare-fun array_inv!37858 (array!100774) Bool)

(assert (=> start!128918 (array_inv!37858 a!2804)))

(declare-fun b!1511747 () Bool)

(declare-fun res!1031859 () Bool)

(assert (=> b!1511747 (=> (not res!1031859) (not e!843860))))

(declare-datatypes ((List!35186 0))(
  ( (Nil!35183) (Cons!35182 (h!36595 (_ BitVec 64)) (t!49872 List!35186)) )
))
(declare-fun arrayNoDuplicates!0 (array!100774 (_ BitVec 32) List!35186) Bool)

(assert (=> b!1511747 (= res!1031859 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35183))))

(declare-fun b!1511748 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100774 (_ BitVec 32)) SeekEntryResult!12819)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100774 (_ BitVec 32)) SeekEntryResult!12819)

(assert (=> b!1511748 (= e!843857 (= (seekEntryOrOpen!0 (select (arr!48625 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48625 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1511749 () Bool)

(declare-fun res!1031850 () Bool)

(assert (=> b!1511749 (=> (not res!1031850) (not e!843860))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1511749 (= res!1031850 (validKeyInArray!0 (select (arr!48625 a!2804) i!961)))))

(declare-fun b!1511750 () Bool)

(assert (=> b!1511750 (= e!843861 (not true))))

(assert (=> b!1511750 e!843858))

(declare-fun res!1031856 () Bool)

(assert (=> b!1511750 (=> (not res!1031856) (not e!843858))))

(assert (=> b!1511750 (= res!1031856 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50345 0))(
  ( (Unit!50346) )
))
(declare-fun lt!655297 () Unit!50345)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100774 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50345)

(assert (=> b!1511750 (= lt!655297 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1511751 () Bool)

(declare-fun res!1031860 () Bool)

(assert (=> b!1511751 (=> (not res!1031860) (not e!843860))))

(assert (=> b!1511751 (= res!1031860 (validKeyInArray!0 (select (arr!48625 a!2804) j!70)))))

(declare-fun b!1511752 () Bool)

(declare-fun res!1031857 () Bool)

(assert (=> b!1511752 (=> (not res!1031857) (not e!843860))))

(assert (=> b!1511752 (= res!1031857 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49177 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49177 a!2804))))))

(assert (= (and start!128918 res!1031853) b!1511742))

(assert (= (and b!1511742 res!1031851) b!1511749))

(assert (= (and b!1511749 res!1031850) b!1511751))

(assert (= (and b!1511751 res!1031860) b!1511744))

(assert (= (and b!1511744 res!1031861) b!1511747))

(assert (= (and b!1511747 res!1031859) b!1511752))

(assert (= (and b!1511752 res!1031857) b!1511745))

(assert (= (and b!1511745 res!1031849) b!1511743))

(assert (= (and b!1511743 res!1031854) b!1511740))

(assert (= (and b!1511740 res!1031852) b!1511750))

(assert (= (and b!1511750 res!1031856) b!1511741))

(assert (= (and b!1511741 res!1031858) b!1511746))

(assert (= (and b!1511746 (not res!1031855)) b!1511748))

(declare-fun m!1393913 () Bool)

(assert (=> b!1511750 m!1393913))

(declare-fun m!1393915 () Bool)

(assert (=> b!1511750 m!1393915))

(declare-fun m!1393917 () Bool)

(assert (=> b!1511749 m!1393917))

(assert (=> b!1511749 m!1393917))

(declare-fun m!1393919 () Bool)

(assert (=> b!1511749 m!1393919))

(declare-fun m!1393921 () Bool)

(assert (=> b!1511746 m!1393921))

(declare-fun m!1393923 () Bool)

(assert (=> b!1511746 m!1393923))

(declare-fun m!1393925 () Bool)

(assert (=> b!1511746 m!1393925))

(declare-fun m!1393927 () Bool)

(assert (=> b!1511746 m!1393927))

(declare-fun m!1393929 () Bool)

(assert (=> b!1511747 m!1393929))

(assert (=> b!1511740 m!1393923))

(assert (=> b!1511740 m!1393925))

(assert (=> b!1511740 m!1393925))

(declare-fun m!1393931 () Bool)

(assert (=> b!1511740 m!1393931))

(assert (=> b!1511740 m!1393931))

(assert (=> b!1511740 m!1393925))

(declare-fun m!1393933 () Bool)

(assert (=> b!1511740 m!1393933))

(assert (=> b!1511745 m!1393921))

(assert (=> b!1511745 m!1393921))

(declare-fun m!1393935 () Bool)

(assert (=> b!1511745 m!1393935))

(assert (=> b!1511745 m!1393935))

(assert (=> b!1511745 m!1393921))

(declare-fun m!1393937 () Bool)

(assert (=> b!1511745 m!1393937))

(declare-fun m!1393939 () Bool)

(assert (=> start!128918 m!1393939))

(declare-fun m!1393941 () Bool)

(assert (=> start!128918 m!1393941))

(assert (=> b!1511748 m!1393921))

(assert (=> b!1511748 m!1393921))

(declare-fun m!1393943 () Bool)

(assert (=> b!1511748 m!1393943))

(assert (=> b!1511748 m!1393921))

(declare-fun m!1393945 () Bool)

(assert (=> b!1511748 m!1393945))

(declare-fun m!1393947 () Bool)

(assert (=> b!1511744 m!1393947))

(assert (=> b!1511743 m!1393921))

(assert (=> b!1511743 m!1393921))

(declare-fun m!1393949 () Bool)

(assert (=> b!1511743 m!1393949))

(assert (=> b!1511751 m!1393921))

(assert (=> b!1511751 m!1393921))

(declare-fun m!1393951 () Bool)

(assert (=> b!1511751 m!1393951))

(assert (=> b!1511741 m!1393921))

(assert (=> b!1511741 m!1393921))

(declare-fun m!1393953 () Bool)

(assert (=> b!1511741 m!1393953))

(check-sat (not b!1511748) (not b!1511751) (not b!1511747) (not b!1511750) (not b!1511745) (not b!1511740) (not start!128918) (not b!1511741) (not b!1511749) (not b!1511744) (not b!1511743))
(check-sat)
