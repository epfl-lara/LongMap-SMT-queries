; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125780 () Bool)

(assert start!125780)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!643464 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99114 0))(
  ( (array!99115 (arr!47842 (Array (_ BitVec 32) (_ BitVec 64))) (size!48392 (_ BitVec 32))) )
))
(declare-fun lt!643461 () array!99114)

(declare-fun b!1472060 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!826195 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12082 0))(
  ( (MissingZero!12082 (index!50720 (_ BitVec 32))) (Found!12082 (index!50721 (_ BitVec 32))) (Intermediate!12082 (undefined!12894 Bool) (index!50722 (_ BitVec 32)) (x!132301 (_ BitVec 32))) (Undefined!12082) (MissingVacant!12082 (index!50723 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99114 (_ BitVec 32)) SeekEntryResult!12082)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99114 (_ BitVec 32)) SeekEntryResult!12082)

(assert (=> b!1472060 (= e!826195 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643464 lt!643461 mask!2687) (seekEntryOrOpen!0 lt!643464 lt!643461 mask!2687)))))

(declare-fun b!1472061 () Bool)

(declare-fun res!999772 () Bool)

(declare-fun e!826198 () Bool)

(assert (=> b!1472061 (=> (not res!999772) (not e!826198))))

(declare-fun a!2862 () array!99114)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99114 (_ BitVec 32)) Bool)

