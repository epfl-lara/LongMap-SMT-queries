; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130202 () Bool)

(assert start!130202)

(declare-fun b!1528157 () Bool)

(declare-fun res!1045868 () Bool)

(declare-fun e!851729 () Bool)

(assert (=> b!1528157 (=> (not res!1045868) (not e!851729))))

(declare-datatypes ((array!101552 0))(
  ( (array!101553 (arr!49001 (Array (_ BitVec 32) (_ BitVec 64))) (size!49551 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101552)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528157 (= res!1045868 (validKeyInArray!0 (select (arr!49001 a!2804) j!70)))))

(declare-fun b!1528158 () Bool)

(declare-fun res!1045867 () Bool)

(assert (=> b!1528158 (=> (not res!1045867) (not e!851729))))

(declare-datatypes ((List!35484 0))(
  ( (Nil!35481) (Cons!35480 (h!36916 (_ BitVec 64)) (t!50178 List!35484)) )
))
(declare-fun arrayNoDuplicates!0 (array!101552 (_ BitVec 32) List!35484) Bool)

(assert (=> b!1528158 (= res!1045867 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35481))))

(declare-fun b!1528159 () Bool)

(declare-fun e!851728 () Bool)

(declare-fun e!851731 () Bool)

(assert (=> b!1528159 (= e!851728 e!851731)))

(declare-fun res!1045870 () Bool)

(assert (=> b!1528159 (=> res!1045870 e!851731)))

(declare-datatypes ((SeekEntryResult!13166 0))(
  ( (MissingZero!13166 (index!55059 (_ BitVec 32))) (Found!13166 (index!55060 (_ BitVec 32))) (Intermediate!13166 (undefined!13978 Bool) (index!55061 (_ BitVec 32)) (x!136757 (_ BitVec 32))) (Undefined!13166) (MissingVacant!13166 (index!55062 (_ BitVec 32))) )
))
(declare-fun lt!661764 () SeekEntryResult!13166)

(assert (=> b!1528159 (= res!1045870 (not (= lt!661764 (Found!13166 j!70))))))

(declare-fun lt!661766 () SeekEntryResult!13166)

(declare-fun lt!661767 () SeekEntryResult!13166)

(assert (=> b!1528159 (= lt!661766 lt!661767)))

(declare-fun lt!661765 () array!101552)

(declare-fun lt!661771 () (_ BitVec 64))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101552 (_ BitVec 32)) SeekEntryResult!13166)

