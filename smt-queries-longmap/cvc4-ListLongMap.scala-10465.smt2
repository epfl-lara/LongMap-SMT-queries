; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122956 () Bool)

(assert start!122956)

(declare-fun res!961823 () Bool)

(declare-fun e!805685 () Bool)

(assert (=> start!122956 (=> (not res!961823) (not e!805685))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122956 (= res!961823 (validMask!0 mask!2608))))

(assert (=> start!122956 e!805685))

(assert (=> start!122956 true))

(declare-datatypes ((array!97321 0))(
  ( (array!97322 (arr!46978 (Array (_ BitVec 32) (_ BitVec 64))) (size!47528 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97321)

(declare-fun array_inv!36006 (array!97321) Bool)

(assert (=> start!122956 (array_inv!36006 a!2831)))

(declare-fun b!1426381 () Bool)

(declare-fun res!961824 () Bool)

(declare-fun e!805683 () Bool)

(assert (=> b!1426381 (=> (not res!961824) (not e!805683))))

(declare-fun lt!628137 () array!97321)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!628139 () (_ BitVec 64))

(declare-fun index!585 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11257 0))(
  ( (MissingZero!11257 (index!47420 (_ BitVec 32))) (Found!11257 (index!47421 (_ BitVec 32))) (Intermediate!11257 (undefined!12069 Bool) (index!47422 (_ BitVec 32)) (x!129043 (_ BitVec 32))) (Undefined!11257) (MissingVacant!11257 (index!47423 (_ BitVec 32))) )
))
(declare-fun lt!628140 () SeekEntryResult!11257)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97321 (_ BitVec 32)) SeekEntryResult!11257)

(assert (=> b!1426381 (= res!961824 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628139 lt!628137 mask!2608) lt!628140))))

(declare-fun b!1426382 () Bool)

(declare-fun res!961817 () Bool)

(assert (=> b!1426382 (=> (not res!961817) (not e!805683))))

(declare-fun lt!628138 () SeekEntryResult!11257)

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1426382 (= res!961817 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46978 a!2831) j!81) a!2831 mask!2608) lt!628138))))

(declare-fun b!1426383 () Bool)

(declare-fun res!961816 () Bool)

