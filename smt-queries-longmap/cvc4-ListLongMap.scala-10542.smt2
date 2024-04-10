; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124352 () Bool)

(assert start!124352)

(declare-fun b!1438861 () Bool)

(declare-fun e!811606 () Bool)

(declare-fun e!811605 () Bool)

(assert (=> b!1438861 (= e!811606 e!811605)))

(declare-fun res!971413 () Bool)

(assert (=> b!1438861 (=> (not res!971413) (not e!811605))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11461 0))(
  ( (MissingZero!11461 (index!48236 (_ BitVec 32))) (Found!11461 (index!48237 (_ BitVec 32))) (Intermediate!11461 (undefined!12273 Bool) (index!48238 (_ BitVec 32)) (x!129968 (_ BitVec 32))) (Undefined!11461) (MissingVacant!11461 (index!48239 (_ BitVec 32))) )
))
(declare-fun lt!632661 () SeekEntryResult!11461)

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!97839 0))(
  ( (array!97840 (arr!47209 (Array (_ BitVec 32) (_ BitVec 64))) (size!47759 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97839)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97839 (_ BitVec 32)) SeekEntryResult!11461)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1438861 (= res!971413 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47209 a!2862) j!93) mask!2687) (select (arr!47209 a!2862) j!93) a!2862 mask!2687) lt!632661))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1438861 (= lt!632661 (Intermediate!11461 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!971418 () Bool)

(assert (=> start!124352 (=> (not res!971418) (not e!811606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124352 (= res!971418 (validMask!0 mask!2687))))

(assert (=> start!124352 e!811606))

(assert (=> start!124352 true))

(declare-fun array_inv!36237 (array!97839) Bool)

(assert (=> start!124352 (array_inv!36237 a!2862)))

(declare-fun b!1438862 () Bool)

(declare-fun res!971419 () Bool)

(assert (=> b!1438862 (=> (not res!971419) (not e!811606))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1438862 (= res!971419 (validKeyInArray!0 (select (arr!47209 a!2862) i!1006)))))

(declare-fun b!1438863 () Bool)

(declare-fun res!971415 () Bool)

(assert (=> b!1438863 (=> (not res!971415) (not e!811605))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1438863 (= res!971415 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47209 a!2862) j!93) a!2862 mask!2687) lt!632661))))

(declare-fun b!1438864 () Bool)

(declare-fun res!971416 () Bool)

(assert (=> b!1438864 (=> (not res!971416) (not e!811606))))

(assert (=> b!1438864 (= res!971416 (and (= (size!47759 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47759 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47759 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1438865 () Bool)

(assert (=> b!1438865 (= e!811605 false)))

(declare-fun lt!632660 () SeekEntryResult!11461)

(assert (=> b!1438865 (= lt!632660 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47209 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47209 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97840 (store (arr!47209 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47759 a!2862)) mask!2687))))

(declare-fun b!1438866 () Bool)

(declare-fun res!971412 () Bool)

(assert (=> b!1438866 (=> (not res!971412) (not e!811606))))

(declare-datatypes ((List!33710 0))(
  ( (Nil!33707) (Cons!33706 (h!35053 (_ BitVec 64)) (t!48404 List!33710)) )
))
(declare-fun arrayNoDuplicates!0 (array!97839 (_ BitVec 32) List!33710) Bool)

(assert (=> b!1438866 (= res!971412 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33707))))

(declare-fun b!1438867 () Bool)

(declare-fun res!971414 () Bool)

(assert (=> b!1438867 (=> (not res!971414) (not e!811606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97839 (_ BitVec 32)) Bool)

(assert (=> b!1438867 (= res!971414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1438868 () Bool)

(declare-fun res!971417 () Bool)

(assert (=> b!1438868 (=> (not res!971417) (not e!811606))))

(assert (=> b!1438868 (= res!971417 (validKeyInArray!0 (select (arr!47209 a!2862) j!93)))))

(declare-fun b!1438869 () Bool)

(declare-fun res!971411 () Bool)

(assert (=> b!1438869 (=> (not res!971411) (not e!811606))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1438869 (= res!971411 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47759 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47759 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47759 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47209 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124352 res!971418) b!1438864))

(assert (= (and b!1438864 res!971416) b!1438862))

(assert (= (and b!1438862 res!971419) b!1438868))

(assert (= (and b!1438868 res!971417) b!1438867))

(assert (= (and b!1438867 res!971414) b!1438866))

(assert (= (and b!1438866 res!971412) b!1438869))

(assert (= (and b!1438869 res!971411) b!1438861))

(assert (= (and b!1438861 res!971413) b!1438863))

(assert (= (and b!1438863 res!971415) b!1438865))

(declare-fun m!1327991 () Bool)

(assert (=> b!1438866 m!1327991))

(declare-fun m!1327993 () Bool)

(assert (=> b!1438863 m!1327993))

(assert (=> b!1438863 m!1327993))

(declare-fun m!1327995 () Bool)

(assert (=> b!1438863 m!1327995))

(assert (=> b!1438868 m!1327993))

(assert (=> b!1438868 m!1327993))

(declare-fun m!1327997 () Bool)

(assert (=> b!1438868 m!1327997))

(assert (=> b!1438861 m!1327993))

(assert (=> b!1438861 m!1327993))

(declare-fun m!1327999 () Bool)

(assert (=> b!1438861 m!1327999))

(assert (=> b!1438861 m!1327999))

(assert (=> b!1438861 m!1327993))

(declare-fun m!1328001 () Bool)

(assert (=> b!1438861 m!1328001))

(declare-fun m!1328003 () Bool)

(assert (=> b!1438869 m!1328003))

(declare-fun m!1328005 () Bool)

(assert (=> b!1438869 m!1328005))

(declare-fun m!1328007 () Bool)

(assert (=> b!1438862 m!1328007))

(assert (=> b!1438862 m!1328007))

(declare-fun m!1328009 () Bool)

(assert (=> b!1438862 m!1328009))

(declare-fun m!1328011 () Bool)

(assert (=> b!1438867 m!1328011))

(assert (=> b!1438865 m!1328003))

(declare-fun m!1328013 () Bool)

(assert (=> b!1438865 m!1328013))

(assert (=> b!1438865 m!1328013))

(declare-fun m!1328015 () Bool)

(assert (=> b!1438865 m!1328015))

(assert (=> b!1438865 m!1328015))

(assert (=> b!1438865 m!1328013))

(declare-fun m!1328017 () Bool)

(assert (=> b!1438865 m!1328017))

(declare-fun m!1328019 () Bool)

(assert (=> start!124352 m!1328019))

(declare-fun m!1328021 () Bool)

(assert (=> start!124352 m!1328021))

(push 1)

(assert (not b!1438867))

(assert (not b!1438861))

(assert (not b!1438865))

(assert (not b!1438863))

(assert (not start!124352))

(assert (not b!1438862))

(assert (not b!1438866))

(assert (not b!1438868))

(check-sat)

