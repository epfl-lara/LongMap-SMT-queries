; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129014 () Bool)

(assert start!129014)

(declare-fun b!1512943 () Bool)

(declare-fun res!1032855 () Bool)

(declare-fun e!844425 () Bool)

(assert (=> b!1512943 (=> (not res!1032855) (not e!844425))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100870 0))(
  ( (array!100871 (arr!48672 (Array (_ BitVec 32) (_ BitVec 64))) (size!49222 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100870)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512943 (= res!1032855 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49222 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49222 a!2804))))))

(declare-fun b!1512944 () Bool)

(declare-fun e!844420 () Bool)

(declare-fun e!844424 () Bool)

(assert (=> b!1512944 (= e!844420 e!844424)))

(declare-fun res!1032853 () Bool)

(assert (=> b!1512944 (=> (not res!1032853) (not e!844424))))

(declare-fun lt!655805 () (_ BitVec 64))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12843 0))(
  ( (MissingZero!12843 (index!53767 (_ BitVec 32))) (Found!12843 (index!53768 (_ BitVec 32))) (Intermediate!12843 (undefined!13655 Bool) (index!53769 (_ BitVec 32)) (x!135489 (_ BitVec 32))) (Undefined!12843) (MissingVacant!12843 (index!53770 (_ BitVec 32))) )
))
(declare-fun lt!655804 () SeekEntryResult!12843)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100870 (_ BitVec 32)) SeekEntryResult!12843)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512944 (= res!1032853 (= lt!655804 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655805 mask!2512) lt!655805 (array!100871 (store (arr!48672 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49222 a!2804)) mask!2512)))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1512944 (= lt!655805 (select (store (arr!48672 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(declare-fun b!1512945 () Bool)

(declare-fun res!1032850 () Bool)

(assert (=> b!1512945 (=> (not res!1032850) (not e!844425))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512945 (= res!1032850 (validKeyInArray!0 (select (arr!48672 a!2804) j!70)))))

(declare-fun b!1512947 () Bool)

(declare-fun e!844421 () Bool)

(assert (=> b!1512947 (= e!844421 (validKeyInArray!0 lt!655805))))

(declare-fun b!1512948 () Bool)

(declare-fun res!1032857 () Bool)

(assert (=> b!1512948 (=> (not res!1032857) (not e!844420))))

(declare-fun lt!655806 () SeekEntryResult!12843)

(assert (=> b!1512948 (= res!1032857 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48672 a!2804) j!70) a!2804 mask!2512) lt!655806))))

(declare-fun b!1512949 () Bool)

(declare-fun e!844423 () Bool)

(declare-fun e!844426 () Bool)

(assert (=> b!1512949 (= e!844423 e!844426)))

(declare-fun res!1032858 () Bool)

(assert (=> b!1512949 (=> res!1032858 e!844426)))

