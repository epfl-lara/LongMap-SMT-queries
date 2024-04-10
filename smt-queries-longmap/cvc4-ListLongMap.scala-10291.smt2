; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120964 () Bool)

(assert start!120964)

(declare-fun b!1407136 () Bool)

(declare-fun res!945191 () Bool)

(declare-fun e!796414 () Bool)

(assert (=> b!1407136 (=> res!945191 e!796414)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96220 0))(
  ( (array!96221 (arr!46456 (Array (_ BitVec 32) (_ BitVec 64))) (size!47006 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96220)

(declare-datatypes ((SeekEntryResult!10767 0))(
  ( (MissingZero!10767 (index!45445 (_ BitVec 32))) (Found!10767 (index!45446 (_ BitVec 32))) (Intermediate!10767 (undefined!11579 Bool) (index!45447 (_ BitVec 32)) (x!127044 (_ BitVec 32))) (Undefined!10767) (MissingVacant!10767 (index!45448 (_ BitVec 32))) )
))
(declare-fun lt!619654 () SeekEntryResult!10767)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96220 (_ BitVec 32)) SeekEntryResult!10767)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407136 (= res!945191 (not (= lt!619654 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96221 (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47006 a!2901)) mask!2840))))))

(declare-fun b!1407137 () Bool)

(declare-fun res!945196 () Bool)

(declare-fun e!796415 () Bool)

(assert (=> b!1407137 (=> (not res!945196) (not e!796415))))

