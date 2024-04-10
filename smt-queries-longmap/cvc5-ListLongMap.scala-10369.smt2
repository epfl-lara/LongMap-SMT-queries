; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122028 () Bool)

(assert start!122028)

(declare-fun b!1416407 () Bool)

(declare-fun res!952453 () Bool)

(declare-fun e!801643 () Bool)

(assert (=> b!1416407 (=> (not res!952453) (not e!801643))))

(declare-datatypes ((array!96714 0))(
  ( (array!96715 (arr!46688 (Array (_ BitVec 32) (_ BitVec 64))) (size!47238 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96714)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416407 (= res!952453 (validKeyInArray!0 (select (arr!46688 a!2901) j!112)))))

(declare-fun res!952455 () Bool)

(assert (=> start!122028 (=> (not res!952455) (not e!801643))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122028 (= res!952455 (validMask!0 mask!2840))))

(assert (=> start!122028 e!801643))

(assert (=> start!122028 true))

(declare-fun array_inv!35716 (array!96714) Bool)

(assert (=> start!122028 (array_inv!35716 a!2901)))

(declare-fun b!1416408 () Bool)

(declare-fun res!952456 () Bool)

(assert (=> b!1416408 (=> (not res!952456) (not e!801643))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1416408 (= res!952456 (and (= (size!47238 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47238 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47238 a!2901)) (not (= i!1037 j!112))))))

(declare-fun e!801642 () Bool)

(declare-fun b!1416409 () Bool)

(declare-datatypes ((SeekEntryResult!10999 0))(
  ( (MissingZero!10999 (index!46388 (_ BitVec 32))) (Found!10999 (index!46389 (_ BitVec 32))) (Intermediate!10999 (undefined!11811 Bool) (index!46390 (_ BitVec 32)) (x!127990 (_ BitVec 32))) (Undefined!10999) (MissingVacant!10999 (index!46391 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96714 (_ BitVec 32)) SeekEntryResult!10999)

(assert (=> b!1416409 (= e!801642 (= (seekEntryOrOpen!0 (select (arr!46688 a!2901) j!112) a!2901 mask!2840) (Found!10999 j!112)))))

(declare-fun b!1416410 () Bool)

(declare-fun e!801644 () Bool)

(assert (=> b!1416410 (= e!801643 (not e!801644))))

(declare-fun res!952454 () Bool)

(assert (=> b!1416410 (=> res!952454 e!801644)))

(declare-fun lt!624950 () SeekEntryResult!10999)

(assert (=> b!1416410 (= res!952454 (or (not (is-Intermediate!10999 lt!624950)) (undefined!11811 lt!624950)))))

(assert (=> b!1416410 e!801642))

(declare-fun res!952449 () Bool)

(assert (=> b!1416410 (=> (not res!952449) (not e!801642))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96714 (_ BitVec 32)) Bool)

(assert (=> b!1416410 (= res!952449 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47972 0))(
  ( (Unit!47973) )
))
(declare-fun lt!624949 () Unit!47972)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96714 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47972)

(assert (=> b!1416410 (= lt!624949 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96714 (_ BitVec 32)) SeekEntryResult!10999)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416410 (= lt!624950 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46688 a!2901) j!112) mask!2840) (select (arr!46688 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1416411 () Bool)

(declare-fun lt!624951 () SeekEntryResult!10999)

(assert (=> b!1416411 (= e!801644 (or (= lt!624950 lt!624951) (is-Intermediate!10999 lt!624951)))))

(assert (=> b!1416411 (= lt!624951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96715 (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47238 a!2901)) mask!2840))))

(declare-fun b!1416412 () Bool)

(declare-fun res!952452 () Bool)

(assert (=> b!1416412 (=> (not res!952452) (not e!801643))))

(assert (=> b!1416412 (= res!952452 (validKeyInArray!0 (select (arr!46688 a!2901) i!1037)))))

(declare-fun b!1416413 () Bool)

(declare-fun res!952451 () Bool)

(assert (=> b!1416413 (=> (not res!952451) (not e!801643))))

(declare-datatypes ((List!33207 0))(
  ( (Nil!33204) (Cons!33203 (h!34490 (_ BitVec 64)) (t!47901 List!33207)) )
))
(declare-fun arrayNoDuplicates!0 (array!96714 (_ BitVec 32) List!33207) Bool)

(assert (=> b!1416413 (= res!952451 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33204))))

(declare-fun b!1416414 () Bool)

(declare-fun res!952450 () Bool)

(assert (=> b!1416414 (=> (not res!952450) (not e!801643))))

(assert (=> b!1416414 (= res!952450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!122028 res!952455) b!1416408))

(assert (= (and b!1416408 res!952456) b!1416412))

(assert (= (and b!1416412 res!952452) b!1416407))

(assert (= (and b!1416407 res!952453) b!1416414))

(assert (= (and b!1416414 res!952450) b!1416413))

(assert (= (and b!1416413 res!952451) b!1416410))

(assert (= (and b!1416410 res!952449) b!1416409))

(assert (= (and b!1416410 (not res!952454)) b!1416411))

(declare-fun m!1307121 () Bool)

(assert (=> b!1416409 m!1307121))

(assert (=> b!1416409 m!1307121))

(declare-fun m!1307123 () Bool)

(assert (=> b!1416409 m!1307123))

(declare-fun m!1307125 () Bool)

(assert (=> start!122028 m!1307125))

(declare-fun m!1307127 () Bool)

(assert (=> start!122028 m!1307127))

(assert (=> b!1416407 m!1307121))

(assert (=> b!1416407 m!1307121))

(declare-fun m!1307129 () Bool)

(assert (=> b!1416407 m!1307129))

(assert (=> b!1416410 m!1307121))

(declare-fun m!1307131 () Bool)

(assert (=> b!1416410 m!1307131))

(assert (=> b!1416410 m!1307121))

(declare-fun m!1307133 () Bool)

(assert (=> b!1416410 m!1307133))

(assert (=> b!1416410 m!1307131))

(assert (=> b!1416410 m!1307121))

(declare-fun m!1307135 () Bool)

(assert (=> b!1416410 m!1307135))

(declare-fun m!1307137 () Bool)

(assert (=> b!1416410 m!1307137))

(declare-fun m!1307139 () Bool)

(assert (=> b!1416413 m!1307139))

(declare-fun m!1307141 () Bool)

(assert (=> b!1416411 m!1307141))

(declare-fun m!1307143 () Bool)

(assert (=> b!1416411 m!1307143))

(assert (=> b!1416411 m!1307143))

(declare-fun m!1307145 () Bool)

(assert (=> b!1416411 m!1307145))

(assert (=> b!1416411 m!1307145))

(assert (=> b!1416411 m!1307143))

(declare-fun m!1307147 () Bool)

(assert (=> b!1416411 m!1307147))

(declare-fun m!1307149 () Bool)

(assert (=> b!1416412 m!1307149))

(assert (=> b!1416412 m!1307149))

(declare-fun m!1307151 () Bool)

(assert (=> b!1416412 m!1307151))

(declare-fun m!1307153 () Bool)

(assert (=> b!1416414 m!1307153))

(push 1)

(assert (not b!1416409))

(assert (not b!1416413))

(assert (not b!1416414))

(assert (not b!1416410))

(assert (not b!1416411))

(assert (not b!1416407))

(assert (not start!122028))

(assert (not b!1416412))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1416508 () Bool)

