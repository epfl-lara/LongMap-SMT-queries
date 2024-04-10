; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125782 () Bool)

(assert start!125782)

(declare-datatypes ((array!99116 0))(
  ( (array!99117 (arr!47843 (Array (_ BitVec 32) (_ BitVec 64))) (size!48393 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99116)

(declare-fun b!1472111 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun e!826215 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1472111 (= e!826215 (or (= (select (arr!47843 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47843 a!2862) intermediateBeforeIndex!19) (select (arr!47843 a!2862) j!93))))))

(declare-fun res!999825 () Bool)

(declare-fun e!826216 () Bool)

(assert (=> start!125782 (=> (not res!999825) (not e!826216))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125782 (= res!999825 (validMask!0 mask!2687))))

(assert (=> start!125782 e!826216))

(assert (=> start!125782 true))

(declare-fun array_inv!36871 (array!99116) Bool)

(assert (=> start!125782 (array_inv!36871 a!2862)))

(declare-fun b!1472112 () Bool)

(declare-fun e!826218 () Bool)

(assert (=> b!1472112 (= e!826218 (not true))))

(assert (=> b!1472112 e!826215))

(declare-fun res!999822 () Bool)

(assert (=> b!1472112 (=> (not res!999822) (not e!826215))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99116 (_ BitVec 32)) Bool)

(assert (=> b!1472112 (= res!999822 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49506 0))(
  ( (Unit!49507) )
))
(declare-fun lt!643477 () Unit!49506)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49506)

(assert (=> b!1472112 (= lt!643477 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472113 () Bool)

(declare-fun e!826219 () Bool)

(assert (=> b!1472113 (= e!826219 e!826218)))

(declare-fun res!999823 () Bool)

(assert (=> b!1472113 (=> (not res!999823) (not e!826218))))

(declare-datatypes ((SeekEntryResult!12083 0))(
  ( (MissingZero!12083 (index!50724 (_ BitVec 32))) (Found!12083 (index!50725 (_ BitVec 32))) (Intermediate!12083 (undefined!12895 Bool) (index!50726 (_ BitVec 32)) (x!132310 (_ BitVec 32))) (Undefined!12083) (MissingVacant!12083 (index!50727 (_ BitVec 32))) )
))
(declare-fun lt!643479 () SeekEntryResult!12083)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1472113 (= res!999823 (= lt!643479 (Intermediate!12083 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!643476 () (_ BitVec 64))

(declare-fun lt!643478 () array!99116)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99116 (_ BitVec 32)) SeekEntryResult!12083)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472113 (= lt!643479 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643476 mask!2687) lt!643476 lt!643478 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1472113 (= lt!643476 (select (store (arr!47843 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472114 () Bool)

(declare-fun res!999813 () Bool)

(assert (=> b!1472114 (=> (not res!999813) (not e!826216))))

(assert (=> b!1472114 (= res!999813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1472115 () Bool)

(declare-fun e!826220 () Bool)

(assert (=> b!1472115 (= e!826216 e!826220)))

(declare-fun res!999814 () Bool)

(assert (=> b!1472115 (=> (not res!999814) (not e!826220))))

(assert (=> b!1472115 (= res!999814 (= (select (store (arr!47843 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472115 (= lt!643478 (array!99117 (store (arr!47843 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48393 a!2862)))))

(declare-fun b!1472116 () Bool)

(declare-fun res!999816 () Bool)

(assert (=> b!1472116 (=> (not res!999816) (not e!826216))))

(assert (=> b!1472116 (= res!999816 (and (= (size!48393 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48393 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48393 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1472117 () Bool)

(declare-fun res!999820 () Bool)

(assert (=> b!1472117 (=> (not res!999820) (not e!826215))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99116 (_ BitVec 32)) SeekEntryResult!12083)

(assert (=> b!1472117 (= res!999820 (= (seekEntryOrOpen!0 (select (arr!47843 a!2862) j!93) a!2862 mask!2687) (Found!12083 j!93)))))

(declare-fun b!1472118 () Bool)

(declare-fun res!999826 () Bool)

(assert (=> b!1472118 (=> (not res!999826) (not e!826216))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472118 (= res!999826 (validKeyInArray!0 (select (arr!47843 a!2862) j!93)))))

(declare-fun b!1472119 () Bool)

(declare-fun res!999812 () Bool)

(assert (=> b!1472119 (=> (not res!999812) (not e!826216))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1472119 (= res!999812 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48393 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48393 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48393 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1472120 () Bool)

(declare-fun res!999817 () Bool)

(assert (=> b!1472120 (=> (not res!999817) (not e!826216))))

(assert (=> b!1472120 (= res!999817 (validKeyInArray!0 (select (arr!47843 a!2862) i!1006)))))

(declare-fun e!826217 () Bool)

(declare-fun b!1472121 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99116 (_ BitVec 32)) SeekEntryResult!12083)

(assert (=> b!1472121 (= e!826217 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643476 lt!643478 mask!2687) (seekEntryOrOpen!0 lt!643476 lt!643478 mask!2687)))))

(declare-fun b!1472122 () Bool)

(assert (=> b!1472122 (= e!826217 (= lt!643479 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643476 lt!643478 mask!2687)))))

(declare-fun b!1472123 () Bool)

(declare-fun res!999818 () Bool)

(assert (=> b!1472123 (=> (not res!999818) (not e!826218))))

(assert (=> b!1472123 (= res!999818 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1472124 () Bool)

(declare-fun res!999819 () Bool)

(assert (=> b!1472124 (=> (not res!999819) (not e!826218))))

(assert (=> b!1472124 (= res!999819 e!826217)))

(declare-fun c!135663 () Bool)

(assert (=> b!1472124 (= c!135663 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1472125 () Bool)

(declare-fun res!999821 () Bool)

(assert (=> b!1472125 (=> (not res!999821) (not e!826219))))

(declare-fun lt!643475 () SeekEntryResult!12083)

(assert (=> b!1472125 (= res!999821 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47843 a!2862) j!93) a!2862 mask!2687) lt!643475))))

(declare-fun b!1472126 () Bool)

(declare-fun res!999824 () Bool)

(assert (=> b!1472126 (=> (not res!999824) (not e!826216))))

(declare-datatypes ((List!34344 0))(
  ( (Nil!34341) (Cons!34340 (h!35696 (_ BitVec 64)) (t!49038 List!34344)) )
))
(declare-fun arrayNoDuplicates!0 (array!99116 (_ BitVec 32) List!34344) Bool)

(assert (=> b!1472126 (= res!999824 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34341))))

(declare-fun b!1472127 () Bool)

(assert (=> b!1472127 (= e!826220 e!826219)))

(declare-fun res!999815 () Bool)

(assert (=> b!1472127 (=> (not res!999815) (not e!826219))))

(assert (=> b!1472127 (= res!999815 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47843 a!2862) j!93) mask!2687) (select (arr!47843 a!2862) j!93) a!2862 mask!2687) lt!643475))))

(assert (=> b!1472127 (= lt!643475 (Intermediate!12083 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!125782 res!999825) b!1472116))

(assert (= (and b!1472116 res!999816) b!1472120))

(assert (= (and b!1472120 res!999817) b!1472118))

(assert (= (and b!1472118 res!999826) b!1472114))

(assert (= (and b!1472114 res!999813) b!1472126))

(assert (= (and b!1472126 res!999824) b!1472119))

(assert (= (and b!1472119 res!999812) b!1472115))

(assert (= (and b!1472115 res!999814) b!1472127))

(assert (= (and b!1472127 res!999815) b!1472125))

(assert (= (and b!1472125 res!999821) b!1472113))

(assert (= (and b!1472113 res!999823) b!1472124))

(assert (= (and b!1472124 c!135663) b!1472122))

(assert (= (and b!1472124 (not c!135663)) b!1472121))

(assert (= (and b!1472124 res!999819) b!1472123))

(assert (= (and b!1472123 res!999818) b!1472112))

(assert (= (and b!1472112 res!999822) b!1472117))

(assert (= (and b!1472117 res!999820) b!1472111))

(declare-fun m!1358857 () Bool)

(assert (=> b!1472121 m!1358857))

(declare-fun m!1358859 () Bool)

(assert (=> b!1472121 m!1358859))

(declare-fun m!1358861 () Bool)

(assert (=> b!1472118 m!1358861))

(assert (=> b!1472118 m!1358861))

(declare-fun m!1358863 () Bool)

(assert (=> b!1472118 m!1358863))

(declare-fun m!1358865 () Bool)

(assert (=> b!1472126 m!1358865))

(declare-fun m!1358867 () Bool)

(assert (=> b!1472112 m!1358867))

(declare-fun m!1358869 () Bool)

(assert (=> b!1472112 m!1358869))

(declare-fun m!1358871 () Bool)

(assert (=> b!1472115 m!1358871))

(declare-fun m!1358873 () Bool)

(assert (=> b!1472115 m!1358873))

(declare-fun m!1358875 () Bool)

(assert (=> b!1472114 m!1358875))

(declare-fun m!1358877 () Bool)

(assert (=> start!125782 m!1358877))

(declare-fun m!1358879 () Bool)

(assert (=> start!125782 m!1358879))

(assert (=> b!1472125 m!1358861))

(assert (=> b!1472125 m!1358861))

(declare-fun m!1358881 () Bool)

(assert (=> b!1472125 m!1358881))

(declare-fun m!1358883 () Bool)

(assert (=> b!1472113 m!1358883))

(assert (=> b!1472113 m!1358883))

(declare-fun m!1358885 () Bool)

(assert (=> b!1472113 m!1358885))

(assert (=> b!1472113 m!1358871))

(declare-fun m!1358887 () Bool)

(assert (=> b!1472113 m!1358887))

(declare-fun m!1358889 () Bool)

(assert (=> b!1472111 m!1358889))

(assert (=> b!1472111 m!1358861))

(assert (=> b!1472117 m!1358861))

(assert (=> b!1472117 m!1358861))

(declare-fun m!1358891 () Bool)

(assert (=> b!1472117 m!1358891))

(declare-fun m!1358893 () Bool)

(assert (=> b!1472122 m!1358893))

(declare-fun m!1358895 () Bool)

(assert (=> b!1472120 m!1358895))

(assert (=> b!1472120 m!1358895))

(declare-fun m!1358897 () Bool)

(assert (=> b!1472120 m!1358897))

(assert (=> b!1472127 m!1358861))

(assert (=> b!1472127 m!1358861))

(declare-fun m!1358899 () Bool)

(assert (=> b!1472127 m!1358899))

(assert (=> b!1472127 m!1358899))

(assert (=> b!1472127 m!1358861))

(declare-fun m!1358901 () Bool)

(assert (=> b!1472127 m!1358901))

(push 1)

