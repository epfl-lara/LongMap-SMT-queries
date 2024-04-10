; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125564 () Bool)

(assert start!125564)

(declare-fun b!1469129 () Bool)

(declare-fun res!997671 () Bool)

(declare-fun e!824813 () Bool)

(assert (=> b!1469129 (=> (not res!997671) (not e!824813))))

(declare-datatypes ((array!99012 0))(
  ( (array!99013 (arr!47794 (Array (_ BitVec 32) (_ BitVec 64))) (size!48344 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99012)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469129 (= res!997671 (validKeyInArray!0 (select (arr!47794 a!2862) j!93)))))

(declare-fun b!1469130 () Bool)

(declare-fun res!997673 () Bool)

(declare-fun e!824812 () Bool)

(assert (=> b!1469130 (=> (not res!997673) (not e!824812))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12034 0))(
  ( (MissingZero!12034 (index!50528 (_ BitVec 32))) (Found!12034 (index!50529 (_ BitVec 32))) (Intermediate!12034 (undefined!12846 Bool) (index!50530 (_ BitVec 32)) (x!132107 (_ BitVec 32))) (Undefined!12034) (MissingVacant!12034 (index!50531 (_ BitVec 32))) )
))
(declare-fun lt!642444 () SeekEntryResult!12034)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99012 (_ BitVec 32)) SeekEntryResult!12034)

(assert (=> b!1469130 (= res!997673 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47794 a!2862) j!93) a!2862 mask!2687) lt!642444))))

(declare-fun b!1469131 () Bool)

(declare-fun res!997672 () Bool)

(assert (=> b!1469131 (=> (not res!997672) (not e!824813))))

(declare-datatypes ((List!34295 0))(
  ( (Nil!34292) (Cons!34291 (h!35641 (_ BitVec 64)) (t!48989 List!34295)) )
))
(declare-fun arrayNoDuplicates!0 (array!99012 (_ BitVec 32) List!34295) Bool)

(assert (=> b!1469131 (= res!997672 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34292))))

(declare-fun b!1469132 () Bool)

(declare-fun res!997670 () Bool)

(assert (=> b!1469132 (=> (not res!997670) (not e!824813))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1469132 (= res!997670 (validKeyInArray!0 (select (arr!47794 a!2862) i!1006)))))

(declare-fun b!1469133 () Bool)

(declare-fun res!997668 () Bool)

(assert (=> b!1469133 (=> (not res!997668) (not e!824813))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99012 (_ BitVec 32)) Bool)

(assert (=> b!1469133 (= res!997668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469134 () Bool)

(assert (=> b!1469134 (= e!824813 e!824812)))

(declare-fun res!997669 () Bool)

(assert (=> b!1469134 (=> (not res!997669) (not e!824812))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469134 (= res!997669 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47794 a!2862) j!93) mask!2687) (select (arr!47794 a!2862) j!93) a!2862 mask!2687) lt!642444))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1469134 (= lt!642444 (Intermediate!12034 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469135 () Bool)

(assert (=> b!1469135 (= e!824812 false)))

(declare-fun lt!642443 () SeekEntryResult!12034)

(assert (=> b!1469135 (= lt!642443 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47794 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47794 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!99013 (store (arr!47794 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48344 a!2862)) mask!2687))))

(declare-fun b!1469136 () Bool)

(declare-fun res!997674 () Bool)

(assert (=> b!1469136 (=> (not res!997674) (not e!824813))))

(assert (=> b!1469136 (= res!997674 (and (= (size!48344 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48344 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48344 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!997675 () Bool)

(assert (=> start!125564 (=> (not res!997675) (not e!824813))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125564 (= res!997675 (validMask!0 mask!2687))))

(assert (=> start!125564 e!824813))

(assert (=> start!125564 true))

(declare-fun array_inv!36822 (array!99012) Bool)

(assert (=> start!125564 (array_inv!36822 a!2862)))

(declare-fun b!1469128 () Bool)

(declare-fun res!997667 () Bool)

(assert (=> b!1469128 (=> (not res!997667) (not e!824813))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1469128 (= res!997667 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48344 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48344 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48344 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47794 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!125564 res!997675) b!1469136))

(assert (= (and b!1469136 res!997674) b!1469132))

(assert (= (and b!1469132 res!997670) b!1469129))

(assert (= (and b!1469129 res!997671) b!1469133))

(assert (= (and b!1469133 res!997668) b!1469131))

(assert (= (and b!1469131 res!997672) b!1469128))

(assert (= (and b!1469128 res!997667) b!1469134))

(assert (= (and b!1469134 res!997669) b!1469130))

(assert (= (and b!1469130 res!997673) b!1469135))

(declare-fun m!1356317 () Bool)

(assert (=> b!1469132 m!1356317))

(assert (=> b!1469132 m!1356317))

(declare-fun m!1356319 () Bool)

(assert (=> b!1469132 m!1356319))

(declare-fun m!1356321 () Bool)

(assert (=> b!1469128 m!1356321))

(declare-fun m!1356323 () Bool)

(assert (=> b!1469128 m!1356323))

(declare-fun m!1356325 () Bool)

(assert (=> start!125564 m!1356325))

(declare-fun m!1356327 () Bool)

(assert (=> start!125564 m!1356327))

(declare-fun m!1356329 () Bool)

(assert (=> b!1469131 m!1356329))

(declare-fun m!1356331 () Bool)

(assert (=> b!1469134 m!1356331))

(assert (=> b!1469134 m!1356331))

(declare-fun m!1356333 () Bool)

(assert (=> b!1469134 m!1356333))

(assert (=> b!1469134 m!1356333))

(assert (=> b!1469134 m!1356331))

(declare-fun m!1356335 () Bool)

(assert (=> b!1469134 m!1356335))

(assert (=> b!1469135 m!1356321))

(declare-fun m!1356337 () Bool)

(assert (=> b!1469135 m!1356337))

(assert (=> b!1469135 m!1356337))

(declare-fun m!1356339 () Bool)

(assert (=> b!1469135 m!1356339))

(assert (=> b!1469135 m!1356339))

(assert (=> b!1469135 m!1356337))

(declare-fun m!1356341 () Bool)

(assert (=> b!1469135 m!1356341))

(declare-fun m!1356343 () Bool)

(assert (=> b!1469133 m!1356343))

(assert (=> b!1469129 m!1356331))

(assert (=> b!1469129 m!1356331))

(declare-fun m!1356345 () Bool)

(assert (=> b!1469129 m!1356345))

(assert (=> b!1469130 m!1356331))

(assert (=> b!1469130 m!1356331))

(declare-fun m!1356347 () Bool)

(assert (=> b!1469130 m!1356347))

(push 1)

(assert (not b!1469131))

(assert (not b!1469133))

(assert (not b!1469135))

(assert (not b!1469130))

(assert (not b!1469132))

(assert (not b!1469134))

(assert (not start!125564))