(declare-fun e!801697 () Bool)

(declare-fun lt!624986 () SeekEntryResult!10999)

(assert (=> b!1416508 (= e!801697 (bvsge (x!127990 lt!624986) #b01111111111111111111111111111110))))

(declare-fun b!1416509 () Bool)

(declare-fun e!801695 () Bool)

(assert (=> b!1416509 (= e!801697 e!801695)))

(declare-fun res!952521 () Bool)

(assert (=> b!1416509 (= res!952521 (and (is-Intermediate!10999 lt!624986) (not (undefined!11811 lt!624986)) (bvslt (x!127990 lt!624986) #b01111111111111111111111111111110) (bvsge (x!127990 lt!624986) #b00000000000000000000000000000000) (bvsge (x!127990 lt!624986) #b00000000000000000000000000000000)))))

(assert (=> b!1416509 (=> (not res!952521) (not e!801695))))

(declare-fun b!1416510 () Bool)

(assert (=> b!1416510 (and (bvsge (index!46390 lt!624986) #b00000000000000000000000000000000) (bvslt (index!46390 lt!624986) (size!47238 (array!96715 (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47238 a!2901)))))))

(declare-fun e!801696 () Bool)

(assert (=> b!1416510 (= e!801696 (= (select (arr!46688 (array!96715 (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47238 a!2901))) (index!46390 lt!624986)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1416511 () Bool)

(assert (=> b!1416511 (and (bvsge (index!46390 lt!624986) #b00000000000000000000000000000000) (bvslt (index!46390 lt!624986) (size!47238 (array!96715 (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47238 a!2901)))))))

(declare-fun res!952523 () Bool)

(assert (=> b!1416511 (= res!952523 (= (select (arr!46688 (array!96715 (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47238 a!2901))) (index!46390 lt!624986)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1416511 (=> res!952523 e!801696)))

(declare-fun b!1416512 () Bool)

(declare-fun e!801698 () SeekEntryResult!10999)

(declare-fun e!801694 () SeekEntryResult!10999)

(assert (=> b!1416512 (= e!801698 e!801694)))

(declare-fun c!131474 () Bool)

(declare-fun lt!624987 () (_ BitVec 64))

(assert (=> b!1416512 (= c!131474 (or (= lt!624987 (select (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!624987 lt!624987) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1416513 () Bool)

(assert (=> b!1416513 (= e!801694 (Intermediate!10999 false (toIndex!0 (select (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1416514 () Bool)

(assert (=> b!1416514 (and (bvsge (index!46390 lt!624986) #b00000000000000000000000000000000) (bvslt (index!46390 lt!624986) (size!47238 (array!96715 (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47238 a!2901)))))))

(declare-fun res!952522 () Bool)

(assert (=> b!1416514 (= res!952522 (= (select (arr!46688 (array!96715 (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47238 a!2901))) (index!46390 lt!624986)) (select (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1416514 (=> res!952522 e!801696)))

(assert (=> b!1416514 (= e!801695 e!801696)))

(declare-fun b!1416515 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416515 (= e!801694 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96715 (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47238 a!2901)) mask!2840))))

(declare-fun b!1416516 () Bool)

(assert (=> b!1416516 (= e!801698 (Intermediate!10999 true (toIndex!0 (select (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!152543 () Bool)

(assert (=> d!152543 e!801697))

(declare-fun c!131475 () Bool)

(assert (=> d!152543 (= c!131475 (and (is-Intermediate!10999 lt!624986) (undefined!11811 lt!624986)))))

(assert (=> d!152543 (= lt!624986 e!801698)))

(declare-fun c!131473 () Bool)

(assert (=> d!152543 (= c!131473 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152543 (= lt!624987 (select (arr!46688 (array!96715 (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47238 a!2901))) (toIndex!0 (select (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!152543 (validMask!0 mask!2840)))

(assert (=> d!152543 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96715 (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47238 a!2901)) mask!2840) lt!624986)))

(assert (= (and d!152543 c!131473) b!1416516))

(assert (= (and d!152543 (not c!131473)) b!1416512))

(assert (= (and b!1416512 c!131474) b!1416513))

(assert (= (and b!1416512 (not c!131474)) b!1416515))

(assert (= (and d!152543 c!131475) b!1416508))

(assert (= (and d!152543 (not c!131475)) b!1416509))

(assert (= (and b!1416509 res!952521) b!1416514))

(assert (= (and b!1416514 (not res!952522)) b!1416511))

(assert (= (and b!1416511 (not res!952523)) b!1416510))

(assert (=> b!1416515 m!1307145))

(declare-fun m!1307231 () Bool)

(assert (=> b!1416515 m!1307231))

(assert (=> b!1416515 m!1307231))

(assert (=> b!1416515 m!1307143))

(declare-fun m!1307233 () Bool)

(assert (=> b!1416515 m!1307233))

(declare-fun m!1307235 () Bool)

(assert (=> b!1416514 m!1307235))

(assert (=> d!152543 m!1307145))

(declare-fun m!1307237 () Bool)

(assert (=> d!152543 m!1307237))

(assert (=> d!152543 m!1307125))

(assert (=> b!1416511 m!1307235))

(assert (=> b!1416510 m!1307235))

(assert (=> b!1416411 d!152543))

(declare-fun d!152557 () Bool)

(declare-fun lt!624993 () (_ BitVec 32))

(declare-fun lt!624992 () (_ BitVec 32))

(assert (=> d!152557 (= lt!624993 (bvmul (bvxor lt!624992 (bvlshr lt!624992 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152557 (= lt!624992 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152557 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!952524 (let ((h!34494 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127996 (bvmul (bvxor h!34494 (bvlshr h!34494 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127996 (bvlshr x!127996 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!952524 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!952524 #b00000000000000000000000000000000))))))

(assert (=> d!152557 (= (toIndex!0 (select (store (arr!46688 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!624993 (bvlshr lt!624993 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1416411 d!152557))

(declare-fun b!1416552 () Bool)

(declare-fun e!801722 () Bool)

(declare-fun e!801720 () Bool)

(assert (=> b!1416552 (= e!801722 e!801720)))

(declare-fun c!131487 () Bool)

(assert (=> b!1416552 (= c!131487 (validKeyInArray!0 (select (arr!46688 a!2901) j!112)))))

(declare-fun b!1416553 () Bool)

(declare-fun e!801721 () Bool)

(assert (=> b!1416553 (= e!801720 e!801721)))

(declare-fun lt!625008 () (_ BitVec 64))

(assert (=> b!1416553 (= lt!625008 (select (arr!46688 a!2901) j!112))))

(declare-fun lt!625006 () Unit!47972)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96714 (_ BitVec 64) (_ BitVec 32)) Unit!47972)

(assert (=> b!1416553 (= lt!625006 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!625008 j!112))))

(declare-fun arrayContainsKey!0 (array!96714 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1416553 (arrayContainsKey!0 a!2901 lt!625008 #b00000000000000000000000000000000)))

(declare-fun lt!625007 () Unit!47972)

(assert (=> b!1416553 (= lt!625007 lt!625006)))

(declare-fun res!952538 () Bool)

(assert (=> b!1416553 (= res!952538 (= (seekEntryOrOpen!0 (select (arr!46688 a!2901) j!112) a!2901 mask!2840) (Found!10999 j!112)))))

(assert (=> b!1416553 (=> (not res!952538) (not e!801721))))

(declare-fun d!152561 () Bool)

(declare-fun res!952539 () Bool)

(assert (=> d!152561 (=> res!952539 e!801722)))

(assert (=> d!152561 (= res!952539 (bvsge j!112 (size!47238 a!2901)))))

(assert (=> d!152561 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!801722)))

(declare-fun b!1416554 () Bool)

(declare-fun call!67183 () Bool)

(assert (=> b!1416554 (= e!801721 call!67183)))

(declare-fun b!1416555 () Bool)

(assert (=> b!1416555 (= e!801720 call!67183)))

(declare-fun bm!67180 () Bool)

(assert (=> bm!67180 (= call!67183 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!152561 (not res!952539)) b!1416552))

(assert (= (and b!1416552 c!131487) b!1416553))

(assert (= (and b!1416552 (not c!131487)) b!1416555))

(assert (= (and b!1416553 res!952538) b!1416554))

(assert (= (or b!1416554 b!1416555) bm!67180))

(assert (=> b!1416552 m!1307121))

(assert (=> b!1416552 m!1307121))

(assert (=> b!1416552 m!1307129))

(assert (=> b!1416553 m!1307121))

(declare-fun m!1307241 () Bool)

(assert (=> b!1416553 m!1307241))

(declare-fun m!1307243 () Bool)

(assert (=> b!1416553 m!1307243))

(assert (=> b!1416553 m!1307121))

(assert (=> b!1416553 m!1307123))

(declare-fun m!1307247 () Bool)

(assert (=> bm!67180 m!1307247))

(assert (=> b!1416410 d!152561))

(declare-fun d!152567 () Bool)

(assert (=> d!152567 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!625013 () Unit!47972)

(declare-fun choose!38 (array!96714 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47972)

(assert (=> d!152567 (= lt!625013 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152567 (validMask!0 mask!2840)))

(assert (=> d!152567 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!625013)))

(declare-fun bs!41294 () Bool)

(assert (= bs!41294 d!152567))

(assert (=> bs!41294 m!1307137))

(declare-fun m!1307253 () Bool)

(assert (=> bs!41294 m!1307253))

(assert (=> bs!41294 m!1307125))

(assert (=> b!1416410 d!152567))

(declare-fun b!1416556 () Bool)

(declare-fun e!801726 () Bool)

(declare-fun lt!625016 () SeekEntryResult!10999)

(assert (=> b!1416556 (= e!801726 (bvsge (x!127990 lt!625016) #b01111111111111111111111111111110))))

(declare-fun b!1416557 () Bool)

(declare-fun e!801724 () Bool)

(assert (=> b!1416557 (= e!801726 e!801724)))

(declare-fun res!952541 () Bool)

(assert (=> b!1416557 (= res!952541 (and (is-Intermediate!10999 lt!625016) (not (undefined!11811 lt!625016)) (bvslt (x!127990 lt!625016) #b01111111111111111111111111111110) (bvsge (x!127990 lt!625016) #b00000000000000000000000000000000) (bvsge (x!127990 lt!625016) #b00000000000000000000000000000000)))))

(assert (=> b!1416557 (=> (not res!952541) (not e!801724))))

(declare-fun b!1416558 () Bool)

(assert (=> b!1416558 (and (bvsge (index!46390 lt!625016) #b00000000000000000000000000000000) (bvslt (index!46390 lt!625016) (size!47238 a!2901)))))

(declare-fun e!801725 () Bool)

(assert (=> b!1416558 (= e!801725 (= (select (arr!46688 a!2901) (index!46390 lt!625016)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1416559 () Bool)

(assert (=> b!1416559 (and (bvsge (index!46390 lt!625016) #b00000000000000000000000000000000) (bvslt (index!46390 lt!625016) (size!47238 a!2901)))))

(declare-fun res!952543 () Bool)

(assert (=> b!1416559 (= res!952543 (= (select (arr!46688 a!2901) (index!46390 lt!625016)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1416559 (=> res!952543 e!801725)))

(declare-fun b!1416560 () Bool)

(declare-fun e!801727 () SeekEntryResult!10999)

(declare-fun e!801723 () SeekEntryResult!10999)

(assert (=> b!1416560 (= e!801727 e!801723)))

(declare-fun c!131489 () Bool)

(declare-fun lt!625017 () (_ BitVec 64))

(assert (=> b!1416560 (= c!131489 (or (= lt!625017 (select (arr!46688 a!2901) j!112)) (= (bvadd lt!625017 lt!625017) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1416561 () Bool)

(assert (=> b!1416561 (= e!801723 (Intermediate!10999 false (toIndex!0 (select (arr!46688 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1416562 () Bool)

(assert (=> b!1416562 (and (bvsge (index!46390 lt!625016) #b00000000000000000000000000000000) (bvslt (index!46390 lt!625016) (size!47238 a!2901)))))

(declare-fun res!952542 () Bool)

(assert (=> b!1416562 (= res!952542 (= (select (arr!46688 a!2901) (index!46390 lt!625016)) (select (arr!46688 a!2901) j!112)))))

(assert (=> b!1416562 (=> res!952542 e!801725)))

(assert (=> b!1416562 (= e!801724 e!801725)))

(declare-fun b!1416563 () Bool)

(assert (=> b!1416563 (= e!801723 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46688 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46688 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1416564 () Bool)

(assert (=> b!1416564 (= e!801727 (Intermediate!10999 true (toIndex!0 (select (arr!46688 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!152571 () Bool)

(assert (=> d!152571 e!801726))

(declare-fun c!131490 () Bool)

(assert (=> d!152571 (= c!131490 (and (is-Intermediate!10999 lt!625016) (undefined!11811 lt!625016)))))

(assert (=> d!152571 (= lt!625016 e!801727)))

(declare-fun c!131488 () Bool)

(assert (=> d!152571 (= c!131488 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152571 (= lt!625017 (select (arr!46688 a!2901) (toIndex!0 (select (arr!46688 a!2901) j!112) mask!2840)))))

(assert (=> d!152571 (validMask!0 mask!2840)))

(assert (=> d!152571 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46688 a!2901) j!112) mask!2840) (select (arr!46688 a!2901) j!112) a!2901 mask!2840) lt!625016)))

(assert (= (and d!152571 c!131488) b!1416564))

(assert (= (and d!152571 (not c!131488)) b!1416560))

(assert (= (and b!1416560 c!131489) b!1416561))

(assert (= (and b!1416560 (not c!131489)) b!1416563))

(assert (= (and d!152571 c!131490) b!1416556))

(assert (= (and d!152571 (not c!131490)) b!1416557))

(assert (= (and b!1416557 res!952541) b!1416562))

(assert (= (and b!1416562 (not res!952542)) b!1416559))

(assert (= (and b!1416559 (not res!952543)) b!1416558))

(assert (=> b!1416563 m!1307131))

(declare-fun m!1307255 () Bool)

(assert (=> b!1416563 m!1307255))

(assert (=> b!1416563 m!1307255))

(assert (=> b!1416563 m!1307121))

(declare-fun m!1307257 () Bool)

(assert (=> b!1416563 m!1307257))

(declare-fun m!1307259 () Bool)

(assert (=> b!1416562 m!1307259))

(assert (=> d!152571 m!1307131))

(declare-fun m!1307261 () Bool)

(assert (=> d!152571 m!1307261))

(assert (=> d!152571 m!1307125))

(assert (=> b!1416559 m!1307259))

(assert (=> b!1416558 m!1307259))

(assert (=> b!1416410 d!152571))

(declare-fun d!152575 () Bool)

(declare-fun lt!625021 () (_ BitVec 32))

(declare-fun lt!625020 () (_ BitVec 32))

(assert (=> d!152575 (= lt!625021 (bvmul (bvxor lt!625020 (bvlshr lt!625020 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152575 (= lt!625020 ((_ extract 31 0) (bvand (bvxor (select (arr!46688 a!2901) j!112) (bvlshr (select (arr!46688 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152575 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!952524 (let ((h!34494 ((_ extract 31 0) (bvand (bvxor (select (arr!46688 a!2901) j!112) (bvlshr (select (arr!46688 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127996 (bvmul (bvxor h!34494 (bvlshr h!34494 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127996 (bvlshr x!127996 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!952524 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!952524 #b00000000000000000000000000000000))))))

(assert (=> d!152575 (= (toIndex!0 (select (arr!46688 a!2901) j!112) mask!2840) (bvand (bvxor lt!625021 (bvlshr lt!625021 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1416410 d!152575))

(declare-fun b!1416565 () Bool)

(declare-fun e!801730 () Bool)

(declare-fun e!801728 () Bool)

(assert (=> b!1416565 (= e!801730 e!801728)))

(declare-fun c!131491 () Bool)

(assert (=> b!1416565 (= c!131491 (validKeyInArray!0 (select (arr!46688 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1416566 () Bool)

(declare-fun e!801729 () Bool)

(assert (=> b!1416566 (= e!801728 e!801729)))

(declare-fun lt!625024 () (_ BitVec 64))

(assert (=> b!1416566 (= lt!625024 (select (arr!46688 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!625022 () Unit!47972)

(assert (=> b!1416566 (= lt!625022 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!625024 #b00000000000000000000000000000000))))

(assert (=> b!1416566 (arrayContainsKey!0 a!2901 lt!625024 #b00000000000000000000000000000000)))

(declare-fun lt!625023 () Unit!47972)

(assert (=> b!1416566 (= lt!625023 lt!625022)))

(declare-fun res!952544 () Bool)

(assert (=> b!1416566 (= res!952544 (= (seekEntryOrOpen!0 (select (arr!46688 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10999 #b00000000000000000000000000000000)))))

(assert (=> b!1416566 (=> (not res!952544) (not e!801729))))

(declare-fun d!152577 () Bool)

(declare-fun res!952545 () Bool)

(assert (=> d!152577 (=> res!952545 e!801730)))

(assert (=> d!152577 (= res!952545 (bvsge #b00000000000000000000000000000000 (size!47238 a!2901)))))

(assert (=> d!152577 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!801730)))

(declare-fun b!1416567 () Bool)

(declare-fun call!67184 () Bool)

(assert (=> b!1416567 (= e!801729 call!67184)))

(declare-fun b!1416568 () Bool)

(assert (=> b!1416568 (= e!801728 call!67184)))

(declare-fun bm!67181 () Bool)

(assert (=> bm!67181 (= call!67184 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!152577 (not res!952545)) b!1416565))

(assert (= (and b!1416565 c!131491) b!1416566))

(assert (= (and b!1416565 (not c!131491)) b!1416568))

(assert (= (and b!1416566 res!952544) b!1416567))

(assert (= (or b!1416567 b!1416568) bm!67181))

(declare-fun m!1307263 () Bool)

(assert (=> b!1416565 m!1307263))

(assert (=> b!1416565 m!1307263))

(declare-fun m!1307265 () Bool)

(assert (=> b!1416565 m!1307265))

(assert (=> b!1416566 m!1307263))

(declare-fun m!1307267 () Bool)

(assert (=> b!1416566 m!1307267))

(declare-fun m!1307269 () Bool)

(assert (=> b!1416566 m!1307269))

(assert (=> b!1416566 m!1307263))

(declare-fun m!1307271 () Bool)

(assert (=> b!1416566 m!1307271))

(declare-fun m!1307273 () Bool)

(assert (=> bm!67181 m!1307273))

(assert (=> b!1416414 d!152577))

(declare-fun d!152579 () Bool)

(assert (=> d!152579 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!122028 d!152579))

(declare-fun d!152587 () Bool)

(assert (=> d!152587 (= (array_inv!35716 a!2901) (bvsge (size!47238 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!122028 d!152587))

(declare-fun b!1416679 () Bool)

(declare-fun e!801804 () SeekEntryResult!10999)

(declare-fun lt!625078 () SeekEntryResult!10999)

(assert (=> b!1416679 (= e!801804 (Found!10999 (index!46390 lt!625078)))))

(declare-fun b!1416680 () Bool)

(declare-fun e!801806 () SeekEntryResult!10999)

(assert (=> b!1416680 (= e!801806 (MissingZero!10999 (index!46390 lt!625078)))))

(declare-fun b!1416681 () Bool)

(declare-fun e!801805 () SeekEntryResult!10999)

(assert (=> b!1416681 (= e!801805 e!801804)))

(declare-fun lt!625080 () (_ BitVec 64))

(assert (=> b!1416681 (= lt!625080 (select (arr!46688 a!2901) (index!46390 lt!625078)))))

(declare-fun c!131529 () Bool)

(assert (=> b!1416681 (= c!131529 (= lt!625080 (select (arr!46688 a!2901) j!112)))))

(declare-fun b!1416682 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96714 (_ BitVec 32)) SeekEntryResult!10999)

(assert (=> b!1416682 (= e!801806 (seekKeyOrZeroReturnVacant!0 (x!127990 lt!625078) (index!46390 lt!625078) (index!46390 lt!625078) (select (arr!46688 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1416683 () Bool)

(declare-fun c!131528 () Bool)

(assert (=> b!1416683 (= c!131528 (= lt!625080 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1416683 (= e!801804 e!801806)))

(declare-fun b!1416684 () Bool)

(assert (=> b!1416684 (= e!801805 Undefined!10999)))

(declare-fun d!152589 () Bool)

(declare-fun lt!625079 () SeekEntryResult!10999)

(assert (=> d!152589 (and (or (is-Undefined!10999 lt!625079) (not (is-Found!10999 lt!625079)) (and (bvsge (index!46389 lt!625079) #b00000000000000000000000000000000) (bvslt (index!46389 lt!625079) (size!47238 a!2901)))) (or (is-Undefined!10999 lt!625079) (is-Found!10999 lt!625079) (not (is-MissingZero!10999 lt!625079)) (and (bvsge (index!46388 lt!625079) #b00000000000000000000000000000000) (bvslt (index!46388 lt!625079) (size!47238 a!2901)))) (or (is-Undefined!10999 lt!625079) (is-Found!10999 lt!625079) (is-MissingZero!10999 lt!625079) (not (is-MissingVacant!10999 lt!625079)) (and (bvsge (index!46391 lt!625079) #b00000000000000000000000000000000) (bvslt (index!46391 lt!625079) (size!47238 a!2901)))) (or (is-Undefined!10999 lt!625079) (ite (is-Found!10999 lt!625079) (= (select (arr!46688 a!2901) (index!46389 lt!625079)) (select (arr!46688 a!2901) j!112)) (ite (is-MissingZero!10999 lt!625079) (= (select (arr!46688 a!2901) (index!46388 lt!625079)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10999 lt!625079) (= (select (arr!46688 a!2901) (index!46391 lt!625079)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!152589 (= lt!625079 e!801805)))

(declare-fun c!131527 () Bool)

(assert (=> d!152589 (= c!131527 (and (is-Intermediate!10999 lt!625078) (undefined!11811 lt!625078)))))

(assert (=> d!152589 (= lt!625078 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46688 a!2901) j!112) mask!2840) (select (arr!46688 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152589 (validMask!0 mask!2840)))

(assert (=> d!152589 (= (seekEntryOrOpen!0 (select (arr!46688 a!2901) j!112) a!2901 mask!2840) lt!625079)))

(assert (= (and d!152589 c!131527) b!1416684))

(assert (= (and d!152589 (not c!131527)) b!1416681))

(assert (= (and b!1416681 c!131529) b!1416679))

(assert (= (and b!1416681 (not c!131529)) b!1416683))

(assert (= (and b!1416683 c!131528) b!1416680))

(assert (= (and b!1416683 (not c!131528)) b!1416682))

(declare-fun m!1307349 () Bool)

(assert (=> b!1416681 m!1307349))

(assert (=> b!1416682 m!1307121))

(declare-fun m!1307351 () Bool)

(assert (=> b!1416682 m!1307351))

(declare-fun m!1307353 () Bool)

(assert (=> d!152589 m!1307353))

(declare-fun m!1307355 () Bool)

(assert (=> d!152589 m!1307355))

(assert (=> d!152589 m!1307131))

(assert (=> d!152589 m!1307121))

(assert (=> d!152589 m!1307135))

(declare-fun m!1307357 () Bool)

(assert (=> d!152589 m!1307357))

(assert (=> d!152589 m!1307125))

(assert (=> d!152589 m!1307121))

(assert (=> d!152589 m!1307131))

(assert (=> b!1416409 d!152589))

(declare-fun d!152611 () Bool)

(assert (=> d!152611 (= (validKeyInArray!0 (select (arr!46688 a!2901) i!1037)) (and (not (= (select (arr!46688 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46688 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1416412 d!152611))

(declare-fun d!152613 () Bool)

(assert (=> d!152613 (= (validKeyInArray!0 (select (arr!46688 a!2901) j!112)) (and (not (= (select (arr!46688 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46688 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1416407 d!152613))

(declare-fun b!1416707 () Bool)

(declare-fun e!801823 () Bool)

(declare-fun contains!9826 (List!33207 (_ BitVec 64)) Bool)

(assert (=> b!1416707 (= e!801823 (contains!9826 Nil!33204 (select (arr!46688 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1416708 () Bool)

(declare-fun e!801824 () Bool)

(declare-fun e!801822 () Bool)

(assert (=> b!1416708 (= e!801824 e!801822)))

(declare-fun res!952594 () Bool)

(assert (=> b!1416708 (=> (not res!952594) (not e!801822))))

(assert (=> b!1416708 (= res!952594 (not e!801823))))

(declare-fun res!952592 () Bool)

(assert (=> b!1416708 (=> (not res!952592) (not e!801823))))

(assert (=> b!1416708 (= res!952592 (validKeyInArray!0 (select (arr!46688 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67198 () Bool)

(declare-fun call!67201 () Bool)

(declare-fun c!131538 () Bool)

(assert (=> bm!67198 (= call!67201 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131538 (Cons!33203 (select (arr!46688 a!2901) #b00000000000000000000000000000000) Nil!33204) Nil!33204)))))

(declare-fun b!1416709 () Bool)

(declare-fun e!801821 () Bool)

(assert (=> b!1416709 (= e!801822 e!801821)))

(assert (=> b!1416709 (= c!131538 (validKeyInArray!0 (select (arr!46688 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1416710 () Bool)

(assert (=> b!1416710 (= e!801821 call!67201)))

(declare-fun b!1416711 () Bool)

(assert (=> b!1416711 (= e!801821 call!67201)))

(declare-fun d!152615 () Bool)

(declare-fun res!952593 () Bool)

(assert (=> d!152615 (=> res!952593 e!801824)))

(assert (=> d!152615 (= res!952593 (bvsge #b00000000000000000000000000000000 (size!47238 a!2901)))))

(assert (=> d!152615 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33204) e!801824)))

(assert (= (and d!152615 (not res!952593)) b!1416708))

(assert (= (and b!1416708 res!952592) b!1416707))

(assert (= (and b!1416708 res!952594) b!1416709))

(assert (= (and b!1416709 c!131538) b!1416711))

(assert (= (and b!1416709 (not c!131538)) b!1416710))

(assert (= (or b!1416711 b!1416710) bm!67198))

(assert (=> b!1416707 m!1307263))

(assert (=> b!1416707 m!1307263))

(declare-fun m!1307359 () Bool)

(assert (=> b!1416707 m!1307359))

(assert (=> b!1416708 m!1307263))

(assert (=> b!1416708 m!1307263))

(assert (=> b!1416708 m!1307265))

(assert (=> bm!67198 m!1307263))

(declare-fun m!1307361 () Bool)

(assert (=> bm!67198 m!1307361))

(assert (=> b!1416709 m!1307263))

(assert (=> b!1416709 m!1307263))

(assert (=> b!1416709 m!1307265))

(assert (=> b!1416413 d!152615))

(push 1)

