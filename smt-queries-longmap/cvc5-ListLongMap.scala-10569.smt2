; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124552 () Bool)

(assert start!124552)

(declare-fun lt!633275 () (_ BitVec 64))

(declare-fun b!1441537 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!98000 0))(
  ( (array!98001 (arr!47288 (Array (_ BitVec 32) (_ BitVec 64))) (size!47838 (_ BitVec 32))) )
))
(declare-fun lt!633276 () array!98000)

(declare-datatypes ((SeekEntryResult!11540 0))(
  ( (MissingZero!11540 (index!48552 (_ BitVec 32))) (Found!11540 (index!48553 (_ BitVec 32))) (Intermediate!11540 (undefined!12352 Bool) (index!48554 (_ BitVec 32)) (x!130269 (_ BitVec 32))) (Undefined!11540) (MissingVacant!11540 (index!48555 (_ BitVec 32))) )
))
(declare-fun lt!633279 () SeekEntryResult!11540)

(declare-fun e!812613 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98000 (_ BitVec 32)) SeekEntryResult!11540)

(assert (=> b!1441537 (= e!812613 (= lt!633279 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633275 lt!633276 mask!2687)))))

(declare-fun b!1441538 () Bool)

(declare-fun res!973882 () Bool)

(declare-fun e!812615 () Bool)

(assert (=> b!1441538 (=> (not res!973882) (not e!812615))))

(assert (=> b!1441538 (= res!973882 e!812613)))

