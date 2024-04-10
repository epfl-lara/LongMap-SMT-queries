; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125528 () Bool)

(assert start!125528)

(declare-fun b!1468642 () Bool)

(declare-fun res!997189 () Bool)

(declare-fun e!824650 () Bool)

(assert (=> b!1468642 (=> (not res!997189) (not e!824650))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98976 0))(
  ( (array!98977 (arr!47776 (Array (_ BitVec 32) (_ BitVec 64))) (size!48326 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98976)

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1468642 (= res!997189 (and (= (size!48326 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48326 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48326 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468643 () Bool)

(declare-fun res!997182 () Bool)

(assert (=> b!1468643 (=> (not res!997182) (not e!824650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468643 (= res!997182 (validKeyInArray!0 (select (arr!47776 a!2862) i!1006)))))

(declare-fun b!1468644 () Bool)

(declare-fun res!997183 () Bool)

(assert (=> b!1468644 (=> (not res!997183) (not e!824650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98976 (_ BitVec 32)) Bool)

(assert (=> b!1468644 (= res!997183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!997188 () Bool)

(assert (=> start!125528 (=> (not res!997188) (not e!824650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125528 (= res!997188 (validMask!0 mask!2687))))

(assert (=> start!125528 e!824650))

(assert (=> start!125528 true))

(declare-fun array_inv!36804 (array!98976) Bool)

(assert (=> start!125528 (array_inv!36804 a!2862)))

(declare-fun b!1468645 () Bool)

(declare-fun res!997185 () Bool)

(assert (=> b!1468645 (=> (not res!997185) (not e!824650))))

(declare-datatypes ((List!34277 0))(
  ( (Nil!34274) (Cons!34273 (h!35623 (_ BitVec 64)) (t!48971 List!34277)) )
))
(declare-fun arrayNoDuplicates!0 (array!98976 (_ BitVec 32) List!34277) Bool)

(assert (=> b!1468645 (= res!997185 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34274))))

(declare-fun b!1468646 () Bool)

(declare-fun e!824649 () Bool)

(assert (=> b!1468646 (= e!824650 e!824649)))

(declare-fun res!997186 () Bool)

(assert (=> b!1468646 (=> (not res!997186) (not e!824649))))

(declare-datatypes ((SeekEntryResult!12016 0))(
  ( (MissingZero!12016 (index!50456 (_ BitVec 32))) (Found!12016 (index!50457 (_ BitVec 32))) (Intermediate!12016 (undefined!12828 Bool) (index!50458 (_ BitVec 32)) (x!132041 (_ BitVec 32))) (Undefined!12016) (MissingVacant!12016 (index!50459 (_ BitVec 32))) )
))
(declare-fun lt!642336 () SeekEntryResult!12016)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98976 (_ BitVec 32)) SeekEntryResult!12016)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468646 (= res!997186 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47776 a!2862) j!93) mask!2687) (select (arr!47776 a!2862) j!93) a!2862 mask!2687) lt!642336))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468646 (= lt!642336 (Intermediate!12016 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468647 () Bool)

(declare-fun res!997181 () Bool)

(assert (=> b!1468647 (=> (not res!997181) (not e!824649))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1468647 (= res!997181 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47776 a!2862) j!93) a!2862 mask!2687) lt!642336))))

(declare-fun b!1468648 () Bool)

(declare-fun res!997184 () Bool)

(assert (=> b!1468648 (=> (not res!997184) (not e!824650))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468648 (= res!997184 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48326 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48326 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48326 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47776 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468649 () Bool)

(declare-fun res!997187 () Bool)

(assert (=> b!1468649 (=> (not res!997187) (not e!824650))))

(assert (=> b!1468649 (= res!997187 (validKeyInArray!0 (select (arr!47776 a!2862) j!93)))))

(declare-fun b!1468650 () Bool)

(assert (=> b!1468650 (= e!824649 false)))

(declare-fun lt!642335 () SeekEntryResult!12016)

(assert (=> b!1468650 (= lt!642335 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47776 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47776 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98977 (store (arr!47776 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48326 a!2862)) mask!2687))))

(assert (= (and start!125528 res!997188) b!1468642))

(assert (= (and b!1468642 res!997189) b!1468643))

(assert (= (and b!1468643 res!997182) b!1468649))

(assert (= (and b!1468649 res!997187) b!1468644))

(assert (= (and b!1468644 res!997183) b!1468645))

(assert (= (and b!1468645 res!997185) b!1468648))

(assert (= (and b!1468648 res!997184) b!1468646))

(assert (= (and b!1468646 res!997186) b!1468647))

(assert (= (and b!1468647 res!997181) b!1468650))

(declare-fun m!1355741 () Bool)

(assert (=> b!1468648 m!1355741))

(declare-fun m!1355743 () Bool)

(assert (=> b!1468648 m!1355743))

(declare-fun m!1355745 () Bool)

(assert (=> b!1468647 m!1355745))

(assert (=> b!1468647 m!1355745))

(declare-fun m!1355747 () Bool)

(assert (=> b!1468647 m!1355747))

(declare-fun m!1355749 () Bool)

(assert (=> b!1468644 m!1355749))

(declare-fun m!1355751 () Bool)

(assert (=> start!125528 m!1355751))

(declare-fun m!1355753 () Bool)

(assert (=> start!125528 m!1355753))

(declare-fun m!1355755 () Bool)

(assert (=> b!1468645 m!1355755))

(assert (=> b!1468646 m!1355745))

(assert (=> b!1468646 m!1355745))

(declare-fun m!1355757 () Bool)

(assert (=> b!1468646 m!1355757))

(assert (=> b!1468646 m!1355757))

(assert (=> b!1468646 m!1355745))

(declare-fun m!1355759 () Bool)

(assert (=> b!1468646 m!1355759))

(assert (=> b!1468649 m!1355745))

(assert (=> b!1468649 m!1355745))

(declare-fun m!1355761 () Bool)

(assert (=> b!1468649 m!1355761))

(declare-fun m!1355763 () Bool)

(assert (=> b!1468643 m!1355763))

(assert (=> b!1468643 m!1355763))

(declare-fun m!1355765 () Bool)

(assert (=> b!1468643 m!1355765))

(assert (=> b!1468650 m!1355741))

(declare-fun m!1355767 () Bool)

(assert (=> b!1468650 m!1355767))

(assert (=> b!1468650 m!1355767))

(declare-fun m!1355769 () Bool)

(assert (=> b!1468650 m!1355769))

(assert (=> b!1468650 m!1355769))

(assert (=> b!1468650 m!1355767))

(declare-fun m!1355771 () Bool)

(assert (=> b!1468650 m!1355771))

(push 1)

(assert (not b!1468644))

(assert (not b!1468647))

(assert (not b!1468643))

(assert (not b!1468646))

(assert (not b!1468645))

(assert (not start!125528))

(assert (not b!1468649))

