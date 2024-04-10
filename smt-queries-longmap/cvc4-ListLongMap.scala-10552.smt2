; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124454 () Bool)

(assert start!124454)

(declare-fun b!1439950 () Bool)

(declare-fun res!972384 () Bool)

(declare-fun e!812031 () Bool)

(assert (=> b!1439950 (=> (not res!972384) (not e!812031))))

(declare-datatypes ((array!97902 0))(
  ( (array!97903 (arr!47239 (Array (_ BitVec 32) (_ BitVec 64))) (size!47789 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97902)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439950 (= res!972384 (validKeyInArray!0 (select (arr!47239 a!2862) i!1006)))))

(declare-fun b!1439951 () Bool)

(declare-fun res!972382 () Bool)

(assert (=> b!1439951 (=> (not res!972382) (not e!812031))))

(declare-datatypes ((List!33740 0))(
  ( (Nil!33737) (Cons!33736 (h!35086 (_ BitVec 64)) (t!48434 List!33740)) )
))
(declare-fun arrayNoDuplicates!0 (array!97902 (_ BitVec 32) List!33740) Bool)

(assert (=> b!1439951 (= res!972382 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33737))))

(declare-fun b!1439952 () Bool)

(declare-fun res!972383 () Bool)

(assert (=> b!1439952 (=> (not res!972383) (not e!812031))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1439952 (= res!972383 (and (= (size!47789 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47789 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47789 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439953 () Bool)

(declare-fun e!812033 () Bool)

(assert (=> b!1439953 (= e!812031 e!812033)))

(declare-fun res!972385 () Bool)

(assert (=> b!1439953 (=> (not res!972385) (not e!812033))))

(declare-datatypes ((SeekEntryResult!11491 0))(
  ( (MissingZero!11491 (index!48356 (_ BitVec 32))) (Found!11491 (index!48357 (_ BitVec 32))) (Intermediate!11491 (undefined!12303 Bool) (index!48358 (_ BitVec 32)) (x!130084 (_ BitVec 32))) (Undefined!11491) (MissingVacant!11491 (index!48359 (_ BitVec 32))) )
))
(declare-fun lt!632895 () SeekEntryResult!11491)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97902 (_ BitVec 32)) SeekEntryResult!11491)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439953 (= res!972385 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47239 a!2862) j!93) mask!2687) (select (arr!47239 a!2862) j!93) a!2862 mask!2687) lt!632895))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1439953 (= lt!632895 (Intermediate!11491 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439954 () Bool)

(assert (=> b!1439954 (= e!812033 false)))

(declare-fun lt!632894 () SeekEntryResult!11491)

(assert (=> b!1439954 (= lt!632894 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47239 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47239 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97903 (store (arr!47239 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47789 a!2862)) mask!2687))))

(declare-fun b!1439955 () Bool)

(declare-fun res!972377 () Bool)

(assert (=> b!1439955 (=> (not res!972377) (not e!812031))))

(assert (=> b!1439955 (= res!972377 (validKeyInArray!0 (select (arr!47239 a!2862) j!93)))))

(declare-fun b!1439956 () Bool)

(declare-fun res!972381 () Bool)

(assert (=> b!1439956 (=> (not res!972381) (not e!812031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97902 (_ BitVec 32)) Bool)

(assert (=> b!1439956 (= res!972381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!972379 () Bool)

(assert (=> start!124454 (=> (not res!972379) (not e!812031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124454 (= res!972379 (validMask!0 mask!2687))))

(assert (=> start!124454 e!812031))

(assert (=> start!124454 true))

(declare-fun array_inv!36267 (array!97902) Bool)

(assert (=> start!124454 (array_inv!36267 a!2862)))

(declare-fun b!1439957 () Bool)

(declare-fun res!972380 () Bool)

(assert (=> b!1439957 (=> (not res!972380) (not e!812031))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1439957 (= res!972380 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47789 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47789 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47789 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47239 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439958 () Bool)

(declare-fun res!972378 () Bool)

(assert (=> b!1439958 (=> (not res!972378) (not e!812033))))

(assert (=> b!1439958 (= res!972378 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47239 a!2862) j!93) a!2862 mask!2687) lt!632895))))

(assert (= (and start!124454 res!972379) b!1439952))

(assert (= (and b!1439952 res!972383) b!1439950))

(assert (= (and b!1439950 res!972384) b!1439955))

(assert (= (and b!1439955 res!972377) b!1439956))

(assert (= (and b!1439956 res!972381) b!1439951))

(assert (= (and b!1439951 res!972382) b!1439957))

(assert (= (and b!1439957 res!972380) b!1439953))

(assert (= (and b!1439953 res!972385) b!1439958))

(assert (= (and b!1439958 res!972378) b!1439954))

(declare-fun m!1329083 () Bool)

(assert (=> b!1439958 m!1329083))

(assert (=> b!1439958 m!1329083))

(declare-fun m!1329085 () Bool)

(assert (=> b!1439958 m!1329085))

(declare-fun m!1329087 () Bool)

(assert (=> b!1439950 m!1329087))

(assert (=> b!1439950 m!1329087))

(declare-fun m!1329089 () Bool)

(assert (=> b!1439950 m!1329089))

(declare-fun m!1329091 () Bool)

(assert (=> b!1439954 m!1329091))

(declare-fun m!1329093 () Bool)

(assert (=> b!1439954 m!1329093))

(assert (=> b!1439954 m!1329093))

(declare-fun m!1329095 () Bool)

(assert (=> b!1439954 m!1329095))

(assert (=> b!1439954 m!1329095))

(assert (=> b!1439954 m!1329093))

(declare-fun m!1329097 () Bool)

(assert (=> b!1439954 m!1329097))

(assert (=> b!1439953 m!1329083))

(assert (=> b!1439953 m!1329083))

(declare-fun m!1329099 () Bool)

(assert (=> b!1439953 m!1329099))

(assert (=> b!1439953 m!1329099))

(assert (=> b!1439953 m!1329083))

(declare-fun m!1329101 () Bool)

(assert (=> b!1439953 m!1329101))

(declare-fun m!1329103 () Bool)

(assert (=> b!1439956 m!1329103))

(declare-fun m!1329105 () Bool)

(assert (=> start!124454 m!1329105))

(declare-fun m!1329107 () Bool)

(assert (=> start!124454 m!1329107))

(assert (=> b!1439955 m!1329083))

(assert (=> b!1439955 m!1329083))

(declare-fun m!1329109 () Bool)

(assert (=> b!1439955 m!1329109))

(assert (=> b!1439957 m!1329091))

(declare-fun m!1329111 () Bool)

(assert (=> b!1439957 m!1329111))

(declare-fun m!1329113 () Bool)

(assert (=> b!1439951 m!1329113))

(push 1)

(assert (not b!1439951))

(assert (not b!1439954))

(assert (not b!1439955))

(assert (not b!1439950))

(assert (not b!1439958))

(assert (not b!1439953))

(assert (not start!124454))

(assert (not b!1439956))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

