; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124574 () Bool)

(assert start!124574)

(declare-fun b!1442032 () Bool)

(declare-fun res!974306 () Bool)

(declare-fun e!812813 () Bool)

(assert (=> b!1442032 (=> (not res!974306) (not e!812813))))

(declare-datatypes ((array!98022 0))(
  ( (array!98023 (arr!47299 (Array (_ BitVec 32) (_ BitVec 64))) (size!47849 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98022)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442032 (= res!974306 (validKeyInArray!0 (select (arr!47299 a!2862) j!93)))))

(declare-fun b!1442033 () Bool)

(declare-fun res!974300 () Bool)

(assert (=> b!1442033 (=> (not res!974300) (not e!812813))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98022 (_ BitVec 32)) Bool)

(assert (=> b!1442033 (= res!974300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442034 () Bool)

(declare-fun res!974301 () Bool)

(assert (=> b!1442034 (=> (not res!974301) (not e!812813))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1442034 (= res!974301 (and (= (size!47849 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47849 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47849 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1442035 () Bool)

(declare-fun res!974304 () Bool)

(assert (=> b!1442035 (=> (not res!974304) (not e!812813))))

(assert (=> b!1442035 (= res!974304 (validKeyInArray!0 (select (arr!47299 a!2862) i!1006)))))

(declare-fun b!1442036 () Bool)

(declare-fun res!974303 () Bool)

(assert (=> b!1442036 (=> (not res!974303) (not e!812813))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1442036 (= res!974303 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47849 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47849 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47849 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442037 () Bool)

(declare-fun e!812815 () Bool)

(declare-fun e!812811 () Bool)

(assert (=> b!1442037 (= e!812815 e!812811)))

(declare-fun res!974307 () Bool)

(assert (=> b!1442037 (=> (not res!974307) (not e!812811))))

(declare-datatypes ((SeekEntryResult!11551 0))(
  ( (MissingZero!11551 (index!48596 (_ BitVec 32))) (Found!11551 (index!48597 (_ BitVec 32))) (Intermediate!11551 (undefined!12363 Bool) (index!48598 (_ BitVec 32)) (x!130304 (_ BitVec 32))) (Undefined!11551) (MissingVacant!11551 (index!48599 (_ BitVec 32))) )
))
(declare-fun lt!633441 () SeekEntryResult!11551)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98022 (_ BitVec 32)) SeekEntryResult!11551)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442037 (= res!974307 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47299 a!2862) j!93) mask!2687) (select (arr!47299 a!2862) j!93) a!2862 mask!2687) lt!633441))))

(assert (=> b!1442037 (= lt!633441 (Intermediate!11551 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!812814 () Bool)

(declare-fun lt!633440 () (_ BitVec 64))

(declare-fun lt!633443 () array!98022)

(declare-fun b!1442038 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98022 (_ BitVec 32)) SeekEntryResult!11551)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98022 (_ BitVec 32)) SeekEntryResult!11551)

(assert (=> b!1442038 (= e!812814 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633440 lt!633443 mask!2687) (seekEntryOrOpen!0 lt!633440 lt!633443 mask!2687)))))

(declare-fun res!974309 () Bool)

(assert (=> start!124574 (=> (not res!974309) (not e!812813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124574 (= res!974309 (validMask!0 mask!2687))))

(assert (=> start!124574 e!812813))

(assert (=> start!124574 true))

(declare-fun array_inv!36327 (array!98022) Bool)

(assert (=> start!124574 (array_inv!36327 a!2862)))

(declare-fun b!1442039 () Bool)

(declare-fun res!974310 () Bool)

(declare-fun e!812816 () Bool)

(assert (=> b!1442039 (=> (not res!974310) (not e!812816))))

(assert (=> b!1442039 (= res!974310 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1442040 () Bool)

(declare-fun res!974308 () Bool)

(assert (=> b!1442040 (=> (not res!974308) (not e!812811))))

(assert (=> b!1442040 (= res!974308 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47299 a!2862) j!93) a!2862 mask!2687) lt!633441))))

(declare-fun b!1442041 () Bool)

(declare-fun res!974299 () Bool)

(assert (=> b!1442041 (=> (not res!974299) (not e!812816))))

(assert (=> b!1442041 (= res!974299 e!812814)))

(declare-fun c!133377 () Bool)

