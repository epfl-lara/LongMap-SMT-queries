; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124540 () Bool)

(assert start!124540)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!812661 () Bool)

(declare-fun b!1441747 () Bool)

(declare-datatypes ((array!97966 0))(
  ( (array!97967 (arr!47272 (Array (_ BitVec 32) (_ BitVec 64))) (size!47824 (_ BitVec 32))) )
))
(declare-fun lt!633176 () array!97966)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!633177 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11549 0))(
  ( (MissingZero!11549 (index!48588 (_ BitVec 32))) (Found!11549 (index!48589 (_ BitVec 32))) (Intermediate!11549 (undefined!12361 Bool) (index!48590 (_ BitVec 32)) (x!130297 (_ BitVec 32))) (Undefined!11549) (MissingVacant!11549 (index!48591 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97966 (_ BitVec 32)) SeekEntryResult!11549)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97966 (_ BitVec 32)) SeekEntryResult!11549)

(assert (=> b!1441747 (= e!812661 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633177 lt!633176 mask!2687) (seekEntryOrOpen!0 lt!633177 lt!633176 mask!2687)))))

(declare-fun b!1441748 () Bool)

(declare-fun res!974153 () Bool)

(declare-fun e!812660 () Bool)

(assert (=> b!1441748 (=> (not res!974153) (not e!812660))))

(declare-fun a!2862 () array!97966)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97966 (_ BitVec 32)) Bool)

