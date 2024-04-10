; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124604 () Bool)

(assert start!124604)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!813128 () Bool)

(declare-datatypes ((array!98052 0))(
  ( (array!98053 (arr!47314 (Array (_ BitVec 32) (_ BitVec 64))) (size!47864 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98052)

(declare-fun b!1442795 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1442795 (= e!813128 (or (= (select (arr!47314 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47314 a!2862) intermediateBeforeIndex!19) (select (arr!47314 a!2862) j!93))))))

(declare-fun b!1442796 () Bool)

(declare-fun res!974972 () Bool)

(declare-fun e!813131 () Bool)

(assert (=> b!1442796 (=> (not res!974972) (not e!813131))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1442796 (= res!974972 (validKeyInArray!0 (select (arr!47314 a!2862) i!1006)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1442797 () Bool)

(declare-fun e!813126 () Bool)

(declare-fun lt!633665 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!633668 () array!98052)

(declare-datatypes ((SeekEntryResult!11566 0))(
  ( (MissingZero!11566 (index!48656 (_ BitVec 32))) (Found!11566 (index!48657 (_ BitVec 32))) (Intermediate!11566 (undefined!12378 Bool) (index!48658 (_ BitVec 32)) (x!130359 (_ BitVec 32))) (Undefined!11566) (MissingVacant!11566 (index!48659 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98052 (_ BitVec 32)) SeekEntryResult!11566)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98052 (_ BitVec 32)) SeekEntryResult!11566)

(assert (=> b!1442797 (= e!813126 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633665 lt!633668 mask!2687) (seekEntryOrOpen!0 lt!633665 lt!633668 mask!2687)))))

(declare-fun b!1442798 () Bool)

(declare-fun res!974985 () Bool)

(assert (=> b!1442798 (=> (not res!974985) (not e!813131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98052 (_ BitVec 32)) Bool)

(assert (=> b!1442798 (= res!974985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1442799 () Bool)

(declare-fun res!974983 () Bool)

(declare-fun e!813125 () Bool)

(assert (=> b!1442799 (=> (not res!974983) (not e!813125))))

(assert (=> b!1442799 (= res!974983 e!813126)))

(declare-fun c!133422 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1442799 (= c!133422 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1442800 () Bool)

(declare-fun lt!633669 () SeekEntryResult!11566)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98052 (_ BitVec 32)) SeekEntryResult!11566)

(assert (=> b!1442800 (= e!813126 (= lt!633669 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633665 lt!633668 mask!2687)))))

(declare-fun b!1442802 () Bool)

(declare-fun e!813129 () Bool)

(assert (=> b!1442802 (= e!813131 e!813129)))

(declare-fun res!974978 () Bool)

(assert (=> b!1442802 (=> (not res!974978) (not e!813129))))

(assert (=> b!1442802 (= res!974978 (= (select (store (arr!47314 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1442802 (= lt!633668 (array!98053 (store (arr!47314 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47864 a!2862)))))

(declare-fun b!1442803 () Bool)

(declare-fun res!974981 () Bool)

(assert (=> b!1442803 (=> (not res!974981) (not e!813131))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1442803 (= res!974981 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47864 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47864 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47864 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1442804 () Bool)

(declare-fun e!813127 () Bool)

(assert (=> b!1442804 (= e!813129 e!813127)))

(declare-fun res!974977 () Bool)

(assert (=> b!1442804 (=> (not res!974977) (not e!813127))))

(declare-fun lt!633666 () SeekEntryResult!11566)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1442804 (= res!974977 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47314 a!2862) j!93) mask!2687) (select (arr!47314 a!2862) j!93) a!2862 mask!2687) lt!633666))))

(assert (=> b!1442804 (= lt!633666 (Intermediate!11566 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1442805 () Bool)

(declare-fun res!974980 () Bool)

(assert (=> b!1442805 (=> (not res!974980) (not e!813131))))

(assert (=> b!1442805 (= res!974980 (validKeyInArray!0 (select (arr!47314 a!2862) j!93)))))

(declare-fun b!1442806 () Bool)

(assert (=> b!1442806 (= e!813125 (not true))))

(assert (=> b!1442806 e!813128))

(declare-fun res!974979 () Bool)

(assert (=> b!1442806 (=> (not res!974979) (not e!813128))))

(assert (=> b!1442806 (= res!974979 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48628 0))(
  ( (Unit!48629) )
))
(declare-fun lt!633667 () Unit!48628)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98052 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48628)

(assert (=> b!1442806 (= lt!633667 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1442807 () Bool)

(declare-fun res!974973 () Bool)

(assert (=> b!1442807 (=> (not res!974973) (not e!813131))))

(assert (=> b!1442807 (= res!974973 (and (= (size!47864 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47864 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47864 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1442801 () Bool)

(declare-fun res!974974 () Bool)

(assert (=> b!1442801 (=> (not res!974974) (not e!813131))))

(declare-datatypes ((List!33815 0))(
  ( (Nil!33812) (Cons!33811 (h!35161 (_ BitVec 64)) (t!48509 List!33815)) )
))
(declare-fun arrayNoDuplicates!0 (array!98052 (_ BitVec 32) List!33815) Bool)

(assert (=> b!1442801 (= res!974974 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33812))))

(declare-fun res!974984 () Bool)

(assert (=> start!124604 (=> (not res!974984) (not e!813131))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124604 (= res!974984 (validMask!0 mask!2687))))

(assert (=> start!124604 e!813131))

(assert (=> start!124604 true))

(declare-fun array_inv!36342 (array!98052) Bool)

(assert (=> start!124604 (array_inv!36342 a!2862)))

(declare-fun b!1442808 () Bool)

(declare-fun res!974982 () Bool)

(assert (=> b!1442808 (=> (not res!974982) (not e!813128))))

(assert (=> b!1442808 (= res!974982 (= (seekEntryOrOpen!0 (select (arr!47314 a!2862) j!93) a!2862 mask!2687) (Found!11566 j!93)))))

(declare-fun b!1442809 () Bool)

(assert (=> b!1442809 (= e!813127 e!813125)))

(declare-fun res!974976 () Bool)

(assert (=> b!1442809 (=> (not res!974976) (not e!813125))))

(assert (=> b!1442809 (= res!974976 (= lt!633669 (Intermediate!11566 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1442809 (= lt!633669 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633665 mask!2687) lt!633665 lt!633668 mask!2687))))

(assert (=> b!1442809 (= lt!633665 (select (store (arr!47314 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1442810 () Bool)

(declare-fun res!974975 () Bool)

(assert (=> b!1442810 (=> (not res!974975) (not e!813125))))

(assert (=> b!1442810 (= res!974975 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1442811 () Bool)

(declare-fun res!974986 () Bool)

(assert (=> b!1442811 (=> (not res!974986) (not e!813127))))

(assert (=> b!1442811 (= res!974986 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47314 a!2862) j!93) a!2862 mask!2687) lt!633666))))

(assert (= (and start!124604 res!974984) b!1442807))

(assert (= (and b!1442807 res!974973) b!1442796))

(assert (= (and b!1442796 res!974972) b!1442805))

(assert (= (and b!1442805 res!974980) b!1442798))

(assert (= (and b!1442798 res!974985) b!1442801))

(assert (= (and b!1442801 res!974974) b!1442803))

(assert (= (and b!1442803 res!974981) b!1442802))

(assert (= (and b!1442802 res!974978) b!1442804))

(assert (= (and b!1442804 res!974977) b!1442811))

(assert (= (and b!1442811 res!974986) b!1442809))

(assert (= (and b!1442809 res!974976) b!1442799))

(assert (= (and b!1442799 c!133422) b!1442800))

(assert (= (and b!1442799 (not c!133422)) b!1442797))

(assert (= (and b!1442799 res!974983) b!1442810))

(assert (= (and b!1442810 res!974975) b!1442806))

(assert (= (and b!1442806 res!974979) b!1442808))

(assert (= (and b!1442808 res!974982) b!1442795))

(declare-fun m!1331913 () Bool)

(assert (=> b!1442795 m!1331913))

(declare-fun m!1331915 () Bool)

(assert (=> b!1442795 m!1331915))

(declare-fun m!1331917 () Bool)

(assert (=> b!1442797 m!1331917))

(declare-fun m!1331919 () Bool)

(assert (=> b!1442797 m!1331919))

(assert (=> b!1442808 m!1331915))

(assert (=> b!1442808 m!1331915))

(declare-fun m!1331921 () Bool)

(assert (=> b!1442808 m!1331921))

(declare-fun m!1331923 () Bool)

(assert (=> b!1442802 m!1331923))

(declare-fun m!1331925 () Bool)

(assert (=> b!1442802 m!1331925))

(assert (=> b!1442805 m!1331915))

(assert (=> b!1442805 m!1331915))

(declare-fun m!1331927 () Bool)

(assert (=> b!1442805 m!1331927))

(declare-fun m!1331929 () Bool)

(assert (=> b!1442796 m!1331929))

(assert (=> b!1442796 m!1331929))

(declare-fun m!1331931 () Bool)

(assert (=> b!1442796 m!1331931))

(declare-fun m!1331933 () Bool)

(assert (=> b!1442809 m!1331933))

(assert (=> b!1442809 m!1331933))

(declare-fun m!1331935 () Bool)

(assert (=> b!1442809 m!1331935))

(assert (=> b!1442809 m!1331923))

(declare-fun m!1331937 () Bool)

(assert (=> b!1442809 m!1331937))

(assert (=> b!1442804 m!1331915))

(assert (=> b!1442804 m!1331915))

(declare-fun m!1331939 () Bool)

(assert (=> b!1442804 m!1331939))

(assert (=> b!1442804 m!1331939))

(assert (=> b!1442804 m!1331915))

(declare-fun m!1331941 () Bool)

(assert (=> b!1442804 m!1331941))

(assert (=> b!1442811 m!1331915))

(assert (=> b!1442811 m!1331915))

(declare-fun m!1331943 () Bool)

(assert (=> b!1442811 m!1331943))

(declare-fun m!1331945 () Bool)

(assert (=> b!1442798 m!1331945))

(declare-fun m!1331947 () Bool)

(assert (=> start!124604 m!1331947))

(declare-fun m!1331949 () Bool)

(assert (=> start!124604 m!1331949))

(declare-fun m!1331951 () Bool)

(assert (=> b!1442801 m!1331951))

(declare-fun m!1331953 () Bool)

(assert (=> b!1442800 m!1331953))

(declare-fun m!1331955 () Bool)

(assert (=> b!1442806 m!1331955))

(declare-fun m!1331957 () Bool)

(assert (=> b!1442806 m!1331957))

(push 1)

