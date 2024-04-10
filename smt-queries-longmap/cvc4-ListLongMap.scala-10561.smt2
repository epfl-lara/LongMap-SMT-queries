; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124508 () Bool)

(assert start!124508)

(declare-fun b!1440732 () Bool)

(declare-fun res!973167 () Bool)

(declare-fun e!812275 () Bool)

(assert (=> b!1440732 (=> (not res!973167) (not e!812275))))

(declare-datatypes ((array!97956 0))(
  ( (array!97957 (arr!47266 (Array (_ BitVec 32) (_ BitVec 64))) (size!47816 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97956)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97956 (_ BitVec 32)) Bool)

(assert (=> b!1440732 (= res!973167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440733 () Bool)

(declare-fun res!973164 () Bool)

(assert (=> b!1440733 (=> (not res!973164) (not e!812275))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440733 (= res!973164 (validKeyInArray!0 (select (arr!47266 a!2862) i!1006)))))

(declare-fun b!1440734 () Bool)

(declare-fun res!973159 () Bool)

(declare-fun e!812276 () Bool)

(assert (=> b!1440734 (=> (not res!973159) (not e!812276))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11518 0))(
  ( (MissingZero!11518 (index!48464 (_ BitVec 32))) (Found!11518 (index!48465 (_ BitVec 32))) (Intermediate!11518 (undefined!12330 Bool) (index!48466 (_ BitVec 32)) (x!130183 (_ BitVec 32))) (Undefined!11518) (MissingVacant!11518 (index!48467 (_ BitVec 32))) )
))
(declare-fun lt!633012 () SeekEntryResult!11518)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97956 (_ BitVec 32)) SeekEntryResult!11518)

(assert (=> b!1440734 (= res!973159 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47266 a!2862) j!93) a!2862 mask!2687) lt!633012))))

(declare-fun b!1440735 () Bool)

(declare-fun res!973163 () Bool)

(assert (=> b!1440735 (=> (not res!973163) (not e!812275))))

(declare-datatypes ((List!33767 0))(
  ( (Nil!33764) (Cons!33763 (h!35113 (_ BitVec 64)) (t!48461 List!33767)) )
))
(declare-fun arrayNoDuplicates!0 (array!97956 (_ BitVec 32) List!33767) Bool)

(assert (=> b!1440735 (= res!973163 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33764))))

(declare-fun b!1440736 () Bool)

(declare-fun res!973168 () Bool)

(assert (=> b!1440736 (=> (not res!973168) (not e!812275))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440736 (= res!973168 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47816 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47816 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47816 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47266 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440737 () Bool)

(declare-fun res!973162 () Bool)

(assert (=> b!1440737 (=> (not res!973162) (not e!812276))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440737 (= res!973162 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47266 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47266 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97957 (store (arr!47266 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47816 a!2862)) mask!2687) (Intermediate!11518 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun res!973161 () Bool)

(assert (=> start!124508 (=> (not res!973161) (not e!812275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124508 (= res!973161 (validMask!0 mask!2687))))

(assert (=> start!124508 e!812275))

(assert (=> start!124508 true))

(declare-fun array_inv!36294 (array!97956) Bool)

(assert (=> start!124508 (array_inv!36294 a!2862)))

(declare-fun b!1440738 () Bool)

(assert (=> b!1440738 (= e!812275 e!812276)))

(declare-fun res!973165 () Bool)

(assert (=> b!1440738 (=> (not res!973165) (not e!812276))))

(assert (=> b!1440738 (= res!973165 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47266 a!2862) j!93) mask!2687) (select (arr!47266 a!2862) j!93) a!2862 mask!2687) lt!633012))))

(assert (=> b!1440738 (= lt!633012 (Intermediate!11518 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440739 () Bool)

(declare-fun res!973160 () Bool)

(assert (=> b!1440739 (=> (not res!973160) (not e!812275))))

(assert (=> b!1440739 (= res!973160 (and (= (size!47816 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47816 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47816 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440740 () Bool)

(declare-fun res!973166 () Bool)

(assert (=> b!1440740 (=> (not res!973166) (not e!812275))))

(assert (=> b!1440740 (= res!973166 (validKeyInArray!0 (select (arr!47266 a!2862) j!93)))))

(declare-fun b!1440741 () Bool)

(assert (=> b!1440741 (= e!812276 (and (bvsgt x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(assert (= (and start!124508 res!973161) b!1440739))

(assert (= (and b!1440739 res!973160) b!1440733))

(assert (= (and b!1440733 res!973164) b!1440740))

(assert (= (and b!1440740 res!973166) b!1440732))

(assert (= (and b!1440732 res!973167) b!1440735))

(assert (= (and b!1440735 res!973163) b!1440736))

(assert (= (and b!1440736 res!973168) b!1440738))

(assert (= (and b!1440738 res!973165) b!1440734))

(assert (= (and b!1440734 res!973159) b!1440737))

(assert (= (and b!1440737 res!973162) b!1440741))

(declare-fun m!1329953 () Bool)

(assert (=> b!1440738 m!1329953))

(assert (=> b!1440738 m!1329953))

(declare-fun m!1329955 () Bool)

(assert (=> b!1440738 m!1329955))

(assert (=> b!1440738 m!1329955))

(assert (=> b!1440738 m!1329953))

(declare-fun m!1329957 () Bool)

(assert (=> b!1440738 m!1329957))

(declare-fun m!1329959 () Bool)

(assert (=> b!1440736 m!1329959))

(declare-fun m!1329961 () Bool)

(assert (=> b!1440736 m!1329961))

(declare-fun m!1329963 () Bool)

(assert (=> b!1440732 m!1329963))

(declare-fun m!1329965 () Bool)

(assert (=> b!1440735 m!1329965))

(assert (=> b!1440737 m!1329959))

(declare-fun m!1329967 () Bool)

(assert (=> b!1440737 m!1329967))

(assert (=> b!1440737 m!1329967))

(declare-fun m!1329969 () Bool)

(assert (=> b!1440737 m!1329969))

(assert (=> b!1440737 m!1329969))

(assert (=> b!1440737 m!1329967))

(declare-fun m!1329971 () Bool)

(assert (=> b!1440737 m!1329971))

(declare-fun m!1329973 () Bool)

(assert (=> b!1440733 m!1329973))

(assert (=> b!1440733 m!1329973))

(declare-fun m!1329975 () Bool)

(assert (=> b!1440733 m!1329975))

(declare-fun m!1329977 () Bool)

(assert (=> start!124508 m!1329977))

(declare-fun m!1329979 () Bool)

(assert (=> start!124508 m!1329979))

(assert (=> b!1440734 m!1329953))

(assert (=> b!1440734 m!1329953))

(declare-fun m!1329981 () Bool)

(assert (=> b!1440734 m!1329981))

(assert (=> b!1440740 m!1329953))

(assert (=> b!1440740 m!1329953))

(declare-fun m!1329983 () Bool)

(assert (=> b!1440740 m!1329983))

(push 1)

(assert (not b!1440735))

(assert (not b!1440738))

(assert (not b!1440734))

(assert (not b!1440733))

(assert (not start!124508))

(assert (not b!1440740))

(assert (not b!1440737))

(assert (not b!1440732))

(check-sat)

(pop 1)

(push 1)

(check-sat)

