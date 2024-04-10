; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124576 () Bool)

(assert start!124576)

(declare-fun b!1442081 () Bool)

(declare-fun res!974354 () Bool)

(declare-fun e!812836 () Bool)

(assert (=> b!1442081 (=> (not res!974354) (not e!812836))))

(declare-datatypes ((array!98024 0))(
  ( (array!98025 (arr!47300 (Array (_ BitVec 32) (_ BitVec 64))) (size!47850 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98024)

(declare-datatypes ((List!33801 0))(
  ( (Nil!33798) (Cons!33797 (h!35147 (_ BitVec 64)) (t!48495 List!33801)) )
))
(declare-fun arrayNoDuplicates!0 (array!98024 (_ BitVec 32) List!33801) Bool)

(assert (=> b!1442081 (= res!974354 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33798))))

(declare-fun b!1442082 () Bool)

(declare-fun res!974356 () Bool)

(assert (=> b!1442082 (=> (not res!974356) (not e!812836))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1442082 (= res!974356 (and (= (size!47850 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47850 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47850 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1442083 () Bool)

(declare-fun res!974352 () Bool)

(declare-fun e!812832 () Bool)

(assert (=> b!1442083 (=> (not res!974352) (not e!812832))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11552 0))(
  ( (MissingZero!11552 (index!48600 (_ BitVec 32))) (Found!11552 (index!48601 (_ BitVec 32))) (Intermediate!11552 (undefined!12364 Bool) (index!48602 (_ BitVec 32)) (x!130313 (_ BitVec 32))) (Undefined!11552) (MissingVacant!11552 (index!48603 (_ BitVec 32))) )
))
(declare-fun lt!633458 () SeekEntryResult!11552)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98024 (_ BitVec 32)) SeekEntryResult!11552)

(assert (=> b!1442083 (= res!974352 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47300 a!2862) j!93) a!2862 mask!2687) lt!633458))))

(declare-fun b!1442084 () Bool)

(declare-fun res!974350 () Bool)

(declare-fun e!812835 () Bool)

(assert (=> b!1442084 (=> (not res!974350) (not e!812835))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1442084 (= res!974350 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1442085 () Bool)

(assert (=> b!1442085 (= e!812832 e!812835)))

(declare-fun res!974347 () Bool)

(assert (=> b!1442085 (=> (not res!974347) (not e!812835))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!633457 () SeekEntryResult!11552)

(assert (=> b!1442085 (= res!974347 (= lt!633457 (Intermediate!11552 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633455 () array!98024)

(declare-fun lt!633456 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442085 (= lt!633457 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633456 mask!2687) lt!633456 lt!633455 mask!2687))))

(assert (=> b!1442085 (= lt!633456 (select (store (arr!47300 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!974349 () Bool)

(assert (=> start!124576 (=> (not res!974349) (not e!812836))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124576 (= res!974349 (validMask!0 mask!2687))))

(assert (=> start!124576 e!812836))

(assert (=> start!124576 true))

(declare-fun array_inv!36328 (array!98024) Bool)

(assert (=> start!124576 (array_inv!36328 a!2862)))

(declare-fun e!812833 () Bool)

(declare-fun b!1442086 () Bool)

(assert (=> b!1442086 (= e!812833 (= lt!633457 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633456 lt!633455 mask!2687)))))

(declare-fun b!1442087 () Bool)

(declare-fun e!812831 () Bool)

(assert (=> b!1442087 (= e!812836 e!812831)))

(declare-fun res!974344 () Bool)

(assert (=> b!1442087 (=> (not res!974344) (not e!812831))))

(assert (=> b!1442087 (= res!974344 (= (select (store (arr!47300 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442087 (= lt!633455 (array!98025 (store (arr!47300 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47850 a!2862)))))

(declare-fun b!1442088 () Bool)

(declare-fun res!974345 () Bool)

(assert (=> b!1442088 (=> (not res!974345) (not e!812836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98024 (_ BitVec 32)) Bool)

(assert (=> b!1442088 (= res!974345 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442089 () Bool)

(assert (=> b!1442089 (= e!812831 e!812832)))

(declare-fun res!974353 () Bool)

(assert (=> b!1442089 (=> (not res!974353) (not e!812832))))

(assert (=> b!1442089 (= res!974353 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47300 a!2862) j!93) mask!2687) (select (arr!47300 a!2862) j!93) a!2862 mask!2687) lt!633458))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1442089 (= lt!633458 (Intermediate!11552 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun e!812837 () Bool)

(declare-fun b!1442090 () Bool)

(assert (=> b!1442090 (= e!812837 (or (= (select (arr!47300 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47300 a!2862) intermediateBeforeIndex!19) (select (arr!47300 a!2862) j!93))))))

(declare-fun b!1442091 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98024 (_ BitVec 32)) SeekEntryResult!11552)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98024 (_ BitVec 32)) SeekEntryResult!11552)

(assert (=> b!1442091 (= e!812833 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633456 lt!633455 mask!2687) (seekEntryOrOpen!0 lt!633456 lt!633455 mask!2687)))))

(declare-fun b!1442092 () Bool)

(declare-fun res!974346 () Bool)

(assert (=> b!1442092 (=> (not res!974346) (not e!812836))))

(assert (=> b!1442092 (= res!974346 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47850 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47850 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47850 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442093 () Bool)

(declare-fun res!974343 () Bool)

(assert (=> b!1442093 (=> (not res!974343) (not e!812835))))

(assert (=> b!1442093 (= res!974343 e!812833)))

(declare-fun c!133380 () Bool)

(assert (=> b!1442093 (= c!133380 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442094 () Bool)

(assert (=> b!1442094 (= e!812835 (not true))))

(assert (=> b!1442094 e!812837))

(declare-fun res!974351 () Bool)

(assert (=> b!1442094 (=> (not res!974351) (not e!812837))))

(assert (=> b!1442094 (= res!974351 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48600 0))(
  ( (Unit!48601) )
))
(declare-fun lt!633459 () Unit!48600)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98024 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48600)

(assert (=> b!1442094 (= lt!633459 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1442095 () Bool)

(declare-fun res!974348 () Bool)

(assert (=> b!1442095 (=> (not res!974348) (not e!812836))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442095 (= res!974348 (validKeyInArray!0 (select (arr!47300 a!2862) i!1006)))))

(declare-fun b!1442096 () Bool)

(declare-fun res!974342 () Bool)

(assert (=> b!1442096 (=> (not res!974342) (not e!812836))))

(assert (=> b!1442096 (= res!974342 (validKeyInArray!0 (select (arr!47300 a!2862) j!93)))))

(declare-fun b!1442097 () Bool)

(declare-fun res!974355 () Bool)

(assert (=> b!1442097 (=> (not res!974355) (not e!812837))))

(assert (=> b!1442097 (= res!974355 (= (seekEntryOrOpen!0 (select (arr!47300 a!2862) j!93) a!2862 mask!2687) (Found!11552 j!93)))))

(assert (= (and start!124576 res!974349) b!1442082))

(assert (= (and b!1442082 res!974356) b!1442095))

(assert (= (and b!1442095 res!974348) b!1442096))

(assert (= (and b!1442096 res!974342) b!1442088))

(assert (= (and b!1442088 res!974345) b!1442081))

(assert (= (and b!1442081 res!974354) b!1442092))

(assert (= (and b!1442092 res!974346) b!1442087))

(assert (= (and b!1442087 res!974344) b!1442089))

(assert (= (and b!1442089 res!974353) b!1442083))

(assert (= (and b!1442083 res!974352) b!1442085))

(assert (= (and b!1442085 res!974347) b!1442093))

(assert (= (and b!1442093 c!133380) b!1442086))

(assert (= (and b!1442093 (not c!133380)) b!1442091))

(assert (= (and b!1442093 res!974343) b!1442084))

(assert (= (and b!1442084 res!974350) b!1442094))

(assert (= (and b!1442094 res!974351) b!1442097))

(assert (= (and b!1442097 res!974355) b!1442090))

(declare-fun m!1331257 () Bool)

(assert (=> b!1442086 m!1331257))

(declare-fun m!1331259 () Bool)

(assert (=> b!1442090 m!1331259))

(declare-fun m!1331261 () Bool)

(assert (=> b!1442090 m!1331261))

(declare-fun m!1331263 () Bool)

(assert (=> b!1442087 m!1331263))

(declare-fun m!1331265 () Bool)

(assert (=> b!1442087 m!1331265))

(declare-fun m!1331267 () Bool)

(assert (=> start!124576 m!1331267))

(declare-fun m!1331269 () Bool)

(assert (=> start!124576 m!1331269))

(declare-fun m!1331271 () Bool)

(assert (=> b!1442095 m!1331271))

(assert (=> b!1442095 m!1331271))

(declare-fun m!1331273 () Bool)

(assert (=> b!1442095 m!1331273))

(assert (=> b!1442096 m!1331261))

(assert (=> b!1442096 m!1331261))

(declare-fun m!1331275 () Bool)

(assert (=> b!1442096 m!1331275))

(declare-fun m!1331277 () Bool)

(assert (=> b!1442091 m!1331277))

(declare-fun m!1331279 () Bool)

(assert (=> b!1442091 m!1331279))

(assert (=> b!1442083 m!1331261))

(assert (=> b!1442083 m!1331261))

(declare-fun m!1331281 () Bool)

(assert (=> b!1442083 m!1331281))

(declare-fun m!1331283 () Bool)

(assert (=> b!1442094 m!1331283))

(declare-fun m!1331285 () Bool)

(assert (=> b!1442094 m!1331285))

(assert (=> b!1442097 m!1331261))

(assert (=> b!1442097 m!1331261))

(declare-fun m!1331287 () Bool)

(assert (=> b!1442097 m!1331287))

(declare-fun m!1331289 () Bool)

(assert (=> b!1442088 m!1331289))

(declare-fun m!1331291 () Bool)

(assert (=> b!1442085 m!1331291))

(assert (=> b!1442085 m!1331291))

(declare-fun m!1331293 () Bool)

(assert (=> b!1442085 m!1331293))

(assert (=> b!1442085 m!1331263))

(declare-fun m!1331295 () Bool)

(assert (=> b!1442085 m!1331295))

(assert (=> b!1442089 m!1331261))

(assert (=> b!1442089 m!1331261))

(declare-fun m!1331297 () Bool)

(assert (=> b!1442089 m!1331297))

(assert (=> b!1442089 m!1331297))

(assert (=> b!1442089 m!1331261))

(declare-fun m!1331299 () Bool)

(assert (=> b!1442089 m!1331299))

(declare-fun m!1331301 () Bool)

(assert (=> b!1442081 m!1331301))

(push 1)

