; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126848 () Bool)

(assert start!126848)

(declare-fun b!1490689 () Bool)

(declare-fun res!1014139 () Bool)

(declare-fun e!835230 () Bool)

(assert (=> b!1490689 (=> (not res!1014139) (not e!835230))))

(declare-datatypes ((array!99619 0))(
  ( (array!99620 (arr!48082 (Array (_ BitVec 32) (_ BitVec 64))) (size!48634 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99619)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12347 0))(
  ( (MissingZero!12347 (index!51780 (_ BitVec 32))) (Found!12347 (index!51781 (_ BitVec 32))) (Intermediate!12347 (undefined!13159 Bool) (index!51782 (_ BitVec 32)) (x!133364 (_ BitVec 32))) (Undefined!12347) (MissingVacant!12347 (index!51783 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99619 (_ BitVec 32)) SeekEntryResult!12347)

(assert (=> b!1490689 (= res!1014139 (= (seekEntryOrOpen!0 (select (arr!48082 a!2862) j!93) a!2862 mask!2687) (Found!12347 j!93)))))

(declare-fun b!1490690 () Bool)

(declare-fun res!1014138 () Bool)

(declare-fun e!835235 () Bool)

(assert (=> b!1490690 (=> (not res!1014138) (not e!835235))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!649850 () SeekEntryResult!12347)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99619 (_ BitVec 32)) SeekEntryResult!12347)

(assert (=> b!1490690 (= res!1014138 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48082 a!2862) j!93) a!2862 mask!2687) lt!649850))))

(declare-fun b!1490691 () Bool)

(declare-fun e!835234 () Bool)

(assert (=> b!1490691 (= e!835235 e!835234)))

(declare-fun res!1014128 () Bool)

(assert (=> b!1490691 (=> (not res!1014128) (not e!835234))))