(assert (=> b!1426383 (=> (not res!961816) (not e!805685))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1426383 (= res!961816 (and (= (size!47528 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47528 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47528 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426384 () Bool)

(declare-fun res!961821 () Bool)

(assert (=> b!1426384 (=> (not res!961821) (not e!805685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97321 (_ BitVec 32)) Bool)

(assert (=> b!1426384 (= res!961821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1426385 () Bool)

(declare-fun res!961815 () Bool)

(assert (=> b!1426385 (=> (not res!961815) (not e!805685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426385 (= res!961815 (validKeyInArray!0 (select (arr!46978 a!2831) i!982)))))

(declare-fun b!1426386 () Bool)

(declare-fun e!805684 () Bool)

(assert (=> b!1426386 (= e!805684 e!805683)))

(declare-fun res!961822 () Bool)

(assert (=> b!1426386 (=> (not res!961822) (not e!805683))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426386 (= res!961822 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628139 mask!2608) lt!628139 lt!628137 mask!2608) lt!628140))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1426386 (= lt!628140 (Intermediate!11257 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1426386 (= lt!628139 (select (store (arr!46978 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1426386 (= lt!628137 (array!97322 (store (arr!46978 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47528 a!2831)))))

(declare-fun b!1426387 () Bool)

(assert (=> b!1426387 (= e!805685 e!805684)))

(declare-fun res!961819 () Bool)

(assert (=> b!1426387 (=> (not res!961819) (not e!805684))))

(assert (=> b!1426387 (= res!961819 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46978 a!2831) j!81) mask!2608) (select (arr!46978 a!2831) j!81) a!2831 mask!2608) lt!628138))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1426387 (= lt!628138 (Intermediate!11257 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1426388 () Bool)

(declare-fun res!961814 () Bool)

(assert (=> b!1426388 (=> (not res!961814) (not e!805685))))

(assert (=> b!1426388 (= res!961814 (validKeyInArray!0 (select (arr!46978 a!2831) j!81)))))

(declare-fun b!1426389 () Bool)

(declare-fun res!961820 () Bool)

(assert (=> b!1426389 (=> (not res!961820) (not e!805685))))

(assert (=> b!1426389 (= res!961820 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47528 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47528 a!2831))))))

(declare-fun b!1426390 () Bool)

(declare-fun res!961825 () Bool)

(assert (=> b!1426390 (=> (not res!961825) (not e!805685))))

(declare-datatypes ((List!33488 0))(
  ( (Nil!33485) (Cons!33484 (h!34786 (_ BitVec 64)) (t!48182 List!33488)) )
))
(declare-fun arrayNoDuplicates!0 (array!97321 (_ BitVec 32) List!33488) Bool)

(assert (=> b!1426390 (= res!961825 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33485))))

(declare-fun b!1426391 () Bool)

(declare-fun res!961818 () Bool)

(assert (=> b!1426391 (=> (not res!961818) (not e!805683))))

(assert (=> b!1426391 (= res!961818 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1426392 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97321 (_ BitVec 32)) SeekEntryResult!11257)

(assert (=> b!1426392 (= e!805683 (not (= (seekEntryOrOpen!0 (select (arr!46978 a!2831) j!81) a!2831 mask!2608) (Found!11257 j!81))))))

(assert (=> b!1426392 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48260 0))(
  ( (Unit!48261) )
))
(declare-fun lt!628136 () Unit!48260)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97321 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48260)

(assert (=> b!1426392 (= lt!628136 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(assert (= (and start!122956 res!961823) b!1426383))

(assert (= (and b!1426383 res!961816) b!1426385))

(assert (= (and b!1426385 res!961815) b!1426388))

(assert (= (and b!1426388 res!961814) b!1426384))

(assert (= (and b!1426384 res!961821) b!1426390))

(assert (= (and b!1426390 res!961825) b!1426389))

(assert (= (and b!1426389 res!961820) b!1426387))

(assert (= (and b!1426387 res!961819) b!1426386))

(assert (= (and b!1426386 res!961822) b!1426382))

(assert (= (and b!1426382 res!961817) b!1426381))

(assert (= (and b!1426381 res!961824) b!1426391))

(assert (= (and b!1426391 res!961818) b!1426392))

(declare-fun m!1316995 () Bool)

(assert (=> b!1426390 m!1316995))

(declare-fun m!1316997 () Bool)

(assert (=> b!1426392 m!1316997))

(assert (=> b!1426392 m!1316997))

(declare-fun m!1316999 () Bool)

(assert (=> b!1426392 m!1316999))

(declare-fun m!1317001 () Bool)

(assert (=> b!1426392 m!1317001))

(declare-fun m!1317003 () Bool)

(assert (=> b!1426392 m!1317003))

(assert (=> b!1426382 m!1316997))

(assert (=> b!1426382 m!1316997))

(declare-fun m!1317005 () Bool)

(assert (=> b!1426382 m!1317005))

(declare-fun m!1317007 () Bool)

(assert (=> b!1426385 m!1317007))

(assert (=> b!1426385 m!1317007))

(declare-fun m!1317009 () Bool)

(assert (=> b!1426385 m!1317009))

(declare-fun m!1317011 () Bool)

(assert (=> b!1426386 m!1317011))

(assert (=> b!1426386 m!1317011))

(declare-fun m!1317013 () Bool)

(assert (=> b!1426386 m!1317013))

(declare-fun m!1317015 () Bool)

(assert (=> b!1426386 m!1317015))

(declare-fun m!1317017 () Bool)

(assert (=> b!1426386 m!1317017))

(declare-fun m!1317019 () Bool)

(assert (=> start!122956 m!1317019))

(declare-fun m!1317021 () Bool)

(assert (=> start!122956 m!1317021))

(declare-fun m!1317023 () Bool)

(assert (=> b!1426381 m!1317023))

(assert (=> b!1426387 m!1316997))

(assert (=> b!1426387 m!1316997))

(declare-fun m!1317025 () Bool)

(assert (=> b!1426387 m!1317025))

(assert (=> b!1426387 m!1317025))

(assert (=> b!1426387 m!1316997))

(declare-fun m!1317027 () Bool)

(assert (=> b!1426387 m!1317027))

(assert (=> b!1426388 m!1316997))

(assert (=> b!1426388 m!1316997))

(declare-fun m!1317029 () Bool)

(assert (=> b!1426388 m!1317029))

(declare-fun m!1317031 () Bool)

(assert (=> b!1426384 m!1317031))

(push 1)

(assert (not b!1426388))

(assert (not b!1426382))

(assert (not b!1426387))

(assert (not b!1426390))

(assert (not b!1426392))

(assert (not b!1426386))

(assert (not start!122956))

(assert (not b!1426385))

(assert (not b!1426381))

(assert (not b!1426384))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!153175 () Bool)

(assert (=> d!153175 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122956 d!153175))

(declare-fun d!153185 () Bool)

(assert (=> d!153185 (= (array_inv!36006 a!2831) (bvsge (size!47528 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122956 d!153185))

(declare-fun b!1426492 () Bool)

(declare-fun e!805752 () Bool)

(declare-fun call!67332 () Bool)

(assert (=> b!1426492 (= e!805752 call!67332)))

(declare-fun b!1426493 () Bool)

(declare-fun e!805753 () Bool)

(assert (=> b!1426493 (= e!805753 e!805752)))

(declare-fun c!131798 () Bool)

(assert (=> b!1426493 (= c!131798 (validKeyInArray!0 (select (arr!46978 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!153187 () Bool)

(declare-fun res!961870 () Bool)

(assert (=> d!153187 (=> res!961870 e!805753)))

(assert (=> d!153187 (= res!961870 (bvsge #b00000000000000000000000000000000 (size!47528 a!2831)))))

(assert (=> d!153187 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!805753)))

(declare-fun b!1426494 () Bool)

(declare-fun e!805751 () Bool)

(assert (=> b!1426494 (= e!805751 call!67332)))

(declare-fun b!1426495 () Bool)

(assert (=> b!1426495 (= e!805752 e!805751)))

(declare-fun lt!628176 () (_ BitVec 64))

(assert (=> b!1426495 (= lt!628176 (select (arr!46978 a!2831) #b00000000000000000000000000000000))))

(declare-fun lt!628178 () Unit!48260)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97321 (_ BitVec 64) (_ BitVec 32)) Unit!48260)

(assert (=> b!1426495 (= lt!628178 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628176 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1426495 (arrayContainsKey!0 a!2831 lt!628176 #b00000000000000000000000000000000)))

(declare-fun lt!628177 () Unit!48260)

(assert (=> b!1426495 (= lt!628177 lt!628178)))

(declare-fun res!961871 () Bool)

(assert (=> b!1426495 (= res!961871 (= (seekEntryOrOpen!0 (select (arr!46978 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11257 #b00000000000000000000000000000000)))))

(assert (=> b!1426495 (=> (not res!961871) (not e!805751))))

(declare-fun bm!67329 () Bool)

(assert (=> bm!67329 (= call!67332 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!153187 (not res!961870)) b!1426493))

(assert (= (and b!1426493 c!131798) b!1426495))

(assert (= (and b!1426493 (not c!131798)) b!1426492))

(assert (= (and b!1426495 res!961871) b!1426494))

(assert (= (or b!1426494 b!1426492) bm!67329))

(declare-fun m!1317079 () Bool)

(assert (=> b!1426493 m!1317079))

(assert (=> b!1426493 m!1317079))

(declare-fun m!1317081 () Bool)

(assert (=> b!1426493 m!1317081))

(assert (=> b!1426495 m!1317079))

(declare-fun m!1317083 () Bool)

(assert (=> b!1426495 m!1317083))

(declare-fun m!1317085 () Bool)

(assert (=> b!1426495 m!1317085))

(assert (=> b!1426495 m!1317079))

(declare-fun m!1317087 () Bool)

(assert (=> b!1426495 m!1317087))

(declare-fun m!1317089 () Bool)

(assert (=> bm!67329 m!1317089))

(assert (=> b!1426384 d!153187))

(declare-fun d!153203 () Bool)

(assert (=> d!153203 (= (validKeyInArray!0 (select (arr!46978 a!2831) j!81)) (and (not (= (select (arr!46978 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46978 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1426388 d!153203))

(declare-fun d!153205 () Bool)

(declare-fun e!805777 () Bool)

(assert (=> d!153205 e!805777))

(declare-fun c!131809 () Bool)

(declare-fun lt!628192 () SeekEntryResult!11257)

(assert (=> d!153205 (= c!131809 (and (is-Intermediate!11257 lt!628192) (undefined!12069 lt!628192)))))

(declare-fun e!805781 () SeekEntryResult!11257)

(assert (=> d!153205 (= lt!628192 e!805781)))

(declare-fun c!131811 () Bool)

(assert (=> d!153205 (= c!131811 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!628193 () (_ BitVec 64))

(assert (=> d!153205 (= lt!628193 (select (arr!46978 a!2831) (toIndex!0 (select (arr!46978 a!2831) j!81) mask!2608)))))

(assert (=> d!153205 (validMask!0 mask!2608)))

(assert (=> d!153205 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46978 a!2831) j!81) mask!2608) (select (arr!46978 a!2831) j!81) a!2831 mask!2608) lt!628192)))

(declare-fun b!1426531 () Bool)

(assert (=> b!1426531 (and (bvsge (index!47422 lt!628192) #b00000000000000000000000000000000) (bvslt (index!47422 lt!628192) (size!47528 a!2831)))))

(declare-fun res!961888 () Bool)

(assert (=> b!1426531 (= res!961888 (= (select (arr!46978 a!2831) (index!47422 lt!628192)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!805779 () Bool)

(assert (=> b!1426531 (=> res!961888 e!805779)))

(declare-fun b!1426532 () Bool)

(declare-fun e!805778 () SeekEntryResult!11257)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426532 (= e!805778 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46978 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!46978 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1426533 () Bool)

(assert (=> b!1426533 (= e!805781 e!805778)))

(declare-fun c!131810 () Bool)

(assert (=> b!1426533 (= c!131810 (or (= lt!628193 (select (arr!46978 a!2831) j!81)) (= (bvadd lt!628193 lt!628193) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1426534 () Bool)

(assert (=> b!1426534 (and (bvsge (index!47422 lt!628192) #b00000000000000000000000000000000) (bvslt (index!47422 lt!628192) (size!47528 a!2831)))))

(assert (=> b!1426534 (= e!805779 (= (select (arr!46978 a!2831) (index!47422 lt!628192)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1426535 () Bool)

(assert (=> b!1426535 (= e!805777 (bvsge (x!129043 lt!628192) #b01111111111111111111111111111110))))

(declare-fun b!1426536 () Bool)

(assert (=> b!1426536 (and (bvsge (index!47422 lt!628192) #b00000000000000000000000000000000) (bvslt (index!47422 lt!628192) (size!47528 a!2831)))))

(declare-fun res!961887 () Bool)

(assert (=> b!1426536 (= res!961887 (= (select (arr!46978 a!2831) (index!47422 lt!628192)) (select (arr!46978 a!2831) j!81)))))

(assert (=> b!1426536 (=> res!961887 e!805779)))

(declare-fun e!805780 () Bool)

(assert (=> b!1426536 (= e!805780 e!805779)))

(declare-fun b!1426537 () Bool)

(assert (=> b!1426537 (= e!805781 (Intermediate!11257 true (toIndex!0 (select (arr!46978 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun b!1426538 () Bool)

(assert (=> b!1426538 (= e!805777 e!805780)))

(declare-fun res!961889 () Bool)

(assert (=> b!1426538 (= res!961889 (and (is-Intermediate!11257 lt!628192) (not (undefined!12069 lt!628192)) (bvslt (x!129043 lt!628192) #b01111111111111111111111111111110) (bvsge (x!129043 lt!628192) #b00000000000000000000000000000000) (bvsge (x!129043 lt!628192) #b00000000000000000000000000000000)))))

(assert (=> b!1426538 (=> (not res!961889) (not e!805780))))

(declare-fun b!1426539 () Bool)

(assert (=> b!1426539 (= e!805778 (Intermediate!11257 false (toIndex!0 (select (arr!46978 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(assert (= (and d!153205 c!131811) b!1426537))

(assert (= (and d!153205 (not c!131811)) b!1426533))

(assert (= (and b!1426533 c!131810) b!1426539))

(assert (= (and b!1426533 (not c!131810)) b!1426532))

(assert (= (and d!153205 c!131809) b!1426535))

(assert (= (and d!153205 (not c!131809)) b!1426538))

(assert (= (and b!1426538 res!961889) b!1426536))

(assert (= (and b!1426536 (not res!961887)) b!1426531))

(assert (= (and b!1426531 (not res!961888)) b!1426534))

(declare-fun m!1317107 () Bool)

(assert (=> b!1426534 m!1317107))

(assert (=> b!1426531 m!1317107))

(assert (=> b!1426532 m!1317025))

(declare-fun m!1317109 () Bool)

(assert (=> b!1426532 m!1317109))

(assert (=> b!1426532 m!1317109))

(assert (=> b!1426532 m!1316997))

(declare-fun m!1317111 () Bool)

(assert (=> b!1426532 m!1317111))

(assert (=> b!1426536 m!1317107))

(assert (=> d!153205 m!1317025))

(declare-fun m!1317113 () Bool)

(assert (=> d!153205 m!1317113))

(assert (=> d!153205 m!1317019))

(assert (=> b!1426387 d!153205))

(declare-fun d!153219 () Bool)

(declare-fun lt!628209 () (_ BitVec 32))

(declare-fun lt!628208 () (_ BitVec 32))

(assert (=> d!153219 (= lt!628209 (bvmul (bvxor lt!628208 (bvlshr lt!628208 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!153219 (= lt!628208 ((_ extract 31 0) (bvand (bvxor (select (arr!46978 a!2831) j!81) (bvlshr (select (arr!46978 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!153219 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!961890 (let ((h!34788 ((_ extract 31 0) (bvand (bvxor (select (arr!46978 a!2831) j!81) (bvlshr (select (arr!46978 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129047 (bvmul (bvxor h!34788 (bvlshr h!34788 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129047 (bvlshr x!129047 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!961890 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!961890 #b00000000000000000000000000000000))))))

(assert (=> d!153219 (= (toIndex!0 (select (arr!46978 a!2831) j!81) mask!2608) (bvand (bvxor lt!628209 (bvlshr lt!628209 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1426387 d!153219))

(declare-fun d!153221 () Bool)

(declare-fun e!805792 () Bool)

(assert (=> d!153221 e!805792))

(declare-fun c!131822 () Bool)

(declare-fun lt!628210 () SeekEntryResult!11257)

(assert (=> d!153221 (= c!131822 (and (is-Intermediate!11257 lt!628210) (undefined!12069 lt!628210)))))

(declare-fun e!805796 () SeekEntryResult!11257)

(assert (=> d!153221 (= lt!628210 e!805796)))

(declare-fun c!131824 () Bool)

(assert (=> d!153221 (= c!131824 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!628211 () (_ BitVec 64))

(assert (=> d!153221 (= lt!628211 (select (arr!46978 a!2831) index!585))))

(assert (=> d!153221 (validMask!0 mask!2608)))

(assert (=> d!153221 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46978 a!2831) j!81) a!2831 mask!2608) lt!628210)))

(declare-fun b!1426560 () Bool)

(assert (=> b!1426560 (and (bvsge (index!47422 lt!628210) #b00000000000000000000000000000000) (bvslt (index!47422 lt!628210) (size!47528 a!2831)))))

(declare-fun res!961892 () Bool)

(assert (=> b!1426560 (= res!961892 (= (select (arr!46978 a!2831) (index!47422 lt!628210)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!805794 () Bool)

(assert (=> b!1426560 (=> res!961892 e!805794)))

(declare-fun b!1426561 () Bool)

(declare-fun e!805793 () SeekEntryResult!11257)

(assert (=> b!1426561 (= e!805793 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) (select (arr!46978 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1426562 () Bool)

(assert (=> b!1426562 (= e!805796 e!805793)))

(declare-fun c!131823 () Bool)

(assert (=> b!1426562 (= c!131823 (or (= lt!628211 (select (arr!46978 a!2831) j!81)) (= (bvadd lt!628211 lt!628211) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1426563 () Bool)

(assert (=> b!1426563 (and (bvsge (index!47422 lt!628210) #b00000000000000000000000000000000) (bvslt (index!47422 lt!628210) (size!47528 a!2831)))))

(assert (=> b!1426563 (= e!805794 (= (select (arr!46978 a!2831) (index!47422 lt!628210)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1426564 () Bool)

(assert (=> b!1426564 (= e!805792 (bvsge (x!129043 lt!628210) #b01111111111111111111111111111110))))

(declare-fun b!1426565 () Bool)

(assert (=> b!1426565 (and (bvsge (index!47422 lt!628210) #b00000000000000000000000000000000) (bvslt (index!47422 lt!628210) (size!47528 a!2831)))))

(declare-fun res!961891 () Bool)

(assert (=> b!1426565 (= res!961891 (= (select (arr!46978 a!2831) (index!47422 lt!628210)) (select (arr!46978 a!2831) j!81)))))

(assert (=> b!1426565 (=> res!961891 e!805794)))

(declare-fun e!805795 () Bool)

(assert (=> b!1426565 (= e!805795 e!805794)))

(declare-fun b!1426567 () Bool)

(assert (=> b!1426567 (= e!805796 (Intermediate!11257 true index!585 x!605))))

(declare-fun b!1426569 () Bool)

(assert (=> b!1426569 (= e!805792 e!805795)))

(declare-fun res!961893 () Bool)

(assert (=> b!1426569 (= res!961893 (and (is-Intermediate!11257 lt!628210) (not (undefined!12069 lt!628210)) (bvslt (x!129043 lt!628210) #b01111111111111111111111111111110) (bvsge (x!129043 lt!628210) #b00000000000000000000000000000000) (bvsge (x!129043 lt!628210) x!605)))))

(assert (=> b!1426569 (=> (not res!961893) (not e!805795))))

(declare-fun b!1426570 () Bool)

(assert (=> b!1426570 (= e!805793 (Intermediate!11257 false index!585 x!605))))

(assert (= (and d!153221 c!131824) b!1426567))

(assert (= (and d!153221 (not c!131824)) b!1426562))

(assert (= (and b!1426562 c!131823) b!1426570))

(assert (= (and b!1426562 (not c!131823)) b!1426561))

(assert (= (and d!153221 c!131822) b!1426564))

(assert (= (and d!153221 (not c!131822)) b!1426569))

(assert (= (and b!1426569 res!961893) b!1426565))

(assert (= (and b!1426565 (not res!961891)) b!1426560))

(assert (= (and b!1426560 (not res!961892)) b!1426563))

(declare-fun m!1317115 () Bool)

(assert (=> b!1426563 m!1317115))

(assert (=> b!1426560 m!1317115))

(declare-fun m!1317117 () Bool)

(assert (=> b!1426561 m!1317117))

(assert (=> b!1426561 m!1317117))

(assert (=> b!1426561 m!1316997))

(declare-fun m!1317119 () Bool)

(assert (=> b!1426561 m!1317119))

(assert (=> b!1426565 m!1317115))

(declare-fun m!1317121 () Bool)

(assert (=> d!153221 m!1317121))

(assert (=> d!153221 m!1317019))

(assert (=> b!1426382 d!153221))

(declare-fun d!153223 () Bool)

(declare-fun e!805803 () Bool)

(assert (=> d!153223 e!805803))

(declare-fun c!131827 () Bool)

(declare-fun lt!628212 () SeekEntryResult!11257)

(assert (=> d!153223 (= c!131827 (and (is-Intermediate!11257 lt!628212) (undefined!12069 lt!628212)))))

(declare-fun e!805807 () SeekEntryResult!11257)

(assert (=> d!153223 (= lt!628212 e!805807)))

(declare-fun c!131829 () Bool)

(assert (=> d!153223 (= c!131829 (bvsge x!605 #b01111111111111111111111111111110))))

(declare-fun lt!628213 () (_ BitVec 64))

(assert (=> d!153223 (= lt!628213 (select (arr!46978 lt!628137) index!585))))

(assert (=> d!153223 (validMask!0 mask!2608)))

(assert (=> d!153223 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628139 lt!628137 mask!2608) lt!628212)))

(declare-fun b!1426579 () Bool)

(assert (=> b!1426579 (and (bvsge (index!47422 lt!628212) #b00000000000000000000000000000000) (bvslt (index!47422 lt!628212) (size!47528 lt!628137)))))

(declare-fun res!961901 () Bool)

(assert (=> b!1426579 (= res!961901 (= (select (arr!46978 lt!628137) (index!47422 lt!628212)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!805805 () Bool)

(assert (=> b!1426579 (=> res!961901 e!805805)))

(declare-fun b!1426580 () Bool)

(declare-fun e!805804 () SeekEntryResult!11257)

(assert (=> b!1426580 (= e!805804 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!605 #b00000000000000000000000000000001) (nextIndex!0 index!585 x!605 mask!2608) lt!628139 lt!628137 mask!2608))))

(declare-fun b!1426581 () Bool)

(assert (=> b!1426581 (= e!805807 e!805804)))

(declare-fun c!131828 () Bool)

(assert (=> b!1426581 (= c!131828 (or (= lt!628213 lt!628139) (= (bvadd lt!628213 lt!628213) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1426582 () Bool)

(assert (=> b!1426582 (and (bvsge (index!47422 lt!628212) #b00000000000000000000000000000000) (bvslt (index!47422 lt!628212) (size!47528 lt!628137)))))

(assert (=> b!1426582 (= e!805805 (= (select (arr!46978 lt!628137) (index!47422 lt!628212)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1426583 () Bool)

(assert (=> b!1426583 (= e!805803 (bvsge (x!129043 lt!628212) #b01111111111111111111111111111110))))

(declare-fun b!1426584 () Bool)

(assert (=> b!1426584 (and (bvsge (index!47422 lt!628212) #b00000000000000000000000000000000) (bvslt (index!47422 lt!628212) (size!47528 lt!628137)))))

(declare-fun res!961900 () Bool)

(assert (=> b!1426584 (= res!961900 (= (select (arr!46978 lt!628137) (index!47422 lt!628212)) lt!628139))))

(assert (=> b!1426584 (=> res!961900 e!805805)))

(declare-fun e!805806 () Bool)

(assert (=> b!1426584 (= e!805806 e!805805)))

(declare-fun b!1426585 () Bool)

(assert (=> b!1426585 (= e!805807 (Intermediate!11257 true index!585 x!605))))

(declare-fun b!1426586 () Bool)

(assert (=> b!1426586 (= e!805803 e!805806)))

(declare-fun res!961902 () Bool)

(assert (=> b!1426586 (= res!961902 (and (is-Intermediate!11257 lt!628212) (not (undefined!12069 lt!628212)) (bvslt (x!129043 lt!628212) #b01111111111111111111111111111110) (bvsge (x!129043 lt!628212) #b00000000000000000000000000000000) (bvsge (x!129043 lt!628212) x!605)))))

(assert (=> b!1426586 (=> (not res!961902) (not e!805806))))

(declare-fun b!1426587 () Bool)

(assert (=> b!1426587 (= e!805804 (Intermediate!11257 false index!585 x!605))))

(assert (= (and d!153223 c!131829) b!1426585))

(assert (= (and d!153223 (not c!131829)) b!1426581))

(assert (= (and b!1426581 c!131828) b!1426587))

(assert (= (and b!1426581 (not c!131828)) b!1426580))

(assert (= (and d!153223 c!131827) b!1426583))

(assert (= (and d!153223 (not c!131827)) b!1426586))

(assert (= (and b!1426586 res!961902) b!1426584))

(assert (= (and b!1426584 (not res!961900)) b!1426579))

(assert (= (and b!1426579 (not res!961901)) b!1426582))

(declare-fun m!1317123 () Bool)

(assert (=> b!1426582 m!1317123))

(assert (=> b!1426579 m!1317123))

(assert (=> b!1426580 m!1317117))

(assert (=> b!1426580 m!1317117))

(declare-fun m!1317125 () Bool)

(assert (=> b!1426580 m!1317125))

(assert (=> b!1426584 m!1317123))

(declare-fun m!1317127 () Bool)

(assert (=> d!153223 m!1317127))

(assert (=> d!153223 m!1317019))

(assert (=> b!1426381 d!153223))

(declare-fun b!1426628 () Bool)

(declare-fun e!805830 () SeekEntryResult!11257)

(assert (=> b!1426628 (= e!805830 Undefined!11257)))

(declare-fun b!1426629 () Bool)

(declare-fun e!805831 () SeekEntryResult!11257)

(declare-fun lt!628234 () SeekEntryResult!11257)

(assert (=> b!1426629 (= e!805831 (MissingZero!11257 (index!47422 lt!628234)))))

(declare-fun b!1426630 () Bool)

(declare-fun c!131848 () Bool)

(declare-fun lt!628233 () (_ BitVec 64))

(assert (=> b!1426630 (= c!131848 (= lt!628233 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!805832 () SeekEntryResult!11257)

(assert (=> b!1426630 (= e!805832 e!805831)))

(declare-fun b!1426631 () Bool)

(assert (=> b!1426631 (= e!805832 (Found!11257 (index!47422 lt!628234)))))

(declare-fun b!1426632 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97321 (_ BitVec 32)) SeekEntryResult!11257)

(assert (=> b!1426632 (= e!805831 (seekKeyOrZeroReturnVacant!0 (x!129043 lt!628234) (index!47422 lt!628234) (index!47422 lt!628234) (select (arr!46978 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1426633 () Bool)

(assert (=> b!1426633 (= e!805830 e!805832)))

(assert (=> b!1426633 (= lt!628233 (select (arr!46978 a!2831) (index!47422 lt!628234)))))

(declare-fun c!131846 () Bool)

(assert (=> b!1426633 (= c!131846 (= lt!628233 (select (arr!46978 a!2831) j!81)))))

(declare-fun d!153225 () Bool)

(declare-fun lt!628235 () SeekEntryResult!11257)

(assert (=> d!153225 (and (or (is-Undefined!11257 lt!628235) (not (is-Found!11257 lt!628235)) (and (bvsge (index!47421 lt!628235) #b00000000000000000000000000000000) (bvslt (index!47421 lt!628235) (size!47528 a!2831)))) (or (is-Undefined!11257 lt!628235) (is-Found!11257 lt!628235) (not (is-MissingZero!11257 lt!628235)) (and (bvsge (index!47420 lt!628235) #b00000000000000000000000000000000) (bvslt (index!47420 lt!628235) (size!47528 a!2831)))) (or (is-Undefined!11257 lt!628235) (is-Found!11257 lt!628235) (is-MissingZero!11257 lt!628235) (not (is-MissingVacant!11257 lt!628235)) (and (bvsge (index!47423 lt!628235) #b00000000000000000000000000000000) (bvslt (index!47423 lt!628235) (size!47528 a!2831)))) (or (is-Undefined!11257 lt!628235) (ite (is-Found!11257 lt!628235) (= (select (arr!46978 a!2831) (index!47421 lt!628235)) (select (arr!46978 a!2831) j!81)) (ite (is-MissingZero!11257 lt!628235) (= (select (arr!46978 a!2831) (index!47420 lt!628235)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11257 lt!628235) (= (select (arr!46978 a!2831) (index!47423 lt!628235)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!153225 (= lt!628235 e!805830)))

(declare-fun c!131847 () Bool)

(assert (=> d!153225 (= c!131847 (and (is-Intermediate!11257 lt!628234) (undefined!12069 lt!628234)))))

(assert (=> d!153225 (= lt!628234 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46978 a!2831) j!81) mask!2608) (select (arr!46978 a!2831) j!81) a!2831 mask!2608))))

(assert (=> d!153225 (validMask!0 mask!2608)))

(assert (=> d!153225 (= (seekEntryOrOpen!0 (select (arr!46978 a!2831) j!81) a!2831 mask!2608) lt!628235)))

(assert (= (and d!153225 c!131847) b!1426628))

(assert (= (and d!153225 (not c!131847)) b!1426633))

(assert (= (and b!1426633 c!131846) b!1426631))

(assert (= (and b!1426633 (not c!131846)) b!1426630))

(assert (= (and b!1426630 c!131848) b!1426629))

(assert (= (and b!1426630 (not c!131848)) b!1426632))

(assert (=> b!1426632 m!1316997))

(declare-fun m!1317161 () Bool)

(assert (=> b!1426632 m!1317161))

(declare-fun m!1317163 () Bool)

(assert (=> b!1426633 m!1317163))

(declare-fun m!1317165 () Bool)

(assert (=> d!153225 m!1317165))

(assert (=> d!153225 m!1317025))

(assert (=> d!153225 m!1316997))

(assert (=> d!153225 m!1317027))

(declare-fun m!1317167 () Bool)

(assert (=> d!153225 m!1317167))

(declare-fun m!1317169 () Bool)

(assert (=> d!153225 m!1317169))

(assert (=> d!153225 m!1316997))

(assert (=> d!153225 m!1317025))

(assert (=> d!153225 m!1317019))

(assert (=> b!1426392 d!153225))

(declare-fun b!1426634 () Bool)

(declare-fun e!805834 () Bool)

(declare-fun call!67338 () Bool)

(assert (=> b!1426634 (= e!805834 call!67338)))

(declare-fun b!1426635 () Bool)

(declare-fun e!805835 () Bool)

(assert (=> b!1426635 (= e!805835 e!805834)))

(declare-fun c!131849 () Bool)

(assert (=> b!1426635 (= c!131849 (validKeyInArray!0 (select (arr!46978 a!2831) j!81)))))

(declare-fun d!153235 () Bool)

(declare-fun res!961911 () Bool)

(assert (=> d!153235 (=> res!961911 e!805835)))

(assert (=> d!153235 (= res!961911 (bvsge j!81 (size!47528 a!2831)))))

(assert (=> d!153235 (= (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608) e!805835)))

(declare-fun b!1426636 () Bool)

(declare-fun e!805833 () Bool)

(assert (=> b!1426636 (= e!805833 call!67338)))

(declare-fun b!1426637 () Bool)

(assert (=> b!1426637 (= e!805834 e!805833)))

(declare-fun lt!628236 () (_ BitVec 64))

(assert (=> b!1426637 (= lt!628236 (select (arr!46978 a!2831) j!81))))

(declare-fun lt!628238 () Unit!48260)

(assert (=> b!1426637 (= lt!628238 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!628236 j!81))))

(assert (=> b!1426637 (arrayContainsKey!0 a!2831 lt!628236 #b00000000000000000000000000000000)))

(declare-fun lt!628237 () Unit!48260)

(assert (=> b!1426637 (= lt!628237 lt!628238)))

(declare-fun res!961912 () Bool)

(assert (=> b!1426637 (= res!961912 (= (seekEntryOrOpen!0 (select (arr!46978 a!2831) j!81) a!2831 mask!2608) (Found!11257 j!81)))))

(assert (=> b!1426637 (=> (not res!961912) (not e!805833))))

(declare-fun bm!67335 () Bool)

(assert (=> bm!67335 (= call!67338 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!81 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!153235 (not res!961911)) b!1426635))

(assert (= (and b!1426635 c!131849) b!1426637))

(assert (= (and b!1426635 (not c!131849)) b!1426634))

(assert (= (and b!1426637 res!961912) b!1426636))

(assert (= (or b!1426636 b!1426634) bm!67335))

(assert (=> b!1426635 m!1316997))

(assert (=> b!1426635 m!1316997))

(assert (=> b!1426635 m!1317029))

(assert (=> b!1426637 m!1316997))

(declare-fun m!1317171 () Bool)

(assert (=> b!1426637 m!1317171))

(declare-fun m!1317173 () Bool)

(assert (=> b!1426637 m!1317173))

(assert (=> b!1426637 m!1316997))

(assert (=> b!1426637 m!1316999))

(declare-fun m!1317175 () Bool)

(assert (=> bm!67335 m!1317175))

(assert (=> b!1426392 d!153235))

