; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124220 () Bool)

(assert start!124220)

(declare-fun b!1437772 () Bool)

(declare-fun res!970553 () Bool)

(declare-fun e!811121 () Bool)

(assert (=> b!1437772 (=> (not res!970553) (not e!811121))))

(declare-datatypes ((array!97785 0))(
  ( (array!97786 (arr!47185 (Array (_ BitVec 32) (_ BitVec 64))) (size!47735 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97785)

(declare-datatypes ((List!33686 0))(
  ( (Nil!33683) (Cons!33682 (h!35023 (_ BitVec 64)) (t!48380 List!33686)) )
))
(declare-fun arrayNoDuplicates!0 (array!97785 (_ BitVec 32) List!33686) Bool)

(assert (=> b!1437772 (= res!970553 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33683))))

(declare-fun b!1437773 () Bool)

(declare-fun res!970552 () Bool)

(assert (=> b!1437773 (=> (not res!970552) (not e!811121))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437773 (= res!970552 (and (= (size!47735 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47735 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47735 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437774 () Bool)

(declare-fun res!970551 () Bool)

(assert (=> b!1437774 (=> (not res!970551) (not e!811121))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437774 (= res!970551 (validKeyInArray!0 (select (arr!47185 a!2862) j!93)))))

(declare-fun b!1437775 () Bool)

(declare-fun res!970555 () Bool)

(assert (=> b!1437775 (=> (not res!970555) (not e!811121))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97785 (_ BitVec 32)) Bool)

(assert (=> b!1437775 (= res!970555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!970554 () Bool)

(assert (=> start!124220 (=> (not res!970554) (not e!811121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124220 (= res!970554 (validMask!0 mask!2687))))

(assert (=> start!124220 e!811121))

(assert (=> start!124220 true))

(declare-fun array_inv!36213 (array!97785) Bool)

(assert (=> start!124220 (array_inv!36213 a!2862)))

(declare-fun b!1437776 () Bool)

(declare-fun e!811119 () Bool)

(assert (=> b!1437776 (= e!811121 e!811119)))

(declare-fun res!970557 () Bool)

(assert (=> b!1437776 (=> (not res!970557) (not e!811119))))

(declare-datatypes ((SeekEntryResult!11437 0))(
  ( (MissingZero!11437 (index!48140 (_ BitVec 32))) (Found!11437 (index!48141 (_ BitVec 32))) (Intermediate!11437 (undefined!12249 Bool) (index!48142 (_ BitVec 32)) (x!129868 (_ BitVec 32))) (Undefined!11437) (MissingVacant!11437 (index!48143 (_ BitVec 32))) )
))
(declare-fun lt!632388 () SeekEntryResult!11437)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97785 (_ BitVec 32)) SeekEntryResult!11437)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437776 (= res!970557 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47185 a!2862) j!93) mask!2687) (select (arr!47185 a!2862) j!93) a!2862 mask!2687) lt!632388))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1437776 (= lt!632388 (Intermediate!11437 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1437777 () Bool)

(declare-fun res!970550 () Bool)

(assert (=> b!1437777 (=> (not res!970550) (not e!811119))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1437777 (= res!970550 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47185 a!2862) j!93) a!2862 mask!2687) lt!632388))))

(declare-fun b!1437778 () Bool)

(declare-fun res!970556 () Bool)

(assert (=> b!1437778 (=> (not res!970556) (not e!811121))))

(assert (=> b!1437778 (= res!970556 (validKeyInArray!0 (select (arr!47185 a!2862) i!1006)))))

(declare-fun b!1437779 () Bool)

(assert (=> b!1437779 (= e!811119 false)))

(declare-fun lt!632387 () (_ BitVec 32))

(assert (=> b!1437779 (= lt!632387 (toIndex!0 (select (store (arr!47185 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1437780 () Bool)

(declare-fun res!970558 () Bool)

(assert (=> b!1437780 (=> (not res!970558) (not e!811121))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437780 (= res!970558 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47735 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47735 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47735 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47185 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124220 res!970554) b!1437773))

(assert (= (and b!1437773 res!970552) b!1437778))

(assert (= (and b!1437778 res!970556) b!1437774))

(assert (= (and b!1437774 res!970551) b!1437775))

(assert (= (and b!1437775 res!970555) b!1437772))

(assert (= (and b!1437772 res!970553) b!1437780))

(assert (= (and b!1437780 res!970558) b!1437776))

(assert (= (and b!1437776 res!970557) b!1437777))

(assert (= (and b!1437777 res!970550) b!1437779))

(declare-fun m!1327021 () Bool)

(assert (=> b!1437779 m!1327021))

(declare-fun m!1327023 () Bool)

(assert (=> b!1437779 m!1327023))

(assert (=> b!1437779 m!1327023))

(declare-fun m!1327025 () Bool)

(assert (=> b!1437779 m!1327025))

(declare-fun m!1327027 () Bool)

(assert (=> b!1437776 m!1327027))

(assert (=> b!1437776 m!1327027))

(declare-fun m!1327029 () Bool)

(assert (=> b!1437776 m!1327029))

(assert (=> b!1437776 m!1327029))

(assert (=> b!1437776 m!1327027))

(declare-fun m!1327031 () Bool)

(assert (=> b!1437776 m!1327031))

(declare-fun m!1327033 () Bool)

(assert (=> b!1437772 m!1327033))

(assert (=> b!1437774 m!1327027))

(assert (=> b!1437774 m!1327027))

(declare-fun m!1327035 () Bool)

(assert (=> b!1437774 m!1327035))

(declare-fun m!1327037 () Bool)

(assert (=> start!124220 m!1327037))

(declare-fun m!1327039 () Bool)

(assert (=> start!124220 m!1327039))

(assert (=> b!1437780 m!1327021))

(declare-fun m!1327041 () Bool)

(assert (=> b!1437780 m!1327041))

(declare-fun m!1327043 () Bool)

(assert (=> b!1437778 m!1327043))

(assert (=> b!1437778 m!1327043))

(declare-fun m!1327045 () Bool)

(assert (=> b!1437778 m!1327045))

(assert (=> b!1437777 m!1327027))

(assert (=> b!1437777 m!1327027))

(declare-fun m!1327047 () Bool)

(assert (=> b!1437777 m!1327047))

(declare-fun m!1327049 () Bool)

(assert (=> b!1437775 m!1327049))

(push 1)

(assert (not b!1437779))

(assert (not b!1437775))

(assert (not b!1437777))

(assert (not b!1437772))

(assert (not b!1437776))

(assert (not start!124220))

(assert (not b!1437778))

(assert (not b!1437774))

(check-sat)

