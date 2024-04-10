; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125518 () Bool)

(assert start!125518)

(declare-fun b!1468507 () Bool)

(declare-fun res!997048 () Bool)

(declare-fun e!824604 () Bool)

(assert (=> b!1468507 (=> (not res!997048) (not e!824604))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98966 0))(
  ( (array!98967 (arr!47771 (Array (_ BitVec 32) (_ BitVec 64))) (size!48321 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98966)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12011 0))(
  ( (MissingZero!12011 (index!50436 (_ BitVec 32))) (Found!12011 (index!50437 (_ BitVec 32))) (Intermediate!12011 (undefined!12823 Bool) (index!50438 (_ BitVec 32)) (x!132028 (_ BitVec 32))) (Undefined!12011) (MissingVacant!12011 (index!50439 (_ BitVec 32))) )
))
(declare-fun lt!642306 () SeekEntryResult!12011)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98966 (_ BitVec 32)) SeekEntryResult!12011)

(assert (=> b!1468507 (= res!997048 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47771 a!2862) j!93) a!2862 mask!2687) lt!642306))))

(declare-fun b!1468508 () Bool)

(declare-fun res!997054 () Bool)

(declare-fun e!824605 () Bool)

(assert (=> b!1468508 (=> (not res!997054) (not e!824605))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1468508 (= res!997054 (and (= (size!48321 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48321 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48321 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!997052 () Bool)

(assert (=> start!125518 (=> (not res!997052) (not e!824605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125518 (= res!997052 (validMask!0 mask!2687))))

(assert (=> start!125518 e!824605))

(assert (=> start!125518 true))

(declare-fun array_inv!36799 (array!98966) Bool)

(assert (=> start!125518 (array_inv!36799 a!2862)))

(declare-fun b!1468509 () Bool)

(declare-fun res!997051 () Bool)

(assert (=> b!1468509 (=> (not res!997051) (not e!824605))))

(declare-datatypes ((List!34272 0))(
  ( (Nil!34269) (Cons!34268 (h!35618 (_ BitVec 64)) (t!48966 List!34272)) )
))
(declare-fun arrayNoDuplicates!0 (array!98966 (_ BitVec 32) List!34272) Bool)

(assert (=> b!1468509 (= res!997051 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34269))))

(declare-fun b!1468510 () Bool)

(assert (=> b!1468510 (= e!824605 e!824604)))

(declare-fun res!997050 () Bool)

(assert (=> b!1468510 (=> (not res!997050) (not e!824604))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468510 (= res!997050 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47771 a!2862) j!93) mask!2687) (select (arr!47771 a!2862) j!93) a!2862 mask!2687) lt!642306))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468510 (= lt!642306 (Intermediate!12011 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468511 () Bool)

(declare-fun res!997047 () Bool)

(assert (=> b!1468511 (=> (not res!997047) (not e!824605))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468511 (= res!997047 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48321 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48321 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48321 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47771 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468512 () Bool)

(declare-fun res!997053 () Bool)

(assert (=> b!1468512 (=> (not res!997053) (not e!824605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468512 (= res!997053 (validKeyInArray!0 (select (arr!47771 a!2862) j!93)))))

(declare-fun b!1468513 () Bool)

(declare-fun res!997049 () Bool)

(assert (=> b!1468513 (=> (not res!997049) (not e!824605))))

(assert (=> b!1468513 (= res!997049 (validKeyInArray!0 (select (arr!47771 a!2862) i!1006)))))

(declare-fun b!1468514 () Bool)

(assert (=> b!1468514 (= e!824604 false)))

(declare-fun lt!642305 () SeekEntryResult!12011)

(assert (=> b!1468514 (= lt!642305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47771 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47771 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98967 (store (arr!47771 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48321 a!2862)) mask!2687))))

(declare-fun b!1468515 () Bool)

(declare-fun res!997046 () Bool)

(assert (=> b!1468515 (=> (not res!997046) (not e!824605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98966 (_ BitVec 32)) Bool)

(assert (=> b!1468515 (= res!997046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125518 res!997052) b!1468508))

(assert (= (and b!1468508 res!997054) b!1468513))

(assert (= (and b!1468513 res!997049) b!1468512))

(assert (= (and b!1468512 res!997053) b!1468515))

(assert (= (and b!1468515 res!997046) b!1468509))

(assert (= (and b!1468509 res!997051) b!1468511))

(assert (= (and b!1468511 res!997047) b!1468510))

(assert (= (and b!1468510 res!997050) b!1468507))

(assert (= (and b!1468507 res!997048) b!1468514))

(declare-fun m!1355581 () Bool)

(assert (=> b!1468514 m!1355581))

(declare-fun m!1355583 () Bool)

(assert (=> b!1468514 m!1355583))

(assert (=> b!1468514 m!1355583))

(declare-fun m!1355585 () Bool)

(assert (=> b!1468514 m!1355585))

(assert (=> b!1468514 m!1355585))

(assert (=> b!1468514 m!1355583))

(declare-fun m!1355587 () Bool)

(assert (=> b!1468514 m!1355587))

(declare-fun m!1355589 () Bool)

(assert (=> b!1468509 m!1355589))

(declare-fun m!1355591 () Bool)

(assert (=> b!1468507 m!1355591))

(assert (=> b!1468507 m!1355591))

(declare-fun m!1355593 () Bool)

(assert (=> b!1468507 m!1355593))

(declare-fun m!1355595 () Bool)

(assert (=> start!125518 m!1355595))

(declare-fun m!1355597 () Bool)

(assert (=> start!125518 m!1355597))

(assert (=> b!1468511 m!1355581))

(declare-fun m!1355599 () Bool)

(assert (=> b!1468511 m!1355599))

(declare-fun m!1355601 () Bool)

(assert (=> b!1468513 m!1355601))

(assert (=> b!1468513 m!1355601))

(declare-fun m!1355603 () Bool)

(assert (=> b!1468513 m!1355603))

(assert (=> b!1468512 m!1355591))

(assert (=> b!1468512 m!1355591))

(declare-fun m!1355605 () Bool)

(assert (=> b!1468512 m!1355605))

(declare-fun m!1355607 () Bool)

(assert (=> b!1468515 m!1355607))

(assert (=> b!1468510 m!1355591))

(assert (=> b!1468510 m!1355591))

(declare-fun m!1355609 () Bool)

(assert (=> b!1468510 m!1355609))

(assert (=> b!1468510 m!1355609))

(assert (=> b!1468510 m!1355591))

(declare-fun m!1355611 () Bool)

(assert (=> b!1468510 m!1355611))

(push 1)

