; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124722 () Bool)

(assert start!124722)

(declare-fun b!1441999 () Bool)

(declare-fun res!973606 () Bool)

(declare-fun e!813094 () Bool)

(assert (=> b!1441999 (=> (not res!973606) (not e!813094))))

(declare-datatypes ((array!98065 0))(
  ( (array!98066 (arr!47317 (Array (_ BitVec 32) (_ BitVec 64))) (size!47868 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98065)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441999 (= res!973606 (validKeyInArray!0 (select (arr!47317 a!2862) i!1006)))))

(declare-fun b!1442000 () Bool)

(declare-fun res!973605 () Bool)

(declare-fun e!813095 () Bool)

(assert (=> b!1442000 (=> (not res!973605) (not e!813095))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11466 0))(
  ( (MissingZero!11466 (index!48256 (_ BitVec 32))) (Found!11466 (index!48257 (_ BitVec 32))) (Intermediate!11466 (undefined!12278 Bool) (index!48258 (_ BitVec 32)) (x!130155 (_ BitVec 32))) (Undefined!11466) (MissingVacant!11466 (index!48259 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98065 (_ BitVec 32)) SeekEntryResult!11466)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442000 (= res!973605 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47317 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47317 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98066 (store (arr!47317 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47868 a!2862)) mask!2687) (Intermediate!11466 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun b!1442001 () Bool)

(declare-fun res!973602 () Bool)

(assert (=> b!1442001 (=> (not res!973602) (not e!813094))))

(declare-datatypes ((List!33805 0))(
  ( (Nil!33802) (Cons!33801 (h!35162 (_ BitVec 64)) (t!48491 List!33805)) )
))
(declare-fun arrayNoDuplicates!0 (array!98065 (_ BitVec 32) List!33805) Bool)

(assert (=> b!1442001 (= res!973602 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33802))))

(declare-fun b!1442002 () Bool)

(declare-fun res!973607 () Bool)

(assert (=> b!1442002 (=> (not res!973607) (not e!813094))))

(assert (=> b!1442002 (= res!973607 (and (= (size!47868 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47868 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47868 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!973608 () Bool)

(assert (=> start!124722 (=> (not res!973608) (not e!813094))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124722 (= res!973608 (validMask!0 mask!2687))))

(assert (=> start!124722 e!813094))

(assert (=> start!124722 true))

(declare-fun array_inv!36598 (array!98065) Bool)

(assert (=> start!124722 (array_inv!36598 a!2862)))

(declare-fun b!1442003 () Bool)

(declare-fun res!973604 () Bool)

(assert (=> b!1442003 (=> (not res!973604) (not e!813094))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1442003 (= res!973604 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47868 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47868 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47868 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47317 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1442004 () Bool)

(assert (=> b!1442004 (= e!813094 e!813095)))

(declare-fun res!973603 () Bool)

(assert (=> b!1442004 (=> (not res!973603) (not e!813095))))

(declare-fun lt!633484 () SeekEntryResult!11466)

(assert (=> b!1442004 (= res!973603 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47317 a!2862) j!93) mask!2687) (select (arr!47317 a!2862) j!93) a!2862 mask!2687) lt!633484))))

(assert (=> b!1442004 (= lt!633484 (Intermediate!11466 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442005 () Bool)

(declare-fun res!973609 () Bool)

(assert (=> b!1442005 (=> (not res!973609) (not e!813094))))

(assert (=> b!1442005 (= res!973609 (validKeyInArray!0 (select (arr!47317 a!2862) j!93)))))

(declare-fun b!1442006 () Bool)

(assert (=> b!1442006 (= e!813095 (and (bvsgt x!665 intermediateAfterX!19) (bvslt mask!2687 #b00000000000000000000000000000000)))))

(declare-fun b!1442007 () Bool)

(declare-fun res!973610 () Bool)

(assert (=> b!1442007 (=> (not res!973610) (not e!813094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98065 (_ BitVec 32)) Bool)

(assert (=> b!1442007 (= res!973610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442008 () Bool)

(declare-fun res!973601 () Bool)

(assert (=> b!1442008 (=> (not res!973601) (not e!813095))))

(assert (=> b!1442008 (= res!973601 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47317 a!2862) j!93) a!2862 mask!2687) lt!633484))))

(assert (= (and start!124722 res!973608) b!1442002))

(assert (= (and b!1442002 res!973607) b!1441999))

(assert (= (and b!1441999 res!973606) b!1442005))

(assert (= (and b!1442005 res!973609) b!1442007))

(assert (= (and b!1442007 res!973610) b!1442001))

(assert (= (and b!1442001 res!973602) b!1442003))

(assert (= (and b!1442003 res!973604) b!1442004))

(assert (= (and b!1442004 res!973603) b!1442008))

(assert (= (and b!1442008 res!973601) b!1442000))

(assert (= (and b!1442000 res!973605) b!1442006))

(declare-fun m!1331329 () Bool)

(assert (=> b!1442001 m!1331329))

(declare-fun m!1331331 () Bool)

(assert (=> start!124722 m!1331331))

(declare-fun m!1331333 () Bool)

(assert (=> start!124722 m!1331333))

(declare-fun m!1331335 () Bool)

(assert (=> b!1441999 m!1331335))

(assert (=> b!1441999 m!1331335))

(declare-fun m!1331337 () Bool)

(assert (=> b!1441999 m!1331337))

(declare-fun m!1331339 () Bool)

(assert (=> b!1442004 m!1331339))

(assert (=> b!1442004 m!1331339))

(declare-fun m!1331341 () Bool)

(assert (=> b!1442004 m!1331341))

(assert (=> b!1442004 m!1331341))

(assert (=> b!1442004 m!1331339))

(declare-fun m!1331343 () Bool)

(assert (=> b!1442004 m!1331343))

(assert (=> b!1442008 m!1331339))

(assert (=> b!1442008 m!1331339))

(declare-fun m!1331345 () Bool)

(assert (=> b!1442008 m!1331345))

(declare-fun m!1331347 () Bool)

(assert (=> b!1442000 m!1331347))

(declare-fun m!1331349 () Bool)

(assert (=> b!1442000 m!1331349))

(assert (=> b!1442000 m!1331349))

(declare-fun m!1331351 () Bool)

(assert (=> b!1442000 m!1331351))

(assert (=> b!1442000 m!1331351))

(assert (=> b!1442000 m!1331349))

(declare-fun m!1331353 () Bool)

(assert (=> b!1442000 m!1331353))

(assert (=> b!1442003 m!1331347))

(declare-fun m!1331355 () Bool)

(assert (=> b!1442003 m!1331355))

(assert (=> b!1442005 m!1331339))

(assert (=> b!1442005 m!1331339))

(declare-fun m!1331357 () Bool)

(assert (=> b!1442005 m!1331357))

(declare-fun m!1331359 () Bool)

(assert (=> b!1442007 m!1331359))

(check-sat (not b!1442007) (not b!1442004) (not b!1442008) (not b!1442001) (not b!1442005) (not b!1441999) (not start!124722) (not b!1442000))
(check-sat)
