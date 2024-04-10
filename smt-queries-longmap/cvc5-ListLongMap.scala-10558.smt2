; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124486 () Bool)

(assert start!124486)

(declare-fun b!1440409 () Bool)

(declare-fun res!972842 () Bool)

(declare-fun e!812175 () Bool)

(assert (=> b!1440409 (=> (not res!972842) (not e!812175))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!97934 0))(
  ( (array!97935 (arr!47255 (Array (_ BitVec 32) (_ BitVec 64))) (size!47805 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97934)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1440409 (= res!972842 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47805 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47805 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47805 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47255 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1440410 () Bool)

(declare-fun e!812176 () Bool)

(assert (=> b!1440410 (= e!812175 e!812176)))

(declare-fun res!972837 () Bool)

(assert (=> b!1440410 (=> (not res!972837) (not e!812176))))

(declare-datatypes ((SeekEntryResult!11507 0))(
  ( (MissingZero!11507 (index!48420 (_ BitVec 32))) (Found!11507 (index!48421 (_ BitVec 32))) (Intermediate!11507 (undefined!12319 Bool) (index!48422 (_ BitVec 32)) (x!130148 (_ BitVec 32))) (Undefined!11507) (MissingVacant!11507 (index!48423 (_ BitVec 32))) )
))
(declare-fun lt!632963 () SeekEntryResult!11507)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97934 (_ BitVec 32)) SeekEntryResult!11507)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1440410 (= res!972837 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47255 a!2862) j!93) mask!2687) (select (arr!47255 a!2862) j!93) a!2862 mask!2687) lt!632963))))

(assert (=> b!1440410 (= lt!632963 (Intermediate!11507 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1440411 () Bool)

(declare-fun res!972838 () Bool)

(assert (=> b!1440411 (=> (not res!972838) (not e!812175))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1440411 (= res!972838 (validKeyInArray!0 (select (arr!47255 a!2862) j!93)))))

(declare-fun res!972839 () Bool)

(assert (=> start!124486 (=> (not res!972839) (not e!812175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124486 (= res!972839 (validMask!0 mask!2687))))

(assert (=> start!124486 e!812175))

(assert (=> start!124486 true))

(declare-fun array_inv!36283 (array!97934) Bool)

(assert (=> start!124486 (array_inv!36283 a!2862)))

(declare-fun b!1440412 () Bool)

(declare-fun res!972844 () Bool)

(assert (=> b!1440412 (=> (not res!972844) (not e!812175))))

(assert (=> b!1440412 (= res!972844 (validKeyInArray!0 (select (arr!47255 a!2862) i!1006)))))

(declare-fun b!1440413 () Bool)

(declare-fun res!972843 () Bool)

(assert (=> b!1440413 (=> (not res!972843) (not e!812175))))

(assert (=> b!1440413 (= res!972843 (and (= (size!47805 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47805 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47805 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1440414 () Bool)

(declare-fun res!972836 () Bool)

(assert (=> b!1440414 (=> (not res!972836) (not e!812175))))

(declare-datatypes ((List!33756 0))(
  ( (Nil!33753) (Cons!33752 (h!35102 (_ BitVec 64)) (t!48450 List!33756)) )
))
(declare-fun arrayNoDuplicates!0 (array!97934 (_ BitVec 32) List!33756) Bool)

(assert (=> b!1440414 (= res!972836 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33753))))

(declare-fun b!1440415 () Bool)

(declare-fun res!972840 () Bool)

(assert (=> b!1440415 (=> (not res!972840) (not e!812176))))

(assert (=> b!1440415 (= res!972840 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47255 a!2862) j!93) a!2862 mask!2687) lt!632963))))

(declare-fun b!1440416 () Bool)

(declare-fun res!972841 () Bool)

(assert (=> b!1440416 (=> (not res!972841) (not e!812175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97934 (_ BitVec 32)) Bool)

(assert (=> b!1440416 (= res!972841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1440417 () Bool)

(assert (=> b!1440417 (= e!812176 false)))

(declare-fun lt!632964 () SeekEntryResult!11507)

(assert (=> b!1440417 (= lt!632964 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47255 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47255 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!97935 (store (arr!47255 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47805 a!2862)) mask!2687))))

(assert (= (and start!124486 res!972839) b!1440413))

(assert (= (and b!1440413 res!972843) b!1440412))

(assert (= (and b!1440412 res!972844) b!1440411))

(assert (= (and b!1440411 res!972838) b!1440416))

(assert (= (and b!1440416 res!972841) b!1440414))

(assert (= (and b!1440414 res!972836) b!1440409))

(assert (= (and b!1440409 res!972842) b!1440410))

(assert (= (and b!1440410 res!972837) b!1440415))

(assert (= (and b!1440415 res!972840) b!1440417))

(declare-fun m!1329595 () Bool)

(assert (=> b!1440416 m!1329595))

(declare-fun m!1329597 () Bool)

(assert (=> b!1440410 m!1329597))

(assert (=> b!1440410 m!1329597))

(declare-fun m!1329599 () Bool)

(assert (=> b!1440410 m!1329599))

(assert (=> b!1440410 m!1329599))

(assert (=> b!1440410 m!1329597))

(declare-fun m!1329601 () Bool)

(assert (=> b!1440410 m!1329601))

(declare-fun m!1329603 () Bool)

(assert (=> b!1440412 m!1329603))

(assert (=> b!1440412 m!1329603))

(declare-fun m!1329605 () Bool)

(assert (=> b!1440412 m!1329605))

(declare-fun m!1329607 () Bool)

(assert (=> b!1440414 m!1329607))

(declare-fun m!1329609 () Bool)

(assert (=> b!1440417 m!1329609))

(declare-fun m!1329611 () Bool)

(assert (=> b!1440417 m!1329611))

(assert (=> b!1440417 m!1329611))

(declare-fun m!1329613 () Bool)

(assert (=> b!1440417 m!1329613))

(assert (=> b!1440417 m!1329613))

(assert (=> b!1440417 m!1329611))

(declare-fun m!1329615 () Bool)

(assert (=> b!1440417 m!1329615))

(declare-fun m!1329617 () Bool)

(assert (=> start!124486 m!1329617))

(declare-fun m!1329619 () Bool)

(assert (=> start!124486 m!1329619))

(assert (=> b!1440415 m!1329597))

(assert (=> b!1440415 m!1329597))

(declare-fun m!1329621 () Bool)

(assert (=> b!1440415 m!1329621))

(assert (=> b!1440409 m!1329609))

(declare-fun m!1329623 () Bool)

(assert (=> b!1440409 m!1329623))

(assert (=> b!1440411 m!1329597))

(assert (=> b!1440411 m!1329597))

(declare-fun m!1329625 () Bool)

(assert (=> b!1440411 m!1329625))

(push 1)

