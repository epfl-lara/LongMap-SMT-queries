; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129140 () Bool)

(assert start!129140)

(declare-fun b!1516159 () Bool)

(declare-fun e!845966 () Bool)

(declare-fun e!845970 () Bool)

(assert (=> b!1516159 (= e!845966 (not e!845970))))

(declare-fun res!1036272 () Bool)

(assert (=> b!1516159 (=> res!1036272 e!845970)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!100996 0))(
  ( (array!100997 (arr!48736 (Array (_ BitVec 32) (_ BitVec 64))) (size!49288 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100996)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1516159 (= res!1036272 (or (not (= (select (arr!48736 a!2804) j!70) (select (store (arr!48736 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!845965 () Bool)

(assert (=> b!1516159 e!845965))

(declare-fun res!1036279 () Bool)

(assert (=> b!1516159 (=> (not res!1036279) (not e!845965))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100996 (_ BitVec 32)) Bool)

(assert (=> b!1516159 (= res!1036279 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50567 0))(
  ( (Unit!50568) )
))
(declare-fun lt!657128 () Unit!50567)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!100996 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50567)

(assert (=> b!1516159 (= lt!657128 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516160 () Bool)

(declare-fun res!1036269 () Bool)

(declare-fun e!845968 () Bool)

(assert (=> b!1516160 (=> (not res!1036269) (not e!845968))))

(declare-datatypes ((List!35297 0))(
  ( (Nil!35294) (Cons!35293 (h!36706 (_ BitVec 64)) (t!49983 List!35297)) )
))
(declare-fun arrayNoDuplicates!0 (array!100996 (_ BitVec 32) List!35297) Bool)

(assert (=> b!1516160 (= res!1036269 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35294))))

(declare-fun b!1516161 () Bool)

(declare-fun res!1036274 () Bool)

(assert (=> b!1516161 (=> (not res!1036274) (not e!845968))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516161 (= res!1036274 (validKeyInArray!0 (select (arr!48736 a!2804) i!961)))))

(declare-fun b!1516162 () Bool)

(declare-fun e!845967 () Bool)

(assert (=> b!1516162 (= e!845970 e!845967)))

(declare-fun res!1036278 () Bool)

(assert (=> b!1516162 (=> res!1036278 e!845967)))

(declare-fun lt!657129 () (_ BitVec 32))

(assert (=> b!1516162 (= res!1036278 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657129 #b00000000000000000000000000000000) (bvsge lt!657129 (size!49288 a!2804))))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516162 (= lt!657129 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1516163 () Bool)

(assert (=> b!1516163 (= e!845968 e!845966)))

(declare-fun res!1036277 () Bool)

(assert (=> b!1516163 (=> (not res!1036277) (not e!845966))))

(declare-datatypes ((SeekEntryResult!12930 0))(
  ( (MissingZero!12930 (index!54115 (_ BitVec 32))) (Found!12930 (index!54116 (_ BitVec 32))) (Intermediate!12930 (undefined!13742 Bool) (index!54117 (_ BitVec 32)) (x!135810 (_ BitVec 32))) (Undefined!12930) (MissingVacant!12930 (index!54118 (_ BitVec 32))) )
))
(declare-fun lt!657132 () SeekEntryResult!12930)

(declare-fun lt!657131 () SeekEntryResult!12930)

(assert (=> b!1516163 (= res!1036277 (= lt!657132 lt!657131))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516163 (= lt!657131 (Intermediate!12930 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100996 (_ BitVec 32)) SeekEntryResult!12930)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516163 (= lt!657132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48736 a!2804) j!70) mask!2512) (select (arr!48736 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516164 () Bool)

(declare-fun res!1036273 () Bool)

(assert (=> b!1516164 (=> (not res!1036273) (not e!845968))))

(assert (=> b!1516164 (= res!1036273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516165 () Bool)

(declare-fun res!1036268 () Bool)

(assert (=> b!1516165 (=> (not res!1036268) (not e!845968))))

(assert (=> b!1516165 (= res!1036268 (validKeyInArray!0 (select (arr!48736 a!2804) j!70)))))

(declare-fun res!1036275 () Bool)

(assert (=> start!129140 (=> (not res!1036275) (not e!845968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129140 (= res!1036275 (validMask!0 mask!2512))))

(assert (=> start!129140 e!845968))

(assert (=> start!129140 true))

(declare-fun array_inv!37969 (array!100996) Bool)

(assert (=> start!129140 (array_inv!37969 a!2804)))

(declare-fun b!1516166 () Bool)

(declare-fun res!1036280 () Bool)

(assert (=> b!1516166 (=> (not res!1036280) (not e!845968))))

(assert (=> b!1516166 (= res!1036280 (and (= (size!49288 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49288 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49288 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516167 () Bool)

(declare-fun res!1036276 () Bool)

(assert (=> b!1516167 (=> (not res!1036276) (not e!845966))))

(assert (=> b!1516167 (= res!1036276 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48736 a!2804) j!70) a!2804 mask!2512) lt!657131))))

(declare-fun b!1516168 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!100996 (_ BitVec 32)) SeekEntryResult!12930)

(assert (=> b!1516168 (= e!845965 (= (seekEntry!0 (select (arr!48736 a!2804) j!70) a!2804 mask!2512) (Found!12930 j!70)))))

(declare-fun b!1516169 () Bool)

(assert (=> b!1516169 (= e!845967 true)))

(declare-fun lt!657130 () SeekEntryResult!12930)

(assert (=> b!1516169 (= lt!657130 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657129 (select (arr!48736 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516170 () Bool)

(declare-fun res!1036271 () Bool)

(assert (=> b!1516170 (=> (not res!1036271) (not e!845966))))

(assert (=> b!1516170 (= res!1036271 (= lt!657132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48736 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48736 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100997 (store (arr!48736 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49288 a!2804)) mask!2512)))))

(declare-fun b!1516171 () Bool)

(declare-fun res!1036270 () Bool)

(assert (=> b!1516171 (=> (not res!1036270) (not e!845968))))

(assert (=> b!1516171 (= res!1036270 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49288 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49288 a!2804))))))

(assert (= (and start!129140 res!1036275) b!1516166))

(assert (= (and b!1516166 res!1036280) b!1516161))

(assert (= (and b!1516161 res!1036274) b!1516165))

(assert (= (and b!1516165 res!1036268) b!1516164))

(assert (= (and b!1516164 res!1036273) b!1516160))

(assert (= (and b!1516160 res!1036269) b!1516171))

(assert (= (and b!1516171 res!1036270) b!1516163))

(assert (= (and b!1516163 res!1036277) b!1516167))

(assert (= (and b!1516167 res!1036276) b!1516170))

(assert (= (and b!1516170 res!1036271) b!1516159))

(assert (= (and b!1516159 res!1036279) b!1516168))

(assert (= (and b!1516159 (not res!1036272)) b!1516162))

(assert (= (and b!1516162 (not res!1036278)) b!1516169))

(declare-fun m!1398857 () Bool)

(assert (=> b!1516165 m!1398857))

(assert (=> b!1516165 m!1398857))

(declare-fun m!1398859 () Bool)

(assert (=> b!1516165 m!1398859))

(declare-fun m!1398861 () Bool)

(assert (=> start!129140 m!1398861))

(declare-fun m!1398863 () Bool)

(assert (=> start!129140 m!1398863))

(assert (=> b!1516167 m!1398857))

(assert (=> b!1516167 m!1398857))

(declare-fun m!1398865 () Bool)

(assert (=> b!1516167 m!1398865))

(declare-fun m!1398867 () Bool)

(assert (=> b!1516170 m!1398867))

(declare-fun m!1398869 () Bool)

(assert (=> b!1516170 m!1398869))

(assert (=> b!1516170 m!1398869))

(declare-fun m!1398871 () Bool)

(assert (=> b!1516170 m!1398871))

(assert (=> b!1516170 m!1398871))

(assert (=> b!1516170 m!1398869))

(declare-fun m!1398873 () Bool)

(assert (=> b!1516170 m!1398873))

(declare-fun m!1398875 () Bool)

(assert (=> b!1516160 m!1398875))

(assert (=> b!1516163 m!1398857))

(assert (=> b!1516163 m!1398857))

(declare-fun m!1398877 () Bool)

(assert (=> b!1516163 m!1398877))

(assert (=> b!1516163 m!1398877))

(assert (=> b!1516163 m!1398857))

(declare-fun m!1398879 () Bool)

(assert (=> b!1516163 m!1398879))

(declare-fun m!1398881 () Bool)

(assert (=> b!1516161 m!1398881))

(assert (=> b!1516161 m!1398881))

(declare-fun m!1398883 () Bool)

(assert (=> b!1516161 m!1398883))

(declare-fun m!1398885 () Bool)

(assert (=> b!1516164 m!1398885))

(declare-fun m!1398887 () Bool)

(assert (=> b!1516162 m!1398887))

(assert (=> b!1516159 m!1398857))

(declare-fun m!1398889 () Bool)

(assert (=> b!1516159 m!1398889))

(assert (=> b!1516159 m!1398867))

(assert (=> b!1516159 m!1398869))

(declare-fun m!1398891 () Bool)

(assert (=> b!1516159 m!1398891))

(assert (=> b!1516168 m!1398857))

(assert (=> b!1516168 m!1398857))

(declare-fun m!1398893 () Bool)

(assert (=> b!1516168 m!1398893))

(assert (=> b!1516169 m!1398857))

(assert (=> b!1516169 m!1398857))

(declare-fun m!1398895 () Bool)

(assert (=> b!1516169 m!1398895))

(check-sat (not b!1516161) (not b!1516159) (not b!1516170) (not b!1516163) (not b!1516164) (not b!1516160) (not b!1516169) (not b!1516167) (not b!1516162) (not start!129140) (not b!1516168) (not b!1516165))
(check-sat)
