; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124788 () Bool)

(assert start!124788)

(declare-fun res!974730 () Bool)

(declare-fun e!813618 () Bool)

(assert (=> start!124788 (=> (not res!974730) (not e!813618))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124788 (= res!974730 (validMask!0 mask!2687))))

(assert (=> start!124788 e!813618))

(assert (=> start!124788 true))

(declare-datatypes ((array!98131 0))(
  ( (array!98132 (arr!47350 (Array (_ BitVec 32) (_ BitVec 64))) (size!47901 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98131)

(declare-fun array_inv!36631 (array!98131) Bool)

(assert (=> start!124788 (array_inv!36631 a!2862)))

(declare-fun b!1443269 () Bool)

(declare-fun res!974727 () Bool)

(assert (=> b!1443269 (=> (not res!974727) (not e!813618))))

(declare-datatypes ((List!33838 0))(
  ( (Nil!33835) (Cons!33834 (h!35195 (_ BitVec 64)) (t!48524 List!33838)) )
))
(declare-fun arrayNoDuplicates!0 (array!98131 (_ BitVec 32) List!33838) Bool)

(assert (=> b!1443269 (= res!974727 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33835))))

(declare-fun b!1443270 () Bool)

(declare-fun res!974728 () Bool)

(assert (=> b!1443270 (=> (not res!974728) (not e!813618))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1443270 (= res!974728 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47901 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47901 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47901 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443271 () Bool)

(declare-fun res!974733 () Bool)

(assert (=> b!1443271 (=> (not res!974733) (not e!813618))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443271 (= res!974733 (validKeyInArray!0 (select (arr!47350 a!2862) i!1006)))))

(declare-fun b!1443272 () Bool)

(declare-fun res!974725 () Bool)

(assert (=> b!1443272 (=> (not res!974725) (not e!813618))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98131 (_ BitVec 32)) Bool)

(assert (=> b!1443272 (= res!974725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443273 () Bool)

(declare-fun res!974723 () Bool)

(assert (=> b!1443273 (=> (not res!974723) (not e!813618))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1443273 (= res!974723 (and (= (size!47901 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47901 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47901 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443274 () Bool)

(declare-fun res!974731 () Bool)

(assert (=> b!1443274 (=> (not res!974731) (not e!813618))))

(assert (=> b!1443274 (= res!974731 (validKeyInArray!0 (select (arr!47350 a!2862) j!93)))))

(declare-fun b!1443275 () Bool)

(declare-fun res!974726 () Bool)

(declare-fun e!813615 () Bool)

(assert (=> b!1443275 (=> (not res!974726) (not e!813615))))

(assert (=> b!1443275 (= res!974726 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443276 () Bool)

(declare-fun e!813616 () Bool)

(assert (=> b!1443276 (= e!813616 e!813615)))

(declare-fun res!974735 () Bool)

(assert (=> b!1443276 (=> (not res!974735) (not e!813615))))

(declare-datatypes ((SeekEntryResult!11499 0))(
  ( (MissingZero!11499 (index!48388 (_ BitVec 32))) (Found!11499 (index!48389 (_ BitVec 32))) (Intermediate!11499 (undefined!12311 Bool) (index!48390 (_ BitVec 32)) (x!130276 (_ BitVec 32))) (Undefined!11499) (MissingVacant!11499 (index!48391 (_ BitVec 32))) )
))
(declare-fun lt!633892 () SeekEntryResult!11499)

(assert (=> b!1443276 (= res!974735 (= lt!633892 (Intermediate!11499 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633888 () array!98131)

(declare-fun lt!633890 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98131 (_ BitVec 32)) SeekEntryResult!11499)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443276 (= lt!633892 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633890 mask!2687) lt!633890 lt!633888 mask!2687))))

(assert (=> b!1443276 (= lt!633890 (select (store (arr!47350 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443277 () Bool)

(assert (=> b!1443277 (= e!813615 (not true))))

(assert (=> b!1443277 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48527 0))(
  ( (Unit!48528) )
))
(declare-fun lt!633891 () Unit!48527)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98131 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48527)

(assert (=> b!1443277 (= lt!633891 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun e!813614 () Bool)

(declare-fun b!1443278 () Bool)

(assert (=> b!1443278 (= e!813614 (= lt!633892 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633890 lt!633888 mask!2687)))))

(declare-fun b!1443279 () Bool)

(declare-fun e!813617 () Bool)

(assert (=> b!1443279 (= e!813618 e!813617)))

(declare-fun res!974729 () Bool)

(assert (=> b!1443279 (=> (not res!974729) (not e!813617))))

(assert (=> b!1443279 (= res!974729 (= (select (store (arr!47350 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1443279 (= lt!633888 (array!98132 (store (arr!47350 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47901 a!2862)))))

(declare-fun b!1443280 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98131 (_ BitVec 32)) SeekEntryResult!11499)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98131 (_ BitVec 32)) SeekEntryResult!11499)

(assert (=> b!1443280 (= e!813614 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633890 lt!633888 mask!2687) (seekEntryOrOpen!0 lt!633890 lt!633888 mask!2687)))))

(declare-fun b!1443281 () Bool)

(declare-fun res!974734 () Bool)

(assert (=> b!1443281 (=> (not res!974734) (not e!813616))))

(declare-fun lt!633889 () SeekEntryResult!11499)

(assert (=> b!1443281 (= res!974734 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47350 a!2862) j!93) a!2862 mask!2687) lt!633889))))

(declare-fun b!1443282 () Bool)

(declare-fun res!974724 () Bool)

(assert (=> b!1443282 (=> (not res!974724) (not e!813615))))

(assert (=> b!1443282 (= res!974724 e!813614)))

(declare-fun c!133792 () Bool)

(assert (=> b!1443282 (= c!133792 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443283 () Bool)

(assert (=> b!1443283 (= e!813617 e!813616)))

(declare-fun res!974732 () Bool)

(assert (=> b!1443283 (=> (not res!974732) (not e!813616))))

(assert (=> b!1443283 (= res!974732 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47350 a!2862) j!93) mask!2687) (select (arr!47350 a!2862) j!93) a!2862 mask!2687) lt!633889))))

(assert (=> b!1443283 (= lt!633889 (Intermediate!11499 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124788 res!974730) b!1443273))

(assert (= (and b!1443273 res!974723) b!1443271))

(assert (= (and b!1443271 res!974733) b!1443274))

(assert (= (and b!1443274 res!974731) b!1443272))

(assert (= (and b!1443272 res!974725) b!1443269))

(assert (= (and b!1443269 res!974727) b!1443270))

(assert (= (and b!1443270 res!974728) b!1443279))

(assert (= (and b!1443279 res!974729) b!1443283))

(assert (= (and b!1443283 res!974732) b!1443281))

(assert (= (and b!1443281 res!974734) b!1443276))

(assert (= (and b!1443276 res!974735) b!1443282))

(assert (= (and b!1443282 c!133792) b!1443278))

(assert (= (and b!1443282 (not c!133792)) b!1443280))

(assert (= (and b!1443282 res!974724) b!1443275))

(assert (= (and b!1443275 res!974726) b!1443277))

(declare-fun m!1332571 () Bool)

(assert (=> b!1443277 m!1332571))

(declare-fun m!1332573 () Bool)

(assert (=> b!1443277 m!1332573))

(declare-fun m!1332575 () Bool)

(assert (=> b!1443279 m!1332575))

(declare-fun m!1332577 () Bool)

(assert (=> b!1443279 m!1332577))

(declare-fun m!1332579 () Bool)

(assert (=> b!1443278 m!1332579))

(declare-fun m!1332581 () Bool)

(assert (=> b!1443274 m!1332581))

(assert (=> b!1443274 m!1332581))

(declare-fun m!1332583 () Bool)

(assert (=> b!1443274 m!1332583))

(declare-fun m!1332585 () Bool)

(assert (=> b!1443280 m!1332585))

(declare-fun m!1332587 () Bool)

(assert (=> b!1443280 m!1332587))

(assert (=> b!1443281 m!1332581))

(assert (=> b!1443281 m!1332581))

(declare-fun m!1332589 () Bool)

(assert (=> b!1443281 m!1332589))

(declare-fun m!1332591 () Bool)

(assert (=> start!124788 m!1332591))

(declare-fun m!1332593 () Bool)

(assert (=> start!124788 m!1332593))

(declare-fun m!1332595 () Bool)

(assert (=> b!1443276 m!1332595))

(assert (=> b!1443276 m!1332595))

(declare-fun m!1332597 () Bool)

(assert (=> b!1443276 m!1332597))

(assert (=> b!1443276 m!1332575))

(declare-fun m!1332599 () Bool)

(assert (=> b!1443276 m!1332599))

(declare-fun m!1332601 () Bool)

(assert (=> b!1443272 m!1332601))

(declare-fun m!1332603 () Bool)

(assert (=> b!1443271 m!1332603))

(assert (=> b!1443271 m!1332603))

(declare-fun m!1332605 () Bool)

(assert (=> b!1443271 m!1332605))

(assert (=> b!1443283 m!1332581))

(assert (=> b!1443283 m!1332581))

(declare-fun m!1332607 () Bool)

(assert (=> b!1443283 m!1332607))

(assert (=> b!1443283 m!1332607))

(assert (=> b!1443283 m!1332581))

(declare-fun m!1332609 () Bool)

(assert (=> b!1443283 m!1332609))

(declare-fun m!1332611 () Bool)

(assert (=> b!1443269 m!1332611))

(check-sat (not b!1443276) (not b!1443269) (not b!1443283) (not b!1443272) (not b!1443280) (not start!124788) (not b!1443278) (not b!1443274) (not b!1443281) (not b!1443271) (not b!1443277))
(check-sat)
