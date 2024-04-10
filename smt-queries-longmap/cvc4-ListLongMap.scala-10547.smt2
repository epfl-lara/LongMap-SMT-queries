; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124424 () Bool)

(assert start!124424)

(declare-fun b!1439517 () Bool)

(declare-fun res!971945 () Bool)

(declare-fun e!811897 () Bool)

(assert (=> b!1439517 (=> (not res!971945) (not e!811897))))

(declare-datatypes ((array!97872 0))(
  ( (array!97873 (arr!47224 (Array (_ BitVec 32) (_ BitVec 64))) (size!47774 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97872)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1439517 (= res!971945 (validKeyInArray!0 (select (arr!47224 a!2862) j!93)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!811898 () Bool)

(declare-fun b!1439519 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1439519 (= e!811898 (and (bvsle x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1439520 () Bool)

(declare-fun res!971950 () Bool)

(assert (=> b!1439520 (=> (not res!971950) (not e!811897))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1439520 (= res!971950 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47774 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47774 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47774 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47224 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1439521 () Bool)

(assert (=> b!1439521 (= e!811897 e!811898)))

(declare-fun res!971953 () Bool)

(assert (=> b!1439521 (=> (not res!971953) (not e!811898))))

(declare-datatypes ((SeekEntryResult!11476 0))(
  ( (MissingZero!11476 (index!48296 (_ BitVec 32))) (Found!11476 (index!48297 (_ BitVec 32))) (Intermediate!11476 (undefined!12288 Bool) (index!48298 (_ BitVec 32)) (x!130029 (_ BitVec 32))) (Undefined!11476) (MissingVacant!11476 (index!48299 (_ BitVec 32))) )
))
(declare-fun lt!632823 () SeekEntryResult!11476)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97872 (_ BitVec 32)) SeekEntryResult!11476)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1439521 (= res!971953 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47224 a!2862) j!93) mask!2687) (select (arr!47224 a!2862) j!93) a!2862 mask!2687) lt!632823))))

(assert (=> b!1439521 (= lt!632823 (Intermediate!11476 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1439522 () Bool)

(declare-fun res!971951 () Bool)

(assert (=> b!1439522 (=> (not res!971951) (not e!811898))))

(assert (=> b!1439522 (= res!971951 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47224 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47224 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97873 (store (arr!47224 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47774 a!2862)) mask!2687) (Intermediate!11476 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1439523 () Bool)

(declare-fun res!971944 () Bool)

(assert (=> b!1439523 (=> (not res!971944) (not e!811897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97872 (_ BitVec 32)) Bool)

(assert (=> b!1439523 (= res!971944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1439524 () Bool)

(declare-fun res!971946 () Bool)

(assert (=> b!1439524 (=> (not res!971946) (not e!811897))))

(assert (=> b!1439524 (= res!971946 (validKeyInArray!0 (select (arr!47224 a!2862) i!1006)))))

(declare-fun b!1439518 () Bool)

(declare-fun res!971948 () Bool)

(assert (=> b!1439518 (=> (not res!971948) (not e!811897))))

(declare-datatypes ((List!33725 0))(
  ( (Nil!33722) (Cons!33721 (h!35071 (_ BitVec 64)) (t!48419 List!33725)) )
))
(declare-fun arrayNoDuplicates!0 (array!97872 (_ BitVec 32) List!33725) Bool)

(assert (=> b!1439518 (= res!971948 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33722))))

(declare-fun res!971952 () Bool)

(assert (=> start!124424 (=> (not res!971952) (not e!811897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124424 (= res!971952 (validMask!0 mask!2687))))

(assert (=> start!124424 e!811897))

(assert (=> start!124424 true))

(declare-fun array_inv!36252 (array!97872) Bool)

(assert (=> start!124424 (array_inv!36252 a!2862)))

(declare-fun b!1439525 () Bool)

(declare-fun res!971949 () Bool)

(assert (=> b!1439525 (=> (not res!971949) (not e!811897))))

(assert (=> b!1439525 (= res!971949 (and (= (size!47774 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47774 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47774 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1439526 () Bool)

(declare-fun res!971947 () Bool)

(assert (=> b!1439526 (=> (not res!971947) (not e!811898))))

(assert (=> b!1439526 (= res!971947 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47224 a!2862) j!93) a!2862 mask!2687) lt!632823))))

(assert (= (and start!124424 res!971952) b!1439525))

(assert (= (and b!1439525 res!971949) b!1439524))

(assert (= (and b!1439524 res!971946) b!1439517))

(assert (= (and b!1439517 res!971945) b!1439523))

(assert (= (and b!1439523 res!971944) b!1439518))

(assert (= (and b!1439518 res!971948) b!1439520))

(assert (= (and b!1439520 res!971950) b!1439521))

(assert (= (and b!1439521 res!971953) b!1439526))

(assert (= (and b!1439526 res!971947) b!1439522))

(assert (= (and b!1439522 res!971951) b!1439519))

(declare-fun m!1328597 () Bool)

(assert (=> b!1439518 m!1328597))

(declare-fun m!1328599 () Bool)

(assert (=> b!1439526 m!1328599))

(assert (=> b!1439526 m!1328599))

(declare-fun m!1328601 () Bool)

(assert (=> b!1439526 m!1328601))

(assert (=> b!1439517 m!1328599))

(assert (=> b!1439517 m!1328599))

(declare-fun m!1328603 () Bool)

(assert (=> b!1439517 m!1328603))

(assert (=> b!1439521 m!1328599))

(assert (=> b!1439521 m!1328599))

(declare-fun m!1328605 () Bool)

(assert (=> b!1439521 m!1328605))

(assert (=> b!1439521 m!1328605))

(assert (=> b!1439521 m!1328599))

(declare-fun m!1328607 () Bool)

(assert (=> b!1439521 m!1328607))

(declare-fun m!1328609 () Bool)

(assert (=> b!1439524 m!1328609))

(assert (=> b!1439524 m!1328609))

(declare-fun m!1328611 () Bool)

(assert (=> b!1439524 m!1328611))

(declare-fun m!1328613 () Bool)

(assert (=> b!1439522 m!1328613))

(declare-fun m!1328615 () Bool)

(assert (=> b!1439522 m!1328615))

(assert (=> b!1439522 m!1328615))

(declare-fun m!1328617 () Bool)

(assert (=> b!1439522 m!1328617))

(assert (=> b!1439522 m!1328617))

(assert (=> b!1439522 m!1328615))

(declare-fun m!1328619 () Bool)

(assert (=> b!1439522 m!1328619))

(declare-fun m!1328621 () Bool)

(assert (=> start!124424 m!1328621))

(declare-fun m!1328623 () Bool)

(assert (=> start!124424 m!1328623))

(declare-fun m!1328625 () Bool)

(assert (=> b!1439523 m!1328625))

(assert (=> b!1439520 m!1328613))

(declare-fun m!1328627 () Bool)

(assert (=> b!1439520 m!1328627))

(push 1)

(assert (not b!1439523))

(assert (not b!1439526))

(assert (not b!1439521))

(assert (not start!124424))

(assert (not b!1439524))

(assert (not b!1439518))

(assert (not b!1439522))

(assert (not b!1439517))

(check-sat)

(pop 1)

(push 1)

(check-sat)

