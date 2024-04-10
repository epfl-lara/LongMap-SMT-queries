; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125524 () Bool)

(assert start!125524)

(declare-fun b!1468589 () Bool)

(declare-fun res!997133 () Bool)

(declare-fun e!824632 () Bool)

(assert (=> b!1468589 (=> (not res!997133) (not e!824632))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98972 0))(
  ( (array!98973 (arr!47774 (Array (_ BitVec 32) (_ BitVec 64))) (size!48324 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98972)

(assert (=> b!1468589 (= res!997133 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48324 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48324 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48324 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47774 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1468590 () Bool)

(declare-fun res!997129 () Bool)

(assert (=> b!1468590 (=> (not res!997129) (not e!824632))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98972 (_ BitVec 32)) Bool)

(assert (=> b!1468590 (= res!997129 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1468591 () Bool)

(declare-fun res!997135 () Bool)

(assert (=> b!1468591 (=> (not res!997135) (not e!824632))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1468591 (= res!997135 (validKeyInArray!0 (select (arr!47774 a!2862) j!93)))))

(declare-fun b!1468592 () Bool)

(declare-fun e!824633 () Bool)

(assert (=> b!1468592 (= e!824632 e!824633)))

(declare-fun res!997128 () Bool)

(assert (=> b!1468592 (=> (not res!997128) (not e!824633))))

(declare-datatypes ((SeekEntryResult!12014 0))(
  ( (MissingZero!12014 (index!50448 (_ BitVec 32))) (Found!12014 (index!50449 (_ BitVec 32))) (Intermediate!12014 (undefined!12826 Bool) (index!50450 (_ BitVec 32)) (x!132039 (_ BitVec 32))) (Undefined!12014) (MissingVacant!12014 (index!50451 (_ BitVec 32))) )
))
(declare-fun lt!642323 () SeekEntryResult!12014)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98972 (_ BitVec 32)) SeekEntryResult!12014)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1468592 (= res!997128 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47774 a!2862) j!93) mask!2687) (select (arr!47774 a!2862) j!93) a!2862 mask!2687) lt!642323))))

(assert (=> b!1468592 (= lt!642323 (Intermediate!12014 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1468588 () Bool)

(declare-fun res!997131 () Bool)

(assert (=> b!1468588 (=> (not res!997131) (not e!824632))))

(declare-datatypes ((List!34275 0))(
  ( (Nil!34272) (Cons!34271 (h!35621 (_ BitVec 64)) (t!48969 List!34275)) )
))
(declare-fun arrayNoDuplicates!0 (array!98972 (_ BitVec 32) List!34275) Bool)

(assert (=> b!1468588 (= res!997131 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34272))))

(declare-fun res!997132 () Bool)

(assert (=> start!125524 (=> (not res!997132) (not e!824632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125524 (= res!997132 (validMask!0 mask!2687))))

(assert (=> start!125524 e!824632))

(assert (=> start!125524 true))

(declare-fun array_inv!36802 (array!98972) Bool)

(assert (=> start!125524 (array_inv!36802 a!2862)))

(declare-fun b!1468593 () Bool)

(assert (=> b!1468593 (= e!824633 false)))

(declare-fun lt!642324 () SeekEntryResult!12014)

(assert (=> b!1468593 (= lt!642324 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47774 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47774 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!98973 (store (arr!47774 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48324 a!2862)) mask!2687))))

(declare-fun b!1468594 () Bool)

(declare-fun res!997127 () Bool)

(assert (=> b!1468594 (=> (not res!997127) (not e!824632))))

(assert (=> b!1468594 (= res!997127 (and (= (size!48324 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48324 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48324 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1468595 () Bool)

(declare-fun res!997134 () Bool)

(assert (=> b!1468595 (=> (not res!997134) (not e!824633))))

(assert (=> b!1468595 (= res!997134 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47774 a!2862) j!93) a!2862 mask!2687) lt!642323))))

(declare-fun b!1468596 () Bool)

(declare-fun res!997130 () Bool)

(assert (=> b!1468596 (=> (not res!997130) (not e!824632))))

(assert (=> b!1468596 (= res!997130 (validKeyInArray!0 (select (arr!47774 a!2862) i!1006)))))

(assert (= (and start!125524 res!997132) b!1468594))

(assert (= (and b!1468594 res!997127) b!1468596))

(assert (= (and b!1468596 res!997130) b!1468591))

(assert (= (and b!1468591 res!997135) b!1468590))

(assert (= (and b!1468590 res!997129) b!1468588))

(assert (= (and b!1468588 res!997131) b!1468589))

(assert (= (and b!1468589 res!997133) b!1468592))

(assert (= (and b!1468592 res!997128) b!1468595))

(assert (= (and b!1468595 res!997134) b!1468593))

(declare-fun m!1355677 () Bool)

(assert (=> b!1468589 m!1355677))

(declare-fun m!1355679 () Bool)

(assert (=> b!1468589 m!1355679))

(assert (=> b!1468593 m!1355677))

(declare-fun m!1355681 () Bool)

(assert (=> b!1468593 m!1355681))

(assert (=> b!1468593 m!1355681))

(declare-fun m!1355683 () Bool)

(assert (=> b!1468593 m!1355683))

(assert (=> b!1468593 m!1355683))

(assert (=> b!1468593 m!1355681))

(declare-fun m!1355685 () Bool)

(assert (=> b!1468593 m!1355685))

(declare-fun m!1355687 () Bool)

(assert (=> b!1468591 m!1355687))

(assert (=> b!1468591 m!1355687))

(declare-fun m!1355689 () Bool)

(assert (=> b!1468591 m!1355689))

(declare-fun m!1355691 () Bool)

(assert (=> start!125524 m!1355691))

(declare-fun m!1355693 () Bool)

(assert (=> start!125524 m!1355693))

(declare-fun m!1355695 () Bool)

(assert (=> b!1468590 m!1355695))

(assert (=> b!1468592 m!1355687))

(assert (=> b!1468592 m!1355687))

(declare-fun m!1355697 () Bool)

(assert (=> b!1468592 m!1355697))

(assert (=> b!1468592 m!1355697))

(assert (=> b!1468592 m!1355687))

(declare-fun m!1355699 () Bool)

(assert (=> b!1468592 m!1355699))

(assert (=> b!1468595 m!1355687))

(assert (=> b!1468595 m!1355687))

(declare-fun m!1355701 () Bool)

(assert (=> b!1468595 m!1355701))

(declare-fun m!1355703 () Bool)

(assert (=> b!1468596 m!1355703))

(assert (=> b!1468596 m!1355703))

(declare-fun m!1355705 () Bool)

(assert (=> b!1468596 m!1355705))

(declare-fun m!1355707 () Bool)

(assert (=> b!1468588 m!1355707))

(push 1)

(assert (not b!1468592))

(assert (not b!1468590))

(assert (not b!1468596))

(assert (not b!1468588))

(assert (not start!125524))

(assert (not b!1468595))

(assert (not b!1468591))

(assert (not b!1468593))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

