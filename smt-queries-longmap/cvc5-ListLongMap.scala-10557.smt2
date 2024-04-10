; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124480 () Bool)

(assert start!124480)

(declare-fun b!1440321 () Bool)

(declare-fun res!972751 () Bool)

(declare-fun e!812150 () Bool)

(assert (=> b!1440321 (=> (not res!972751) (not e!812150))))

(declare-datatypes ((array!97928 0))(
  ( (array!97929 (arr!47252 (Array (_ BitVec 32) (_ BitVec 64))) (size!47802 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97928)

(declare-datatypes ((List!33753 0))(
  ( (Nil!33750) (Cons!33749 (h!35099 (_ BitVec 64)) (t!48447 List!33753)) )
))
(declare-fun arrayNoDuplicates!0 (array!97928 (_ BitVec 32) List!33753) Bool)

(assert (=> b!1440321 (= res!972751 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33750))))

(declare-fun res!972748 () Bool)

(assert (=> start!124480 (=> (not res!972748) (not e!812150))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124480 (= res!972748 (validMask!0 mask!2687))))

(assert (=> start!124480 e!812150))

(assert (=> start!124480 true))

(declare-fun array_inv!36280 (array!97928) Bool)

(assert (=> start!124480 (array_inv!36280 a!2862)))

(declare-fun b!1440322 () Bool)

(declare-fun res!972749 () Bool)

(assert (=> b!1440322 (=> (not res!972749) (not e!812150))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440322 (= res!972749 (validKeyInArray!0 (select (arr!47252 a!2862) j!93)))))

(declare-fun b!1440323 () Bool)

(declare-fun res!972755 () Bool)

(assert (=> b!1440323 (=> (not res!972755) (not e!812150))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97928 (_ BitVec 32)) Bool)

(assert (=> b!1440323 (= res!972755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun b!1440324 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun e!812148 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1440324 (= e!812148 (and (bvsgt x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000) (bvslt index!646 (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge intermediateAfterIndex!19 (bvadd #b00000000000000000000000000000001 mask!2687))))))

(declare-fun b!1440325 () Bool)

(assert (=> b!1440325 (= e!812150 e!812148)))

(declare-fun res!972756 () Bool)

(assert (=> b!1440325 (=> (not res!972756) (not e!812148))))

(declare-datatypes ((SeekEntryResult!11504 0))(
  ( (MissingZero!11504 (index!48408 (_ BitVec 32))) (Found!11504 (index!48409 (_ BitVec 32))) (Intermediate!11504 (undefined!12316 Bool) (index!48410 (_ BitVec 32)) (x!130137 (_ BitVec 32))) (Undefined!11504) (MissingVacant!11504 (index!48411 (_ BitVec 32))) )
))
(declare-fun lt!632952 () SeekEntryResult!11504)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97928 (_ BitVec 32)) SeekEntryResult!11504)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440325 (= res!972756 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47252 a!2862) j!93) mask!2687) (select (arr!47252 a!2862) j!93) a!2862 mask!2687) lt!632952))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1440325 (= lt!632952 (Intermediate!11504 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440326 () Bool)

(declare-fun res!972752 () Bool)

(assert (=> b!1440326 (=> (not res!972752) (not e!812148))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1440326 (= res!972752 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47252 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47252 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97929 (store (arr!47252 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47802 a!2862)) mask!2687) (Intermediate!11504 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1440327 () Bool)

(declare-fun res!972753 () Bool)

(assert (=> b!1440327 (=> (not res!972753) (not e!812148))))

(assert (=> b!1440327 (= res!972753 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47252 a!2862) j!93) a!2862 mask!2687) lt!632952))))

(declare-fun b!1440328 () Bool)

(declare-fun res!972750 () Bool)

(assert (=> b!1440328 (=> (not res!972750) (not e!812150))))

(assert (=> b!1440328 (= res!972750 (and (= (size!47802 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47802 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47802 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440329 () Bool)

(declare-fun res!972757 () Bool)

(assert (=> b!1440329 (=> (not res!972757) (not e!812150))))

(assert (=> b!1440329 (= res!972757 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47802 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47802 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47802 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47252 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440330 () Bool)

(declare-fun res!972754 () Bool)

(assert (=> b!1440330 (=> (not res!972754) (not e!812150))))

(assert (=> b!1440330 (= res!972754 (validKeyInArray!0 (select (arr!47252 a!2862) i!1006)))))

(assert (= (and start!124480 res!972748) b!1440328))

(assert (= (and b!1440328 res!972750) b!1440330))

(assert (= (and b!1440330 res!972754) b!1440322))

(assert (= (and b!1440322 res!972749) b!1440323))

(assert (= (and b!1440323 res!972755) b!1440321))

(assert (= (and b!1440321 res!972751) b!1440329))

(assert (= (and b!1440329 res!972757) b!1440325))

(assert (= (and b!1440325 res!972756) b!1440327))

(assert (= (and b!1440327 res!972753) b!1440326))

(assert (= (and b!1440326 res!972752) b!1440324))

(declare-fun m!1329499 () Bool)

(assert (=> b!1440329 m!1329499))

(declare-fun m!1329501 () Bool)

(assert (=> b!1440329 m!1329501))

(declare-fun m!1329503 () Bool)

(assert (=> b!1440327 m!1329503))

(assert (=> b!1440327 m!1329503))

(declare-fun m!1329505 () Bool)

(assert (=> b!1440327 m!1329505))

(declare-fun m!1329507 () Bool)

(assert (=> start!124480 m!1329507))

(declare-fun m!1329509 () Bool)

(assert (=> start!124480 m!1329509))

(declare-fun m!1329511 () Bool)

(assert (=> b!1440330 m!1329511))

(assert (=> b!1440330 m!1329511))

(declare-fun m!1329513 () Bool)

(assert (=> b!1440330 m!1329513))

(assert (=> b!1440322 m!1329503))

(assert (=> b!1440322 m!1329503))

(declare-fun m!1329515 () Bool)

(assert (=> b!1440322 m!1329515))

(assert (=> b!1440326 m!1329499))

(declare-fun m!1329517 () Bool)

(assert (=> b!1440326 m!1329517))

(assert (=> b!1440326 m!1329517))

(declare-fun m!1329519 () Bool)

(assert (=> b!1440326 m!1329519))

(assert (=> b!1440326 m!1329519))

(assert (=> b!1440326 m!1329517))

(declare-fun m!1329521 () Bool)

(assert (=> b!1440326 m!1329521))

(declare-fun m!1329523 () Bool)

(assert (=> b!1440321 m!1329523))

(assert (=> b!1440325 m!1329503))

(assert (=> b!1440325 m!1329503))

(declare-fun m!1329525 () Bool)

(assert (=> b!1440325 m!1329525))

(assert (=> b!1440325 m!1329525))

(assert (=> b!1440325 m!1329503))

(declare-fun m!1329527 () Bool)

(assert (=> b!1440325 m!1329527))

(declare-fun m!1329529 () Bool)

(assert (=> b!1440323 m!1329529))

(push 1)

(assert (not b!1440321))

(assert (not b!1440322))

(assert (not b!1440325))

(assert (not b!1440330))

(assert (not b!1440323))

(assert (not start!124480))

(assert (not b!1440327))

(assert (not b!1440326))

(check-sat)

(pop 1)

(push 1)

(check-sat)

