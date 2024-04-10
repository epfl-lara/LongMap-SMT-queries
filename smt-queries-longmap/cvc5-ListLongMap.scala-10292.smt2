; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121020 () Bool)

(assert start!121020)

(declare-fun b!1407418 () Bool)

(declare-fun e!796586 () Bool)

(declare-fun e!796584 () Bool)

(assert (=> b!1407418 (= e!796586 (not e!796584))))

(declare-fun res!945307 () Bool)

(assert (=> b!1407418 (=> res!945307 e!796584)))

(declare-datatypes ((SeekEntryResult!10768 0))(
  ( (MissingZero!10768 (index!45449 (_ BitVec 32))) (Found!10768 (index!45450 (_ BitVec 32))) (Intermediate!10768 (undefined!11580 Bool) (index!45451 (_ BitVec 32)) (x!127059 (_ BitVec 32))) (Undefined!10768) (MissingVacant!10768 (index!45452 (_ BitVec 32))) )
))
(declare-fun lt!619783 () SeekEntryResult!10768)

(assert (=> b!1407418 (= res!945307 (or (not (is-Intermediate!10768 lt!619783)) (undefined!11580 lt!619783)))))

(declare-fun e!796585 () Bool)

(assert (=> b!1407418 e!796585))

(declare-fun res!945305 () Bool)

(assert (=> b!1407418 (=> (not res!945305) (not e!796585))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96225 0))(
  ( (array!96226 (arr!46457 (Array (_ BitVec 32) (_ BitVec 64))) (size!47007 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96225)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96225 (_ BitVec 32)) Bool)

(assert (=> b!1407418 (= res!945305 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47510 0))(
  ( (Unit!47511) )
))
(declare-fun lt!619785 () Unit!47510)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96225 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47510)

