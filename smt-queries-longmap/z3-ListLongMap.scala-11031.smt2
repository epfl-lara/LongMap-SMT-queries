; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128966 () Bool)

(assert start!128966)

(declare-fun b!1512687 () Bool)

(declare-fun e!844253 () Bool)

(declare-fun e!844252 () Bool)

(assert (=> b!1512687 (= e!844253 e!844252)))

(declare-fun res!1032796 () Bool)

(assert (=> b!1512687 (=> (not res!1032796) (not e!844252))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!100822 0))(
  ( (array!100823 (arr!48649 (Array (_ BitVec 32) (_ BitVec 64))) (size!49201 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100822)

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12843 0))(
  ( (MissingZero!12843 (index!53767 (_ BitVec 32))) (Found!12843 (index!53768 (_ BitVec 32))) (Intermediate!12843 (undefined!13655 Bool) (index!53769 (_ BitVec 32)) (x!135491 (_ BitVec 32))) (Undefined!12843) (MissingVacant!12843 (index!53770 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100822 (_ BitVec 32)) SeekEntryResult!12843)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100822 (_ BitVec 32)) SeekEntryResult!12843)

(assert (=> b!1512687 (= res!1032796 (= (seekEntryOrOpen!0 (select (arr!48649 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48649 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1512688 () Bool)

(declare-fun e!844248 () Bool)

(declare-fun e!844250 () Bool)

(assert (=> b!1512688 (= e!844248 e!844250)))

(declare-fun res!1032808 () Bool)

(assert (=> b!1512688 (=> (not res!1032808) (not e!844250))))

(declare-fun lt!655539 () (_ BitVec 64))

(declare-fun lt!655535 () SeekEntryResult!12843)

(declare-fun lt!655538 () array!100822)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100822 (_ BitVec 32)) SeekEntryResult!12843)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1512688 (= res!1032808 (= lt!655535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!655539 mask!2512) lt!655539 lt!655538 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1512688 (= lt!655539 (select (store (arr!48649 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1512688 (= lt!655538 (array!100823 (store (arr!48649 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49201 a!2804)))))

(declare-fun b!1512689 () Bool)

(declare-fun res!1032800 () Bool)

(declare-fun e!844251 () Bool)

(assert (=> b!1512689 (=> (not res!1032800) (not e!844251))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!100822 (_ BitVec 32)) SeekEntryResult!12843)

(assert (=> b!1512689 (= res!1032800 (= (seekEntry!0 (select (arr!48649 a!2804) j!70) a!2804 mask!2512) (Found!12843 j!70)))))

(declare-fun res!1032803 () Bool)

(declare-fun e!844249 () Bool)

(assert (=> start!128966 (=> (not res!1032803) (not e!844249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128966 (= res!1032803 (validMask!0 mask!2512))))

(assert (=> start!128966 e!844249))

(assert (=> start!128966 true))

(declare-fun array_inv!37882 (array!100822) Bool)

(assert (=> start!128966 (array_inv!37882 a!2804)))

(declare-fun b!1512690 () Bool)

(declare-fun res!1032798 () Bool)

(assert (=> b!1512690 (=> (not res!1032798) (not e!844249))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1512690 (= res!1032798 (validKeyInArray!0 (select (arr!48649 a!2804) j!70)))))

(declare-fun b!1512691 () Bool)

(declare-fun res!1032809 () Bool)

(assert (=> b!1512691 (=> (not res!1032809) (not e!844249))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1512691 (= res!1032809 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49201 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49201 a!2804))))))

(declare-fun b!1512692 () Bool)

(assert (=> b!1512692 (= e!844252 (= (seekEntryOrOpen!0 lt!655539 lt!655538 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!655539 lt!655538 mask!2512)))))

(declare-fun b!1512693 () Bool)

(assert (=> b!1512693 (= e!844251 e!844253)))

(declare-fun res!1032801 () Bool)

(assert (=> b!1512693 (=> res!1032801 e!844253)))

(assert (=> b!1512693 (= res!1032801 (or (not (= (select (arr!48649 a!2804) j!70) lt!655539)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48649 a!2804) index!487) (select (arr!48649 a!2804) j!70)) (not (= (select (arr!48649 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1512694 () Bool)

(declare-fun res!1032799 () Bool)

(assert (=> b!1512694 (=> (not res!1032799) (not e!844249))))

(declare-datatypes ((List!35210 0))(
  ( (Nil!35207) (Cons!35206 (h!36619 (_ BitVec 64)) (t!49896 List!35210)) )
))
(declare-fun arrayNoDuplicates!0 (array!100822 (_ BitVec 32) List!35210) Bool)

(assert (=> b!1512694 (= res!1032799 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35207))))

(declare-fun b!1512695 () Bool)

(declare-fun res!1032807 () Bool)

(assert (=> b!1512695 (=> (not res!1032807) (not e!844249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100822 (_ BitVec 32)) Bool)

(assert (=> b!1512695 (= res!1032807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1512696 () Bool)

(declare-fun res!1032804 () Bool)

(assert (=> b!1512696 (=> (not res!1032804) (not e!844248))))

(declare-fun lt!655537 () SeekEntryResult!12843)

(assert (=> b!1512696 (= res!1032804 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48649 a!2804) j!70) a!2804 mask!2512) lt!655537))))

(declare-fun b!1512697 () Bool)

(declare-fun res!1032806 () Bool)

(assert (=> b!1512697 (=> (not res!1032806) (not e!844249))))

(assert (=> b!1512697 (= res!1032806 (and (= (size!49201 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49201 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49201 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1512698 () Bool)

(declare-fun res!1032797 () Bool)

(assert (=> b!1512698 (=> (not res!1032797) (not e!844249))))

(assert (=> b!1512698 (= res!1032797 (validKeyInArray!0 (select (arr!48649 a!2804) i!961)))))

(declare-fun b!1512699 () Bool)

(assert (=> b!1512699 (= e!844249 e!844248)))

(declare-fun res!1032805 () Bool)

(assert (=> b!1512699 (=> (not res!1032805) (not e!844248))))

(assert (=> b!1512699 (= res!1032805 (= lt!655535 lt!655537))))

(assert (=> b!1512699 (= lt!655537 (Intermediate!12843 false resIndex!21 resX!21))))

(assert (=> b!1512699 (= lt!655535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48649 a!2804) j!70) mask!2512) (select (arr!48649 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1512700 () Bool)

(assert (=> b!1512700 (= e!844250 (not true))))

(assert (=> b!1512700 e!844251))

(declare-fun res!1032802 () Bool)

(assert (=> b!1512700 (=> (not res!1032802) (not e!844251))))

(assert (=> b!1512700 (= res!1032802 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50393 0))(
  ( (Unit!50394) )
))
(declare-fun lt!655536 () Unit!50393)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100822 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50393)

(assert (=> b!1512700 (= lt!655536 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!128966 res!1032803) b!1512697))

(assert (= (and b!1512697 res!1032806) b!1512698))

(assert (= (and b!1512698 res!1032797) b!1512690))

(assert (= (and b!1512690 res!1032798) b!1512695))

(assert (= (and b!1512695 res!1032807) b!1512694))

(assert (= (and b!1512694 res!1032799) b!1512691))

(assert (= (and b!1512691 res!1032809) b!1512699))

(assert (= (and b!1512699 res!1032805) b!1512696))

(assert (= (and b!1512696 res!1032804) b!1512688))

(assert (= (and b!1512688 res!1032808) b!1512700))

(assert (= (and b!1512700 res!1032802) b!1512689))

(assert (= (and b!1512689 res!1032800) b!1512693))

(assert (= (and b!1512693 (not res!1032801)) b!1512687))

(assert (= (and b!1512687 res!1032796) b!1512692))

(declare-fun m!1394939 () Bool)

(assert (=> b!1512700 m!1394939))

(declare-fun m!1394941 () Bool)

(assert (=> b!1512700 m!1394941))

(declare-fun m!1394943 () Bool)

(assert (=> b!1512690 m!1394943))

(assert (=> b!1512690 m!1394943))

(declare-fun m!1394945 () Bool)

(assert (=> b!1512690 m!1394945))

(declare-fun m!1394947 () Bool)

(assert (=> start!128966 m!1394947))

(declare-fun m!1394949 () Bool)

(assert (=> start!128966 m!1394949))

(declare-fun m!1394951 () Bool)

(assert (=> b!1512698 m!1394951))

(assert (=> b!1512698 m!1394951))

(declare-fun m!1394953 () Bool)

(assert (=> b!1512698 m!1394953))

(assert (=> b!1512696 m!1394943))

(assert (=> b!1512696 m!1394943))

(declare-fun m!1394955 () Bool)

(assert (=> b!1512696 m!1394955))

(declare-fun m!1394957 () Bool)

(assert (=> b!1512695 m!1394957))

(declare-fun m!1394959 () Bool)

(assert (=> b!1512692 m!1394959))

(declare-fun m!1394961 () Bool)

(assert (=> b!1512692 m!1394961))

(assert (=> b!1512699 m!1394943))

(assert (=> b!1512699 m!1394943))

(declare-fun m!1394963 () Bool)

(assert (=> b!1512699 m!1394963))

(assert (=> b!1512699 m!1394963))

(assert (=> b!1512699 m!1394943))

(declare-fun m!1394965 () Bool)

(assert (=> b!1512699 m!1394965))

(declare-fun m!1394967 () Bool)

(assert (=> b!1512688 m!1394967))

(assert (=> b!1512688 m!1394967))

(declare-fun m!1394969 () Bool)

(assert (=> b!1512688 m!1394969))

(declare-fun m!1394971 () Bool)

(assert (=> b!1512688 m!1394971))

(declare-fun m!1394973 () Bool)

(assert (=> b!1512688 m!1394973))

(declare-fun m!1394975 () Bool)

(assert (=> b!1512694 m!1394975))

(assert (=> b!1512693 m!1394943))

(declare-fun m!1394977 () Bool)

(assert (=> b!1512693 m!1394977))

(assert (=> b!1512687 m!1394943))

(assert (=> b!1512687 m!1394943))

(declare-fun m!1394979 () Bool)

(assert (=> b!1512687 m!1394979))

(assert (=> b!1512687 m!1394943))

(declare-fun m!1394981 () Bool)

(assert (=> b!1512687 m!1394981))

(assert (=> b!1512689 m!1394943))

(assert (=> b!1512689 m!1394943))

(declare-fun m!1394983 () Bool)

(assert (=> b!1512689 m!1394983))

(check-sat (not b!1512700) (not b!1512694) (not b!1512699) (not b!1512692) (not b!1512689) (not b!1512687) (not start!128966) (not b!1512696) (not b!1512698) (not b!1512690) (not b!1512688) (not b!1512695))
(check-sat)
