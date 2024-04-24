; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125502 () Bool)

(assert start!125502)

(declare-fun b!1462573 () Bool)

(declare-fun res!991211 () Bool)

(declare-fun e!822418 () Bool)

(assert (=> b!1462573 (=> (not res!991211) (not e!822418))))

(declare-datatypes ((array!98788 0))(
  ( (array!98789 (arr!47677 (Array (_ BitVec 32) (_ BitVec 64))) (size!48228 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98788)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1462573 (= res!991211 (validKeyInArray!0 (select (arr!47677 a!2862) j!93)))))

(declare-fun b!1462574 () Bool)

(declare-fun e!822420 () Bool)

(declare-fun e!822417 () Bool)

(assert (=> b!1462574 (= e!822420 e!822417)))

(declare-fun res!991203 () Bool)

(assert (=> b!1462574 (=> res!991203 e!822417)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!640591 () (_ BitVec 32))

(assert (=> b!1462574 (= res!991203 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640591 #b00000000000000000000000000000000) (bvsge lt!640591 (size!48228 a!2862))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462574 (= lt!640591 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun lt!640586 () (_ BitVec 64))

(declare-fun b!1462575 () Bool)

(declare-fun e!822419 () Bool)

(declare-fun lt!640585 () array!98788)

(declare-datatypes ((SeekEntryResult!11826 0))(
  ( (MissingZero!11826 (index!49696 (_ BitVec 32))) (Found!11826 (index!49697 (_ BitVec 32))) (Intermediate!11826 (undefined!12638 Bool) (index!49698 (_ BitVec 32)) (x!131484 (_ BitVec 32))) (Undefined!11826) (MissingVacant!11826 (index!49699 (_ BitVec 32))) )
))
(declare-fun lt!640590 () SeekEntryResult!11826)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98788 (_ BitVec 32)) SeekEntryResult!11826)

(assert (=> b!1462575 (= e!822419 (= lt!640590 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640586 lt!640585 mask!2687)))))

(declare-fun b!1462576 () Bool)

(declare-fun res!991205 () Bool)

(declare-fun e!822422 () Bool)

(assert (=> b!1462576 (=> (not res!991205) (not e!822422))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1462576 (= res!991205 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1462577 () Bool)

(declare-fun e!822416 () Bool)

(assert (=> b!1462577 (= e!822416 e!822422)))

(declare-fun res!991208 () Bool)

(assert (=> b!1462577 (=> (not res!991208) (not e!822422))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1462577 (= res!991208 (= lt!640590 (Intermediate!11826 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462577 (= lt!640590 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640586 mask!2687) lt!640586 lt!640585 mask!2687))))

(assert (=> b!1462577 (= lt!640586 (select (store (arr!47677 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1462578 () Bool)

(declare-fun res!991210 () Bool)

(assert (=> b!1462578 (=> (not res!991210) (not e!822418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98788 (_ BitVec 32)) Bool)

(assert (=> b!1462578 (= res!991210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1462579 () Bool)

(declare-fun res!991195 () Bool)

(assert (=> b!1462579 (=> (not res!991195) (not e!822416))))

(declare-fun lt!640589 () SeekEntryResult!11826)

(assert (=> b!1462579 (= res!991195 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47677 a!2862) j!93) a!2862 mask!2687) lt!640589))))

(declare-fun b!1462580 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98788 (_ BitVec 32)) SeekEntryResult!11826)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98788 (_ BitVec 32)) SeekEntryResult!11826)

(assert (=> b!1462580 (= e!822419 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640586 lt!640585 mask!2687) (seekEntryOrOpen!0 lt!640586 lt!640585 mask!2687)))))

(declare-fun b!1462581 () Bool)

(declare-fun e!822415 () Bool)

(assert (=> b!1462581 (= e!822418 e!822415)))

(declare-fun res!991199 () Bool)

(assert (=> b!1462581 (=> (not res!991199) (not e!822415))))

(assert (=> b!1462581 (= res!991199 (= (select (store (arr!47677 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462581 (= lt!640585 (array!98789 (store (arr!47677 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48228 a!2862)))))

(declare-fun b!1462582 () Bool)

(assert (=> b!1462582 (= e!822415 e!822416)))

(declare-fun res!991209 () Bool)

(assert (=> b!1462582 (=> (not res!991209) (not e!822416))))

(assert (=> b!1462582 (= res!991209 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47677 a!2862) j!93) mask!2687) (select (arr!47677 a!2862) j!93) a!2862 mask!2687) lt!640589))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1462582 (= lt!640589 (Intermediate!11826 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1462583 () Bool)

(assert (=> b!1462583 (= e!822417 true)))

(declare-fun lt!640587 () Bool)

(declare-fun e!822414 () Bool)

(assert (=> b!1462583 (= lt!640587 e!822414)))

(declare-fun c!135210 () Bool)

(assert (=> b!1462583 (= c!135210 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun e!822423 () Bool)

(declare-fun b!1462585 () Bool)

(assert (=> b!1462585 (= e!822423 (or (= (select (arr!47677 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47677 a!2862) intermediateBeforeIndex!19) (select (arr!47677 a!2862) j!93))))))

(declare-fun b!1462586 () Bool)

(assert (=> b!1462586 (= e!822414 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640591 intermediateAfterIndex!19 lt!640586 lt!640585 mask!2687) (seekEntryOrOpen!0 lt!640586 lt!640585 mask!2687))))))

(declare-fun b!1462587 () Bool)

(declare-fun res!991197 () Bool)

(assert (=> b!1462587 (=> (not res!991197) (not e!822418))))

(assert (=> b!1462587 (= res!991197 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48228 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48228 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48228 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1462588 () Bool)

(declare-fun res!991200 () Bool)

(assert (=> b!1462588 (=> (not res!991200) (not e!822423))))

(assert (=> b!1462588 (= res!991200 (= (seekEntryOrOpen!0 (select (arr!47677 a!2862) j!93) a!2862 mask!2687) (Found!11826 j!93)))))

(declare-fun b!1462589 () Bool)

(declare-fun res!991207 () Bool)

(assert (=> b!1462589 (=> (not res!991207) (not e!822418))))

(assert (=> b!1462589 (= res!991207 (and (= (size!48228 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48228 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48228 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1462590 () Bool)

(assert (=> b!1462590 (= e!822414 (not (= lt!640590 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640591 lt!640586 lt!640585 mask!2687))))))

(declare-fun b!1462591 () Bool)

(declare-fun res!991206 () Bool)

(assert (=> b!1462591 (=> (not res!991206) (not e!822418))))

(assert (=> b!1462591 (= res!991206 (validKeyInArray!0 (select (arr!47677 a!2862) i!1006)))))

(declare-fun b!1462592 () Bool)

(declare-fun res!991194 () Bool)

(assert (=> b!1462592 (=> res!991194 e!822417)))

(assert (=> b!1462592 (= res!991194 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640591 (select (arr!47677 a!2862) j!93) a!2862 mask!2687) lt!640589)))))

(declare-fun b!1462584 () Bool)

(assert (=> b!1462584 (= e!822422 (not e!822420))))

(declare-fun res!991201 () Bool)

(assert (=> b!1462584 (=> res!991201 e!822420)))

(assert (=> b!1462584 (= res!991201 (or (and (= (select (arr!47677 a!2862) index!646) (select (store (arr!47677 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47677 a!2862) index!646) (select (arr!47677 a!2862) j!93))) (= (select (arr!47677 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1462584 e!822423))

(declare-fun res!991196 () Bool)

(assert (=> b!1462584 (=> (not res!991196) (not e!822423))))

(assert (=> b!1462584 (= res!991196 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49181 0))(
  ( (Unit!49182) )
))
(declare-fun lt!640588 () Unit!49181)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98788 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49181)

(assert (=> b!1462584 (= lt!640588 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!991204 () Bool)

(assert (=> start!125502 (=> (not res!991204) (not e!822418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125502 (= res!991204 (validMask!0 mask!2687))))

(assert (=> start!125502 e!822418))

(assert (=> start!125502 true))

(declare-fun array_inv!36958 (array!98788) Bool)

(assert (=> start!125502 (array_inv!36958 a!2862)))

(declare-fun b!1462593 () Bool)

(declare-fun res!991202 () Bool)

(assert (=> b!1462593 (=> (not res!991202) (not e!822418))))

(declare-datatypes ((List!34165 0))(
  ( (Nil!34162) (Cons!34161 (h!35525 (_ BitVec 64)) (t!48851 List!34165)) )
))
(declare-fun arrayNoDuplicates!0 (array!98788 (_ BitVec 32) List!34165) Bool)

(assert (=> b!1462593 (= res!991202 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34162))))

(declare-fun b!1462594 () Bool)

(declare-fun res!991198 () Bool)

(assert (=> b!1462594 (=> (not res!991198) (not e!822422))))

(assert (=> b!1462594 (= res!991198 e!822419)))

(declare-fun c!135211 () Bool)

(assert (=> b!1462594 (= c!135211 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125502 res!991204) b!1462589))

(assert (= (and b!1462589 res!991207) b!1462591))

(assert (= (and b!1462591 res!991206) b!1462573))

(assert (= (and b!1462573 res!991211) b!1462578))

(assert (= (and b!1462578 res!991210) b!1462593))

(assert (= (and b!1462593 res!991202) b!1462587))

(assert (= (and b!1462587 res!991197) b!1462581))

(assert (= (and b!1462581 res!991199) b!1462582))

(assert (= (and b!1462582 res!991209) b!1462579))

(assert (= (and b!1462579 res!991195) b!1462577))

(assert (= (and b!1462577 res!991208) b!1462594))

(assert (= (and b!1462594 c!135211) b!1462575))

(assert (= (and b!1462594 (not c!135211)) b!1462580))

(assert (= (and b!1462594 res!991198) b!1462576))

(assert (= (and b!1462576 res!991205) b!1462584))

(assert (= (and b!1462584 res!991196) b!1462588))

(assert (= (and b!1462588 res!991200) b!1462585))

(assert (= (and b!1462584 (not res!991201)) b!1462574))

(assert (= (and b!1462574 (not res!991203)) b!1462592))

(assert (= (and b!1462592 (not res!991194)) b!1462583))

(assert (= (and b!1462583 c!135210) b!1462590))

(assert (= (and b!1462583 (not c!135210)) b!1462586))

(declare-fun m!1350199 () Bool)

(assert (=> b!1462577 m!1350199))

(assert (=> b!1462577 m!1350199))

(declare-fun m!1350201 () Bool)

(assert (=> b!1462577 m!1350201))

(declare-fun m!1350203 () Bool)

(assert (=> b!1462577 m!1350203))

(declare-fun m!1350205 () Bool)

(assert (=> b!1462577 m!1350205))

(declare-fun m!1350207 () Bool)

(assert (=> b!1462591 m!1350207))

(assert (=> b!1462591 m!1350207))

(declare-fun m!1350209 () Bool)

(assert (=> b!1462591 m!1350209))

(declare-fun m!1350211 () Bool)

(assert (=> b!1462593 m!1350211))

(declare-fun m!1350213 () Bool)

(assert (=> b!1462579 m!1350213))

(assert (=> b!1462579 m!1350213))

(declare-fun m!1350215 () Bool)

(assert (=> b!1462579 m!1350215))

(declare-fun m!1350217 () Bool)

(assert (=> b!1462578 m!1350217))

(assert (=> b!1462588 m!1350213))

(assert (=> b!1462588 m!1350213))

(declare-fun m!1350219 () Bool)

(assert (=> b!1462588 m!1350219))

(declare-fun m!1350221 () Bool)

(assert (=> b!1462584 m!1350221))

(assert (=> b!1462584 m!1350203))

(declare-fun m!1350223 () Bool)

(assert (=> b!1462584 m!1350223))

(declare-fun m!1350225 () Bool)

(assert (=> b!1462584 m!1350225))

(declare-fun m!1350227 () Bool)

(assert (=> b!1462584 m!1350227))

(assert (=> b!1462584 m!1350213))

(declare-fun m!1350229 () Bool)

(assert (=> b!1462590 m!1350229))

(assert (=> b!1462592 m!1350213))

(assert (=> b!1462592 m!1350213))

(declare-fun m!1350231 () Bool)

(assert (=> b!1462592 m!1350231))

(declare-fun m!1350233 () Bool)

(assert (=> b!1462586 m!1350233))

(declare-fun m!1350235 () Bool)

(assert (=> b!1462586 m!1350235))

(assert (=> b!1462573 m!1350213))

(assert (=> b!1462573 m!1350213))

(declare-fun m!1350237 () Bool)

(assert (=> b!1462573 m!1350237))

(declare-fun m!1350239 () Bool)

(assert (=> b!1462580 m!1350239))

(assert (=> b!1462580 m!1350235))

(assert (=> b!1462582 m!1350213))

(assert (=> b!1462582 m!1350213))

(declare-fun m!1350241 () Bool)

(assert (=> b!1462582 m!1350241))

(assert (=> b!1462582 m!1350241))

(assert (=> b!1462582 m!1350213))

(declare-fun m!1350243 () Bool)

(assert (=> b!1462582 m!1350243))

(declare-fun m!1350245 () Bool)

(assert (=> start!125502 m!1350245))

(declare-fun m!1350247 () Bool)

(assert (=> start!125502 m!1350247))

(assert (=> b!1462581 m!1350203))

(declare-fun m!1350249 () Bool)

(assert (=> b!1462581 m!1350249))

(declare-fun m!1350251 () Bool)

(assert (=> b!1462575 m!1350251))

(declare-fun m!1350253 () Bool)

(assert (=> b!1462574 m!1350253))

(declare-fun m!1350255 () Bool)

(assert (=> b!1462585 m!1350255))

(assert (=> b!1462585 m!1350213))

(check-sat (not b!1462588) (not b!1462582) (not b!1462575) (not b!1462574) (not b!1462590) (not b!1462579) (not b!1462573) (not b!1462586) (not b!1462591) (not start!125502) (not b!1462592) (not b!1462580) (not b!1462593) (not b!1462584) (not b!1462577) (not b!1462578))
(check-sat)
