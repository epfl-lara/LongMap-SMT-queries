; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124428 () Bool)

(assert start!124428)

(declare-fun b!1438964 () Bool)

(declare-fun res!970918 () Bool)

(declare-fun e!811914 () Bool)

(assert (=> b!1438964 (=> (not res!970918) (not e!811914))))

(declare-datatypes ((array!97888 0))(
  ( (array!97889 (arr!47233 (Array (_ BitVec 32) (_ BitVec 64))) (size!47784 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97888)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438964 (= res!970918 (validKeyInArray!0 (select (arr!47233 a!2862) i!1006)))))

(declare-fun b!1438965 () Bool)

(declare-fun res!970923 () Bool)

(assert (=> b!1438965 (=> (not res!970923) (not e!811914))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1438965 (= res!970923 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47784 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47784 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47784 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47233 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438966 () Bool)

(declare-fun res!970924 () Bool)

(declare-fun e!811912 () Bool)

(assert (=> b!1438966 (=> (not res!970924) (not e!811912))))

(declare-datatypes ((SeekEntryResult!11382 0))(
  ( (MissingZero!11382 (index!47920 (_ BitVec 32))) (Found!11382 (index!47921 (_ BitVec 32))) (Intermediate!11382 (undefined!12194 Bool) (index!47922 (_ BitVec 32)) (x!129829 (_ BitVec 32))) (Undefined!11382) (MissingVacant!11382 (index!47923 (_ BitVec 32))) )
))
(declare-fun lt!632836 () SeekEntryResult!11382)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97888 (_ BitVec 32)) SeekEntryResult!11382)

(assert (=> b!1438966 (= res!970924 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47233 a!2862) j!93) a!2862 mask!2687) lt!632836))))

(declare-fun b!1438967 () Bool)

(assert (=> b!1438967 (= e!811914 e!811912)))

(declare-fun res!970917 () Bool)

(assert (=> b!1438967 (=> (not res!970917) (not e!811912))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438967 (= res!970917 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47233 a!2862) j!93) mask!2687) (select (arr!47233 a!2862) j!93) a!2862 mask!2687) lt!632836))))

(assert (=> b!1438967 (= lt!632836 (Intermediate!11382 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438968 () Bool)

(declare-fun res!970925 () Bool)

(assert (=> b!1438968 (=> (not res!970925) (not e!811914))))

(assert (=> b!1438968 (= res!970925 (and (= (size!47784 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47784 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47784 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438969 () Bool)

(declare-fun res!970920 () Bool)

(assert (=> b!1438969 (=> (not res!970920) (not e!811914))))

(declare-datatypes ((List!33721 0))(
  ( (Nil!33718) (Cons!33717 (h!35069 (_ BitVec 64)) (t!48407 List!33721)) )
))
(declare-fun arrayNoDuplicates!0 (array!97888 (_ BitVec 32) List!33721) Bool)

(assert (=> b!1438969 (= res!970920 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33718))))

(declare-fun b!1438970 () Bool)

(declare-fun res!970919 () Bool)

(assert (=> b!1438970 (=> (not res!970919) (not e!811914))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97888 (_ BitVec 32)) Bool)

(assert (=> b!1438970 (= res!970919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438971 () Bool)

(declare-fun res!970922 () Bool)

(assert (=> b!1438971 (=> (not res!970922) (not e!811914))))

(assert (=> b!1438971 (= res!970922 (validKeyInArray!0 (select (arr!47233 a!2862) j!93)))))

(declare-fun res!970921 () Bool)

(assert (=> start!124428 (=> (not res!970921) (not e!811914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124428 (= res!970921 (validMask!0 mask!2687))))

(assert (=> start!124428 e!811914))

(assert (=> start!124428 true))

(declare-fun array_inv!36514 (array!97888) Bool)

(assert (=> start!124428 (array_inv!36514 a!2862)))

(declare-fun b!1438972 () Bool)

(assert (=> b!1438972 (= e!811912 (bvslt mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!632835 () (_ BitVec 32))

(assert (=> b!1438972 (= lt!632835 (toIndex!0 (select (store (arr!47233 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(assert (= (and start!124428 res!970921) b!1438968))

(assert (= (and b!1438968 res!970925) b!1438964))

(assert (= (and b!1438964 res!970918) b!1438971))

(assert (= (and b!1438971 res!970922) b!1438970))

(assert (= (and b!1438970 res!970919) b!1438969))

(assert (= (and b!1438969 res!970920) b!1438965))

(assert (= (and b!1438965 res!970923) b!1438967))

(assert (= (and b!1438967 res!970917) b!1438966))

(assert (= (and b!1438966 res!970924) b!1438972))

(declare-fun m!1328311 () Bool)

(assert (=> start!124428 m!1328311))

(declare-fun m!1328313 () Bool)

(assert (=> start!124428 m!1328313))

(declare-fun m!1328315 () Bool)

(assert (=> b!1438972 m!1328315))

(declare-fun m!1328317 () Bool)

(assert (=> b!1438972 m!1328317))

(assert (=> b!1438972 m!1328317))

(declare-fun m!1328319 () Bool)

(assert (=> b!1438972 m!1328319))

(declare-fun m!1328321 () Bool)

(assert (=> b!1438971 m!1328321))

(assert (=> b!1438971 m!1328321))

(declare-fun m!1328323 () Bool)

(assert (=> b!1438971 m!1328323))

(declare-fun m!1328325 () Bool)

(assert (=> b!1438964 m!1328325))

(assert (=> b!1438964 m!1328325))

(declare-fun m!1328327 () Bool)

(assert (=> b!1438964 m!1328327))

(declare-fun m!1328329 () Bool)

(assert (=> b!1438969 m!1328329))

(assert (=> b!1438967 m!1328321))

(assert (=> b!1438967 m!1328321))

(declare-fun m!1328331 () Bool)

(assert (=> b!1438967 m!1328331))

(assert (=> b!1438967 m!1328331))

(assert (=> b!1438967 m!1328321))

(declare-fun m!1328333 () Bool)

(assert (=> b!1438967 m!1328333))

(assert (=> b!1438965 m!1328315))

(declare-fun m!1328335 () Bool)

(assert (=> b!1438965 m!1328335))

(declare-fun m!1328337 () Bool)

(assert (=> b!1438970 m!1328337))

(assert (=> b!1438966 m!1328321))

(assert (=> b!1438966 m!1328321))

(declare-fun m!1328339 () Bool)

(assert (=> b!1438966 m!1328339))

(check-sat (not b!1438969) (not b!1438967) (not start!124428) (not b!1438972) (not b!1438971) (not b!1438970) (not b!1438966) (not b!1438964))
(check-sat)
