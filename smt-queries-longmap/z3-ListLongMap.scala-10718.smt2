; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125448 () Bool)

(assert start!125448)

(declare-fun b!1467597 () Bool)

(declare-fun res!996136 () Bool)

(declare-fun e!824320 () Bool)

(assert (=> b!1467597 (=> (not res!996136) (not e!824320))))

(declare-datatypes ((array!98896 0))(
  ( (array!98897 (arr!47736 (Array (_ BitVec 32) (_ BitVec 64))) (size!48286 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98896)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467597 (= res!996136 (validKeyInArray!0 (select (arr!47736 a!2862) j!93)))))

(declare-fun b!1467598 () Bool)

(declare-fun res!996141 () Bool)

(assert (=> b!1467598 (=> (not res!996141) (not e!824320))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1467598 (= res!996141 (validKeyInArray!0 (select (arr!47736 a!2862) i!1006)))))

(declare-fun b!1467599 () Bool)

(declare-fun res!996138 () Bool)

(assert (=> b!1467599 (=> (not res!996138) (not e!824320))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1467599 (= res!996138 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48286 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48286 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48286 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47736 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467600 () Bool)

(assert (=> b!1467600 (= e!824320 false)))

(declare-datatypes ((SeekEntryResult!11976 0))(
  ( (MissingZero!11976 (index!50296 (_ BitVec 32))) (Found!11976 (index!50297 (_ BitVec 32))) (Intermediate!11976 (undefined!12788 Bool) (index!50298 (_ BitVec 32)) (x!131897 (_ BitVec 32))) (Undefined!11976) (MissingVacant!11976 (index!50299 (_ BitVec 32))) )
))
(declare-fun lt!642126 () SeekEntryResult!11976)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98896 (_ BitVec 32)) SeekEntryResult!11976)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467600 (= lt!642126 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47736 a!2862) j!93) mask!2687) (select (arr!47736 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1467601 () Bool)

(declare-fun res!996142 () Bool)

(assert (=> b!1467601 (=> (not res!996142) (not e!824320))))

(declare-datatypes ((List!34237 0))(
  ( (Nil!34234) (Cons!34233 (h!35583 (_ BitVec 64)) (t!48931 List!34237)) )
))
(declare-fun arrayNoDuplicates!0 (array!98896 (_ BitVec 32) List!34237) Bool)

(assert (=> b!1467601 (= res!996142 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34234))))

(declare-fun res!996139 () Bool)

(assert (=> start!125448 (=> (not res!996139) (not e!824320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125448 (= res!996139 (validMask!0 mask!2687))))

(assert (=> start!125448 e!824320))

(assert (=> start!125448 true))

(declare-fun array_inv!36764 (array!98896) Bool)

(assert (=> start!125448 (array_inv!36764 a!2862)))

(declare-fun b!1467602 () Bool)

(declare-fun res!996140 () Bool)

(assert (=> b!1467602 (=> (not res!996140) (not e!824320))))

(assert (=> b!1467602 (= res!996140 (and (= (size!48286 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48286 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48286 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467603 () Bool)

(declare-fun res!996137 () Bool)

(assert (=> b!1467603 (=> (not res!996137) (not e!824320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98896 (_ BitVec 32)) Bool)

(assert (=> b!1467603 (= res!996137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125448 res!996139) b!1467602))

(assert (= (and b!1467602 res!996140) b!1467598))

(assert (= (and b!1467598 res!996141) b!1467597))

(assert (= (and b!1467597 res!996136) b!1467603))

(assert (= (and b!1467603 res!996137) b!1467601))

(assert (= (and b!1467601 res!996142) b!1467599))

(assert (= (and b!1467599 res!996138) b!1467600))

(declare-fun m!1354543 () Bool)

(assert (=> b!1467597 m!1354543))

(assert (=> b!1467597 m!1354543))

(declare-fun m!1354545 () Bool)

(assert (=> b!1467597 m!1354545))

(declare-fun m!1354547 () Bool)

(assert (=> start!125448 m!1354547))

(declare-fun m!1354549 () Bool)

(assert (=> start!125448 m!1354549))

(declare-fun m!1354551 () Bool)

(assert (=> b!1467598 m!1354551))

(assert (=> b!1467598 m!1354551))

(declare-fun m!1354553 () Bool)

(assert (=> b!1467598 m!1354553))

(declare-fun m!1354555 () Bool)

(assert (=> b!1467599 m!1354555))

(declare-fun m!1354557 () Bool)

(assert (=> b!1467599 m!1354557))

(declare-fun m!1354559 () Bool)

(assert (=> b!1467601 m!1354559))

(assert (=> b!1467600 m!1354543))

(assert (=> b!1467600 m!1354543))

(declare-fun m!1354561 () Bool)

(assert (=> b!1467600 m!1354561))

(assert (=> b!1467600 m!1354561))

(assert (=> b!1467600 m!1354543))

(declare-fun m!1354563 () Bool)

(assert (=> b!1467600 m!1354563))

(declare-fun m!1354565 () Bool)

(assert (=> b!1467603 m!1354565))

(check-sat (not b!1467601) (not b!1467600) (not b!1467597) (not start!125448) (not b!1467603) (not b!1467598))
