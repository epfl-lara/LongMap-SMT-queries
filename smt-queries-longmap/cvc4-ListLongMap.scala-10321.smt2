; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121360 () Bool)

(assert start!121360)

(declare-fun b!1410380 () Bool)

(declare-fun e!798130 () Bool)

(declare-fun e!798128 () Bool)

(assert (=> b!1410380 (= e!798130 (not e!798128))))

(declare-fun res!947775 () Bool)

(assert (=> b!1410380 (=> res!947775 e!798128)))

(declare-datatypes ((SeekEntryResult!10857 0))(
  ( (MissingZero!10857 (index!45805 (_ BitVec 32))) (Found!10857 (index!45806 (_ BitVec 32))) (Intermediate!10857 (undefined!11669 Bool) (index!45807 (_ BitVec 32)) (x!127398 (_ BitVec 32))) (Undefined!10857) (MissingVacant!10857 (index!45808 (_ BitVec 32))) )
))
(declare-fun lt!621142 () SeekEntryResult!10857)

(assert (=> b!1410380 (= res!947775 (or (not (is-Intermediate!10857 lt!621142)) (undefined!11669 lt!621142)))))

(declare-fun e!798131 () Bool)

(assert (=> b!1410380 e!798131))

(declare-fun res!947773 () Bool)

