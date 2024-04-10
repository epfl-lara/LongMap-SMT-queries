; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130052 () Bool)

(assert start!130052)

(declare-fun b!1525978 () Bool)

(declare-fun e!850601 () Bool)

(declare-fun e!850604 () Bool)

(assert (=> b!1525978 (= e!850601 e!850604)))

(declare-fun res!1044016 () Bool)

(assert (=> b!1525978 (=> (not res!1044016) (not e!850604))))

(declare-datatypes ((SeekEntryResult!13124 0))(
  ( (MissingZero!13124 (index!54891 (_ BitVec 32))) (Found!13124 (index!54892 (_ BitVec 32))) (Intermediate!13124 (undefined!13936 Bool) (index!54893 (_ BitVec 32)) (x!136594 (_ BitVec 32))) (Undefined!13124) (MissingVacant!13124 (index!54894 (_ BitVec 32))) )
))
(declare-fun lt!660910 () SeekEntryResult!13124)

(declare-fun lt!660911 () SeekEntryResult!13124)

(assert (=> b!1525978 (= res!1044016 (= lt!660910 lt!660911))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1525978 (= lt!660911 (Intermediate!13124 false resIndex!21 resX!21))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101465 0))(
  ( (array!101466 (arr!48959 (Array (_ BitVec 32) (_ BitVec 64))) (size!49509 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101465)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101465 (_ BitVec 32)) SeekEntryResult!13124)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525978 (= lt!660910 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48959 a!2804) j!70) mask!2512) (select (arr!48959 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525979 () Bool)

(declare-fun e!850606 () Bool)

(assert (=> b!1525979 (= e!850604 e!850606)))

(declare-fun res!1044017 () Bool)

(assert (=> b!1525979 (=> (not res!1044017) (not e!850606))))

(declare-fun lt!660913 () array!101465)

(declare-fun lt!660909 () (_ BitVec 64))

(assert (=> b!1525979 (= res!1044017 (= lt!660910 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!660909 mask!2512) lt!660909 lt!660913 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1525979 (= lt!660909 (select (store (arr!48959 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1525979 (= lt!660913 (array!101466 (store (arr!48959 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49509 a!2804)))))

(declare-fun res!1044023 () Bool)

(assert (=> start!130052 (=> (not res!1044023) (not e!850601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130052 (= res!1044023 (validMask!0 mask!2512))))

(assert (=> start!130052 e!850601))

(assert (=> start!130052 true))

(declare-fun array_inv!37987 (array!101465) Bool)

(assert (=> start!130052 (array_inv!37987 a!2804)))

(declare-fun b!1525980 () Bool)

(declare-fun res!1044021 () Bool)

(declare-fun e!850605 () Bool)

(assert (=> b!1525980 (=> (not res!1044021) (not e!850605))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101465 (_ BitVec 32)) SeekEntryResult!13124)

(assert (=> b!1525980 (= res!1044021 (= (seekEntry!0 (select (arr!48959 a!2804) j!70) a!2804 mask!2512) (Found!13124 j!70)))))

(declare-fun b!1525981 () Bool)

(declare-fun res!1044012 () Bool)

(assert (=> b!1525981 (=> (not res!1044012) (not e!850601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525981 (= res!1044012 (validKeyInArray!0 (select (arr!48959 a!2804) i!961)))))

(declare-fun b!1525982 () Bool)

(declare-fun res!1044022 () Bool)

(assert (=> b!1525982 (=> (not res!1044022) (not e!850601))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1525982 (= res!1044022 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49509 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49509 a!2804))))))

(declare-fun b!1525983 () Bool)

(declare-fun res!1044014 () Bool)

(assert (=> b!1525983 (=> (not res!1044014) (not e!850604))))

(assert (=> b!1525983 (= res!1044014 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48959 a!2804) j!70) a!2804 mask!2512) lt!660911))))

(declare-fun b!1525984 () Bool)

(declare-fun res!1044019 () Bool)

(assert (=> b!1525984 (=> (not res!1044019) (not e!850601))))

(assert (=> b!1525984 (= res!1044019 (validKeyInArray!0 (select (arr!48959 a!2804) j!70)))))

(declare-fun e!850600 () Bool)

(declare-fun b!1525985 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101465 (_ BitVec 32)) SeekEntryResult!13124)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101465 (_ BitVec 32)) SeekEntryResult!13124)

(assert (=> b!1525985 (= e!850600 (= (seekEntryOrOpen!0 lt!660909 lt!660913 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!660909 lt!660913 mask!2512)))))

(declare-fun b!1525986 () Bool)

(assert (=> b!1525986 (= e!850606 (not true))))

(assert (=> b!1525986 e!850605))

(declare-fun res!1044015 () Bool)

(assert (=> b!1525986 (=> (not res!1044015) (not e!850605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101465 (_ BitVec 32)) Bool)

(assert (=> b!1525986 (= res!1044015 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51032 0))(
  ( (Unit!51033) )
))
(declare-fun lt!660912 () Unit!51032)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101465 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51032)

(assert (=> b!1525986 (= lt!660912 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1525987 () Bool)

(declare-fun res!1044020 () Bool)

(assert (=> b!1525987 (=> (not res!1044020) (not e!850601))))

(declare-datatypes ((List!35442 0))(
  ( (Nil!35439) (Cons!35438 (h!36871 (_ BitVec 64)) (t!50136 List!35442)) )
))
(declare-fun arrayNoDuplicates!0 (array!101465 (_ BitVec 32) List!35442) Bool)

(assert (=> b!1525987 (= res!1044020 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35439))))

(declare-fun b!1525988 () Bool)

(declare-fun e!850603 () Bool)

(assert (=> b!1525988 (= e!850605 e!850603)))

(declare-fun res!1044013 () Bool)

(assert (=> b!1525988 (=> res!1044013 e!850603)))

(assert (=> b!1525988 (= res!1044013 (or (not (= (select (arr!48959 a!2804) j!70) lt!660909)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48959 a!2804) index!487) (select (arr!48959 a!2804) j!70)) (not (= (select (arr!48959 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1525989 () Bool)

(declare-fun res!1044025 () Bool)

(assert (=> b!1525989 (=> (not res!1044025) (not e!850601))))

(assert (=> b!1525989 (= res!1044025 (and (= (size!49509 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49509 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49509 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1525990 () Bool)

(declare-fun res!1044024 () Bool)

(assert (=> b!1525990 (=> (not res!1044024) (not e!850601))))

(assert (=> b!1525990 (= res!1044024 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1525991 () Bool)

(assert (=> b!1525991 (= e!850603 e!850600)))

(declare-fun res!1044018 () Bool)

(assert (=> b!1525991 (=> (not res!1044018) (not e!850600))))

(assert (=> b!1525991 (= res!1044018 (= (seekEntryOrOpen!0 (select (arr!48959 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48959 a!2804) j!70) a!2804 mask!2512)))))

(assert (= (and start!130052 res!1044023) b!1525989))

(assert (= (and b!1525989 res!1044025) b!1525981))

(assert (= (and b!1525981 res!1044012) b!1525984))

(assert (= (and b!1525984 res!1044019) b!1525990))

(assert (= (and b!1525990 res!1044024) b!1525987))

(assert (= (and b!1525987 res!1044020) b!1525982))

(assert (= (and b!1525982 res!1044022) b!1525978))

(assert (= (and b!1525978 res!1044016) b!1525983))

(assert (= (and b!1525983 res!1044014) b!1525979))

(assert (= (and b!1525979 res!1044017) b!1525986))

(assert (= (and b!1525986 res!1044015) b!1525980))

(assert (= (and b!1525980 res!1044021) b!1525988))

(assert (= (and b!1525988 (not res!1044013)) b!1525991))

(assert (= (and b!1525991 res!1044018) b!1525985))

(declare-fun m!1408737 () Bool)

(assert (=> start!130052 m!1408737))

(declare-fun m!1408739 () Bool)

(assert (=> start!130052 m!1408739))

(declare-fun m!1408741 () Bool)

(assert (=> b!1525987 m!1408741))

(declare-fun m!1408743 () Bool)

(assert (=> b!1525984 m!1408743))

(assert (=> b!1525984 m!1408743))

(declare-fun m!1408745 () Bool)

(assert (=> b!1525984 m!1408745))

(declare-fun m!1408747 () Bool)

(assert (=> b!1525990 m!1408747))

(assert (=> b!1525980 m!1408743))

(assert (=> b!1525980 m!1408743))

(declare-fun m!1408749 () Bool)

(assert (=> b!1525980 m!1408749))

(declare-fun m!1408751 () Bool)

(assert (=> b!1525985 m!1408751))

(declare-fun m!1408753 () Bool)

(assert (=> b!1525985 m!1408753))

(declare-fun m!1408755 () Bool)

(assert (=> b!1525981 m!1408755))

(assert (=> b!1525981 m!1408755))

(declare-fun m!1408757 () Bool)

(assert (=> b!1525981 m!1408757))

(assert (=> b!1525988 m!1408743))

(declare-fun m!1408759 () Bool)

(assert (=> b!1525988 m!1408759))

(declare-fun m!1408761 () Bool)

(assert (=> b!1525979 m!1408761))

(assert (=> b!1525979 m!1408761))

(declare-fun m!1408763 () Bool)

(assert (=> b!1525979 m!1408763))

(declare-fun m!1408765 () Bool)

(assert (=> b!1525979 m!1408765))

(declare-fun m!1408767 () Bool)

(assert (=> b!1525979 m!1408767))

(declare-fun m!1408769 () Bool)

(assert (=> b!1525986 m!1408769))

(declare-fun m!1408771 () Bool)

(assert (=> b!1525986 m!1408771))

(assert (=> b!1525978 m!1408743))

(assert (=> b!1525978 m!1408743))

(declare-fun m!1408773 () Bool)

(assert (=> b!1525978 m!1408773))

(assert (=> b!1525978 m!1408773))

(assert (=> b!1525978 m!1408743))

(declare-fun m!1408775 () Bool)

(assert (=> b!1525978 m!1408775))

(assert (=> b!1525991 m!1408743))

(assert (=> b!1525991 m!1408743))

(declare-fun m!1408777 () Bool)

(assert (=> b!1525991 m!1408777))

(assert (=> b!1525991 m!1408743))

(declare-fun m!1408779 () Bool)

(assert (=> b!1525991 m!1408779))

(assert (=> b!1525983 m!1408743))

(assert (=> b!1525983 m!1408743))

(declare-fun m!1408781 () Bool)

(assert (=> b!1525983 m!1408781))

(push 1)

