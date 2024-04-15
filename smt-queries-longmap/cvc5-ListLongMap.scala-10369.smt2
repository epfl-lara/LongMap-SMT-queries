; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122028 () Bool)

(assert start!122028)

(declare-fun b!1416374 () Bool)

(declare-fun res!952471 () Bool)

(declare-fun e!801627 () Bool)

(assert (=> b!1416374 (=> (not res!952471) (not e!801627))))

(declare-datatypes ((array!96667 0))(
  ( (array!96668 (arr!46665 (Array (_ BitVec 32) (_ BitVec 64))) (size!47217 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96667)

(declare-datatypes ((List!33262 0))(
  ( (Nil!33259) (Cons!33258 (h!34545 (_ BitVec 64)) (t!47948 List!33262)) )
))
(declare-fun arrayNoDuplicates!0 (array!96667 (_ BitVec 32) List!33262) Bool)

(assert (=> b!1416374 (= res!952471 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33259))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!801629 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1416375 () Bool)

(declare-datatypes ((SeekEntryResult!11002 0))(
  ( (MissingZero!11002 (index!46400 (_ BitVec 32))) (Found!11002 (index!46401 (_ BitVec 32))) (Intermediate!11002 (undefined!11814 Bool) (index!46402 (_ BitVec 32)) (x!127990 (_ BitVec 32))) (Undefined!11002) (MissingVacant!11002 (index!46403 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96667 (_ BitVec 32)) SeekEntryResult!11002)

(assert (=> b!1416375 (= e!801629 (= (seekEntryOrOpen!0 (select (arr!46665 a!2901) j!112) a!2901 mask!2840) (Found!11002 j!112)))))

(declare-fun res!952472 () Bool)

(assert (=> start!122028 (=> (not res!952472) (not e!801627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122028 (= res!952472 (validMask!0 mask!2840))))

(assert (=> start!122028 e!801627))

(assert (=> start!122028 true))

(declare-fun array_inv!35898 (array!96667) Bool)

(assert (=> start!122028 (array_inv!35898 a!2901)))

(declare-fun b!1416376 () Bool)

(declare-fun res!952473 () Bool)

(assert (=> b!1416376 (=> (not res!952473) (not e!801627))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1416376 (= res!952473 (and (= (size!47217 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47217 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47217 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1416377 () Bool)

(declare-fun res!952467 () Bool)

(assert (=> b!1416377 (=> (not res!952467) (not e!801627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96667 (_ BitVec 32)) Bool)

(assert (=> b!1416377 (= res!952467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1416378 () Bool)

(declare-fun res!952469 () Bool)

(assert (=> b!1416378 (=> (not res!952469) (not e!801627))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1416378 (= res!952469 (validKeyInArray!0 (select (arr!46665 a!2901) j!112)))))

(declare-fun b!1416379 () Bool)

(declare-fun e!801628 () Bool)

(assert (=> b!1416379 (= e!801627 (not e!801628))))

(declare-fun res!952468 () Bool)

(assert (=> b!1416379 (=> res!952468 e!801628)))

(declare-fun lt!624777 () SeekEntryResult!11002)

(assert (=> b!1416379 (= res!952468 (or (not (is-Intermediate!11002 lt!624777)) (undefined!11814 lt!624777)))))

(assert (=> b!1416379 e!801629))

(declare-fun res!952470 () Bool)

(assert (=> b!1416379 (=> (not res!952470) (not e!801629))))

(assert (=> b!1416379 (= res!952470 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47821 0))(
  ( (Unit!47822) )
))
(declare-fun lt!624779 () Unit!47821)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96667 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47821)

(assert (=> b!1416379 (= lt!624779 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96667 (_ BitVec 32)) SeekEntryResult!11002)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416379 (= lt!624777 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46665 a!2901) j!112) mask!2840) (select (arr!46665 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1416380 () Bool)

(declare-fun res!952474 () Bool)

(assert (=> b!1416380 (=> (not res!952474) (not e!801627))))

(assert (=> b!1416380 (= res!952474 (validKeyInArray!0 (select (arr!46665 a!2901) i!1037)))))

(declare-fun b!1416381 () Bool)

(declare-fun lt!624778 () SeekEntryResult!11002)

(assert (=> b!1416381 (= e!801628 (or (= lt!624777 lt!624778) (is-Intermediate!11002 lt!624778)))))

(assert (=> b!1416381 (= lt!624778 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96668 (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47217 a!2901)) mask!2840))))

(assert (= (and start!122028 res!952472) b!1416376))

(assert (= (and b!1416376 res!952473) b!1416380))

(assert (= (and b!1416380 res!952474) b!1416378))

(assert (= (and b!1416378 res!952469) b!1416377))

(assert (= (and b!1416377 res!952467) b!1416374))

(assert (= (and b!1416374 res!952471) b!1416379))

(assert (= (and b!1416379 res!952470) b!1416375))

(assert (= (and b!1416379 (not res!952468)) b!1416381))

(declare-fun m!1306653 () Bool)

(assert (=> b!1416377 m!1306653))

(declare-fun m!1306655 () Bool)

(assert (=> b!1416375 m!1306655))

(assert (=> b!1416375 m!1306655))

(declare-fun m!1306657 () Bool)

(assert (=> b!1416375 m!1306657))

(assert (=> b!1416378 m!1306655))

(assert (=> b!1416378 m!1306655))

(declare-fun m!1306659 () Bool)

(assert (=> b!1416378 m!1306659))

(assert (=> b!1416379 m!1306655))

(declare-fun m!1306661 () Bool)

(assert (=> b!1416379 m!1306661))

(assert (=> b!1416379 m!1306655))

(declare-fun m!1306663 () Bool)

(assert (=> b!1416379 m!1306663))

(assert (=> b!1416379 m!1306661))

(assert (=> b!1416379 m!1306655))

(declare-fun m!1306665 () Bool)

(assert (=> b!1416379 m!1306665))

(declare-fun m!1306667 () Bool)

(assert (=> b!1416379 m!1306667))

(declare-fun m!1306669 () Bool)

(assert (=> start!122028 m!1306669))

(declare-fun m!1306671 () Bool)

(assert (=> start!122028 m!1306671))

(declare-fun m!1306673 () Bool)

(assert (=> b!1416374 m!1306673))

(declare-fun m!1306675 () Bool)

(assert (=> b!1416380 m!1306675))

(assert (=> b!1416380 m!1306675))

(declare-fun m!1306677 () Bool)

(assert (=> b!1416380 m!1306677))

(declare-fun m!1306679 () Bool)

(assert (=> b!1416381 m!1306679))

(declare-fun m!1306681 () Bool)

(assert (=> b!1416381 m!1306681))

(assert (=> b!1416381 m!1306681))

(declare-fun m!1306683 () Bool)

(assert (=> b!1416381 m!1306683))

(assert (=> b!1416381 m!1306683))

(assert (=> b!1416381 m!1306681))

(declare-fun m!1306685 () Bool)

(assert (=> b!1416381 m!1306685))

(push 1)

(assert (not b!1416375))

(assert (not b!1416377))

(assert (not b!1416380))

(assert (not b!1416381))

(assert (not b!1416374))

(assert (not start!122028))

(assert (not b!1416379))

(assert (not b!1416378))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1416402 () Bool)

(declare-fun e!801645 () Bool)

(declare-fun call!67166 () Bool)

(assert (=> b!1416402 (= e!801645 call!67166)))

(declare-fun b!1416403 () Bool)

(declare-fun e!801646 () Bool)

(assert (=> b!1416403 (= e!801646 e!801645)))

(declare-fun c!131440 () Bool)

(assert (=> b!1416403 (= c!131440 (validKeyInArray!0 (select (arr!46665 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1416404 () Bool)

(declare-fun e!801647 () Bool)

(assert (=> b!1416404 (= e!801647 call!67166)))

(declare-fun bm!67163 () Bool)

(assert (=> bm!67163 (= call!67166 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!152417 () Bool)

(declare-fun res!952486 () Bool)

(assert (=> d!152417 (=> res!952486 e!801646)))

(assert (=> d!152417 (= res!952486 (bvsge #b00000000000000000000000000000000 (size!47217 a!2901)))))

(assert (=> d!152417 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!801646)))

(declare-fun b!1416405 () Bool)

(assert (=> b!1416405 (= e!801645 e!801647)))

(declare-fun lt!624800 () (_ BitVec 64))

(assert (=> b!1416405 (= lt!624800 (select (arr!46665 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!624799 () Unit!47821)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96667 (_ BitVec 64) (_ BitVec 32)) Unit!47821)

(assert (=> b!1416405 (= lt!624799 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!624800 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1416405 (arrayContainsKey!0 a!2901 lt!624800 #b00000000000000000000000000000000)))

(declare-fun lt!624798 () Unit!47821)

(assert (=> b!1416405 (= lt!624798 lt!624799)))

(declare-fun res!952485 () Bool)

(assert (=> b!1416405 (= res!952485 (= (seekEntryOrOpen!0 (select (arr!46665 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!11002 #b00000000000000000000000000000000)))))

(assert (=> b!1416405 (=> (not res!952485) (not e!801647))))

(assert (= (and d!152417 (not res!952486)) b!1416403))

(assert (= (and b!1416403 c!131440) b!1416405))

(assert (= (and b!1416403 (not c!131440)) b!1416402))

(assert (= (and b!1416405 res!952485) b!1416404))

(assert (= (or b!1416404 b!1416402) bm!67163))

(declare-fun m!1306695 () Bool)

(assert (=> b!1416403 m!1306695))

(assert (=> b!1416403 m!1306695))

(declare-fun m!1306697 () Bool)

(assert (=> b!1416403 m!1306697))

(declare-fun m!1306699 () Bool)

(assert (=> bm!67163 m!1306699))

(assert (=> b!1416405 m!1306695))

(declare-fun m!1306701 () Bool)

(assert (=> b!1416405 m!1306701))

(declare-fun m!1306703 () Bool)

(assert (=> b!1416405 m!1306703))

(assert (=> b!1416405 m!1306695))

(declare-fun m!1306705 () Bool)

(assert (=> b!1416405 m!1306705))

(assert (=> b!1416377 d!152417))

(declare-fun b!1416478 () Bool)

(declare-fun e!801689 () Bool)

(declare-fun e!801691 () Bool)

(assert (=> b!1416478 (= e!801689 e!801691)))

(declare-fun res!952514 () Bool)

(declare-fun lt!624817 () SeekEntryResult!11002)

(assert (=> b!1416478 (= res!952514 (and (is-Intermediate!11002 lt!624817) (not (undefined!11814 lt!624817)) (bvslt (x!127990 lt!624817) #b01111111111111111111111111111110) (bvsge (x!127990 lt!624817) #b00000000000000000000000000000000) (bvsge (x!127990 lt!624817) #b00000000000000000000000000000000)))))

(assert (=> b!1416478 (=> (not res!952514) (not e!801691))))

(declare-fun e!801692 () SeekEntryResult!11002)

(declare-fun b!1416479 () Bool)

(assert (=> b!1416479 (= e!801692 (Intermediate!11002 false (toIndex!0 (select (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun e!801688 () SeekEntryResult!11002)

(declare-fun b!1416480 () Bool)

(assert (=> b!1416480 (= e!801688 (Intermediate!11002 true (toIndex!0 (select (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1416481 () Bool)

(assert (=> b!1416481 (= e!801689 (bvsge (x!127990 lt!624817) #b01111111111111111111111111111110))))

(declare-fun b!1416482 () Bool)

(assert (=> b!1416482 (and (bvsge (index!46402 lt!624817) #b00000000000000000000000000000000) (bvslt (index!46402 lt!624817) (size!47217 (array!96668 (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47217 a!2901)))))))

(declare-fun e!801690 () Bool)

(assert (=> b!1416482 (= e!801690 (= (select (arr!46665 (array!96668 (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47217 a!2901))) (index!46402 lt!624817)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1416483 () Bool)

(assert (=> b!1416483 (= e!801688 e!801692)))

(declare-fun c!131466 () Bool)

(declare-fun lt!624818 () (_ BitVec 64))

(assert (=> b!1416483 (= c!131466 (or (= lt!624818 (select (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!624818 lt!624818) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!152427 () Bool)

(assert (=> d!152427 e!801689))

(declare-fun c!131465 () Bool)

(assert (=> d!152427 (= c!131465 (and (is-Intermediate!11002 lt!624817) (undefined!11814 lt!624817)))))

(assert (=> d!152427 (= lt!624817 e!801688)))

(declare-fun c!131467 () Bool)

(assert (=> d!152427 (= c!131467 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152427 (= lt!624818 (select (arr!46665 (array!96668 (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47217 a!2901))) (toIndex!0 (select (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!152427 (validMask!0 mask!2840)))

(assert (=> d!152427 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96668 (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47217 a!2901)) mask!2840) lt!624817)))

(declare-fun b!1416484 () Bool)

(assert (=> b!1416484 (and (bvsge (index!46402 lt!624817) #b00000000000000000000000000000000) (bvslt (index!46402 lt!624817) (size!47217 (array!96668 (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47217 a!2901)))))))

(declare-fun res!952515 () Bool)

(assert (=> b!1416484 (= res!952515 (= (select (arr!46665 (array!96668 (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47217 a!2901))) (index!46402 lt!624817)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1416484 (=> res!952515 e!801690)))

(declare-fun b!1416485 () Bool)

(assert (=> b!1416485 (and (bvsge (index!46402 lt!624817) #b00000000000000000000000000000000) (bvslt (index!46402 lt!624817) (size!47217 (array!96668 (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47217 a!2901)))))))

(declare-fun res!952513 () Bool)

(assert (=> b!1416485 (= res!952513 (= (select (arr!46665 (array!96668 (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47217 a!2901))) (index!46402 lt!624817)) (select (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1416485 (=> res!952513 e!801690)))

(assert (=> b!1416485 (= e!801691 e!801690)))

(declare-fun b!1416486 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1416486 (= e!801692 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96668 (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47217 a!2901)) mask!2840))))

(assert (= (and d!152427 c!131467) b!1416480))

(assert (= (and d!152427 (not c!131467)) b!1416483))

(assert (= (and b!1416483 c!131466) b!1416479))

(assert (= (and b!1416483 (not c!131466)) b!1416486))

(assert (= (and d!152427 c!131465) b!1416481))

(assert (= (and d!152427 (not c!131465)) b!1416478))

(assert (= (and b!1416478 res!952514) b!1416485))

(assert (= (and b!1416485 (not res!952513)) b!1416484))

(assert (= (and b!1416484 (not res!952515)) b!1416482))

(declare-fun m!1306723 () Bool)

(assert (=> b!1416485 m!1306723))

(assert (=> d!152427 m!1306683))

(declare-fun m!1306725 () Bool)

(assert (=> d!152427 m!1306725))

(assert (=> d!152427 m!1306669))

(assert (=> b!1416484 m!1306723))

(assert (=> b!1416486 m!1306683))

(declare-fun m!1306727 () Bool)

(assert (=> b!1416486 m!1306727))

(assert (=> b!1416486 m!1306727))

(assert (=> b!1416486 m!1306681))

(declare-fun m!1306729 () Bool)

(assert (=> b!1416486 m!1306729))

(assert (=> b!1416482 m!1306723))

(assert (=> b!1416381 d!152427))

(declare-fun d!152433 () Bool)

(declare-fun lt!624836 () (_ BitVec 32))

(declare-fun lt!624835 () (_ BitVec 32))

(assert (=> d!152433 (= lt!624836 (bvmul (bvxor lt!624835 (bvlshr lt!624835 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152433 (= lt!624835 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152433 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!952516 (let ((h!34548 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127996 (bvmul (bvxor h!34548 (bvlshr h!34548 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127996 (bvlshr x!127996 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!952516 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!952516 #b00000000000000000000000000000000))))))

(assert (=> d!152433 (= (toIndex!0 (select (store (arr!46665 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!624836 (bvlshr lt!624836 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1416381 d!152433))

(declare-fun d!152443 () Bool)

(assert (=> d!152443 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!122028 d!152443))

(declare-fun d!152449 () Bool)

(assert (=> d!152449 (= (array_inv!35898 a!2901) (bvsge (size!47217 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!122028 d!152449))

(declare-fun d!152451 () Bool)

(declare-fun res!952532 () Bool)

(declare-fun e!801720 () Bool)

(assert (=> d!152451 (=> res!952532 e!801720)))

(assert (=> d!152451 (= res!952532 (bvsge #b00000000000000000000000000000000 (size!47217 a!2901)))))

(assert (=> d!152451 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33259) e!801720)))

(declare-fun b!1416524 () Bool)

(declare-fun e!801722 () Bool)

(declare-fun call!67172 () Bool)

(assert (=> b!1416524 (= e!801722 call!67172)))

(declare-fun bm!67169 () Bool)

(declare-fun c!131479 () Bool)

(assert (=> bm!67169 (= call!67172 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131479 (Cons!33258 (select (arr!46665 a!2901) #b00000000000000000000000000000000) Nil!33259) Nil!33259)))))

(declare-fun b!1416525 () Bool)

(declare-fun e!801719 () Bool)

(declare-fun contains!9790 (List!33262 (_ BitVec 64)) Bool)

(assert (=> b!1416525 (= e!801719 (contains!9790 Nil!33259 (select (arr!46665 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1416526 () Bool)

(declare-fun e!801721 () Bool)

(assert (=> b!1416526 (= e!801721 e!801722)))

(assert (=> b!1416526 (= c!131479 (validKeyInArray!0 (select (arr!46665 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1416527 () Bool)

(assert (=> b!1416527 (= e!801722 call!67172)))

(declare-fun b!1416528 () Bool)

(assert (=> b!1416528 (= e!801720 e!801721)))

(declare-fun res!952533 () Bool)

(assert (=> b!1416528 (=> (not res!952533) (not e!801721))))

(assert (=> b!1416528 (= res!952533 (not e!801719))))

(declare-fun res!952534 () Bool)

(assert (=> b!1416528 (=> (not res!952534) (not e!801719))))

(assert (=> b!1416528 (= res!952534 (validKeyInArray!0 (select (arr!46665 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!152451 (not res!952532)) b!1416528))

(assert (= (and b!1416528 res!952534) b!1416525))

(assert (= (and b!1416528 res!952533) b!1416526))

(assert (= (and b!1416526 c!131479) b!1416524))

(assert (= (and b!1416526 (not c!131479)) b!1416527))

(assert (= (or b!1416524 b!1416527) bm!67169))

(assert (=> bm!67169 m!1306695))

(declare-fun m!1306739 () Bool)

(assert (=> bm!67169 m!1306739))

(assert (=> b!1416525 m!1306695))

(assert (=> b!1416525 m!1306695))

(declare-fun m!1306741 () Bool)

(assert (=> b!1416525 m!1306741))

(assert (=> b!1416526 m!1306695))

(assert (=> b!1416526 m!1306695))

(assert (=> b!1416526 m!1306697))

(assert (=> b!1416528 m!1306695))

(assert (=> b!1416528 m!1306695))

(assert (=> b!1416528 m!1306697))

(assert (=> b!1416374 d!152451))

(declare-fun d!152455 () Bool)

(declare-fun lt!624867 () SeekEntryResult!11002)

(assert (=> d!152455 (and (or (is-Undefined!11002 lt!624867) (not (is-Found!11002 lt!624867)) (and (bvsge (index!46401 lt!624867) #b00000000000000000000000000000000) (bvslt (index!46401 lt!624867) (size!47217 a!2901)))) (or (is-Undefined!11002 lt!624867) (is-Found!11002 lt!624867) (not (is-MissingZero!11002 lt!624867)) (and (bvsge (index!46400 lt!624867) #b00000000000000000000000000000000) (bvslt (index!46400 lt!624867) (size!47217 a!2901)))) (or (is-Undefined!11002 lt!624867) (is-Found!11002 lt!624867) (is-MissingZero!11002 lt!624867) (not (is-MissingVacant!11002 lt!624867)) (and (bvsge (index!46403 lt!624867) #b00000000000000000000000000000000) (bvslt (index!46403 lt!624867) (size!47217 a!2901)))) (or (is-Undefined!11002 lt!624867) (ite (is-Found!11002 lt!624867) (= (select (arr!46665 a!2901) (index!46401 lt!624867)) (select (arr!46665 a!2901) j!112)) (ite (is-MissingZero!11002 lt!624867) (= (select (arr!46665 a!2901) (index!46400 lt!624867)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!11002 lt!624867) (= (select (arr!46665 a!2901) (index!46403 lt!624867)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!801749 () SeekEntryResult!11002)

(assert (=> d!152455 (= lt!624867 e!801749)))

(declare-fun c!131501 () Bool)

(declare-fun lt!624869 () SeekEntryResult!11002)

(assert (=> d!152455 (= c!131501 (and (is-Intermediate!11002 lt!624869) (undefined!11814 lt!624869)))))

(assert (=> d!152455 (= lt!624869 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46665 a!2901) j!112) mask!2840) (select (arr!46665 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!152455 (validMask!0 mask!2840)))

(assert (=> d!152455 (= (seekEntryOrOpen!0 (select (arr!46665 a!2901) j!112) a!2901 mask!2840) lt!624867)))

(declare-fun b!1416573 () Bool)

(declare-fun c!131500 () Bool)

(declare-fun lt!624868 () (_ BitVec 64))

(assert (=> b!1416573 (= c!131500 (= lt!624868 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!801747 () SeekEntryResult!11002)

(declare-fun e!801748 () SeekEntryResult!11002)

(assert (=> b!1416573 (= e!801747 e!801748)))

(declare-fun b!1416574 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96667 (_ BitVec 32)) SeekEntryResult!11002)

(assert (=> b!1416574 (= e!801748 (seekKeyOrZeroReturnVacant!0 (x!127990 lt!624869) (index!46402 lt!624869) (index!46402 lt!624869) (select (arr!46665 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1416575 () Bool)

(assert (=> b!1416575 (= e!801747 (Found!11002 (index!46402 lt!624869)))))

(declare-fun b!1416576 () Bool)

(assert (=> b!1416576 (= e!801748 (MissingZero!11002 (index!46402 lt!624869)))))

(declare-fun b!1416577 () Bool)

(assert (=> b!1416577 (= e!801749 Undefined!11002)))

(declare-fun b!1416578 () Bool)

(assert (=> b!1416578 (= e!801749 e!801747)))

(assert (=> b!1416578 (= lt!624868 (select (arr!46665 a!2901) (index!46402 lt!624869)))))

(declare-fun c!131502 () Bool)

(assert (=> b!1416578 (= c!131502 (= lt!624868 (select (arr!46665 a!2901) j!112)))))

(assert (= (and d!152455 c!131501) b!1416577))

(assert (= (and d!152455 (not c!131501)) b!1416578))

(assert (= (and b!1416578 c!131502) b!1416575))

(assert (= (and b!1416578 (not c!131502)) b!1416573))

(assert (= (and b!1416573 c!131500) b!1416576))

(assert (= (and b!1416573 (not c!131500)) b!1416574))

(declare-fun m!1306761 () Bool)

(assert (=> d!152455 m!1306761))

(assert (=> d!152455 m!1306661))

(assert (=> d!152455 m!1306655))

(assert (=> d!152455 m!1306665))

(declare-fun m!1306771 () Bool)

(assert (=> d!152455 m!1306771))

(assert (=> d!152455 m!1306669))

(assert (=> d!152455 m!1306655))

(assert (=> d!152455 m!1306661))

(declare-fun m!1306775 () Bool)

(assert (=> d!152455 m!1306775))

(assert (=> b!1416574 m!1306655))

(declare-fun m!1306779 () Bool)

(assert (=> b!1416574 m!1306779))

(declare-fun m!1306783 () Bool)

(assert (=> b!1416578 m!1306783))

(assert (=> b!1416375 d!152455))

(declare-fun d!152467 () Bool)

(assert (=> d!152467 (= (validKeyInArray!0 (select (arr!46665 a!2901) i!1037)) (and (not (= (select (arr!46665 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46665 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1416380 d!152467))

(declare-fun d!152473 () Bool)

(assert (=> d!152473 (= (validKeyInArray!0 (select (arr!46665 a!2901) j!112)) (and (not (= (select (arr!46665 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46665 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1416378 d!152473))

(declare-fun b!1416591 () Bool)

(declare-fun e!801759 () Bool)

(declare-fun call!67178 () Bool)

(assert (=> b!1416591 (= e!801759 call!67178)))

(declare-fun b!1416592 () Bool)

(declare-fun e!801760 () Bool)

(assert (=> b!1416592 (= e!801760 e!801759)))

(declare-fun c!131506 () Bool)

(assert (=> b!1416592 (= c!131506 (validKeyInArray!0 (select (arr!46665 a!2901) j!112)))))

(declare-fun b!1416593 () Bool)

(declare-fun e!801761 () Bool)

(assert (=> b!1416593 (= e!801761 call!67178)))

(declare-fun bm!67175 () Bool)

(assert (=> bm!67175 (= call!67178 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!152475 () Bool)

(declare-fun res!952546 () Bool)

(assert (=> d!152475 (=> res!952546 e!801760)))

(assert (=> d!152475 (= res!952546 (bvsge j!112 (size!47217 a!2901)))))

(assert (=> d!152475 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!801760)))

(declare-fun b!1416594 () Bool)

(assert (=> b!1416594 (= e!801759 e!801761)))

(declare-fun lt!624881 () (_ BitVec 64))

(assert (=> b!1416594 (= lt!624881 (select (arr!46665 a!2901) j!112))))

(declare-fun lt!624880 () Unit!47821)

(assert (=> b!1416594 (= lt!624880 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!624881 j!112))))

(assert (=> b!1416594 (arrayContainsKey!0 a!2901 lt!624881 #b00000000000000000000000000000000)))

(declare-fun lt!624879 () Unit!47821)

(assert (=> b!1416594 (= lt!624879 lt!624880)))

(declare-fun res!952545 () Bool)

(assert (=> b!1416594 (= res!952545 (= (seekEntryOrOpen!0 (select (arr!46665 a!2901) j!112) a!2901 mask!2840) (Found!11002 j!112)))))

(assert (=> b!1416594 (=> (not res!952545) (not e!801761))))

(assert (= (and d!152475 (not res!952546)) b!1416592))

(assert (= (and b!1416592 c!131506) b!1416594))

(assert (= (and b!1416592 (not c!131506)) b!1416591))

(assert (= (and b!1416594 res!952545) b!1416593))

(assert (= (or b!1416593 b!1416591) bm!67175))

(assert (=> b!1416592 m!1306655))

(assert (=> b!1416592 m!1306655))

(assert (=> b!1416592 m!1306659))

(declare-fun m!1306799 () Bool)

(assert (=> bm!67175 m!1306799))

(assert (=> b!1416594 m!1306655))

(declare-fun m!1306801 () Bool)

(assert (=> b!1416594 m!1306801))

(declare-fun m!1306803 () Bool)

(assert (=> b!1416594 m!1306803))

(assert (=> b!1416594 m!1306655))

(assert (=> b!1416594 m!1306657))

(assert (=> b!1416379 d!152475))

(declare-fun d!152477 () Bool)

(assert (=> d!152477 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!624893 () Unit!47821)

(declare-fun choose!38 (array!96667 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47821)

(assert (=> d!152477 (= lt!624893 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!152477 (validMask!0 mask!2840)))

(assert (=> d!152477 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!624893)))

(declare-fun bs!41268 () Bool)

(assert (= bs!41268 d!152477))

(assert (=> bs!41268 m!1306667))

(declare-fun m!1306821 () Bool)

(assert (=> bs!41268 m!1306821))

(assert (=> bs!41268 m!1306669))

(assert (=> b!1416379 d!152477))

(declare-fun b!1416613 () Bool)

(declare-fun e!801773 () Bool)

(declare-fun e!801775 () Bool)

(assert (=> b!1416613 (= e!801773 e!801775)))

(declare-fun res!952554 () Bool)

(declare-fun lt!624896 () SeekEntryResult!11002)

(assert (=> b!1416613 (= res!952554 (and (is-Intermediate!11002 lt!624896) (not (undefined!11814 lt!624896)) (bvslt (x!127990 lt!624896) #b01111111111111111111111111111110) (bvsge (x!127990 lt!624896) #b00000000000000000000000000000000) (bvsge (x!127990 lt!624896) #b00000000000000000000000000000000)))))

(assert (=> b!1416613 (=> (not res!952554) (not e!801775))))

(declare-fun b!1416614 () Bool)

(declare-fun e!801776 () SeekEntryResult!11002)

(assert (=> b!1416614 (= e!801776 (Intermediate!11002 false (toIndex!0 (select (arr!46665 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1416615 () Bool)

(declare-fun e!801772 () SeekEntryResult!11002)

(assert (=> b!1416615 (= e!801772 (Intermediate!11002 true (toIndex!0 (select (arr!46665 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1416616 () Bool)

(assert (=> b!1416616 (= e!801773 (bvsge (x!127990 lt!624896) #b01111111111111111111111111111110))))

(declare-fun b!1416617 () Bool)

(assert (=> b!1416617 (and (bvsge (index!46402 lt!624896) #b00000000000000000000000000000000) (bvslt (index!46402 lt!624896) (size!47217 a!2901)))))

(declare-fun e!801774 () Bool)

(assert (=> b!1416617 (= e!801774 (= (select (arr!46665 a!2901) (index!46402 lt!624896)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1416618 () Bool)

(assert (=> b!1416618 (= e!801772 e!801776)))

(declare-fun c!131514 () Bool)

(declare-fun lt!624897 () (_ BitVec 64))

(assert (=> b!1416618 (= c!131514 (or (= lt!624897 (select (arr!46665 a!2901) j!112)) (= (bvadd lt!624897 lt!624897) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!152483 () Bool)

(assert (=> d!152483 e!801773))

(declare-fun c!131513 () Bool)

(assert (=> d!152483 (= c!131513 (and (is-Intermediate!11002 lt!624896) (undefined!11814 lt!624896)))))

(assert (=> d!152483 (= lt!624896 e!801772)))

(declare-fun c!131515 () Bool)

(assert (=> d!152483 (= c!131515 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152483 (= lt!624897 (select (arr!46665 a!2901) (toIndex!0 (select (arr!46665 a!2901) j!112) mask!2840)))))

(assert (=> d!152483 (validMask!0 mask!2840)))

(assert (=> d!152483 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46665 a!2901) j!112) mask!2840) (select (arr!46665 a!2901) j!112) a!2901 mask!2840) lt!624896)))

(declare-fun b!1416619 () Bool)

(assert (=> b!1416619 (and (bvsge (index!46402 lt!624896) #b00000000000000000000000000000000) (bvslt (index!46402 lt!624896) (size!47217 a!2901)))))

(declare-fun res!952555 () Bool)

(assert (=> b!1416619 (= res!952555 (= (select (arr!46665 a!2901) (index!46402 lt!624896)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1416619 (=> res!952555 e!801774)))

(declare-fun b!1416620 () Bool)

(assert (=> b!1416620 (and (bvsge (index!46402 lt!624896) #b00000000000000000000000000000000) (bvslt (index!46402 lt!624896) (size!47217 a!2901)))))

(declare-fun res!952553 () Bool)

(assert (=> b!1416620 (= res!952553 (= (select (arr!46665 a!2901) (index!46402 lt!624896)) (select (arr!46665 a!2901) j!112)))))

(assert (=> b!1416620 (=> res!952553 e!801774)))

(assert (=> b!1416620 (= e!801775 e!801774)))

(declare-fun b!1416621 () Bool)

(assert (=> b!1416621 (= e!801776 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46665 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46665 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!152483 c!131515) b!1416615))

(assert (= (and d!152483 (not c!131515)) b!1416618))

(assert (= (and b!1416618 c!131514) b!1416614))

(assert (= (and b!1416618 (not c!131514)) b!1416621))

(assert (= (and d!152483 c!131513) b!1416616))

(assert (= (and d!152483 (not c!131513)) b!1416613))

(assert (= (and b!1416613 res!952554) b!1416620))

(assert (= (and b!1416620 (not res!952553)) b!1416619))

(assert (= (and b!1416619 (not res!952555)) b!1416617))

(declare-fun m!1306825 () Bool)

(assert (=> b!1416620 m!1306825))

(assert (=> d!152483 m!1306661))

(declare-fun m!1306827 () Bool)

(assert (=> d!152483 m!1306827))

(assert (=> d!152483 m!1306669))

(assert (=> b!1416619 m!1306825))

(assert (=> b!1416621 m!1306661))

(declare-fun m!1306829 () Bool)

(assert (=> b!1416621 m!1306829))

(assert (=> b!1416621 m!1306829))

(assert (=> b!1416621 m!1306655))

(declare-fun m!1306831 () Bool)

(assert (=> b!1416621 m!1306831))

(assert (=> b!1416617 m!1306825))

(assert (=> b!1416379 d!152483))

(declare-fun d!152491 () Bool)

(declare-fun lt!624899 () (_ BitVec 32))

(declare-fun lt!624898 () (_ BitVec 32))

(assert (=> d!152491 (= lt!624899 (bvmul (bvxor lt!624898 (bvlshr lt!624898 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152491 (= lt!624898 ((_ extract 31 0) (bvand (bvxor (select (arr!46665 a!2901) j!112) (bvlshr (select (arr!46665 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152491 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!952516 (let ((h!34548 ((_ extract 31 0) (bvand (bvxor (select (arr!46665 a!2901) j!112) (bvlshr (select (arr!46665 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127996 (bvmul (bvxor h!34548 (bvlshr h!34548 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127996 (bvlshr x!127996 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!952516 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!952516 #b00000000000000000000000000000000))))))

(assert (=> d!152491 (= (toIndex!0 (select (arr!46665 a!2901) j!112) mask!2840) (bvand (bvxor lt!624899 (bvlshr lt!624899 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1416379 d!152491))

(push 1)

(assert (not b!1416525))

(assert (not b!1416486))

(assert (not bm!67175))

(assert (not bm!67169))

(assert (not b!1416403))

(assert (not d!152477))

(assert (not d!152427))

(assert (not b!1416592))

(assert (not d!152455))

(assert (not bm!67163))

(assert (not d!152483))

(assert (not b!1416621))

(assert (not b!1416594))

(assert (not b!1416526))

(assert (not b!1416405))

(assert (not b!1416574))

(assert (not b!1416528))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

