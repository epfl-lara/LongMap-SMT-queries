; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124632 () Bool)

(assert start!124632)

(declare-fun b!1440701 () Bool)

(declare-fun res!972308 () Bool)

(declare-fun e!812689 () Bool)

(assert (=> b!1440701 (=> (not res!972308) (not e!812689))))

(declare-datatypes ((array!97975 0))(
  ( (array!97976 (arr!47272 (Array (_ BitVec 32) (_ BitVec 64))) (size!47823 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97975)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440701 (= res!972308 (validKeyInArray!0 (select (arr!47272 a!2862) j!93)))))

(declare-fun b!1440702 () Bool)

(declare-fun res!972311 () Bool)

(declare-fun e!812691 () Bool)

(assert (=> b!1440702 (=> (not res!972311) (not e!812691))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11421 0))(
  ( (MissingZero!11421 (index!48076 (_ BitVec 32))) (Found!11421 (index!48077 (_ BitVec 32))) (Intermediate!11421 (undefined!12233 Bool) (index!48078 (_ BitVec 32)) (x!129990 (_ BitVec 32))) (Undefined!11421) (MissingVacant!11421 (index!48079 (_ BitVec 32))) )
))
(declare-fun lt!633280 () SeekEntryResult!11421)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97975 (_ BitVec 32)) SeekEntryResult!11421)

(assert (=> b!1440702 (= res!972311 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47272 a!2862) j!93) a!2862 mask!2687) lt!633280))))

(declare-fun b!1440704 () Bool)

(declare-fun res!972304 () Bool)

(assert (=> b!1440704 (=> (not res!972304) (not e!812689))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1440704 (= res!972304 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47823 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47823 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47823 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47272 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440705 () Bool)

(declare-fun res!972307 () Bool)

(assert (=> b!1440705 (=> (not res!972307) (not e!812689))))

(declare-datatypes ((List!33760 0))(
  ( (Nil!33757) (Cons!33756 (h!35117 (_ BitVec 64)) (t!48446 List!33760)) )
))
(declare-fun arrayNoDuplicates!0 (array!97975 (_ BitVec 32) List!33760) Bool)

(assert (=> b!1440705 (= res!972307 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33757))))

(declare-fun b!1440706 () Bool)

(declare-fun res!972309 () Bool)

(assert (=> b!1440706 (=> (not res!972309) (not e!812689))))

(assert (=> b!1440706 (= res!972309 (validKeyInArray!0 (select (arr!47272 a!2862) i!1006)))))

(declare-fun b!1440707 () Bool)

(declare-fun res!972305 () Bool)

(assert (=> b!1440707 (=> (not res!972305) (not e!812689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97975 (_ BitVec 32)) Bool)

(assert (=> b!1440707 (= res!972305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440708 () Bool)

(assert (=> b!1440708 (= e!812689 e!812691)))

(declare-fun res!972303 () Bool)

(assert (=> b!1440708 (=> (not res!972303) (not e!812691))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440708 (= res!972303 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47272 a!2862) j!93) mask!2687) (select (arr!47272 a!2862) j!93) a!2862 mask!2687) lt!633280))))

(assert (=> b!1440708 (= lt!633280 (Intermediate!11421 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440709 () Bool)

(assert (=> b!1440709 (= e!812691 false)))

(declare-fun lt!633279 () SeekEntryResult!11421)

(assert (=> b!1440709 (= lt!633279 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47272 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47272 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97976 (store (arr!47272 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47823 a!2862)) mask!2687))))

(declare-fun res!972306 () Bool)

(assert (=> start!124632 (=> (not res!972306) (not e!812689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124632 (= res!972306 (validMask!0 mask!2687))))

(assert (=> start!124632 e!812689))

(assert (=> start!124632 true))

(declare-fun array_inv!36553 (array!97975) Bool)

(assert (=> start!124632 (array_inv!36553 a!2862)))

(declare-fun b!1440703 () Bool)

(declare-fun res!972310 () Bool)

(assert (=> b!1440703 (=> (not res!972310) (not e!812689))))

(assert (=> b!1440703 (= res!972310 (and (= (size!47823 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47823 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47823 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124632 res!972306) b!1440703))

(assert (= (and b!1440703 res!972310) b!1440706))

(assert (= (and b!1440706 res!972309) b!1440701))

(assert (= (and b!1440701 res!972308) b!1440707))

(assert (= (and b!1440707 res!972305) b!1440705))

(assert (= (and b!1440705 res!972307) b!1440704))

(assert (= (and b!1440704 res!972304) b!1440708))

(assert (= (and b!1440708 res!972303) b!1440702))

(assert (= (and b!1440702 res!972311) b!1440709))

(declare-fun m!1329877 () Bool)

(assert (=> b!1440701 m!1329877))

(assert (=> b!1440701 m!1329877))

(declare-fun m!1329879 () Bool)

(assert (=> b!1440701 m!1329879))

(assert (=> b!1440708 m!1329877))

(assert (=> b!1440708 m!1329877))

(declare-fun m!1329881 () Bool)

(assert (=> b!1440708 m!1329881))

(assert (=> b!1440708 m!1329881))

(assert (=> b!1440708 m!1329877))

(declare-fun m!1329883 () Bool)

(assert (=> b!1440708 m!1329883))

(declare-fun m!1329885 () Bool)

(assert (=> start!124632 m!1329885))

(declare-fun m!1329887 () Bool)

(assert (=> start!124632 m!1329887))

(declare-fun m!1329889 () Bool)

(assert (=> b!1440706 m!1329889))

(assert (=> b!1440706 m!1329889))

(declare-fun m!1329891 () Bool)

(assert (=> b!1440706 m!1329891))

(declare-fun m!1329893 () Bool)

(assert (=> b!1440705 m!1329893))

(declare-fun m!1329895 () Bool)

(assert (=> b!1440707 m!1329895))

(assert (=> b!1440702 m!1329877))

(assert (=> b!1440702 m!1329877))

(declare-fun m!1329897 () Bool)

(assert (=> b!1440702 m!1329897))

(declare-fun m!1329899 () Bool)

(assert (=> b!1440709 m!1329899))

(declare-fun m!1329901 () Bool)

(assert (=> b!1440709 m!1329901))

(assert (=> b!1440709 m!1329901))

(declare-fun m!1329903 () Bool)

(assert (=> b!1440709 m!1329903))

(assert (=> b!1440709 m!1329903))

(assert (=> b!1440709 m!1329901))

(declare-fun m!1329905 () Bool)

(assert (=> b!1440709 m!1329905))

(assert (=> b!1440704 m!1329899))

(declare-fun m!1329907 () Bool)

(assert (=> b!1440704 m!1329907))

(check-sat (not b!1440706) (not b!1440705) (not b!1440709) (not b!1440708) (not b!1440702) (not b!1440701) (not start!124632) (not b!1440707))
(check-sat)