(declare-fun lt!649849 () SeekEntryResult!12347)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1490691 (= res!1014128 (= lt!649849 (Intermediate!12347 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!649846 () (_ BitVec 64))

(declare-fun lt!649845 () array!99619)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490691 (= lt!649849 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649846 mask!2687) lt!649846 lt!649845 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1490691 (= lt!649846 (select (store (arr!48082 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490692 () Bool)

(declare-fun res!1014125 () Bool)

(declare-fun e!835233 () Bool)

(assert (=> b!1490692 (=> (not res!1014125) (not e!835233))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490692 (= res!1014125 (validKeyInArray!0 (select (arr!48082 a!2862) j!93)))))

(declare-fun b!1490693 () Bool)

(declare-fun res!1014133 () Bool)

(assert (=> b!1490693 (=> (not res!1014133) (not e!835233))))

(assert (=> b!1490693 (= res!1014133 (and (= (size!48634 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48634 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48634 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490694 () Bool)

(declare-fun res!1014135 () Bool)

(assert (=> b!1490694 (=> (not res!1014135) (not e!835233))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99619 (_ BitVec 32)) Bool)

(assert (=> b!1490694 (= res!1014135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1490695 () Bool)

(declare-fun res!1014124 () Bool)

(assert (=> b!1490695 (=> (not res!1014124) (not e!835233))))

(declare-datatypes ((List!34661 0))(
  ( (Nil!34658) (Cons!34657 (h!36040 (_ BitVec 64)) (t!49347 List!34661)) )
))
(declare-fun arrayNoDuplicates!0 (array!99619 (_ BitVec 32) List!34661) Bool)

(assert (=> b!1490695 (= res!1014124 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34658))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1490696 () Bool)

(assert (=> b!1490696 (= e!835230 (or (= (select (arr!48082 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48082 a!2862) intermediateBeforeIndex!19) (select (arr!48082 a!2862) j!93))))))

(declare-fun b!1490697 () Bool)

(declare-fun res!1014129 () Bool)

(assert (=> b!1490697 (=> (not res!1014129) (not e!835233))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1490697 (= res!1014129 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48634 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48634 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48634 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1014130 () Bool)

(assert (=> start!126848 (=> (not res!1014130) (not e!835233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126848 (= res!1014130 (validMask!0 mask!2687))))

(assert (=> start!126848 e!835233))

(assert (=> start!126848 true))

(declare-fun array_inv!37315 (array!99619) Bool)

(assert (=> start!126848 (array_inv!37315 a!2862)))

(declare-fun b!1490698 () Bool)

(declare-fun e!835228 () Bool)

(assert (=> b!1490698 (= e!835233 e!835228)))

(declare-fun res!1014131 () Bool)

(assert (=> b!1490698 (=> (not res!1014131) (not e!835228))))

(assert (=> b!1490698 (= res!1014131 (= (select (store (arr!48082 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490698 (= lt!649845 (array!99620 (store (arr!48082 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48634 a!2862)))))

(declare-fun b!1490699 () Bool)

(declare-fun res!1014134 () Bool)

(assert (=> b!1490699 (=> (not res!1014134) (not e!835234))))

(assert (=> b!1490699 (= res!1014134 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1490700 () Bool)

(declare-fun e!835232 () Bool)

(assert (=> b!1490700 (= e!835232 (= lt!649849 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649846 lt!649845 mask!2687)))))

(declare-fun b!1490701 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99619 (_ BitVec 32)) SeekEntryResult!12347)

(assert (=> b!1490701 (= e!835232 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649846 lt!649845 mask!2687) (seekEntryOrOpen!0 lt!649846 lt!649845 mask!2687)))))

(declare-fun b!1490702 () Bool)

(declare-fun e!835229 () Bool)

(assert (=> b!1490702 (= e!835234 (not e!835229))))

(declare-fun res!1014136 () Bool)

(assert (=> b!1490702 (=> res!1014136 e!835229)))

(assert (=> b!1490702 (= res!1014136 (or (and (= (select (arr!48082 a!2862) index!646) (select (store (arr!48082 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48082 a!2862) index!646) (select (arr!48082 a!2862) j!93))) (= (select (arr!48082 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1490702 e!835230))

(declare-fun res!1014132 () Bool)

(assert (=> b!1490702 (=> (not res!1014132) (not e!835230))))

(assert (=> b!1490702 (= res!1014132 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49875 0))(
  ( (Unit!49876) )
))
(declare-fun lt!649847 () Unit!49875)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99619 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49875)

(assert (=> b!1490702 (= lt!649847 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1490703 () Bool)

(declare-fun res!1014127 () Bool)

(assert (=> b!1490703 (=> (not res!1014127) (not e!835233))))

(assert (=> b!1490703 (= res!1014127 (validKeyInArray!0 (select (arr!48082 a!2862) i!1006)))))

(declare-fun b!1490704 () Bool)

(assert (=> b!1490704 (= e!835229 true)))

(declare-fun lt!649848 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490704 (= lt!649848 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1490705 () Bool)

(declare-fun res!1014126 () Bool)

(assert (=> b!1490705 (=> (not res!1014126) (not e!835234))))

(assert (=> b!1490705 (= res!1014126 e!835232)))

(declare-fun c!137812 () Bool)

(assert (=> b!1490705 (= c!137812 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1490706 () Bool)

(assert (=> b!1490706 (= e!835228 e!835235)))

(declare-fun res!1014137 () Bool)

(assert (=> b!1490706 (=> (not res!1014137) (not e!835235))))

(assert (=> b!1490706 (= res!1014137 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48082 a!2862) j!93) mask!2687) (select (arr!48082 a!2862) j!93) a!2862 mask!2687) lt!649850))))

(assert (=> b!1490706 (= lt!649850 (Intermediate!12347 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!126848 res!1014130) b!1490693))

(assert (= (and b!1490693 res!1014133) b!1490703))

(assert (= (and b!1490703 res!1014127) b!1490692))

(assert (= (and b!1490692 res!1014125) b!1490694))

(assert (= (and b!1490694 res!1014135) b!1490695))

(assert (= (and b!1490695 res!1014124) b!1490697))

(assert (= (and b!1490697 res!1014129) b!1490698))

(assert (= (and b!1490698 res!1014131) b!1490706))

(assert (= (and b!1490706 res!1014137) b!1490690))

(assert (= (and b!1490690 res!1014138) b!1490691))

(assert (= (and b!1490691 res!1014128) b!1490705))

(assert (= (and b!1490705 c!137812) b!1490700))

(assert (= (and b!1490705 (not c!137812)) b!1490701))

(assert (= (and b!1490705 res!1014126) b!1490699))

(assert (= (and b!1490699 res!1014134) b!1490702))

(assert (= (and b!1490702 res!1014132) b!1490689))

(assert (= (and b!1490689 res!1014139) b!1490696))

(assert (= (and b!1490702 (not res!1014136)) b!1490704))

(declare-fun m!1374291 () Bool)

(assert (=> b!1490702 m!1374291))

(declare-fun m!1374293 () Bool)

(assert (=> b!1490702 m!1374293))

(declare-fun m!1374295 () Bool)

(assert (=> b!1490702 m!1374295))

(declare-fun m!1374297 () Bool)

(assert (=> b!1490702 m!1374297))

(declare-fun m!1374299 () Bool)

(assert (=> b!1490702 m!1374299))

(declare-fun m!1374301 () Bool)

(assert (=> b!1490702 m!1374301))

(assert (=> b!1490690 m!1374301))

(assert (=> b!1490690 m!1374301))

(declare-fun m!1374303 () Bool)

(assert (=> b!1490690 m!1374303))

(declare-fun m!1374305 () Bool)

(assert (=> b!1490691 m!1374305))

(assert (=> b!1490691 m!1374305))

(declare-fun m!1374307 () Bool)

(assert (=> b!1490691 m!1374307))

(assert (=> b!1490691 m!1374293))

(declare-fun m!1374309 () Bool)

(assert (=> b!1490691 m!1374309))

(declare-fun m!1374311 () Bool)

(assert (=> b!1490695 m!1374311))

(declare-fun m!1374313 () Bool)

(assert (=> start!126848 m!1374313))

(declare-fun m!1374315 () Bool)

(assert (=> start!126848 m!1374315))

(declare-fun m!1374317 () Bool)

(assert (=> b!1490696 m!1374317))

(assert (=> b!1490696 m!1374301))

(declare-fun m!1374319 () Bool)

(assert (=> b!1490700 m!1374319))

(assert (=> b!1490692 m!1374301))

(assert (=> b!1490692 m!1374301))

(declare-fun m!1374321 () Bool)

(assert (=> b!1490692 m!1374321))

(declare-fun m!1374323 () Bool)

(assert (=> b!1490703 m!1374323))

(assert (=> b!1490703 m!1374323))

(declare-fun m!1374325 () Bool)

(assert (=> b!1490703 m!1374325))

(declare-fun m!1374327 () Bool)

(assert (=> b!1490704 m!1374327))

(declare-fun m!1374329 () Bool)

(assert (=> b!1490694 m!1374329))

(assert (=> b!1490698 m!1374293))

(declare-fun m!1374331 () Bool)

(assert (=> b!1490698 m!1374331))

(assert (=> b!1490706 m!1374301))

(assert (=> b!1490706 m!1374301))

(declare-fun m!1374333 () Bool)

(assert (=> b!1490706 m!1374333))

(assert (=> b!1490706 m!1374333))

(assert (=> b!1490706 m!1374301))

(declare-fun m!1374335 () Bool)

(assert (=> b!1490706 m!1374335))

(declare-fun m!1374337 () Bool)

(assert (=> b!1490701 m!1374337))

(declare-fun m!1374339 () Bool)

(assert (=> b!1490701 m!1374339))

(assert (=> b!1490689 m!1374301))

(assert (=> b!1490689 m!1374301))

(declare-fun m!1374341 () Bool)

(assert (=> b!1490689 m!1374341))

(check-sat (not b!1490700) (not b!1490704) (not b!1490694) (not b!1490701) (not b!1490695) (not b!1490692) (not b!1490691) (not b!1490703) (not b!1490689) (not start!126848) (not b!1490702) (not b!1490706) (not b!1490690))
(check-sat)
