; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124626 () Bool)

(assert start!124626)

(declare-fun b!1440606 () Bool)

(declare-fun res!972216 () Bool)

(declare-fun e!812656 () Bool)

(assert (=> b!1440606 (=> (not res!972216) (not e!812656))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97969 0))(
  ( (array!97970 (arr!47269 (Array (_ BitVec 32) (_ BitVec 64))) (size!47820 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97969)

(assert (=> b!1440606 (= res!972216 (and (= (size!47820 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47820 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47820 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440607 () Bool)

(declare-fun res!972213 () Bool)

(assert (=> b!1440607 (=> (not res!972213) (not e!812656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440607 (= res!972213 (validKeyInArray!0 (select (arr!47269 a!2862) j!93)))))

(declare-fun b!1440608 () Bool)

(declare-fun res!972208 () Bool)

(declare-fun e!812658 () Bool)

(assert (=> b!1440608 (=> (not res!972208) (not e!812658))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11418 0))(
  ( (MissingZero!11418 (index!48064 (_ BitVec 32))) (Found!11418 (index!48065 (_ BitVec 32))) (Intermediate!11418 (undefined!12230 Bool) (index!48066 (_ BitVec 32)) (x!129979 (_ BitVec 32))) (Undefined!11418) (MissingVacant!11418 (index!48067 (_ BitVec 32))) )
))
(declare-fun lt!633262 () SeekEntryResult!11418)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97969 (_ BitVec 32)) SeekEntryResult!11418)

(assert (=> b!1440608 (= res!972208 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47269 a!2862) j!93) a!2862 mask!2687) lt!633262))))

(declare-fun b!1440609 () Bool)

(declare-fun res!972212 () Bool)

(assert (=> b!1440609 (=> (not res!972212) (not e!812656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97969 (_ BitVec 32)) Bool)

(assert (=> b!1440609 (= res!972212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440610 () Bool)

(declare-fun res!972211 () Bool)

(assert (=> b!1440610 (=> (not res!972211) (not e!812656))))

(declare-datatypes ((List!33757 0))(
  ( (Nil!33754) (Cons!33753 (h!35114 (_ BitVec 64)) (t!48443 List!33757)) )
))
(declare-fun arrayNoDuplicates!0 (array!97969 (_ BitVec 32) List!33757) Bool)

(assert (=> b!1440610 (= res!972211 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33754))))

(declare-fun e!812657 () Bool)

(declare-fun b!1440611 () Bool)

(assert (=> b!1440611 (= e!812657 (not (validKeyInArray!0 (select (store (arr!47269 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))))

(declare-fun b!1440612 () Bool)

(declare-fun res!972217 () Bool)

(assert (=> b!1440612 (=> (not res!972217) (not e!812656))))

(assert (=> b!1440612 (= res!972217 (validKeyInArray!0 (select (arr!47269 a!2862) i!1006)))))

(declare-fun b!1440613 () Bool)

(assert (=> b!1440613 (= e!812656 e!812658)))

(declare-fun res!972210 () Bool)

(assert (=> b!1440613 (=> (not res!972210) (not e!812658))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440613 (= res!972210 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47269 a!2862) j!93) mask!2687) (select (arr!47269 a!2862) j!93) a!2862 mask!2687) lt!633262))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440613 (= lt!633262 (Intermediate!11418 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440614 () Bool)

(assert (=> b!1440614 (= e!812658 e!812657)))

(declare-fun res!972209 () Bool)

(assert (=> b!1440614 (=> (not res!972209) (not e!812657))))

(declare-fun lt!633261 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440614 (= res!972209 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!633261 (select (store (arr!47269 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97970 (store (arr!47269 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47820 a!2862)) mask!2687) (Intermediate!11418 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1440614 (= lt!633261 (toIndex!0 (select (store (arr!47269 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun res!972215 () Bool)

(assert (=> start!124626 (=> (not res!972215) (not e!812656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124626 (= res!972215 (validMask!0 mask!2687))))

(assert (=> start!124626 e!812656))

(assert (=> start!124626 true))

(declare-fun array_inv!36550 (array!97969) Bool)

(assert (=> start!124626 (array_inv!36550 a!2862)))

(declare-fun b!1440615 () Bool)

(declare-fun res!972214 () Bool)

(assert (=> b!1440615 (=> (not res!972214) (not e!812657))))

(assert (=> b!1440615 (= res!972214 (and (bvsle x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvsge lt!633261 #b00000000000000000000000000000000) (bvslt lt!633261 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1440616 () Bool)

(declare-fun res!972218 () Bool)

(assert (=> b!1440616 (=> (not res!972218) (not e!812656))))

(assert (=> b!1440616 (= res!972218 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47820 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47820 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47820 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47269 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124626 res!972215) b!1440606))

(assert (= (and b!1440606 res!972216) b!1440612))

(assert (= (and b!1440612 res!972217) b!1440607))

(assert (= (and b!1440607 res!972213) b!1440609))

(assert (= (and b!1440609 res!972212) b!1440610))

(assert (= (and b!1440610 res!972211) b!1440616))

(assert (= (and b!1440616 res!972218) b!1440613))

(assert (= (and b!1440613 res!972210) b!1440608))

(assert (= (and b!1440608 res!972208) b!1440614))

(assert (= (and b!1440614 res!972209) b!1440615))

(assert (= (and b!1440615 res!972214) b!1440611))

(declare-fun m!1329775 () Bool)

(assert (=> b!1440610 m!1329775))

(declare-fun m!1329777 () Bool)

(assert (=> b!1440612 m!1329777))

(assert (=> b!1440612 m!1329777))

(declare-fun m!1329779 () Bool)

(assert (=> b!1440612 m!1329779))

(declare-fun m!1329781 () Bool)

(assert (=> b!1440609 m!1329781))

(declare-fun m!1329783 () Bool)

(assert (=> start!124626 m!1329783))

(declare-fun m!1329785 () Bool)

(assert (=> start!124626 m!1329785))

(declare-fun m!1329787 () Bool)

(assert (=> b!1440611 m!1329787))

(declare-fun m!1329789 () Bool)

(assert (=> b!1440611 m!1329789))

(assert (=> b!1440611 m!1329789))

(declare-fun m!1329791 () Bool)

(assert (=> b!1440611 m!1329791))

(declare-fun m!1329793 () Bool)

(assert (=> b!1440607 m!1329793))

(assert (=> b!1440607 m!1329793))

(declare-fun m!1329795 () Bool)

(assert (=> b!1440607 m!1329795))

(assert (=> b!1440614 m!1329787))

(assert (=> b!1440614 m!1329789))

(assert (=> b!1440614 m!1329789))

(declare-fun m!1329797 () Bool)

(assert (=> b!1440614 m!1329797))

(assert (=> b!1440614 m!1329789))

(declare-fun m!1329799 () Bool)

(assert (=> b!1440614 m!1329799))

(assert (=> b!1440608 m!1329793))

(assert (=> b!1440608 m!1329793))

(declare-fun m!1329801 () Bool)

(assert (=> b!1440608 m!1329801))

(assert (=> b!1440613 m!1329793))

(assert (=> b!1440613 m!1329793))

(declare-fun m!1329803 () Bool)

(assert (=> b!1440613 m!1329803))

(assert (=> b!1440613 m!1329803))

(assert (=> b!1440613 m!1329793))

(declare-fun m!1329805 () Bool)

(assert (=> b!1440613 m!1329805))

(assert (=> b!1440616 m!1329787))

(declare-fun m!1329807 () Bool)

(assert (=> b!1440616 m!1329807))

(check-sat (not start!124626) (not b!1440614) (not b!1440611) (not b!1440610) (not b!1440613) (not b!1440612) (not b!1440607) (not b!1440608) (not b!1440609))
(check-sat)