(assert (=> b!1410380 (=> (not res!947773) (not e!798131))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((array!96412 0))(
  ( (array!96413 (arr!46546 (Array (_ BitVec 32) (_ BitVec 64))) (size!47096 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96412)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96412 (_ BitVec 32)) Bool)

(assert (=> b!1410380 (= res!947773 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47688 0))(
  ( (Unit!47689) )
))
(declare-fun lt!621141 () Unit!47688)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96412 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47688)

(assert (=> b!1410380 (= lt!621141 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!621144 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96412 (_ BitVec 32)) SeekEntryResult!10857)

(assert (=> b!1410380 (= lt!621142 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621144 (select (arr!46546 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410380 (= lt!621144 (toIndex!0 (select (arr!46546 a!2901) j!112) mask!2840))))

(declare-fun b!1410381 () Bool)

(declare-fun res!947777 () Bool)

(assert (=> b!1410381 (=> (not res!947777) (not e!798130))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1410381 (= res!947777 (and (= (size!47096 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47096 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47096 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1410382 () Bool)

(declare-fun res!947779 () Bool)

(assert (=> b!1410382 (=> (not res!947779) (not e!798130))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1410382 (= res!947779 (validKeyInArray!0 (select (arr!46546 a!2901) i!1037)))))

(declare-fun b!1410383 () Bool)

(declare-fun lt!621143 () SeekEntryResult!10857)

(assert (=> b!1410383 (= e!798128 (or (= lt!621142 lt!621143) (not (is-Intermediate!10857 lt!621143)) (bvslt (x!127398 lt!621142) #b00000000000000000000000000000000) (bvsgt (x!127398 lt!621142) #b01111111111111111111111111111110) (bvslt lt!621144 #b00000000000000000000000000000000) (bvsge lt!621144 (size!47096 a!2901)) (and (bvsge (index!45807 lt!621142) #b00000000000000000000000000000000) (bvslt (index!45807 lt!621142) (size!47096 a!2901)))))))

(assert (=> b!1410383 (= lt!621143 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96413 (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47096 a!2901)) mask!2840))))

(declare-fun b!1410384 () Bool)

(declare-fun res!947778 () Bool)

(assert (=> b!1410384 (=> (not res!947778) (not e!798130))))

(assert (=> b!1410384 (= res!947778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1410385 () Bool)

(declare-fun res!947772 () Bool)

(assert (=> b!1410385 (=> (not res!947772) (not e!798130))))

(declare-datatypes ((List!33065 0))(
  ( (Nil!33062) (Cons!33061 (h!34330 (_ BitVec 64)) (t!47759 List!33065)) )
))
(declare-fun arrayNoDuplicates!0 (array!96412 (_ BitVec 32) List!33065) Bool)

(assert (=> b!1410385 (= res!947772 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33062))))

(declare-fun res!947776 () Bool)

(assert (=> start!121360 (=> (not res!947776) (not e!798130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121360 (= res!947776 (validMask!0 mask!2840))))

(assert (=> start!121360 e!798130))

(assert (=> start!121360 true))

(declare-fun array_inv!35574 (array!96412) Bool)

(assert (=> start!121360 (array_inv!35574 a!2901)))

(declare-fun b!1410386 () Bool)

(declare-fun res!947774 () Bool)

(assert (=> b!1410386 (=> (not res!947774) (not e!798130))))

(assert (=> b!1410386 (= res!947774 (validKeyInArray!0 (select (arr!46546 a!2901) j!112)))))

(declare-fun b!1410387 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96412 (_ BitVec 32)) SeekEntryResult!10857)

(assert (=> b!1410387 (= e!798131 (= (seekEntryOrOpen!0 (select (arr!46546 a!2901) j!112) a!2901 mask!2840) (Found!10857 j!112)))))

(assert (= (and start!121360 res!947776) b!1410381))

(assert (= (and b!1410381 res!947777) b!1410382))

(assert (= (and b!1410382 res!947779) b!1410386))

(assert (= (and b!1410386 res!947774) b!1410384))

(assert (= (and b!1410384 res!947778) b!1410385))

(assert (= (and b!1410385 res!947772) b!1410380))

(assert (= (and b!1410380 res!947773) b!1410387))

(assert (= (and b!1410380 (not res!947775)) b!1410383))

(declare-fun m!1300073 () Bool)

(assert (=> b!1410385 m!1300073))

(declare-fun m!1300075 () Bool)

(assert (=> start!121360 m!1300075))

(declare-fun m!1300077 () Bool)

(assert (=> start!121360 m!1300077))

(declare-fun m!1300079 () Bool)

(assert (=> b!1410380 m!1300079))

(declare-fun m!1300081 () Bool)

(assert (=> b!1410380 m!1300081))

(assert (=> b!1410380 m!1300079))

(declare-fun m!1300083 () Bool)

(assert (=> b!1410380 m!1300083))

(assert (=> b!1410380 m!1300079))

(declare-fun m!1300085 () Bool)

(assert (=> b!1410380 m!1300085))

(declare-fun m!1300087 () Bool)

(assert (=> b!1410380 m!1300087))

(declare-fun m!1300089 () Bool)

(assert (=> b!1410384 m!1300089))

(declare-fun m!1300091 () Bool)

(assert (=> b!1410382 m!1300091))

(assert (=> b!1410382 m!1300091))

(declare-fun m!1300093 () Bool)

(assert (=> b!1410382 m!1300093))

(assert (=> b!1410386 m!1300079))

(assert (=> b!1410386 m!1300079))

(declare-fun m!1300095 () Bool)

(assert (=> b!1410386 m!1300095))

(assert (=> b!1410387 m!1300079))

(assert (=> b!1410387 m!1300079))

(declare-fun m!1300097 () Bool)

(assert (=> b!1410387 m!1300097))

(declare-fun m!1300099 () Bool)

(assert (=> b!1410383 m!1300099))

(declare-fun m!1300101 () Bool)

(assert (=> b!1410383 m!1300101))

(assert (=> b!1410383 m!1300101))

(declare-fun m!1300103 () Bool)

(assert (=> b!1410383 m!1300103))

(assert (=> b!1410383 m!1300103))

(assert (=> b!1410383 m!1300101))

(declare-fun m!1300105 () Bool)

(assert (=> b!1410383 m!1300105))

(push 1)

(assert (not b!1410380))

(assert (not start!121360))

(assert (not b!1410383))

(assert (not b!1410386))

(assert (not b!1410382))

(assert (not b!1410387))

(assert (not b!1410385))

(assert (not b!1410384))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!151893 () Bool)

(declare-fun e!798197 () Bool)

(assert (=> d!151893 e!798197))

(declare-fun c!130803 () Bool)

(declare-fun lt!621179 () SeekEntryResult!10857)

(assert (=> d!151893 (= c!130803 (and (is-Intermediate!10857 lt!621179) (undefined!11669 lt!621179)))))

(declare-fun e!798193 () SeekEntryResult!10857)

(assert (=> d!151893 (= lt!621179 e!798193)))

(declare-fun c!130802 () Bool)

(assert (=> d!151893 (= c!130802 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!621180 () (_ BitVec 64))

(assert (=> d!151893 (= lt!621180 (select (arr!46546 (array!96413 (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47096 a!2901))) (toIndex!0 (select (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151893 (validMask!0 mask!2840)))

(assert (=> d!151893 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96413 (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47096 a!2901)) mask!2840) lt!621179)))

(declare-fun b!1410478 () Bool)

(assert (=> b!1410478 (and (bvsge (index!45807 lt!621179) #b00000000000000000000000000000000) (bvslt (index!45807 lt!621179) (size!47096 (array!96413 (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47096 a!2901)))))))

(declare-fun res!947817 () Bool)

(assert (=> b!1410478 (= res!947817 (= (select (arr!46546 (array!96413 (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47096 a!2901))) (index!45807 lt!621179)) (select (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun e!798196 () Bool)

(assert (=> b!1410478 (=> res!947817 e!798196)))

(declare-fun e!798195 () Bool)

(assert (=> b!1410478 (= e!798195 e!798196)))

(declare-fun b!1410479 () Bool)

(declare-fun e!798194 () SeekEntryResult!10857)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1410479 (= e!798194 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96413 (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47096 a!2901)) mask!2840))))

(declare-fun b!1410480 () Bool)

(assert (=> b!1410480 (and (bvsge (index!45807 lt!621179) #b00000000000000000000000000000000) (bvslt (index!45807 lt!621179) (size!47096 (array!96413 (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47096 a!2901)))))))

(declare-fun res!947816 () Bool)

(assert (=> b!1410480 (= res!947816 (= (select (arr!46546 (array!96413 (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47096 a!2901))) (index!45807 lt!621179)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1410480 (=> res!947816 e!798196)))

(declare-fun b!1410481 () Bool)

(assert (=> b!1410481 (= e!798197 (bvsge (x!127398 lt!621179) #b01111111111111111111111111111110))))

(declare-fun b!1410482 () Bool)

(assert (=> b!1410482 (= e!798197 e!798195)))

(declare-fun res!947818 () Bool)

(assert (=> b!1410482 (= res!947818 (and (is-Intermediate!10857 lt!621179) (not (undefined!11669 lt!621179)) (bvslt (x!127398 lt!621179) #b01111111111111111111111111111110) (bvsge (x!127398 lt!621179) #b00000000000000000000000000000000) (bvsge (x!127398 lt!621179) #b00000000000000000000000000000000)))))

(assert (=> b!1410482 (=> (not res!947818) (not e!798195))))

(declare-fun b!1410483 () Bool)

(assert (=> b!1410483 (= e!798193 (Intermediate!10857 true (toIndex!0 (select (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1410484 () Bool)

(assert (=> b!1410484 (= e!798193 e!798194)))

(declare-fun c!130801 () Bool)

(assert (=> b!1410484 (= c!130801 (or (= lt!621180 (select (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!621180 lt!621180) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1410485 () Bool)

(assert (=> b!1410485 (= e!798194 (Intermediate!10857 false (toIndex!0 (select (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1410486 () Bool)

(assert (=> b!1410486 (and (bvsge (index!45807 lt!621179) #b00000000000000000000000000000000) (bvslt (index!45807 lt!621179) (size!47096 (array!96413 (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47096 a!2901)))))))

(assert (=> b!1410486 (= e!798196 (= (select (arr!46546 (array!96413 (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47096 a!2901))) (index!45807 lt!621179)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!151893 c!130802) b!1410483))

(assert (= (and d!151893 (not c!130802)) b!1410484))

(assert (= (and b!1410484 c!130801) b!1410485))

(assert (= (and b!1410484 (not c!130801)) b!1410479))

(assert (= (and d!151893 c!130803) b!1410481))

(assert (= (and d!151893 (not c!130803)) b!1410482))

(assert (= (and b!1410482 res!947818) b!1410478))

(assert (= (and b!1410478 (not res!947817)) b!1410480))

(assert (= (and b!1410480 (not res!947816)) b!1410486))

(assert (=> b!1410479 m!1300103))

(declare-fun m!1300151 () Bool)

(assert (=> b!1410479 m!1300151))

(assert (=> b!1410479 m!1300151))

(assert (=> b!1410479 m!1300101))

(declare-fun m!1300153 () Bool)

(assert (=> b!1410479 m!1300153))

(declare-fun m!1300155 () Bool)

(assert (=> b!1410480 m!1300155))

(assert (=> d!151893 m!1300103))

(declare-fun m!1300157 () Bool)

(assert (=> d!151893 m!1300157))

(assert (=> d!151893 m!1300075))

(assert (=> b!1410486 m!1300155))

(assert (=> b!1410478 m!1300155))

(assert (=> b!1410383 d!151893))

(declare-fun d!151911 () Bool)

(declare-fun lt!621189 () (_ BitVec 32))

(declare-fun lt!621188 () (_ BitVec 32))

(assert (=> d!151911 (= lt!621189 (bvmul (bvxor lt!621188 (bvlshr lt!621188 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151911 (= lt!621188 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151911 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947819 (let ((h!34331 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127400 (bvmul (bvxor h!34331 (bvlshr h!34331 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127400 (bvlshr x!127400 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947819 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947819 #b00000000000000000000000000000000))))))

(assert (=> d!151911 (= (toIndex!0 (select (store (arr!46546 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!621189 (bvlshr lt!621189 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1410383 d!151911))

(declare-fun b!1410509 () Bool)

(declare-fun e!798212 () Bool)

(declare-fun call!67070 () Bool)

(assert (=> b!1410509 (= e!798212 call!67070)))

(declare-fun b!1410510 () Bool)

(declare-fun e!798211 () Bool)

(declare-fun e!798213 () Bool)

(assert (=> b!1410510 (= e!798211 e!798213)))

(declare-fun c!130811 () Bool)

(assert (=> b!1410510 (= c!130811 (validKeyInArray!0 (select (arr!46546 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!151919 () Bool)

(declare-fun res!947826 () Bool)

(assert (=> d!151919 (=> res!947826 e!798211)))

(assert (=> d!151919 (= res!947826 (bvsge #b00000000000000000000000000000000 (size!47096 a!2901)))))

(assert (=> d!151919 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!798211)))

(declare-fun bm!67067 () Bool)

(assert (=> bm!67067 (= call!67070 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1410511 () Bool)

(assert (=> b!1410511 (= e!798213 call!67070)))

(declare-fun b!1410512 () Bool)

(assert (=> b!1410512 (= e!798213 e!798212)))

(declare-fun lt!621203 () (_ BitVec 64))

(assert (=> b!1410512 (= lt!621203 (select (arr!46546 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!621204 () Unit!47688)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96412 (_ BitVec 64) (_ BitVec 32)) Unit!47688)

(assert (=> b!1410512 (= lt!621204 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!621203 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96412 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1410512 (arrayContainsKey!0 a!2901 lt!621203 #b00000000000000000000000000000000)))

(declare-fun lt!621205 () Unit!47688)

(assert (=> b!1410512 (= lt!621205 lt!621204)))

(declare-fun res!947827 () Bool)

(assert (=> b!1410512 (= res!947827 (= (seekEntryOrOpen!0 (select (arr!46546 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10857 #b00000000000000000000000000000000)))))

(assert (=> b!1410512 (=> (not res!947827) (not e!798212))))

(assert (= (and d!151919 (not res!947826)) b!1410510))

(assert (= (and b!1410510 c!130811) b!1410512))

(assert (= (and b!1410510 (not c!130811)) b!1410511))

(assert (= (and b!1410512 res!947827) b!1410509))

(assert (= (or b!1410509 b!1410511) bm!67067))

(declare-fun m!1300167 () Bool)

(assert (=> b!1410510 m!1300167))

(assert (=> b!1410510 m!1300167))

(declare-fun m!1300169 () Bool)

(assert (=> b!1410510 m!1300169))

(declare-fun m!1300171 () Bool)

(assert (=> bm!67067 m!1300171))

(assert (=> b!1410512 m!1300167))

(declare-fun m!1300173 () Bool)

(assert (=> b!1410512 m!1300173))

(declare-fun m!1300175 () Bool)

(assert (=> b!1410512 m!1300175))

(assert (=> b!1410512 m!1300167))

(declare-fun m!1300177 () Bool)

(assert (=> b!1410512 m!1300177))

(assert (=> b!1410384 d!151919))

(declare-fun d!151923 () Bool)

(assert (=> d!151923 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121360 d!151923))

(declare-fun d!151931 () Bool)

(assert (=> d!151931 (= (array_inv!35574 a!2901) (bvsge (size!47096 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121360 d!151931))

(declare-fun b!1410567 () Bool)

(declare-fun e!798251 () Bool)

(declare-fun contains!9810 (List!33065 (_ BitVec 64)) Bool)

(assert (=> b!1410567 (= e!798251 (contains!9810 Nil!33062 (select (arr!46546 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!67070 () Bool)

(declare-fun call!67073 () Bool)

(declare-fun c!130828 () Bool)

(assert (=> bm!67070 (= call!67073 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130828 (Cons!33061 (select (arr!46546 a!2901) #b00000000000000000000000000000000) Nil!33062) Nil!33062)))))

(declare-fun b!1410568 () Bool)

(declare-fun e!798248 () Bool)

(assert (=> b!1410568 (= e!798248 call!67073)))

(declare-fun b!1410570 () Bool)

(declare-fun e!798250 () Bool)

(assert (=> b!1410570 (= e!798250 e!798248)))

(assert (=> b!1410570 (= c!130828 (validKeyInArray!0 (select (arr!46546 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1410571 () Bool)

(assert (=> b!1410571 (= e!798248 call!67073)))

(declare-fun b!1410569 () Bool)

(declare-fun e!798249 () Bool)

(assert (=> b!1410569 (= e!798249 e!798250)))

(declare-fun res!947854 () Bool)

(assert (=> b!1410569 (=> (not res!947854) (not e!798250))))

(assert (=> b!1410569 (= res!947854 (not e!798251))))

(declare-fun res!947856 () Bool)

(assert (=> b!1410569 (=> (not res!947856) (not e!798251))))

(assert (=> b!1410569 (= res!947856 (validKeyInArray!0 (select (arr!46546 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!151933 () Bool)

(declare-fun res!947855 () Bool)

(assert (=> d!151933 (=> res!947855 e!798249)))

(assert (=> d!151933 (= res!947855 (bvsge #b00000000000000000000000000000000 (size!47096 a!2901)))))

(assert (=> d!151933 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33062) e!798249)))

(assert (= (and d!151933 (not res!947855)) b!1410569))

(assert (= (and b!1410569 res!947856) b!1410567))

(assert (= (and b!1410569 res!947854) b!1410570))

(assert (= (and b!1410570 c!130828) b!1410568))

(assert (= (and b!1410570 (not c!130828)) b!1410571))

(assert (= (or b!1410568 b!1410571) bm!67070))

(assert (=> b!1410567 m!1300167))

(assert (=> b!1410567 m!1300167))

(declare-fun m!1300195 () Bool)

(assert (=> b!1410567 m!1300195))

(assert (=> bm!67070 m!1300167))

(declare-fun m!1300197 () Bool)

(assert (=> bm!67070 m!1300197))

(assert (=> b!1410570 m!1300167))

(assert (=> b!1410570 m!1300167))

(assert (=> b!1410570 m!1300169))

(assert (=> b!1410569 m!1300167))

(assert (=> b!1410569 m!1300167))

(assert (=> b!1410569 m!1300169))

(assert (=> b!1410385 d!151933))

(declare-fun b!1410572 () Bool)

(declare-fun e!798253 () Bool)

(declare-fun call!67074 () Bool)

(assert (=> b!1410572 (= e!798253 call!67074)))

(declare-fun b!1410573 () Bool)

(declare-fun e!798252 () Bool)

(declare-fun e!798254 () Bool)

(assert (=> b!1410573 (= e!798252 e!798254)))

(declare-fun c!130829 () Bool)

(assert (=> b!1410573 (= c!130829 (validKeyInArray!0 (select (arr!46546 a!2901) j!112)))))

(declare-fun d!151937 () Bool)

(declare-fun res!947857 () Bool)

(assert (=> d!151937 (=> res!947857 e!798252)))

(assert (=> d!151937 (= res!947857 (bvsge j!112 (size!47096 a!2901)))))

(assert (=> d!151937 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!798252)))

(declare-fun bm!67071 () Bool)

(assert (=> bm!67071 (= call!67074 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1410574 () Bool)

(assert (=> b!1410574 (= e!798254 call!67074)))

(declare-fun b!1410575 () Bool)

(assert (=> b!1410575 (= e!798254 e!798253)))

(declare-fun lt!621224 () (_ BitVec 64))

(assert (=> b!1410575 (= lt!621224 (select (arr!46546 a!2901) j!112))))

(declare-fun lt!621225 () Unit!47688)

(assert (=> b!1410575 (= lt!621225 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!621224 j!112))))

(assert (=> b!1410575 (arrayContainsKey!0 a!2901 lt!621224 #b00000000000000000000000000000000)))

(declare-fun lt!621226 () Unit!47688)

(assert (=> b!1410575 (= lt!621226 lt!621225)))

(declare-fun res!947858 () Bool)

(assert (=> b!1410575 (= res!947858 (= (seekEntryOrOpen!0 (select (arr!46546 a!2901) j!112) a!2901 mask!2840) (Found!10857 j!112)))))

(assert (=> b!1410575 (=> (not res!947858) (not e!798253))))

(assert (= (and d!151937 (not res!947857)) b!1410573))

(assert (= (and b!1410573 c!130829) b!1410575))

(assert (= (and b!1410573 (not c!130829)) b!1410574))

(assert (= (and b!1410575 res!947858) b!1410572))

(assert (= (or b!1410572 b!1410574) bm!67071))

(assert (=> b!1410573 m!1300079))

(assert (=> b!1410573 m!1300079))

(assert (=> b!1410573 m!1300095))

(declare-fun m!1300199 () Bool)

(assert (=> bm!67071 m!1300199))

(assert (=> b!1410575 m!1300079))

(declare-fun m!1300201 () Bool)

(assert (=> b!1410575 m!1300201))

(declare-fun m!1300203 () Bool)

(assert (=> b!1410575 m!1300203))

(assert (=> b!1410575 m!1300079))

(assert (=> b!1410575 m!1300097))

(assert (=> b!1410380 d!151937))

(declare-fun d!151941 () Bool)

(assert (=> d!151941 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!621235 () Unit!47688)

(declare-fun choose!38 (array!96412 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47688)

(assert (=> d!151941 (= lt!621235 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151941 (validMask!0 mask!2840)))

(assert (=> d!151941 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!621235)))

(declare-fun bs!41119 () Bool)

(assert (= bs!41119 d!151941))

(assert (=> bs!41119 m!1300087))

(declare-fun m!1300213 () Bool)

(assert (=> bs!41119 m!1300213))

(assert (=> bs!41119 m!1300075))

(assert (=> b!1410380 d!151941))

(declare-fun d!151945 () Bool)

(declare-fun e!798264 () Bool)

(assert (=> d!151945 e!798264))

(declare-fun c!130835 () Bool)

(declare-fun lt!621236 () SeekEntryResult!10857)

(assert (=> d!151945 (= c!130835 (and (is-Intermediate!10857 lt!621236) (undefined!11669 lt!621236)))))

(declare-fun e!798260 () SeekEntryResult!10857)

(assert (=> d!151945 (= lt!621236 e!798260)))

(declare-fun c!130834 () Bool)

(assert (=> d!151945 (= c!130834 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!621237 () (_ BitVec 64))

(assert (=> d!151945 (= lt!621237 (select (arr!46546 a!2901) lt!621144))))

(assert (=> d!151945 (validMask!0 mask!2840)))

(assert (=> d!151945 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!621144 (select (arr!46546 a!2901) j!112) a!2901 mask!2840) lt!621236)))

(declare-fun b!1410585 () Bool)

(assert (=> b!1410585 (and (bvsge (index!45807 lt!621236) #b00000000000000000000000000000000) (bvslt (index!45807 lt!621236) (size!47096 a!2901)))))

(declare-fun res!947863 () Bool)

(assert (=> b!1410585 (= res!947863 (= (select (arr!46546 a!2901) (index!45807 lt!621236)) (select (arr!46546 a!2901) j!112)))))

(declare-fun e!798263 () Bool)

(assert (=> b!1410585 (=> res!947863 e!798263)))

(declare-fun e!798262 () Bool)

(assert (=> b!1410585 (= e!798262 e!798263)))

(declare-fun b!1410586 () Bool)

(declare-fun e!798261 () SeekEntryResult!10857)

(assert (=> b!1410586 (= e!798261 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!621144 #b00000000000000000000000000000000 mask!2840) (select (arr!46546 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410587 () Bool)

(assert (=> b!1410587 (and (bvsge (index!45807 lt!621236) #b00000000000000000000000000000000) (bvslt (index!45807 lt!621236) (size!47096 a!2901)))))

(declare-fun res!947862 () Bool)

(assert (=> b!1410587 (= res!947862 (= (select (arr!46546 a!2901) (index!45807 lt!621236)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1410587 (=> res!947862 e!798263)))

(declare-fun b!1410588 () Bool)

(assert (=> b!1410588 (= e!798264 (bvsge (x!127398 lt!621236) #b01111111111111111111111111111110))))

(declare-fun b!1410589 () Bool)

(assert (=> b!1410589 (= e!798264 e!798262)))

(declare-fun res!947864 () Bool)

(assert (=> b!1410589 (= res!947864 (and (is-Intermediate!10857 lt!621236) (not (undefined!11669 lt!621236)) (bvslt (x!127398 lt!621236) #b01111111111111111111111111111110) (bvsge (x!127398 lt!621236) #b00000000000000000000000000000000) (bvsge (x!127398 lt!621236) #b00000000000000000000000000000000)))))

(assert (=> b!1410589 (=> (not res!947864) (not e!798262))))

(declare-fun b!1410590 () Bool)

(assert (=> b!1410590 (= e!798260 (Intermediate!10857 true lt!621144 #b00000000000000000000000000000000))))

(declare-fun b!1410591 () Bool)

(assert (=> b!1410591 (= e!798260 e!798261)))

(declare-fun c!130833 () Bool)

(assert (=> b!1410591 (= c!130833 (or (= lt!621237 (select (arr!46546 a!2901) j!112)) (= (bvadd lt!621237 lt!621237) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1410592 () Bool)

(assert (=> b!1410592 (= e!798261 (Intermediate!10857 false lt!621144 #b00000000000000000000000000000000))))

(declare-fun b!1410593 () Bool)

(assert (=> b!1410593 (and (bvsge (index!45807 lt!621236) #b00000000000000000000000000000000) (bvslt (index!45807 lt!621236) (size!47096 a!2901)))))

(assert (=> b!1410593 (= e!798263 (= (select (arr!46546 a!2901) (index!45807 lt!621236)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!151945 c!130834) b!1410590))

(assert (= (and d!151945 (not c!130834)) b!1410591))

(assert (= (and b!1410591 c!130833) b!1410592))

(assert (= (and b!1410591 (not c!130833)) b!1410586))

(assert (= (and d!151945 c!130835) b!1410588))

(assert (= (and d!151945 (not c!130835)) b!1410589))

(assert (= (and b!1410589 res!947864) b!1410585))

(assert (= (and b!1410585 (not res!947863)) b!1410587))

(assert (= (and b!1410587 (not res!947862)) b!1410593))

(declare-fun m!1300215 () Bool)

(assert (=> b!1410586 m!1300215))

(assert (=> b!1410586 m!1300215))

(assert (=> b!1410586 m!1300079))

(declare-fun m!1300217 () Bool)

(assert (=> b!1410586 m!1300217))

(declare-fun m!1300219 () Bool)

(assert (=> b!1410587 m!1300219))

(declare-fun m!1300221 () Bool)

(assert (=> d!151945 m!1300221))

(assert (=> d!151945 m!1300075))

(assert (=> b!1410593 m!1300219))

(assert (=> b!1410585 m!1300219))

(assert (=> b!1410380 d!151945))

(declare-fun d!151947 () Bool)

(declare-fun lt!621239 () (_ BitVec 32))

(declare-fun lt!621238 () (_ BitVec 32))

(assert (=> d!151947 (= lt!621239 (bvmul (bvxor lt!621238 (bvlshr lt!621238 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151947 (= lt!621238 ((_ extract 31 0) (bvand (bvxor (select (arr!46546 a!2901) j!112) (bvlshr (select (arr!46546 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151947 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947819 (let ((h!34331 ((_ extract 31 0) (bvand (bvxor (select (arr!46546 a!2901) j!112) (bvlshr (select (arr!46546 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127400 (bvmul (bvxor h!34331 (bvlshr h!34331 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127400 (bvlshr x!127400 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947819 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947819 #b00000000000000000000000000000000))))))

(assert (=> d!151947 (= (toIndex!0 (select (arr!46546 a!2901) j!112) mask!2840) (bvand (bvxor lt!621239 (bvlshr lt!621239 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1410380 d!151947))

(declare-fun d!151949 () Bool)

(assert (=> d!151949 (= (validKeyInArray!0 (select (arr!46546 a!2901) j!112)) (and (not (= (select (arr!46546 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46546 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1410386 d!151949))

(declare-fun d!151951 () Bool)

(declare-fun lt!621263 () SeekEntryResult!10857)

(assert (=> d!151951 (and (or (is-Undefined!10857 lt!621263) (not (is-Found!10857 lt!621263)) (and (bvsge (index!45806 lt!621263) #b00000000000000000000000000000000) (bvslt (index!45806 lt!621263) (size!47096 a!2901)))) (or (is-Undefined!10857 lt!621263) (is-Found!10857 lt!621263) (not (is-MissingZero!10857 lt!621263)) (and (bvsge (index!45805 lt!621263) #b00000000000000000000000000000000) (bvslt (index!45805 lt!621263) (size!47096 a!2901)))) (or (is-Undefined!10857 lt!621263) (is-Found!10857 lt!621263) (is-MissingZero!10857 lt!621263) (not (is-MissingVacant!10857 lt!621263)) (and (bvsge (index!45808 lt!621263) #b00000000000000000000000000000000) (bvslt (index!45808 lt!621263) (size!47096 a!2901)))) (or (is-Undefined!10857 lt!621263) (ite (is-Found!10857 lt!621263) (= (select (arr!46546 a!2901) (index!45806 lt!621263)) (select (arr!46546 a!2901) j!112)) (ite (is-MissingZero!10857 lt!621263) (= (select (arr!46546 a!2901) (index!45805 lt!621263)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10857 lt!621263) (= (select (arr!46546 a!2901) (index!45808 lt!621263)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!798290 () SeekEntryResult!10857)

(assert (=> d!151951 (= lt!621263 e!798290)))

(declare-fun c!130857 () Bool)

(declare-fun lt!621262 () SeekEntryResult!10857)

(assert (=> d!151951 (= c!130857 (and (is-Intermediate!10857 lt!621262) (undefined!11669 lt!621262)))))

(assert (=> d!151951 (= lt!621262 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46546 a!2901) j!112) mask!2840) (select (arr!46546 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151951 (validMask!0 mask!2840)))

(assert (=> d!151951 (= (seekEntryOrOpen!0 (select (arr!46546 a!2901) j!112) a!2901 mask!2840) lt!621263)))

(declare-fun b!1410637 () Bool)

(declare-fun e!798288 () SeekEntryResult!10857)

(assert (=> b!1410637 (= e!798290 e!798288)))

(declare-fun lt!621264 () (_ BitVec 64))

(assert (=> b!1410637 (= lt!621264 (select (arr!46546 a!2901) (index!45807 lt!621262)))))

(declare-fun c!130855 () Bool)

(assert (=> b!1410637 (= c!130855 (= lt!621264 (select (arr!46546 a!2901) j!112)))))

(declare-fun b!1410638 () Bool)

(declare-fun c!130856 () Bool)

(assert (=> b!1410638 (= c!130856 (= lt!621264 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!798289 () SeekEntryResult!10857)

(assert (=> b!1410638 (= e!798288 e!798289)))

(declare-fun b!1410639 () Bool)

(assert (=> b!1410639 (= e!798289 (MissingZero!10857 (index!45807 lt!621262)))))

(declare-fun b!1410640 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96412 (_ BitVec 32)) SeekEntryResult!10857)

(assert (=> b!1410640 (= e!798289 (seekKeyOrZeroReturnVacant!0 (x!127398 lt!621262) (index!45807 lt!621262) (index!45807 lt!621262) (select (arr!46546 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1410641 () Bool)

(assert (=> b!1410641 (= e!798290 Undefined!10857)))

(declare-fun b!1410642 () Bool)

(assert (=> b!1410642 (= e!798288 (Found!10857 (index!45807 lt!621262)))))

(assert (= (and d!151951 c!130857) b!1410641))

(assert (= (and d!151951 (not c!130857)) b!1410637))

(assert (= (and b!1410637 c!130855) b!1410642))

(assert (= (and b!1410637 (not c!130855)) b!1410638))

(assert (= (and b!1410638 c!130856) b!1410639))

(assert (= (and b!1410638 (not c!130856)) b!1410640))

(assert (=> d!151951 m!1300079))

(assert (=> d!151951 m!1300083))

(declare-fun m!1300251 () Bool)

(assert (=> d!151951 m!1300251))

(declare-fun m!1300253 () Bool)

(assert (=> d!151951 m!1300253))

(assert (=> d!151951 m!1300083))

(assert (=> d!151951 m!1300079))

(declare-fun m!1300255 () Bool)

(assert (=> d!151951 m!1300255))

(assert (=> d!151951 m!1300075))

(declare-fun m!1300257 () Bool)

(assert (=> d!151951 m!1300257))

(declare-fun m!1300259 () Bool)

(assert (=> b!1410637 m!1300259))

(assert (=> b!1410640 m!1300079))

(declare-fun m!1300261 () Bool)

(assert (=> b!1410640 m!1300261))

(assert (=> b!1410387 d!151951))

(declare-fun d!151961 () Bool)

(assert (=> d!151961 (= (validKeyInArray!0 (select (arr!46546 a!2901) i!1037)) (and (not (= (select (arr!46546 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46546 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1410382 d!151961))

(push 1)

