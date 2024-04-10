; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125530 () Bool)

(assert start!125530)

(declare-fun b!1468669 () Bool)

(declare-fun res!997215 () Bool)

(declare-fun e!824658 () Bool)

(assert (=> b!1468669 (=> (not res!997215) (not e!824658))))

(declare-datatypes ((array!98978 0))(
  ( (array!98979 (arr!47777 (Array (_ BitVec 32) (_ BitVec 64))) (size!48327 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98978)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98978 (_ BitVec 32)) Bool)

(assert (=> b!1468669 (= res!997215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468670 () Bool)

(declare-fun res!997210 () Bool)

(assert (=> b!1468670 (=> (not res!997210) (not e!824658))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468670 (= res!997210 (validKeyInArray!0 (select (arr!47777 a!2862) i!1006)))))

(declare-fun b!1468671 () Bool)

(declare-fun res!997211 () Bool)

(assert (=> b!1468671 (=> (not res!997211) (not e!824658))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1468671 (= res!997211 (and (= (size!48327 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48327 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48327 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468672 () Bool)

(declare-fun res!997209 () Bool)

(assert (=> b!1468672 (=> (not res!997209) (not e!824658))))

(declare-datatypes ((List!34278 0))(
  ( (Nil!34275) (Cons!34274 (h!35624 (_ BitVec 64)) (t!48972 List!34278)) )
))
(declare-fun arrayNoDuplicates!0 (array!98978 (_ BitVec 32) List!34278) Bool)

(assert (=> b!1468672 (= res!997209 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34275))))

(declare-fun b!1468673 () Bool)

(declare-fun res!997212 () Bool)

(declare-fun e!824659 () Bool)

(assert (=> b!1468673 (=> (not res!997212) (not e!824659))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12017 0))(
  ( (MissingZero!12017 (index!50460 (_ BitVec 32))) (Found!12017 (index!50461 (_ BitVec 32))) (Intermediate!12017 (undefined!12829 Bool) (index!50462 (_ BitVec 32)) (x!132050 (_ BitVec 32))) (Undefined!12017) (MissingVacant!12017 (index!50463 (_ BitVec 32))) )
))
(declare-fun lt!642341 () SeekEntryResult!12017)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98978 (_ BitVec 32)) SeekEntryResult!12017)

(assert (=> b!1468673 (= res!997212 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47777 a!2862) j!93) a!2862 mask!2687) lt!642341))))

(declare-fun res!997214 () Bool)

(assert (=> start!125530 (=> (not res!997214) (not e!824658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125530 (= res!997214 (validMask!0 mask!2687))))

(assert (=> start!125530 e!824658))

(assert (=> start!125530 true))

(declare-fun array_inv!36805 (array!98978) Bool)

(assert (=> start!125530 (array_inv!36805 a!2862)))

(declare-fun b!1468674 () Bool)

(declare-fun res!997208 () Bool)

(assert (=> b!1468674 (=> (not res!997208) (not e!824658))))

(assert (=> b!1468674 (= res!997208 (validKeyInArray!0 (select (arr!47777 a!2862) j!93)))))

(declare-fun b!1468675 () Bool)

(assert (=> b!1468675 (= e!824659 false)))

(declare-fun lt!642342 () SeekEntryResult!12017)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468675 (= lt!642342 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47777 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47777 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98979 (store (arr!47777 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48327 a!2862)) mask!2687))))

(declare-fun b!1468676 () Bool)

(assert (=> b!1468676 (= e!824658 e!824659)))

(declare-fun res!997213 () Bool)

(assert (=> b!1468676 (=> (not res!997213) (not e!824659))))

(assert (=> b!1468676 (= res!997213 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47777 a!2862) j!93) mask!2687) (select (arr!47777 a!2862) j!93) a!2862 mask!2687) lt!642341))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1468676 (= lt!642341 (Intermediate!12017 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468677 () Bool)

(declare-fun res!997216 () Bool)

(assert (=> b!1468677 (=> (not res!997216) (not e!824658))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1468677 (= res!997216 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48327 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48327 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48327 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47777 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!125530 res!997214) b!1468671))

(assert (= (and b!1468671 res!997211) b!1468670))

(assert (= (and b!1468670 res!997210) b!1468674))

(assert (= (and b!1468674 res!997208) b!1468669))

(assert (= (and b!1468669 res!997215) b!1468672))

(assert (= (and b!1468672 res!997209) b!1468677))

(assert (= (and b!1468677 res!997216) b!1468676))

(assert (= (and b!1468676 res!997213) b!1468673))

(assert (= (and b!1468673 res!997212) b!1468675))

(declare-fun m!1355773 () Bool)

(assert (=> b!1468669 m!1355773))

(declare-fun m!1355775 () Bool)

(assert (=> b!1468677 m!1355775))

(declare-fun m!1355777 () Bool)

(assert (=> b!1468677 m!1355777))

(declare-fun m!1355779 () Bool)

(assert (=> b!1468674 m!1355779))

(assert (=> b!1468674 m!1355779))

(declare-fun m!1355781 () Bool)

(assert (=> b!1468674 m!1355781))

(assert (=> b!1468675 m!1355775))

(declare-fun m!1355783 () Bool)

(assert (=> b!1468675 m!1355783))

(assert (=> b!1468675 m!1355783))

(declare-fun m!1355785 () Bool)

(assert (=> b!1468675 m!1355785))

(assert (=> b!1468675 m!1355785))

(assert (=> b!1468675 m!1355783))

(declare-fun m!1355787 () Bool)

(assert (=> b!1468675 m!1355787))

(declare-fun m!1355789 () Bool)

(assert (=> b!1468672 m!1355789))

(declare-fun m!1355791 () Bool)

(assert (=> start!125530 m!1355791))

(declare-fun m!1355793 () Bool)

(assert (=> start!125530 m!1355793))

(assert (=> b!1468676 m!1355779))

(assert (=> b!1468676 m!1355779))

(declare-fun m!1355795 () Bool)

(assert (=> b!1468676 m!1355795))

(assert (=> b!1468676 m!1355795))

(assert (=> b!1468676 m!1355779))

(declare-fun m!1355797 () Bool)

(assert (=> b!1468676 m!1355797))

(assert (=> b!1468673 m!1355779))

(assert (=> b!1468673 m!1355779))

(declare-fun m!1355799 () Bool)

(assert (=> b!1468673 m!1355799))

(declare-fun m!1355801 () Bool)

(assert (=> b!1468670 m!1355801))

(assert (=> b!1468670 m!1355801))

(declare-fun m!1355803 () Bool)

(assert (=> b!1468670 m!1355803))

(push 1)

