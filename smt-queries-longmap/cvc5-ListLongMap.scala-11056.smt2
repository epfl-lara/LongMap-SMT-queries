; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129168 () Bool)

(assert start!129168)

(declare-fun b!1516081 () Bool)

(declare-fun res!1035991 () Bool)

(declare-fun e!846016 () Bool)

(assert (=> b!1516081 (=> (not res!1035991) (not e!846016))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101024 0))(
  ( (array!101025 (arr!48749 (Array (_ BitVec 32) (_ BitVec 64))) (size!49299 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101024)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516081 (= res!1035991 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49299 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49299 a!2804))))))

(declare-fun b!1516082 () Bool)

(declare-fun res!1035992 () Bool)

(assert (=> b!1516082 (=> (not res!1035992) (not e!846016))))

(declare-datatypes ((List!35232 0))(
  ( (Nil!35229) (Cons!35228 (h!36640 (_ BitVec 64)) (t!49926 List!35232)) )
))
(declare-fun arrayNoDuplicates!0 (array!101024 (_ BitVec 32) List!35232) Bool)

(assert (=> b!1516082 (= res!1035992 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35229))))

(declare-fun b!1516083 () Bool)

(declare-fun res!1035988 () Bool)

(declare-fun e!846013 () Bool)

(assert (=> b!1516083 (=> (not res!1035988) (not e!846013))))

(declare-fun i!961 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12920 0))(
  ( (MissingZero!12920 (index!54075 (_ BitVec 32))) (Found!12920 (index!54076 (_ BitVec 32))) (Intermediate!12920 (undefined!13732 Bool) (index!54077 (_ BitVec 32)) (x!135774 (_ BitVec 32))) (Undefined!12920) (MissingVacant!12920 (index!54078 (_ BitVec 32))) )
))
(declare-fun lt!657295 () SeekEntryResult!12920)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101024 (_ BitVec 32)) SeekEntryResult!12920)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516083 (= res!1035988 (= lt!657295 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48749 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48749 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101025 (store (arr!48749 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49299 a!2804)) mask!2512)))))

(declare-fun b!1516084 () Bool)

