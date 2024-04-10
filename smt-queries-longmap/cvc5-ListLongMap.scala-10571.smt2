; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124564 () Bool)

(assert start!124564)

(declare-fun res!974111 () Bool)

(declare-fun e!812724 () Bool)

(assert (=> start!124564 (=> (not res!974111) (not e!812724))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124564 (= res!974111 (validMask!0 mask!2687))))

(assert (=> start!124564 e!812724))

(assert (=> start!124564 true))

(declare-datatypes ((array!98012 0))(
  ( (array!98013 (arr!47294 (Array (_ BitVec 32) (_ BitVec 64))) (size!47844 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98012)

(declare-fun array_inv!36322 (array!98012) Bool)

(assert (=> start!124564 (array_inv!36322 a!2862)))

(declare-fun b!1441807 () Bool)

(declare-fun e!812721 () Bool)

(assert (=> b!1441807 (= e!812724 e!812721)))

(declare-fun res!974108 () Bool)

(assert (=> b!1441807 (=> (not res!974108) (not e!812721))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1441807 (= res!974108 (= (select (store (arr!47294 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!633368 () array!98012)

(assert (=> b!1441807 (= lt!633368 (array!98013 (store (arr!47294 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47844 a!2862)))))

(declare-fun b!1441808 () Bool)

(declare-fun res!974114 () Bool)

(declare-fun e!812723 () Bool)

(assert (=> b!1441808 (=> (not res!974114) (not e!812723))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11546 0))(
  ( (MissingZero!11546 (index!48576 (_ BitVec 32))) (Found!11546 (index!48577 (_ BitVec 32))) (Intermediate!11546 (undefined!12358 Bool) (index!48578 (_ BitVec 32)) (x!130291 (_ BitVec 32))) (Undefined!11546) (MissingVacant!11546 (index!48579 (_ BitVec 32))) )
))
(declare-fun lt!633366 () SeekEntryResult!11546)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98012 (_ BitVec 32)) SeekEntryResult!11546)

(assert (=> b!1441808 (= res!974114 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47294 a!2862) j!93) a!2862 mask!2687) lt!633366))))

(declare-fun b!1441809 () Bool)

(declare-fun lt!633367 () SeekEntryResult!11546)

(declare-fun lt!633365 () (_ BitVec 64))

(declare-fun e!812722 () Bool)

(assert (=> b!1441809 (= e!812722 (= lt!633367 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633365 lt!633368 mask!2687)))))

(declare-fun b!1441810 () Bool)

(declare-fun res!974109 () Bool)

(assert (=> b!1441810 (=> (not res!974109) (not e!812724))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1441810 (= res!974109 (validKeyInArray!0 (select (arr!47294 a!2862) i!1006)))))

(declare-fun b!1441811 () Bool)

(assert (=> b!1441811 (= e!812721 e!812723)))

(declare-fun res!974105 () Bool)

(assert (=> b!1441811 (=> (not res!974105) (not e!812723))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1441811 (= res!974105 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47294 a!2862) j!93) mask!2687) (select (arr!47294 a!2862) j!93) a!2862 mask!2687) lt!633366))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1441811 (= lt!633366 (Intermediate!11546 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1441812 () Bool)

(declare-fun e!812726 () Bool)

(assert (=> b!1441812 (= e!812723 e!812726)))

(declare-fun res!974113 () Bool)

(assert (=> b!1441812 (=> (not res!974113) (not e!812726))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1441812 (= res!974113 (= lt!633367 (Intermediate!11546 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1441812 (= lt!633367 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633365 mask!2687) lt!633365 lt!633368 mask!2687))))

(assert (=> b!1441812 (= lt!633365 (select (store (arr!47294 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1441813 () Bool)

(declare-fun res!974110 () Bool)

(assert (=> b!1441813 (=> (not res!974110) (not e!812726))))

(assert (=> b!1441813 (= res!974110 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1441814 () Bool)

(declare-fun res!974104 () Bool)

(assert (=> b!1441814 (=> (not res!974104) (not e!812724))))

(assert (=> b!1441814 (= res!974104 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47844 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47844 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47844 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1441815 () Bool)

(declare-fun res!974107 () Bool)

(assert (=> b!1441815 (=> (not res!974107) (not e!812724))))

(assert (=> b!1441815 (= res!974107 (and (= (size!47844 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47844 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47844 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1441816 () Bool)

(declare-fun res!974106 () Bool)

(assert (=> b!1441816 (=> (not res!974106) (not e!812724))))

(assert (=> b!1441816 (= res!974106 (validKeyInArray!0 (select (arr!47294 a!2862) j!93)))))

(declare-fun b!1441817 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98012 (_ BitVec 32)) SeekEntryResult!11546)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98012 (_ BitVec 32)) SeekEntryResult!11546)

(assert (=> b!1441817 (= e!812722 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633365 lt!633368 mask!2687) (seekEntryOrOpen!0 lt!633365 lt!633368 mask!2687)))))

(declare-fun b!1441818 () Bool)

(declare-fun res!974112 () Bool)

(assert (=> b!1441818 (=> (not res!974112) (not e!812726))))

(assert (=> b!1441818 (= res!974112 e!812722)))

(declare-fun c!133362 () Bool)

(assert (=> b!1441818 (= c!133362 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1441819 () Bool)

(assert (=> b!1441819 (= e!812726 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98012 (_ BitVec 32)) Bool)

(assert (=> b!1441819 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48588 0))(
  ( (Unit!48589) )
))
(declare-fun lt!633369 () Unit!48588)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98012 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48588)

(assert (=> b!1441819 (= lt!633369 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1441820 () Bool)

(declare-fun res!974116 () Bool)

(assert (=> b!1441820 (=> (not res!974116) (not e!812724))))

(declare-datatypes ((List!33795 0))(
  ( (Nil!33792) (Cons!33791 (h!35141 (_ BitVec 64)) (t!48489 List!33795)) )
))
(declare-fun arrayNoDuplicates!0 (array!98012 (_ BitVec 32) List!33795) Bool)

(assert (=> b!1441820 (= res!974116 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33792))))

(declare-fun b!1441821 () Bool)

(declare-fun res!974115 () Bool)

(assert (=> b!1441821 (=> (not res!974115) (not e!812724))))

(assert (=> b!1441821 (= res!974115 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!124564 res!974111) b!1441815))

(assert (= (and b!1441815 res!974107) b!1441810))

(assert (= (and b!1441810 res!974109) b!1441816))

(assert (= (and b!1441816 res!974106) b!1441821))

(assert (= (and b!1441821 res!974115) b!1441820))

(assert (= (and b!1441820 res!974116) b!1441814))

(assert (= (and b!1441814 res!974104) b!1441807))

(assert (= (and b!1441807 res!974108) b!1441811))

(assert (= (and b!1441811 res!974105) b!1441808))

(assert (= (and b!1441808 res!974114) b!1441812))

(assert (= (and b!1441812 res!974113) b!1441818))

(assert (= (and b!1441818 c!133362) b!1441809))

(assert (= (and b!1441818 (not c!133362)) b!1441817))

(assert (= (and b!1441818 res!974112) b!1441813))

(assert (= (and b!1441813 res!974110) b!1441819))

(declare-fun m!1331005 () Bool)

(assert (=> b!1441807 m!1331005))

(declare-fun m!1331007 () Bool)

(assert (=> b!1441807 m!1331007))

(declare-fun m!1331009 () Bool)

(assert (=> b!1441811 m!1331009))

(assert (=> b!1441811 m!1331009))

(declare-fun m!1331011 () Bool)

(assert (=> b!1441811 m!1331011))

(assert (=> b!1441811 m!1331011))

(assert (=> b!1441811 m!1331009))

(declare-fun m!1331013 () Bool)

(assert (=> b!1441811 m!1331013))

(declare-fun m!1331015 () Bool)

(assert (=> b!1441819 m!1331015))

(declare-fun m!1331017 () Bool)

(assert (=> b!1441819 m!1331017))

(assert (=> b!1441808 m!1331009))

(assert (=> b!1441808 m!1331009))

(declare-fun m!1331019 () Bool)

(assert (=> b!1441808 m!1331019))

(declare-fun m!1331021 () Bool)

(assert (=> b!1441810 m!1331021))

(assert (=> b!1441810 m!1331021))

(declare-fun m!1331023 () Bool)

(assert (=> b!1441810 m!1331023))

(declare-fun m!1331025 () Bool)

(assert (=> b!1441812 m!1331025))

(assert (=> b!1441812 m!1331025))

(declare-fun m!1331027 () Bool)

(assert (=> b!1441812 m!1331027))

(assert (=> b!1441812 m!1331005))

(declare-fun m!1331029 () Bool)

(assert (=> b!1441812 m!1331029))

(declare-fun m!1331031 () Bool)

(assert (=> b!1441809 m!1331031))

(assert (=> b!1441816 m!1331009))

(assert (=> b!1441816 m!1331009))

(declare-fun m!1331033 () Bool)

(assert (=> b!1441816 m!1331033))

(declare-fun m!1331035 () Bool)

(assert (=> b!1441817 m!1331035))

(declare-fun m!1331037 () Bool)

(assert (=> b!1441817 m!1331037))

(declare-fun m!1331039 () Bool)

(assert (=> b!1441821 m!1331039))

(declare-fun m!1331041 () Bool)

(assert (=> b!1441820 m!1331041))

(declare-fun m!1331043 () Bool)

(assert (=> start!124564 m!1331043))

(declare-fun m!1331045 () Bool)

(assert (=> start!124564 m!1331045))

(push 1)

