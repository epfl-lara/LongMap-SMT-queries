; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127368 () Bool)

(assert start!127368)

(declare-fun b!1495148 () Bool)

(declare-fun res!1016543 () Bool)

(declare-fun e!837689 () Bool)

(assert (=> b!1495148 (=> (not res!1016543) (not e!837689))))

(declare-datatypes ((array!99853 0))(
  ( (array!99854 (arr!48190 (Array (_ BitVec 32) (_ BitVec 64))) (size!48741 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99853)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1495148 (= res!1016543 (validKeyInArray!0 (select (arr!48190 a!2862) j!93)))))

(declare-fun b!1495149 () Bool)

(declare-fun e!837691 () Bool)

(assert (=> b!1495149 (= e!837689 e!837691)))

(declare-fun res!1016534 () Bool)

(assert (=> b!1495149 (=> (not res!1016534) (not e!837691))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1495149 (= res!1016534 (= (select (store (arr!48190 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!651665 () array!99853)

(assert (=> b!1495149 (= lt!651665 (array!99854 (store (arr!48190 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48741 a!2862)))))

(declare-fun b!1495150 () Bool)

(declare-fun res!1016542 () Bool)

(assert (=> b!1495150 (=> (not res!1016542) (not e!837689))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99853 (_ BitVec 32)) Bool)

(assert (=> b!1495150 (= res!1016542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1495152 () Bool)

(declare-fun e!837695 () Bool)

(assert (=> b!1495152 (= e!837691 e!837695)))

(declare-fun res!1016539 () Bool)

(assert (=> b!1495152 (=> (not res!1016539) (not e!837695))))

(declare-datatypes ((SeekEntryResult!12327 0))(
  ( (MissingZero!12327 (index!51700 (_ BitVec 32))) (Found!12327 (index!51701 (_ BitVec 32))) (Intermediate!12327 (undefined!13139 Bool) (index!51702 (_ BitVec 32)) (x!133488 (_ BitVec 32))) (Undefined!12327) (MissingVacant!12327 (index!51703 (_ BitVec 32))) )
))
(declare-fun lt!651664 () SeekEntryResult!12327)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99853 (_ BitVec 32)) SeekEntryResult!12327)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495152 (= res!1016539 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48190 a!2862) j!93) mask!2687) (select (arr!48190 a!2862) j!93) a!2862 mask!2687) lt!651664))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1495152 (= lt!651664 (Intermediate!12327 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1495153 () Bool)

(declare-fun res!1016540 () Bool)

(assert (=> b!1495153 (=> (not res!1016540) (not e!837689))))

(declare-datatypes ((List!34678 0))(
  ( (Nil!34675) (Cons!34674 (h!36077 (_ BitVec 64)) (t!49364 List!34678)) )
))
(declare-fun arrayNoDuplicates!0 (array!99853 (_ BitVec 32) List!34678) Bool)

(assert (=> b!1495153 (= res!1016540 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34675))))

(declare-fun b!1495154 () Bool)

(declare-fun res!1016536 () Bool)

(assert (=> b!1495154 (=> (not res!1016536) (not e!837689))))

(assert (=> b!1495154 (= res!1016536 (validKeyInArray!0 (select (arr!48190 a!2862) i!1006)))))

(declare-fun b!1495155 () Bool)

(declare-fun res!1016541 () Bool)

(assert (=> b!1495155 (=> (not res!1016541) (not e!837689))))

(assert (=> b!1495155 (= res!1016541 (and (= (size!48741 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48741 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48741 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1495156 () Bool)

(declare-fun res!1016537 () Bool)

(declare-fun e!837690 () Bool)

(assert (=> b!1495156 (=> (not res!1016537) (not e!837690))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99853 (_ BitVec 32)) SeekEntryResult!12327)

(assert (=> b!1495156 (= res!1016537 (= (seekEntryOrOpen!0 (select (arr!48190 a!2862) j!93) a!2862 mask!2687) (Found!12327 j!93)))))

(declare-fun b!1495157 () Bool)

(declare-fun res!1016546 () Bool)

(declare-fun e!837696 () Bool)

(assert (=> b!1495157 (=> (not res!1016546) (not e!837696))))

(declare-fun e!837693 () Bool)

(assert (=> b!1495157 (= res!1016546 e!837693)))

(declare-fun c!138847 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1495157 (= c!138847 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1495158 () Bool)

(declare-fun res!1016549 () Bool)

(assert (=> b!1495158 (=> (not res!1016549) (not e!837696))))

(assert (=> b!1495158 (= res!1016549 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1495159 () Bool)

(declare-fun e!837692 () Bool)

(assert (=> b!1495159 (= e!837692 true)))

(declare-fun lt!651662 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1495159 (= lt!651662 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1495151 () Bool)

(assert (=> b!1495151 (= e!837696 (not e!837692))))

(declare-fun res!1016547 () Bool)

(assert (=> b!1495151 (=> res!1016547 e!837692)))

(assert (=> b!1495151 (= res!1016547 (or (and (= (select (arr!48190 a!2862) index!646) (select (store (arr!48190 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48190 a!2862) index!646) (select (arr!48190 a!2862) j!93))) (= (select (arr!48190 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1495151 e!837690))

(declare-fun res!1016548 () Bool)

(assert (=> b!1495151 (=> (not res!1016548) (not e!837690))))

(assert (=> b!1495151 (= res!1016548 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50027 0))(
  ( (Unit!50028) )
))
(declare-fun lt!651663 () Unit!50027)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99853 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50027)

(assert (=> b!1495151 (= lt!651663 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun res!1016538 () Bool)

(assert (=> start!127368 (=> (not res!1016538) (not e!837689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127368 (= res!1016538 (validMask!0 mask!2687))))

(assert (=> start!127368 e!837689))

(assert (=> start!127368 true))

(declare-fun array_inv!37471 (array!99853) Bool)

(assert (=> start!127368 (array_inv!37471 a!2862)))

(declare-fun b!1495160 () Bool)

(assert (=> b!1495160 (= e!837690 (or (= (select (arr!48190 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48190 a!2862) intermediateBeforeIndex!19) (select (arr!48190 a!2862) j!93))))))

(declare-fun lt!651667 () (_ BitVec 64))

(declare-fun lt!651666 () SeekEntryResult!12327)

(declare-fun b!1495161 () Bool)

(assert (=> b!1495161 (= e!837693 (= lt!651666 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651667 lt!651665 mask!2687)))))

(declare-fun b!1495162 () Bool)

(assert (=> b!1495162 (= e!837695 e!837696)))

(declare-fun res!1016545 () Bool)

(assert (=> b!1495162 (=> (not res!1016545) (not e!837696))))

(assert (=> b!1495162 (= res!1016545 (= lt!651666 (Intermediate!12327 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1495162 (= lt!651666 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651667 mask!2687) lt!651667 lt!651665 mask!2687))))

(assert (=> b!1495162 (= lt!651667 (select (store (arr!48190 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1495163 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99853 (_ BitVec 32)) SeekEntryResult!12327)

(assert (=> b!1495163 (= e!837693 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651667 lt!651665 mask!2687) (seekEntryOrOpen!0 lt!651667 lt!651665 mask!2687)))))

(declare-fun b!1495164 () Bool)

(declare-fun res!1016544 () Bool)

(assert (=> b!1495164 (=> (not res!1016544) (not e!837695))))

(assert (=> b!1495164 (= res!1016544 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48190 a!2862) j!93) a!2862 mask!2687) lt!651664))))

(declare-fun b!1495165 () Bool)

(declare-fun res!1016535 () Bool)

(assert (=> b!1495165 (=> (not res!1016535) (not e!837689))))

(assert (=> b!1495165 (= res!1016535 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48741 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48741 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48741 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!127368 res!1016538) b!1495155))

(assert (= (and b!1495155 res!1016541) b!1495154))

(assert (= (and b!1495154 res!1016536) b!1495148))

(assert (= (and b!1495148 res!1016543) b!1495150))

(assert (= (and b!1495150 res!1016542) b!1495153))

(assert (= (and b!1495153 res!1016540) b!1495165))

(assert (= (and b!1495165 res!1016535) b!1495149))

(assert (= (and b!1495149 res!1016534) b!1495152))

(assert (= (and b!1495152 res!1016539) b!1495164))

(assert (= (and b!1495164 res!1016544) b!1495162))

(assert (= (and b!1495162 res!1016545) b!1495157))

(assert (= (and b!1495157 c!138847) b!1495161))

(assert (= (and b!1495157 (not c!138847)) b!1495163))

(assert (= (and b!1495157 res!1016546) b!1495158))

(assert (= (and b!1495158 res!1016549) b!1495151))

(assert (= (and b!1495151 res!1016548) b!1495156))

(assert (= (and b!1495156 res!1016537) b!1495160))

(assert (= (and b!1495151 (not res!1016547)) b!1495159))

(declare-fun m!1378939 () Bool)

(assert (=> b!1495150 m!1378939))

(declare-fun m!1378941 () Bool)

(assert (=> b!1495153 m!1378941))

(declare-fun m!1378943 () Bool)

(assert (=> b!1495154 m!1378943))

(assert (=> b!1495154 m!1378943))

(declare-fun m!1378945 () Bool)

(assert (=> b!1495154 m!1378945))

(declare-fun m!1378947 () Bool)

(assert (=> b!1495156 m!1378947))

(assert (=> b!1495156 m!1378947))

(declare-fun m!1378949 () Bool)

(assert (=> b!1495156 m!1378949))

(declare-fun m!1378951 () Bool)

(assert (=> start!127368 m!1378951))

(declare-fun m!1378953 () Bool)

(assert (=> start!127368 m!1378953))

(declare-fun m!1378955 () Bool)

(assert (=> b!1495161 m!1378955))

(declare-fun m!1378957 () Bool)

(assert (=> b!1495151 m!1378957))

(declare-fun m!1378959 () Bool)

(assert (=> b!1495151 m!1378959))

(declare-fun m!1378961 () Bool)

(assert (=> b!1495151 m!1378961))

(declare-fun m!1378963 () Bool)

(assert (=> b!1495151 m!1378963))

(declare-fun m!1378965 () Bool)

(assert (=> b!1495151 m!1378965))

(assert (=> b!1495151 m!1378947))

(assert (=> b!1495148 m!1378947))

(assert (=> b!1495148 m!1378947))

(declare-fun m!1378967 () Bool)

(assert (=> b!1495148 m!1378967))

(assert (=> b!1495152 m!1378947))

(assert (=> b!1495152 m!1378947))

(declare-fun m!1378969 () Bool)

(assert (=> b!1495152 m!1378969))

(assert (=> b!1495152 m!1378969))

(assert (=> b!1495152 m!1378947))

(declare-fun m!1378971 () Bool)

(assert (=> b!1495152 m!1378971))

(declare-fun m!1378973 () Bool)

(assert (=> b!1495163 m!1378973))

(declare-fun m!1378975 () Bool)

(assert (=> b!1495163 m!1378975))

(assert (=> b!1495149 m!1378959))

(declare-fun m!1378977 () Bool)

(assert (=> b!1495149 m!1378977))

(declare-fun m!1378979 () Bool)

(assert (=> b!1495160 m!1378979))

(assert (=> b!1495160 m!1378947))

(declare-fun m!1378981 () Bool)

(assert (=> b!1495159 m!1378981))

(assert (=> b!1495164 m!1378947))

(assert (=> b!1495164 m!1378947))

(declare-fun m!1378983 () Bool)

(assert (=> b!1495164 m!1378983))

(declare-fun m!1378985 () Bool)

(assert (=> b!1495162 m!1378985))

(assert (=> b!1495162 m!1378985))

(declare-fun m!1378987 () Bool)

(assert (=> b!1495162 m!1378987))

(assert (=> b!1495162 m!1378959))

(declare-fun m!1378989 () Bool)

(assert (=> b!1495162 m!1378989))

(check-sat (not b!1495161) (not b!1495152) (not b!1495162) (not b!1495150) (not start!127368) (not b!1495163) (not b!1495159) (not b!1495148) (not b!1495154) (not b!1495153) (not b!1495164) (not b!1495151) (not b!1495156))
(check-sat)
