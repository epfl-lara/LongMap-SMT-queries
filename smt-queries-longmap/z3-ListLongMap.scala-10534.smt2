; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124186 () Bool)

(assert start!124186)

(declare-fun b!1437524 () Bool)

(declare-fun res!970423 () Bool)

(declare-fun e!810986 () Bool)

(assert (=> b!1437524 (=> (not res!970423) (not e!810986))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97729 0))(
  ( (array!97730 (arr!47158 (Array (_ BitVec 32) (_ BitVec 64))) (size!47710 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97729)

(assert (=> b!1437524 (= res!970423 (and (= (size!47710 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47710 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47710 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437525 () Bool)

(declare-fun res!970424 () Bool)

(declare-fun e!810985 () Bool)

(assert (=> b!1437525 (=> (not res!970424) (not e!810985))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11435 0))(
  ( (MissingZero!11435 (index!48132 (_ BitVec 32))) (Found!11435 (index!48133 (_ BitVec 32))) (Intermediate!11435 (undefined!12247 Bool) (index!48134 (_ BitVec 32)) (x!129861 (_ BitVec 32))) (Undefined!11435) (MissingVacant!11435 (index!48135 (_ BitVec 32))) )
))
(declare-fun lt!632141 () SeekEntryResult!11435)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97729 (_ BitVec 32)) SeekEntryResult!11435)

(assert (=> b!1437525 (= res!970424 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47158 a!2862) j!93) a!2862 mask!2687) lt!632141))))

(declare-fun b!1437526 () Bool)

(declare-fun res!970421 () Bool)

(assert (=> b!1437526 (=> (not res!970421) (not e!810986))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437526 (= res!970421 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47710 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47710 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47710 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47158 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437527 () Bool)

(declare-fun res!970418 () Bool)

(assert (=> b!1437527 (=> (not res!970418) (not e!810986))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437527 (= res!970418 (validKeyInArray!0 (select (arr!47158 a!2862) j!93)))))

(declare-fun b!1437528 () Bool)

(declare-fun res!970420 () Bool)

(assert (=> b!1437528 (=> (not res!970420) (not e!810986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97729 (_ BitVec 32)) Bool)

(assert (=> b!1437528 (= res!970420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437529 () Bool)

(declare-fun res!970426 () Bool)

(assert (=> b!1437529 (=> (not res!970426) (not e!810986))))

(declare-datatypes ((List!33737 0))(
  ( (Nil!33734) (Cons!33733 (h!35074 (_ BitVec 64)) (t!48423 List!33737)) )
))
(declare-fun arrayNoDuplicates!0 (array!97729 (_ BitVec 32) List!33737) Bool)

(assert (=> b!1437529 (= res!970426 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33734))))

(declare-fun b!1437530 () Bool)

(assert (=> b!1437530 (= e!810986 e!810985)))

(declare-fun res!970425 () Bool)

(assert (=> b!1437530 (=> (not res!970425) (not e!810985))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437530 (= res!970425 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47158 a!2862) j!93) mask!2687) (select (arr!47158 a!2862) j!93) a!2862 mask!2687) lt!632141))))

(assert (=> b!1437530 (= lt!632141 (Intermediate!11435 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1437531 () Bool)

(assert (=> b!1437531 (= e!810985 false)))

(declare-fun lt!632142 () (_ BitVec 32))

(assert (=> b!1437531 (= lt!632142 (toIndex!0 (select (store (arr!47158 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1437523 () Bool)

(declare-fun res!970422 () Bool)

(assert (=> b!1437523 (=> (not res!970422) (not e!810986))))

(assert (=> b!1437523 (= res!970422 (validKeyInArray!0 (select (arr!47158 a!2862) i!1006)))))

(declare-fun res!970419 () Bool)

(assert (=> start!124186 (=> (not res!970419) (not e!810986))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124186 (= res!970419 (validMask!0 mask!2687))))

(assert (=> start!124186 e!810986))

(assert (=> start!124186 true))

(declare-fun array_inv!36391 (array!97729) Bool)

(assert (=> start!124186 (array_inv!36391 a!2862)))

(assert (= (and start!124186 res!970419) b!1437524))

(assert (= (and b!1437524 res!970423) b!1437523))

(assert (= (and b!1437523 res!970422) b!1437527))

(assert (= (and b!1437527 res!970418) b!1437528))

(assert (= (and b!1437528 res!970420) b!1437529))

(assert (= (and b!1437529 res!970426) b!1437526))

(assert (= (and b!1437526 res!970421) b!1437530))

(assert (= (and b!1437530 res!970425) b!1437525))

(assert (= (and b!1437525 res!970424) b!1437531))

(declare-fun m!1326285 () Bool)

(assert (=> b!1437523 m!1326285))

(assert (=> b!1437523 m!1326285))

(declare-fun m!1326287 () Bool)

(assert (=> b!1437523 m!1326287))

(declare-fun m!1326289 () Bool)

(assert (=> b!1437528 m!1326289))

(declare-fun m!1326291 () Bool)

(assert (=> b!1437530 m!1326291))

(assert (=> b!1437530 m!1326291))

(declare-fun m!1326293 () Bool)

(assert (=> b!1437530 m!1326293))

(assert (=> b!1437530 m!1326293))

(assert (=> b!1437530 m!1326291))

(declare-fun m!1326295 () Bool)

(assert (=> b!1437530 m!1326295))

(declare-fun m!1326297 () Bool)

(assert (=> b!1437526 m!1326297))

(declare-fun m!1326299 () Bool)

(assert (=> b!1437526 m!1326299))

(assert (=> b!1437525 m!1326291))

(assert (=> b!1437525 m!1326291))

(declare-fun m!1326301 () Bool)

(assert (=> b!1437525 m!1326301))

(assert (=> b!1437527 m!1326291))

(assert (=> b!1437527 m!1326291))

(declare-fun m!1326303 () Bool)

(assert (=> b!1437527 m!1326303))

(declare-fun m!1326305 () Bool)

(assert (=> b!1437529 m!1326305))

(assert (=> b!1437531 m!1326297))

(declare-fun m!1326307 () Bool)

(assert (=> b!1437531 m!1326307))

(assert (=> b!1437531 m!1326307))

(declare-fun m!1326309 () Bool)

(assert (=> b!1437531 m!1326309))

(declare-fun m!1326311 () Bool)

(assert (=> start!124186 m!1326311))

(declare-fun m!1326313 () Bool)

(assert (=> start!124186 m!1326313))

(check-sat (not start!124186) (not b!1437525) (not b!1437528) (not b!1437530) (not b!1437523) (not b!1437529) (not b!1437527) (not b!1437531))
(check-sat)
