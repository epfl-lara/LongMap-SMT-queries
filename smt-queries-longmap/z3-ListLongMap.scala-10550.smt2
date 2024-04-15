; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124408 () Bool)

(assert start!124408)

(declare-fun b!1439521 () Bool)

(declare-fun e!811844 () Bool)

(declare-fun e!811845 () Bool)

(assert (=> b!1439521 (= e!811844 e!811845)))

(declare-fun res!972068 () Bool)

(assert (=> b!1439521 (=> (not res!972068) (not e!811845))))

(declare-datatypes ((array!97834 0))(
  ( (array!97835 (arr!47206 (Array (_ BitVec 32) (_ BitVec 64))) (size!47758 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97834)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11483 0))(
  ( (MissingZero!11483 (index!48324 (_ BitVec 32))) (Found!11483 (index!48325 (_ BitVec 32))) (Intermediate!11483 (undefined!12295 Bool) (index!48326 (_ BitVec 32)) (x!130055 (_ BitVec 32))) (Undefined!11483) (MissingVacant!11483 (index!48327 (_ BitVec 32))) )
))
(declare-fun lt!632622 () SeekEntryResult!11483)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97834 (_ BitVec 32)) SeekEntryResult!11483)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439521 (= res!972068 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47206 a!2862) j!93) mask!2687) (select (arr!47206 a!2862) j!93) a!2862 mask!2687) lt!632622))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1439521 (= lt!632622 (Intermediate!11483 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439522 () Bool)

(assert (=> b!1439522 (= e!811845 false)))

(declare-fun lt!632621 () SeekEntryResult!11483)

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1439522 (= lt!632621 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47206 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47206 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97835 (store (arr!47206 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47758 a!2862)) mask!2687))))

(declare-fun res!972065 () Bool)

(assert (=> start!124408 (=> (not res!972065) (not e!811844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124408 (= res!972065 (validMask!0 mask!2687))))

(assert (=> start!124408 e!811844))

(assert (=> start!124408 true))

(declare-fun array_inv!36439 (array!97834) Bool)

(assert (=> start!124408 (array_inv!36439 a!2862)))

(declare-fun b!1439523 () Bool)

(declare-fun res!972072 () Bool)

(assert (=> b!1439523 (=> (not res!972072) (not e!811844))))

(assert (=> b!1439523 (= res!972072 (and (= (size!47758 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47758 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47758 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439524 () Bool)

(declare-fun res!972069 () Bool)

(assert (=> b!1439524 (=> (not res!972069) (not e!811844))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439524 (= res!972069 (validKeyInArray!0 (select (arr!47206 a!2862) j!93)))))

(declare-fun b!1439525 () Bool)

(declare-fun res!972073 () Bool)

(assert (=> b!1439525 (=> (not res!972073) (not e!811844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97834 (_ BitVec 32)) Bool)

(assert (=> b!1439525 (= res!972073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439526 () Bool)

(declare-fun res!972066 () Bool)

(assert (=> b!1439526 (=> (not res!972066) (not e!811844))))

(assert (=> b!1439526 (= res!972066 (validKeyInArray!0 (select (arr!47206 a!2862) i!1006)))))

(declare-fun b!1439527 () Bool)

(declare-fun res!972067 () Bool)

(assert (=> b!1439527 (=> (not res!972067) (not e!811844))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1439527 (= res!972067 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47758 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47758 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47758 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47206 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439528 () Bool)

(declare-fun res!972070 () Bool)

(assert (=> b!1439528 (=> (not res!972070) (not e!811844))))

(declare-datatypes ((List!33785 0))(
  ( (Nil!33782) (Cons!33781 (h!35131 (_ BitVec 64)) (t!48471 List!33785)) )
))
(declare-fun arrayNoDuplicates!0 (array!97834 (_ BitVec 32) List!33785) Bool)

(assert (=> b!1439528 (= res!972070 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33782))))

(declare-fun b!1439529 () Bool)

(declare-fun res!972071 () Bool)

(assert (=> b!1439529 (=> (not res!972071) (not e!811845))))

(assert (=> b!1439529 (= res!972071 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47206 a!2862) j!93) a!2862 mask!2687) lt!632622))))

(assert (= (and start!124408 res!972065) b!1439523))

(assert (= (and b!1439523 res!972072) b!1439526))

(assert (= (and b!1439526 res!972066) b!1439524))

(assert (= (and b!1439524 res!972069) b!1439525))

(assert (= (and b!1439525 res!972073) b!1439528))

(assert (= (and b!1439528 res!972070) b!1439527))

(assert (= (and b!1439527 res!972067) b!1439521))

(assert (= (and b!1439521 res!972068) b!1439529))

(assert (= (and b!1439529 res!972071) b!1439522))

(declare-fun m!1328145 () Bool)

(assert (=> b!1439527 m!1328145))

(declare-fun m!1328147 () Bool)

(assert (=> b!1439527 m!1328147))

(declare-fun m!1328149 () Bool)

(assert (=> b!1439525 m!1328149))

(declare-fun m!1328151 () Bool)

(assert (=> b!1439528 m!1328151))

(declare-fun m!1328153 () Bool)

(assert (=> start!124408 m!1328153))

(declare-fun m!1328155 () Bool)

(assert (=> start!124408 m!1328155))

(declare-fun m!1328157 () Bool)

(assert (=> b!1439526 m!1328157))

(assert (=> b!1439526 m!1328157))

(declare-fun m!1328159 () Bool)

(assert (=> b!1439526 m!1328159))

(assert (=> b!1439522 m!1328145))

(declare-fun m!1328161 () Bool)

(assert (=> b!1439522 m!1328161))

(assert (=> b!1439522 m!1328161))

(declare-fun m!1328163 () Bool)

(assert (=> b!1439522 m!1328163))

(assert (=> b!1439522 m!1328163))

(assert (=> b!1439522 m!1328161))

(declare-fun m!1328165 () Bool)

(assert (=> b!1439522 m!1328165))

(declare-fun m!1328167 () Bool)

(assert (=> b!1439524 m!1328167))

(assert (=> b!1439524 m!1328167))

(declare-fun m!1328169 () Bool)

(assert (=> b!1439524 m!1328169))

(assert (=> b!1439529 m!1328167))

(assert (=> b!1439529 m!1328167))

(declare-fun m!1328171 () Bool)

(assert (=> b!1439529 m!1328171))

(assert (=> b!1439521 m!1328167))

(assert (=> b!1439521 m!1328167))

(declare-fun m!1328173 () Bool)

(assert (=> b!1439521 m!1328173))

(assert (=> b!1439521 m!1328173))

(assert (=> b!1439521 m!1328167))

(declare-fun m!1328175 () Bool)

(assert (=> b!1439521 m!1328175))

(check-sat (not b!1439524) (not b!1439528) (not start!124408) (not b!1439522) (not b!1439529) (not b!1439525) (not b!1439526) (not b!1439521))
(check-sat)
