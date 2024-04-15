; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130050 () Bool)

(assert start!130050)

(declare-fun res!1044895 () Bool)

(declare-fun e!850906 () Bool)

(assert (=> start!130050 (=> (not res!1044895) (not e!850906))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130050 (= res!1044895 (validMask!0 mask!2512))))

(assert (=> start!130050 e!850906))

(assert (=> start!130050 true))

(declare-datatypes ((array!101461 0))(
  ( (array!101462 (arr!48958 (Array (_ BitVec 32) (_ BitVec 64))) (size!49510 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101461)

(declare-fun array_inv!38191 (array!101461) Bool)

(assert (=> start!130050 (array_inv!38191 a!2804)))

(declare-fun b!1526673 () Bool)

(declare-fun e!850910 () Bool)

(declare-fun e!850912 () Bool)

(assert (=> b!1526673 (= e!850910 e!850912)))

(declare-fun res!1044896 () Bool)

(assert (=> b!1526673 (=> res!1044896 e!850912)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun lt!660987 () (_ BitVec 64))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1526673 (= res!1044896 (or (not (= (select (arr!48958 a!2804) j!70) lt!660987)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48958 a!2804) index!487) (select (arr!48958 a!2804) j!70)) (not (= (select (arr!48958 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1526674 () Bool)

(declare-fun res!1044900 () Bool)

(declare-fun e!850911 () Bool)

(assert (=> b!1526674 (=> (not res!1044900) (not e!850911))))

(declare-datatypes ((SeekEntryResult!13146 0))(
  ( (MissingZero!13146 (index!54979 (_ BitVec 32))) (Found!13146 (index!54980 (_ BitVec 32))) (Intermediate!13146 (undefined!13958 Bool) (index!54981 (_ BitVec 32)) (x!136675 (_ BitVec 32))) (Undefined!13146) (MissingVacant!13146 (index!54982 (_ BitVec 32))) )
))
(declare-fun lt!660983 () SeekEntryResult!13146)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101461 (_ BitVec 32)) SeekEntryResult!13146)

(assert (=> b!1526674 (= res!1044900 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48958 a!2804) j!70) a!2804 mask!2512) lt!660983))))

(declare-fun b!1526675 () Bool)

(declare-fun res!1044901 () Bool)

(assert (=> b!1526675 (=> (not res!1044901) (not e!850906))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1526675 (= res!1044901 (validKeyInArray!0 (select (arr!48958 a!2804) i!961)))))

(declare-fun b!1526676 () Bool)

(declare-fun res!1044897 () Bool)

(assert (=> b!1526676 (=> (not res!1044897) (not e!850906))))

(assert (=> b!1526676 (= res!1044897 (validKeyInArray!0 (select (arr!48958 a!2804) j!70)))))

(declare-fun b!1526677 () Bool)

(declare-fun res!1044898 () Bool)

(assert (=> b!1526677 (=> (not res!1044898) (not e!850906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101461 (_ BitVec 32)) Bool)

(assert (=> b!1526677 (= res!1044898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1526678 () Bool)

(declare-fun e!850909 () Bool)

(assert (=> b!1526678 (= e!850909 (not true))))

(assert (=> b!1526678 e!850910))

(declare-fun res!1044891 () Bool)

(assert (=> b!1526678 (=> (not res!1044891) (not e!850910))))

(assert (=> b!1526678 (= res!1044891 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50915 0))(
  ( (Unit!50916) )
))
(declare-fun lt!660986 () Unit!50915)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101461 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50915)

(assert (=> b!1526678 (= lt!660986 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1526679 () Bool)

(declare-fun res!1044892 () Bool)

(assert (=> b!1526679 (=> (not res!1044892) (not e!850906))))

(declare-datatypes ((List!35519 0))(
  ( (Nil!35516) (Cons!35515 (h!36949 (_ BitVec 64)) (t!50205 List!35519)) )
))
(declare-fun arrayNoDuplicates!0 (array!101461 (_ BitVec 32) List!35519) Bool)

(assert (=> b!1526679 (= res!1044892 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35516))))

(declare-fun b!1526680 () Bool)

(assert (=> b!1526680 (= e!850911 e!850909)))

(declare-fun res!1044893 () Bool)

(assert (=> b!1526680 (=> (not res!1044893) (not e!850909))))

(declare-fun lt!660985 () array!101461)

(declare-fun lt!660984 () SeekEntryResult!13146)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1526680 (= res!1044893 (= lt!660984 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660987 mask!2512) lt!660987 lt!660985 mask!2512)))))

(assert (=> b!1526680 (= lt!660987 (select (store (arr!48958 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1526680 (= lt!660985 (array!101462 (store (arr!48958 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49510 a!2804)))))

(declare-fun b!1526681 () Bool)

(declare-fun res!1044894 () Bool)

(assert (=> b!1526681 (=> (not res!1044894) (not e!850906))))

(assert (=> b!1526681 (= res!1044894 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49510 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49510 a!2804))))))

(declare-fun b!1526682 () Bool)

(declare-fun e!850908 () Bool)

(assert (=> b!1526682 (= e!850912 e!850908)))

(declare-fun res!1044904 () Bool)

(assert (=> b!1526682 (=> (not res!1044904) (not e!850908))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101461 (_ BitVec 32)) SeekEntryResult!13146)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101461 (_ BitVec 32)) SeekEntryResult!13146)

(assert (=> b!1526682 (= res!1044904 (= (seekEntryOrOpen!0 (select (arr!48958 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48958 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1526683 () Bool)

(assert (=> b!1526683 (= e!850906 e!850911)))

(declare-fun res!1044902 () Bool)

(assert (=> b!1526683 (=> (not res!1044902) (not e!850911))))

(assert (=> b!1526683 (= res!1044902 (= lt!660984 lt!660983))))

(assert (=> b!1526683 (= lt!660983 (Intermediate!13146 false resIndex!21 resX!21))))

(assert (=> b!1526683 (= lt!660984 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48958 a!2804) j!70) mask!2512) (select (arr!48958 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1526684 () Bool)

(declare-fun res!1044903 () Bool)

(assert (=> b!1526684 (=> (not res!1044903) (not e!850910))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101461 (_ BitVec 32)) SeekEntryResult!13146)

(assert (=> b!1526684 (= res!1044903 (= (seekEntry!0 (select (arr!48958 a!2804) j!70) a!2804 mask!2512) (Found!13146 j!70)))))

(declare-fun b!1526685 () Bool)

(assert (=> b!1526685 (= e!850908 (= (seekEntryOrOpen!0 lt!660987 lt!660985 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660987 lt!660985 mask!2512)))))

(declare-fun b!1526686 () Bool)

(declare-fun res!1044899 () Bool)

(assert (=> b!1526686 (=> (not res!1044899) (not e!850906))))

(assert (=> b!1526686 (= res!1044899 (and (= (size!49510 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49510 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49510 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!130050 res!1044895) b!1526686))

(assert (= (and b!1526686 res!1044899) b!1526675))

(assert (= (and b!1526675 res!1044901) b!1526676))

(assert (= (and b!1526676 res!1044897) b!1526677))

(assert (= (and b!1526677 res!1044898) b!1526679))

(assert (= (and b!1526679 res!1044892) b!1526681))

(assert (= (and b!1526681 res!1044894) b!1526683))

(assert (= (and b!1526683 res!1044902) b!1526674))

(assert (= (and b!1526674 res!1044900) b!1526680))

(assert (= (and b!1526680 res!1044893) b!1526678))

(assert (= (and b!1526678 res!1044891) b!1526684))

(assert (= (and b!1526684 res!1044903) b!1526673))

(assert (= (and b!1526673 (not res!1044896)) b!1526682))

(assert (= (and b!1526682 res!1044904) b!1526685))

(declare-fun m!1408949 () Bool)

(assert (=> b!1526676 m!1408949))

(assert (=> b!1526676 m!1408949))

(declare-fun m!1408951 () Bool)

(assert (=> b!1526676 m!1408951))

(declare-fun m!1408953 () Bool)

(assert (=> b!1526680 m!1408953))

(assert (=> b!1526680 m!1408953))

(declare-fun m!1408955 () Bool)

(assert (=> b!1526680 m!1408955))

(declare-fun m!1408957 () Bool)

(assert (=> b!1526680 m!1408957))

(declare-fun m!1408959 () Bool)

(assert (=> b!1526680 m!1408959))

(assert (=> b!1526682 m!1408949))

(assert (=> b!1526682 m!1408949))

(declare-fun m!1408961 () Bool)

(assert (=> b!1526682 m!1408961))

(assert (=> b!1526682 m!1408949))

(declare-fun m!1408963 () Bool)

(assert (=> b!1526682 m!1408963))

(declare-fun m!1408965 () Bool)

(assert (=> b!1526675 m!1408965))

(assert (=> b!1526675 m!1408965))

(declare-fun m!1408967 () Bool)

(assert (=> b!1526675 m!1408967))

(declare-fun m!1408969 () Bool)

(assert (=> b!1526678 m!1408969))

(declare-fun m!1408971 () Bool)

(assert (=> b!1526678 m!1408971))

(declare-fun m!1408973 () Bool)

(assert (=> b!1526685 m!1408973))

(declare-fun m!1408975 () Bool)

(assert (=> b!1526685 m!1408975))

(declare-fun m!1408977 () Bool)

(assert (=> b!1526679 m!1408977))

(assert (=> b!1526683 m!1408949))

(assert (=> b!1526683 m!1408949))

(declare-fun m!1408979 () Bool)

(assert (=> b!1526683 m!1408979))

(assert (=> b!1526683 m!1408979))

(assert (=> b!1526683 m!1408949))

(declare-fun m!1408981 () Bool)

(assert (=> b!1526683 m!1408981))

(declare-fun m!1408983 () Bool)

(assert (=> start!130050 m!1408983))

(declare-fun m!1408985 () Bool)

(assert (=> start!130050 m!1408985))

(declare-fun m!1408987 () Bool)

(assert (=> b!1526677 m!1408987))

(assert (=> b!1526674 m!1408949))

(assert (=> b!1526674 m!1408949))

(declare-fun m!1408989 () Bool)

(assert (=> b!1526674 m!1408989))

(assert (=> b!1526684 m!1408949))

(assert (=> b!1526684 m!1408949))

(declare-fun m!1408991 () Bool)

(assert (=> b!1526684 m!1408991))

(assert (=> b!1526673 m!1408949))

(declare-fun m!1408993 () Bool)

(assert (=> b!1526673 m!1408993))

(check-sat (not b!1526678) (not b!1526674) (not start!130050) (not b!1526682) (not b!1526676) (not b!1526684) (not b!1526680) (not b!1526679) (not b!1526685) (not b!1526675) (not b!1526677) (not b!1526683))
(check-sat)