(declare-fun c!133344 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1441538 (= c!133344 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441539 () Bool)

(declare-fun res!973877 () Bool)

(assert (=> b!1441539 (=> (not res!973877) (not e!812615))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1441539 (= res!973877 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1441540 () Bool)

(declare-fun res!973874 () Bool)

(declare-fun e!812614 () Bool)

(assert (=> b!1441540 (=> (not res!973874) (not e!812614))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun a!2862 () array!98000)

(assert (=> b!1441540 (= res!973874 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47838 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47838 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47838 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1441541 () Bool)

(declare-fun res!973881 () Bool)

(assert (=> b!1441541 (=> (not res!973881) (not e!812614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441541 (= res!973881 (validKeyInArray!0 (select (arr!47288 a!2862) i!1006)))))

(declare-fun b!1441542 () Bool)

(declare-fun res!973870 () Bool)

(assert (=> b!1441542 (=> (not res!973870) (not e!812614))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98000 (_ BitVec 32)) Bool)

(assert (=> b!1441542 (= res!973870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1441543 () Bool)

(declare-fun res!973880 () Bool)

(assert (=> b!1441543 (=> (not res!973880) (not e!812614))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1441543 (= res!973880 (validKeyInArray!0 (select (arr!47288 a!2862) j!93)))))

(declare-fun b!1441544 () Bool)

(assert (=> b!1441544 (= e!812615 (not true))))

(assert (=> b!1441544 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48576 0))(
  ( (Unit!48577) )
))
(declare-fun lt!633278 () Unit!48576)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98000 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48576)

(assert (=> b!1441544 (= lt!633278 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1441545 () Bool)

(declare-fun res!973876 () Bool)

(declare-fun e!812618 () Bool)

(assert (=> b!1441545 (=> (not res!973876) (not e!812618))))

(declare-fun lt!633277 () SeekEntryResult!11540)

(assert (=> b!1441545 (= res!973876 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47288 a!2862) j!93) a!2862 mask!2687) lt!633277))))

(declare-fun b!1441546 () Bool)

(assert (=> b!1441546 (= e!812618 e!812615)))

(declare-fun res!973872 () Bool)

(assert (=> b!1441546 (=> (not res!973872) (not e!812615))))

(assert (=> b!1441546 (= res!973872 (= lt!633279 (Intermediate!11540 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441546 (= lt!633279 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633275 mask!2687) lt!633275 lt!633276 mask!2687))))

(assert (=> b!1441546 (= lt!633275 (select (store (arr!47288 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441547 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98000 (_ BitVec 32)) SeekEntryResult!11540)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98000 (_ BitVec 32)) SeekEntryResult!11540)

(assert (=> b!1441547 (= e!812613 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633275 lt!633276 mask!2687) (seekEntryOrOpen!0 lt!633275 lt!633276 mask!2687)))))

(declare-fun b!1441548 () Bool)

(declare-fun e!812617 () Bool)

(assert (=> b!1441548 (= e!812614 e!812617)))

(declare-fun res!973878 () Bool)

(assert (=> b!1441548 (=> (not res!973878) (not e!812617))))

(assert (=> b!1441548 (= res!973878 (= (select (store (arr!47288 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1441548 (= lt!633276 (array!98001 (store (arr!47288 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47838 a!2862)))))

(declare-fun b!1441549 () Bool)

(assert (=> b!1441549 (= e!812617 e!812618)))

(declare-fun res!973873 () Bool)

(assert (=> b!1441549 (=> (not res!973873) (not e!812618))))

(assert (=> b!1441549 (= res!973873 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47288 a!2862) j!93) mask!2687) (select (arr!47288 a!2862) j!93) a!2862 mask!2687) lt!633277))))

(assert (=> b!1441549 (= lt!633277 (Intermediate!11540 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441550 () Bool)

(declare-fun res!973871 () Bool)

(assert (=> b!1441550 (=> (not res!973871) (not e!812614))))

(declare-datatypes ((List!33789 0))(
  ( (Nil!33786) (Cons!33785 (h!35135 (_ BitVec 64)) (t!48483 List!33789)) )
))
(declare-fun arrayNoDuplicates!0 (array!98000 (_ BitVec 32) List!33789) Bool)

(assert (=> b!1441550 (= res!973871 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33786))))

(declare-fun res!973879 () Bool)

(assert (=> start!124552 (=> (not res!973879) (not e!812614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124552 (= res!973879 (validMask!0 mask!2687))))

(assert (=> start!124552 e!812614))

(assert (=> start!124552 true))

(declare-fun array_inv!36316 (array!98000) Bool)

(assert (=> start!124552 (array_inv!36316 a!2862)))

(declare-fun b!1441551 () Bool)

(declare-fun res!973875 () Bool)

(assert (=> b!1441551 (=> (not res!973875) (not e!812614))))

(assert (=> b!1441551 (= res!973875 (and (= (size!47838 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47838 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47838 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124552 res!973879) b!1441551))

(assert (= (and b!1441551 res!973875) b!1441541))

(assert (= (and b!1441541 res!973881) b!1441543))

(assert (= (and b!1441543 res!973880) b!1441542))

(assert (= (and b!1441542 res!973870) b!1441550))

(assert (= (and b!1441550 res!973871) b!1441540))

(assert (= (and b!1441540 res!973874) b!1441548))

(assert (= (and b!1441548 res!973878) b!1441549))

(assert (= (and b!1441549 res!973873) b!1441545))

(assert (= (and b!1441545 res!973876) b!1441546))

(assert (= (and b!1441546 res!973872) b!1441538))

(assert (= (and b!1441538 c!133344) b!1441537))

(assert (= (and b!1441538 (not c!133344)) b!1441547))

(assert (= (and b!1441538 res!973882) b!1441539))

(assert (= (and b!1441539 res!973877) b!1441544))

(declare-fun m!1330753 () Bool)

(assert (=> b!1441546 m!1330753))

(assert (=> b!1441546 m!1330753))

(declare-fun m!1330755 () Bool)

(assert (=> b!1441546 m!1330755))

(declare-fun m!1330757 () Bool)

(assert (=> b!1441546 m!1330757))

(declare-fun m!1330759 () Bool)

(assert (=> b!1441546 m!1330759))

(declare-fun m!1330761 () Bool)

(assert (=> b!1441547 m!1330761))

(declare-fun m!1330763 () Bool)

(assert (=> b!1441547 m!1330763))

(declare-fun m!1330765 () Bool)

(assert (=> start!124552 m!1330765))

(declare-fun m!1330767 () Bool)

(assert (=> start!124552 m!1330767))

(declare-fun m!1330769 () Bool)

(assert (=> b!1441550 m!1330769))

(declare-fun m!1330771 () Bool)

(assert (=> b!1441537 m!1330771))

(declare-fun m!1330773 () Bool)

(assert (=> b!1441544 m!1330773))

(declare-fun m!1330775 () Bool)

(assert (=> b!1441544 m!1330775))

(assert (=> b!1441548 m!1330757))

(declare-fun m!1330777 () Bool)

(assert (=> b!1441548 m!1330777))

(declare-fun m!1330779 () Bool)

(assert (=> b!1441545 m!1330779))

(assert (=> b!1441545 m!1330779))

(declare-fun m!1330781 () Bool)

(assert (=> b!1441545 m!1330781))

(declare-fun m!1330783 () Bool)

(assert (=> b!1441542 m!1330783))

(assert (=> b!1441543 m!1330779))

(assert (=> b!1441543 m!1330779))

(declare-fun m!1330785 () Bool)

(assert (=> b!1441543 m!1330785))

(declare-fun m!1330787 () Bool)

(assert (=> b!1441541 m!1330787))

(assert (=> b!1441541 m!1330787))

(declare-fun m!1330789 () Bool)

(assert (=> b!1441541 m!1330789))

(assert (=> b!1441549 m!1330779))

(assert (=> b!1441549 m!1330779))

(declare-fun m!1330791 () Bool)

(assert (=> b!1441549 m!1330791))

(assert (=> b!1441549 m!1330791))

(assert (=> b!1441549 m!1330779))

(declare-fun m!1330793 () Bool)

(assert (=> b!1441549 m!1330793))

(push 1)

