; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125548 () Bool)

(assert start!125548)

(declare-fun b!1468912 () Bool)

(declare-fun res!997459 () Bool)

(declare-fun e!824740 () Bool)

(assert (=> b!1468912 (=> (not res!997459) (not e!824740))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12026 0))(
  ( (MissingZero!12026 (index!50496 (_ BitVec 32))) (Found!12026 (index!50497 (_ BitVec 32))) (Intermediate!12026 (undefined!12838 Bool) (index!50498 (_ BitVec 32)) (x!132083 (_ BitVec 32))) (Undefined!12026) (MissingVacant!12026 (index!50499 (_ BitVec 32))) )
))
(declare-fun lt!642396 () SeekEntryResult!12026)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98996 0))(
  ( (array!98997 (arr!47786 (Array (_ BitVec 32) (_ BitVec 64))) (size!48336 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98996)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98996 (_ BitVec 32)) SeekEntryResult!12026)

(assert (=> b!1468912 (= res!997459 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47786 a!2862) j!93) a!2862 mask!2687) lt!642396))))

(declare-fun b!1468913 () Bool)

(declare-fun res!997452 () Bool)

(declare-fun e!824741 () Bool)

(assert (=> b!1468913 (=> (not res!997452) (not e!824741))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468913 (= res!997452 (validKeyInArray!0 (select (arr!47786 a!2862) i!1006)))))

(declare-fun b!1468914 () Bool)

(assert (=> b!1468914 (= e!824741 e!824740)))

(declare-fun res!997453 () Bool)

(assert (=> b!1468914 (=> (not res!997453) (not e!824740))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468914 (= res!997453 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47786 a!2862) j!93) mask!2687) (select (arr!47786 a!2862) j!93) a!2862 mask!2687) lt!642396))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468914 (= lt!642396 (Intermediate!12026 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun res!997457 () Bool)

(assert (=> start!125548 (=> (not res!997457) (not e!824741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125548 (= res!997457 (validMask!0 mask!2687))))

(assert (=> start!125548 e!824741))

(assert (=> start!125548 true))

(declare-fun array_inv!36814 (array!98996) Bool)

(assert (=> start!125548 (array_inv!36814 a!2862)))

(declare-fun b!1468915 () Bool)

(declare-fun res!997458 () Bool)

(assert (=> b!1468915 (=> (not res!997458) (not e!824741))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468915 (= res!997458 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48336 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48336 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48336 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47786 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468916 () Bool)

(declare-fun res!997456 () Bool)

(assert (=> b!1468916 (=> (not res!997456) (not e!824741))))

(assert (=> b!1468916 (= res!997456 (and (= (size!48336 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48336 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48336 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468917 () Bool)

(declare-fun res!997455 () Bool)

(assert (=> b!1468917 (=> (not res!997455) (not e!824741))))

(assert (=> b!1468917 (= res!997455 (validKeyInArray!0 (select (arr!47786 a!2862) j!93)))))

(declare-fun b!1468918 () Bool)

(declare-fun res!997451 () Bool)

(assert (=> b!1468918 (=> (not res!997451) (not e!824741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98996 (_ BitVec 32)) Bool)

(assert (=> b!1468918 (= res!997451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468919 () Bool)

(declare-fun res!997454 () Bool)

(assert (=> b!1468919 (=> (not res!997454) (not e!824741))))

(declare-datatypes ((List!34287 0))(
  ( (Nil!34284) (Cons!34283 (h!35633 (_ BitVec 64)) (t!48981 List!34287)) )
))
(declare-fun arrayNoDuplicates!0 (array!98996 (_ BitVec 32) List!34287) Bool)

(assert (=> b!1468919 (= res!997454 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34284))))

(declare-fun b!1468920 () Bool)

(assert (=> b!1468920 (= e!824740 false)))

(declare-fun lt!642395 () SeekEntryResult!12026)

(assert (=> b!1468920 (= lt!642395 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47786 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47786 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98997 (store (arr!47786 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48336 a!2862)) mask!2687))))

(assert (= (and start!125548 res!997457) b!1468916))

(assert (= (and b!1468916 res!997456) b!1468913))

(assert (= (and b!1468913 res!997452) b!1468917))

(assert (= (and b!1468917 res!997455) b!1468918))

(assert (= (and b!1468918 res!997451) b!1468919))

(assert (= (and b!1468919 res!997454) b!1468915))

(assert (= (and b!1468915 res!997458) b!1468914))

(assert (= (and b!1468914 res!997453) b!1468912))

(assert (= (and b!1468912 res!997459) b!1468920))

(declare-fun m!1356061 () Bool)

(assert (=> b!1468919 m!1356061))

(declare-fun m!1356063 () Bool)

(assert (=> b!1468917 m!1356063))

(assert (=> b!1468917 m!1356063))

(declare-fun m!1356065 () Bool)

(assert (=> b!1468917 m!1356065))

(declare-fun m!1356067 () Bool)

(assert (=> b!1468913 m!1356067))

(assert (=> b!1468913 m!1356067))

(declare-fun m!1356069 () Bool)

(assert (=> b!1468913 m!1356069))

(declare-fun m!1356071 () Bool)

(assert (=> start!125548 m!1356071))

(declare-fun m!1356073 () Bool)

(assert (=> start!125548 m!1356073))

(declare-fun m!1356075 () Bool)

(assert (=> b!1468915 m!1356075))

(declare-fun m!1356077 () Bool)

(assert (=> b!1468915 m!1356077))

(assert (=> b!1468912 m!1356063))

(assert (=> b!1468912 m!1356063))

(declare-fun m!1356079 () Bool)

(assert (=> b!1468912 m!1356079))

(declare-fun m!1356081 () Bool)

(assert (=> b!1468918 m!1356081))

(assert (=> b!1468920 m!1356075))

(declare-fun m!1356083 () Bool)

(assert (=> b!1468920 m!1356083))

(assert (=> b!1468920 m!1356083))

(declare-fun m!1356085 () Bool)

(assert (=> b!1468920 m!1356085))

(assert (=> b!1468920 m!1356085))

(assert (=> b!1468920 m!1356083))

(declare-fun m!1356087 () Bool)

(assert (=> b!1468920 m!1356087))

(assert (=> b!1468914 m!1356063))

(assert (=> b!1468914 m!1356063))

(declare-fun m!1356089 () Bool)

(assert (=> b!1468914 m!1356089))

(assert (=> b!1468914 m!1356089))

(assert (=> b!1468914 m!1356063))

(declare-fun m!1356091 () Bool)

(assert (=> b!1468914 m!1356091))

(push 1)

