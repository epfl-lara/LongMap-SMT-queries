; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129216 () Bool)

(assert start!129216)

(declare-fun b!1516967 () Bool)

(declare-fun res!1036872 () Bool)

(declare-fun e!846397 () Bool)

(assert (=> b!1516967 (=> (not res!1036872) (not e!846397))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101072 0))(
  ( (array!101073 (arr!48773 (Array (_ BitVec 32) (_ BitVec 64))) (size!49323 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101072)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516967 (= res!1036872 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49323 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49323 a!2804))))))

(declare-fun b!1516968 () Bool)

(declare-fun res!1036879 () Bool)

(assert (=> b!1516968 (=> (not res!1036879) (not e!846397))))

(declare-datatypes ((List!35256 0))(
  ( (Nil!35253) (Cons!35252 (h!36664 (_ BitVec 64)) (t!49950 List!35256)) )
))
(declare-fun arrayNoDuplicates!0 (array!101072 (_ BitVec 32) List!35256) Bool)

(assert (=> b!1516968 (= res!1036879 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35253))))

(declare-fun b!1516969 () Bool)

(declare-fun e!846396 () Bool)

(declare-fun e!846400 () Bool)

(assert (=> b!1516969 (= e!846396 e!846400)))

(declare-fun res!1036871 () Bool)

(assert (=> b!1516969 (=> res!1036871 e!846400)))

(declare-fun lt!657606 () (_ BitVec 32))

(assert (=> b!1516969 (= res!1036871 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!657606 #b00000000000000000000000000000000) (bvsge lt!657606 (size!49323 a!2804))))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516969 (= lt!657606 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1516970 () Bool)

(declare-fun res!1036882 () Bool)

(assert (=> b!1516970 (=> (not res!1036882) (not e!846397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101072 (_ BitVec 32)) Bool)

(assert (=> b!1516970 (= res!1036882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516971 () Bool)

(declare-fun res!1036874 () Bool)

(assert (=> b!1516971 (=> (not res!1036874) (not e!846397))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516971 (= res!1036874 (validKeyInArray!0 (select (arr!48773 a!2804) i!961)))))

(declare-fun b!1516972 () Bool)

(declare-fun res!1036881 () Bool)

(declare-fun e!846395 () Bool)

(assert (=> b!1516972 (=> (not res!1036881) (not e!846395))))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12944 0))(
  ( (MissingZero!12944 (index!54171 (_ BitVec 32))) (Found!12944 (index!54172 (_ BitVec 32))) (Intermediate!12944 (undefined!13756 Bool) (index!54173 (_ BitVec 32)) (x!135862 (_ BitVec 32))) (Undefined!12944) (MissingVacant!12944 (index!54174 (_ BitVec 32))) )
))
(declare-fun lt!657605 () SeekEntryResult!12944)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101072 (_ BitVec 32)) SeekEntryResult!12944)

(assert (=> b!1516972 (= res!1036881 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48773 a!2804) j!70) a!2804 mask!2512) lt!657605))))

(declare-fun res!1036875 () Bool)

(assert (=> start!129216 (=> (not res!1036875) (not e!846397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129216 (= res!1036875 (validMask!0 mask!2512))))

(assert (=> start!129216 e!846397))

(assert (=> start!129216 true))

(declare-fun array_inv!37801 (array!101072) Bool)

(assert (=> start!129216 (array_inv!37801 a!2804)))

(declare-fun b!1516973 () Bool)

(declare-fun res!1036870 () Bool)

(assert (=> b!1516973 (=> (not res!1036870) (not e!846395))))

(declare-fun lt!657603 () SeekEntryResult!12944)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516973 (= res!1036870 (= lt!657603 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48773 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48773 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101073 (store (arr!48773 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49323 a!2804)) mask!2512)))))

(declare-fun b!1516974 () Bool)

(assert (=> b!1516974 (= e!846397 e!846395)))

(declare-fun res!1036878 () Bool)

(assert (=> b!1516974 (=> (not res!1036878) (not e!846395))))

(assert (=> b!1516974 (= res!1036878 (= lt!657603 lt!657605))))

(assert (=> b!1516974 (= lt!657605 (Intermediate!12944 false resIndex!21 resX!21))))

