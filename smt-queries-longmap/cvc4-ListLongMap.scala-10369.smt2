; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122032 () Bool)

(assert start!122032)

(declare-fun b!1416455 () Bool)

(declare-fun res!952499 () Bool)

(declare-fun e!801665 () Bool)

(assert (=> b!1416455 (=> (not res!952499) (not e!801665))))

(declare-datatypes ((array!96718 0))(
  ( (array!96719 (arr!46690 (Array (_ BitVec 32) (_ BitVec 64))) (size!47240 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96718)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96718 (_ BitVec 32)) Bool)

(assert (=> b!1416455 (= res!952499 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!952497 () Bool)

(assert (=> start!122032 (=> (not res!952497) (not e!801665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122032 (= res!952497 (validMask!0 mask!2840))))

(assert (=> start!122032 e!801665))

(assert (=> start!122032 true))

(declare-fun array_inv!35718 (array!96718) Bool)

(assert (=> start!122032 (array_inv!35718 a!2901)))

(declare-fun b!1416456 () Bool)

(declare-fun e!801666 () Bool)

(assert (=> b!1416456 (= e!801665 (not e!801666))))

(declare-fun res!952501 () Bool)

(assert (=> b!1416456 (=> res!952501 e!801666)))

(declare-datatypes ((SeekEntryResult!11001 0))(
  ( (MissingZero!11001 (index!46396 (_ BitVec 32))) (Found!11001 (index!46397 (_ BitVec 32))) (Intermediate!11001 (undefined!11813 Bool) (index!46398 (_ BitVec 32)) (x!127992 (_ BitVec 32))) (Undefined!11001) (MissingVacant!11001 (index!46399 (_ BitVec 32))) )
))
(declare-fun lt!624967 () SeekEntryResult!11001)

(assert (=> b!1416456 (= res!952501 (or (not (is-Intermediate!11001 lt!624967)) (undefined!11813 lt!624967)))))

(declare-fun e!801667 () Bool)

(assert (=> b!1416456 e!801667))

(declare-fun res!952503 () Bool)

(assert (=> b!1416456 (=> (not res!952503) (not e!801667))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1416456 (= res!952503 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47976 0))(
  ( (Unit!47977) )
))
(declare-fun lt!624968 () Unit!47976)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96718 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47976)

(assert (=> b!1416456 (= lt!624968 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96718 (_ BitVec 32)) SeekEntryResult!11001)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416456 (= lt!624967 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46690 a!2901) j!112) mask!2840) (select (arr!46690 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1416457 () Bool)

(declare-fun lt!624969 () SeekEntryResult!11001)

(assert (=> b!1416457 (= e!801666 (or (= lt!624967 lt!624969) (is-Intermediate!11001 lt!624969)))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1416457 (= lt!624969 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96719 (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47240 a!2901)) mask!2840))))

(declare-fun b!1416458 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96718 (_ BitVec 32)) SeekEntryResult!11001)

(assert (=> b!1416458 (= e!801667 (= (seekEntryOrOpen!0 (select (arr!46690 a!2901) j!112) a!2901 mask!2840) (Found!11001 j!112)))))

(declare-fun b!1416459 () Bool)

(declare-fun res!952502 () Bool)

(assert (=> b!1416459 (=> (not res!952502) (not e!801665))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416459 (= res!952502 (validKeyInArray!0 (select (arr!46690 a!2901) j!112)))))

(declare-fun b!1416460 () Bool)

(declare-fun res!952504 () Bool)

(assert (=> b!1416460 (=> (not res!952504) (not e!801665))))

(declare-datatypes ((List!33209 0))(
  ( (Nil!33206) (Cons!33205 (h!34492 (_ BitVec 64)) (t!47903 List!33209)) )
))
(declare-fun arrayNoDuplicates!0 (array!96718 (_ BitVec 32) List!33209) Bool)

(assert (=> b!1416460 (= res!952504 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33206))))

(declare-fun b!1416461 () Bool)

(declare-fun res!952498 () Bool)

(assert (=> b!1416461 (=> (not res!952498) (not e!801665))))

(assert (=> b!1416461 (= res!952498 (and (= (size!47240 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47240 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47240 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416462 () Bool)

(declare-fun res!952500 () Bool)

(assert (=> b!1416462 (=> (not res!952500) (not e!801665))))

(assert (=> b!1416462 (= res!952500 (validKeyInArray!0 (select (arr!46690 a!2901) i!1037)))))

(assert (= (and start!122032 res!952497) b!1416461))

(assert (= (and b!1416461 res!952498) b!1416462))

(assert (= (and b!1416462 res!952500) b!1416459))

(assert (= (and b!1416459 res!952502) b!1416455))

(assert (= (and b!1416455 res!952499) b!1416460))

(assert (= (and b!1416460 res!952504) b!1416456))

(assert (= (and b!1416456 res!952503) b!1416458))

(assert (= (and b!1416456 (not res!952501)) b!1416457))

(declare-fun m!1307189 () Bool)

(assert (=> b!1416455 m!1307189))

(declare-fun m!1307191 () Bool)

(assert (=> start!122032 m!1307191))

(declare-fun m!1307193 () Bool)

(assert (=> start!122032 m!1307193))

(declare-fun m!1307195 () Bool)

(assert (=> b!1416462 m!1307195))

(assert (=> b!1416462 m!1307195))

(declare-fun m!1307197 () Bool)

(assert (=> b!1416462 m!1307197))

(declare-fun m!1307199 () Bool)

(assert (=> b!1416459 m!1307199))

(assert (=> b!1416459 m!1307199))

(declare-fun m!1307201 () Bool)

(assert (=> b!1416459 m!1307201))

(assert (=> b!1416458 m!1307199))

(assert (=> b!1416458 m!1307199))

(declare-fun m!1307203 () Bool)

(assert (=> b!1416458 m!1307203))

(declare-fun m!1307205 () Bool)

(assert (=> b!1416460 m!1307205))

(assert (=> b!1416456 m!1307199))

(declare-fun m!1307207 () Bool)

(assert (=> b!1416456 m!1307207))

(assert (=> b!1416456 m!1307199))

(declare-fun m!1307209 () Bool)

(assert (=> b!1416456 m!1307209))

(assert (=> b!1416456 m!1307207))

(assert (=> b!1416456 m!1307199))

(declare-fun m!1307211 () Bool)

(assert (=> b!1416456 m!1307211))

(declare-fun m!1307213 () Bool)

(assert (=> b!1416456 m!1307213))

(declare-fun m!1307215 () Bool)

(assert (=> b!1416457 m!1307215))

(declare-fun m!1307217 () Bool)

(assert (=> b!1416457 m!1307217))

(assert (=> b!1416457 m!1307217))

(declare-fun m!1307219 () Bool)

(assert (=> b!1416457 m!1307219))

(assert (=> b!1416457 m!1307219))

(assert (=> b!1416457 m!1307217))

(declare-fun m!1307221 () Bool)

(assert (=> b!1416457 m!1307221))

(push 1)

(assert (not start!122032))

(assert (not b!1416460))

(assert (not b!1416459))

(assert (not b!1416457))

(assert (not b!1416456))

(assert (not b!1416462))

(assert (not b!1416455))

(assert (not b!1416458))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!152545 () Bool)

(assert (=> d!152545 (= (validKeyInArray!0 (select (arr!46690 a!2901) i!1037)) (and (not (= (select (arr!46690 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46690 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1416462 d!152545))

(declare-fun d!152547 () Bool)

(assert (=> d!152547 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!122032 d!152547))

(declare-fun d!152551 () Bool)

(assert (=> d!152551 (= (array_inv!35718 a!2901) (bvsge (size!47240 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!122032 d!152551))

(declare-fun b!1416543 () Bool)

(declare-fun e!801717 () Bool)

(declare-fun e!801715 () Bool)

(assert (=> b!1416543 (= e!801717 e!801715)))

(declare-fun res!952537 () Bool)

(declare-fun lt!625005 () SeekEntryResult!11001)

(assert (=> b!1416543 (= res!952537 (and (is-Intermediate!11001 lt!625005) (not (undefined!11813 lt!625005)) (bvslt (x!127992 lt!625005) #b01111111111111111111111111111110) (bvsge (x!127992 lt!625005) #b00000000000000000000000000000000) (bvsge (x!127992 lt!625005) #b00000000000000000000000000000000)))))

(assert (=> b!1416543 (=> (not res!952537) (not e!801715))))

(declare-fun d!152553 () Bool)

(assert (=> d!152553 e!801717))

(declare-fun c!131485 () Bool)

(assert (=> d!152553 (= c!131485 (and (is-Intermediate!11001 lt!625005) (undefined!11813 lt!625005)))))

(declare-fun e!801718 () SeekEntryResult!11001)

(assert (=> d!152553 (= lt!625005 e!801718)))

(declare-fun c!131484 () Bool)

(assert (=> d!152553 (= c!131484 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!625004 () (_ BitVec 64))

(assert (=> d!152553 (= lt!625004 (select (arr!46690 (array!96719 (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47240 a!2901))) (toIndex!0 (select (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!152553 (validMask!0 mask!2840)))

(assert (=> d!152553 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96719 (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47240 a!2901)) mask!2840) lt!625005)))

(declare-fun b!1416544 () Bool)

(assert (=> b!1416544 (= e!801718 (Intermediate!11001 true (toIndex!0 (select (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1416545 () Bool)

(assert (=> b!1416545 (and (bvsge (index!46398 lt!625005) #b00000000000000000000000000000000) (bvslt (index!46398 lt!625005) (size!47240 (array!96719 (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47240 a!2901)))))))

(declare-fun res!952535 () Bool)

(assert (=> b!1416545 (= res!952535 (= (select (arr!46690 (array!96719 (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47240 a!2901))) (index!46398 lt!625005)) (select (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun e!801719 () Bool)

(assert (=> b!1416545 (=> res!952535 e!801719)))

(assert (=> b!1416545 (= e!801715 e!801719)))

(declare-fun b!1416546 () Bool)

(assert (=> b!1416546 (= e!801717 (bvsge (x!127992 lt!625005) #b01111111111111111111111111111110))))

(declare-fun b!1416547 () Bool)

(declare-fun e!801716 () SeekEntryResult!11001)

(assert (=> b!1416547 (= e!801718 e!801716)))

(declare-fun c!131486 () Bool)

(assert (=> b!1416547 (= c!131486 (or (= lt!625004 (select (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!625004 lt!625004) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1416548 () Bool)

(assert (=> b!1416548 (and (bvsge (index!46398 lt!625005) #b00000000000000000000000000000000) (bvslt (index!46398 lt!625005) (size!47240 (array!96719 (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47240 a!2901)))))))

(declare-fun res!952536 () Bool)

(assert (=> b!1416548 (= res!952536 (= (select (arr!46690 (array!96719 (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47240 a!2901))) (index!46398 lt!625005)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1416548 (=> res!952536 e!801719)))

(declare-fun b!1416549 () Bool)

(assert (=> b!1416549 (and (bvsge (index!46398 lt!625005) #b00000000000000000000000000000000) (bvslt (index!46398 lt!625005) (size!47240 (array!96719 (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47240 a!2901)))))))

(assert (=> b!1416549 (= e!801719 (= (select (arr!46690 (array!96719 (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47240 a!2901))) (index!46398 lt!625005)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1416550 () Bool)

(assert (=> b!1416550 (= e!801716 (Intermediate!11001 false (toIndex!0 (select (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1416551 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416551 (= e!801716 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96719 (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47240 a!2901)) mask!2840))))

(assert (= (and d!152553 c!131484) b!1416544))

(assert (= (and d!152553 (not c!131484)) b!1416547))

(assert (= (and b!1416547 c!131486) b!1416550))

(assert (= (and b!1416547 (not c!131486)) b!1416551))

(assert (= (and d!152553 c!131485) b!1416546))

(assert (= (and d!152553 (not c!131485)) b!1416543))

(assert (= (and b!1416543 res!952537) b!1416545))

(assert (= (and b!1416545 (not res!952535)) b!1416548))

(assert (= (and b!1416548 (not res!952536)) b!1416549))

(declare-fun m!1307239 () Bool)

(assert (=> b!1416548 m!1307239))

(assert (=> b!1416545 m!1307239))

(assert (=> b!1416549 m!1307239))

(assert (=> b!1416551 m!1307219))

(declare-fun m!1307245 () Bool)

(assert (=> b!1416551 m!1307245))

(assert (=> b!1416551 m!1307245))

(assert (=> b!1416551 m!1307217))

(declare-fun m!1307249 () Bool)

(assert (=> b!1416551 m!1307249))

(assert (=> d!152553 m!1307219))

(declare-fun m!1307251 () Bool)

(assert (=> d!152553 m!1307251))

(assert (=> d!152553 m!1307191))

(assert (=> b!1416457 d!152553))

(declare-fun d!152569 () Bool)

(declare-fun lt!625019 () (_ BitVec 32))

(declare-fun lt!625018 () (_ BitVec 32))

(assert (=> d!152569 (= lt!625019 (bvmul (bvxor lt!625018 (bvlshr lt!625018 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152569 (= lt!625018 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152569 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!952540 (let ((h!34495 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127998 (bvmul (bvxor h!34495 (bvlshr h!34495 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127998 (bvlshr x!127998 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!952540 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!952540 #b00000000000000000000000000000000))))))

(assert (=> d!152569 (= (toIndex!0 (select (store (arr!46690 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!625019 (bvlshr lt!625019 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1416457 d!152569))

(declare-fun b!1416595 () Bool)

(declare-fun e!801748 () Bool)

(declare-fun call!67187 () Bool)

(assert (=> b!1416595 (= e!801748 call!67187)))

(declare-fun b!1416596 () Bool)

(declare-fun e!801747 () Bool)

(assert (=> b!1416596 (= e!801747 e!801748)))

(declare-fun lt!625042 () (_ BitVec 64))

(assert (=> b!1416596 (= lt!625042 (select (arr!46690 a!2901) j!112))))

(declare-fun lt!625040 () Unit!47976)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96718 (_ BitVec 64) (_ BitVec 32)) Unit!47976)

(assert (=> b!1416596 (= lt!625040 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!625042 j!112))))

(declare-fun arrayContainsKey!0 (array!96718 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1416596 (arrayContainsKey!0 a!2901 lt!625042 #b00000000000000000000000000000000)))

(declare-fun lt!625041 () Unit!47976)

(assert (=> b!1416596 (= lt!625041 lt!625040)))

(declare-fun res!952550 () Bool)

(assert (=> b!1416596 (= res!952550 (= (seekEntryOrOpen!0 (select (arr!46690 a!2901) j!112) a!2901 mask!2840) (Found!11001 j!112)))))

(assert (=> b!1416596 (=> (not res!952550) (not e!801748))))

(declare-fun b!1416597 () Bool)

(assert (=> b!1416597 (= e!801747 call!67187)))

(declare-fun d!152573 () Bool)

(declare-fun res!952551 () Bool)

(declare-fun e!801746 () Bool)

(assert (=> d!152573 (=> res!952551 e!801746)))

(assert (=> d!152573 (= res!952551 (bvsge j!112 (size!47240 a!2901)))))

(assert (=> d!152573 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!801746)))

(declare-fun b!1416598 () Bool)

(assert (=> b!1416598 (= e!801746 e!801747)))

(declare-fun c!131503 () Bool)

(assert (=> b!1416598 (= c!131503 (validKeyInArray!0 (select (arr!46690 a!2901) j!112)))))

(declare-fun bm!67184 () Bool)

(assert (=> bm!67184 (= call!67187 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!152573 (not res!952551)) b!1416598))

(assert (= (and b!1416598 c!131503) b!1416596))

(assert (= (and b!1416598 (not c!131503)) b!1416597))

(assert (= (and b!1416596 res!952550) b!1416595))

(assert (= (or b!1416595 b!1416597) bm!67184))

(assert (=> b!1416596 m!1307199))

(declare-fun m!1307285 () Bool)

(assert (=> b!1416596 m!1307285))

(declare-fun m!1307287 () Bool)

(assert (=> b!1416596 m!1307287))

(assert (=> b!1416596 m!1307199))

(assert (=> b!1416596 m!1307203))

(assert (=> b!1416598 m!1307199))

(assert (=> b!1416598 m!1307199))

(assert (=> b!1416598 m!1307201))

(declare-fun m!1307289 () Bool)

(assert (=> bm!67184 m!1307289))

(assert (=> b!1416456 d!152573))

(declare-fun d!152585 () Bool)

(assert (=> d!152585 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!625051 () Unit!47976)

(declare-fun choose!38 (array!96718 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47976)

(assert (=> d!152585 (= lt!625051 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152585 (validMask!0 mask!2840)))

(assert (=> d!152585 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!625051)))

(declare-fun bs!41295 () Bool)

(assert (= bs!41295 d!152585))

(assert (=> bs!41295 m!1307213))

(declare-fun m!1307291 () Bool)

(assert (=> bs!41295 m!1307291))

(assert (=> bs!41295 m!1307191))

(assert (=> b!1416456 d!152585))

(declare-fun b!1416607 () Bool)

(declare-fun e!801757 () Bool)

(declare-fun e!801755 () Bool)

(assert (=> b!1416607 (= e!801757 e!801755)))

(declare-fun res!952558 () Bool)

(declare-fun lt!625053 () SeekEntryResult!11001)

(assert (=> b!1416607 (= res!952558 (and (is-Intermediate!11001 lt!625053) (not (undefined!11813 lt!625053)) (bvslt (x!127992 lt!625053) #b01111111111111111111111111111110) (bvsge (x!127992 lt!625053) #b00000000000000000000000000000000) (bvsge (x!127992 lt!625053) #b00000000000000000000000000000000)))))

(assert (=> b!1416607 (=> (not res!952558) (not e!801755))))

(declare-fun d!152591 () Bool)

(assert (=> d!152591 e!801757))

(declare-fun c!131507 () Bool)

(assert (=> d!152591 (= c!131507 (and (is-Intermediate!11001 lt!625053) (undefined!11813 lt!625053)))))

(declare-fun e!801758 () SeekEntryResult!11001)

(assert (=> d!152591 (= lt!625053 e!801758)))

(declare-fun c!131506 () Bool)

(assert (=> d!152591 (= c!131506 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!625052 () (_ BitVec 64))

(assert (=> d!152591 (= lt!625052 (select (arr!46690 a!2901) (toIndex!0 (select (arr!46690 a!2901) j!112) mask!2840)))))

(assert (=> d!152591 (validMask!0 mask!2840)))

(assert (=> d!152591 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46690 a!2901) j!112) mask!2840) (select (arr!46690 a!2901) j!112) a!2901 mask!2840) lt!625053)))

(declare-fun b!1416608 () Bool)

(assert (=> b!1416608 (= e!801758 (Intermediate!11001 true (toIndex!0 (select (arr!46690 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1416609 () Bool)

(assert (=> b!1416609 (and (bvsge (index!46398 lt!625053) #b00000000000000000000000000000000) (bvslt (index!46398 lt!625053) (size!47240 a!2901)))))

(declare-fun res!952556 () Bool)

(assert (=> b!1416609 (= res!952556 (= (select (arr!46690 a!2901) (index!46398 lt!625053)) (select (arr!46690 a!2901) j!112)))))

(declare-fun e!801759 () Bool)

(assert (=> b!1416609 (=> res!952556 e!801759)))

(assert (=> b!1416609 (= e!801755 e!801759)))

(declare-fun b!1416610 () Bool)

(assert (=> b!1416610 (= e!801757 (bvsge (x!127992 lt!625053) #b01111111111111111111111111111110))))

(declare-fun b!1416611 () Bool)

(declare-fun e!801756 () SeekEntryResult!11001)

(assert (=> b!1416611 (= e!801758 e!801756)))

(declare-fun c!131508 () Bool)

(assert (=> b!1416611 (= c!131508 (or (= lt!625052 (select (arr!46690 a!2901) j!112)) (= (bvadd lt!625052 lt!625052) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1416612 () Bool)

(assert (=> b!1416612 (and (bvsge (index!46398 lt!625053) #b00000000000000000000000000000000) (bvslt (index!46398 lt!625053) (size!47240 a!2901)))))

(declare-fun res!952557 () Bool)

(assert (=> b!1416612 (= res!952557 (= (select (arr!46690 a!2901) (index!46398 lt!625053)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1416612 (=> res!952557 e!801759)))

(declare-fun b!1416613 () Bool)

(assert (=> b!1416613 (and (bvsge (index!46398 lt!625053) #b00000000000000000000000000000000) (bvslt (index!46398 lt!625053) (size!47240 a!2901)))))

(assert (=> b!1416613 (= e!801759 (= (select (arr!46690 a!2901) (index!46398 lt!625053)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1416614 () Bool)

(assert (=> b!1416614 (= e!801756 (Intermediate!11001 false (toIndex!0 (select (arr!46690 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1416615 () Bool)

(assert (=> b!1416615 (= e!801756 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46690 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46690 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!152591 c!131506) b!1416608))

(assert (= (and d!152591 (not c!131506)) b!1416611))

(assert (= (and b!1416611 c!131508) b!1416614))

(assert (= (and b!1416611 (not c!131508)) b!1416615))

(assert (= (and d!152591 c!131507) b!1416610))

(assert (= (and d!152591 (not c!131507)) b!1416607))

(assert (= (and b!1416607 res!952558) b!1416609))

(assert (= (and b!1416609 (not res!952556)) b!1416612))

(assert (= (and b!1416612 (not res!952557)) b!1416613))

(declare-fun m!1307293 () Bool)

(assert (=> b!1416612 m!1307293))

(assert (=> b!1416609 m!1307293))

(assert (=> b!1416613 m!1307293))

(assert (=> b!1416615 m!1307207))

(declare-fun m!1307295 () Bool)

(assert (=> b!1416615 m!1307295))

(assert (=> b!1416615 m!1307295))

(assert (=> b!1416615 m!1307199))

(declare-fun m!1307297 () Bool)

(assert (=> b!1416615 m!1307297))

(assert (=> d!152591 m!1307207))

(declare-fun m!1307299 () Bool)

(assert (=> d!152591 m!1307299))

(assert (=> d!152591 m!1307191))

(assert (=> b!1416456 d!152591))

(declare-fun d!152593 () Bool)

(declare-fun lt!625055 () (_ BitVec 32))

(declare-fun lt!625054 () (_ BitVec 32))

(assert (=> d!152593 (= lt!625055 (bvmul (bvxor lt!625054 (bvlshr lt!625054 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152593 (= lt!625054 ((_ extract 31 0) (bvand (bvxor (select (arr!46690 a!2901) j!112) (bvlshr (select (arr!46690 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152593 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!952540 (let ((h!34495 ((_ extract 31 0) (bvand (bvxor (select (arr!46690 a!2901) j!112) (bvlshr (select (arr!46690 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127998 (bvmul (bvxor h!34495 (bvlshr h!34495 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127998 (bvlshr x!127998 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!952540 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!952540 #b00000000000000000000000000000000))))))

(assert (=> d!152593 (= (toIndex!0 (select (arr!46690 a!2901) j!112) mask!2840) (bvand (bvxor lt!625055 (bvlshr lt!625055 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1416456 d!152593))

(declare-fun b!1416639 () Bool)

(declare-fun e!801779 () Bool)

(declare-fun call!67193 () Bool)

(assert (=> b!1416639 (= e!801779 call!67193)))

(declare-fun b!1416640 () Bool)

(declare-fun e!801778 () Bool)

(declare-fun contains!9827 (List!33209 (_ BitVec 64)) Bool)

(assert (=> b!1416640 (= e!801778 (contains!9827 Nil!33206 (select (arr!46690 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1416641 () Bool)

(declare-fun e!801777 () Bool)

(assert (=> b!1416641 (= e!801777 e!801779)))

(declare-fun c!131515 () Bool)

(assert (=> b!1416641 (= c!131515 (validKeyInArray!0 (select (arr!46690 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67190 () Bool)

(assert (=> bm!67190 (= call!67193 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131515 (Cons!33205 (select (arr!46690 a!2901) #b00000000000000000000000000000000) Nil!33206) Nil!33206)))))

(declare-fun b!1416643 () Bool)

(assert (=> b!1416643 (= e!801779 call!67193)))

(declare-fun d!152595 () Bool)

(declare-fun res!952570 () Bool)

(declare-fun e!801776 () Bool)

(assert (=> d!152595 (=> res!952570 e!801776)))

(assert (=> d!152595 (= res!952570 (bvsge #b00000000000000000000000000000000 (size!47240 a!2901)))))

(assert (=> d!152595 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33206) e!801776)))

(declare-fun b!1416642 () Bool)

(assert (=> b!1416642 (= e!801776 e!801777)))

(declare-fun res!952572 () Bool)

(assert (=> b!1416642 (=> (not res!952572) (not e!801777))))

(assert (=> b!1416642 (= res!952572 (not e!801778))))

(declare-fun res!952571 () Bool)

(assert (=> b!1416642 (=> (not res!952571) (not e!801778))))

(assert (=> b!1416642 (= res!952571 (validKeyInArray!0 (select (arr!46690 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!152595 (not res!952570)) b!1416642))

(assert (= (and b!1416642 res!952571) b!1416640))

(assert (= (and b!1416642 res!952572) b!1416641))

(assert (= (and b!1416641 c!131515) b!1416643))

(assert (= (and b!1416641 (not c!131515)) b!1416639))

(assert (= (or b!1416643 b!1416639) bm!67190))

(declare-fun m!1307313 () Bool)

(assert (=> b!1416640 m!1307313))

(assert (=> b!1416640 m!1307313))

(declare-fun m!1307317 () Bool)

(assert (=> b!1416640 m!1307317))

(assert (=> b!1416641 m!1307313))

(assert (=> b!1416641 m!1307313))

(declare-fun m!1307321 () Bool)

(assert (=> b!1416641 m!1307321))

(assert (=> bm!67190 m!1307313))

(declare-fun m!1307323 () Bool)

(assert (=> bm!67190 m!1307323))

(assert (=> b!1416642 m!1307313))

(assert (=> b!1416642 m!1307313))

(assert (=> b!1416642 m!1307321))

(assert (=> b!1416460 d!152595))

(declare-fun b!1416644 () Bool)

(declare-fun e!801782 () Bool)

(declare-fun call!67194 () Bool)

(assert (=> b!1416644 (= e!801782 call!67194)))

(declare-fun b!1416645 () Bool)

(declare-fun e!801781 () Bool)

(assert (=> b!1416645 (= e!801781 e!801782)))

(declare-fun lt!625068 () (_ BitVec 64))

(assert (=> b!1416645 (= lt!625068 (select (arr!46690 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!625066 () Unit!47976)

(assert (=> b!1416645 (= lt!625066 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!625068 #b00000000000000000000000000000000))))

(assert (=> b!1416645 (arrayContainsKey!0 a!2901 lt!625068 #b00000000000000000000000000000000)))

(declare-fun lt!625067 () Unit!47976)

(assert (=> b!1416645 (= lt!625067 lt!625066)))

(declare-fun res!952573 () Bool)

(assert (=> b!1416645 (= res!952573 (= (seekEntryOrOpen!0 (select (arr!46690 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!11001 #b00000000000000000000000000000000)))))

(assert (=> b!1416645 (=> (not res!952573) (not e!801782))))

(declare-fun b!1416646 () Bool)

(assert (=> b!1416646 (= e!801781 call!67194)))

(declare-fun d!152603 () Bool)

(declare-fun res!952574 () Bool)

(declare-fun e!801780 () Bool)

(assert (=> d!152603 (=> res!952574 e!801780)))

(assert (=> d!152603 (= res!952574 (bvsge #b00000000000000000000000000000000 (size!47240 a!2901)))))

(assert (=> d!152603 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!801780)))

(declare-fun b!1416647 () Bool)

(assert (=> b!1416647 (= e!801780 e!801781)))

(declare-fun c!131516 () Bool)

(assert (=> b!1416647 (= c!131516 (validKeyInArray!0 (select (arr!46690 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67191 () Bool)

(assert (=> bm!67191 (= call!67194 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!152603 (not res!952574)) b!1416647))

(assert (= (and b!1416647 c!131516) b!1416645))

(assert (= (and b!1416647 (not c!131516)) b!1416646))

(assert (= (and b!1416645 res!952573) b!1416644))

(assert (= (or b!1416644 b!1416646) bm!67191))

(assert (=> b!1416645 m!1307313))

(declare-fun m!1307325 () Bool)

(assert (=> b!1416645 m!1307325))

(declare-fun m!1307327 () Bool)

(assert (=> b!1416645 m!1307327))

(assert (=> b!1416645 m!1307313))

(declare-fun m!1307329 () Bool)

(assert (=> b!1416645 m!1307329))

(assert (=> b!1416647 m!1307313))

(assert (=> b!1416647 m!1307313))

(assert (=> b!1416647 m!1307321))

(declare-fun m!1307331 () Bool)

(assert (=> bm!67191 m!1307331))

(assert (=> b!1416455 d!152603))

(declare-fun b!1416712 () Bool)

(declare-fun c!131539 () Bool)

(declare-fun lt!625088 () (_ BitVec 64))

(assert (=> b!1416712 (= c!131539 (= lt!625088 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!801826 () SeekEntryResult!11001)

(declare-fun e!801827 () SeekEntryResult!11001)

(assert (=> b!1416712 (= e!801826 e!801827)))

(declare-fun lt!625089 () SeekEntryResult!11001)

(declare-fun b!1416713 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96718 (_ BitVec 32)) SeekEntryResult!11001)

