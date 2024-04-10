; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125446 () Bool)

(assert start!125446)

(declare-fun b!1467576 () Bool)

(declare-fun res!996119 () Bool)

(declare-fun e!824314 () Bool)

(assert (=> b!1467576 (=> (not res!996119) (not e!824314))))

(declare-datatypes ((array!98894 0))(
  ( (array!98895 (arr!47735 (Array (_ BitVec 32) (_ BitVec 64))) (size!48285 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98894)

(declare-datatypes ((List!34236 0))(
  ( (Nil!34233) (Cons!34232 (h!35582 (_ BitVec 64)) (t!48930 List!34236)) )
))
(declare-fun arrayNoDuplicates!0 (array!98894 (_ BitVec 32) List!34236) Bool)

(assert (=> b!1467576 (= res!996119 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34233))))

(declare-fun b!1467577 () Bool)

(declare-fun res!996115 () Bool)

(assert (=> b!1467577 (=> (not res!996115) (not e!824314))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467577 (= res!996115 (validKeyInArray!0 (select (arr!47735 a!2862) j!93)))))

(declare-fun b!1467578 () Bool)

(declare-fun res!996120 () Bool)

(assert (=> b!1467578 (=> (not res!996120) (not e!824314))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1467578 (= res!996120 (and (= (size!48285 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48285 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48285 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467579 () Bool)

(declare-fun res!996118 () Bool)

(assert (=> b!1467579 (=> (not res!996118) (not e!824314))))

(assert (=> b!1467579 (= res!996118 (validKeyInArray!0 (select (arr!47735 a!2862) i!1006)))))

(declare-fun res!996121 () Bool)

(assert (=> start!125446 (=> (not res!996121) (not e!824314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125446 (= res!996121 (validMask!0 mask!2687))))

(assert (=> start!125446 e!824314))

(assert (=> start!125446 true))

(declare-fun array_inv!36763 (array!98894) Bool)

(assert (=> start!125446 (array_inv!36763 a!2862)))

(declare-fun b!1467580 () Bool)

(declare-fun res!996117 () Bool)

(assert (=> b!1467580 (=> (not res!996117) (not e!824314))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1467580 (= res!996117 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48285 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48285 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48285 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47735 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1467581 () Bool)

(assert (=> b!1467581 (= e!824314 false)))

(declare-datatypes ((SeekEntryResult!11975 0))(
  ( (MissingZero!11975 (index!50292 (_ BitVec 32))) (Found!11975 (index!50293 (_ BitVec 32))) (Intermediate!11975 (undefined!12787 Bool) (index!50294 (_ BitVec 32)) (x!131896 (_ BitVec 32))) (Undefined!11975) (MissingVacant!11975 (index!50295 (_ BitVec 32))) )
))
(declare-fun lt!642123 () SeekEntryResult!11975)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98894 (_ BitVec 32)) SeekEntryResult!11975)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467581 (= lt!642123 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47735 a!2862) j!93) mask!2687) (select (arr!47735 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1467582 () Bool)

(declare-fun res!996116 () Bool)

(assert (=> b!1467582 (=> (not res!996116) (not e!824314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98894 (_ BitVec 32)) Bool)

(assert (=> b!1467582 (= res!996116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125446 res!996121) b!1467578))

(assert (= (and b!1467578 res!996120) b!1467579))

(assert (= (and b!1467579 res!996118) b!1467577))

(assert (= (and b!1467577 res!996115) b!1467582))

(assert (= (and b!1467582 res!996116) b!1467576))

(assert (= (and b!1467576 res!996119) b!1467580))

(assert (= (and b!1467580 res!996117) b!1467581))

(declare-fun m!1354519 () Bool)

(assert (=> b!1467582 m!1354519))

(declare-fun m!1354521 () Bool)

(assert (=> b!1467579 m!1354521))

(assert (=> b!1467579 m!1354521))

(declare-fun m!1354523 () Bool)

(assert (=> b!1467579 m!1354523))

(declare-fun m!1354525 () Bool)

(assert (=> start!125446 m!1354525))

(declare-fun m!1354527 () Bool)

(assert (=> start!125446 m!1354527))

(declare-fun m!1354529 () Bool)

(assert (=> b!1467580 m!1354529))

(declare-fun m!1354531 () Bool)

(assert (=> b!1467580 m!1354531))

(declare-fun m!1354533 () Bool)

(assert (=> b!1467577 m!1354533))

(assert (=> b!1467577 m!1354533))

(declare-fun m!1354535 () Bool)

(assert (=> b!1467577 m!1354535))

(declare-fun m!1354537 () Bool)

(assert (=> b!1467576 m!1354537))

(assert (=> b!1467581 m!1354533))

(assert (=> b!1467581 m!1354533))

(declare-fun m!1354539 () Bool)

(assert (=> b!1467581 m!1354539))

(assert (=> b!1467581 m!1354539))

(assert (=> b!1467581 m!1354533))

(declare-fun m!1354541 () Bool)

(assert (=> b!1467581 m!1354541))

(push 1)

(assert (not b!1467581))

(assert (not start!125446))

(assert (not b!1467582))

(assert (not b!1467579))

(assert (not b!1467576))

(assert (not b!1467577))

(check-sat)

