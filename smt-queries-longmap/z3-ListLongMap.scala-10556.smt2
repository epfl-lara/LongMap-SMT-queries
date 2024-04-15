; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124444 () Bool)

(assert start!124444)

(declare-fun b!1440043 () Bool)

(declare-fun res!972595 () Bool)

(declare-fun e!812005 () Bool)

(assert (=> b!1440043 (=> (not res!972595) (not e!812005))))

(declare-datatypes ((array!97870 0))(
  ( (array!97871 (arr!47224 (Array (_ BitVec 32) (_ BitVec 64))) (size!47776 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97870)

(declare-datatypes ((List!33803 0))(
  ( (Nil!33800) (Cons!33799 (h!35149 (_ BitVec 64)) (t!48489 List!33803)) )
))
(declare-fun arrayNoDuplicates!0 (array!97870 (_ BitVec 32) List!33803) Bool)

(assert (=> b!1440043 (= res!972595 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33800))))

(declare-fun b!1440044 () Bool)

(declare-fun res!972589 () Bool)

(assert (=> b!1440044 (=> (not res!972589) (not e!812005))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440044 (= res!972589 (validKeyInArray!0 (select (arr!47224 a!2862) i!1006)))))

(declare-fun b!1440045 () Bool)

(declare-fun e!812007 () Bool)

(assert (=> b!1440045 (= e!812007 false)))

(declare-datatypes ((SeekEntryResult!11501 0))(
  ( (MissingZero!11501 (index!48396 (_ BitVec 32))) (Found!11501 (index!48397 (_ BitVec 32))) (Intermediate!11501 (undefined!12313 Bool) (index!48398 (_ BitVec 32)) (x!130121 (_ BitVec 32))) (Undefined!11501) (MissingVacant!11501 (index!48399 (_ BitVec 32))) )
))
(declare-fun lt!632702 () SeekEntryResult!11501)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97870 (_ BitVec 32)) SeekEntryResult!11501)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440045 (= lt!632702 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47224 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47224 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97871 (store (arr!47224 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47776 a!2862)) mask!2687))))

(declare-fun b!1440046 () Bool)

(assert (=> b!1440046 (= e!812005 e!812007)))

(declare-fun res!972591 () Bool)

(assert (=> b!1440046 (=> (not res!972591) (not e!812007))))

(declare-fun lt!632703 () SeekEntryResult!11501)

(assert (=> b!1440046 (= res!972591 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47224 a!2862) j!93) mask!2687) (select (arr!47224 a!2862) j!93) a!2862 mask!2687) lt!632703))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440046 (= lt!632703 (Intermediate!11501 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440047 () Bool)

(declare-fun res!972588 () Bool)

(assert (=> b!1440047 (=> (not res!972588) (not e!812005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97870 (_ BitVec 32)) Bool)

(assert (=> b!1440047 (= res!972588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440049 () Bool)

(declare-fun res!972594 () Bool)

(assert (=> b!1440049 (=> (not res!972594) (not e!812005))))

(assert (=> b!1440049 (= res!972594 (and (= (size!47776 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47776 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47776 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!972590 () Bool)

(assert (=> start!124444 (=> (not res!972590) (not e!812005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124444 (= res!972590 (validMask!0 mask!2687))))

(assert (=> start!124444 e!812005))

(assert (=> start!124444 true))

(declare-fun array_inv!36457 (array!97870) Bool)

(assert (=> start!124444 (array_inv!36457 a!2862)))

(declare-fun b!1440048 () Bool)

(declare-fun res!972593 () Bool)

(assert (=> b!1440048 (=> (not res!972593) (not e!812005))))

(assert (=> b!1440048 (= res!972593 (validKeyInArray!0 (select (arr!47224 a!2862) j!93)))))

(declare-fun b!1440050 () Bool)

(declare-fun res!972587 () Bool)

(assert (=> b!1440050 (=> (not res!972587) (not e!812005))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440050 (= res!972587 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47776 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47776 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47776 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47224 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440051 () Bool)

(declare-fun res!972592 () Bool)

(assert (=> b!1440051 (=> (not res!972592) (not e!812007))))

(assert (=> b!1440051 (= res!972592 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47224 a!2862) j!93) a!2862 mask!2687) lt!632703))))

(assert (= (and start!124444 res!972590) b!1440049))

(assert (= (and b!1440049 res!972594) b!1440044))

(assert (= (and b!1440044 res!972589) b!1440048))

(assert (= (and b!1440048 res!972593) b!1440047))

(assert (= (and b!1440047 res!972588) b!1440043))

(assert (= (and b!1440043 res!972595) b!1440050))

(assert (= (and b!1440050 res!972587) b!1440046))

(assert (= (and b!1440046 res!972591) b!1440051))

(assert (= (and b!1440051 res!972592) b!1440045))

(declare-fun m!1328727 () Bool)

(assert (=> start!124444 m!1328727))

(declare-fun m!1328729 () Bool)

(assert (=> start!124444 m!1328729))

(declare-fun m!1328731 () Bool)

(assert (=> b!1440044 m!1328731))

(assert (=> b!1440044 m!1328731))

(declare-fun m!1328733 () Bool)

(assert (=> b!1440044 m!1328733))

(declare-fun m!1328735 () Bool)

(assert (=> b!1440051 m!1328735))

(assert (=> b!1440051 m!1328735))

(declare-fun m!1328737 () Bool)

(assert (=> b!1440051 m!1328737))

(declare-fun m!1328739 () Bool)

(assert (=> b!1440047 m!1328739))

(declare-fun m!1328741 () Bool)

(assert (=> b!1440045 m!1328741))

(declare-fun m!1328743 () Bool)

(assert (=> b!1440045 m!1328743))

(assert (=> b!1440045 m!1328743))

(declare-fun m!1328745 () Bool)

(assert (=> b!1440045 m!1328745))

(assert (=> b!1440045 m!1328745))

(assert (=> b!1440045 m!1328743))

(declare-fun m!1328747 () Bool)

(assert (=> b!1440045 m!1328747))

(assert (=> b!1440050 m!1328741))

(declare-fun m!1328749 () Bool)

(assert (=> b!1440050 m!1328749))

(assert (=> b!1440046 m!1328735))

(assert (=> b!1440046 m!1328735))

(declare-fun m!1328751 () Bool)

(assert (=> b!1440046 m!1328751))

(assert (=> b!1440046 m!1328751))

(assert (=> b!1440046 m!1328735))

(declare-fun m!1328753 () Bool)

(assert (=> b!1440046 m!1328753))

(declare-fun m!1328755 () Bool)

(assert (=> b!1440043 m!1328755))

(assert (=> b!1440048 m!1328735))

(assert (=> b!1440048 m!1328735))

(declare-fun m!1328757 () Bool)

(assert (=> b!1440048 m!1328757))

(check-sat (not b!1440048) (not b!1440044) (not start!124444) (not b!1440043) (not b!1440045) (not b!1440046) (not b!1440047) (not b!1440051))
(check-sat)
