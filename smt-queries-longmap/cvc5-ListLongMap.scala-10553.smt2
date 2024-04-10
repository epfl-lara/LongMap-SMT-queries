; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124456 () Bool)

(assert start!124456)

(declare-fun b!1439979 () Bool)

(declare-fun res!972412 () Bool)

(declare-fun e!812042 () Bool)

(assert (=> b!1439979 (=> (not res!972412) (not e!812042))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97904 0))(
  ( (array!97905 (arr!47240 (Array (_ BitVec 32) (_ BitVec 64))) (size!47790 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97904)

(assert (=> b!1439979 (= res!972412 (and (= (size!47790 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47790 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47790 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439980 () Bool)

(declare-fun res!972408 () Bool)

(declare-fun e!812041 () Bool)

(assert (=> b!1439980 (=> (not res!972408) (not e!812041))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11492 0))(
  ( (MissingZero!11492 (index!48360 (_ BitVec 32))) (Found!11492 (index!48361 (_ BitVec 32))) (Intermediate!11492 (undefined!12304 Bool) (index!48362 (_ BitVec 32)) (x!130093 (_ BitVec 32))) (Undefined!11492) (MissingVacant!11492 (index!48363 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97904 (_ BitVec 32)) SeekEntryResult!11492)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439980 (= res!972408 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47240 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47240 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97905 (store (arr!47240 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47790 a!2862)) mask!2687) (Intermediate!11492 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1439981 () Bool)

(declare-fun res!972410 () Bool)

(assert (=> b!1439981 (=> (not res!972410) (not e!812041))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!632898 () SeekEntryResult!11492)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1439981 (= res!972410 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47240 a!2862) j!93) a!2862 mask!2687) lt!632898))))

(declare-fun b!1439982 () Bool)

(assert (=> b!1439982 (= e!812041 (and (bvsgt x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1439983 () Bool)

(declare-fun res!972411 () Bool)

(assert (=> b!1439983 (=> (not res!972411) (not e!812042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97904 (_ BitVec 32)) Bool)

(assert (=> b!1439983 (= res!972411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439985 () Bool)

(assert (=> b!1439985 (= e!812042 e!812041)))

(declare-fun res!972409 () Bool)

(assert (=> b!1439985 (=> (not res!972409) (not e!812041))))

(assert (=> b!1439985 (= res!972409 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47240 a!2862) j!93) mask!2687) (select (arr!47240 a!2862) j!93) a!2862 mask!2687) lt!632898))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1439985 (= lt!632898 (Intermediate!11492 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439986 () Bool)

(declare-fun res!972406 () Bool)

(assert (=> b!1439986 (=> (not res!972406) (not e!812042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439986 (= res!972406 (validKeyInArray!0 (select (arr!47240 a!2862) i!1006)))))

(declare-fun b!1439987 () Bool)

(declare-fun res!972413 () Bool)

(assert (=> b!1439987 (=> (not res!972413) (not e!812042))))

(declare-datatypes ((List!33741 0))(
  ( (Nil!33738) (Cons!33737 (h!35087 (_ BitVec 64)) (t!48435 List!33741)) )
))
(declare-fun arrayNoDuplicates!0 (array!97904 (_ BitVec 32) List!33741) Bool)

(assert (=> b!1439987 (= res!972413 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33738))))

(declare-fun b!1439988 () Bool)

(declare-fun res!972415 () Bool)

(assert (=> b!1439988 (=> (not res!972415) (not e!812042))))

(assert (=> b!1439988 (= res!972415 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47790 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47790 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47790 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47240 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439984 () Bool)

(declare-fun res!972414 () Bool)

(assert (=> b!1439984 (=> (not res!972414) (not e!812042))))

(assert (=> b!1439984 (= res!972414 (validKeyInArray!0 (select (arr!47240 a!2862) j!93)))))

(declare-fun res!972407 () Bool)

(assert (=> start!124456 (=> (not res!972407) (not e!812042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124456 (= res!972407 (validMask!0 mask!2687))))

(assert (=> start!124456 e!812042))

(assert (=> start!124456 true))

(declare-fun array_inv!36268 (array!97904) Bool)

(assert (=> start!124456 (array_inv!36268 a!2862)))

(assert (= (and start!124456 res!972407) b!1439979))

(assert (= (and b!1439979 res!972412) b!1439986))

(assert (= (and b!1439986 res!972406) b!1439984))

(assert (= (and b!1439984 res!972414) b!1439983))

(assert (= (and b!1439983 res!972411) b!1439987))

(assert (= (and b!1439987 res!972413) b!1439988))

(assert (= (and b!1439988 res!972415) b!1439985))

(assert (= (and b!1439985 res!972409) b!1439981))

(assert (= (and b!1439981 res!972410) b!1439980))

(assert (= (and b!1439980 res!972408) b!1439982))

(declare-fun m!1329115 () Bool)

(assert (=> b!1439981 m!1329115))

(assert (=> b!1439981 m!1329115))

(declare-fun m!1329117 () Bool)

(assert (=> b!1439981 m!1329117))

(declare-fun m!1329119 () Bool)

(assert (=> b!1439987 m!1329119))

(declare-fun m!1329121 () Bool)

(assert (=> b!1439983 m!1329121))

(declare-fun m!1329123 () Bool)

(assert (=> b!1439980 m!1329123))

(declare-fun m!1329125 () Bool)

(assert (=> b!1439980 m!1329125))

(assert (=> b!1439980 m!1329125))

(declare-fun m!1329127 () Bool)

(assert (=> b!1439980 m!1329127))

(assert (=> b!1439980 m!1329127))

(assert (=> b!1439980 m!1329125))

(declare-fun m!1329129 () Bool)

(assert (=> b!1439980 m!1329129))

(declare-fun m!1329131 () Bool)

(assert (=> b!1439986 m!1329131))

(assert (=> b!1439986 m!1329131))

(declare-fun m!1329133 () Bool)

(assert (=> b!1439986 m!1329133))

(assert (=> b!1439985 m!1329115))

(assert (=> b!1439985 m!1329115))

(declare-fun m!1329135 () Bool)

(assert (=> b!1439985 m!1329135))

(assert (=> b!1439985 m!1329135))

(assert (=> b!1439985 m!1329115))

(declare-fun m!1329137 () Bool)

(assert (=> b!1439985 m!1329137))

(declare-fun m!1329139 () Bool)

(assert (=> start!124456 m!1329139))

(declare-fun m!1329141 () Bool)

(assert (=> start!124456 m!1329141))

(assert (=> b!1439988 m!1329123))

(declare-fun m!1329143 () Bool)

(assert (=> b!1439988 m!1329143))

(assert (=> b!1439984 m!1329115))

(assert (=> b!1439984 m!1329115))

(declare-fun m!1329145 () Bool)

(assert (=> b!1439984 m!1329145))

(push 1)