(assert (=> b!1516084 (= e!846013 (not (or (not (= (select (arr!48749 a!2804) j!70) (select (store (arr!48749 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(declare-fun e!846014 () Bool)

(assert (=> b!1516084 e!846014))

(declare-fun res!1035994 () Bool)

(assert (=> b!1516084 (=> (not res!1035994) (not e!846014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101024 (_ BitVec 32)) Bool)

(assert (=> b!1516084 (= res!1035994 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50708 0))(
  ( (Unit!50709) )
))
(declare-fun lt!657294 () Unit!50708)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101024 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50708)

(assert (=> b!1516084 (= lt!657294 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516085 () Bool)

(assert (=> b!1516085 (= e!846016 e!846013)))

(declare-fun res!1035987 () Bool)

(assert (=> b!1516085 (=> (not res!1035987) (not e!846013))))

(declare-fun lt!657293 () SeekEntryResult!12920)

(assert (=> b!1516085 (= res!1035987 (= lt!657295 lt!657293))))

(assert (=> b!1516085 (= lt!657293 (Intermediate!12920 false resIndex!21 resX!21))))

(assert (=> b!1516085 (= lt!657295 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48749 a!2804) j!70) mask!2512) (select (arr!48749 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1035990 () Bool)

(assert (=> start!129168 (=> (not res!1035990) (not e!846016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129168 (= res!1035990 (validMask!0 mask!2512))))

(assert (=> start!129168 e!846016))

(assert (=> start!129168 true))

(declare-fun array_inv!37777 (array!101024) Bool)

(assert (=> start!129168 (array_inv!37777 a!2804)))

(declare-fun b!1516086 () Bool)

(declare-fun res!1035986 () Bool)

(assert (=> b!1516086 (=> (not res!1035986) (not e!846016))))

(assert (=> b!1516086 (= res!1035986 (and (= (size!49299 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49299 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49299 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1516087 () Bool)

(declare-fun res!1035993 () Bool)

(assert (=> b!1516087 (=> (not res!1035993) (not e!846016))))

(assert (=> b!1516087 (= res!1035993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516088 () Bool)

(declare-fun res!1035989 () Bool)

(assert (=> b!1516088 (=> (not res!1035989) (not e!846016))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516088 (= res!1035989 (validKeyInArray!0 (select (arr!48749 a!2804) j!70)))))

(declare-fun b!1516089 () Bool)

(declare-fun res!1035984 () Bool)

(assert (=> b!1516089 (=> (not res!1035984) (not e!846016))))

(assert (=> b!1516089 (= res!1035984 (validKeyInArray!0 (select (arr!48749 a!2804) i!961)))))

(declare-fun b!1516090 () Bool)

(declare-fun res!1035985 () Bool)

(assert (=> b!1516090 (=> (not res!1035985) (not e!846013))))

(assert (=> b!1516090 (= res!1035985 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48749 a!2804) j!70) a!2804 mask!2512) lt!657293))))

(declare-fun b!1516091 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101024 (_ BitVec 32)) SeekEntryResult!12920)

(assert (=> b!1516091 (= e!846014 (= (seekEntry!0 (select (arr!48749 a!2804) j!70) a!2804 mask!2512) (Found!12920 j!70)))))

(assert (= (and start!129168 res!1035990) b!1516086))

(assert (= (and b!1516086 res!1035986) b!1516089))

(assert (= (and b!1516089 res!1035984) b!1516088))

(assert (= (and b!1516088 res!1035989) b!1516087))

(assert (= (and b!1516087 res!1035993) b!1516082))

(assert (= (and b!1516082 res!1035992) b!1516081))

(assert (= (and b!1516081 res!1035991) b!1516085))

(assert (= (and b!1516085 res!1035987) b!1516090))

(assert (= (and b!1516090 res!1035985) b!1516083))

(assert (= (and b!1516083 res!1035988) b!1516084))

(assert (= (and b!1516084 res!1035994) b!1516091))

(declare-fun m!1399321 () Bool)

(assert (=> b!1516087 m!1399321))

(declare-fun m!1399323 () Bool)

(assert (=> b!1516088 m!1399323))

(assert (=> b!1516088 m!1399323))

(declare-fun m!1399325 () Bool)

(assert (=> b!1516088 m!1399325))

(assert (=> b!1516085 m!1399323))

(assert (=> b!1516085 m!1399323))

(declare-fun m!1399327 () Bool)

(assert (=> b!1516085 m!1399327))

(assert (=> b!1516085 m!1399327))

(assert (=> b!1516085 m!1399323))

(declare-fun m!1399329 () Bool)

(assert (=> b!1516085 m!1399329))

(assert (=> b!1516091 m!1399323))

(assert (=> b!1516091 m!1399323))

(declare-fun m!1399331 () Bool)

(assert (=> b!1516091 m!1399331))

(assert (=> b!1516084 m!1399323))

(declare-fun m!1399333 () Bool)

(assert (=> b!1516084 m!1399333))

(declare-fun m!1399335 () Bool)

(assert (=> b!1516084 m!1399335))

(declare-fun m!1399337 () Bool)

(assert (=> b!1516084 m!1399337))

(declare-fun m!1399339 () Bool)

(assert (=> b!1516084 m!1399339))

(declare-fun m!1399341 () Bool)

(assert (=> b!1516082 m!1399341))

(assert (=> b!1516083 m!1399335))

(assert (=> b!1516083 m!1399337))

(assert (=> b!1516083 m!1399337))

(declare-fun m!1399343 () Bool)

(assert (=> b!1516083 m!1399343))

(assert (=> b!1516083 m!1399343))

(assert (=> b!1516083 m!1399337))

(declare-fun m!1399345 () Bool)

(assert (=> b!1516083 m!1399345))

(declare-fun m!1399347 () Bool)

(assert (=> start!129168 m!1399347))

(declare-fun m!1399349 () Bool)

(assert (=> start!129168 m!1399349))

(assert (=> b!1516090 m!1399323))

(assert (=> b!1516090 m!1399323))

(declare-fun m!1399351 () Bool)

(assert (=> b!1516090 m!1399351))

(declare-fun m!1399353 () Bool)

(assert (=> b!1516089 m!1399353))

(assert (=> b!1516089 m!1399353))

(declare-fun m!1399355 () Bool)

(assert (=> b!1516089 m!1399355))

(push 1)

