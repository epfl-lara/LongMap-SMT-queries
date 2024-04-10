; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124772 () Bool)

(assert start!124772)

(declare-fun b!1447230 () Bool)

(declare-fun res!978913 () Bool)

(declare-fun e!815084 () Bool)

(assert (=> b!1447230 (=> (not res!978913) (not e!815084))))

(declare-datatypes ((array!98220 0))(
  ( (array!98221 (arr!47398 (Array (_ BitVec 32) (_ BitVec 64))) (size!47948 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98220)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98220 (_ BitVec 32)) Bool)

(assert (=> b!1447230 (= res!978913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1447231 () Bool)

(declare-fun res!978919 () Bool)

(declare-fun e!815075 () Bool)

(assert (=> b!1447231 (=> (not res!978919) (not e!815075))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11650 0))(
  ( (MissingZero!11650 (index!48992 (_ BitVec 32))) (Found!11650 (index!48993 (_ BitVec 32))) (Intermediate!11650 (undefined!12462 Bool) (index!48994 (_ BitVec 32)) (x!130667 (_ BitVec 32))) (Undefined!11650) (MissingVacant!11650 (index!48995 (_ BitVec 32))) )
))
(declare-fun lt!635085 () SeekEntryResult!11650)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98220 (_ BitVec 32)) SeekEntryResult!11650)

(assert (=> b!1447231 (= res!978919 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47398 a!2862) j!93) a!2862 mask!2687) lt!635085))))

(declare-fun lt!635091 () (_ BitVec 64))

(declare-fun lt!635090 () array!98220)

(declare-fun lt!635087 () SeekEntryResult!11650)

(declare-fun e!815079 () Bool)

(declare-fun b!1447232 () Bool)

(assert (=> b!1447232 (= e!815079 (= lt!635087 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635091 lt!635090 mask!2687)))))

(declare-fun res!978918 () Bool)