(assert (=> b!1407418 (= lt!619785 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!619784 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96225 (_ BitVec 32)) SeekEntryResult!10768)

(assert (=> b!1407418 (= lt!619783 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!619784 (select (arr!46457 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407418 (= lt!619784 (toIndex!0 (select (arr!46457 a!2901) j!112) mask!2840))))

(declare-fun b!1407419 () Bool)

(declare-fun res!945311 () Bool)

(assert (=> b!1407419 (=> (not res!945311) (not e!796586))))

(declare-datatypes ((List!32976 0))(
  ( (Nil!32973) (Cons!32972 (h!34232 (_ BitVec 64)) (t!47670 List!32976)) )
))
(declare-fun arrayNoDuplicates!0 (array!96225 (_ BitVec 32) List!32976) Bool)

(assert (=> b!1407419 (= res!945311 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32973))))

(declare-fun b!1407420 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96225 (_ BitVec 32)) SeekEntryResult!10768)

(assert (=> b!1407420 (= e!796585 (= (seekEntryOrOpen!0 (select (arr!46457 a!2901) j!112) a!2901 mask!2840) (Found!10768 j!112)))))

(declare-fun b!1407421 () Bool)

(declare-fun res!945309 () Bool)

(assert (=> b!1407421 (=> (not res!945309) (not e!796586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1407421 (= res!945309 (validKeyInArray!0 (select (arr!46457 a!2901) j!112)))))

(declare-fun res!945310 () Bool)

(assert (=> start!121020 (=> (not res!945310) (not e!796586))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121020 (= res!945310 (validMask!0 mask!2840))))

(assert (=> start!121020 e!796586))

(assert (=> start!121020 true))

(declare-fun array_inv!35485 (array!96225) Bool)

(assert (=> start!121020 (array_inv!35485 a!2901)))

(declare-fun b!1407422 () Bool)

(assert (=> b!1407422 (= e!796584 (or (bvslt (x!127059 lt!619783) #b00000000000000000000000000000000) (bvsgt (x!127059 lt!619783) #b01111111111111111111111111111110) (bvslt lt!619784 #b00000000000000000000000000000000) (bvsge lt!619784 (size!47007 a!2901)) (and (bvsge (index!45451 lt!619783) #b00000000000000000000000000000000) (bvslt (index!45451 lt!619783) (size!47007 a!2901)))))))

(declare-fun b!1407423 () Bool)

(declare-fun res!945313 () Bool)

(assert (=> b!1407423 (=> (not res!945313) (not e!796586))))

(assert (=> b!1407423 (= res!945313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1407424 () Bool)

(declare-fun res!945308 () Bool)

(assert (=> b!1407424 (=> res!945308 e!796584)))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1407424 (= res!945308 (not (= lt!619783 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96226 (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47007 a!2901)) mask!2840))))))

(declare-fun b!1407425 () Bool)

(declare-fun res!945306 () Bool)

(assert (=> b!1407425 (=> (not res!945306) (not e!796586))))

(assert (=> b!1407425 (= res!945306 (and (= (size!47007 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47007 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47007 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1407426 () Bool)

(declare-fun res!945312 () Bool)

(assert (=> b!1407426 (=> (not res!945312) (not e!796586))))

(assert (=> b!1407426 (= res!945312 (validKeyInArray!0 (select (arr!46457 a!2901) i!1037)))))

(assert (= (and start!121020 res!945310) b!1407425))

(assert (= (and b!1407425 res!945306) b!1407426))

(assert (= (and b!1407426 res!945312) b!1407421))

(assert (= (and b!1407421 res!945309) b!1407423))

(assert (= (and b!1407423 res!945313) b!1407419))

(assert (= (and b!1407419 res!945311) b!1407418))

(assert (= (and b!1407418 res!945305) b!1407420))

(assert (= (and b!1407418 (not res!945307)) b!1407424))

(assert (= (and b!1407424 (not res!945308)) b!1407422))

(declare-fun m!1296525 () Bool)

(assert (=> b!1407426 m!1296525))

(assert (=> b!1407426 m!1296525))

(declare-fun m!1296527 () Bool)

(assert (=> b!1407426 m!1296527))

(declare-fun m!1296529 () Bool)

(assert (=> b!1407424 m!1296529))

(declare-fun m!1296531 () Bool)

(assert (=> b!1407424 m!1296531))

(assert (=> b!1407424 m!1296531))

(declare-fun m!1296533 () Bool)

(assert (=> b!1407424 m!1296533))

(assert (=> b!1407424 m!1296533))

(assert (=> b!1407424 m!1296531))

(declare-fun m!1296535 () Bool)

(assert (=> b!1407424 m!1296535))

(declare-fun m!1296537 () Bool)

(assert (=> b!1407420 m!1296537))

(assert (=> b!1407420 m!1296537))

(declare-fun m!1296539 () Bool)

(assert (=> b!1407420 m!1296539))

(assert (=> b!1407418 m!1296537))

(declare-fun m!1296541 () Bool)

(assert (=> b!1407418 m!1296541))

(assert (=> b!1407418 m!1296537))

(assert (=> b!1407418 m!1296537))

(declare-fun m!1296543 () Bool)

(assert (=> b!1407418 m!1296543))

(declare-fun m!1296545 () Bool)

(assert (=> b!1407418 m!1296545))

(declare-fun m!1296547 () Bool)

(assert (=> b!1407418 m!1296547))

(assert (=> b!1407421 m!1296537))

(assert (=> b!1407421 m!1296537))

(declare-fun m!1296549 () Bool)

(assert (=> b!1407421 m!1296549))

(declare-fun m!1296551 () Bool)

(assert (=> b!1407419 m!1296551))

(declare-fun m!1296553 () Bool)

(assert (=> start!121020 m!1296553))

(declare-fun m!1296555 () Bool)

(assert (=> start!121020 m!1296555))

(declare-fun m!1296557 () Bool)

(assert (=> b!1407423 m!1296557))

(push 1)

(assert (not b!1407421))

(assert (not b!1407426))

(assert (not b!1407418))

(assert (not start!121020))

(assert (not b!1407419))

(assert (not b!1407420))

(assert (not b!1407424))

(assert (not b!1407423))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1407529 () Bool)

(declare-fun lt!619827 () SeekEntryResult!10768)

(assert (=> b!1407529 (and (bvsge (index!45451 lt!619827) #b00000000000000000000000000000000) (bvslt (index!45451 lt!619827) (size!47007 (array!96226 (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47007 a!2901)))))))

(declare-fun res!945382 () Bool)

(assert (=> b!1407529 (= res!945382 (= (select (arr!46457 (array!96226 (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47007 a!2901))) (index!45451 lt!619827)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!796640 () Bool)

(assert (=> b!1407529 (=> res!945382 e!796640)))

(declare-fun d!151597 () Bool)

(declare-fun e!796642 () Bool)

(assert (=> d!151597 e!796642))

(declare-fun c!130541 () Bool)

(assert (=> d!151597 (= c!130541 (and (is-Intermediate!10768 lt!619827) (undefined!11580 lt!619827)))))

(declare-fun e!796643 () SeekEntryResult!10768)

(assert (=> d!151597 (= lt!619827 e!796643)))

(declare-fun c!130542 () Bool)

(assert (=> d!151597 (= c!130542 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!619826 () (_ BitVec 64))

(assert (=> d!151597 (= lt!619826 (select (arr!46457 (array!96226 (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47007 a!2901))) (toIndex!0 (select (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151597 (validMask!0 mask!2840)))

(assert (=> d!151597 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96226 (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47007 a!2901)) mask!2840) lt!619827)))

(declare-fun b!1407530 () Bool)

(assert (=> b!1407530 (= e!796643 (Intermediate!10768 true (toIndex!0 (select (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1407531 () Bool)

(assert (=> b!1407531 (and (bvsge (index!45451 lt!619827) #b00000000000000000000000000000000) (bvslt (index!45451 lt!619827) (size!47007 (array!96226 (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47007 a!2901)))))))

(declare-fun res!945381 () Bool)

(assert (=> b!1407531 (= res!945381 (= (select (arr!46457 (array!96226 (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47007 a!2901))) (index!45451 lt!619827)) (select (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1407531 (=> res!945381 e!796640)))

(declare-fun e!796639 () Bool)

(assert (=> b!1407531 (= e!796639 e!796640)))

(declare-fun b!1407532 () Bool)

(declare-fun e!796641 () SeekEntryResult!10768)

(assert (=> b!1407532 (= e!796641 (Intermediate!10768 false (toIndex!0 (select (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1407533 () Bool)

(assert (=> b!1407533 (= e!796642 (bvsge (x!127059 lt!619827) #b01111111111111111111111111111110))))

(declare-fun b!1407534 () Bool)

(assert (=> b!1407534 (and (bvsge (index!45451 lt!619827) #b00000000000000000000000000000000) (bvslt (index!45451 lt!619827) (size!47007 (array!96226 (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47007 a!2901)))))))

(assert (=> b!1407534 (= e!796640 (= (select (arr!46457 (array!96226 (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47007 a!2901))) (index!45451 lt!619827)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1407535 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1407535 (= e!796641 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96226 (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47007 a!2901)) mask!2840))))

(declare-fun b!1407536 () Bool)

(assert (=> b!1407536 (= e!796642 e!796639)))

(declare-fun res!945380 () Bool)

(assert (=> b!1407536 (= res!945380 (and (is-Intermediate!10768 lt!619827) (not (undefined!11580 lt!619827)) (bvslt (x!127059 lt!619827) #b01111111111111111111111111111110) (bvsge (x!127059 lt!619827) #b00000000000000000000000000000000) (bvsge (x!127059 lt!619827) #b00000000000000000000000000000000)))))

(assert (=> b!1407536 (=> (not res!945380) (not e!796639))))

(declare-fun b!1407537 () Bool)

(assert (=> b!1407537 (= e!796643 e!796641)))

(declare-fun c!130540 () Bool)

(assert (=> b!1407537 (= c!130540 (or (= lt!619826 (select (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!619826 lt!619826) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!151597 c!130542) b!1407530))

(assert (= (and d!151597 (not c!130542)) b!1407537))

(assert (= (and b!1407537 c!130540) b!1407532))

(assert (= (and b!1407537 (not c!130540)) b!1407535))

(assert (= (and d!151597 c!130541) b!1407533))

(assert (= (and d!151597 (not c!130541)) b!1407536))

(assert (= (and b!1407536 res!945380) b!1407531))

(assert (= (and b!1407531 (not res!945381)) b!1407529))

(assert (= (and b!1407529 (not res!945382)) b!1407534))

(declare-fun m!1296645 () Bool)

(assert (=> b!1407534 m!1296645))

(assert (=> b!1407529 m!1296645))

(assert (=> b!1407531 m!1296645))

(assert (=> b!1407535 m!1296533))

(declare-fun m!1296647 () Bool)

(assert (=> b!1407535 m!1296647))

(assert (=> b!1407535 m!1296647))

(assert (=> b!1407535 m!1296531))

(declare-fun m!1296649 () Bool)

(assert (=> b!1407535 m!1296649))

(assert (=> d!151597 m!1296533))

(declare-fun m!1296651 () Bool)

(assert (=> d!151597 m!1296651))

(assert (=> d!151597 m!1296553))

(assert (=> b!1407424 d!151597))

(declare-fun d!151605 () Bool)

(declare-fun lt!619842 () (_ BitVec 32))

(declare-fun lt!619841 () (_ BitVec 32))

(assert (=> d!151605 (= lt!619842 (bvmul (bvxor lt!619841 (bvlshr lt!619841 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151605 (= lt!619841 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151605 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945383 (let ((h!34235 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127063 (bvmul (bvxor h!34235 (bvlshr h!34235 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127063 (bvlshr x!127063 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945383 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945383 #b00000000000000000000000000000000))))))

(assert (=> d!151605 (= (toIndex!0 (select (store (arr!46457 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!619842 (bvlshr lt!619842 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1407424 d!151605))

(declare-fun b!1407566 () Bool)

(declare-fun e!796663 () Bool)

(declare-fun call!66997 () Bool)

(assert (=> b!1407566 (= e!796663 call!66997)))

(declare-fun bm!66994 () Bool)

(declare-fun c!130554 () Bool)

(assert (=> bm!66994 (= call!66997 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130554 (Cons!32972 (select (arr!46457 a!2901) #b00000000000000000000000000000000) Nil!32973) Nil!32973)))))

(declare-fun b!1407567 () Bool)

(declare-fun e!796662 () Bool)

(declare-fun e!796661 () Bool)

(assert (=> b!1407567 (= e!796662 e!796661)))

(declare-fun res!945392 () Bool)

(assert (=> b!1407567 (=> (not res!945392) (not e!796661))))

(declare-fun e!796664 () Bool)

(assert (=> b!1407567 (= res!945392 (not e!796664))))

(declare-fun res!945390 () Bool)

(assert (=> b!1407567 (=> (not res!945390) (not e!796664))))

(assert (=> b!1407567 (= res!945390 (validKeyInArray!0 (select (arr!46457 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!151609 () Bool)

(declare-fun res!945391 () Bool)

(assert (=> d!151609 (=> res!945391 e!796662)))

(assert (=> d!151609 (= res!945391 (bvsge #b00000000000000000000000000000000 (size!47007 a!2901)))))

(assert (=> d!151609 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32973) e!796662)))

(declare-fun b!1407568 () Bool)

(assert (=> b!1407568 (= e!796661 e!796663)))

(assert (=> b!1407568 (= c!130554 (validKeyInArray!0 (select (arr!46457 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1407569 () Bool)

(declare-fun contains!9800 (List!32976 (_ BitVec 64)) Bool)

(assert (=> b!1407569 (= e!796664 (contains!9800 Nil!32973 (select (arr!46457 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1407570 () Bool)

(assert (=> b!1407570 (= e!796663 call!66997)))

(assert (= (and d!151609 (not res!945391)) b!1407567))

(assert (= (and b!1407567 res!945390) b!1407569))

(assert (= (and b!1407567 res!945392) b!1407568))

(assert (= (and b!1407568 c!130554) b!1407570))

(assert (= (and b!1407568 (not c!130554)) b!1407566))

(assert (= (or b!1407570 b!1407566) bm!66994))

(declare-fun m!1296667 () Bool)

(assert (=> bm!66994 m!1296667))

(declare-fun m!1296669 () Bool)

(assert (=> bm!66994 m!1296669))

(assert (=> b!1407567 m!1296667))

(assert (=> b!1407567 m!1296667))

(declare-fun m!1296671 () Bool)

(assert (=> b!1407567 m!1296671))

(assert (=> b!1407568 m!1296667))

(assert (=> b!1407568 m!1296667))

(assert (=> b!1407568 m!1296671))

(assert (=> b!1407569 m!1296667))

(assert (=> b!1407569 m!1296667))

(declare-fun m!1296673 () Bool)

(assert (=> b!1407569 m!1296673))

(assert (=> b!1407419 d!151609))

(declare-fun b!1407597 () Bool)

(declare-fun e!796682 () Bool)

(declare-fun e!796683 () Bool)

(assert (=> b!1407597 (= e!796682 e!796683)))

(declare-fun c!130563 () Bool)

(assert (=> b!1407597 (= c!130563 (validKeyInArray!0 (select (arr!46457 a!2901) j!112)))))

(declare-fun b!1407598 () Bool)

(declare-fun e!796681 () Bool)

(assert (=> b!1407598 (= e!796683 e!796681)))

(declare-fun lt!619856 () (_ BitVec 64))

(assert (=> b!1407598 (= lt!619856 (select (arr!46457 a!2901) j!112))))

(declare-fun lt!619858 () Unit!47510)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96225 (_ BitVec 64) (_ BitVec 32)) Unit!47510)

(assert (=> b!1407598 (= lt!619858 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619856 j!112))))

(declare-fun arrayContainsKey!0 (array!96225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1407598 (arrayContainsKey!0 a!2901 lt!619856 #b00000000000000000000000000000000)))

(declare-fun lt!619857 () Unit!47510)

(assert (=> b!1407598 (= lt!619857 lt!619858)))

(declare-fun res!945404 () Bool)

(assert (=> b!1407598 (= res!945404 (= (seekEntryOrOpen!0 (select (arr!46457 a!2901) j!112) a!2901 mask!2840) (Found!10768 j!112)))))

(assert (=> b!1407598 (=> (not res!945404) (not e!796681))))

(declare-fun b!1407600 () Bool)

(declare-fun call!67000 () Bool)

(assert (=> b!1407600 (= e!796683 call!67000)))

(declare-fun bm!66997 () Bool)

(assert (=> bm!66997 (= call!67000 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!151617 () Bool)

(declare-fun res!945403 () Bool)

(assert (=> d!151617 (=> res!945403 e!796682)))

(assert (=> d!151617 (= res!945403 (bvsge j!112 (size!47007 a!2901)))))

(assert (=> d!151617 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!796682)))

(declare-fun b!1407599 () Bool)

(assert (=> b!1407599 (= e!796681 call!67000)))

(assert (= (and d!151617 (not res!945403)) b!1407597))

(assert (= (and b!1407597 c!130563) b!1407598))

(assert (= (and b!1407597 (not c!130563)) b!1407600))

(assert (= (and b!1407598 res!945404) b!1407599))

(assert (= (or b!1407599 b!1407600) bm!66997))

(assert (=> b!1407597 m!1296537))

(assert (=> b!1407597 m!1296537))

(assert (=> b!1407597 m!1296549))

(assert (=> b!1407598 m!1296537))

(declare-fun m!1296675 () Bool)

(assert (=> b!1407598 m!1296675))

(declare-fun m!1296677 () Bool)

(assert (=> b!1407598 m!1296677))

(assert (=> b!1407598 m!1296537))

(assert (=> b!1407598 m!1296539))

(declare-fun m!1296679 () Bool)

(assert (=> bm!66997 m!1296679))

(assert (=> b!1407418 d!151617))

(declare-fun d!151623 () Bool)

(assert (=> d!151623 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!619863 () Unit!47510)

(declare-fun choose!38 (array!96225 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47510)

(assert (=> d!151623 (= lt!619863 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151623 (validMask!0 mask!2840)))

(assert (=> d!151623 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!619863)))

(declare-fun bs!41022 () Bool)

(assert (= bs!41022 d!151623))

(assert (=> bs!41022 m!1296547))

(declare-fun m!1296689 () Bool)

(assert (=> bs!41022 m!1296689))

(assert (=> bs!41022 m!1296553))

(assert (=> b!1407418 d!151623))

(declare-fun b!1407610 () Bool)

(declare-fun lt!619865 () SeekEntryResult!10768)

(assert (=> b!1407610 (and (bvsge (index!45451 lt!619865) #b00000000000000000000000000000000) (bvslt (index!45451 lt!619865) (size!47007 a!2901)))))

(declare-fun res!945411 () Bool)

(assert (=> b!1407610 (= res!945411 (= (select (arr!46457 a!2901) (index!45451 lt!619865)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!796690 () Bool)

(assert (=> b!1407610 (=> res!945411 e!796690)))

(declare-fun d!151627 () Bool)

(declare-fun e!796692 () Bool)

(assert (=> d!151627 e!796692))

(declare-fun c!130568 () Bool)

(assert (=> d!151627 (= c!130568 (and (is-Intermediate!10768 lt!619865) (undefined!11580 lt!619865)))))

(declare-fun e!796693 () SeekEntryResult!10768)

(assert (=> d!151627 (= lt!619865 e!796693)))

(declare-fun c!130569 () Bool)

(assert (=> d!151627 (= c!130569 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!619864 () (_ BitVec 64))

(assert (=> d!151627 (= lt!619864 (select (arr!46457 a!2901) lt!619784))))

(assert (=> d!151627 (validMask!0 mask!2840)))

(assert (=> d!151627 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!619784 (select (arr!46457 a!2901) j!112) a!2901 mask!2840) lt!619865)))

(declare-fun b!1407611 () Bool)

(assert (=> b!1407611 (= e!796693 (Intermediate!10768 true lt!619784 #b00000000000000000000000000000000))))

(declare-fun b!1407612 () Bool)

(assert (=> b!1407612 (and (bvsge (index!45451 lt!619865) #b00000000000000000000000000000000) (bvslt (index!45451 lt!619865) (size!47007 a!2901)))))

(declare-fun res!945410 () Bool)

(assert (=> b!1407612 (= res!945410 (= (select (arr!46457 a!2901) (index!45451 lt!619865)) (select (arr!46457 a!2901) j!112)))))

(assert (=> b!1407612 (=> res!945410 e!796690)))

(declare-fun e!796689 () Bool)

(assert (=> b!1407612 (= e!796689 e!796690)))

(declare-fun b!1407613 () Bool)

(declare-fun e!796691 () SeekEntryResult!10768)

(assert (=> b!1407613 (= e!796691 (Intermediate!10768 false lt!619784 #b00000000000000000000000000000000))))

(declare-fun b!1407614 () Bool)

(assert (=> b!1407614 (= e!796692 (bvsge (x!127059 lt!619865) #b01111111111111111111111111111110))))

(declare-fun b!1407615 () Bool)

(assert (=> b!1407615 (and (bvsge (index!45451 lt!619865) #b00000000000000000000000000000000) (bvslt (index!45451 lt!619865) (size!47007 a!2901)))))

(assert (=> b!1407615 (= e!796690 (= (select (arr!46457 a!2901) (index!45451 lt!619865)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1407616 () Bool)

(assert (=> b!1407616 (= e!796691 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!619784 #b00000000000000000000000000000000 mask!2840) (select (arr!46457 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407617 () Bool)

(assert (=> b!1407617 (= e!796692 e!796689)))

(declare-fun res!945409 () Bool)

(assert (=> b!1407617 (= res!945409 (and (is-Intermediate!10768 lt!619865) (not (undefined!11580 lt!619865)) (bvslt (x!127059 lt!619865) #b01111111111111111111111111111110) (bvsge (x!127059 lt!619865) #b00000000000000000000000000000000) (bvsge (x!127059 lt!619865) #b00000000000000000000000000000000)))))

(assert (=> b!1407617 (=> (not res!945409) (not e!796689))))

(declare-fun b!1407618 () Bool)

(assert (=> b!1407618 (= e!796693 e!796691)))

(declare-fun c!130567 () Bool)

(assert (=> b!1407618 (= c!130567 (or (= lt!619864 (select (arr!46457 a!2901) j!112)) (= (bvadd lt!619864 lt!619864) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!151627 c!130569) b!1407611))

(assert (= (and d!151627 (not c!130569)) b!1407618))

(assert (= (and b!1407618 c!130567) b!1407613))

(assert (= (and b!1407618 (not c!130567)) b!1407616))

(assert (= (and d!151627 c!130568) b!1407614))

(assert (= (and d!151627 (not c!130568)) b!1407617))

(assert (= (and b!1407617 res!945409) b!1407612))

(assert (= (and b!1407612 (not res!945410)) b!1407610))

(assert (= (and b!1407610 (not res!945411)) b!1407615))

(declare-fun m!1296691 () Bool)

(assert (=> b!1407615 m!1296691))

(assert (=> b!1407610 m!1296691))

(assert (=> b!1407612 m!1296691))

(declare-fun m!1296693 () Bool)

(assert (=> b!1407616 m!1296693))

(assert (=> b!1407616 m!1296693))

(assert (=> b!1407616 m!1296537))

(declare-fun m!1296695 () Bool)

(assert (=> b!1407616 m!1296695))

(declare-fun m!1296697 () Bool)

(assert (=> d!151627 m!1296697))

(assert (=> d!151627 m!1296553))

(assert (=> b!1407418 d!151627))

(declare-fun d!151629 () Bool)

(declare-fun lt!619877 () (_ BitVec 32))

(declare-fun lt!619876 () (_ BitVec 32))

(assert (=> d!151629 (= lt!619877 (bvmul (bvxor lt!619876 (bvlshr lt!619876 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151629 (= lt!619876 ((_ extract 31 0) (bvand (bvxor (select (arr!46457 a!2901) j!112) (bvlshr (select (arr!46457 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151629 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!945383 (let ((h!34235 ((_ extract 31 0) (bvand (bvxor (select (arr!46457 a!2901) j!112) (bvlshr (select (arr!46457 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127063 (bvmul (bvxor h!34235 (bvlshr h!34235 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127063 (bvlshr x!127063 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!945383 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!945383 #b00000000000000000000000000000000))))))

(assert (=> d!151629 (= (toIndex!0 (select (arr!46457 a!2901) j!112) mask!2840) (bvand (bvxor lt!619877 (bvlshr lt!619877 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1407418 d!151629))

(declare-fun b!1407666 () Bool)

(declare-fun e!796728 () SeekEntryResult!10768)

(declare-fun lt!619900 () SeekEntryResult!10768)

(assert (=> b!1407666 (= e!796728 (Found!10768 (index!45451 lt!619900)))))

(declare-fun b!1407667 () Bool)

(declare-fun e!796729 () SeekEntryResult!10768)

(assert (=> b!1407667 (= e!796729 (MissingZero!10768 (index!45451 lt!619900)))))

(declare-fun b!1407668 () Bool)

(declare-fun e!796727 () SeekEntryResult!10768)

(assert (=> b!1407668 (= e!796727 Undefined!10768)))

(declare-fun d!151631 () Bool)

(declare-fun lt!619898 () SeekEntryResult!10768)

(assert (=> d!151631 (and (or (is-Undefined!10768 lt!619898) (not (is-Found!10768 lt!619898)) (and (bvsge (index!45450 lt!619898) #b00000000000000000000000000000000) (bvslt (index!45450 lt!619898) (size!47007 a!2901)))) (or (is-Undefined!10768 lt!619898) (is-Found!10768 lt!619898) (not (is-MissingZero!10768 lt!619898)) (and (bvsge (index!45449 lt!619898) #b00000000000000000000000000000000) (bvslt (index!45449 lt!619898) (size!47007 a!2901)))) (or (is-Undefined!10768 lt!619898) (is-Found!10768 lt!619898) (is-MissingZero!10768 lt!619898) (not (is-MissingVacant!10768 lt!619898)) (and (bvsge (index!45452 lt!619898) #b00000000000000000000000000000000) (bvslt (index!45452 lt!619898) (size!47007 a!2901)))) (or (is-Undefined!10768 lt!619898) (ite (is-Found!10768 lt!619898) (= (select (arr!46457 a!2901) (index!45450 lt!619898)) (select (arr!46457 a!2901) j!112)) (ite (is-MissingZero!10768 lt!619898) (= (select (arr!46457 a!2901) (index!45449 lt!619898)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10768 lt!619898) (= (select (arr!46457 a!2901) (index!45452 lt!619898)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151631 (= lt!619898 e!796727)))

(declare-fun c!130585 () Bool)

(assert (=> d!151631 (= c!130585 (and (is-Intermediate!10768 lt!619900) (undefined!11580 lt!619900)))))

(assert (=> d!151631 (= lt!619900 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46457 a!2901) j!112) mask!2840) (select (arr!46457 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151631 (validMask!0 mask!2840)))

(assert (=> d!151631 (= (seekEntryOrOpen!0 (select (arr!46457 a!2901) j!112) a!2901 mask!2840) lt!619898)))

(declare-fun b!1407669 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96225 (_ BitVec 32)) SeekEntryResult!10768)

(assert (=> b!1407669 (= e!796729 (seekKeyOrZeroReturnVacant!0 (x!127059 lt!619900) (index!45451 lt!619900) (index!45451 lt!619900) (select (arr!46457 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1407670 () Bool)

(declare-fun c!130584 () Bool)

(declare-fun lt!619899 () (_ BitVec 64))

(assert (=> b!1407670 (= c!130584 (= lt!619899 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1407670 (= e!796728 e!796729)))

(declare-fun b!1407671 () Bool)

(assert (=> b!1407671 (= e!796727 e!796728)))

(assert (=> b!1407671 (= lt!619899 (select (arr!46457 a!2901) (index!45451 lt!619900)))))

(declare-fun c!130586 () Bool)

(assert (=> b!1407671 (= c!130586 (= lt!619899 (select (arr!46457 a!2901) j!112)))))

(assert (= (and d!151631 c!130585) b!1407668))

(assert (= (and d!151631 (not c!130585)) b!1407671))

(assert (= (and b!1407671 c!130586) b!1407666))

(assert (= (and b!1407671 (not c!130586)) b!1407670))

(assert (= (and b!1407670 c!130584) b!1407667))

(assert (= (and b!1407670 (not c!130584)) b!1407669))

(assert (=> d!151631 m!1296541))

(assert (=> d!151631 m!1296537))

(declare-fun m!1296735 () Bool)

(assert (=> d!151631 m!1296735))

(assert (=> d!151631 m!1296553))

(declare-fun m!1296737 () Bool)

(assert (=> d!151631 m!1296737))

(declare-fun m!1296739 () Bool)

(assert (=> d!151631 m!1296739))

(declare-fun m!1296741 () Bool)

(assert (=> d!151631 m!1296741))

(assert (=> d!151631 m!1296537))

(assert (=> d!151631 m!1296541))

(assert (=> b!1407669 m!1296537))

(declare-fun m!1296743 () Bool)

(assert (=> b!1407669 m!1296743))

(declare-fun m!1296745 () Bool)

(assert (=> b!1407671 m!1296745))

(assert (=> b!1407420 d!151631))

(declare-fun d!151653 () Bool)

(assert (=> d!151653 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121020 d!151653))

(declare-fun d!151659 () Bool)

(assert (=> d!151659 (= (array_inv!35485 a!2901) (bvsge (size!47007 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121020 d!151659))

(declare-fun d!151661 () Bool)

(assert (=> d!151661 (= (validKeyInArray!0 (select (arr!46457 a!2901) i!1037)) (and (not (= (select (arr!46457 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46457 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1407426 d!151661))

(declare-fun d!151663 () Bool)

(assert (=> d!151663 (= (validKeyInArray!0 (select (arr!46457 a!2901) j!112)) (and (not (= (select (arr!46457 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46457 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1407421 d!151663))

(declare-fun b!1407708 () Bool)

(declare-fun e!796751 () Bool)

(declare-fun e!796752 () Bool)

(assert (=> b!1407708 (= e!796751 e!796752)))

(declare-fun c!130599 () Bool)

(assert (=> b!1407708 (= c!130599 (validKeyInArray!0 (select (arr!46457 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1407709 () Bool)

(declare-fun e!796750 () Bool)

(assert (=> b!1407709 (= e!796752 e!796750)))

(declare-fun lt!619911 () (_ BitVec 64))

(assert (=> b!1407709 (= lt!619911 (select (arr!46457 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!619913 () Unit!47510)

(assert (=> b!1407709 (= lt!619913 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619911 #b00000000000000000000000000000000))))

(assert (=> b!1407709 (arrayContainsKey!0 a!2901 lt!619911 #b00000000000000000000000000000000)))

(declare-fun lt!619912 () Unit!47510)

(assert (=> b!1407709 (= lt!619912 lt!619913)))

(declare-fun res!945445 () Bool)

(assert (=> b!1407709 (= res!945445 (= (seekEntryOrOpen!0 (select (arr!46457 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10768 #b00000000000000000000000000000000)))))

(assert (=> b!1407709 (=> (not res!945445) (not e!796750))))

(declare-fun b!1407711 () Bool)

(declare-fun call!67009 () Bool)

(assert (=> b!1407711 (= e!796752 call!67009)))

(declare-fun bm!67006 () Bool)

(assert (=> bm!67006 (= call!67009 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!151665 () Bool)

(declare-fun res!945444 () Bool)

(assert (=> d!151665 (=> res!945444 e!796751)))

(assert (=> d!151665 (= res!945444 (bvsge #b00000000000000000000000000000000 (size!47007 a!2901)))))

(assert (=> d!151665 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!796751)))

(declare-fun b!1407710 () Bool)

(assert (=> b!1407710 (= e!796750 call!67009)))

(assert (= (and d!151665 (not res!945444)) b!1407708))

(assert (= (and b!1407708 c!130599) b!1407709))

(assert (= (and b!1407708 (not c!130599)) b!1407711))

(assert (= (and b!1407709 res!945445) b!1407710))

(assert (= (or b!1407710 b!1407711) bm!67006))

(assert (=> b!1407708 m!1296667))

(assert (=> b!1407708 m!1296667))

(assert (=> b!1407708 m!1296671))

(assert (=> b!1407709 m!1296667))

(declare-fun m!1296763 () Bool)

(assert (=> b!1407709 m!1296763))

(declare-fun m!1296765 () Bool)

(assert (=> b!1407709 m!1296765))

(assert (=> b!1407709 m!1296667))

(declare-fun m!1296767 () Bool)

(assert (=> b!1407709 m!1296767))

(declare-fun m!1296769 () Bool)

(assert (=> bm!67006 m!1296769))

(assert (=> b!1407423 d!151665))

(push 1)

(assert (not b!1407708))

(assert (not d!151597))

(assert (not d!151631))

(assert (not b!1407568))

(assert (not b!1407669))

(assert (not bm!66994))

(assert (not d!151623))

(assert (not b!1407567))

(assert (not b!1407709))

(assert (not bm!67006))

(assert (not b!1407616))

(assert (not d!151627))

(assert (not b!1407597))

(assert (not b!1407535))

(assert (not b!1407598))

(assert (not bm!66997))

(assert (not b!1407569))

(check-sat)

(pop 1)

(push 1)

(check-sat)