(assert (=> b!1441748 (= res!974153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441749 () Bool)

(declare-fun e!812664 () Bool)

(assert (=> b!1441749 (= e!812660 e!812664)))

(declare-fun res!974155 () Bool)

(assert (=> b!1441749 (=> (not res!974155) (not e!812664))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1441749 (= res!974155 (= (select (store (arr!47272 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1441749 (= lt!633176 (array!97967 (store (arr!47272 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47824 a!2862)))))

(declare-fun b!1441750 () Bool)

(declare-fun res!974145 () Bool)

(declare-fun e!812659 () Bool)

(assert (=> b!1441750 (=> (not res!974145) (not e!812659))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441750 (= res!974145 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1441751 () Bool)

(declare-fun res!974148 () Bool)

(declare-fun e!812663 () Bool)

(assert (=> b!1441751 (=> (not res!974148) (not e!812663))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!633180 () SeekEntryResult!11549)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97966 (_ BitVec 32)) SeekEntryResult!11549)

(assert (=> b!1441751 (= res!974148 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47272 a!2862) j!93) a!2862 mask!2687) lt!633180))))

(declare-fun b!1441752 () Bool)

(declare-fun res!974152 () Bool)

(assert (=> b!1441752 (=> (not res!974152) (not e!812660))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441752 (= res!974152 (validKeyInArray!0 (select (arr!47272 a!2862) j!93)))))

(declare-fun b!1441753 () Bool)

(declare-fun res!974147 () Bool)

(assert (=> b!1441753 (=> (not res!974147) (not e!812660))))

(assert (=> b!1441753 (= res!974147 (and (= (size!47824 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47824 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47824 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!974146 () Bool)

(assert (=> start!124540 (=> (not res!974146) (not e!812660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124540 (= res!974146 (validMask!0 mask!2687))))

(assert (=> start!124540 e!812660))

(assert (=> start!124540 true))

(declare-fun array_inv!36505 (array!97966) Bool)

(assert (=> start!124540 (array_inv!36505 a!2862)))

(declare-fun b!1441754 () Bool)

(declare-fun res!974151 () Bool)

(assert (=> b!1441754 (=> (not res!974151) (not e!812660))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1441754 (= res!974151 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47824 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47824 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47824 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1441755 () Bool)

(assert (=> b!1441755 (= e!812659 (not true))))

(assert (=> b!1441755 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48435 0))(
  ( (Unit!48436) )
))
(declare-fun lt!633178 () Unit!48435)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97966 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48435)

(assert (=> b!1441755 (= lt!633178 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1441756 () Bool)

(assert (=> b!1441756 (= e!812663 e!812659)))

(declare-fun res!974144 () Bool)

(assert (=> b!1441756 (=> (not res!974144) (not e!812659))))

(declare-fun lt!633179 () SeekEntryResult!11549)

(assert (=> b!1441756 (= res!974144 (= lt!633179 (Intermediate!11549 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441756 (= lt!633179 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633177 mask!2687) lt!633177 lt!633176 mask!2687))))

(assert (=> b!1441756 (= lt!633177 (select (store (arr!47272 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441757 () Bool)

(declare-fun res!974150 () Bool)

(assert (=> b!1441757 (=> (not res!974150) (not e!812660))))

(declare-datatypes ((List!33851 0))(
  ( (Nil!33848) (Cons!33847 (h!35197 (_ BitVec 64)) (t!48537 List!33851)) )
))
(declare-fun arrayNoDuplicates!0 (array!97966 (_ BitVec 32) List!33851) Bool)

(assert (=> b!1441757 (= res!974150 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33848))))

(declare-fun b!1441758 () Bool)

(declare-fun res!974154 () Bool)

(assert (=> b!1441758 (=> (not res!974154) (not e!812659))))

(assert (=> b!1441758 (= res!974154 e!812661)))

(declare-fun c!133315 () Bool)

(assert (=> b!1441758 (= c!133315 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441759 () Bool)

(assert (=> b!1441759 (= e!812664 e!812663)))

(declare-fun res!974143 () Bool)

(assert (=> b!1441759 (=> (not res!974143) (not e!812663))))

(assert (=> b!1441759 (= res!974143 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47272 a!2862) j!93) mask!2687) (select (arr!47272 a!2862) j!93) a!2862 mask!2687) lt!633180))))

(assert (=> b!1441759 (= lt!633180 (Intermediate!11549 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441760 () Bool)

(assert (=> b!1441760 (= e!812661 (= lt!633179 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633177 lt!633176 mask!2687)))))

(declare-fun b!1441761 () Bool)

(declare-fun res!974149 () Bool)

(assert (=> b!1441761 (=> (not res!974149) (not e!812660))))

(assert (=> b!1441761 (= res!974149 (validKeyInArray!0 (select (arr!47272 a!2862) i!1006)))))

(assert (= (and start!124540 res!974146) b!1441753))

(assert (= (and b!1441753 res!974147) b!1441761))

(assert (= (and b!1441761 res!974149) b!1441752))

(assert (= (and b!1441752 res!974152) b!1441748))

(assert (= (and b!1441748 res!974153) b!1441757))

(assert (= (and b!1441757 res!974150) b!1441754))

(assert (= (and b!1441754 res!974151) b!1441749))

(assert (= (and b!1441749 res!974155) b!1441759))

(assert (= (and b!1441759 res!974143) b!1441751))

(assert (= (and b!1441751 res!974148) b!1441756))

(assert (= (and b!1441756 res!974144) b!1441758))

(assert (= (and b!1441758 c!133315) b!1441760))

(assert (= (and b!1441758 (not c!133315)) b!1441747))

(assert (= (and b!1441758 res!974154) b!1441750))

(assert (= (and b!1441750 res!974145) b!1441755))

(declare-fun m!1330455 () Bool)

(assert (=> b!1441761 m!1330455))

(assert (=> b!1441761 m!1330455))

(declare-fun m!1330457 () Bool)

(assert (=> b!1441761 m!1330457))

(declare-fun m!1330459 () Bool)

(assert (=> b!1441749 m!1330459))

(declare-fun m!1330461 () Bool)

(assert (=> b!1441749 m!1330461))

(declare-fun m!1330463 () Bool)

(assert (=> b!1441748 m!1330463))

(declare-fun m!1330465 () Bool)

(assert (=> b!1441756 m!1330465))

(assert (=> b!1441756 m!1330465))

(declare-fun m!1330467 () Bool)

(assert (=> b!1441756 m!1330467))

(assert (=> b!1441756 m!1330459))

(declare-fun m!1330469 () Bool)

(assert (=> b!1441756 m!1330469))

(declare-fun m!1330471 () Bool)

(assert (=> b!1441759 m!1330471))

(assert (=> b!1441759 m!1330471))

(declare-fun m!1330473 () Bool)

(assert (=> b!1441759 m!1330473))

(assert (=> b!1441759 m!1330473))

(assert (=> b!1441759 m!1330471))

(declare-fun m!1330475 () Bool)

(assert (=> b!1441759 m!1330475))

(declare-fun m!1330477 () Bool)

(assert (=> b!1441757 m!1330477))

(assert (=> b!1441751 m!1330471))

(assert (=> b!1441751 m!1330471))

(declare-fun m!1330479 () Bool)

(assert (=> b!1441751 m!1330479))

(declare-fun m!1330481 () Bool)

(assert (=> b!1441755 m!1330481))

(declare-fun m!1330483 () Bool)

(assert (=> b!1441755 m!1330483))

(declare-fun m!1330485 () Bool)

(assert (=> b!1441760 m!1330485))

(declare-fun m!1330487 () Bool)

(assert (=> b!1441747 m!1330487))

(declare-fun m!1330489 () Bool)

(assert (=> b!1441747 m!1330489))

(declare-fun m!1330491 () Bool)

(assert (=> start!124540 m!1330491))

(declare-fun m!1330493 () Bool)

(assert (=> start!124540 m!1330493))

(assert (=> b!1441752 m!1330471))

(assert (=> b!1441752 m!1330471))

(declare-fun m!1330495 () Bool)

(assert (=> b!1441752 m!1330495))

(check-sat (not b!1441752) (not start!124540) (not b!1441760) (not b!1441748) (not b!1441751) (not b!1441747) (not b!1441761) (not b!1441757) (not b!1441756) (not b!1441755) (not b!1441759))
(check-sat)
