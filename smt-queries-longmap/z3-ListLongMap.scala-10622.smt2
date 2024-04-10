; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124872 () Bool)

(assert start!124872)

(declare-fun b!1450103 () Bool)

(declare-fun res!981488 () Bool)

(declare-fun e!816578 () Bool)

(assert (=> b!1450103 (=> (not res!981488) (not e!816578))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98320 0))(
  ( (array!98321 (arr!47448 (Array (_ BitVec 32) (_ BitVec 64))) (size!47998 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98320)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11700 0))(
  ( (MissingZero!11700 (index!49192 (_ BitVec 32))) (Found!11700 (index!49193 (_ BitVec 32))) (Intermediate!11700 (undefined!12512 Bool) (index!49194 (_ BitVec 32)) (x!130853 (_ BitVec 32))) (Undefined!11700) (MissingVacant!11700 (index!49195 (_ BitVec 32))) )
))
(declare-fun lt!636159 () SeekEntryResult!11700)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98320 (_ BitVec 32)) SeekEntryResult!11700)

(assert (=> b!1450103 (= res!981488 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47448 a!2862) j!93) a!2862 mask!2687) lt!636159))))

(declare-fun b!1450104 () Bool)

(declare-fun res!981491 () Bool)

(declare-fun e!816575 () Bool)

(assert (=> b!1450104 (=> (not res!981491) (not e!816575))))

(declare-datatypes ((List!33949 0))(
  ( (Nil!33946) (Cons!33945 (h!35295 (_ BitVec 64)) (t!48643 List!33949)) )
))
(declare-fun arrayNoDuplicates!0 (array!98320 (_ BitVec 32) List!33949) Bool)

(assert (=> b!1450104 (= res!981491 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33946))))

(declare-fun b!1450105 () Bool)

(declare-fun res!981492 () Bool)