(assert (=> b!1407137 (= res!945196 (and (= (size!47006 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47006 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47006 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!945195 () Bool)

(assert (=> start!120964 (=> (not res!945195) (not e!796415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120964 (= res!945195 (validMask!0 mask!2840))))

(assert (=> start!120964 e!796415))

(assert (=> start!120964 true))

(declare-fun array_inv!35484 (array!96220) Bool)

(assert (=> start!120964 (array_inv!35484 a!2901)))

(declare-fun b!1407138 () Bool)

(declare-fun res!945190 () Bool)

(assert (=> b!1407138 (=> (not res!945190) (not e!796415))))

(declare-datatypes ((List!32975 0))(
  ( (Nil!32972) (Cons!32971 (h!34228 (_ BitVec 64)) (t!47669 List!32975)) )
))
(declare-fun arrayNoDuplicates!0 (array!96220 (_ BitVec 32) List!32975) Bool)

(assert (=> b!1407138 (= res!945190 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32972))))

(declare-fun b!1407139 () Bool)

(declare-fun e!796412 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96220 (_ BitVec 32)) SeekEntryResult!10767)

(assert (=> b!1407139 (= e!796412 (= (seekEntryOrOpen!0 (select (arr!46456 a!2901) j!112) a!2901 mask!2840) (Found!10767 j!112)))))

(declare-fun b!1407140 () Bool)

(assert (=> b!1407140 (= e!796415 (not e!796414))))

(declare-fun res!945188 () Bool)

(assert (=> b!1407140 (=> res!945188 e!796414)))

(assert (=> b!1407140 (= res!945188 (or (not (is-Intermediate!10767 lt!619654)) (undefined!11579 lt!619654)))))

(assert (=> b!1407140 e!796412))

(declare-fun res!945193 () Bool)

(assert (=> b!1407140 (=> (not res!945193) (not e!796412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96220 (_ BitVec 32)) Bool)

(assert (=> b!1407140 (= res!945193 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47508 0))(
  ( (Unit!47509) )
))
(declare-fun lt!619655 () Unit!47508)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96220 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47508)

(assert (=> b!1407140 (= lt!619655 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!619656 () (_ BitVec 32))

(assert (=> b!1407140 (= lt!619654 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!619656 (select (arr!46456 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1407140 (= lt!619656 (toIndex!0 (select (arr!46456 a!2901) j!112) mask!2840))))

(declare-fun b!1407141 () Bool)

(declare-fun res!945189 () Bool)

(assert (=> b!1407141 (=> (not res!945189) (not e!796415))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407141 (= res!945189 (validKeyInArray!0 (select (arr!46456 a!2901) j!112)))))

(declare-fun b!1407142 () Bool)

(declare-fun res!945194 () Bool)

(assert (=> b!1407142 (=> (not res!945194) (not e!796415))))

(assert (=> b!1407142 (= res!945194 (validKeyInArray!0 (select (arr!46456 a!2901) i!1037)))))

(declare-fun b!1407143 () Bool)

(assert (=> b!1407143 (= e!796414 (or (bvslt (x!127044 lt!619654) #b00000000000000000000000000000000) (bvsgt (x!127044 lt!619654) #b01111111111111111111111111111110) (and (bvsge lt!619656 #b00000000000000000000000000000000) (bvslt lt!619656 (size!47006 a!2901)))))))

(declare-fun b!1407144 () Bool)

(declare-fun res!945192 () Bool)

(assert (=> b!1407144 (=> (not res!945192) (not e!796415))))

(assert (=> b!1407144 (= res!945192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!120964 res!945195) b!1407137))

(assert (= (and b!1407137 res!945196) b!1407142))

(assert (= (and b!1407142 res!945194) b!1407141))

(assert (= (and b!1407141 res!945189) b!1407144))

(assert (= (and b!1407144 res!945192) b!1407138))

(assert (= (and b!1407138 res!945190) b!1407140))

(assert (= (and b!1407140 res!945193) b!1407139))

(assert (= (and b!1407140 (not res!945188)) b!1407136))

(assert (= (and b!1407136 (not res!945191)) b!1407143))

(declare-fun m!1296335 () Bool)

(assert (=> b!1407140 m!1296335))

(declare-fun m!1296337 () Bool)

(assert (=> b!1407140 m!1296337))

(assert (=> b!1407140 m!1296335))

(assert (=> b!1407140 m!1296335))

(declare-fun m!1296339 () Bool)

(assert (=> b!1407140 m!1296339))

(declare-fun m!1296341 () Bool)

(assert (=> b!1407140 m!1296341))

(declare-fun m!1296343 () Bool)

(assert (=> b!1407140 m!1296343))

(declare-fun m!1296345 () Bool)

(assert (=> b!1407144 m!1296345))

(declare-fun m!1296347 () Bool)

(assert (=> start!120964 m!1296347))

(declare-fun m!1296349 () Bool)

(assert (=> start!120964 m!1296349))

(declare-fun m!1296351 () Bool)

(assert (=> b!1407136 m!1296351))

(declare-fun m!1296353 () Bool)

(assert (=> b!1407136 m!1296353))

(assert (=> b!1407136 m!1296353))

(declare-fun m!1296355 () Bool)

(assert (=> b!1407136 m!1296355))

(assert (=> b!1407136 m!1296355))

(assert (=> b!1407136 m!1296353))

(declare-fun m!1296357 () Bool)

(assert (=> b!1407136 m!1296357))

(declare-fun m!1296359 () Bool)

(assert (=> b!1407142 m!1296359))

(assert (=> b!1407142 m!1296359))

(declare-fun m!1296361 () Bool)

(assert (=> b!1407142 m!1296361))

(assert (=> b!1407141 m!1296335))

(assert (=> b!1407141 m!1296335))

(declare-fun m!1296363 () Bool)

(assert (=> b!1407141 m!1296363))

(assert (=> b!1407139 m!1296335))

(assert (=> b!1407139 m!1296335))

(declare-fun m!1296365 () Bool)

(assert (=> b!1407139 m!1296365))

(declare-fun m!1296367 () Bool)

(assert (=> b!1407138 m!1296367))

(push 1)

(assert (not b!1407138))

(assert (not b!1407144))

(assert (not b!1407139))

(assert (not b!1407141))

(assert (not b!1407136))

(assert (not b!1407140))

(assert (not start!120964))

(assert (not b!1407142))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!151523 () Bool)

(declare-fun res!945227 () Bool)

(declare-fun e!796459 () Bool)

(assert (=> d!151523 (=> res!945227 e!796459)))

(assert (=> d!151523 (= res!945227 (bvsge j!112 (size!47006 a!2901)))))

(assert (=> d!151523 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!796459)))

(declare-fun bm!66976 () Bool)

(declare-fun call!66979 () Bool)

(assert (=> bm!66976 (= call!66979 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1407207 () Bool)

(declare-fun e!796460 () Bool)

(assert (=> b!1407207 (= e!796459 e!796460)))

(declare-fun c!130455 () Bool)

(assert (=> b!1407207 (= c!130455 (validKeyInArray!0 (select (arr!46456 a!2901) j!112)))))

(declare-fun b!1407208 () Bool)

(assert (=> b!1407208 (= e!796460 call!66979)))

(declare-fun b!1407209 () Bool)

(declare-fun e!796458 () Bool)

(assert (=> b!1407209 (= e!796458 call!66979)))

(declare-fun b!1407210 () Bool)

(assert (=> b!1407210 (= e!796460 e!796458)))

(declare-fun lt!619685 () (_ BitVec 64))

(assert (=> b!1407210 (= lt!619685 (select (arr!46456 a!2901) j!112))))

(declare-fun lt!619684 () Unit!47508)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96220 (_ BitVec 64) (_ BitVec 32)) Unit!47508)

(assert (=> b!1407210 (= lt!619684 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619685 j!112))))

(declare-fun arrayContainsKey!0 (array!96220 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1407210 (arrayContainsKey!0 a!2901 lt!619685 #b00000000000000000000000000000000)))

(declare-fun lt!619686 () Unit!47508)

(assert (=> b!1407210 (= lt!619686 lt!619684)))

(declare-fun res!945226 () Bool)

(assert (=> b!1407210 (= res!945226 (= (seekEntryOrOpen!0 (select (arr!46456 a!2901) j!112) a!2901 mask!2840) (Found!10767 j!112)))))

(assert (=> b!1407210 (=> (not res!945226) (not e!796458))))

(assert (= (and d!151523 (not res!945227)) b!1407207))

(assert (= (and b!1407207 c!130455) b!1407210))

(assert (= (and b!1407207 (not c!130455)) b!1407208))

(assert (= (and b!1407210 res!945226) b!1407209))

(assert (= (or b!1407209 b!1407208) bm!66976))

(declare-fun m!1296393 () Bool)

(assert (=> bm!66976 m!1296393))

(assert (=> b!1407207 m!1296335))

(assert (=> b!1407207 m!1296335))

(assert (=> b!1407207 m!1296363))

(assert (=> b!1407210 m!1296335))

(declare-fun m!1296395 () Bool)

(assert (=> b!1407210 m!1296395))

(declare-fun m!1296397 () Bool)

(assert (=> b!1407210 m!1296397))

(assert (=> b!1407210 m!1296335))

(assert (=> b!1407210 m!1296365))

(assert (=> b!1407140 d!151523))

(declare-fun d!151531 () Bool)

(assert (=> d!151531 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!619689 () Unit!47508)

(declare-fun choose!38 (array!96220 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47508)

(assert (=> d!151531 (= lt!619689 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151531 (validMask!0 mask!2840)))

(assert (=> d!151531 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!619689)))

(declare-fun bs!41015 () Bool)

(assert (= bs!41015 d!151531))

(assert (=> bs!41015 m!1296343))

(declare-fun m!1296399 () Bool)

(assert (=> bs!41015 m!1296399))

(assert (=> bs!41015 m!1296347))

(assert (=> b!1407140 d!151531))

(declare-fun b!1407283 () Bool)

(declare-fun lt!619715 () SeekEntryResult!10767)

(assert (=> b!1407283 (and (bvsge (index!45447 lt!619715) #b00000000000000000000000000000000) (bvslt (index!45447 lt!619715) (size!47006 a!2901)))))

(declare-fun e!796510 () Bool)

(assert (=> b!1407283 (= e!796510 (= (select (arr!46456 a!2901) (index!45447 lt!619715)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1407284 () Bool)

(declare-fun e!796511 () SeekEntryResult!10767)

(declare-fun e!796507 () SeekEntryResult!10767)

(assert (=> b!1407284 (= e!796511 e!796507)))

(declare-fun lt!619716 () (_ BitVec 64))

(declare-fun c!130477 () Bool)

(assert (=> b!1407284 (= c!130477 (or (= lt!619716 (select (arr!46456 a!2901) j!112)) (= (bvadd lt!619716 lt!619716) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!151533 () Bool)

(declare-fun e!796508 () Bool)

(assert (=> d!151533 e!796508))

(declare-fun c!130478 () Bool)

(assert (=> d!151533 (= c!130478 (and (is-Intermediate!10767 lt!619715) (undefined!11579 lt!619715)))))

(assert (=> d!151533 (= lt!619715 e!796511)))

(declare-fun c!130479 () Bool)

(assert (=> d!151533 (= c!130479 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151533 (= lt!619716 (select (arr!46456 a!2901) lt!619656))))

(assert (=> d!151533 (validMask!0 mask!2840)))

(assert (=> d!151533 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!619656 (select (arr!46456 a!2901) j!112) a!2901 mask!2840) lt!619715)))

(declare-fun b!1407285 () Bool)

(assert (=> b!1407285 (= e!796507 (Intermediate!10767 false lt!619656 #b00000000000000000000000000000000))))

(declare-fun b!1407286 () Bool)

(assert (=> b!1407286 (and (bvsge (index!45447 lt!619715) #b00000000000000000000000000000000) (bvslt (index!45447 lt!619715) (size!47006 a!2901)))))

(declare-fun res!945260 () Bool)

(assert (=> b!1407286 (= res!945260 (= (select (arr!46456 a!2901) (index!45447 lt!619715)) (select (arr!46456 a!2901) j!112)))))

(assert (=> b!1407286 (=> res!945260 e!796510)))

(declare-fun e!796509 () Bool)

(assert (=> b!1407286 (= e!796509 e!796510)))

(declare-fun b!1407287 () Bool)

(assert (=> b!1407287 (= e!796508 e!796509)))

(declare-fun res!945259 () Bool)

(assert (=> b!1407287 (= res!945259 (and (is-Intermediate!10767 lt!619715) (not (undefined!11579 lt!619715)) (bvslt (x!127044 lt!619715) #b01111111111111111111111111111110) (bvsge (x!127044 lt!619715) #b00000000000000000000000000000000) (bvsge (x!127044 lt!619715) #b00000000000000000000000000000000)))))

(assert (=> b!1407287 (=> (not res!945259) (not e!796509))))

(declare-fun b!1407288 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407288 (= e!796507 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!619656 #b00000000000000000000000000000000 mask!2840) (select (arr!46456 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407289 () Bool)

(assert (=> b!1407289 (= e!796508 (bvsge (x!127044 lt!619715) #b01111111111111111111111111111110))))

(declare-fun b!1407290 () Bool)

(assert (=> b!1407290 (= e!796511 (Intermediate!10767 true lt!619656 #b00000000000000000000000000000000))))

(declare-fun b!1407291 () Bool)

(assert (=> b!1407291 (and (bvsge (index!45447 lt!619715) #b00000000000000000000000000000000) (bvslt (index!45447 lt!619715) (size!47006 a!2901)))))

(declare-fun res!945261 () Bool)

(assert (=> b!1407291 (= res!945261 (= (select (arr!46456 a!2901) (index!45447 lt!619715)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1407291 (=> res!945261 e!796510)))

(assert (= (and d!151533 c!130479) b!1407290))

(assert (= (and d!151533 (not c!130479)) b!1407284))

(assert (= (and b!1407284 c!130477) b!1407285))

(assert (= (and b!1407284 (not c!130477)) b!1407288))

(assert (= (and d!151533 c!130478) b!1407289))

(assert (= (and d!151533 (not c!130478)) b!1407287))

(assert (= (and b!1407287 res!945259) b!1407286))

(assert (= (and b!1407286 (not res!945260)) b!1407291))

(assert (= (and b!1407291 (not res!945261)) b!1407283))

(declare-fun m!1296425 () Bool)

(assert (=> b!1407286 m!1296425))

(declare-fun m!1296427 () Bool)

(assert (=> d!151533 m!1296427))

(assert (=> d!151533 m!1296347))

(declare-fun m!1296429 () Bool)

(assert (=> b!1407288 m!1296429))

(assert (=> b!1407288 m!1296429))

(assert (=> b!1407288 m!1296335))

(declare-fun m!1296431 () Bool)

(assert (=> b!1407288 m!1296431))

(assert (=> b!1407283 m!1296425))

(assert (=> b!1407291 m!1296425))

(assert (=> b!1407140 d!151533))

(declare-fun d!151547 () Bool)

(declare-fun lt!619725 () (_ BitVec 32))

(declare-fun lt!619724 () (_ BitVec 32))

(assert (=> d!151547 (= lt!619725 (bvmul (bvxor lt!619724 (bvlshr lt!619724 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151547 (= lt!619724 ((_ extract 31 0) (bvand (bvxor (select (arr!46456 a!2901) j!112) (bvlshr (select (arr!46456 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151547 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945262 (let ((h!34231 ((_ extract 31 0) (bvand (bvxor (select (arr!46456 a!2901) j!112) (bvlshr (select (arr!46456 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127050 (bvmul (bvxor h!34231 (bvlshr h!34231 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127050 (bvlshr x!127050 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945262 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945262 #b00000000000000000000000000000000))))))

(assert (=> d!151547 (= (toIndex!0 (select (arr!46456 a!2901) j!112) mask!2840) (bvand (bvxor lt!619725 (bvlshr lt!619725 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1407140 d!151547))

(declare-fun b!1407296 () Bool)

(declare-fun lt!619728 () SeekEntryResult!10767)

(assert (=> b!1407296 (and (bvsge (index!45447 lt!619728) #b00000000000000000000000000000000) (bvslt (index!45447 lt!619728) (size!47006 (array!96221 (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47006 a!2901)))))))

(declare-fun e!796518 () Bool)

(assert (=> b!1407296 (= e!796518 (= (select (arr!46456 (array!96221 (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47006 a!2901))) (index!45447 lt!619728)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1407297 () Bool)

(declare-fun e!796519 () SeekEntryResult!10767)

(declare-fun e!796515 () SeekEntryResult!10767)

(assert (=> b!1407297 (= e!796519 e!796515)))

(declare-fun c!130481 () Bool)

(declare-fun lt!619729 () (_ BitVec 64))

(assert (=> b!1407297 (= c!130481 (or (= lt!619729 (select (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!619729 lt!619729) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!151553 () Bool)

(declare-fun e!796516 () Bool)

(assert (=> d!151553 e!796516))

(declare-fun c!130482 () Bool)

(assert (=> d!151553 (= c!130482 (and (is-Intermediate!10767 lt!619728) (undefined!11579 lt!619728)))))

(assert (=> d!151553 (= lt!619728 e!796519)))

(declare-fun c!130483 () Bool)

(assert (=> d!151553 (= c!130483 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151553 (= lt!619729 (select (arr!46456 (array!96221 (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47006 a!2901))) (toIndex!0 (select (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151553 (validMask!0 mask!2840)))

(assert (=> d!151553 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96221 (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47006 a!2901)) mask!2840) lt!619728)))

(declare-fun b!1407298 () Bool)

(assert (=> b!1407298 (= e!796515 (Intermediate!10767 false (toIndex!0 (select (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1407299 () Bool)

(assert (=> b!1407299 (and (bvsge (index!45447 lt!619728) #b00000000000000000000000000000000) (bvslt (index!45447 lt!619728) (size!47006 (array!96221 (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47006 a!2901)))))))

(declare-fun res!945266 () Bool)

(assert (=> b!1407299 (= res!945266 (= (select (arr!46456 (array!96221 (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47006 a!2901))) (index!45447 lt!619728)) (select (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1407299 (=> res!945266 e!796518)))

(declare-fun e!796517 () Bool)

(assert (=> b!1407299 (= e!796517 e!796518)))

(declare-fun b!1407300 () Bool)

(assert (=> b!1407300 (= e!796516 e!796517)))

(declare-fun res!945265 () Bool)

(assert (=> b!1407300 (= res!945265 (and (is-Intermediate!10767 lt!619728) (not (undefined!11579 lt!619728)) (bvslt (x!127044 lt!619728) #b01111111111111111111111111111110) (bvsge (x!127044 lt!619728) #b00000000000000000000000000000000) (bvsge (x!127044 lt!619728) #b00000000000000000000000000000000)))))

(assert (=> b!1407300 (=> (not res!945265) (not e!796517))))

(declare-fun b!1407301 () Bool)

(assert (=> b!1407301 (= e!796515 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96221 (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47006 a!2901)) mask!2840))))

(declare-fun b!1407302 () Bool)

(assert (=> b!1407302 (= e!796516 (bvsge (x!127044 lt!619728) #b01111111111111111111111111111110))))

(declare-fun b!1407303 () Bool)

(assert (=> b!1407303 (= e!796519 (Intermediate!10767 true (toIndex!0 (select (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1407304 () Bool)

(assert (=> b!1407304 (and (bvsge (index!45447 lt!619728) #b00000000000000000000000000000000) (bvslt (index!45447 lt!619728) (size!47006 (array!96221 (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47006 a!2901)))))))

(declare-fun res!945267 () Bool)

(assert (=> b!1407304 (= res!945267 (= (select (arr!46456 (array!96221 (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47006 a!2901))) (index!45447 lt!619728)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1407304 (=> res!945267 e!796518)))

(assert (= (and d!151553 c!130483) b!1407303))

(assert (= (and d!151553 (not c!130483)) b!1407297))

(assert (= (and b!1407297 c!130481) b!1407298))

(assert (= (and b!1407297 (not c!130481)) b!1407301))

(assert (= (and d!151553 c!130482) b!1407302))

(assert (= (and d!151553 (not c!130482)) b!1407300))

(assert (= (and b!1407300 res!945265) b!1407299))

(assert (= (and b!1407299 (not res!945266)) b!1407304))

(assert (= (and b!1407304 (not res!945267)) b!1407296))

(declare-fun m!1296441 () Bool)

(assert (=> b!1407299 m!1296441))

(assert (=> d!151553 m!1296355))

(declare-fun m!1296443 () Bool)

(assert (=> d!151553 m!1296443))

(assert (=> d!151553 m!1296347))

(assert (=> b!1407301 m!1296355))

(declare-fun m!1296445 () Bool)

(assert (=> b!1407301 m!1296445))

(assert (=> b!1407301 m!1296445))

(assert (=> b!1407301 m!1296353))

(declare-fun m!1296447 () Bool)

(assert (=> b!1407301 m!1296447))

(assert (=> b!1407296 m!1296441))

(assert (=> b!1407304 m!1296441))

(assert (=> b!1407136 d!151553))

(declare-fun d!151557 () Bool)

(declare-fun lt!619734 () (_ BitVec 32))

(declare-fun lt!619733 () (_ BitVec 32))

(assert (=> d!151557 (= lt!619734 (bvmul (bvxor lt!619733 (bvlshr lt!619733 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151557 (= lt!619733 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151557 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945262 (let ((h!34231 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127050 (bvmul (bvxor h!34231 (bvlshr h!34231 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127050 (bvlshr x!127050 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945262 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945262 #b00000000000000000000000000000000))))))

(assert (=> d!151557 (= (toIndex!0 (select (store (arr!46456 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!619734 (bvlshr lt!619734 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1407136 d!151557))

(declare-fun d!151559 () Bool)

(assert (=> d!151559 (= (validKeyInArray!0 (select (arr!46456 a!2901) j!112)) (and (not (= (select (arr!46456 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46456 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1407141 d!151559))

(declare-fun d!151567 () Bool)

(assert (=> d!151567 (= (validKeyInArray!0 (select (arr!46456 a!2901) i!1037)) (and (not (= (select (arr!46456 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46456 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1407142 d!151567))

(declare-fun b!1407366 () Bool)

(declare-fun e!796554 () SeekEntryResult!10767)

(declare-fun lt!619767 () SeekEntryResult!10767)

(assert (=> b!1407366 (= e!796554 (Found!10767 (index!45447 lt!619767)))))

(declare-fun d!151569 () Bool)

(declare-fun lt!619768 () SeekEntryResult!10767)

(assert (=> d!151569 (and (or (is-Undefined!10767 lt!619768) (not (is-Found!10767 lt!619768)) (and (bvsge (index!45446 lt!619768) #b00000000000000000000000000000000) (bvslt (index!45446 lt!619768) (size!47006 a!2901)))) (or (is-Undefined!10767 lt!619768) (is-Found!10767 lt!619768) (not (is-MissingZero!10767 lt!619768)) (and (bvsge (index!45445 lt!619768) #b00000000000000000000000000000000) (bvslt (index!45445 lt!619768) (size!47006 a!2901)))) (or (is-Undefined!10767 lt!619768) (is-Found!10767 lt!619768) (is-MissingZero!10767 lt!619768) (not (is-MissingVacant!10767 lt!619768)) (and (bvsge (index!45448 lt!619768) #b00000000000000000000000000000000) (bvslt (index!45448 lt!619768) (size!47006 a!2901)))) (or (is-Undefined!10767 lt!619768) (ite (is-Found!10767 lt!619768) (= (select (arr!46456 a!2901) (index!45446 lt!619768)) (select (arr!46456 a!2901) j!112)) (ite (is-MissingZero!10767 lt!619768) (= (select (arr!46456 a!2901) (index!45445 lt!619768)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10767 lt!619768) (= (select (arr!46456 a!2901) (index!45448 lt!619768)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!796553 () SeekEntryResult!10767)

(assert (=> d!151569 (= lt!619768 e!796553)))

(declare-fun c!130513 () Bool)

(assert (=> d!151569 (= c!130513 (and (is-Intermediate!10767 lt!619767) (undefined!11579 lt!619767)))))

(assert (=> d!151569 (= lt!619767 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46456 a!2901) j!112) mask!2840) (select (arr!46456 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151569 (validMask!0 mask!2840)))

(assert (=> d!151569 (= (seekEntryOrOpen!0 (select (arr!46456 a!2901) j!112) a!2901 mask!2840) lt!619768)))

(declare-fun b!1407367 () Bool)

(assert (=> b!1407367 (= e!796553 Undefined!10767)))

(declare-fun b!1407368 () Bool)

(declare-fun e!796552 () SeekEntryResult!10767)

(assert (=> b!1407368 (= e!796552 (MissingZero!10767 (index!45447 lt!619767)))))

(declare-fun b!1407369 () Bool)

(declare-fun c!130512 () Bool)

(declare-fun lt!619766 () (_ BitVec 64))

(assert (=> b!1407369 (= c!130512 (= lt!619766 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1407369 (= e!796554 e!796552)))

(declare-fun b!1407370 () Bool)

(assert (=> b!1407370 (= e!796553 e!796554)))

(assert (=> b!1407370 (= lt!619766 (select (arr!46456 a!2901) (index!45447 lt!619767)))))

(declare-fun c!130514 () Bool)

(assert (=> b!1407370 (= c!130514 (= lt!619766 (select (arr!46456 a!2901) j!112)))))

(declare-fun b!1407371 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96220 (_ BitVec 32)) SeekEntryResult!10767)

(assert (=> b!1407371 (= e!796552 (seekKeyOrZeroReturnVacant!0 (x!127044 lt!619767) (index!45447 lt!619767) (index!45447 lt!619767) (select (arr!46456 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!151569 c!130513) b!1407367))

(assert (= (and d!151569 (not c!130513)) b!1407370))

(assert (= (and b!1407370 c!130514) b!1407366))

(assert (= (and b!1407370 (not c!130514)) b!1407369))

(assert (= (and b!1407369 c!130512) b!1407368))

(assert (= (and b!1407369 (not c!130512)) b!1407371))

(assert (=> d!151569 m!1296335))

(assert (=> d!151569 m!1296337))

(declare-fun m!1296489 () Bool)

(assert (=> d!151569 m!1296489))

(assert (=> d!151569 m!1296337))

(assert (=> d!151569 m!1296335))

(declare-fun m!1296491 () Bool)

(assert (=> d!151569 m!1296491))

(assert (=> d!151569 m!1296347))

(declare-fun m!1296493 () Bool)

(assert (=> d!151569 m!1296493))

(declare-fun m!1296495 () Bool)

(assert (=> d!151569 m!1296495))

(declare-fun m!1296497 () Bool)

(assert (=> b!1407370 m!1296497))

(assert (=> b!1407371 m!1296335))

(declare-fun m!1296499 () Bool)

(assert (=> b!1407371 m!1296499))

(assert (=> b!1407139 d!151569))

(declare-fun d!151583 () Bool)

(declare-fun res!945277 () Bool)

(declare-fun e!796561 () Bool)

(assert (=> d!151583 (=> res!945277 e!796561)))

(assert (=> d!151583 (= res!945277 (bvsge #b00000000000000000000000000000000 (size!47006 a!2901)))))

(assert (=> d!151583 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!796561)))

(declare-fun bm!66985 () Bool)

(declare-fun call!66988 () Bool)

(assert (=> bm!66985 (= call!66988 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1407381 () Bool)

(declare-fun e!796562 () Bool)

(assert (=> b!1407381 (= e!796561 e!796562)))

(declare-fun c!130518 () Bool)

(assert (=> b!1407381 (= c!130518 (validKeyInArray!0 (select (arr!46456 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1407382 () Bool)

(assert (=> b!1407382 (= e!796562 call!66988)))

(declare-fun b!1407383 () Bool)

(declare-fun e!796560 () Bool)

(assert (=> b!1407383 (= e!796560 call!66988)))

(declare-fun b!1407384 () Bool)

(assert (=> b!1407384 (= e!796562 e!796560)))

(declare-fun lt!619773 () (_ BitVec 64))

(assert (=> b!1407384 (= lt!619773 (select (arr!46456 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!619772 () Unit!47508)

(assert (=> b!1407384 (= lt!619772 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619773 #b00000000000000000000000000000000))))

(assert (=> b!1407384 (arrayContainsKey!0 a!2901 lt!619773 #b00000000000000000000000000000000)))

(declare-fun lt!619774 () Unit!47508)

(assert (=> b!1407384 (= lt!619774 lt!619772)))

(declare-fun res!945276 () Bool)

(assert (=> b!1407384 (= res!945276 (= (seekEntryOrOpen!0 (select (arr!46456 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10767 #b00000000000000000000000000000000)))))

(assert (=> b!1407384 (=> (not res!945276) (not e!796560))))

(assert (= (and d!151583 (not res!945277)) b!1407381))

(assert (= (and b!1407381 c!130518) b!1407384))

(assert (= (and b!1407381 (not c!130518)) b!1407382))

(assert (= (and b!1407384 res!945276) b!1407383))

(assert (= (or b!1407383 b!1407382) bm!66985))

(declare-fun m!1296505 () Bool)

(assert (=> bm!66985 m!1296505))

(declare-fun m!1296509 () Bool)

(assert (=> b!1407381 m!1296509))

(assert (=> b!1407381 m!1296509))

(declare-fun m!1296511 () Bool)

(assert (=> b!1407381 m!1296511))

(assert (=> b!1407384 m!1296509))

(declare-fun m!1296515 () Bool)

(assert (=> b!1407384 m!1296515))

(declare-fun m!1296517 () Bool)

(assert (=> b!1407384 m!1296517))

(assert (=> b!1407384 m!1296509))

(declare-fun m!1296519 () Bool)

(assert (=> b!1407384 m!1296519))

(assert (=> b!1407144 d!151583))

(declare-fun d!151587 () Bool)

(assert (=> d!151587 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120964 d!151587))

(declare-fun d!151589 () Bool)

(assert (=> d!151589 (= (array_inv!35484 a!2901) (bvsge (size!47006 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120964 d!151589))

(declare-fun d!151591 () Bool)

(declare-fun res!945285 () Bool)

(declare-fun e!796574 () Bool)

(assert (=> d!151591 (=> res!945285 e!796574)))

(assert (=> d!151591 (= res!945285 (bvsge #b00000000000000000000000000000000 (size!47006 a!2901)))))

(assert (=> d!151591 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32972) e!796574)))

(declare-fun b!1407395 () Bool)

(declare-fun e!796573 () Bool)

(declare-fun e!796571 () Bool)

(assert (=> b!1407395 (= e!796573 e!796571)))

(declare-fun c!130521 () Bool)

(assert (=> b!1407395 (= c!130521 (validKeyInArray!0 (select (arr!46456 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1407396 () Bool)

(declare-fun call!66991 () Bool)

(assert (=> b!1407396 (= e!796571 call!66991)))

(declare-fun b!1407397 () Bool)

(assert (=> b!1407397 (= e!796571 call!66991)))

(declare-fun b!1407398 () Bool)

(declare-fun e!796572 () Bool)

(declare-fun contains!9799 (List!32975 (_ BitVec 64)) Bool)

(assert (=> b!1407398 (= e!796572 (contains!9799 Nil!32972 (select (arr!46456 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66988 () Bool)

(assert (=> bm!66988 (= call!66991 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130521 (Cons!32971 (select (arr!46456 a!2901) #b00000000000000000000000000000000) Nil!32972) Nil!32972)))))

(declare-fun b!1407399 () Bool)

(assert (=> b!1407399 (= e!796574 e!796573)))

(declare-fun res!945284 () Bool)

(assert (=> b!1407399 (=> (not res!945284) (not e!796573))))

(assert (=> b!1407399 (= res!945284 (not e!796572))))

(declare-fun res!945286 () Bool)

(assert (=> b!1407399 (=> (not res!945286) (not e!796572))))

(assert (=> b!1407399 (= res!945286 (validKeyInArray!0 (select (arr!46456 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151591 (not res!945285)) b!1407399))

(assert (= (and b!1407399 res!945286) b!1407398))

(assert (= (and b!1407399 res!945284) b!1407395))

(assert (= (and b!1407395 c!130521) b!1407397))

(assert (= (and b!1407395 (not c!130521)) b!1407396))

(assert (= (or b!1407397 b!1407396) bm!66988))

(assert (=> b!1407395 m!1296509))

(assert (=> b!1407395 m!1296509))

(assert (=> b!1407395 m!1296511))

(assert (=> b!1407398 m!1296509))

(assert (=> b!1407398 m!1296509))

(declare-fun m!1296521 () Bool)

(assert (=> b!1407398 m!1296521))

(assert (=> bm!66988 m!1296509))

(declare-fun m!1296523 () Bool)

(assert (=> bm!66988 m!1296523))

(assert (=> b!1407399 m!1296509))

(assert (=> b!1407399 m!1296509))

(assert (=> b!1407399 m!1296511))

(assert (=> b!1407138 d!151591))

(push 1)

(assert (not bm!66985))

(assert (not b!1407381))

(assert (not bm!66976))

(assert (not b!1407210))

(assert (not b!1407288))

(assert (not b!1407301))

(assert (not d!151553))

(assert (not b!1407384))

(assert (not b!1407398))

(assert (not bm!66988))

(assert (not d!151531))

(assert (not b!1407399))

(assert (not b!1407395))

(assert (not b!1407371))

(assert (not d!151533))

(assert (not b!1407207))

(assert (not d!151569))

(check-sat)

(pop 1)

(push 1)

(check-sat)