(assert (=> b!1442041 (= c!133377 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442042 () Bool)

(assert (=> b!1442042 (= e!812813 e!812815)))

(declare-fun res!974311 () Bool)

(assert (=> b!1442042 (=> (not res!974311) (not e!812815))))

(assert (=> b!1442042 (= res!974311 (= (select (store (arr!47299 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442042 (= lt!633443 (array!98023 (store (arr!47299 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47849 a!2862)))))

(declare-fun b!1442043 () Bool)

(assert (=> b!1442043 (= e!812816 (not true))))

(assert (=> b!1442043 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48598 0))(
  ( (Unit!48599) )
))
(declare-fun lt!633442 () Unit!48598)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98022 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48598)

(assert (=> b!1442043 (= lt!633442 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1442044 () Bool)

(assert (=> b!1442044 (= e!812811 e!812816)))

(declare-fun res!974305 () Bool)

(assert (=> b!1442044 (=> (not res!974305) (not e!812816))))

(declare-fun lt!633444 () SeekEntryResult!11551)

(assert (=> b!1442044 (= res!974305 (= lt!633444 (Intermediate!11551 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1442044 (= lt!633444 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633440 mask!2687) lt!633440 lt!633443 mask!2687))))

(assert (=> b!1442044 (= lt!633440 (select (store (arr!47299 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1442045 () Bool)

(assert (=> b!1442045 (= e!812814 (= lt!633444 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633440 lt!633443 mask!2687)))))

(declare-fun b!1442046 () Bool)

(declare-fun res!974302 () Bool)

(assert (=> b!1442046 (=> (not res!974302) (not e!812813))))

(declare-datatypes ((List!33800 0))(
  ( (Nil!33797) (Cons!33796 (h!35146 (_ BitVec 64)) (t!48494 List!33800)) )
))
(declare-fun arrayNoDuplicates!0 (array!98022 (_ BitVec 32) List!33800) Bool)

(assert (=> b!1442046 (= res!974302 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33797))))

(assert (= (and start!124574 res!974309) b!1442034))

(assert (= (and b!1442034 res!974301) b!1442035))

(assert (= (and b!1442035 res!974304) b!1442032))

(assert (= (and b!1442032 res!974306) b!1442033))

(assert (= (and b!1442033 res!974300) b!1442046))

(assert (= (and b!1442046 res!974302) b!1442036))

(assert (= (and b!1442036 res!974303) b!1442042))

(assert (= (and b!1442042 res!974311) b!1442037))

(assert (= (and b!1442037 res!974307) b!1442040))

(assert (= (and b!1442040 res!974308) b!1442044))

(assert (= (and b!1442044 res!974305) b!1442041))

(assert (= (and b!1442041 c!133377) b!1442045))

(assert (= (and b!1442041 (not c!133377)) b!1442038))

(assert (= (and b!1442041 res!974299) b!1442039))

(assert (= (and b!1442039 res!974310) b!1442043))

(declare-fun m!1331215 () Bool)

(assert (=> b!1442038 m!1331215))

(declare-fun m!1331217 () Bool)

(assert (=> b!1442038 m!1331217))

(declare-fun m!1331219 () Bool)

(assert (=> b!1442045 m!1331219))

(declare-fun m!1331221 () Bool)

(assert (=> b!1442042 m!1331221))

(declare-fun m!1331223 () Bool)

(assert (=> b!1442042 m!1331223))

(declare-fun m!1331225 () Bool)

(assert (=> b!1442044 m!1331225))

(assert (=> b!1442044 m!1331225))

(declare-fun m!1331227 () Bool)

(assert (=> b!1442044 m!1331227))

(assert (=> b!1442044 m!1331221))

(declare-fun m!1331229 () Bool)

(assert (=> b!1442044 m!1331229))

(declare-fun m!1331231 () Bool)

(assert (=> b!1442046 m!1331231))

(declare-fun m!1331233 () Bool)

(assert (=> b!1442033 m!1331233))

(declare-fun m!1331235 () Bool)

(assert (=> b!1442043 m!1331235))

(declare-fun m!1331237 () Bool)

(assert (=> b!1442043 m!1331237))

(declare-fun m!1331239 () Bool)

(assert (=> b!1442040 m!1331239))

(assert (=> b!1442040 m!1331239))

(declare-fun m!1331241 () Bool)

(assert (=> b!1442040 m!1331241))

(declare-fun m!1331243 () Bool)

(assert (=> b!1442035 m!1331243))

(assert (=> b!1442035 m!1331243))

(declare-fun m!1331245 () Bool)

(assert (=> b!1442035 m!1331245))

(assert (=> b!1442032 m!1331239))

(assert (=> b!1442032 m!1331239))

(declare-fun m!1331247 () Bool)

(assert (=> b!1442032 m!1331247))

(declare-fun m!1331249 () Bool)

(assert (=> start!124574 m!1331249))

(declare-fun m!1331251 () Bool)

(assert (=> start!124574 m!1331251))

(assert (=> b!1442037 m!1331239))

(assert (=> b!1442037 m!1331239))

(declare-fun m!1331253 () Bool)

(assert (=> b!1442037 m!1331253))

(assert (=> b!1442037 m!1331253))

(assert (=> b!1442037 m!1331239))

(declare-fun m!1331255 () Bool)

(assert (=> b!1442037 m!1331255))

(push 1)

(assert (not b!1442037))

(assert (not b!1442046))

(assert (not start!124574))

(assert (not b!1442033))

(assert (not b!1442040))

