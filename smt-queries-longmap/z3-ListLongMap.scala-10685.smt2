; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125250 () Bool)

(assert start!125250)

(declare-fun b!1461723 () Bool)

(declare-fun res!991289 () Bool)

(declare-fun e!821741 () Bool)

(assert (=> b!1461723 (=> res!991289 e!821741)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!640224 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!98698 0))(
  ( (array!98699 (arr!47637 (Array (_ BitVec 32) (_ BitVec 64))) (size!48187 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98698)

(declare-datatypes ((SeekEntryResult!11889 0))(
  ( (MissingZero!11889 (index!49948 (_ BitVec 32))) (Found!11889 (index!49949 (_ BitVec 32))) (Intermediate!11889 (undefined!12701 Bool) (index!49950 (_ BitVec 32)) (x!131546 (_ BitVec 32))) (Undefined!11889) (MissingVacant!11889 (index!49951 (_ BitVec 32))) )
))
(declare-fun lt!640226 () SeekEntryResult!11889)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98698 (_ BitVec 32)) SeekEntryResult!11889)

(assert (=> b!1461723 (= res!991289 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640224 (select (arr!47637 a!2862) j!93) a!2862 mask!2687) lt!640226)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1461724 () Bool)

(declare-fun e!821747 () Bool)

(assert (=> b!1461724 (= e!821747 (or (= (select (arr!47637 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47637 a!2862) intermediateBeforeIndex!19) (select (arr!47637 a!2862) j!93))))))

(declare-fun b!1461725 () Bool)

(declare-fun e!821748 () Bool)

(declare-fun e!821745 () Bool)

(assert (=> b!1461725 (= e!821748 (not e!821745))))

(declare-fun res!991291 () Bool)

(assert (=> b!1461725 (=> res!991291 e!821745)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1461725 (= res!991291 (or (and (= (select (arr!47637 a!2862) index!646) (select (store (arr!47637 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47637 a!2862) index!646) (select (arr!47637 a!2862) j!93))) (= (select (arr!47637 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1461725 e!821747))

(declare-fun res!991301 () Bool)

(assert (=> b!1461725 (=> (not res!991301) (not e!821747))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98698 (_ BitVec 32)) Bool)

(assert (=> b!1461725 (= res!991301 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49274 0))(
  ( (Unit!49275) )
))
(declare-fun lt!640223 () Unit!49274)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98698 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49274)

(assert (=> b!1461725 (= lt!640223 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1461726 () Bool)

(declare-fun res!991290 () Bool)

(declare-fun e!821750 () Bool)

(assert (=> b!1461726 (=> (not res!991290) (not e!821750))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461726 (= res!991290 (validKeyInArray!0 (select (arr!47637 a!2862) i!1006)))))

(declare-fun lt!640221 () array!98698)

(declare-fun lt!640225 () (_ BitVec 64))

(declare-fun b!1461727 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun e!821743 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98698 (_ BitVec 32)) SeekEntryResult!11889)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98698 (_ BitVec 32)) SeekEntryResult!11889)

(assert (=> b!1461727 (= e!821743 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640224 intermediateAfterIndex!19 lt!640225 lt!640221 mask!2687) (seekEntryOrOpen!0 lt!640225 lt!640221 mask!2687))))))

(declare-fun b!1461728 () Bool)

(declare-fun res!991292 () Bool)

(assert (=> b!1461728 (=> (not res!991292) (not e!821750))))

(assert (=> b!1461728 (= res!991292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1461729 () Bool)

(declare-fun res!991287 () Bool)

(assert (=> b!1461729 (=> (not res!991287) (not e!821747))))

(assert (=> b!1461729 (= res!991287 (= (seekEntryOrOpen!0 (select (arr!47637 a!2862) j!93) a!2862 mask!2687) (Found!11889 j!93)))))

(declare-fun b!1461730 () Bool)

(declare-fun res!991303 () Bool)

(assert (=> b!1461730 (=> (not res!991303) (not e!821748))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1461730 (= res!991303 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1461731 () Bool)

(declare-fun e!821744 () Bool)

(assert (=> b!1461731 (= e!821744 e!821748)))

(declare-fun res!991296 () Bool)

(assert (=> b!1461731 (=> (not res!991296) (not e!821748))))

(declare-fun lt!640227 () SeekEntryResult!11889)

(assert (=> b!1461731 (= res!991296 (= lt!640227 (Intermediate!11889 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461731 (= lt!640227 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640225 mask!2687) lt!640225 lt!640221 mask!2687))))

(assert (=> b!1461731 (= lt!640225 (select (store (arr!47637 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1461732 () Bool)

(assert (=> b!1461732 (= e!821743 (not (= lt!640227 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640224 lt!640225 lt!640221 mask!2687))))))

(declare-fun b!1461733 () Bool)

(declare-fun res!991294 () Bool)

(assert (=> b!1461733 (=> (not res!991294) (not e!821750))))

(assert (=> b!1461733 (= res!991294 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48187 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48187 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48187 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun e!821749 () Bool)

(declare-fun b!1461734 () Bool)

(assert (=> b!1461734 (= e!821749 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640225 lt!640221 mask!2687) (seekEntryOrOpen!0 lt!640225 lt!640221 mask!2687)))))

(declare-fun b!1461735 () Bool)

(assert (=> b!1461735 (= e!821745 e!821741)))

(declare-fun res!991302 () Bool)

(assert (=> b!1461735 (=> res!991302 e!821741)))

(assert (=> b!1461735 (= res!991302 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640224 #b00000000000000000000000000000000) (bvsge lt!640224 (size!48187 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461735 (= lt!640224 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1461737 () Bool)

(assert (=> b!1461737 (= e!821749 (= lt!640227 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640225 lt!640221 mask!2687)))))

(declare-fun b!1461738 () Bool)

(declare-fun res!991297 () Bool)

(assert (=> b!1461738 (=> (not res!991297) (not e!821750))))

(declare-datatypes ((List!34138 0))(
  ( (Nil!34135) (Cons!34134 (h!35484 (_ BitVec 64)) (t!48832 List!34138)) )
))
(declare-fun arrayNoDuplicates!0 (array!98698 (_ BitVec 32) List!34138) Bool)

(assert (=> b!1461738 (= res!991297 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34135))))

(declare-fun b!1461739 () Bool)

(declare-fun res!991286 () Bool)

(assert (=> b!1461739 (=> (not res!991286) (not e!821750))))

(assert (=> b!1461739 (= res!991286 (validKeyInArray!0 (select (arr!47637 a!2862) j!93)))))

(declare-fun b!1461740 () Bool)

(declare-fun e!821742 () Bool)

(assert (=> b!1461740 (= e!821750 e!821742)))

(declare-fun res!991300 () Bool)

(assert (=> b!1461740 (=> (not res!991300) (not e!821742))))

(assert (=> b!1461740 (= res!991300 (= (select (store (arr!47637 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1461740 (= lt!640221 (array!98699 (store (arr!47637 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48187 a!2862)))))

(declare-fun b!1461741 () Bool)

(declare-fun res!991299 () Bool)

(assert (=> b!1461741 (=> (not res!991299) (not e!821744))))

(assert (=> b!1461741 (= res!991299 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47637 a!2862) j!93) a!2862 mask!2687) lt!640226))))

(declare-fun b!1461742 () Bool)

(assert (=> b!1461742 (= e!821741 true)))

(declare-fun lt!640222 () Bool)

(assert (=> b!1461742 (= lt!640222 e!821743)))

(declare-fun c!134729 () Bool)

(assert (=> b!1461742 (= c!134729 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1461743 () Bool)

(declare-fun res!991288 () Bool)

(assert (=> b!1461743 (=> (not res!991288) (not e!821750))))

(assert (=> b!1461743 (= res!991288 (and (= (size!48187 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48187 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48187 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1461744 () Bool)

(assert (=> b!1461744 (= e!821742 e!821744)))

(declare-fun res!991293 () Bool)

(assert (=> b!1461744 (=> (not res!991293) (not e!821744))))

(assert (=> b!1461744 (= res!991293 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47637 a!2862) j!93) mask!2687) (select (arr!47637 a!2862) j!93) a!2862 mask!2687) lt!640226))))

(assert (=> b!1461744 (= lt!640226 (Intermediate!11889 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!991295 () Bool)

(assert (=> start!125250 (=> (not res!991295) (not e!821750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125250 (= res!991295 (validMask!0 mask!2687))))

(assert (=> start!125250 e!821750))

(assert (=> start!125250 true))

(declare-fun array_inv!36665 (array!98698) Bool)

(assert (=> start!125250 (array_inv!36665 a!2862)))

(declare-fun b!1461736 () Bool)

(declare-fun res!991298 () Bool)

(assert (=> b!1461736 (=> (not res!991298) (not e!821748))))

(assert (=> b!1461736 (= res!991298 e!821749)))

(declare-fun c!134730 () Bool)

(assert (=> b!1461736 (= c!134730 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125250 res!991295) b!1461743))

(assert (= (and b!1461743 res!991288) b!1461726))

(assert (= (and b!1461726 res!991290) b!1461739))

(assert (= (and b!1461739 res!991286) b!1461728))

(assert (= (and b!1461728 res!991292) b!1461738))

(assert (= (and b!1461738 res!991297) b!1461733))

(assert (= (and b!1461733 res!991294) b!1461740))

(assert (= (and b!1461740 res!991300) b!1461744))

(assert (= (and b!1461744 res!991293) b!1461741))

(assert (= (and b!1461741 res!991299) b!1461731))

(assert (= (and b!1461731 res!991296) b!1461736))

(assert (= (and b!1461736 c!134730) b!1461737))

(assert (= (and b!1461736 (not c!134730)) b!1461734))

(assert (= (and b!1461736 res!991298) b!1461730))

(assert (= (and b!1461730 res!991303) b!1461725))

(assert (= (and b!1461725 res!991301) b!1461729))

(assert (= (and b!1461729 res!991287) b!1461724))

(assert (= (and b!1461725 (not res!991291)) b!1461735))

(assert (= (and b!1461735 (not res!991302)) b!1461723))

(assert (= (and b!1461723 (not res!991289)) b!1461742))

(assert (= (and b!1461742 c!134729) b!1461732))

(assert (= (and b!1461742 (not c!134729)) b!1461727))

(declare-fun m!1349267 () Bool)

(assert (=> b!1461734 m!1349267))

(declare-fun m!1349269 () Bool)

(assert (=> b!1461734 m!1349269))

(declare-fun m!1349271 () Bool)

(assert (=> b!1461744 m!1349271))

(assert (=> b!1461744 m!1349271))

(declare-fun m!1349273 () Bool)

(assert (=> b!1461744 m!1349273))

(assert (=> b!1461744 m!1349273))

(assert (=> b!1461744 m!1349271))

(declare-fun m!1349275 () Bool)

(assert (=> b!1461744 m!1349275))

(declare-fun m!1349277 () Bool)

(assert (=> b!1461725 m!1349277))

(declare-fun m!1349279 () Bool)

(assert (=> b!1461725 m!1349279))

(declare-fun m!1349281 () Bool)

(assert (=> b!1461725 m!1349281))

(declare-fun m!1349283 () Bool)

(assert (=> b!1461725 m!1349283))

(declare-fun m!1349285 () Bool)

(assert (=> b!1461725 m!1349285))

(assert (=> b!1461725 m!1349271))

(declare-fun m!1349287 () Bool)

(assert (=> b!1461731 m!1349287))

(assert (=> b!1461731 m!1349287))

(declare-fun m!1349289 () Bool)

(assert (=> b!1461731 m!1349289))

(assert (=> b!1461731 m!1349279))

(declare-fun m!1349291 () Bool)

(assert (=> b!1461731 m!1349291))

(declare-fun m!1349293 () Bool)

(assert (=> b!1461732 m!1349293))

(assert (=> b!1461723 m!1349271))

(assert (=> b!1461723 m!1349271))

(declare-fun m!1349295 () Bool)

(assert (=> b!1461723 m!1349295))

(declare-fun m!1349297 () Bool)

(assert (=> b!1461724 m!1349297))

(assert (=> b!1461724 m!1349271))

(declare-fun m!1349299 () Bool)

(assert (=> start!125250 m!1349299))

(declare-fun m!1349301 () Bool)

(assert (=> start!125250 m!1349301))

(declare-fun m!1349303 () Bool)

(assert (=> b!1461726 m!1349303))

(assert (=> b!1461726 m!1349303))

(declare-fun m!1349305 () Bool)

(assert (=> b!1461726 m!1349305))

(declare-fun m!1349307 () Bool)

(assert (=> b!1461727 m!1349307))

(assert (=> b!1461727 m!1349269))

(assert (=> b!1461739 m!1349271))

(assert (=> b!1461739 m!1349271))

(declare-fun m!1349309 () Bool)

(assert (=> b!1461739 m!1349309))

(declare-fun m!1349311 () Bool)

(assert (=> b!1461737 m!1349311))

(assert (=> b!1461740 m!1349279))

(declare-fun m!1349313 () Bool)

(assert (=> b!1461740 m!1349313))

(assert (=> b!1461729 m!1349271))

(assert (=> b!1461729 m!1349271))

(declare-fun m!1349315 () Bool)

(assert (=> b!1461729 m!1349315))

(declare-fun m!1349317 () Bool)

(assert (=> b!1461728 m!1349317))

(declare-fun m!1349319 () Bool)

(assert (=> b!1461735 m!1349319))

(declare-fun m!1349321 () Bool)

(assert (=> b!1461738 m!1349321))

(assert (=> b!1461741 m!1349271))

(assert (=> b!1461741 m!1349271))

(declare-fun m!1349323 () Bool)

(assert (=> b!1461741 m!1349323))

(check-sat (not b!1461744) (not b!1461726) (not b!1461728) (not b!1461727) (not start!125250) (not b!1461739) (not b!1461737) (not b!1461734) (not b!1461741) (not b!1461738) (not b!1461731) (not b!1461735) (not b!1461723) (not b!1461725) (not b!1461729) (not b!1461732))
(check-sat)
