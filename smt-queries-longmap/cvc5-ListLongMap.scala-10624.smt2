; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124882 () Bool)

(assert start!124882)

(declare-fun b!1450403 () Bool)

(declare-fun res!981759 () Bool)

(declare-fun e!816728 () Bool)

(assert (=> b!1450403 (=> (not res!981759) (not e!816728))))

(declare-datatypes ((array!98330 0))(
  ( (array!98331 (arr!47453 (Array (_ BitVec 32) (_ BitVec 64))) (size!48003 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98330)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1450403 (= res!981759 (validKeyInArray!0 (select (arr!47453 a!2862) i!1006)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1450404 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun e!816725 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1450404 (= e!816725 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1450405 () Bool)

(declare-fun res!981754 () Bool)

(assert (=> b!1450405 (=> (not res!981754) (not e!816728))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1450405 (= res!981754 (validKeyInArray!0 (select (arr!47453 a!2862) j!93)))))

(declare-fun b!1450406 () Bool)

(declare-fun e!816733 () Bool)

(declare-fun e!816731 () Bool)

(assert (=> b!1450406 (= e!816733 e!816731)))

(declare-fun res!981747 () Bool)

(assert (=> b!1450406 (=> res!981747 e!816731)))

(assert (=> b!1450406 (= res!981747 (or (and (= (select (arr!47453 a!2862) index!646) (select (store (arr!47453 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47453 a!2862) index!646) (select (arr!47453 a!2862) j!93))) (not (= (select (arr!47453 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!981750 () Bool)

(assert (=> start!124882 (=> (not res!981750) (not e!816728))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124882 (= res!981750 (validMask!0 mask!2687))))

(assert (=> start!124882 e!816728))

(assert (=> start!124882 true))

(declare-fun array_inv!36481 (array!98330) Bool)

(assert (=> start!124882 (array_inv!36481 a!2862)))

(declare-fun b!1450407 () Bool)

(declare-fun res!981760 () Bool)

(assert (=> b!1450407 (=> (not res!981760) (not e!816728))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1450407 (= res!981760 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48003 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48003 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48003 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1450408 () Bool)

(declare-fun res!981757 () Bool)

(assert (=> b!1450408 (=> (not res!981757) (not e!816728))))

(assert (=> b!1450408 (= res!981757 (and (= (size!48003 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48003 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48003 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1450409 () Bool)

(declare-fun e!816727 () Bool)

(assert (=> b!1450409 (= e!816727 true)))

(declare-fun lt!636285 () (_ BitVec 64))

(declare-fun lt!636284 () array!98330)

(declare-datatypes ((SeekEntryResult!11705 0))(
  ( (MissingZero!11705 (index!49212 (_ BitVec 32))) (Found!11705 (index!49213 (_ BitVec 32))) (Intermediate!11705 (undefined!12517 Bool) (index!49214 (_ BitVec 32)) (x!130874 (_ BitVec 32))) (Undefined!11705) (MissingVacant!11705 (index!49215 (_ BitVec 32))) )
))
(declare-fun lt!636282 () SeekEntryResult!11705)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98330 (_ BitVec 32)) SeekEntryResult!11705)

(assert (=> b!1450409 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636285 lt!636284 mask!2687) lt!636282)))

(declare-datatypes ((Unit!48906 0))(
  ( (Unit!48907) )
))
(declare-fun lt!636280 () Unit!48906)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!98330 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48906)

(assert (=> b!1450409 (= lt!636280 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1450410 () Bool)

(declare-fun res!981763 () Bool)

(declare-fun e!816729 () Bool)

(assert (=> b!1450410 (=> (not res!981763) (not e!816729))))

(declare-fun e!816726 () Bool)

(assert (=> b!1450410 (= res!981763 e!816726)))

(declare-fun c!133839 () Bool)

(assert (=> b!1450410 (= c!133839 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1450411 () Bool)

(declare-fun res!981762 () Bool)

(assert (=> b!1450411 (=> (not res!981762) (not e!816728))))

(declare-datatypes ((List!33954 0))(
  ( (Nil!33951) (Cons!33950 (h!35300 (_ BitVec 64)) (t!48648 List!33954)) )
))
(declare-fun arrayNoDuplicates!0 (array!98330 (_ BitVec 32) List!33954) Bool)

(assert (=> b!1450411 (= res!981762 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33951))))

(declare-fun b!1450412 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98330 (_ BitVec 32)) SeekEntryResult!11705)

(assert (=> b!1450412 (= e!816726 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636285 lt!636284 mask!2687) (seekEntryOrOpen!0 lt!636285 lt!636284 mask!2687)))))

(declare-fun b!1450413 () Bool)

(declare-fun e!816734 () Bool)

(declare-fun e!816730 () Bool)

(assert (=> b!1450413 (= e!816734 e!816730)))

(declare-fun res!981749 () Bool)

(assert (=> b!1450413 (=> (not res!981749) (not e!816730))))

(declare-fun lt!636283 () SeekEntryResult!11705)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98330 (_ BitVec 32)) SeekEntryResult!11705)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1450413 (= res!981749 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47453 a!2862) j!93) mask!2687) (select (arr!47453 a!2862) j!93) a!2862 mask!2687) lt!636283))))

(assert (=> b!1450413 (= lt!636283 (Intermediate!11705 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1450414 () Bool)

(declare-fun res!981755 () Bool)

(assert (=> b!1450414 (=> (not res!981755) (not e!816729))))

(assert (=> b!1450414 (= res!981755 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1450415 () Bool)

(assert (=> b!1450415 (= e!816729 (not e!816727))))

(declare-fun res!981752 () Bool)

(assert (=> b!1450415 (=> res!981752 e!816727)))

(assert (=> b!1450415 (= res!981752 (or (and (= (select (arr!47453 a!2862) index!646) (select (store (arr!47453 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47453 a!2862) index!646) (select (arr!47453 a!2862) j!93))) (not (= (select (arr!47453 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47453 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1450415 e!816733))

(declare-fun res!981746 () Bool)

(assert (=> b!1450415 (=> (not res!981746) (not e!816733))))

(declare-fun lt!636279 () SeekEntryResult!11705)

(assert (=> b!1450415 (= res!981746 (and (= lt!636279 lt!636282) (or (= (select (arr!47453 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47453 a!2862) intermediateBeforeIndex!19) (select (arr!47453 a!2862) j!93)))))))

(assert (=> b!1450415 (= lt!636282 (Found!11705 j!93))))

(assert (=> b!1450415 (= lt!636279 (seekEntryOrOpen!0 (select (arr!47453 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98330 (_ BitVec 32)) Bool)

(assert (=> b!1450415 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!636281 () Unit!48906)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98330 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48906)

(assert (=> b!1450415 (= lt!636281 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1450416 () Bool)

(assert (=> b!1450416 (= e!816731 e!816725)))

(declare-fun res!981751 () Bool)

(assert (=> b!1450416 (=> (not res!981751) (not e!816725))))

(assert (=> b!1450416 (= res!981751 (= lt!636279 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47453 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1450417 () Bool)

(assert (=> b!1450417 (= e!816728 e!816734)))

(declare-fun res!981758 () Bool)

(assert (=> b!1450417 (=> (not res!981758) (not e!816734))))

(assert (=> b!1450417 (= res!981758 (= (select (store (arr!47453 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1450417 (= lt!636284 (array!98331 (store (arr!47453 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48003 a!2862)))))

(declare-fun b!1450418 () Bool)

(declare-fun res!981761 () Bool)

(assert (=> b!1450418 (=> (not res!981761) (not e!816730))))

(assert (=> b!1450418 (= res!981761 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47453 a!2862) j!93) a!2862 mask!2687) lt!636283))))

(declare-fun b!1450419 () Bool)

(assert (=> b!1450419 (= e!816730 e!816729)))

(declare-fun res!981753 () Bool)

(assert (=> b!1450419 (=> (not res!981753) (not e!816729))))

(declare-fun lt!636278 () SeekEntryResult!11705)

(assert (=> b!1450419 (= res!981753 (= lt!636278 (Intermediate!11705 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1450419 (= lt!636278 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636285 mask!2687) lt!636285 lt!636284 mask!2687))))

(assert (=> b!1450419 (= lt!636285 (select (store (arr!47453 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1450420 () Bool)

(declare-fun res!981748 () Bool)

(assert (=> b!1450420 (=> res!981748 e!816727)))

(assert (=> b!1450420 (= res!981748 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47453 a!2862) j!93) a!2862 mask!2687) lt!636282)))))

(declare-fun b!1450421 () Bool)

(declare-fun res!981756 () Bool)

(assert (=> b!1450421 (=> (not res!981756) (not e!816728))))

(assert (=> b!1450421 (= res!981756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1450422 () Bool)

(assert (=> b!1450422 (= e!816726 (= lt!636278 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636285 lt!636284 mask!2687)))))

(assert (= (and start!124882 res!981750) b!1450408))

(assert (= (and b!1450408 res!981757) b!1450403))

(assert (= (and b!1450403 res!981759) b!1450405))

(assert (= (and b!1450405 res!981754) b!1450421))

(assert (= (and b!1450421 res!981756) b!1450411))

(assert (= (and b!1450411 res!981762) b!1450407))

(assert (= (and b!1450407 res!981760) b!1450417))

(assert (= (and b!1450417 res!981758) b!1450413))

(assert (= (and b!1450413 res!981749) b!1450418))

(assert (= (and b!1450418 res!981761) b!1450419))

(assert (= (and b!1450419 res!981753) b!1450410))

(assert (= (and b!1450410 c!133839) b!1450422))

(assert (= (and b!1450410 (not c!133839)) b!1450412))

(assert (= (and b!1450410 res!981763) b!1450414))

(assert (= (and b!1450414 res!981755) b!1450415))

(assert (= (and b!1450415 res!981746) b!1450406))

(assert (= (and b!1450406 (not res!981747)) b!1450416))

(assert (= (and b!1450416 res!981751) b!1450404))

(assert (= (and b!1450415 (not res!981752)) b!1450420))

(assert (= (and b!1450420 (not res!981748)) b!1450409))

(declare-fun m!1339051 () Bool)

(assert (=> b!1450409 m!1339051))

(declare-fun m!1339053 () Bool)

(assert (=> b!1450409 m!1339053))

(declare-fun m!1339055 () Bool)

(assert (=> start!124882 m!1339055))

(declare-fun m!1339057 () Bool)

(assert (=> start!124882 m!1339057))

(declare-fun m!1339059 () Bool)

(assert (=> b!1450411 m!1339059))

(declare-fun m!1339061 () Bool)

(assert (=> b!1450415 m!1339061))

(declare-fun m!1339063 () Bool)

(assert (=> b!1450415 m!1339063))

(declare-fun m!1339065 () Bool)

(assert (=> b!1450415 m!1339065))

(declare-fun m!1339067 () Bool)

(assert (=> b!1450415 m!1339067))

(declare-fun m!1339069 () Bool)

(assert (=> b!1450415 m!1339069))

(declare-fun m!1339071 () Bool)

(assert (=> b!1450415 m!1339071))

(declare-fun m!1339073 () Bool)

(assert (=> b!1450415 m!1339073))

(declare-fun m!1339075 () Bool)

(assert (=> b!1450415 m!1339075))

(assert (=> b!1450415 m!1339071))

(declare-fun m!1339077 () Bool)

(assert (=> b!1450422 m!1339077))

(assert (=> b!1450406 m!1339069))

(assert (=> b!1450406 m!1339063))

(assert (=> b!1450406 m!1339067))

(assert (=> b!1450406 m!1339071))

(assert (=> b!1450405 m!1339071))

(assert (=> b!1450405 m!1339071))

(declare-fun m!1339079 () Bool)

(assert (=> b!1450405 m!1339079))

(assert (=> b!1450412 m!1339051))

(declare-fun m!1339081 () Bool)

(assert (=> b!1450412 m!1339081))

(declare-fun m!1339083 () Bool)

(assert (=> b!1450403 m!1339083))

(assert (=> b!1450403 m!1339083))

(declare-fun m!1339085 () Bool)

(assert (=> b!1450403 m!1339085))

(assert (=> b!1450413 m!1339071))

(assert (=> b!1450413 m!1339071))

(declare-fun m!1339087 () Bool)

(assert (=> b!1450413 m!1339087))

(assert (=> b!1450413 m!1339087))

(assert (=> b!1450413 m!1339071))

(declare-fun m!1339089 () Bool)

(assert (=> b!1450413 m!1339089))

(assert (=> b!1450418 m!1339071))

(assert (=> b!1450418 m!1339071))

(declare-fun m!1339091 () Bool)

(assert (=> b!1450418 m!1339091))

(assert (=> b!1450416 m!1339071))

(assert (=> b!1450416 m!1339071))

(declare-fun m!1339093 () Bool)

(assert (=> b!1450416 m!1339093))

(declare-fun m!1339095 () Bool)

(assert (=> b!1450419 m!1339095))

(assert (=> b!1450419 m!1339095))

(declare-fun m!1339097 () Bool)

(assert (=> b!1450419 m!1339097))

(assert (=> b!1450419 m!1339063))

(declare-fun m!1339099 () Bool)

(assert (=> b!1450419 m!1339099))

(assert (=> b!1450417 m!1339063))

(declare-fun m!1339101 () Bool)

(assert (=> b!1450417 m!1339101))

(declare-fun m!1339103 () Bool)

(assert (=> b!1450421 m!1339103))

(assert (=> b!1450420 m!1339071))

(assert (=> b!1450420 m!1339071))

(declare-fun m!1339105 () Bool)

(assert (=> b!1450420 m!1339105))

(push 1)