(assert (=> b!1512949 (= res!1032858 (or (not (= (select (arr!48672 a!2804) j!70) lt!655805)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48672 a!2804) index!487) (select (arr!48672 a!2804) j!70)) (not (= (select (arr!48672 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1512950 () Bool)

(declare-fun res!1032849 () Bool)

(assert (=> b!1512950 (=> (not res!1032849) (not e!844425))))

(assert (=> b!1512950 (= res!1032849 (and (= (size!49222 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49222 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49222 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512951 () Bool)

(declare-fun res!1032846 () Bool)

(assert (=> b!1512951 (=> (not res!1032846) (not e!844425))))

(assert (=> b!1512951 (= res!1032846 (validKeyInArray!0 (select (arr!48672 a!2804) i!961)))))

(declare-fun b!1512952 () Bool)

(declare-fun res!1032859 () Bool)

(assert (=> b!1512952 (=> (not res!1032859) (not e!844425))))

(declare-datatypes ((List!35155 0))(
  ( (Nil!35152) (Cons!35151 (h!36563 (_ BitVec 64)) (t!49849 List!35155)) )
))
(declare-fun arrayNoDuplicates!0 (array!100870 (_ BitVec 32) List!35155) Bool)

(assert (=> b!1512952 (= res!1032859 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35152))))

(declare-fun b!1512953 () Bool)

(declare-fun res!1032851 () Bool)

(assert (=> b!1512953 (=> (not res!1032851) (not e!844425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100870 (_ BitVec 32)) Bool)

(assert (=> b!1512953 (= res!1032851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512954 () Bool)

(assert (=> b!1512954 (= e!844425 e!844420)))

(declare-fun res!1032852 () Bool)

(assert (=> b!1512954 (=> (not res!1032852) (not e!844420))))

(assert (=> b!1512954 (= res!1032852 (= lt!655804 lt!655806))))

(assert (=> b!1512954 (= lt!655806 (Intermediate!12843 false resIndex!21 resX!21))))

(assert (=> b!1512954 (= lt!655804 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48672 a!2804) j!70) mask!2512) (select (arr!48672 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512955 () Bool)

(assert (=> b!1512955 (= e!844424 (not e!844421))))

(declare-fun res!1032847 () Bool)

(assert (=> b!1512955 (=> res!1032847 e!844421)))

(assert (=> b!1512955 (= res!1032847 (or (not (= (select (arr!48672 a!2804) j!70) lt!655805)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48672 a!2804) index!487) (select (arr!48672 a!2804) j!70)) (not (= (select (arr!48672 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!2512 #b00000000000000000000000000000000) (bvsge index!487 (bvadd #b00000000000000000000000000000001 mask!2512)) (not (= (select (store (arr!48672 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1512955 e!844423))

(declare-fun res!1032848 () Bool)

(assert (=> b!1512955 (=> (not res!1032848) (not e!844423))))

(assert (=> b!1512955 (= res!1032848 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50554 0))(
  ( (Unit!50555) )
))
(declare-fun lt!655807 () Unit!50554)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100870 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50554)

(assert (=> b!1512955 (= lt!655807 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1512956 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100870 (_ BitVec 32)) SeekEntryResult!12843)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100870 (_ BitVec 32)) SeekEntryResult!12843)

(assert (=> b!1512956 (= e!844426 (= (seekEntryOrOpen!0 (select (arr!48672 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48672 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun res!1032854 () Bool)

(assert (=> start!129014 (=> (not res!1032854) (not e!844425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129014 (= res!1032854 (validMask!0 mask!2512))))

(assert (=> start!129014 e!844425))

(assert (=> start!129014 true))

(declare-fun array_inv!37700 (array!100870) Bool)

(assert (=> start!129014 (array_inv!37700 a!2804)))

(declare-fun b!1512946 () Bool)

(declare-fun res!1032856 () Bool)

(assert (=> b!1512946 (=> (not res!1032856) (not e!844423))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100870 (_ BitVec 32)) SeekEntryResult!12843)

(assert (=> b!1512946 (= res!1032856 (= (seekEntry!0 (select (arr!48672 a!2804) j!70) a!2804 mask!2512) (Found!12843 j!70)))))

(assert (= (and start!129014 res!1032854) b!1512950))

(assert (= (and b!1512950 res!1032849) b!1512951))

(assert (= (and b!1512951 res!1032846) b!1512945))

(assert (= (and b!1512945 res!1032850) b!1512953))

(assert (= (and b!1512953 res!1032851) b!1512952))

(assert (= (and b!1512952 res!1032859) b!1512943))

(assert (= (and b!1512943 res!1032855) b!1512954))

(assert (= (and b!1512954 res!1032852) b!1512948))

(assert (= (and b!1512948 res!1032857) b!1512944))

(assert (= (and b!1512944 res!1032853) b!1512955))

(assert (= (and b!1512955 res!1032848) b!1512946))

(assert (= (and b!1512946 res!1032856) b!1512949))

(assert (= (and b!1512949 (not res!1032858)) b!1512956))

(assert (= (and b!1512955 (not res!1032847)) b!1512947))

(declare-fun m!1395755 () Bool)

(assert (=> b!1512947 m!1395755))

(declare-fun m!1395757 () Bool)

(assert (=> b!1512955 m!1395757))

(declare-fun m!1395759 () Bool)

(assert (=> b!1512955 m!1395759))

(declare-fun m!1395761 () Bool)

(assert (=> b!1512955 m!1395761))

(declare-fun m!1395763 () Bool)

(assert (=> b!1512955 m!1395763))

(declare-fun m!1395765 () Bool)

(assert (=> b!1512955 m!1395765))

(declare-fun m!1395767 () Bool)

(assert (=> b!1512955 m!1395767))

(declare-fun m!1395769 () Bool)

(assert (=> b!1512952 m!1395769))

(assert (=> b!1512954 m!1395757))

(assert (=> b!1512954 m!1395757))

(declare-fun m!1395771 () Bool)

(assert (=> b!1512954 m!1395771))

(assert (=> b!1512954 m!1395771))

(assert (=> b!1512954 m!1395757))

(declare-fun m!1395773 () Bool)

(assert (=> b!1512954 m!1395773))

(declare-fun m!1395775 () Bool)

(assert (=> start!129014 m!1395775))

(declare-fun m!1395777 () Bool)

(assert (=> start!129014 m!1395777))

(assert (=> b!1512948 m!1395757))

(assert (=> b!1512948 m!1395757))

(declare-fun m!1395779 () Bool)

(assert (=> b!1512948 m!1395779))

(assert (=> b!1512956 m!1395757))

(assert (=> b!1512956 m!1395757))

(declare-fun m!1395781 () Bool)

(assert (=> b!1512956 m!1395781))

(assert (=> b!1512956 m!1395757))

(declare-fun m!1395783 () Bool)

(assert (=> b!1512956 m!1395783))

(declare-fun m!1395785 () Bool)

(assert (=> b!1512953 m!1395785))

(assert (=> b!1512945 m!1395757))

(assert (=> b!1512945 m!1395757))

(declare-fun m!1395787 () Bool)

(assert (=> b!1512945 m!1395787))

(assert (=> b!1512949 m!1395757))

(assert (=> b!1512949 m!1395763))

(assert (=> b!1512946 m!1395757))

(assert (=> b!1512946 m!1395757))

(declare-fun m!1395789 () Bool)

(assert (=> b!1512946 m!1395789))

(declare-fun m!1395791 () Bool)

(assert (=> b!1512944 m!1395791))

(assert (=> b!1512944 m!1395761))

(assert (=> b!1512944 m!1395791))

(declare-fun m!1395793 () Bool)

(assert (=> b!1512944 m!1395793))

(declare-fun m!1395795 () Bool)

(assert (=> b!1512944 m!1395795))

(declare-fun m!1395797 () Bool)

(assert (=> b!1512951 m!1395797))

(assert (=> b!1512951 m!1395797))

(declare-fun m!1395799 () Bool)

(assert (=> b!1512951 m!1395799))

(check-sat (not b!1512955) (not b!1512944) (not b!1512951) (not b!1512953) (not b!1512945) (not b!1512947) (not b!1512954) (not b!1512956) (not b!1512948) (not b!1512952) (not b!1512946) (not start!129014))
(check-sat)