(assert (=> b!1450105 (=> (not res!981492) (not e!816575))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1450105 (= res!981492 (and (= (size!47998 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47998 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47998 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450106 () Bool)

(declare-fun e!816583 () Bool)

(declare-fun e!816582 () Bool)

(assert (=> b!1450106 (= e!816583 (not e!816582))))

(declare-fun res!981479 () Bool)

(assert (=> b!1450106 (=> res!981479 e!816582)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1450106 (= res!981479 (or (and (= (select (arr!47448 a!2862) index!646) (select (store (arr!47448 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47448 a!2862) index!646) (select (arr!47448 a!2862) j!93))) (not (= (select (arr!47448 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47448 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816577 () Bool)

(assert (=> b!1450106 e!816577))

(declare-fun res!981481 () Bool)

(assert (=> b!1450106 (=> (not res!981481) (not e!816577))))

(declare-fun lt!636165 () SeekEntryResult!11700)

(declare-fun lt!636161 () SeekEntryResult!11700)

(assert (=> b!1450106 (= res!981481 (and (= lt!636165 lt!636161) (or (= (select (arr!47448 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47448 a!2862) intermediateBeforeIndex!19) (select (arr!47448 a!2862) j!93)))))))

(assert (=> b!1450106 (= lt!636161 (Found!11700 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98320 (_ BitVec 32)) SeekEntryResult!11700)

(assert (=> b!1450106 (= lt!636165 (seekEntryOrOpen!0 (select (arr!47448 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98320 (_ BitVec 32)) Bool)

(assert (=> b!1450106 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48896 0))(
  ( (Unit!48897) )
))
(declare-fun lt!636160 () Unit!48896)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98320 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48896)

(assert (=> b!1450106 (= lt!636160 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450107 () Bool)

(declare-fun res!981476 () Bool)

(assert (=> b!1450107 (=> (not res!981476) (not e!816575))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1450107 (= res!981476 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47998 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47998 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47998 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!981483 () Bool)

(assert (=> start!124872 (=> (not res!981483) (not e!816575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124872 (= res!981483 (validMask!0 mask!2687))))

(assert (=> start!124872 e!816575))

(assert (=> start!124872 true))

(declare-fun array_inv!36476 (array!98320) Bool)

(assert (=> start!124872 (array_inv!36476 a!2862)))

(declare-fun b!1450108 () Bool)

(declare-fun res!981490 () Bool)

(assert (=> b!1450108 (=> (not res!981490) (not e!816575))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450108 (= res!981490 (validKeyInArray!0 (select (arr!47448 a!2862) i!1006)))))

(declare-fun b!1450109 () Bool)

(declare-fun lt!636158 () array!98320)

(declare-fun lt!636164 () (_ BitVec 64))

(declare-fun e!816581 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98320 (_ BitVec 32)) SeekEntryResult!11700)

(assert (=> b!1450109 (= e!816581 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636164 lt!636158 mask!2687) (seekEntryOrOpen!0 lt!636164 lt!636158 mask!2687)))))

(declare-fun b!1450110 () Bool)

(assert (=> b!1450110 (= e!816582 true)))

(assert (=> b!1450110 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636164 lt!636158 mask!2687) lt!636161)))

(declare-fun lt!636162 () Unit!48896)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98320 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48896)

(assert (=> b!1450110 (= lt!636162 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1450111 () Bool)

(declare-fun res!981486 () Bool)

(assert (=> b!1450111 (=> (not res!981486) (not e!816575))))

(assert (=> b!1450111 (= res!981486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1450112 () Bool)

(declare-fun res!981478 () Bool)

(assert (=> b!1450112 (=> res!981478 e!816582)))

(assert (=> b!1450112 (= res!981478 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47448 a!2862) j!93) a!2862 mask!2687) lt!636161)))))

(declare-fun b!1450113 () Bool)

(assert (=> b!1450113 (= e!816578 e!816583)))

(declare-fun res!981487 () Bool)

(assert (=> b!1450113 (=> (not res!981487) (not e!816583))))

(declare-fun lt!636163 () SeekEntryResult!11700)

(assert (=> b!1450113 (= res!981487 (= lt!636163 (Intermediate!11700 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450113 (= lt!636163 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636164 mask!2687) lt!636164 lt!636158 mask!2687))))

(assert (=> b!1450113 (= lt!636164 (select (store (arr!47448 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1450114 () Bool)

(declare-fun e!816576 () Bool)

(assert (=> b!1450114 (= e!816576 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1450115 () Bool)

(declare-fun res!981477 () Bool)

(assert (=> b!1450115 (=> (not res!981477) (not e!816583))))

(assert (=> b!1450115 (= res!981477 e!816581)))

(declare-fun c!133824 () Bool)

(assert (=> b!1450115 (= c!133824 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1450116 () Bool)

(declare-fun e!816580 () Bool)

(assert (=> b!1450116 (= e!816575 e!816580)))

(declare-fun res!981493 () Bool)

(assert (=> b!1450116 (=> (not res!981493) (not e!816580))))

(assert (=> b!1450116 (= res!981493 (= (select (store (arr!47448 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1450116 (= lt!636158 (array!98321 (store (arr!47448 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47998 a!2862)))))

(declare-fun b!1450117 () Bool)

(declare-fun e!816579 () Bool)

(assert (=> b!1450117 (= e!816579 e!816576)))

(declare-fun res!981485 () Bool)

(assert (=> b!1450117 (=> (not res!981485) (not e!816576))))

(assert (=> b!1450117 (= res!981485 (= lt!636165 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47448 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1450118 () Bool)

(assert (=> b!1450118 (= e!816581 (= lt!636163 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636164 lt!636158 mask!2687)))))

(declare-fun b!1450119 () Bool)

(declare-fun res!981489 () Bool)

(assert (=> b!1450119 (=> (not res!981489) (not e!816575))))

(assert (=> b!1450119 (= res!981489 (validKeyInArray!0 (select (arr!47448 a!2862) j!93)))))

(declare-fun b!1450120 () Bool)

(assert (=> b!1450120 (= e!816577 e!816579)))

(declare-fun res!981480 () Bool)

(assert (=> b!1450120 (=> res!981480 e!816579)))

(assert (=> b!1450120 (= res!981480 (or (and (= (select (arr!47448 a!2862) index!646) (select (store (arr!47448 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47448 a!2862) index!646) (select (arr!47448 a!2862) j!93))) (not (= (select (arr!47448 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1450121 () Bool)

(assert (=> b!1450121 (= e!816580 e!816578)))

(declare-fun res!981482 () Bool)

(assert (=> b!1450121 (=> (not res!981482) (not e!816578))))

(assert (=> b!1450121 (= res!981482 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47448 a!2862) j!93) mask!2687) (select (arr!47448 a!2862) j!93) a!2862 mask!2687) lt!636159))))

(assert (=> b!1450121 (= lt!636159 (Intermediate!11700 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1450122 () Bool)

(declare-fun res!981484 () Bool)

(assert (=> b!1450122 (=> (not res!981484) (not e!816583))))

(assert (=> b!1450122 (= res!981484 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!124872 res!981483) b!1450105))

(assert (= (and b!1450105 res!981492) b!1450108))

(assert (= (and b!1450108 res!981490) b!1450119))

(assert (= (and b!1450119 res!981489) b!1450111))

(assert (= (and b!1450111 res!981486) b!1450104))

(assert (= (and b!1450104 res!981491) b!1450107))

(assert (= (and b!1450107 res!981476) b!1450116))

(assert (= (and b!1450116 res!981493) b!1450121))

(assert (= (and b!1450121 res!981482) b!1450103))

(assert (= (and b!1450103 res!981488) b!1450113))

(assert (= (and b!1450113 res!981487) b!1450115))

(assert (= (and b!1450115 c!133824) b!1450118))

(assert (= (and b!1450115 (not c!133824)) b!1450109))

(assert (= (and b!1450115 res!981477) b!1450122))

(assert (= (and b!1450122 res!981484) b!1450106))

(assert (= (and b!1450106 res!981481) b!1450120))

(assert (= (and b!1450120 (not res!981480)) b!1450117))

(assert (= (and b!1450117 res!981485) b!1450114))

(assert (= (and b!1450106 (not res!981479)) b!1450112))

(assert (= (and b!1450112 (not res!981478)) b!1450110))

(declare-fun m!1338771 () Bool)

(assert (=> b!1450109 m!1338771))

(declare-fun m!1338773 () Bool)

(assert (=> b!1450109 m!1338773))

(declare-fun m!1338775 () Bool)

(assert (=> start!124872 m!1338775))

(declare-fun m!1338777 () Bool)

(assert (=> start!124872 m!1338777))

(declare-fun m!1338779 () Bool)

(assert (=> b!1450117 m!1338779))

(assert (=> b!1450117 m!1338779))

(declare-fun m!1338781 () Bool)

(assert (=> b!1450117 m!1338781))

(declare-fun m!1338783 () Bool)

(assert (=> b!1450116 m!1338783))

(declare-fun m!1338785 () Bool)

(assert (=> b!1450116 m!1338785))

(declare-fun m!1338787 () Bool)

(assert (=> b!1450118 m!1338787))

(assert (=> b!1450119 m!1338779))

(assert (=> b!1450119 m!1338779))

(declare-fun m!1338789 () Bool)

(assert (=> b!1450119 m!1338789))

(assert (=> b!1450112 m!1338779))

(assert (=> b!1450112 m!1338779))

(declare-fun m!1338791 () Bool)

(assert (=> b!1450112 m!1338791))

(declare-fun m!1338793 () Bool)

(assert (=> b!1450108 m!1338793))

(assert (=> b!1450108 m!1338793))

(declare-fun m!1338795 () Bool)

(assert (=> b!1450108 m!1338795))

(declare-fun m!1338797 () Bool)

(assert (=> b!1450104 m!1338797))

(assert (=> b!1450103 m!1338779))

(assert (=> b!1450103 m!1338779))

(declare-fun m!1338799 () Bool)

(assert (=> b!1450103 m!1338799))

(declare-fun m!1338801 () Bool)

(assert (=> b!1450111 m!1338801))

(declare-fun m!1338803 () Bool)

(assert (=> b!1450106 m!1338803))

(assert (=> b!1450106 m!1338783))

(declare-fun m!1338805 () Bool)

(assert (=> b!1450106 m!1338805))

(declare-fun m!1338807 () Bool)

(assert (=> b!1450106 m!1338807))

(declare-fun m!1338809 () Bool)

(assert (=> b!1450106 m!1338809))

(assert (=> b!1450106 m!1338779))

(declare-fun m!1338811 () Bool)

(assert (=> b!1450106 m!1338811))

(declare-fun m!1338813 () Bool)

(assert (=> b!1450106 m!1338813))

(assert (=> b!1450106 m!1338779))

(assert (=> b!1450120 m!1338809))

(assert (=> b!1450120 m!1338783))

(assert (=> b!1450120 m!1338807))

(assert (=> b!1450120 m!1338779))

(assert (=> b!1450110 m!1338771))

(declare-fun m!1338815 () Bool)

(assert (=> b!1450110 m!1338815))

(declare-fun m!1338817 () Bool)

(assert (=> b!1450113 m!1338817))

(assert (=> b!1450113 m!1338817))

(declare-fun m!1338819 () Bool)

(assert (=> b!1450113 m!1338819))

(assert (=> b!1450113 m!1338783))

(declare-fun m!1338821 () Bool)

(assert (=> b!1450113 m!1338821))

(assert (=> b!1450121 m!1338779))

(assert (=> b!1450121 m!1338779))

(declare-fun m!1338823 () Bool)

(assert (=> b!1450121 m!1338823))

(assert (=> b!1450121 m!1338823))

(assert (=> b!1450121 m!1338779))

(declare-fun m!1338825 () Bool)

(assert (=> b!1450121 m!1338825))

(check-sat (not b!1450108) (not b!1450112) (not b!1450104) (not b!1450109) (not b!1450113) (not b!1450121) (not b!1450110) (not b!1450106) (not b!1450117) (not b!1450111) (not b!1450119) (not b!1450103) (not start!124872) (not b!1450118))
(check-sat)
