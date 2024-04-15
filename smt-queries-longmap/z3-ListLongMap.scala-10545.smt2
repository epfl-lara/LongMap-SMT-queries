; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124378 () Bool)

(assert start!124378)

(declare-fun b!1439084 () Bool)

(declare-fun res!971638 () Bool)

(declare-fun e!811701 () Bool)

(assert (=> b!1439084 (=> (not res!971638) (not e!811701))))

(declare-datatypes ((array!97804 0))(
  ( (array!97805 (arr!47191 (Array (_ BitVec 32) (_ BitVec 64))) (size!47743 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97804)

(declare-datatypes ((List!33770 0))(
  ( (Nil!33767) (Cons!33766 (h!35116 (_ BitVec 64)) (t!48456 List!33770)) )
))
(declare-fun arrayNoDuplicates!0 (array!97804 (_ BitVec 32) List!33770) Bool)

(assert (=> b!1439084 (= res!971638 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33767))))

(declare-fun b!1439085 () Bool)

(declare-fun res!971633 () Bool)

(assert (=> b!1439085 (=> (not res!971633) (not e!811701))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439085 (= res!971633 (validKeyInArray!0 (select (arr!47191 a!2862) j!93)))))

(declare-fun res!971631 () Bool)

(assert (=> start!124378 (=> (not res!971631) (not e!811701))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124378 (= res!971631 (validMask!0 mask!2687))))

(assert (=> start!124378 e!811701))

(assert (=> start!124378 true))

(declare-fun array_inv!36424 (array!97804) Bool)

(assert (=> start!124378 (array_inv!36424 a!2862)))

(declare-fun b!1439086 () Bool)

(declare-fun res!971637 () Bool)

(assert (=> b!1439086 (=> (not res!971637) (not e!811701))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1439086 (= res!971637 (validKeyInArray!0 (select (arr!47191 a!2862) i!1006)))))

(declare-fun b!1439087 () Bool)

(declare-fun res!971634 () Bool)

(assert (=> b!1439087 (=> (not res!971634) (not e!811701))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1439087 (= res!971634 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47743 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47743 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47743 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47191 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439088 () Bool)

(declare-fun e!811702 () Bool)

(declare-fun e!811703 () Bool)

(assert (=> b!1439088 (= e!811702 e!811703)))

(declare-fun res!971628 () Bool)

(assert (=> b!1439088 (=> (not res!971628) (not e!811703))))

(declare-fun lt!632549 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11468 0))(
  ( (MissingZero!11468 (index!48264 (_ BitVec 32))) (Found!11468 (index!48265 (_ BitVec 32))) (Intermediate!11468 (undefined!12280 Bool) (index!48266 (_ BitVec 32)) (x!130000 (_ BitVec 32))) (Undefined!11468) (MissingVacant!11468 (index!48267 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97804 (_ BitVec 32)) SeekEntryResult!11468)

(assert (=> b!1439088 (= res!971628 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!632549 (select (store (arr!47191 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97805 (store (arr!47191 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47743 a!2862)) mask!2687) (Intermediate!11468 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439088 (= lt!632549 (toIndex!0 (select (store (arr!47191 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1439089 () Bool)

(assert (=> b!1439089 (= e!811701 e!811702)))

(declare-fun res!971629 () Bool)

(assert (=> b!1439089 (=> (not res!971629) (not e!811702))))

(declare-fun lt!632550 () SeekEntryResult!11468)

(assert (=> b!1439089 (= res!971629 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47191 a!2862) j!93) mask!2687) (select (arr!47191 a!2862) j!93) a!2862 mask!2687) lt!632550))))

(assert (=> b!1439089 (= lt!632550 (Intermediate!11468 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439090 () Bool)

(declare-fun res!971632 () Bool)

(assert (=> b!1439090 (=> (not res!971632) (not e!811701))))

(assert (=> b!1439090 (= res!971632 (and (= (size!47743 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47743 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47743 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439091 () Bool)

(declare-fun res!971630 () Bool)

(assert (=> b!1439091 (=> (not res!971630) (not e!811701))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97804 (_ BitVec 32)) Bool)

(assert (=> b!1439091 (= res!971630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439092 () Bool)

(declare-fun res!971635 () Bool)

(assert (=> b!1439092 (=> (not res!971635) (not e!811702))))

(assert (=> b!1439092 (= res!971635 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47191 a!2862) j!93) a!2862 mask!2687) lt!632550))))

(declare-fun b!1439093 () Bool)

(declare-fun res!971636 () Bool)

(assert (=> b!1439093 (=> (not res!971636) (not e!811703))))

(assert (=> b!1439093 (= res!971636 (and (bvsle x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvsge lt!632549 #b00000000000000000000000000000000) (bvslt lt!632549 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1439094 () Bool)

(assert (=> b!1439094 (= e!811703 (not (validKeyInArray!0 (select (store (arr!47191 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))))

(assert (= (and start!124378 res!971631) b!1439090))

(assert (= (and b!1439090 res!971632) b!1439086))

(assert (= (and b!1439086 res!971637) b!1439085))

(assert (= (and b!1439085 res!971633) b!1439091))

(assert (= (and b!1439091 res!971630) b!1439084))

(assert (= (and b!1439084 res!971638) b!1439087))

(assert (= (and b!1439087 res!971634) b!1439089))

(assert (= (and b!1439089 res!971629) b!1439092))

(assert (= (and b!1439092 res!971635) b!1439088))

(assert (= (and b!1439088 res!971628) b!1439093))

(assert (= (and b!1439093 res!971636) b!1439094))

(declare-fun m!1327659 () Bool)

(assert (=> b!1439087 m!1327659))

(declare-fun m!1327661 () Bool)

(assert (=> b!1439087 m!1327661))

(assert (=> b!1439094 m!1327659))

(declare-fun m!1327663 () Bool)

(assert (=> b!1439094 m!1327663))

(assert (=> b!1439094 m!1327663))

(declare-fun m!1327665 () Bool)

(assert (=> b!1439094 m!1327665))

(declare-fun m!1327667 () Bool)

(assert (=> b!1439092 m!1327667))

(assert (=> b!1439092 m!1327667))

(declare-fun m!1327669 () Bool)

(assert (=> b!1439092 m!1327669))

(declare-fun m!1327671 () Bool)

(assert (=> b!1439091 m!1327671))

(assert (=> b!1439089 m!1327667))

(assert (=> b!1439089 m!1327667))

(declare-fun m!1327673 () Bool)

(assert (=> b!1439089 m!1327673))

(assert (=> b!1439089 m!1327673))

(assert (=> b!1439089 m!1327667))

(declare-fun m!1327675 () Bool)

(assert (=> b!1439089 m!1327675))

(declare-fun m!1327677 () Bool)

(assert (=> b!1439086 m!1327677))

(assert (=> b!1439086 m!1327677))

(declare-fun m!1327679 () Bool)

(assert (=> b!1439086 m!1327679))

(assert (=> b!1439085 m!1327667))

(assert (=> b!1439085 m!1327667))

(declare-fun m!1327681 () Bool)

(assert (=> b!1439085 m!1327681))

(assert (=> b!1439088 m!1327659))

(assert (=> b!1439088 m!1327663))

(assert (=> b!1439088 m!1327663))

(declare-fun m!1327683 () Bool)

(assert (=> b!1439088 m!1327683))

(assert (=> b!1439088 m!1327663))

(declare-fun m!1327685 () Bool)

(assert (=> b!1439088 m!1327685))

(declare-fun m!1327687 () Bool)

(assert (=> b!1439084 m!1327687))

(declare-fun m!1327689 () Bool)

(assert (=> start!124378 m!1327689))

(declare-fun m!1327691 () Bool)

(assert (=> start!124378 m!1327691))

(check-sat (not b!1439091) (not b!1439092) (not b!1439089) (not b!1439084) (not b!1439085) (not b!1439088) (not b!1439094) (not b!1439086) (not start!124378))
(check-sat)