(assert (=> b!1472061 (= res!999772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472062 () Bool)

(declare-fun e!826199 () Bool)

(assert (=> b!1472062 (= e!826198 e!826199)))

(declare-fun res!999780 () Bool)

(assert (=> b!1472062 (=> (not res!999780) (not e!826199))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1472062 (= res!999780 (= (select (store (arr!47842 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472062 (= lt!643461 (array!99115 (store (arr!47842 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48392 a!2862)))))

(declare-fun b!1472063 () Bool)

(declare-fun res!999771 () Bool)

(declare-fun e!826194 () Bool)

(assert (=> b!1472063 (=> (not res!999771) (not e!826194))))

(declare-fun lt!643463 () SeekEntryResult!12082)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99114 (_ BitVec 32)) SeekEntryResult!12082)

(assert (=> b!1472063 (= res!999771 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47842 a!2862) j!93) a!2862 mask!2687) lt!643463))))

(declare-fun b!1472064 () Bool)

(declare-fun res!999767 () Bool)

(assert (=> b!1472064 (=> (not res!999767) (not e!826198))))

(assert (=> b!1472064 (= res!999767 (and (= (size!48392 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48392 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48392 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1472065 () Bool)

(declare-fun res!999778 () Bool)

(declare-fun e!826196 () Bool)

(assert (=> b!1472065 (=> (not res!999778) (not e!826196))))

(assert (=> b!1472065 (= res!999778 e!826195)))

(declare-fun c!135660 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1472065 (= c!135660 (bvsle x!665 intermediateAfterX!19))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!826197 () Bool)

(declare-fun b!1472066 () Bool)

(assert (=> b!1472066 (= e!826197 (or (= (select (arr!47842 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47842 a!2862) intermediateBeforeIndex!19) (select (arr!47842 a!2862) j!93))))))

(declare-fun b!1472067 () Bool)

(assert (=> b!1472067 (= e!826196 (not true))))

(assert (=> b!1472067 e!826197))

(declare-fun res!999773 () Bool)

(assert (=> b!1472067 (=> (not res!999773) (not e!826197))))

(assert (=> b!1472067 (= res!999773 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49504 0))(
  ( (Unit!49505) )
))
(declare-fun lt!643462 () Unit!49504)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99114 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49504)

(assert (=> b!1472067 (= lt!643462 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472068 () Bool)

(declare-fun lt!643460 () SeekEntryResult!12082)

(assert (=> b!1472068 (= e!826195 (= lt!643460 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643464 lt!643461 mask!2687)))))

(declare-fun b!1472069 () Bool)

(assert (=> b!1472069 (= e!826194 e!826196)))

(declare-fun res!999775 () Bool)

(assert (=> b!1472069 (=> (not res!999775) (not e!826196))))

(assert (=> b!1472069 (= res!999775 (= lt!643460 (Intermediate!12082 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472069 (= lt!643460 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643464 mask!2687) lt!643464 lt!643461 mask!2687))))

(assert (=> b!1472069 (= lt!643464 (select (store (arr!47842 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472070 () Bool)

(declare-fun res!999781 () Bool)

(assert (=> b!1472070 (=> (not res!999781) (not e!826198))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1472070 (= res!999781 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48392 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48392 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48392 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!999776 () Bool)

(assert (=> start!125780 (=> (not res!999776) (not e!826198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125780 (= res!999776 (validMask!0 mask!2687))))

(assert (=> start!125780 e!826198))

(assert (=> start!125780 true))

(declare-fun array_inv!36870 (array!99114) Bool)

(assert (=> start!125780 (array_inv!36870 a!2862)))

(declare-fun b!1472071 () Bool)

(declare-fun res!999779 () Bool)

(assert (=> b!1472071 (=> (not res!999779) (not e!826198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472071 (= res!999779 (validKeyInArray!0 (select (arr!47842 a!2862) i!1006)))))

(declare-fun b!1472072 () Bool)

(declare-fun res!999768 () Bool)

(assert (=> b!1472072 (=> (not res!999768) (not e!826197))))

(assert (=> b!1472072 (= res!999768 (= (seekEntryOrOpen!0 (select (arr!47842 a!2862) j!93) a!2862 mask!2687) (Found!12082 j!93)))))

(declare-fun b!1472073 () Bool)

(declare-fun res!999777 () Bool)

(assert (=> b!1472073 (=> (not res!999777) (not e!826196))))

(assert (=> b!1472073 (= res!999777 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1472074 () Bool)

(declare-fun res!999769 () Bool)

(assert (=> b!1472074 (=> (not res!999769) (not e!826198))))

(assert (=> b!1472074 (= res!999769 (validKeyInArray!0 (select (arr!47842 a!2862) j!93)))))

(declare-fun b!1472075 () Bool)

(assert (=> b!1472075 (= e!826199 e!826194)))

(declare-fun res!999770 () Bool)

(assert (=> b!1472075 (=> (not res!999770) (not e!826194))))

(assert (=> b!1472075 (= res!999770 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47842 a!2862) j!93) mask!2687) (select (arr!47842 a!2862) j!93) a!2862 mask!2687) lt!643463))))

(assert (=> b!1472075 (= lt!643463 (Intermediate!12082 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1472076 () Bool)

(declare-fun res!999774 () Bool)

(assert (=> b!1472076 (=> (not res!999774) (not e!826198))))

(declare-datatypes ((List!34343 0))(
  ( (Nil!34340) (Cons!34339 (h!35695 (_ BitVec 64)) (t!49037 List!34343)) )
))
(declare-fun arrayNoDuplicates!0 (array!99114 (_ BitVec 32) List!34343) Bool)

(assert (=> b!1472076 (= res!999774 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34340))))

(assert (= (and start!125780 res!999776) b!1472064))

(assert (= (and b!1472064 res!999767) b!1472071))

(assert (= (and b!1472071 res!999779) b!1472074))

(assert (= (and b!1472074 res!999769) b!1472061))

(assert (= (and b!1472061 res!999772) b!1472076))

(assert (= (and b!1472076 res!999774) b!1472070))

(assert (= (and b!1472070 res!999781) b!1472062))

(assert (= (and b!1472062 res!999780) b!1472075))

(assert (= (and b!1472075 res!999770) b!1472063))

(assert (= (and b!1472063 res!999771) b!1472069))

(assert (= (and b!1472069 res!999775) b!1472065))

(assert (= (and b!1472065 c!135660) b!1472068))

(assert (= (and b!1472065 (not c!135660)) b!1472060))

(assert (= (and b!1472065 res!999778) b!1472073))

(assert (= (and b!1472073 res!999777) b!1472067))

(assert (= (and b!1472067 res!999773) b!1472072))

(assert (= (and b!1472072 res!999768) b!1472066))

(declare-fun m!1358811 () Bool)

(assert (=> b!1472066 m!1358811))

(declare-fun m!1358813 () Bool)

(assert (=> b!1472066 m!1358813))

(assert (=> b!1472075 m!1358813))

(assert (=> b!1472075 m!1358813))

(declare-fun m!1358815 () Bool)

(assert (=> b!1472075 m!1358815))

(assert (=> b!1472075 m!1358815))

(assert (=> b!1472075 m!1358813))

(declare-fun m!1358817 () Bool)

(assert (=> b!1472075 m!1358817))

(declare-fun m!1358819 () Bool)

(assert (=> b!1472061 m!1358819))

(assert (=> b!1472063 m!1358813))

(assert (=> b!1472063 m!1358813))

(declare-fun m!1358821 () Bool)

(assert (=> b!1472063 m!1358821))

(declare-fun m!1358823 () Bool)

(assert (=> b!1472069 m!1358823))

(assert (=> b!1472069 m!1358823))

(declare-fun m!1358825 () Bool)

(assert (=> b!1472069 m!1358825))

(declare-fun m!1358827 () Bool)

(assert (=> b!1472069 m!1358827))

(declare-fun m!1358829 () Bool)

(assert (=> b!1472069 m!1358829))

(assert (=> b!1472074 m!1358813))

(assert (=> b!1472074 m!1358813))

(declare-fun m!1358831 () Bool)

(assert (=> b!1472074 m!1358831))

(declare-fun m!1358833 () Bool)

(assert (=> start!125780 m!1358833))

(declare-fun m!1358835 () Bool)

(assert (=> start!125780 m!1358835))

(assert (=> b!1472062 m!1358827))

(declare-fun m!1358837 () Bool)

(assert (=> b!1472062 m!1358837))

(declare-fun m!1358839 () Bool)

(assert (=> b!1472076 m!1358839))

(declare-fun m!1358841 () Bool)

(assert (=> b!1472060 m!1358841))

(declare-fun m!1358843 () Bool)

(assert (=> b!1472060 m!1358843))

(assert (=> b!1472072 m!1358813))

(assert (=> b!1472072 m!1358813))

(declare-fun m!1358845 () Bool)

(assert (=> b!1472072 m!1358845))

(declare-fun m!1358847 () Bool)

(assert (=> b!1472068 m!1358847))

(declare-fun m!1358849 () Bool)

(assert (=> b!1472071 m!1358849))

(assert (=> b!1472071 m!1358849))

(declare-fun m!1358851 () Bool)

(assert (=> b!1472071 m!1358851))

(declare-fun m!1358853 () Bool)

(assert (=> b!1472067 m!1358853))

(declare-fun m!1358855 () Bool)

(assert (=> b!1472067 m!1358855))

(push 1)

