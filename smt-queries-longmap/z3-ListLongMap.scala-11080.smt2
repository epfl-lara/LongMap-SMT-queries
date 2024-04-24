; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129668 () Bool)

(assert start!129668)

(declare-fun b!1520982 () Bool)

(declare-fun e!848604 () Bool)

(declare-fun e!848598 () Bool)

(assert (=> b!1520982 (= e!848604 e!848598)))

(declare-fun res!1039531 () Bool)

(assert (=> b!1520982 (=> res!1039531 e!848598)))

(declare-fun lt!659183 () (_ BitVec 32))

(declare-datatypes ((array!101287 0))(
  ( (array!101288 (arr!48874 (Array (_ BitVec 32) (_ BitVec 64))) (size!49425 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101287)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1520982 (= res!1039531 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!659183 #b00000000000000000000000000000000) (bvsge lt!659183 (size!49425 a!2804))))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520982 (= lt!659183 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1520983 () Bool)

(declare-fun res!1039527 () Bool)

(declare-fun e!848602 () Bool)

(assert (=> b!1520983 (=> (not res!1039527) (not e!848602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101287 (_ BitVec 32)) Bool)

(assert (=> b!1520983 (= res!1039527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1520984 () Bool)

(declare-fun res!1039528 () Bool)

(assert (=> b!1520984 (=> (not res!1039528) (not e!848602))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1520984 (= res!1039528 (and (= (size!49425 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49425 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49425 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1520985 () Bool)

(declare-fun res!1039535 () Bool)

(assert (=> b!1520985 (=> (not res!1039535) (not e!848602))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520985 (= res!1039535 (validKeyInArray!0 (select (arr!48874 a!2804) i!961)))))

(declare-fun b!1520986 () Bool)

(declare-fun e!848603 () Bool)

(assert (=> b!1520986 (= e!848603 (not e!848604))))

(declare-fun res!1039537 () Bool)

(assert (=> b!1520986 (=> res!1039537 e!848604)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun lt!659182 () (_ BitVec 64))

(assert (=> b!1520986 (= res!1039537 (or (not (= (select (arr!48874 a!2804) j!70) lt!659182)) (= x!534 resX!21)))))

(declare-fun e!848600 () Bool)

(assert (=> b!1520986 e!848600))

(declare-fun res!1039534 () Bool)

(assert (=> b!1520986 (=> (not res!1039534) (not e!848600))))

(assert (=> b!1520986 (= res!1039534 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50779 0))(
  ( (Unit!50780) )
))
(declare-fun lt!659184 () Unit!50779)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101287 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50779)

(assert (=> b!1520986 (= lt!659184 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1520987 () Bool)

(declare-fun res!1039526 () Bool)

(assert (=> b!1520987 (=> (not res!1039526) (not e!848602))))

(declare-datatypes ((List!35344 0))(
  ( (Nil!35341) (Cons!35340 (h!36770 (_ BitVec 64)) (t!50030 List!35344)) )
))
(declare-fun arrayNoDuplicates!0 (array!101287 (_ BitVec 32) List!35344) Bool)

(assert (=> b!1520987 (= res!1039526 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35341))))

(declare-fun b!1520988 () Bool)

(declare-fun e!848599 () Bool)

(assert (=> b!1520988 (= e!848602 e!848599)))

(declare-fun res!1039538 () Bool)

(assert (=> b!1520988 (=> (not res!1039538) (not e!848599))))

(declare-datatypes ((SeekEntryResult!12938 0))(
  ( (MissingZero!12938 (index!54147 (_ BitVec 32))) (Found!12938 (index!54148 (_ BitVec 32))) (Intermediate!12938 (undefined!13750 Bool) (index!54149 (_ BitVec 32)) (x!136027 (_ BitVec 32))) (Undefined!12938) (MissingVacant!12938 (index!54150 (_ BitVec 32))) )
))
(declare-fun lt!659185 () SeekEntryResult!12938)

(declare-fun lt!659179 () SeekEntryResult!12938)

(assert (=> b!1520988 (= res!1039538 (= lt!659185 lt!659179))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1520988 (= lt!659179 (Intermediate!12938 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101287 (_ BitVec 32)) SeekEntryResult!12938)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520988 (= lt!659185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48874 a!2804) j!70) mask!2512) (select (arr!48874 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520989 () Bool)

(assert (=> b!1520989 (= e!848599 e!848603)))

(declare-fun res!1039529 () Bool)

(assert (=> b!1520989 (=> (not res!1039529) (not e!848603))))

(declare-fun lt!659181 () array!101287)

(assert (=> b!1520989 (= res!1039529 (= lt!659185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!659182 mask!2512) lt!659182 lt!659181 mask!2512)))))

(assert (=> b!1520989 (= lt!659182 (select (store (arr!48874 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1520989 (= lt!659181 (array!101288 (store (arr!48874 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49425 a!2804)))))

(declare-fun b!1520990 () Bool)

(declare-fun res!1039536 () Bool)

(assert (=> b!1520990 (=> res!1039536 e!848598)))

(assert (=> b!1520990 (= res!1039536 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!659183 (select (arr!48874 a!2804) j!70) a!2804 mask!2512) lt!659179)))))

(declare-fun b!1520991 () Bool)

(declare-fun res!1039525 () Bool)

(assert (=> b!1520991 (=> (not res!1039525) (not e!848602))))

(assert (=> b!1520991 (= res!1039525 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49425 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49425 a!2804))))))

(declare-fun res!1039533 () Bool)

(assert (=> start!129668 (=> (not res!1039533) (not e!848602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129668 (= res!1039533 (validMask!0 mask!2512))))

(assert (=> start!129668 e!848602))

(assert (=> start!129668 true))

(declare-fun array_inv!38155 (array!101287) Bool)

(assert (=> start!129668 (array_inv!38155 a!2804)))

(declare-fun b!1520992 () Bool)

(assert (=> b!1520992 (= e!848598 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101287 (_ BitVec 32)) SeekEntryResult!12938)

(assert (=> b!1520992 (= (seekEntryOrOpen!0 (select (arr!48874 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!659182 lt!659181 mask!2512))))

(declare-fun lt!659180 () Unit!50779)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101287 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50779)

(assert (=> b!1520992 (= lt!659180 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!659183 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1520993 () Bool)

(declare-fun res!1039530 () Bool)

(assert (=> b!1520993 (=> (not res!1039530) (not e!848602))))

(assert (=> b!1520993 (= res!1039530 (validKeyInArray!0 (select (arr!48874 a!2804) j!70)))))

(declare-fun b!1520994 () Bool)

(declare-fun res!1039532 () Bool)

(assert (=> b!1520994 (=> (not res!1039532) (not e!848599))))

(assert (=> b!1520994 (= res!1039532 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48874 a!2804) j!70) a!2804 mask!2512) lt!659179))))

(declare-fun b!1520995 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101287 (_ BitVec 32)) SeekEntryResult!12938)

(assert (=> b!1520995 (= e!848600 (= (seekEntry!0 (select (arr!48874 a!2804) j!70) a!2804 mask!2512) (Found!12938 j!70)))))

(assert (= (and start!129668 res!1039533) b!1520984))

(assert (= (and b!1520984 res!1039528) b!1520985))

(assert (= (and b!1520985 res!1039535) b!1520993))

(assert (= (and b!1520993 res!1039530) b!1520983))

(assert (= (and b!1520983 res!1039527) b!1520987))

(assert (= (and b!1520987 res!1039526) b!1520991))

(assert (= (and b!1520991 res!1039525) b!1520988))

(assert (= (and b!1520988 res!1039538) b!1520994))

(assert (= (and b!1520994 res!1039532) b!1520989))

(assert (= (and b!1520989 res!1039529) b!1520986))

(assert (= (and b!1520986 res!1039534) b!1520995))

(assert (= (and b!1520986 (not res!1039537)) b!1520982))

(assert (= (and b!1520982 (not res!1039531)) b!1520990))

(assert (= (and b!1520990 (not res!1039536)) b!1520992))

(declare-fun m!1404183 () Bool)

(assert (=> b!1520992 m!1404183))

(assert (=> b!1520992 m!1404183))

(declare-fun m!1404185 () Bool)

(assert (=> b!1520992 m!1404185))

(declare-fun m!1404187 () Bool)

(assert (=> b!1520992 m!1404187))

(declare-fun m!1404189 () Bool)

(assert (=> b!1520992 m!1404189))

(declare-fun m!1404191 () Bool)

(assert (=> start!129668 m!1404191))

(declare-fun m!1404193 () Bool)

(assert (=> start!129668 m!1404193))

(declare-fun m!1404195 () Bool)

(assert (=> b!1520989 m!1404195))

(assert (=> b!1520989 m!1404195))

(declare-fun m!1404197 () Bool)

(assert (=> b!1520989 m!1404197))

(declare-fun m!1404199 () Bool)

(assert (=> b!1520989 m!1404199))

(declare-fun m!1404201 () Bool)

(assert (=> b!1520989 m!1404201))

(declare-fun m!1404203 () Bool)

(assert (=> b!1520982 m!1404203))

(declare-fun m!1404205 () Bool)

(assert (=> b!1520987 m!1404205))

(assert (=> b!1520995 m!1404183))

(assert (=> b!1520995 m!1404183))

(declare-fun m!1404207 () Bool)

(assert (=> b!1520995 m!1404207))

(assert (=> b!1520988 m!1404183))

(assert (=> b!1520988 m!1404183))

(declare-fun m!1404209 () Bool)

(assert (=> b!1520988 m!1404209))

(assert (=> b!1520988 m!1404209))

(assert (=> b!1520988 m!1404183))

(declare-fun m!1404211 () Bool)

(assert (=> b!1520988 m!1404211))

(assert (=> b!1520986 m!1404183))

(declare-fun m!1404213 () Bool)

(assert (=> b!1520986 m!1404213))

(declare-fun m!1404215 () Bool)

(assert (=> b!1520986 m!1404215))

(declare-fun m!1404217 () Bool)

(assert (=> b!1520983 m!1404217))

(assert (=> b!1520993 m!1404183))

(assert (=> b!1520993 m!1404183))

(declare-fun m!1404219 () Bool)

(assert (=> b!1520993 m!1404219))

(assert (=> b!1520994 m!1404183))

(assert (=> b!1520994 m!1404183))

(declare-fun m!1404221 () Bool)

(assert (=> b!1520994 m!1404221))

(assert (=> b!1520990 m!1404183))

(assert (=> b!1520990 m!1404183))

(declare-fun m!1404223 () Bool)

(assert (=> b!1520990 m!1404223))

(declare-fun m!1404225 () Bool)

(assert (=> b!1520985 m!1404225))

(assert (=> b!1520985 m!1404225))

(declare-fun m!1404227 () Bool)

(assert (=> b!1520985 m!1404227))

(check-sat (not b!1520992) (not b!1520993) (not b!1520982) (not b!1520988) (not b!1520990) (not b!1520985) (not b!1520989) (not b!1520994) (not b!1520987) (not b!1520986) (not start!129668) (not b!1520983) (not b!1520995))
(check-sat)