(assert (=> b!1528159 (= lt!661767 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661771 lt!661765 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101552 (_ BitVec 32)) SeekEntryResult!13166)

(assert (=> b!1528159 (= lt!661766 (seekEntryOrOpen!0 lt!661771 lt!661765 mask!2512))))

(declare-fun lt!661769 () SeekEntryResult!13166)

(assert (=> b!1528159 (= lt!661769 lt!661764)))

(assert (=> b!1528159 (= lt!661764 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49001 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1528159 (= lt!661769 (seekEntryOrOpen!0 (select (arr!49001 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528160 () Bool)

(declare-fun e!851734 () Bool)

(assert (=> b!1528160 (= e!851734 (not e!851728))))

(declare-fun res!1045871 () Bool)

(assert (=> b!1528160 (=> res!1045871 e!851728)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1528160 (= res!1045871 (or (not (= (select (arr!49001 a!2804) j!70) lt!661771)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49001 a!2804) index!487) (select (arr!49001 a!2804) j!70)) (not (= (select (arr!49001 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!851730 () Bool)

(assert (=> b!1528160 e!851730))

(declare-fun res!1045865 () Bool)

(assert (=> b!1528160 (=> (not res!1045865) (not e!851730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101552 (_ BitVec 32)) Bool)

(assert (=> b!1528160 (= res!1045865 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51116 0))(
  ( (Unit!51117) )
))
(declare-fun lt!661768 () Unit!51116)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101552 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51116)

(assert (=> b!1528160 (= lt!661768 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528161 () Bool)

(declare-fun e!851733 () Bool)

(assert (=> b!1528161 (= e!851733 e!851734)))

(declare-fun res!1045876 () Bool)

(assert (=> b!1528161 (=> (not res!1045876) (not e!851734))))

(declare-fun lt!661763 () SeekEntryResult!13166)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101552 (_ BitVec 32)) SeekEntryResult!13166)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528161 (= res!1045876 (= lt!661763 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661771 mask!2512) lt!661771 lt!661765 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1528161 (= lt!661771 (select (store (arr!49001 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1528161 (= lt!661765 (array!101553 (store (arr!49001 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49551 a!2804)))))

(declare-fun b!1528162 () Bool)

(declare-fun res!1045875 () Bool)

(assert (=> b!1528162 (=> (not res!1045875) (not e!851733))))

(declare-fun lt!661770 () SeekEntryResult!13166)

(assert (=> b!1528162 (= res!1045875 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49001 a!2804) j!70) a!2804 mask!2512) lt!661770))))

(declare-fun b!1528163 () Bool)

(assert (=> b!1528163 (= e!851731 true)))

(assert (=> b!1528163 (= lt!661767 lt!661764)))

(declare-fun lt!661762 () Unit!51116)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101552 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51116)

(assert (=> b!1528163 (= lt!661762 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1528164 () Bool)

(declare-fun res!1045872 () Bool)

(assert (=> b!1528164 (=> (not res!1045872) (not e!851729))))

(assert (=> b!1528164 (= res!1045872 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49551 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49551 a!2804))))))

(declare-fun b!1528165 () Bool)

(declare-fun res!1045864 () Bool)

(assert (=> b!1528165 (=> (not res!1045864) (not e!851729))))

(assert (=> b!1528165 (= res!1045864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528167 () Bool)

(declare-fun res!1045869 () Bool)

(assert (=> b!1528167 (=> (not res!1045869) (not e!851729))))

(assert (=> b!1528167 (= res!1045869 (and (= (size!49551 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49551 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49551 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528168 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101552 (_ BitVec 32)) SeekEntryResult!13166)

(assert (=> b!1528168 (= e!851730 (= (seekEntry!0 (select (arr!49001 a!2804) j!70) a!2804 mask!2512) (Found!13166 j!70)))))

(declare-fun b!1528169 () Bool)

(assert (=> b!1528169 (= e!851729 e!851733)))

(declare-fun res!1045873 () Bool)

(assert (=> b!1528169 (=> (not res!1045873) (not e!851733))))

(assert (=> b!1528169 (= res!1045873 (= lt!661763 lt!661770))))

(assert (=> b!1528169 (= lt!661770 (Intermediate!13166 false resIndex!21 resX!21))))

(assert (=> b!1528169 (= lt!661763 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49001 a!2804) j!70) mask!2512) (select (arr!49001 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1528166 () Bool)

(declare-fun res!1045874 () Bool)

(assert (=> b!1528166 (=> (not res!1045874) (not e!851729))))

(assert (=> b!1528166 (= res!1045874 (validKeyInArray!0 (select (arr!49001 a!2804) i!961)))))

(declare-fun res!1045866 () Bool)

(assert (=> start!130202 (=> (not res!1045866) (not e!851729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130202 (= res!1045866 (validMask!0 mask!2512))))

(assert (=> start!130202 e!851729))

(assert (=> start!130202 true))

(declare-fun array_inv!38029 (array!101552) Bool)

(assert (=> start!130202 (array_inv!38029 a!2804)))

(assert (= (and start!130202 res!1045866) b!1528167))

(assert (= (and b!1528167 res!1045869) b!1528166))

(assert (= (and b!1528166 res!1045874) b!1528157))

(assert (= (and b!1528157 res!1045868) b!1528165))

(assert (= (and b!1528165 res!1045864) b!1528158))

(assert (= (and b!1528158 res!1045867) b!1528164))

(assert (= (and b!1528164 res!1045872) b!1528169))

(assert (= (and b!1528169 res!1045873) b!1528162))

(assert (= (and b!1528162 res!1045875) b!1528161))

(assert (= (and b!1528161 res!1045876) b!1528160))

(assert (= (and b!1528160 res!1045865) b!1528168))

(assert (= (and b!1528160 (not res!1045871)) b!1528159))

(assert (= (and b!1528159 (not res!1045870)) b!1528163))

(declare-fun m!1410927 () Bool)

(assert (=> b!1528168 m!1410927))

(assert (=> b!1528168 m!1410927))

(declare-fun m!1410929 () Bool)

(assert (=> b!1528168 m!1410929))

(declare-fun m!1410931 () Bool)

(assert (=> b!1528166 m!1410931))

(assert (=> b!1528166 m!1410931))

(declare-fun m!1410933 () Bool)

(assert (=> b!1528166 m!1410933))

(assert (=> b!1528169 m!1410927))

(assert (=> b!1528169 m!1410927))

(declare-fun m!1410935 () Bool)

(assert (=> b!1528169 m!1410935))

(assert (=> b!1528169 m!1410935))

(assert (=> b!1528169 m!1410927))

(declare-fun m!1410937 () Bool)

(assert (=> b!1528169 m!1410937))

(assert (=> b!1528160 m!1410927))

(declare-fun m!1410939 () Bool)

(assert (=> b!1528160 m!1410939))

(declare-fun m!1410941 () Bool)

(assert (=> b!1528160 m!1410941))

(declare-fun m!1410943 () Bool)

(assert (=> b!1528160 m!1410943))

(assert (=> b!1528162 m!1410927))

(assert (=> b!1528162 m!1410927))

(declare-fun m!1410945 () Bool)

(assert (=> b!1528162 m!1410945))

(declare-fun m!1410947 () Bool)

(assert (=> b!1528165 m!1410947))

(declare-fun m!1410949 () Bool)

(assert (=> start!130202 m!1410949))

(declare-fun m!1410951 () Bool)

(assert (=> start!130202 m!1410951))

(declare-fun m!1410953 () Bool)

(assert (=> b!1528163 m!1410953))

(declare-fun m!1410955 () Bool)

(assert (=> b!1528158 m!1410955))

(assert (=> b!1528159 m!1410927))

(declare-fun m!1410957 () Bool)

(assert (=> b!1528159 m!1410957))

(assert (=> b!1528159 m!1410927))

(declare-fun m!1410959 () Bool)

(assert (=> b!1528159 m!1410959))

(assert (=> b!1528159 m!1410927))

(declare-fun m!1410961 () Bool)

(assert (=> b!1528159 m!1410961))

(declare-fun m!1410963 () Bool)

(assert (=> b!1528159 m!1410963))

(declare-fun m!1410965 () Bool)

(assert (=> b!1528161 m!1410965))

(assert (=> b!1528161 m!1410965))

(declare-fun m!1410967 () Bool)

(assert (=> b!1528161 m!1410967))

(declare-fun m!1410969 () Bool)

(assert (=> b!1528161 m!1410969))

(declare-fun m!1410971 () Bool)

(assert (=> b!1528161 m!1410971))

(assert (=> b!1528157 m!1410927))

(assert (=> b!1528157 m!1410927))

(declare-fun m!1410973 () Bool)

(assert (=> b!1528157 m!1410973))

(push 1)

