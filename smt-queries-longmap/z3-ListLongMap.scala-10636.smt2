; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124924 () Bool)

(assert start!124924)

(declare-fun b!1452164 () Bool)

(declare-fun res!983421 () Bool)

(declare-fun e!817487 () Bool)

(assert (=> b!1452164 (=> (not res!983421) (not e!817487))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98350 0))(
  ( (array!98351 (arr!47464 (Array (_ BitVec 32) (_ BitVec 64))) (size!48016 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98350)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1452164 (= res!983421 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48016 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48016 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48016 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452165 () Bool)

(declare-fun res!983420 () Bool)

(declare-fun e!817491 () Bool)

(assert (=> b!1452165 (=> (not res!983420) (not e!817491))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1452165 (= res!983420 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452166 () Bool)

(declare-fun e!817489 () Bool)

(assert (=> b!1452166 (= e!817487 e!817489)))

(declare-fun res!983414 () Bool)

(assert (=> b!1452166 (=> (not res!983414) (not e!817489))))

(assert (=> b!1452166 (= res!983414 (= (select (store (arr!47464 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!636688 () array!98350)

(assert (=> b!1452166 (= lt!636688 (array!98351 (store (arr!47464 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48016 a!2862)))))

(declare-fun b!1452167 () Bool)

(declare-fun res!983419 () Bool)

(assert (=> b!1452167 (=> (not res!983419) (not e!817487))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452167 (= res!983419 (validKeyInArray!0 (select (arr!47464 a!2862) i!1006)))))

(declare-fun b!1452168 () Bool)

(declare-fun res!983415 () Bool)

(assert (=> b!1452168 (=> (not res!983415) (not e!817487))))

(declare-datatypes ((List!34043 0))(
  ( (Nil!34040) (Cons!34039 (h!35389 (_ BitVec 64)) (t!48729 List!34043)) )
))
(declare-fun arrayNoDuplicates!0 (array!98350 (_ BitVec 32) List!34043) Bool)

(assert (=> b!1452168 (= res!983415 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34040))))

(declare-fun b!1452169 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun e!817486 () Bool)

(assert (=> b!1452169 (= e!817486 (and (or (= (select (arr!47464 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47464 a!2862) intermediateBeforeIndex!19) (select (arr!47464 a!2862) j!93))) (or (and (= (select (arr!47464 a!2862) index!646) (select (store (arr!47464 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47464 a!2862) index!646) (select (arr!47464 a!2862) j!93))) (= (select (arr!47464 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47464 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!983411 () Bool)

(assert (=> start!124924 (=> (not res!983411) (not e!817487))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124924 (= res!983411 (validMask!0 mask!2687))))

(assert (=> start!124924 e!817487))

(assert (=> start!124924 true))

(declare-fun array_inv!36697 (array!98350) Bool)

(assert (=> start!124924 (array_inv!36697 a!2862)))

(declare-fun b!1452170 () Bool)

(declare-fun res!983418 () Bool)

(assert (=> b!1452170 (=> (not res!983418) (not e!817487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98350 (_ BitVec 32)) Bool)

(assert (=> b!1452170 (= res!983418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452171 () Bool)

(declare-fun res!983413 () Bool)

(assert (=> b!1452171 (=> (not res!983413) (not e!817487))))

(assert (=> b!1452171 (= res!983413 (and (= (size!48016 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48016 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48016 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452172 () Bool)

(declare-fun res!983409 () Bool)

(assert (=> b!1452172 (=> (not res!983409) (not e!817487))))

(assert (=> b!1452172 (= res!983409 (validKeyInArray!0 (select (arr!47464 a!2862) j!93)))))

(declare-fun b!1452173 () Bool)

(declare-fun res!983410 () Bool)

(declare-fun e!817488 () Bool)

(assert (=> b!1452173 (=> (not res!983410) (not e!817488))))

(declare-datatypes ((SeekEntryResult!11741 0))(
  ( (MissingZero!11741 (index!49356 (_ BitVec 32))) (Found!11741 (index!49357 (_ BitVec 32))) (Intermediate!11741 (undefined!12553 Bool) (index!49358 (_ BitVec 32)) (x!131001 (_ BitVec 32))) (Undefined!11741) (MissingVacant!11741 (index!49359 (_ BitVec 32))) )
))
(declare-fun lt!636689 () SeekEntryResult!11741)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98350 (_ BitVec 32)) SeekEntryResult!11741)

(assert (=> b!1452173 (= res!983410 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47464 a!2862) j!93) a!2862 mask!2687) lt!636689))))

(declare-fun b!1452174 () Bool)

(declare-fun lt!636687 () (_ BitVec 64))

(declare-fun lt!636686 () SeekEntryResult!11741)

(declare-fun e!817490 () Bool)

(assert (=> b!1452174 (= e!817490 (= lt!636686 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636687 lt!636688 mask!2687)))))

(declare-fun b!1452175 () Bool)

(assert (=> b!1452175 (= e!817491 (not true))))

(assert (=> b!1452175 e!817486))

(declare-fun res!983416 () Bool)

(assert (=> b!1452175 (=> (not res!983416) (not e!817486))))

(assert (=> b!1452175 (= res!983416 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48819 0))(
  ( (Unit!48820) )
))
(declare-fun lt!636690 () Unit!48819)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98350 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48819)

(assert (=> b!1452175 (= lt!636690 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452176 () Bool)

(assert (=> b!1452176 (= e!817489 e!817488)))

(declare-fun res!983412 () Bool)

(assert (=> b!1452176 (=> (not res!983412) (not e!817488))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452176 (= res!983412 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47464 a!2862) j!93) mask!2687) (select (arr!47464 a!2862) j!93) a!2862 mask!2687) lt!636689))))

(assert (=> b!1452176 (= lt!636689 (Intermediate!11741 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452177 () Bool)

(assert (=> b!1452177 (= e!817488 e!817491)))

(declare-fun res!983408 () Bool)

(assert (=> b!1452177 (=> (not res!983408) (not e!817491))))

(assert (=> b!1452177 (= res!983408 (= lt!636686 (Intermediate!11741 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1452177 (= lt!636686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636687 mask!2687) lt!636687 lt!636688 mask!2687))))

(assert (=> b!1452177 (= lt!636687 (select (store (arr!47464 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452178 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98350 (_ BitVec 32)) SeekEntryResult!11741)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98350 (_ BitVec 32)) SeekEntryResult!11741)

(assert (=> b!1452178 (= e!817490 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636687 lt!636688 mask!2687) (seekEntryOrOpen!0 lt!636687 lt!636688 mask!2687)))))

(declare-fun b!1452179 () Bool)

(declare-fun res!983422 () Bool)

(assert (=> b!1452179 (=> (not res!983422) (not e!817491))))

(assert (=> b!1452179 (= res!983422 e!817490)))

(declare-fun c!133891 () Bool)

(assert (=> b!1452179 (= c!133891 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452180 () Bool)

(declare-fun res!983417 () Bool)

(assert (=> b!1452180 (=> (not res!983417) (not e!817486))))

(assert (=> b!1452180 (= res!983417 (= (seekEntryOrOpen!0 (select (arr!47464 a!2862) j!93) a!2862 mask!2687) (Found!11741 j!93)))))

(assert (= (and start!124924 res!983411) b!1452171))

(assert (= (and b!1452171 res!983413) b!1452167))

(assert (= (and b!1452167 res!983419) b!1452172))

(assert (= (and b!1452172 res!983409) b!1452170))

(assert (= (and b!1452170 res!983418) b!1452168))

(assert (= (and b!1452168 res!983415) b!1452164))

(assert (= (and b!1452164 res!983421) b!1452166))

(assert (= (and b!1452166 res!983414) b!1452176))

(assert (= (and b!1452176 res!983412) b!1452173))

(assert (= (and b!1452173 res!983410) b!1452177))

(assert (= (and b!1452177 res!983408) b!1452179))

(assert (= (and b!1452179 c!133891) b!1452174))

(assert (= (and b!1452179 (not c!133891)) b!1452178))

(assert (= (and b!1452179 res!983422) b!1452165))

(assert (= (and b!1452165 res!983420) b!1452175))

(assert (= (and b!1452175 res!983416) b!1452180))

(assert (= (and b!1452180 res!983417) b!1452169))

(declare-fun m!1340259 () Bool)

(assert (=> b!1452177 m!1340259))

(assert (=> b!1452177 m!1340259))

(declare-fun m!1340261 () Bool)

(assert (=> b!1452177 m!1340261))

(declare-fun m!1340263 () Bool)

(assert (=> b!1452177 m!1340263))

(declare-fun m!1340265 () Bool)

(assert (=> b!1452177 m!1340265))

(declare-fun m!1340267 () Bool)

(assert (=> b!1452180 m!1340267))

(assert (=> b!1452180 m!1340267))

(declare-fun m!1340269 () Bool)

(assert (=> b!1452180 m!1340269))

(declare-fun m!1340271 () Bool)

(assert (=> b!1452178 m!1340271))

(declare-fun m!1340273 () Bool)

(assert (=> b!1452178 m!1340273))

(assert (=> b!1452166 m!1340263))

(declare-fun m!1340275 () Bool)

(assert (=> b!1452166 m!1340275))

(declare-fun m!1340277 () Bool)

(assert (=> b!1452168 m!1340277))

(assert (=> b!1452176 m!1340267))

(assert (=> b!1452176 m!1340267))

(declare-fun m!1340279 () Bool)

(assert (=> b!1452176 m!1340279))

(assert (=> b!1452176 m!1340279))

(assert (=> b!1452176 m!1340267))

(declare-fun m!1340281 () Bool)

(assert (=> b!1452176 m!1340281))

(declare-fun m!1340283 () Bool)

(assert (=> b!1452170 m!1340283))

(declare-fun m!1340285 () Bool)

(assert (=> b!1452174 m!1340285))

(assert (=> b!1452172 m!1340267))

(assert (=> b!1452172 m!1340267))

(declare-fun m!1340287 () Bool)

(assert (=> b!1452172 m!1340287))

(assert (=> b!1452169 m!1340263))

(declare-fun m!1340289 () Bool)

(assert (=> b!1452169 m!1340289))

(declare-fun m!1340291 () Bool)

(assert (=> b!1452169 m!1340291))

(declare-fun m!1340293 () Bool)

(assert (=> b!1452169 m!1340293))

(assert (=> b!1452169 m!1340267))

(declare-fun m!1340295 () Bool)

(assert (=> start!124924 m!1340295))

(declare-fun m!1340297 () Bool)

(assert (=> start!124924 m!1340297))

(assert (=> b!1452173 m!1340267))

(assert (=> b!1452173 m!1340267))

(declare-fun m!1340299 () Bool)

(assert (=> b!1452173 m!1340299))

(declare-fun m!1340301 () Bool)

(assert (=> b!1452175 m!1340301))

(declare-fun m!1340303 () Bool)

(assert (=> b!1452175 m!1340303))

(declare-fun m!1340305 () Bool)

(assert (=> b!1452167 m!1340305))

(assert (=> b!1452167 m!1340305))

(declare-fun m!1340307 () Bool)

(assert (=> b!1452167 m!1340307))

(check-sat (not b!1452168) (not start!124924) (not b!1452173) (not b!1452177) (not b!1452175) (not b!1452170) (not b!1452167) (not b!1452174) (not b!1452172) (not b!1452180) (not b!1452178) (not b!1452176))
(check-sat)
