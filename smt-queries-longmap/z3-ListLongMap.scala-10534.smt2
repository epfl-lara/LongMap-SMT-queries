; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124218 () Bool)

(assert start!124218)

(declare-fun b!1437745 () Bool)

(declare-fun res!970526 () Bool)

(declare-fun e!811112 () Bool)

(assert (=> b!1437745 (=> (not res!970526) (not e!811112))))

(declare-datatypes ((array!97783 0))(
  ( (array!97784 (arr!47184 (Array (_ BitVec 32) (_ BitVec 64))) (size!47734 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97783)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437745 (= res!970526 (validKeyInArray!0 (select (arr!47184 a!2862) j!93)))))

(declare-fun b!1437747 () Bool)

(declare-fun res!970527 () Bool)

(assert (=> b!1437747 (=> (not res!970527) (not e!811112))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437747 (= res!970527 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47734 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47734 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47734 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47184 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437748 () Bool)

(declare-fun e!811111 () Bool)

(assert (=> b!1437748 (= e!811112 e!811111)))

(declare-fun res!970529 () Bool)

(assert (=> b!1437748 (=> (not res!970529) (not e!811111))))

(declare-datatypes ((SeekEntryResult!11436 0))(
  ( (MissingZero!11436 (index!48136 (_ BitVec 32))) (Found!11436 (index!48137 (_ BitVec 32))) (Intermediate!11436 (undefined!12248 Bool) (index!48138 (_ BitVec 32)) (x!129867 (_ BitVec 32))) (Undefined!11436) (MissingVacant!11436 (index!48139 (_ BitVec 32))) )
))
(declare-fun lt!632382 () SeekEntryResult!11436)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97783 (_ BitVec 32)) SeekEntryResult!11436)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437748 (= res!970529 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47184 a!2862) j!93) mask!2687) (select (arr!47184 a!2862) j!93) a!2862 mask!2687) lt!632382))))

(assert (=> b!1437748 (= lt!632382 (Intermediate!11436 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1437749 () Bool)

(declare-fun res!970525 () Bool)

(assert (=> b!1437749 (=> (not res!970525) (not e!811111))))

(assert (=> b!1437749 (= res!970525 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47184 a!2862) j!93) a!2862 mask!2687) lt!632382))))

(declare-fun b!1437750 () Bool)

(assert (=> b!1437750 (= e!811111 false)))

(declare-fun lt!632381 () (_ BitVec 32))

(assert (=> b!1437750 (= lt!632381 (toIndex!0 (select (store (arr!47184 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1437751 () Bool)

(declare-fun res!970531 () Bool)

(assert (=> b!1437751 (=> (not res!970531) (not e!811112))))

(assert (=> b!1437751 (= res!970531 (validKeyInArray!0 (select (arr!47184 a!2862) i!1006)))))

(declare-fun b!1437752 () Bool)

(declare-fun res!970528 () Bool)

(assert (=> b!1437752 (=> (not res!970528) (not e!811112))))

(assert (=> b!1437752 (= res!970528 (and (= (size!47734 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47734 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47734 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437753 () Bool)

(declare-fun res!970523 () Bool)

(assert (=> b!1437753 (=> (not res!970523) (not e!811112))))

(declare-datatypes ((List!33685 0))(
  ( (Nil!33682) (Cons!33681 (h!35022 (_ BitVec 64)) (t!48379 List!33685)) )
))
(declare-fun arrayNoDuplicates!0 (array!97783 (_ BitVec 32) List!33685) Bool)

(assert (=> b!1437753 (= res!970523 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33682))))

(declare-fun res!970524 () Bool)

(assert (=> start!124218 (=> (not res!970524) (not e!811112))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124218 (= res!970524 (validMask!0 mask!2687))))

(assert (=> start!124218 e!811112))

(assert (=> start!124218 true))

(declare-fun array_inv!36212 (array!97783) Bool)

(assert (=> start!124218 (array_inv!36212 a!2862)))

(declare-fun b!1437746 () Bool)

(declare-fun res!970530 () Bool)

(assert (=> b!1437746 (=> (not res!970530) (not e!811112))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97783 (_ BitVec 32)) Bool)

(assert (=> b!1437746 (= res!970530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124218 res!970524) b!1437752))

(assert (= (and b!1437752 res!970528) b!1437751))

(assert (= (and b!1437751 res!970531) b!1437745))

(assert (= (and b!1437745 res!970526) b!1437746))

(assert (= (and b!1437746 res!970530) b!1437753))

(assert (= (and b!1437753 res!970523) b!1437747))

(assert (= (and b!1437747 res!970527) b!1437748))

(assert (= (and b!1437748 res!970529) b!1437749))

(assert (= (and b!1437749 res!970525) b!1437750))

(declare-fun m!1326991 () Bool)

(assert (=> b!1437748 m!1326991))

(assert (=> b!1437748 m!1326991))

(declare-fun m!1326993 () Bool)

(assert (=> b!1437748 m!1326993))

(assert (=> b!1437748 m!1326993))

(assert (=> b!1437748 m!1326991))

(declare-fun m!1326995 () Bool)

(assert (=> b!1437748 m!1326995))

(declare-fun m!1326997 () Bool)

(assert (=> start!124218 m!1326997))

(declare-fun m!1326999 () Bool)

(assert (=> start!124218 m!1326999))

(declare-fun m!1327001 () Bool)

(assert (=> b!1437753 m!1327001))

(declare-fun m!1327003 () Bool)

(assert (=> b!1437747 m!1327003))

(declare-fun m!1327005 () Bool)

(assert (=> b!1437747 m!1327005))

(declare-fun m!1327007 () Bool)

(assert (=> b!1437751 m!1327007))

(assert (=> b!1437751 m!1327007))

(declare-fun m!1327009 () Bool)

(assert (=> b!1437751 m!1327009))

(declare-fun m!1327011 () Bool)

(assert (=> b!1437746 m!1327011))

(assert (=> b!1437745 m!1326991))

(assert (=> b!1437745 m!1326991))

(declare-fun m!1327013 () Bool)

(assert (=> b!1437745 m!1327013))

(assert (=> b!1437750 m!1327003))

(declare-fun m!1327015 () Bool)

(assert (=> b!1437750 m!1327015))

(assert (=> b!1437750 m!1327015))

(declare-fun m!1327017 () Bool)

(assert (=> b!1437750 m!1327017))

(assert (=> b!1437749 m!1326991))

(assert (=> b!1437749 m!1326991))

(declare-fun m!1327019 () Bool)

(assert (=> b!1437749 m!1327019))

(check-sat (not b!1437751) (not b!1437749) (not b!1437753) (not b!1437746) (not start!124218) (not b!1437748) (not b!1437750) (not b!1437745))
(check-sat)
