; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125766 () Bool)

(assert start!125766)

(declare-fun b!1469810 () Bool)

(declare-fun res!997255 () Bool)

(declare-fun e!825534 () Bool)

(assert (=> b!1469810 (=> (not res!997255) (not e!825534))))

(declare-datatypes ((array!99052 0))(
  ( (array!99053 (arr!47809 (Array (_ BitVec 32) (_ BitVec 64))) (size!48360 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99052)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469810 (= res!997255 (validKeyInArray!0 (select (arr!47809 a!2862) i!1006)))))

(declare-fun b!1469811 () Bool)

(declare-fun res!997256 () Bool)

(declare-fun e!825533 () Bool)

(assert (=> b!1469811 (=> (not res!997256) (not e!825533))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11946 0))(
  ( (MissingZero!11946 (index!50176 (_ BitVec 32))) (Found!11946 (index!50177 (_ BitVec 32))) (Intermediate!11946 (undefined!12758 Bool) (index!50178 (_ BitVec 32)) (x!131956 (_ BitVec 32))) (Undefined!11946) (MissingVacant!11946 (index!50179 (_ BitVec 32))) )
))
(declare-fun lt!642852 () SeekEntryResult!11946)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99052 (_ BitVec 32)) SeekEntryResult!11946)

(assert (=> b!1469811 (= res!997256 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47809 a!2862) j!93) a!2862 mask!2687) lt!642852))))

(declare-fun b!1469812 () Bool)

(declare-fun res!997258 () Bool)

(assert (=> b!1469812 (=> (not res!997258) (not e!825534))))

(assert (=> b!1469812 (= res!997258 (validKeyInArray!0 (select (arr!47809 a!2862) j!93)))))

(declare-fun b!1469813 () Bool)

(declare-fun res!997253 () Bool)

(assert (=> b!1469813 (=> (not res!997253) (not e!825534))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1469813 (= res!997253 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48360 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48360 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48360 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47809 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1469814 () Bool)

(assert (=> b!1469814 (= e!825534 e!825533)))

(declare-fun res!997251 () Bool)

(assert (=> b!1469814 (=> (not res!997251) (not e!825533))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469814 (= res!997251 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47809 a!2862) j!93) mask!2687) (select (arr!47809 a!2862) j!93) a!2862 mask!2687) lt!642852))))

(assert (=> b!1469814 (= lt!642852 (Intermediate!11946 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1469815 () Bool)

(declare-fun res!997259 () Bool)

(assert (=> b!1469815 (=> (not res!997259) (not e!825534))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99052 (_ BitVec 32)) Bool)

(assert (=> b!1469815 (= res!997259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469816 () Bool)

(assert (=> b!1469816 (= e!825533 false)))

(declare-fun lt!642853 () SeekEntryResult!11946)

(assert (=> b!1469816 (= lt!642853 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!47809 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687) (select (store (arr!47809 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) (array!99053 (store (arr!47809 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48360 a!2862)) mask!2687))))

(declare-fun res!997254 () Bool)

(assert (=> start!125766 (=> (not res!997254) (not e!825534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125766 (= res!997254 (validMask!0 mask!2687))))

(assert (=> start!125766 e!825534))

(assert (=> start!125766 true))

(declare-fun array_inv!37090 (array!99052) Bool)

(assert (=> start!125766 (array_inv!37090 a!2862)))

(declare-fun b!1469817 () Bool)

(declare-fun res!997252 () Bool)

(assert (=> b!1469817 (=> (not res!997252) (not e!825534))))

(declare-datatypes ((List!34297 0))(
  ( (Nil!34294) (Cons!34293 (h!35657 (_ BitVec 64)) (t!48983 List!34297)) )
))
(declare-fun arrayNoDuplicates!0 (array!99052 (_ BitVec 32) List!34297) Bool)

(assert (=> b!1469817 (= res!997252 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34294))))

(declare-fun b!1469818 () Bool)

(declare-fun res!997257 () Bool)

(assert (=> b!1469818 (=> (not res!997257) (not e!825534))))

(assert (=> b!1469818 (= res!997257 (and (= (size!48360 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48360 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48360 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125766 res!997254) b!1469818))

(assert (= (and b!1469818 res!997257) b!1469810))

(assert (= (and b!1469810 res!997255) b!1469812))

(assert (= (and b!1469812 res!997258) b!1469815))

(assert (= (and b!1469815 res!997259) b!1469817))

(assert (= (and b!1469817 res!997252) b!1469813))

(assert (= (and b!1469813 res!997253) b!1469814))

(assert (= (and b!1469814 res!997251) b!1469811))

(assert (= (and b!1469811 res!997256) b!1469816))

(declare-fun m!1356787 () Bool)

(assert (=> b!1469813 m!1356787))

(declare-fun m!1356789 () Bool)

(assert (=> b!1469813 m!1356789))

(assert (=> b!1469816 m!1356787))

(declare-fun m!1356791 () Bool)

(assert (=> b!1469816 m!1356791))

(assert (=> b!1469816 m!1356791))

(declare-fun m!1356793 () Bool)

(assert (=> b!1469816 m!1356793))

(assert (=> b!1469816 m!1356793))

(assert (=> b!1469816 m!1356791))

(declare-fun m!1356795 () Bool)

(assert (=> b!1469816 m!1356795))

(declare-fun m!1356797 () Bool)

(assert (=> b!1469812 m!1356797))

(assert (=> b!1469812 m!1356797))

(declare-fun m!1356799 () Bool)

(assert (=> b!1469812 m!1356799))

(declare-fun m!1356801 () Bool)

(assert (=> b!1469810 m!1356801))

(assert (=> b!1469810 m!1356801))

(declare-fun m!1356803 () Bool)

(assert (=> b!1469810 m!1356803))

(declare-fun m!1356805 () Bool)

(assert (=> start!125766 m!1356805))

(declare-fun m!1356807 () Bool)

(assert (=> start!125766 m!1356807))

(declare-fun m!1356809 () Bool)

(assert (=> b!1469817 m!1356809))

(assert (=> b!1469814 m!1356797))

(assert (=> b!1469814 m!1356797))

(declare-fun m!1356811 () Bool)

(assert (=> b!1469814 m!1356811))

(assert (=> b!1469814 m!1356811))

(assert (=> b!1469814 m!1356797))

(declare-fun m!1356813 () Bool)

(assert (=> b!1469814 m!1356813))

(declare-fun m!1356815 () Bool)

(assert (=> b!1469815 m!1356815))

(assert (=> b!1469811 m!1356797))

(assert (=> b!1469811 m!1356797))

(declare-fun m!1356817 () Bool)

(assert (=> b!1469811 m!1356817))

(check-sat (not b!1469810) (not b!1469816) (not b!1469812) (not b!1469811) (not b!1469814) (not start!125766) (not b!1469815) (not b!1469817))
(check-sat)
