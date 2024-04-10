; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124434 () Bool)

(assert start!124434)

(declare-fun b!1439658 () Bool)

(declare-fun e!811941 () Bool)

(declare-fun e!811942 () Bool)

(assert (=> b!1439658 (= e!811941 e!811942)))

(declare-fun res!972086 () Bool)

(assert (=> b!1439658 (=> (not res!972086) (not e!811942))))

(declare-datatypes ((array!97882 0))(
  ( (array!97883 (arr!47229 (Array (_ BitVec 32) (_ BitVec 64))) (size!47779 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97882)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11481 0))(
  ( (MissingZero!11481 (index!48316 (_ BitVec 32))) (Found!11481 (index!48317 (_ BitVec 32))) (Intermediate!11481 (undefined!12293 Bool) (index!48318 (_ BitVec 32)) (x!130050 (_ BitVec 32))) (Undefined!11481) (MissingVacant!11481 (index!48319 (_ BitVec 32))) )
))
(declare-fun lt!632847 () SeekEntryResult!11481)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97882 (_ BitVec 32)) SeekEntryResult!11481)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439658 (= res!972086 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47229 a!2862) j!93) mask!2687) (select (arr!47229 a!2862) j!93) a!2862 mask!2687) lt!632847))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1439658 (= lt!632847 (Intermediate!11481 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439659 () Bool)

(declare-fun res!972094 () Bool)

(assert (=> b!1439659 (=> (not res!972094) (not e!811941))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439659 (= res!972094 (validKeyInArray!0 (select (arr!47229 a!2862) j!93)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1439660 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1439660 (= e!811942 (and (bvsle x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1439661 () Bool)

(declare-fun res!972088 () Bool)

(assert (=> b!1439661 (=> (not res!972088) (not e!811942))))

(assert (=> b!1439661 (= res!972088 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47229 a!2862) j!93) a!2862 mask!2687) lt!632847))))

(declare-fun b!1439662 () Bool)

(declare-fun res!972090 () Bool)

(assert (=> b!1439662 (=> (not res!972090) (not e!811941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97882 (_ BitVec 32)) Bool)

(assert (=> b!1439662 (= res!972090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439663 () Bool)

(declare-fun res!972087 () Bool)

(assert (=> b!1439663 (=> (not res!972087) (not e!811941))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1439663 (= res!972087 (validKeyInArray!0 (select (arr!47229 a!2862) i!1006)))))

(declare-fun b!1439664 () Bool)

(declare-fun res!972085 () Bool)

(assert (=> b!1439664 (=> (not res!972085) (not e!811941))))

(assert (=> b!1439664 (= res!972085 (and (= (size!47779 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47779 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47779 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439665 () Bool)

(declare-fun res!972089 () Bool)

(assert (=> b!1439665 (=> (not res!972089) (not e!811941))))

(declare-datatypes ((List!33730 0))(
  ( (Nil!33727) (Cons!33726 (h!35076 (_ BitVec 64)) (t!48424 List!33730)) )
))
(declare-fun arrayNoDuplicates!0 (array!97882 (_ BitVec 32) List!33730) Bool)

(assert (=> b!1439665 (= res!972089 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33727))))

(declare-fun res!972092 () Bool)

(assert (=> start!124434 (=> (not res!972092) (not e!811941))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124434 (= res!972092 (validMask!0 mask!2687))))

(assert (=> start!124434 e!811941))

(assert (=> start!124434 true))

(declare-fun array_inv!36257 (array!97882) Bool)

(assert (=> start!124434 (array_inv!36257 a!2862)))

(declare-fun b!1439666 () Bool)

(declare-fun res!972093 () Bool)

(assert (=> b!1439666 (=> (not res!972093) (not e!811942))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1439666 (= res!972093 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47229 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47229 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97883 (store (arr!47229 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47779 a!2862)) mask!2687) (Intermediate!11481 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1439667 () Bool)

(declare-fun res!972091 () Bool)

(assert (=> b!1439667 (=> (not res!972091) (not e!811941))))

(assert (=> b!1439667 (= res!972091 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47779 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47779 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47779 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47229 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124434 res!972092) b!1439664))

(assert (= (and b!1439664 res!972085) b!1439663))

(assert (= (and b!1439663 res!972087) b!1439659))

(assert (= (and b!1439659 res!972094) b!1439662))

(assert (= (and b!1439662 res!972090) b!1439665))

(assert (= (and b!1439665 res!972089) b!1439667))

(assert (= (and b!1439667 res!972091) b!1439658))

(assert (= (and b!1439658 res!972086) b!1439661))

(assert (= (and b!1439661 res!972088) b!1439666))

(assert (= (and b!1439666 res!972093) b!1439660))

(declare-fun m!1328757 () Bool)

(assert (=> b!1439659 m!1328757))

(assert (=> b!1439659 m!1328757))

(declare-fun m!1328759 () Bool)

(assert (=> b!1439659 m!1328759))

(declare-fun m!1328761 () Bool)

(assert (=> b!1439665 m!1328761))

(declare-fun m!1328763 () Bool)

(assert (=> start!124434 m!1328763))

(declare-fun m!1328765 () Bool)

(assert (=> start!124434 m!1328765))

(assert (=> b!1439658 m!1328757))

(assert (=> b!1439658 m!1328757))

(declare-fun m!1328767 () Bool)

(assert (=> b!1439658 m!1328767))

(assert (=> b!1439658 m!1328767))

(assert (=> b!1439658 m!1328757))

(declare-fun m!1328769 () Bool)

(assert (=> b!1439658 m!1328769))

(declare-fun m!1328771 () Bool)

(assert (=> b!1439662 m!1328771))

(declare-fun m!1328773 () Bool)

(assert (=> b!1439666 m!1328773))

(declare-fun m!1328775 () Bool)

(assert (=> b!1439666 m!1328775))

(assert (=> b!1439666 m!1328775))

(declare-fun m!1328777 () Bool)

(assert (=> b!1439666 m!1328777))

(assert (=> b!1439666 m!1328777))

(assert (=> b!1439666 m!1328775))

(declare-fun m!1328779 () Bool)

(assert (=> b!1439666 m!1328779))

(declare-fun m!1328781 () Bool)

(assert (=> b!1439663 m!1328781))

(assert (=> b!1439663 m!1328781))

(declare-fun m!1328783 () Bool)

(assert (=> b!1439663 m!1328783))

(assert (=> b!1439667 m!1328773))

(declare-fun m!1328785 () Bool)

(assert (=> b!1439667 m!1328785))

(assert (=> b!1439661 m!1328757))

(assert (=> b!1439661 m!1328757))

(declare-fun m!1328787 () Bool)

(assert (=> b!1439661 m!1328787))

(check-sat (not b!1439659) (not b!1439662) (not b!1439661) (not b!1439665) (not b!1439658) (not b!1439663) (not b!1439666) (not start!124434))
(check-sat)
