; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125518 () Bool)

(assert start!125518)

(declare-fun b!1468717 () Bool)

(declare-fun e!824625 () Bool)

(assert (=> b!1468717 (= e!824625 false)))

(declare-datatypes ((SeekEntryResult!12026 0))(
  ( (MissingZero!12026 (index!50496 (_ BitVec 32))) (Found!12026 (index!50497 (_ BitVec 32))) (Intermediate!12026 (undefined!12838 Bool) (index!50498 (_ BitVec 32)) (x!132078 (_ BitVec 32))) (Undefined!12026) (MissingVacant!12026 (index!50499 (_ BitVec 32))) )
))
(declare-fun lt!642162 () SeekEntryResult!12026)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98944 0))(
  ( (array!98945 (arr!47761 (Array (_ BitVec 32) (_ BitVec 64))) (size!48313 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98944)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98944 (_ BitVec 32)) SeekEntryResult!12026)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468717 (= lt!642162 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47761 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47761 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98945 (store (arr!47761 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48313 a!2862)) mask!2687))))

(declare-fun b!1468718 () Bool)

(declare-fun res!997377 () Bool)

(declare-fun e!824624 () Bool)

(assert (=> b!1468718 (=> (not res!997377) (not e!824624))))

(assert (=> b!1468718 (= res!997377 (and (= (size!48313 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48313 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48313 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468719 () Bool)

(declare-fun res!997376 () Bool)

(assert (=> b!1468719 (=> (not res!997376) (not e!824624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98944 (_ BitVec 32)) Bool)

(assert (=> b!1468719 (= res!997376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!997375 () Bool)

(assert (=> start!125518 (=> (not res!997375) (not e!824624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125518 (= res!997375 (validMask!0 mask!2687))))

(assert (=> start!125518 e!824624))

(assert (=> start!125518 true))

(declare-fun array_inv!36994 (array!98944) Bool)

(assert (=> start!125518 (array_inv!36994 a!2862)))

(declare-fun b!1468720 () Bool)

(declare-fun res!997381 () Bool)

(assert (=> b!1468720 (=> (not res!997381) (not e!824624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468720 (= res!997381 (validKeyInArray!0 (select (arr!47761 a!2862) i!1006)))))

(declare-fun b!1468721 () Bool)

(declare-fun res!997378 () Bool)

(assert (=> b!1468721 (=> (not res!997378) (not e!824624))))

(declare-datatypes ((List!34340 0))(
  ( (Nil!34337) (Cons!34336 (h!35686 (_ BitVec 64)) (t!49026 List!34340)) )
))
(declare-fun arrayNoDuplicates!0 (array!98944 (_ BitVec 32) List!34340) Bool)

(assert (=> b!1468721 (= res!997378 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34337))))

(declare-fun b!1468722 () Bool)

(declare-fun res!997373 () Bool)

(assert (=> b!1468722 (=> (not res!997373) (not e!824624))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1468722 (= res!997373 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48313 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48313 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48313 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47761 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468723 () Bool)

(declare-fun res!997380 () Bool)

(assert (=> b!1468723 (=> (not res!997380) (not e!824624))))

(assert (=> b!1468723 (= res!997380 (validKeyInArray!0 (select (arr!47761 a!2862) j!93)))))

(declare-fun b!1468724 () Bool)

(assert (=> b!1468724 (= e!824624 e!824625)))

(declare-fun res!997374 () Bool)

(assert (=> b!1468724 (=> (not res!997374) (not e!824625))))

(declare-fun lt!642161 () SeekEntryResult!12026)

(assert (=> b!1468724 (= res!997374 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47761 a!2862) j!93) mask!2687) (select (arr!47761 a!2862) j!93) a!2862 mask!2687) lt!642161))))

(assert (=> b!1468724 (= lt!642161 (Intermediate!12026 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468725 () Bool)

(declare-fun res!997379 () Bool)

(assert (=> b!1468725 (=> (not res!997379) (not e!824625))))

(assert (=> b!1468725 (= res!997379 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47761 a!2862) j!93) a!2862 mask!2687) lt!642161))))

(assert (= (and start!125518 res!997375) b!1468718))

(assert (= (and b!1468718 res!997377) b!1468720))

(assert (= (and b!1468720 res!997381) b!1468723))

(assert (= (and b!1468723 res!997380) b!1468719))

(assert (= (and b!1468719 res!997376) b!1468721))

(assert (= (and b!1468721 res!997378) b!1468722))

(assert (= (and b!1468722 res!997373) b!1468724))

(assert (= (and b!1468724 res!997374) b!1468725))

(assert (= (and b!1468725 res!997379) b!1468717))

(declare-fun m!1355385 () Bool)

(assert (=> b!1468717 m!1355385))

(declare-fun m!1355387 () Bool)

(assert (=> b!1468717 m!1355387))

(assert (=> b!1468717 m!1355387))

(declare-fun m!1355389 () Bool)

(assert (=> b!1468717 m!1355389))

(assert (=> b!1468717 m!1355389))

(assert (=> b!1468717 m!1355387))

(declare-fun m!1355391 () Bool)

(assert (=> b!1468717 m!1355391))

(declare-fun m!1355393 () Bool)

(assert (=> b!1468721 m!1355393))

(declare-fun m!1355395 () Bool)

(assert (=> b!1468719 m!1355395))

(declare-fun m!1355397 () Bool)

(assert (=> b!1468725 m!1355397))

(assert (=> b!1468725 m!1355397))

(declare-fun m!1355399 () Bool)

(assert (=> b!1468725 m!1355399))

(assert (=> b!1468724 m!1355397))

(assert (=> b!1468724 m!1355397))

(declare-fun m!1355401 () Bool)

(assert (=> b!1468724 m!1355401))

(assert (=> b!1468724 m!1355401))

(assert (=> b!1468724 m!1355397))

(declare-fun m!1355403 () Bool)

(assert (=> b!1468724 m!1355403))

(declare-fun m!1355405 () Bool)

(assert (=> b!1468720 m!1355405))

(assert (=> b!1468720 m!1355405))

(declare-fun m!1355407 () Bool)

(assert (=> b!1468720 m!1355407))

(assert (=> b!1468722 m!1355385))

(declare-fun m!1355409 () Bool)

(assert (=> b!1468722 m!1355409))

(declare-fun m!1355411 () Bool)

(assert (=> start!125518 m!1355411))

(declare-fun m!1355413 () Bool)

(assert (=> start!125518 m!1355413))

(assert (=> b!1468723 m!1355397))

(assert (=> b!1468723 m!1355397))

(declare-fun m!1355415 () Bool)

(assert (=> b!1468723 m!1355415))

(check-sat (not b!1468723) (not b!1468719) (not b!1468724) (not b!1468725) (not start!125518) (not b!1468720) (not b!1468717) (not b!1468721))
(check-sat)