(assert (=> start!124772 (=> (not res!978918) (not e!815084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124772 (= res!978918 (validMask!0 mask!2687))))

(assert (=> start!124772 e!815084))

(assert (=> start!124772 true))

(declare-fun array_inv!36426 (array!98220) Bool)

(assert (=> start!124772 (array_inv!36426 a!2862)))

(declare-fun b!1447233 () Bool)

(declare-fun e!815078 () Bool)

(assert (=> b!1447233 (= e!815075 e!815078)))

(declare-fun res!978915 () Bool)

(assert (=> b!1447233 (=> (not res!978915) (not e!815078))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1447233 (= res!978915 (= lt!635087 (Intermediate!11650 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1447233 (= lt!635087 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635091 mask!2687) lt!635091 lt!635090 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1447233 (= lt!635091 (select (store (arr!47398 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1447234 () Bool)

(declare-fun e!815081 () Bool)

(declare-fun e!815080 () Bool)

(assert (=> b!1447234 (= e!815081 e!815080)))

(declare-fun res!978908 () Bool)

(assert (=> b!1447234 (=> res!978908 e!815080)))

(assert (=> b!1447234 (= res!978908 (or (and (= (select (arr!47398 a!2862) index!646) (select (store (arr!47398 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47398 a!2862) index!646) (select (arr!47398 a!2862) j!93))) (not (= (select (arr!47398 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1447235 () Bool)

(declare-fun e!815082 () Bool)

(assert (=> b!1447235 (= e!815082 true)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!635086 () SeekEntryResult!11650)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98220 (_ BitVec 32)) SeekEntryResult!11650)

(assert (=> b!1447235 (= lt!635086 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47398 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1447236 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98220 (_ BitVec 32)) SeekEntryResult!11650)

(assert (=> b!1447236 (= e!815079 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635091 lt!635090 mask!2687) (seekEntryOrOpen!0 lt!635091 lt!635090 mask!2687)))))

(declare-fun b!1447237 () Bool)

(assert (=> b!1447237 (= e!815078 (not e!815082))))

(declare-fun res!978914 () Bool)

(assert (=> b!1447237 (=> res!978914 e!815082)))

(assert (=> b!1447237 (= res!978914 (or (and (= (select (arr!47398 a!2862) index!646) (select (store (arr!47398 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47398 a!2862) index!646) (select (arr!47398 a!2862) j!93))) (not (= (select (arr!47398 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47398 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1447237 e!815081))

(declare-fun res!978916 () Bool)

(assert (=> b!1447237 (=> (not res!978916) (not e!815081))))

(declare-fun lt!635088 () SeekEntryResult!11650)

(assert (=> b!1447237 (= res!978916 (and (= lt!635088 (Found!11650 j!93)) (or (= (select (arr!47398 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47398 a!2862) intermediateBeforeIndex!19) (select (arr!47398 a!2862) j!93)))))))

(assert (=> b!1447237 (= lt!635088 (seekEntryOrOpen!0 (select (arr!47398 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1447237 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48796 0))(
  ( (Unit!48797) )
))
(declare-fun lt!635089 () Unit!48796)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98220 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48796)

(assert (=> b!1447237 (= lt!635089 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1447238 () Bool)

(declare-fun res!978910 () Bool)

(assert (=> b!1447238 (=> (not res!978910) (not e!815078))))

(assert (=> b!1447238 (= res!978910 e!815079)))

(declare-fun c!133674 () Bool)

(assert (=> b!1447238 (= c!133674 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1447239 () Bool)

(declare-fun e!815083 () Bool)

(assert (=> b!1447239 (= e!815080 e!815083)))

(declare-fun res!978905 () Bool)

(assert (=> b!1447239 (=> (not res!978905) (not e!815083))))

(assert (=> b!1447239 (= res!978905 (= lt!635088 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47398 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1447240 () Bool)

(declare-fun res!978903 () Bool)

(assert (=> b!1447240 (=> (not res!978903) (not e!815084))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1447240 (= res!978903 (validKeyInArray!0 (select (arr!47398 a!2862) j!93)))))

(declare-fun b!1447241 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1447241 (= e!815083 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1447242 () Bool)

(declare-fun res!978917 () Bool)

(assert (=> b!1447242 (=> (not res!978917) (not e!815084))))

(assert (=> b!1447242 (= res!978917 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47948 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47948 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47948 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1447243 () Bool)

(declare-fun res!978912 () Bool)

(assert (=> b!1447243 (=> (not res!978912) (not e!815084))))

(declare-datatypes ((List!33899 0))(
  ( (Nil!33896) (Cons!33895 (h!35245 (_ BitVec 64)) (t!48593 List!33899)) )
))
(declare-fun arrayNoDuplicates!0 (array!98220 (_ BitVec 32) List!33899) Bool)

(assert (=> b!1447243 (= res!978912 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33896))))

(declare-fun b!1447244 () Bool)

(declare-fun res!978911 () Bool)

(assert (=> b!1447244 (=> (not res!978911) (not e!815078))))

(assert (=> b!1447244 (= res!978911 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1447245 () Bool)

(declare-fun e!815076 () Bool)

(assert (=> b!1447245 (= e!815076 e!815075)))

(declare-fun res!978906 () Bool)

(assert (=> b!1447245 (=> (not res!978906) (not e!815075))))

(assert (=> b!1447245 (= res!978906 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47398 a!2862) j!93) mask!2687) (select (arr!47398 a!2862) j!93) a!2862 mask!2687) lt!635085))))

(assert (=> b!1447245 (= lt!635085 (Intermediate!11650 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1447246 () Bool)

(declare-fun res!978904 () Bool)

(assert (=> b!1447246 (=> (not res!978904) (not e!815084))))

(assert (=> b!1447246 (= res!978904 (and (= (size!47948 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47948 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47948 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1447247 () Bool)

(assert (=> b!1447247 (= e!815084 e!815076)))

(declare-fun res!978909 () Bool)

(assert (=> b!1447247 (=> (not res!978909) (not e!815076))))

(assert (=> b!1447247 (= res!978909 (= (select (store (arr!47398 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1447247 (= lt!635090 (array!98221 (store (arr!47398 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47948 a!2862)))))

(declare-fun b!1447248 () Bool)

(declare-fun res!978907 () Bool)

(assert (=> b!1447248 (=> (not res!978907) (not e!815084))))

(assert (=> b!1447248 (= res!978907 (validKeyInArray!0 (select (arr!47398 a!2862) i!1006)))))

(assert (= (and start!124772 res!978918) b!1447246))

(assert (= (and b!1447246 res!978904) b!1447248))

(assert (= (and b!1447248 res!978907) b!1447240))

(assert (= (and b!1447240 res!978903) b!1447230))

(assert (= (and b!1447230 res!978913) b!1447243))

(assert (= (and b!1447243 res!978912) b!1447242))

(assert (= (and b!1447242 res!978917) b!1447247))

(assert (= (and b!1447247 res!978909) b!1447245))

(assert (= (and b!1447245 res!978906) b!1447231))

(assert (= (and b!1447231 res!978919) b!1447233))

(assert (= (and b!1447233 res!978915) b!1447238))

(assert (= (and b!1447238 c!133674) b!1447232))

(assert (= (and b!1447238 (not c!133674)) b!1447236))

(assert (= (and b!1447238 res!978910) b!1447244))

(assert (= (and b!1447244 res!978911) b!1447237))

(assert (= (and b!1447237 res!978916) b!1447234))

(assert (= (and b!1447234 (not res!978908)) b!1447239))

(assert (= (and b!1447239 res!978905) b!1447241))

(assert (= (and b!1447237 (not res!978914)) b!1447235))

(declare-fun m!1336057 () Bool)

(assert (=> start!124772 m!1336057))

(declare-fun m!1336059 () Bool)

(assert (=> start!124772 m!1336059))

(declare-fun m!1336061 () Bool)

(assert (=> b!1447233 m!1336061))

(assert (=> b!1447233 m!1336061))

(declare-fun m!1336063 () Bool)

(assert (=> b!1447233 m!1336063))

(declare-fun m!1336065 () Bool)

(assert (=> b!1447233 m!1336065))

(declare-fun m!1336067 () Bool)

(assert (=> b!1447233 m!1336067))

(declare-fun m!1336069 () Bool)

(assert (=> b!1447236 m!1336069))

(declare-fun m!1336071 () Bool)

(assert (=> b!1447236 m!1336071))

(declare-fun m!1336073 () Bool)

(assert (=> b!1447248 m!1336073))

(assert (=> b!1447248 m!1336073))

(declare-fun m!1336075 () Bool)

(assert (=> b!1447248 m!1336075))

(declare-fun m!1336077 () Bool)

(assert (=> b!1447231 m!1336077))

(assert (=> b!1447231 m!1336077))

(declare-fun m!1336079 () Bool)

(assert (=> b!1447231 m!1336079))

(assert (=> b!1447235 m!1336077))

(assert (=> b!1447235 m!1336077))

(declare-fun m!1336081 () Bool)

(assert (=> b!1447235 m!1336081))

(declare-fun m!1336083 () Bool)

(assert (=> b!1447237 m!1336083))

(assert (=> b!1447237 m!1336065))

(declare-fun m!1336085 () Bool)

(assert (=> b!1447237 m!1336085))

(declare-fun m!1336087 () Bool)

(assert (=> b!1447237 m!1336087))

(declare-fun m!1336089 () Bool)

(assert (=> b!1447237 m!1336089))

(assert (=> b!1447237 m!1336077))

(declare-fun m!1336091 () Bool)

(assert (=> b!1447237 m!1336091))

(declare-fun m!1336093 () Bool)

(assert (=> b!1447237 m!1336093))

(assert (=> b!1447237 m!1336077))

(assert (=> b!1447240 m!1336077))

(assert (=> b!1447240 m!1336077))

(declare-fun m!1336095 () Bool)

(assert (=> b!1447240 m!1336095))

(declare-fun m!1336097 () Bool)

(assert (=> b!1447230 m!1336097))

(declare-fun m!1336099 () Bool)

(assert (=> b!1447243 m!1336099))

(assert (=> b!1447234 m!1336089))

(assert (=> b!1447234 m!1336065))

(assert (=> b!1447234 m!1336087))

(assert (=> b!1447234 m!1336077))

(assert (=> b!1447247 m!1336065))

(declare-fun m!1336101 () Bool)

(assert (=> b!1447247 m!1336101))

(declare-fun m!1336103 () Bool)

(assert (=> b!1447232 m!1336103))

(assert (=> b!1447245 m!1336077))

(assert (=> b!1447245 m!1336077))

(declare-fun m!1336105 () Bool)

(assert (=> b!1447245 m!1336105))

(assert (=> b!1447245 m!1336105))

(assert (=> b!1447245 m!1336077))

(declare-fun m!1336107 () Bool)

(assert (=> b!1447245 m!1336107))

(assert (=> b!1447239 m!1336077))

(assert (=> b!1447239 m!1336077))

(declare-fun m!1336109 () Bool)

(assert (=> b!1447239 m!1336109))

(push 1)

