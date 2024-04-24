; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126078 () Bool)

(assert start!126078)

(declare-fun b!1474278 () Bool)

(declare-fun e!827467 () Bool)

(declare-fun e!827466 () Bool)

(assert (=> b!1474278 (= e!827467 e!827466)))

(declare-fun res!1000830 () Bool)

(assert (=> b!1474278 (=> (not res!1000830) (not e!827466))))

(declare-datatypes ((SeekEntryResult!12042 0))(
  ( (MissingZero!12042 (index!50560 (_ BitVec 32))) (Found!12042 (index!50561 (_ BitVec 32))) (Intermediate!12042 (undefined!12854 Bool) (index!50562 (_ BitVec 32)) (x!132326 (_ BitVec 32))) (Undefined!12042) (MissingVacant!12042 (index!50563 (_ BitVec 32))) )
))
(declare-fun lt!644251 () SeekEntryResult!12042)

(declare-datatypes ((array!99250 0))(
  ( (array!99251 (arr!47905 (Array (_ BitVec 32) (_ BitVec 64))) (size!48456 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99250)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99250 (_ BitVec 32)) SeekEntryResult!12042)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474278 (= res!1000830 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47905 a!2862) j!93) mask!2687) (select (arr!47905 a!2862) j!93) a!2862 mask!2687) lt!644251))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1474278 (= lt!644251 (Intermediate!12042 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1474279 () Bool)

(declare-fun res!1000827 () Bool)

(declare-fun e!827471 () Bool)

(assert (=> b!1474279 (=> (not res!1000827) (not e!827471))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99250 (_ BitVec 32)) Bool)

(assert (=> b!1474279 (= res!1000827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1474280 () Bool)

(assert (=> b!1474280 (= e!827471 e!827467)))

(declare-fun res!1000828 () Bool)

(assert (=> b!1474280 (=> (not res!1000828) (not e!827467))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1474280 (= res!1000828 (= (select (store (arr!47905 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!644249 () array!99250)

(assert (=> b!1474280 (= lt!644249 (array!99251 (store (arr!47905 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48456 a!2862)))))

(declare-fun b!1474282 () Bool)

(declare-fun res!1000833 () Bool)

(declare-fun e!827468 () Bool)

(assert (=> b!1474282 (=> (not res!1000833) (not e!827468))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99250 (_ BitVec 32)) SeekEntryResult!12042)

(assert (=> b!1474282 (= res!1000833 (= (seekEntryOrOpen!0 (select (arr!47905 a!2862) j!93) a!2862 mask!2687) (Found!12042 j!93)))))

(declare-fun b!1474283 () Bool)

(declare-fun res!1000839 () Bool)

(assert (=> b!1474283 (=> (not res!1000839) (not e!827471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1474283 (= res!1000839 (validKeyInArray!0 (select (arr!47905 a!2862) j!93)))))

(declare-fun b!1474284 () Bool)

(declare-fun e!827470 () Bool)

(assert (=> b!1474284 (= e!827466 e!827470)))

(declare-fun res!1000836 () Bool)

(assert (=> b!1474284 (=> (not res!1000836) (not e!827470))))

(declare-fun lt!644247 () SeekEntryResult!12042)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1474284 (= res!1000836 (= lt!644247 (Intermediate!12042 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!644248 () (_ BitVec 64))

(assert (=> b!1474284 (= lt!644247 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644248 mask!2687) lt!644248 lt!644249 mask!2687))))

(assert (=> b!1474284 (= lt!644248 (select (store (arr!47905 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1474285 () Bool)

(declare-fun res!1000829 () Bool)

(assert (=> b!1474285 (=> (not res!1000829) (not e!827470))))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1474285 (= res!1000829 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1474286 () Bool)

(assert (=> b!1474286 (= e!827468 (or (= (select (arr!47905 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47905 a!2862) intermediateBeforeIndex!19) (select (arr!47905 a!2862) j!93))))))

(declare-fun b!1474287 () Bool)

(declare-fun res!1000834 () Bool)

(assert (=> b!1474287 (=> (not res!1000834) (not e!827471))))

(declare-datatypes ((List!34393 0))(
  ( (Nil!34390) (Cons!34389 (h!35759 (_ BitVec 64)) (t!49079 List!34393)) )
))
(declare-fun arrayNoDuplicates!0 (array!99250 (_ BitVec 32) List!34393) Bool)

(assert (=> b!1474287 (= res!1000834 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34390))))

(declare-fun b!1474288 () Bool)

(declare-fun e!827472 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99250 (_ BitVec 32)) SeekEntryResult!12042)

(assert (=> b!1474288 (= e!827472 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644248 lt!644249 mask!2687) (seekEntryOrOpen!0 lt!644248 lt!644249 mask!2687)))))

(declare-fun b!1474289 () Bool)

(declare-fun res!1000837 () Bool)

(assert (=> b!1474289 (=> (not res!1000837) (not e!827466))))

(assert (=> b!1474289 (= res!1000837 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47905 a!2862) j!93) a!2862 mask!2687) lt!644251))))

(declare-fun res!1000841 () Bool)

(assert (=> start!126078 (=> (not res!1000841) (not e!827471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126078 (= res!1000841 (validMask!0 mask!2687))))

(assert (=> start!126078 e!827471))

(assert (=> start!126078 true))

(declare-fun array_inv!37186 (array!99250) Bool)

(assert (=> start!126078 (array_inv!37186 a!2862)))

(declare-fun b!1474281 () Bool)

(declare-fun res!1000838 () Bool)

(assert (=> b!1474281 (=> (not res!1000838) (not e!827470))))

(assert (=> b!1474281 (= res!1000838 e!827472)))

(declare-fun c!136249 () Bool)

(assert (=> b!1474281 (= c!136249 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1474290 () Bool)

(declare-fun res!1000831 () Bool)

(assert (=> b!1474290 (=> (not res!1000831) (not e!827471))))

(assert (=> b!1474290 (= res!1000831 (and (= (size!48456 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48456 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48456 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1474291 () Bool)

(declare-fun res!1000840 () Bool)

(assert (=> b!1474291 (=> (not res!1000840) (not e!827471))))

(assert (=> b!1474291 (= res!1000840 (validKeyInArray!0 (select (arr!47905 a!2862) i!1006)))))

(declare-fun b!1474292 () Bool)

(assert (=> b!1474292 (= e!827470 (not true))))

(assert (=> b!1474292 e!827468))

(declare-fun res!1000832 () Bool)

(assert (=> b!1474292 (=> (not res!1000832) (not e!827468))))

(assert (=> b!1474292 (= res!1000832 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49457 0))(
  ( (Unit!49458) )
))
(declare-fun lt!644250 () Unit!49457)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99250 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49457)

(assert (=> b!1474292 (= lt!644250 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1474293 () Bool)

(declare-fun res!1000835 () Bool)

(assert (=> b!1474293 (=> (not res!1000835) (not e!827471))))

(assert (=> b!1474293 (= res!1000835 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48456 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48456 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48456 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1474294 () Bool)

(assert (=> b!1474294 (= e!827472 (= lt!644247 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644248 lt!644249 mask!2687)))))

(assert (= (and start!126078 res!1000841) b!1474290))

(assert (= (and b!1474290 res!1000831) b!1474291))

(assert (= (and b!1474291 res!1000840) b!1474283))

(assert (= (and b!1474283 res!1000839) b!1474279))

(assert (= (and b!1474279 res!1000827) b!1474287))

(assert (= (and b!1474287 res!1000834) b!1474293))

(assert (= (and b!1474293 res!1000835) b!1474280))

(assert (= (and b!1474280 res!1000828) b!1474278))

(assert (= (and b!1474278 res!1000830) b!1474289))

(assert (= (and b!1474289 res!1000837) b!1474284))

(assert (= (and b!1474284 res!1000836) b!1474281))

(assert (= (and b!1474281 c!136249) b!1474294))

(assert (= (and b!1474281 (not c!136249)) b!1474288))

(assert (= (and b!1474281 res!1000838) b!1474285))

(assert (= (and b!1474285 res!1000829) b!1474292))

(assert (= (and b!1474292 res!1000832) b!1474282))

(assert (= (and b!1474282 res!1000833) b!1474286))

(declare-fun m!1360957 () Bool)

(assert (=> b!1474294 m!1360957))

(declare-fun m!1360959 () Bool)

(assert (=> b!1474287 m!1360959))

(declare-fun m!1360961 () Bool)

(assert (=> b!1474279 m!1360961))

(declare-fun m!1360963 () Bool)

(assert (=> b!1474278 m!1360963))

(assert (=> b!1474278 m!1360963))

(declare-fun m!1360965 () Bool)

(assert (=> b!1474278 m!1360965))

(assert (=> b!1474278 m!1360965))

(assert (=> b!1474278 m!1360963))

(declare-fun m!1360967 () Bool)

(assert (=> b!1474278 m!1360967))

(declare-fun m!1360969 () Bool)

(assert (=> b!1474291 m!1360969))

(assert (=> b!1474291 m!1360969))

(declare-fun m!1360971 () Bool)

(assert (=> b!1474291 m!1360971))

(declare-fun m!1360973 () Bool)

(assert (=> b!1474292 m!1360973))

(declare-fun m!1360975 () Bool)

(assert (=> b!1474292 m!1360975))

(declare-fun m!1360977 () Bool)

(assert (=> b!1474286 m!1360977))

(assert (=> b!1474286 m!1360963))

(assert (=> b!1474283 m!1360963))

(assert (=> b!1474283 m!1360963))

(declare-fun m!1360979 () Bool)

(assert (=> b!1474283 m!1360979))

(assert (=> b!1474289 m!1360963))

(assert (=> b!1474289 m!1360963))

(declare-fun m!1360981 () Bool)

(assert (=> b!1474289 m!1360981))

(declare-fun m!1360983 () Bool)

(assert (=> b!1474284 m!1360983))

(assert (=> b!1474284 m!1360983))

(declare-fun m!1360985 () Bool)

(assert (=> b!1474284 m!1360985))

(declare-fun m!1360987 () Bool)

(assert (=> b!1474284 m!1360987))

(declare-fun m!1360989 () Bool)

(assert (=> b!1474284 m!1360989))

(declare-fun m!1360991 () Bool)

(assert (=> b!1474288 m!1360991))

(declare-fun m!1360993 () Bool)

(assert (=> b!1474288 m!1360993))

(declare-fun m!1360995 () Bool)

(assert (=> start!126078 m!1360995))

(declare-fun m!1360997 () Bool)

(assert (=> start!126078 m!1360997))

(assert (=> b!1474282 m!1360963))

(assert (=> b!1474282 m!1360963))

(declare-fun m!1360999 () Bool)

(assert (=> b!1474282 m!1360999))

(assert (=> b!1474280 m!1360987))

(declare-fun m!1361001 () Bool)

(assert (=> b!1474280 m!1361001))

(check-sat (not start!126078) (not b!1474287) (not b!1474288) (not b!1474283) (not b!1474292) (not b!1474291) (not b!1474294) (not b!1474279) (not b!1474284) (not b!1474278) (not b!1474289) (not b!1474282))
(check-sat)
