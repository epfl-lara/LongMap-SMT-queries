; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125378 () Bool)

(assert start!125378)

(declare-fun b!1465947 () Bool)

(declare-fun res!994753 () Bool)

(declare-fun e!823656 () Bool)

(assert (=> b!1465947 (=> (not res!994753) (not e!823656))))

(declare-datatypes ((array!98826 0))(
  ( (array!98827 (arr!47701 (Array (_ BitVec 32) (_ BitVec 64))) (size!48251 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98826)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98826 (_ BitVec 32)) Bool)

(assert (=> b!1465947 (= res!994753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1465948 () Bool)

(declare-fun res!994743 () Bool)

(declare-fun e!823659 () Bool)

(assert (=> b!1465948 (=> res!994743 e!823659)))

(declare-fun e!823658 () Bool)

(assert (=> b!1465948 (= res!994743 e!823658)))

(declare-fun c!135113 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1465948 (= c!135113 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1465949 () Bool)

(declare-fun res!994756 () Bool)

(assert (=> b!1465949 (=> (not res!994756) (not e!823656))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1465949 (= res!994756 (and (= (size!48251 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48251 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48251 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1465950 () Bool)

(assert (=> b!1465950 (= e!823659 true)))

(declare-fun lt!641575 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11953 0))(
  ( (MissingZero!11953 (index!50204 (_ BitVec 32))) (Found!11953 (index!50205 (_ BitVec 32))) (Intermediate!11953 (undefined!12765 Bool) (index!50206 (_ BitVec 32)) (x!131778 (_ BitVec 32))) (Undefined!11953) (MissingVacant!11953 (index!50207 (_ BitVec 32))) )
))
(declare-fun lt!641574 () SeekEntryResult!11953)

(declare-fun lt!641578 () array!98826)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98826 (_ BitVec 32)) SeekEntryResult!11953)

(assert (=> b!1465950 (= lt!641574 (seekEntryOrOpen!0 lt!641575 lt!641578 mask!2687))))

(declare-datatypes ((Unit!49402 0))(
  ( (Unit!49403) )
))
(declare-fun lt!641576 () Unit!49402)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!641580 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98826 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49402)

(assert (=> b!1465950 (= lt!641576 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641580 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1465951 () Bool)

(declare-fun e!823653 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98826 (_ BitVec 32)) SeekEntryResult!11953)

(assert (=> b!1465951 (= e!823653 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641575 lt!641578 mask!2687) (seekEntryOrOpen!0 lt!641575 lt!641578 mask!2687)))))

(declare-fun b!1465952 () Bool)

(declare-fun res!994747 () Bool)

(assert (=> b!1465952 (=> (not res!994747) (not e!823656))))

(declare-datatypes ((List!34202 0))(
  ( (Nil!34199) (Cons!34198 (h!35548 (_ BitVec 64)) (t!48896 List!34202)) )
))
(declare-fun arrayNoDuplicates!0 (array!98826 (_ BitVec 32) List!34202) Bool)

(assert (=> b!1465952 (= res!994747 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34199))))

(declare-fun b!1465953 () Bool)

(declare-fun res!994759 () Bool)

(assert (=> b!1465953 (=> res!994759 e!823659)))

(declare-fun lt!641573 () SeekEntryResult!11953)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98826 (_ BitVec 32)) SeekEntryResult!11953)

(assert (=> b!1465953 (= res!994759 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641580 (select (arr!47701 a!2862) j!93) a!2862 mask!2687) lt!641573)))))

(declare-fun b!1465954 () Bool)

(declare-fun e!823654 () Bool)

(assert (=> b!1465954 (= e!823656 e!823654)))

(declare-fun res!994742 () Bool)

(assert (=> b!1465954 (=> (not res!994742) (not e!823654))))

