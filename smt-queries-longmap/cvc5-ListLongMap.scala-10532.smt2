; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124204 () Bool)

(assert start!124204)

(declare-fun b!1437556 () Bool)

(declare-fun e!811047 () Bool)

(declare-fun e!811049 () Bool)

(assert (=> b!1437556 (= e!811047 e!811049)))

(declare-fun res!970340 () Bool)

(assert (=> b!1437556 (=> (not res!970340) (not e!811049))))

(declare-datatypes ((SeekEntryResult!11429 0))(
  ( (MissingZero!11429 (index!48108 (_ BitVec 32))) (Found!11429 (index!48109 (_ BitVec 32))) (Intermediate!11429 (undefined!12241 Bool) (index!48110 (_ BitVec 32)) (x!129844 (_ BitVec 32))) (Undefined!11429) (MissingVacant!11429 (index!48111 (_ BitVec 32))) )
))
(declare-fun lt!632340 () SeekEntryResult!11429)

(declare-datatypes ((array!97769 0))(
  ( (array!97770 (arr!47177 (Array (_ BitVec 32) (_ BitVec 64))) (size!47727 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97769)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97769 (_ BitVec 32)) SeekEntryResult!11429)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1437556 (= res!970340 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47177 a!2862) j!93) mask!2687) (select (arr!47177 a!2862) j!93) a!2862 mask!2687) lt!632340))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1437556 (= lt!632340 (Intermediate!11429 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1437557 () Bool)

(declare-fun res!970341 () Bool)

(assert (=> b!1437557 (=> (not res!970341) (not e!811047))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97769 (_ BitVec 32)) Bool)

(assert (=> b!1437557 (= res!970341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1437558 () Bool)

(assert (=> b!1437558 (= e!811049 false)))

(declare-fun lt!632339 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1437558 (= lt!632339 (toIndex!0 (select (store (arr!47177 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93) mask!2687))))

(declare-fun b!1437559 () Bool)

(declare-fun res!970336 () Bool)

(assert (=> b!1437559 (=> (not res!970336) (not e!811047))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1437559 (= res!970336 (validKeyInArray!0 (select (arr!47177 a!2862) j!93)))))

(declare-fun b!1437560 () Bool)

(declare-fun res!970342 () Bool)

(assert (=> b!1437560 (=> (not res!970342) (not e!811047))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1437560 (= res!970342 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47727 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47727 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47727 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47177 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1437561 () Bool)

(declare-fun res!970339 () Bool)

(assert (=> b!1437561 (=> (not res!970339) (not e!811049))))

(assert (=> b!1437561 (= res!970339 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47177 a!2862) j!93) a!2862 mask!2687) lt!632340))))

(declare-fun b!1437562 () Bool)

(declare-fun res!970334 () Bool)

(assert (=> b!1437562 (=> (not res!970334) (not e!811047))))

(assert (=> b!1437562 (= res!970334 (and (= (size!47727 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47727 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47727 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1437563 () Bool)

(declare-fun res!970335 () Bool)

(assert (=> b!1437563 (=> (not res!970335) (not e!811047))))

(declare-datatypes ((List!33678 0))(
  ( (Nil!33675) (Cons!33674 (h!35015 (_ BitVec 64)) (t!48372 List!33678)) )
))
(declare-fun arrayNoDuplicates!0 (array!97769 (_ BitVec 32) List!33678) Bool)

(assert (=> b!1437563 (= res!970335 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33675))))

(declare-fun b!1437564 () Bool)

(declare-fun res!970337 () Bool)

(assert (=> b!1437564 (=> (not res!970337) (not e!811047))))

(assert (=> b!1437564 (= res!970337 (validKeyInArray!0 (select (arr!47177 a!2862) i!1006)))))

(declare-fun res!970338 () Bool)

(assert (=> start!124204 (=> (not res!970338) (not e!811047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124204 (= res!970338 (validMask!0 mask!2687))))

(assert (=> start!124204 e!811047))

(assert (=> start!124204 true))

(declare-fun array_inv!36205 (array!97769) Bool)

(assert (=> start!124204 (array_inv!36205 a!2862)))

(assert (= (and start!124204 res!970338) b!1437562))

(assert (= (and b!1437562 res!970334) b!1437564))

(assert (= (and b!1437564 res!970337) b!1437559))

(assert (= (and b!1437559 res!970336) b!1437557))

(assert (= (and b!1437557 res!970341) b!1437563))

(assert (= (and b!1437563 res!970335) b!1437560))

(assert (= (and b!1437560 res!970342) b!1437556))

(assert (= (and b!1437556 res!970340) b!1437561))

(assert (= (and b!1437561 res!970339) b!1437558))

(declare-fun m!1326781 () Bool)

(assert (=> b!1437557 m!1326781))

(declare-fun m!1326783 () Bool)

(assert (=> b!1437559 m!1326783))

(assert (=> b!1437559 m!1326783))

(declare-fun m!1326785 () Bool)

(assert (=> b!1437559 m!1326785))

(assert (=> b!1437556 m!1326783))

(assert (=> b!1437556 m!1326783))

(declare-fun m!1326787 () Bool)

(assert (=> b!1437556 m!1326787))

(assert (=> b!1437556 m!1326787))

(assert (=> b!1437556 m!1326783))

(declare-fun m!1326789 () Bool)

(assert (=> b!1437556 m!1326789))

(declare-fun m!1326791 () Bool)

(assert (=> b!1437563 m!1326791))

(declare-fun m!1326793 () Bool)

(assert (=> b!1437560 m!1326793))

(declare-fun m!1326795 () Bool)

(assert (=> b!1437560 m!1326795))

(declare-fun m!1326797 () Bool)

(assert (=> start!124204 m!1326797))

(declare-fun m!1326799 () Bool)

(assert (=> start!124204 m!1326799))

(assert (=> b!1437561 m!1326783))

(assert (=> b!1437561 m!1326783))

(declare-fun m!1326801 () Bool)

(assert (=> b!1437561 m!1326801))

(declare-fun m!1326803 () Bool)

(assert (=> b!1437564 m!1326803))

(assert (=> b!1437564 m!1326803))

(declare-fun m!1326805 () Bool)

(assert (=> b!1437564 m!1326805))

(assert (=> b!1437558 m!1326793))

(declare-fun m!1326807 () Bool)

(assert (=> b!1437558 m!1326807))

(assert (=> b!1437558 m!1326807))

(declare-fun m!1326809 () Bool)

(assert (=> b!1437558 m!1326809))

(push 1)