(assert (=> b!1516974 (= lt!657603 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48773 a!2804) j!70) mask!2512) (select (arr!48773 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516975 () Bool)

(declare-fun res!1036873 () Bool)

(assert (=> b!1516975 (=> (not res!1036873) (not e!846397))))

(assert (=> b!1516975 (= res!1036873 (validKeyInArray!0 (select (arr!48773 a!2804) j!70)))))

(declare-fun b!1516976 () Bool)

(assert (=> b!1516976 (= e!846395 (not e!846396))))

(declare-fun res!1036877 () Bool)

(assert (=> b!1516976 (=> res!1036877 e!846396)))

(assert (=> b!1516976 (= res!1036877 (or (not (= (select (arr!48773 a!2804) j!70) (select (store (arr!48773 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!846398 () Bool)

(assert (=> b!1516976 e!846398))

(declare-fun res!1036876 () Bool)

(assert (=> b!1516976 (=> (not res!1036876) (not e!846398))))

(assert (=> b!1516976 (= res!1036876 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50756 0))(
  ( (Unit!50757) )
))
(declare-fun lt!657604 () Unit!50756)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101072 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50756)

(assert (=> b!1516976 (= lt!657604 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516977 () Bool)

(assert (=> b!1516977 (= e!846400 true)))

(declare-fun lt!657607 () SeekEntryResult!12944)

(assert (=> b!1516977 (= lt!657607 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!657606 (select (arr!48773 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1516978 () Bool)

(declare-fun res!1036880 () Bool)

(assert (=> b!1516978 (=> (not res!1036880) (not e!846397))))

(assert (=> b!1516978 (= res!1036880 (and (= (size!49323 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49323 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49323 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516979 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101072 (_ BitVec 32)) SeekEntryResult!12944)

(assert (=> b!1516979 (= e!846398 (= (seekEntry!0 (select (arr!48773 a!2804) j!70) a!2804 mask!2512) (Found!12944 j!70)))))

(assert (= (and start!129216 res!1036875) b!1516978))

(assert (= (and b!1516978 res!1036880) b!1516971))

(assert (= (and b!1516971 res!1036874) b!1516975))

(assert (= (and b!1516975 res!1036873) b!1516970))

(assert (= (and b!1516970 res!1036882) b!1516968))

(assert (= (and b!1516968 res!1036879) b!1516967))

(assert (= (and b!1516967 res!1036872) b!1516974))

(assert (= (and b!1516974 res!1036878) b!1516972))

(assert (= (and b!1516972 res!1036881) b!1516973))

(assert (= (and b!1516973 res!1036870) b!1516976))

(assert (= (and b!1516976 res!1036876) b!1516979))

(assert (= (and b!1516976 (not res!1036877)) b!1516969))

(assert (= (and b!1516969 (not res!1036871)) b!1516977))

(declare-fun m!1400245 () Bool)

(assert (=> b!1516969 m!1400245))

(declare-fun m!1400247 () Bool)

(assert (=> b!1516979 m!1400247))

(assert (=> b!1516979 m!1400247))

(declare-fun m!1400249 () Bool)

(assert (=> b!1516979 m!1400249))

(declare-fun m!1400251 () Bool)

(assert (=> b!1516971 m!1400251))

(assert (=> b!1516971 m!1400251))

(declare-fun m!1400253 () Bool)

(assert (=> b!1516971 m!1400253))

(assert (=> b!1516975 m!1400247))

(assert (=> b!1516975 m!1400247))

(declare-fun m!1400255 () Bool)

(assert (=> b!1516975 m!1400255))

(declare-fun m!1400257 () Bool)

(assert (=> b!1516970 m!1400257))

(declare-fun m!1400259 () Bool)

(assert (=> b!1516968 m!1400259))

(assert (=> b!1516976 m!1400247))

(declare-fun m!1400261 () Bool)

(assert (=> b!1516976 m!1400261))

(declare-fun m!1400263 () Bool)

(assert (=> b!1516976 m!1400263))

(declare-fun m!1400265 () Bool)

(assert (=> b!1516976 m!1400265))

(declare-fun m!1400267 () Bool)

(assert (=> b!1516976 m!1400267))

(assert (=> b!1516974 m!1400247))

(assert (=> b!1516974 m!1400247))

(declare-fun m!1400269 () Bool)

(assert (=> b!1516974 m!1400269))

(assert (=> b!1516974 m!1400269))

(assert (=> b!1516974 m!1400247))

(declare-fun m!1400271 () Bool)

(assert (=> b!1516974 m!1400271))

(assert (=> b!1516973 m!1400263))

(assert (=> b!1516973 m!1400265))

(assert (=> b!1516973 m!1400265))

(declare-fun m!1400273 () Bool)

(assert (=> b!1516973 m!1400273))

(assert (=> b!1516973 m!1400273))

(assert (=> b!1516973 m!1400265))

(declare-fun m!1400275 () Bool)

(assert (=> b!1516973 m!1400275))

(declare-fun m!1400277 () Bool)

(assert (=> start!129216 m!1400277))

(declare-fun m!1400279 () Bool)

(assert (=> start!129216 m!1400279))

(assert (=> b!1516977 m!1400247))

(assert (=> b!1516977 m!1400247))

(declare-fun m!1400281 () Bool)

(assert (=> b!1516977 m!1400281))

(assert (=> b!1516972 m!1400247))

(assert (=> b!1516972 m!1400247))

(declare-fun m!1400283 () Bool)

(assert (=> b!1516972 m!1400283))

(push 1)