(assert (=> b!1465954 (= res!994742 (= (select (store (arr!47701 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1465954 (= lt!641578 (array!98827 (store (arr!47701 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48251 a!2862)))))

(declare-fun b!1465955 () Bool)

(declare-fun res!994746 () Bool)

(assert (=> b!1465955 (=> (not res!994746) (not e!823656))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1465955 (= res!994746 (validKeyInArray!0 (select (arr!47701 a!2862) j!93)))))

(declare-fun b!1465956 () Bool)

(declare-fun e!823657 () Bool)

(declare-fun e!823660 () Bool)

(assert (=> b!1465956 (= e!823657 (not e!823660))))

(declare-fun res!994749 () Bool)

(assert (=> b!1465956 (=> res!994749 e!823660)))

(assert (=> b!1465956 (= res!994749 (or (and (= (select (arr!47701 a!2862) index!646) (select (store (arr!47701 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47701 a!2862) index!646) (select (arr!47701 a!2862) j!93))) (= (select (arr!47701 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1465956 (and (= lt!641574 (Found!11953 j!93)) (or (= (select (arr!47701 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47701 a!2862) intermediateBeforeIndex!19) (select (arr!47701 a!2862) j!93))))))

(assert (=> b!1465956 (= lt!641574 (seekEntryOrOpen!0 (select (arr!47701 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1465956 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!641577 () Unit!49402)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98826 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49402)

(assert (=> b!1465956 (= lt!641577 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!994758 () Bool)

(assert (=> start!125378 (=> (not res!994758) (not e!823656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125378 (= res!994758 (validMask!0 mask!2687))))

(assert (=> start!125378 e!823656))

(assert (=> start!125378 true))

(declare-fun array_inv!36729 (array!98826) Bool)

(assert (=> start!125378 (array_inv!36729 a!2862)))

(declare-fun b!1465957 () Bool)

(declare-fun lt!641579 () SeekEntryResult!11953)

(assert (=> b!1465957 (= e!823653 (= lt!641579 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641575 lt!641578 mask!2687)))))

(declare-fun b!1465958 () Bool)

(declare-fun e!823655 () Bool)

(assert (=> b!1465958 (= e!823655 e!823657)))

(declare-fun res!994745 () Bool)

(assert (=> b!1465958 (=> (not res!994745) (not e!823657))))

(assert (=> b!1465958 (= res!994745 (= lt!641579 (Intermediate!11953 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465958 (= lt!641579 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641575 mask!2687) lt!641575 lt!641578 mask!2687))))

(assert (=> b!1465958 (= lt!641575 (select (store (arr!47701 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1465959 () Bool)

(declare-fun res!994750 () Bool)

(assert (=> b!1465959 (=> (not res!994750) (not e!823657))))

(assert (=> b!1465959 (= res!994750 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1465960 () Bool)

(declare-fun res!994744 () Bool)

(assert (=> b!1465960 (=> (not res!994744) (not e!823656))))

(assert (=> b!1465960 (= res!994744 (validKeyInArray!0 (select (arr!47701 a!2862) i!1006)))))

(declare-fun b!1465961 () Bool)

(assert (=> b!1465961 (= e!823654 e!823655)))

(declare-fun res!994752 () Bool)

(assert (=> b!1465961 (=> (not res!994752) (not e!823655))))

(assert (=> b!1465961 (= res!994752 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47701 a!2862) j!93) mask!2687) (select (arr!47701 a!2862) j!93) a!2862 mask!2687) lt!641573))))

(assert (=> b!1465961 (= lt!641573 (Intermediate!11953 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1465962 () Bool)

(assert (=> b!1465962 (= e!823658 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641580 intermediateAfterIndex!19 lt!641575 lt!641578 mask!2687) (seekEntryOrOpen!0 lt!641575 lt!641578 mask!2687))))))

(declare-fun b!1465963 () Bool)

(assert (=> b!1465963 (= e!823660 e!823659)))

(declare-fun res!994754 () Bool)

(assert (=> b!1465963 (=> res!994754 e!823659)))

(assert (=> b!1465963 (= res!994754 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641580 #b00000000000000000000000000000000) (bvsge lt!641580 (size!48251 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1465963 (= lt!641580 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1465964 () Bool)

(declare-fun res!994755 () Bool)

(assert (=> b!1465964 (=> (not res!994755) (not e!823656))))

(assert (=> b!1465964 (= res!994755 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48251 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48251 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48251 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1465965 () Bool)

(assert (=> b!1465965 (= e!823658 (not (= lt!641579 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641580 lt!641575 lt!641578 mask!2687))))))

(declare-fun b!1465966 () Bool)

(declare-fun res!994748 () Bool)

(assert (=> b!1465966 (=> (not res!994748) (not e!823655))))

(assert (=> b!1465966 (= res!994748 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47701 a!2862) j!93) a!2862 mask!2687) lt!641573))))

(declare-fun b!1465967 () Bool)

(declare-fun res!994751 () Bool)

(assert (=> b!1465967 (=> res!994751 e!823659)))

(assert (=> b!1465967 (= res!994751 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1465968 () Bool)

(declare-fun res!994757 () Bool)

(assert (=> b!1465968 (=> (not res!994757) (not e!823657))))

(assert (=> b!1465968 (= res!994757 e!823653)))

(declare-fun c!135114 () Bool)

(assert (=> b!1465968 (= c!135114 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!125378 res!994758) b!1465949))

(assert (= (and b!1465949 res!994756) b!1465960))

(assert (= (and b!1465960 res!994744) b!1465955))

(assert (= (and b!1465955 res!994746) b!1465947))

(assert (= (and b!1465947 res!994753) b!1465952))

(assert (= (and b!1465952 res!994747) b!1465964))

(assert (= (and b!1465964 res!994755) b!1465954))

(assert (= (and b!1465954 res!994742) b!1465961))

(assert (= (and b!1465961 res!994752) b!1465966))

(assert (= (and b!1465966 res!994748) b!1465958))

(assert (= (and b!1465958 res!994745) b!1465968))

(assert (= (and b!1465968 c!135114) b!1465957))

(assert (= (and b!1465968 (not c!135114)) b!1465951))

(assert (= (and b!1465968 res!994757) b!1465959))

(assert (= (and b!1465959 res!994750) b!1465956))

(assert (= (and b!1465956 (not res!994749)) b!1465963))

(assert (= (and b!1465963 (not res!994754)) b!1465953))

(assert (= (and b!1465953 (not res!994759)) b!1465948))

(assert (= (and b!1465948 c!135113) b!1465965))

(assert (= (and b!1465948 (not c!135113)) b!1465962))

(assert (= (and b!1465948 (not res!994743)) b!1465967))

(assert (= (and b!1465967 (not res!994751)) b!1465950))

(declare-fun m!1352983 () Bool)

(assert (=> b!1465956 m!1352983))

(declare-fun m!1352985 () Bool)

(assert (=> b!1465956 m!1352985))

(declare-fun m!1352987 () Bool)

(assert (=> b!1465956 m!1352987))

(declare-fun m!1352989 () Bool)

(assert (=> b!1465956 m!1352989))

(declare-fun m!1352991 () Bool)

(assert (=> b!1465956 m!1352991))

(declare-fun m!1352993 () Bool)

(assert (=> b!1465956 m!1352993))

(declare-fun m!1352995 () Bool)

(assert (=> b!1465956 m!1352995))

(declare-fun m!1352997 () Bool)

(assert (=> b!1465956 m!1352997))

(assert (=> b!1465956 m!1352993))

(assert (=> b!1465955 m!1352993))

(assert (=> b!1465955 m!1352993))

(declare-fun m!1352999 () Bool)

(assert (=> b!1465955 m!1352999))

(declare-fun m!1353001 () Bool)

(assert (=> b!1465950 m!1353001))

(declare-fun m!1353003 () Bool)

(assert (=> b!1465950 m!1353003))

(declare-fun m!1353005 () Bool)

(assert (=> b!1465965 m!1353005))

(declare-fun m!1353007 () Bool)

(assert (=> start!125378 m!1353007))

(declare-fun m!1353009 () Bool)

(assert (=> start!125378 m!1353009))

(assert (=> b!1465953 m!1352993))

(assert (=> b!1465953 m!1352993))

(declare-fun m!1353011 () Bool)

(assert (=> b!1465953 m!1353011))

(assert (=> b!1465961 m!1352993))

(assert (=> b!1465961 m!1352993))

(declare-fun m!1353013 () Bool)

(assert (=> b!1465961 m!1353013))

(assert (=> b!1465961 m!1353013))

(assert (=> b!1465961 m!1352993))

(declare-fun m!1353015 () Bool)

(assert (=> b!1465961 m!1353015))

(declare-fun m!1353017 () Bool)

(assert (=> b!1465957 m!1353017))

(declare-fun m!1353019 () Bool)

(assert (=> b!1465947 m!1353019))

(declare-fun m!1353021 () Bool)

(assert (=> b!1465963 m!1353021))

(declare-fun m!1353023 () Bool)

(assert (=> b!1465958 m!1353023))

(assert (=> b!1465958 m!1353023))

(declare-fun m!1353025 () Bool)

(assert (=> b!1465958 m!1353025))

(assert (=> b!1465958 m!1352985))

(declare-fun m!1353027 () Bool)

(assert (=> b!1465958 m!1353027))

(assert (=> b!1465954 m!1352985))

(declare-fun m!1353029 () Bool)

(assert (=> b!1465954 m!1353029))

(assert (=> b!1465966 m!1352993))

(assert (=> b!1465966 m!1352993))

(declare-fun m!1353031 () Bool)

(assert (=> b!1465966 m!1353031))

(declare-fun m!1353033 () Bool)

(assert (=> b!1465962 m!1353033))

(assert (=> b!1465962 m!1353001))

(declare-fun m!1353035 () Bool)

(assert (=> b!1465952 m!1353035))

(declare-fun m!1353037 () Bool)

(assert (=> b!1465960 m!1353037))

(assert (=> b!1465960 m!1353037))

(declare-fun m!1353039 () Bool)

(assert (=> b!1465960 m!1353039))

(declare-fun m!1353041 () Bool)

(assert (=> b!1465951 m!1353041))

(assert (=> b!1465951 m!1353001))

(push 1)

