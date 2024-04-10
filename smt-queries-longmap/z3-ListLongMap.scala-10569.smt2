; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124554 () Bool)

(assert start!124554)

(declare-fun b!1441582 () Bool)

(declare-fun res!973921 () Bool)

(declare-fun e!812634 () Bool)

(assert (=> b!1441582 (=> (not res!973921) (not e!812634))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11541 0))(
  ( (MissingZero!11541 (index!48556 (_ BitVec 32))) (Found!11541 (index!48557 (_ BitVec 32))) (Intermediate!11541 (undefined!12353 Bool) (index!48558 (_ BitVec 32)) (x!130270 (_ BitVec 32))) (Undefined!11541) (MissingVacant!11541 (index!48559 (_ BitVec 32))) )
))
(declare-fun lt!633293 () SeekEntryResult!11541)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98002 0))(
  ( (array!98003 (arr!47289 (Array (_ BitVec 32) (_ BitVec 64))) (size!47839 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98002)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98002 (_ BitVec 32)) SeekEntryResult!11541)

(assert (=> b!1441582 (= res!973921 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47289 a!2862) j!93) a!2862 mask!2687) lt!633293))))

(declare-fun b!1441583 () Bool)

(declare-fun res!973910 () Bool)

(declare-fun e!812632 () Bool)

(assert (=> b!1441583 (=> (not res!973910) (not e!812632))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98002 (_ BitVec 32)) Bool)

(assert (=> b!1441583 (= res!973910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441584 () Bool)

(declare-fun e!812636 () Bool)

(assert (=> b!1441584 (= e!812636 (not true))))

(assert (=> b!1441584 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48578 0))(
  ( (Unit!48579) )
))
(declare-fun lt!633290 () Unit!48578)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98002 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48578)

