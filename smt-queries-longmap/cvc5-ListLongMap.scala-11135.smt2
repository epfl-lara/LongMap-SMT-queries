; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130106 () Bool)

(assert start!130106)

(declare-fun b!1527112 () Bool)

(declare-fun res!1045153 () Bool)

(declare-fun e!851169 () Bool)

(assert (=> b!1527112 (=> (not res!1045153) (not e!851169))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101519 0))(
  ( (array!101520 (arr!48986 (Array (_ BitVec 32) (_ BitVec 64))) (size!49536 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101519)

(assert (=> b!1527112 (= res!1045153 (and (= (size!49536 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49536 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49536 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1527113 () Bool)

(declare-fun res!1045154 () Bool)

(declare-fun e!851171 () Bool)

(assert (=> b!1527113 (=> (not res!1045154) (not e!851171))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13151 0))(
  ( (MissingZero!13151 (index!54999 (_ BitVec 32))) (Found!13151 (index!55000 (_ BitVec 32))) (Intermediate!13151 (undefined!13963 Bool) (index!55001 (_ BitVec 32)) (x!136693 (_ BitVec 32))) (Undefined!13151) (MissingVacant!13151 (index!55002 (_ BitVec 32))) )
))
(declare-fun lt!661317 () SeekEntryResult!13151)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101519 (_ BitVec 32)) SeekEntryResult!13151)

(assert (=> b!1527113 (= res!1045154 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48986 a!2804) j!70) a!2804 mask!2512) lt!661317))))

(declare-fun lt!661318 () array!101519)

(declare-fun b!1527114 () Bool)

(declare-fun lt!661314 () (_ BitVec 64))

(declare-fun e!851170 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101519 (_ BitVec 32)) SeekEntryResult!13151)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101519 (_ BitVec 32)) SeekEntryResult!13151)

(assert (=> b!1527114 (= e!851170 (= (seekEntryOrOpen!0 lt!661314 lt!661318 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!661314 lt!661318 mask!2512)))))

(declare-fun b!1527115 () Bool)

(declare-fun res!1045157 () Bool)

(assert (=> b!1527115 (=> (not res!1045157) (not e!851169))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101519 (_ BitVec 32)) Bool)

(assert (=> b!1527115 (= res!1045157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1527117 () Bool)

(declare-fun res!1045152 () Bool)

(assert (=> b!1527117 (=> (not res!1045152) (not e!851169))))

(declare-datatypes ((List!35469 0))(
  ( (Nil!35466) (Cons!35465 (h!36898 (_ BitVec 64)) (t!50163 List!35469)) )
))
(declare-fun arrayNoDuplicates!0 (array!101519 (_ BitVec 32) List!35469) Bool)

(assert (=> b!1527117 (= res!1045152 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35466))))

(declare-fun b!1527118 () Bool)

(assert (=> b!1527118 (= e!851169 e!851171)))

(declare-fun res!1045150 () Bool)

(assert (=> b!1527118 (=> (not res!1045150) (not e!851171))))

(declare-fun lt!661315 () SeekEntryResult!13151)

(assert (=> b!1527118 (= res!1045150 (= lt!661315 lt!661317))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1527118 (= lt!661317 (Intermediate!13151 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1527118 (= lt!661315 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48986 a!2804) j!70) mask!2512) (select (arr!48986 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1527119 () Bool)

(declare-fun res!1045156 () Bool)

(assert (=> b!1527119 (=> (not res!1045156) (not e!851169))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1527119 (= res!1045156 (validKeyInArray!0 (select (arr!48986 a!2804) j!70)))))

(declare-fun b!1527120 () Bool)

(declare-fun res!1045159 () Bool)

(assert (=> b!1527120 (=> (not res!1045159) (not e!851169))))

(assert (=> b!1527120 (= res!1045159 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49536 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49536 a!2804))))))

(declare-fun b!1527121 () Bool)

(declare-fun e!851167 () Bool)

(assert (=> b!1527121 (= e!851171 e!851167)))

(declare-fun res!1045151 () Bool)

(assert (=> b!1527121 (=> (not res!1045151) (not e!851167))))

(assert (=> b!1527121 (= res!1045151 (= lt!661315 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!661314 mask!2512) lt!661314 lt!661318 mask!2512)))))

