; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125744 () Bool)

(assert start!125744)

(declare-fun b!1469517 () Bool)

(declare-fun res!996959 () Bool)

(declare-fun e!825438 () Bool)

(assert (=> b!1469517 (=> (not res!996959) (not e!825438))))

(declare-datatypes ((array!99030 0))(
  ( (array!99031 (arr!47798 (Array (_ BitVec 32) (_ BitVec 64))) (size!48349 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99030)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469517 (= res!996959 (validKeyInArray!0 (select (arr!47798 a!2862) i!1006)))))

(declare-fun b!1469519 () Bool)

(assert (=> b!1469519 (= e!825438 false)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11935 0))(
  ( (MissingZero!11935 (index!50132 (_ BitVec 32))) (Found!11935 (index!50133 (_ BitVec 32))) (Intermediate!11935 (undefined!12747 Bool) (index!50134 (_ BitVec 32)) (x!131913 (_ BitVec 32))) (Undefined!11935) (MissingVacant!11935 (index!50135 (_ BitVec 32))) )
))
(declare-fun lt!642790 () SeekEntryResult!11935)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99030 (_ BitVec 32)) SeekEntryResult!11935)

(assert (=> b!1469519 (= lt!642790 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47798 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1469520 () Bool)

(declare-fun res!996958 () Bool)

(assert (=> b!1469520 (=> (not res!996958) (not e!825438))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469520 (= res!996958 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47798 a!2862) j!93) mask!2687) (select (arr!47798 a!2862) j!93) a!2862 mask!2687) (Intermediate!11935 false intermediateBeforeIndex!19 intermediateBeforeX!19)))))

(declare-fun b!1469521 () Bool)

(declare-fun res!996965 () Bool)

(assert (=> b!1469521 (=> (not res!996965) (not e!825438))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1469521 (= res!996965 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48349 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48349 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48349 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47798 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1469522 () Bool)

(declare-fun res!996960 () Bool)

(assert (=> b!1469522 (=> (not res!996960) (not e!825438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99030 (_ BitVec 32)) Bool)

(assert (=> b!1469522 (= res!996960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469523 () Bool)

(declare-fun res!996962 () Bool)

(assert (=> b!1469523 (=> (not res!996962) (not e!825438))))

(assert (=> b!1469523 (= res!996962 (validKeyInArray!0 (select (arr!47798 a!2862) j!93)))))

(declare-fun b!1469524 () Bool)

(declare-fun res!996961 () Bool)

(assert (=> b!1469524 (=> (not res!996961) (not e!825438))))

(assert (=> b!1469524 (= res!996961 (and (= (size!48349 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48349 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48349 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!996963 () Bool)

(assert (=> start!125744 (=> (not res!996963) (not e!825438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125744 (= res!996963 (validMask!0 mask!2687))))

(assert (=> start!125744 e!825438))

(assert (=> start!125744 true))

(declare-fun array_inv!37079 (array!99030) Bool)

(assert (=> start!125744 (array_inv!37079 a!2862)))

(declare-fun b!1469518 () Bool)

(declare-fun res!996964 () Bool)

(assert (=> b!1469518 (=> (not res!996964) (not e!825438))))

(declare-datatypes ((List!34286 0))(
  ( (Nil!34283) (Cons!34282 (h!35646 (_ BitVec 64)) (t!48972 List!34286)) )
))
(declare-fun arrayNoDuplicates!0 (array!99030 (_ BitVec 32) List!34286) Bool)

(assert (=> b!1469518 (= res!996964 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34283))))

(assert (= (and start!125744 res!996963) b!1469524))

(assert (= (and b!1469524 res!996961) b!1469517))

(assert (= (and b!1469517 res!996959) b!1469523))

(assert (= (and b!1469523 res!996962) b!1469522))

(assert (= (and b!1469522 res!996960) b!1469518))

(assert (= (and b!1469518 res!996964) b!1469521))

(assert (= (and b!1469521 res!996965) b!1469520))

(assert (= (and b!1469520 res!996958) b!1469519))

(declare-fun m!1356459 () Bool)

(assert (=> b!1469522 m!1356459))

(declare-fun m!1356461 () Bool)

(assert (=> b!1469523 m!1356461))

(assert (=> b!1469523 m!1356461))

(declare-fun m!1356463 () Bool)

(assert (=> b!1469523 m!1356463))

(declare-fun m!1356465 () Bool)

(assert (=> b!1469517 m!1356465))

(assert (=> b!1469517 m!1356465))

(declare-fun m!1356467 () Bool)

(assert (=> b!1469517 m!1356467))

(declare-fun m!1356469 () Bool)

(assert (=> b!1469521 m!1356469))

(declare-fun m!1356471 () Bool)

(assert (=> b!1469521 m!1356471))

(declare-fun m!1356473 () Bool)

(assert (=> start!125744 m!1356473))

(declare-fun m!1356475 () Bool)

(assert (=> start!125744 m!1356475))

(assert (=> b!1469520 m!1356461))

(assert (=> b!1469520 m!1356461))

(declare-fun m!1356477 () Bool)

(assert (=> b!1469520 m!1356477))

(assert (=> b!1469520 m!1356477))

(assert (=> b!1469520 m!1356461))

(declare-fun m!1356479 () Bool)

(assert (=> b!1469520 m!1356479))

(assert (=> b!1469519 m!1356461))

(assert (=> b!1469519 m!1356461))

(declare-fun m!1356481 () Bool)

(assert (=> b!1469519 m!1356481))

(declare-fun m!1356483 () Bool)

(assert (=> b!1469518 m!1356483))

(push 1)

(assert (not b!1469519))

(assert (not b!1469517))

(assert (not b!1469522))

(assert (not b!1469520))

(assert (not b!1469518))

(assert (not start!125744))

(assert (not b!1469523))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