(assert (=> b!1441584 (= lt!633290 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1441585 () Bool)

(assert (=> b!1441585 (= e!812634 e!812636)))

(declare-fun res!973914 () Bool)

(assert (=> b!1441585 (=> (not res!973914) (not e!812636))))

(declare-fun lt!633294 () SeekEntryResult!11541)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1441585 (= res!973914 (= lt!633294 (Intermediate!11541 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!633292 () (_ BitVec 64))

(declare-fun lt!633291 () array!98002)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441585 (= lt!633294 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633292 mask!2687) lt!633292 lt!633291 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1441585 (= lt!633292 (select (store (arr!47289 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441586 () Bool)

(declare-fun res!973920 () Bool)

(assert (=> b!1441586 (=> (not res!973920) (not e!812632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441586 (= res!973920 (validKeyInArray!0 (select (arr!47289 a!2862) i!1006)))))

(declare-fun e!812631 () Bool)

(declare-fun b!1441587 () Bool)

(assert (=> b!1441587 (= e!812631 (= lt!633294 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633292 lt!633291 mask!2687)))))

(declare-fun b!1441588 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98002 (_ BitVec 32)) SeekEntryResult!11541)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98002 (_ BitVec 32)) SeekEntryResult!11541)

(assert (=> b!1441588 (= e!812631 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633292 lt!633291 mask!2687) (seekEntryOrOpen!0 lt!633292 lt!633291 mask!2687)))))

(declare-fun b!1441589 () Bool)

(declare-fun res!973918 () Bool)

(assert (=> b!1441589 (=> (not res!973918) (not e!812636))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441589 (= res!973918 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!973919 () Bool)

(assert (=> start!124554 (=> (not res!973919) (not e!812632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124554 (= res!973919 (validMask!0 mask!2687))))

(assert (=> start!124554 e!812632))

(assert (=> start!124554 true))

(declare-fun array_inv!36317 (array!98002) Bool)

(assert (=> start!124554 (array_inv!36317 a!2862)))

(declare-fun b!1441590 () Bool)

(declare-fun res!973909 () Bool)

(assert (=> b!1441590 (=> (not res!973909) (not e!812632))))

(assert (=> b!1441590 (= res!973909 (validKeyInArray!0 (select (arr!47289 a!2862) j!93)))))

(declare-fun b!1441591 () Bool)

(declare-fun e!812633 () Bool)

(assert (=> b!1441591 (= e!812633 e!812634)))

(declare-fun res!973912 () Bool)

(assert (=> b!1441591 (=> (not res!973912) (not e!812634))))

(assert (=> b!1441591 (= res!973912 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47289 a!2862) j!93) mask!2687) (select (arr!47289 a!2862) j!93) a!2862 mask!2687) lt!633293))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1441591 (= lt!633293 (Intermediate!11541 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441592 () Bool)

(declare-fun res!973915 () Bool)

(assert (=> b!1441592 (=> (not res!973915) (not e!812632))))

(declare-datatypes ((List!33790 0))(
  ( (Nil!33787) (Cons!33786 (h!35136 (_ BitVec 64)) (t!48484 List!33790)) )
))
(declare-fun arrayNoDuplicates!0 (array!98002 (_ BitVec 32) List!33790) Bool)

(assert (=> b!1441592 (= res!973915 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33787))))

(declare-fun b!1441593 () Bool)

(declare-fun res!973913 () Bool)

(assert (=> b!1441593 (=> (not res!973913) (not e!812632))))

(assert (=> b!1441593 (= res!973913 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47839 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47839 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47839 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1441594 () Bool)

(declare-fun res!973916 () Bool)

(assert (=> b!1441594 (=> (not res!973916) (not e!812632))))

(assert (=> b!1441594 (= res!973916 (and (= (size!47839 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47839 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47839 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441595 () Bool)

(declare-fun res!973917 () Bool)

(assert (=> b!1441595 (=> (not res!973917) (not e!812636))))

(assert (=> b!1441595 (= res!973917 e!812631)))

(declare-fun c!133347 () Bool)

(assert (=> b!1441595 (= c!133347 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441596 () Bool)

(assert (=> b!1441596 (= e!812632 e!812633)))

(declare-fun res!973911 () Bool)

(assert (=> b!1441596 (=> (not res!973911) (not e!812633))))

(assert (=> b!1441596 (= res!973911 (= (select (store (arr!47289 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1441596 (= lt!633291 (array!98003 (store (arr!47289 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47839 a!2862)))))

(assert (= (and start!124554 res!973919) b!1441594))

(assert (= (and b!1441594 res!973916) b!1441586))

(assert (= (and b!1441586 res!973920) b!1441590))

(assert (= (and b!1441590 res!973909) b!1441583))

(assert (= (and b!1441583 res!973910) b!1441592))

(assert (= (and b!1441592 res!973915) b!1441593))

(assert (= (and b!1441593 res!973913) b!1441596))

(assert (= (and b!1441596 res!973911) b!1441591))

(assert (= (and b!1441591 res!973912) b!1441582))

(assert (= (and b!1441582 res!973921) b!1441585))

(assert (= (and b!1441585 res!973914) b!1441595))

(assert (= (and b!1441595 c!133347) b!1441587))

(assert (= (and b!1441595 (not c!133347)) b!1441588))

(assert (= (and b!1441595 res!973917) b!1441589))

(assert (= (and b!1441589 res!973918) b!1441584))

(declare-fun m!1330795 () Bool)

(assert (=> b!1441583 m!1330795))

(declare-fun m!1330797 () Bool)

(assert (=> b!1441587 m!1330797))

(declare-fun m!1330799 () Bool)

(assert (=> b!1441586 m!1330799))

(assert (=> b!1441586 m!1330799))

(declare-fun m!1330801 () Bool)

(assert (=> b!1441586 m!1330801))

(declare-fun m!1330803 () Bool)

(assert (=> b!1441590 m!1330803))

(assert (=> b!1441590 m!1330803))

(declare-fun m!1330805 () Bool)

(assert (=> b!1441590 m!1330805))

(assert (=> b!1441591 m!1330803))

(assert (=> b!1441591 m!1330803))

(declare-fun m!1330807 () Bool)

(assert (=> b!1441591 m!1330807))

(assert (=> b!1441591 m!1330807))

(assert (=> b!1441591 m!1330803))

(declare-fun m!1330809 () Bool)

(assert (=> b!1441591 m!1330809))

(declare-fun m!1330811 () Bool)

(assert (=> b!1441585 m!1330811))

(assert (=> b!1441585 m!1330811))

(declare-fun m!1330813 () Bool)

(assert (=> b!1441585 m!1330813))

(declare-fun m!1330815 () Bool)

(assert (=> b!1441585 m!1330815))

(declare-fun m!1330817 () Bool)

(assert (=> b!1441585 m!1330817))

(declare-fun m!1330819 () Bool)

(assert (=> b!1441584 m!1330819))

(declare-fun m!1330821 () Bool)

(assert (=> b!1441584 m!1330821))

(assert (=> b!1441582 m!1330803))

(assert (=> b!1441582 m!1330803))

(declare-fun m!1330823 () Bool)

(assert (=> b!1441582 m!1330823))

(assert (=> b!1441596 m!1330815))

(declare-fun m!1330825 () Bool)

(assert (=> b!1441596 m!1330825))

(declare-fun m!1330827 () Bool)

(assert (=> start!124554 m!1330827))

(declare-fun m!1330829 () Bool)

(assert (=> start!124554 m!1330829))

(declare-fun m!1330831 () Bool)

(assert (=> b!1441592 m!1330831))

(declare-fun m!1330833 () Bool)

(assert (=> b!1441588 m!1330833))

(declare-fun m!1330835 () Bool)

(assert (=> b!1441588 m!1330835))

(check-sat (not b!1441592) (not b!1441584) (not b!1441590) (not b!1441585) (not start!124554) (not b!1441582) (not b!1441588) (not b!1441591) (not b!1441586) (not b!1441587) (not b!1441583))
(check-sat)