(assert (=> b!1527121 (= lt!661314 (select (store (arr!48986 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1527121 (= lt!661318 (array!101520 (store (arr!48986 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49536 a!2804)))))

(declare-fun b!1527116 () Bool)

(declare-fun e!851173 () Bool)

(declare-fun e!851172 () Bool)

(assert (=> b!1527116 (= e!851173 e!851172)))

(declare-fun res!1045148 () Bool)

(assert (=> b!1527116 (=> res!1045148 e!851172)))

(assert (=> b!1527116 (= res!1045148 (or (not (= (select (arr!48986 a!2804) j!70) lt!661314)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48986 a!2804) index!487) (select (arr!48986 a!2804) j!70)) (not (= (select (arr!48986 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1045149 () Bool)

(assert (=> start!130106 (=> (not res!1045149) (not e!851169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130106 (= res!1045149 (validMask!0 mask!2512))))

(assert (=> start!130106 e!851169))

(assert (=> start!130106 true))

(declare-fun array_inv!38014 (array!101519) Bool)

(assert (=> start!130106 (array_inv!38014 a!2804)))

(declare-fun b!1527122 () Bool)

(declare-fun res!1045155 () Bool)

(assert (=> b!1527122 (=> (not res!1045155) (not e!851173))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101519 (_ BitVec 32)) SeekEntryResult!13151)

(assert (=> b!1527122 (= res!1045155 (= (seekEntry!0 (select (arr!48986 a!2804) j!70) a!2804 mask!2512) (Found!13151 j!70)))))

(declare-fun b!1527123 () Bool)

(declare-fun res!1045146 () Bool)

(assert (=> b!1527123 (=> (not res!1045146) (not e!851169))))

(assert (=> b!1527123 (= res!1045146 (validKeyInArray!0 (select (arr!48986 a!2804) i!961)))))

(declare-fun b!1527124 () Bool)

(assert (=> b!1527124 (= e!851172 e!851170)))

(declare-fun res!1045147 () Bool)

(assert (=> b!1527124 (=> (not res!1045147) (not e!851170))))

(assert (=> b!1527124 (= res!1045147 (= (seekEntryOrOpen!0 (select (arr!48986 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48986 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1527125 () Bool)

(assert (=> b!1527125 (= e!851167 (not true))))

(assert (=> b!1527125 e!851173))

(declare-fun res!1045158 () Bool)

(assert (=> b!1527125 (=> (not res!1045158) (not e!851173))))

(assert (=> b!1527125 (= res!1045158 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51086 0))(
  ( (Unit!51087) )
))
(declare-fun lt!661316 () Unit!51086)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101519 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51086)

(assert (=> b!1527125 (= lt!661316 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(assert (= (and start!130106 res!1045149) b!1527112))

(assert (= (and b!1527112 res!1045153) b!1527123))

(assert (= (and b!1527123 res!1045146) b!1527119))

(assert (= (and b!1527119 res!1045156) b!1527115))

(assert (= (and b!1527115 res!1045157) b!1527117))

(assert (= (and b!1527117 res!1045152) b!1527120))

(assert (= (and b!1527120 res!1045159) b!1527118))

(assert (= (and b!1527118 res!1045150) b!1527113))

(assert (= (and b!1527113 res!1045154) b!1527121))

(assert (= (and b!1527121 res!1045151) b!1527125))

(assert (= (and b!1527125 res!1045158) b!1527122))

(assert (= (and b!1527122 res!1045155) b!1527116))

(assert (= (and b!1527116 (not res!1045148)) b!1527124))

(assert (= (and b!1527124 res!1045147) b!1527114))

(declare-fun m!1409979 () Bool)

(assert (=> b!1527121 m!1409979))

(assert (=> b!1527121 m!1409979))

(declare-fun m!1409981 () Bool)

(assert (=> b!1527121 m!1409981))

(declare-fun m!1409983 () Bool)

(assert (=> b!1527121 m!1409983))

(declare-fun m!1409985 () Bool)

(assert (=> b!1527121 m!1409985))

(declare-fun m!1409987 () Bool)

(assert (=> b!1527123 m!1409987))

(assert (=> b!1527123 m!1409987))

(declare-fun m!1409989 () Bool)

(assert (=> b!1527123 m!1409989))

(declare-fun m!1409991 () Bool)

(assert (=> b!1527119 m!1409991))

(assert (=> b!1527119 m!1409991))

(declare-fun m!1409993 () Bool)

(assert (=> b!1527119 m!1409993))

(assert (=> b!1527122 m!1409991))

(assert (=> b!1527122 m!1409991))

(declare-fun m!1409995 () Bool)

(assert (=> b!1527122 m!1409995))

(declare-fun m!1409997 () Bool)

(assert (=> b!1527117 m!1409997))

(assert (=> b!1527113 m!1409991))

(assert (=> b!1527113 m!1409991))

(declare-fun m!1409999 () Bool)

(assert (=> b!1527113 m!1409999))

(declare-fun m!1410001 () Bool)

(assert (=> b!1527114 m!1410001))

(declare-fun m!1410003 () Bool)

(assert (=> b!1527114 m!1410003))

(declare-fun m!1410005 () Bool)

(assert (=> b!1527125 m!1410005))

(declare-fun m!1410007 () Bool)

(assert (=> b!1527125 m!1410007))

(declare-fun m!1410009 () Bool)

(assert (=> b!1527115 m!1410009))

(assert (=> b!1527116 m!1409991))

(declare-fun m!1410011 () Bool)

(assert (=> b!1527116 m!1410011))

(assert (=> b!1527124 m!1409991))

(assert (=> b!1527124 m!1409991))

(declare-fun m!1410013 () Bool)

(assert (=> b!1527124 m!1410013))

(assert (=> b!1527124 m!1409991))

(declare-fun m!1410015 () Bool)

(assert (=> b!1527124 m!1410015))

(declare-fun m!1410017 () Bool)

(assert (=> start!130106 m!1410017))

(declare-fun m!1410019 () Bool)

(assert (=> start!130106 m!1410019))

(assert (=> b!1527118 m!1409991))

(assert (=> b!1527118 m!1409991))

(declare-fun m!1410021 () Bool)

(assert (=> b!1527118 m!1410021))

(assert (=> b!1527118 m!1410021))

(assert (=> b!1527118 m!1409991))

(declare-fun m!1410023 () Bool)

(assert (=> b!1527118 m!1410023))

(push 1)

