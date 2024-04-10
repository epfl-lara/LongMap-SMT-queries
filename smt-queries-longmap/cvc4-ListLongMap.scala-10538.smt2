; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124286 () Bool)

(assert start!124286)

(declare-fun b!1438302 () Bool)

(declare-fun res!970981 () Bool)

(declare-fun e!811360 () Bool)

(assert (=> b!1438302 (=> (not res!970981) (not e!811360))))

(declare-datatypes ((array!97812 0))(
  ( (array!97813 (arr!47197 (Array (_ BitVec 32) (_ BitVec 64))) (size!47747 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97812)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438302 (= res!970981 (validKeyInArray!0 (select (arr!47197 a!2862) i!1006)))))

(declare-fun b!1438303 () Bool)

(declare-fun res!970978 () Bool)

(assert (=> b!1438303 (=> (not res!970978) (not e!811360))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97812 (_ BitVec 32)) Bool)

(assert (=> b!1438303 (= res!970978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438304 () Bool)

(declare-fun e!811361 () Bool)

(assert (=> b!1438304 (= e!811360 e!811361)))

(declare-fun res!970980 () Bool)

(assert (=> b!1438304 (=> (not res!970980) (not e!811361))))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11449 0))(
  ( (MissingZero!11449 (index!48188 (_ BitVec 32))) (Found!11449 (index!48189 (_ BitVec 32))) (Intermediate!11449 (undefined!12261 Bool) (index!48190 (_ BitVec 32)) (x!129918 (_ BitVec 32))) (Undefined!11449) (MissingVacant!11449 (index!48191 (_ BitVec 32))) )
))
(declare-fun lt!632526 () SeekEntryResult!11449)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97812 (_ BitVec 32)) SeekEntryResult!11449)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438304 (= res!970980 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47197 a!2862) j!93) mask!2687) (select (arr!47197 a!2862) j!93) a!2862 mask!2687) lt!632526))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1438304 (= lt!632526 (Intermediate!11449 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1438305 () Bool)

(declare-fun res!970976 () Bool)

(assert (=> b!1438305 (=> (not res!970976) (not e!811360))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1438305 (= res!970976 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47747 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47747 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47747 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47197 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1438306 () Bool)

(declare-fun res!970982 () Bool)

(assert (=> b!1438306 (=> (not res!970982) (not e!811361))))

(assert (=> b!1438306 (= res!970982 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47197 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47197 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97813 (store (arr!47197 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47747 a!2862)) mask!2687) (Intermediate!11449 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1438307 () Bool)

(assert (=> b!1438307 (= e!811361 (and (bvsle x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1438308 () Bool)

(declare-fun res!970984 () Bool)

(assert (=> b!1438308 (=> (not res!970984) (not e!811360))))

(declare-datatypes ((List!33698 0))(
  ( (Nil!33695) (Cons!33694 (h!35038 (_ BitVec 64)) (t!48392 List!33698)) )
))
(declare-fun arrayNoDuplicates!0 (array!97812 (_ BitVec 32) List!33698) Bool)

(assert (=> b!1438308 (= res!970984 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33695))))

(declare-fun res!970979 () Bool)

(assert (=> start!124286 (=> (not res!970979) (not e!811360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124286 (= res!970979 (validMask!0 mask!2687))))

(assert (=> start!124286 e!811360))

(assert (=> start!124286 true))

(declare-fun array_inv!36225 (array!97812) Bool)

(assert (=> start!124286 (array_inv!36225 a!2862)))

(declare-fun b!1438309 () Bool)

(declare-fun res!970977 () Bool)

(assert (=> b!1438309 (=> (not res!970977) (not e!811360))))

(assert (=> b!1438309 (= res!970977 (validKeyInArray!0 (select (arr!47197 a!2862) j!93)))))

(declare-fun b!1438310 () Bool)

(declare-fun res!970975 () Bool)

(assert (=> b!1438310 (=> (not res!970975) (not e!811361))))

(assert (=> b!1438310 (= res!970975 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47197 a!2862) j!93) a!2862 mask!2687) lt!632526))))

(declare-fun b!1438311 () Bool)

(declare-fun res!970983 () Bool)

(assert (=> b!1438311 (=> (not res!970983) (not e!811360))))

(assert (=> b!1438311 (= res!970983 (and (= (size!47747 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47747 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47747 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124286 res!970979) b!1438311))

(assert (= (and b!1438311 res!970983) b!1438302))

(assert (= (and b!1438302 res!970981) b!1438309))

(assert (= (and b!1438309 res!970977) b!1438303))

(assert (= (and b!1438303 res!970978) b!1438308))

(assert (= (and b!1438308 res!970984) b!1438305))

(assert (= (and b!1438305 res!970976) b!1438304))

(assert (= (and b!1438304 res!970980) b!1438310))

(assert (= (and b!1438310 res!970975) b!1438306))

(assert (= (and b!1438306 res!970982) b!1438307))

(declare-fun m!1327487 () Bool)

(assert (=> b!1438303 m!1327487))

(declare-fun m!1327489 () Bool)

(assert (=> b!1438302 m!1327489))

(assert (=> b!1438302 m!1327489))

(declare-fun m!1327491 () Bool)

(assert (=> b!1438302 m!1327491))

(declare-fun m!1327493 () Bool)

(assert (=> b!1438306 m!1327493))

(declare-fun m!1327495 () Bool)

(assert (=> b!1438306 m!1327495))

(assert (=> b!1438306 m!1327495))

(declare-fun m!1327497 () Bool)

(assert (=> b!1438306 m!1327497))

(assert (=> b!1438306 m!1327497))

(assert (=> b!1438306 m!1327495))

(declare-fun m!1327499 () Bool)

(assert (=> b!1438306 m!1327499))

(declare-fun m!1327501 () Bool)

(assert (=> b!1438304 m!1327501))

(assert (=> b!1438304 m!1327501))

(declare-fun m!1327503 () Bool)

(assert (=> b!1438304 m!1327503))

(assert (=> b!1438304 m!1327503))

(assert (=> b!1438304 m!1327501))

(declare-fun m!1327505 () Bool)

(assert (=> b!1438304 m!1327505))

(assert (=> b!1438310 m!1327501))

(assert (=> b!1438310 m!1327501))

(declare-fun m!1327507 () Bool)

(assert (=> b!1438310 m!1327507))

(declare-fun m!1327509 () Bool)

(assert (=> start!124286 m!1327509))

(declare-fun m!1327511 () Bool)

(assert (=> start!124286 m!1327511))

(declare-fun m!1327513 () Bool)

(assert (=> b!1438308 m!1327513))

(assert (=> b!1438309 m!1327501))

(assert (=> b!1438309 m!1327501))

(declare-fun m!1327515 () Bool)

(assert (=> b!1438309 m!1327515))

(assert (=> b!1438305 m!1327493))

(declare-fun m!1327517 () Bool)

(assert (=> b!1438305 m!1327517))

(push 1)

(assert (not b!1438308))

(assert (not b!1438304))

(assert (not b!1438302))

(assert (not b!1438309))

(assert (not b!1438306))

(assert (not b!1438303))

(assert (not b!1438310))

(assert (not start!124286))

(check-sat)

