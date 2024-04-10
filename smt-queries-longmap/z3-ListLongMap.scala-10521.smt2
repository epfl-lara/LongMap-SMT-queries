; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124062 () Bool)

(assert start!124062)

(declare-fun b!1436556 () Bool)

(declare-fun res!969478 () Bool)

(declare-fun e!810650 () Bool)

(assert (=> b!1436556 (=> (not res!969478) (not e!810650))))

(declare-datatypes ((array!97699 0))(
  ( (array!97700 (arr!47145 (Array (_ BitVec 32) (_ BitVec 64))) (size!47695 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97699)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436556 (= res!969478 (validKeyInArray!0 (select (arr!47145 a!2862) i!1006)))))

(declare-fun b!1436557 () Bool)

(declare-fun res!969474 () Bool)

(assert (=> b!1436557 (=> (not res!969474) (not e!810650))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1436557 (= res!969474 (validKeyInArray!0 (select (arr!47145 a!2862) j!93)))))

(declare-fun b!1436558 () Bool)

(declare-fun res!969473 () Bool)

(assert (=> b!1436558 (=> (not res!969473) (not e!810650))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436558 (= res!969473 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47695 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47695 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47695 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47145 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1436559 () Bool)

(declare-fun res!969476 () Bool)

(assert (=> b!1436559 (=> (not res!969476) (not e!810650))))

(declare-fun mask!2687 () (_ BitVec 32))

(assert (=> b!1436559 (= res!969476 (and (= (size!47695 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47695 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47695 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436560 () Bool)

(declare-fun lt!632145 () (_ BitVec 32))

(assert (=> b!1436560 (= e!810650 (and (bvsge mask!2687 #b00000000000000000000000000000000) (or (bvslt lt!632145 #b00000000000000000000000000000000) (bvsge lt!632145 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436560 (= lt!632145 (toIndex!0 (select (arr!47145 a!2862) j!93) mask!2687))))

(declare-fun b!1436562 () Bool)

(declare-fun res!969475 () Bool)

(assert (=> b!1436562 (=> (not res!969475) (not e!810650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97699 (_ BitVec 32)) Bool)

(assert (=> b!1436562 (= res!969475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!969477 () Bool)

(assert (=> start!124062 (=> (not res!969477) (not e!810650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124062 (= res!969477 (validMask!0 mask!2687))))

(assert (=> start!124062 e!810650))

(assert (=> start!124062 true))

(declare-fun array_inv!36173 (array!97699) Bool)

(assert (=> start!124062 (array_inv!36173 a!2862)))

(declare-fun b!1436561 () Bool)

(declare-fun res!969472 () Bool)

(assert (=> b!1436561 (=> (not res!969472) (not e!810650))))

(declare-datatypes ((List!33646 0))(
  ( (Nil!33643) (Cons!33642 (h!34977 (_ BitVec 64)) (t!48340 List!33646)) )
))
(declare-fun arrayNoDuplicates!0 (array!97699 (_ BitVec 32) List!33646) Bool)

(assert (=> b!1436561 (= res!969472 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33643))))

(assert (= (and start!124062 res!969477) b!1436559))

(assert (= (and b!1436559 res!969476) b!1436556))

(assert (= (and b!1436556 res!969478) b!1436557))

(assert (= (and b!1436557 res!969474) b!1436562))

(assert (= (and b!1436562 res!969475) b!1436561))

(assert (= (and b!1436561 res!969472) b!1436558))

(assert (= (and b!1436558 res!969473) b!1436560))

(declare-fun m!1325873 () Bool)

(assert (=> start!124062 m!1325873))

(declare-fun m!1325875 () Bool)

(assert (=> start!124062 m!1325875))

(declare-fun m!1325877 () Bool)

(assert (=> b!1436558 m!1325877))

(declare-fun m!1325879 () Bool)

(assert (=> b!1436558 m!1325879))

(declare-fun m!1325881 () Bool)

(assert (=> b!1436562 m!1325881))

(declare-fun m!1325883 () Bool)

(assert (=> b!1436556 m!1325883))

(assert (=> b!1436556 m!1325883))

(declare-fun m!1325885 () Bool)

(assert (=> b!1436556 m!1325885))

(declare-fun m!1325887 () Bool)

(assert (=> b!1436557 m!1325887))

(assert (=> b!1436557 m!1325887))

(declare-fun m!1325889 () Bool)

(assert (=> b!1436557 m!1325889))

(declare-fun m!1325891 () Bool)

(assert (=> b!1436561 m!1325891))

(assert (=> b!1436560 m!1325887))

(assert (=> b!1436560 m!1325887))

(declare-fun m!1325893 () Bool)

(assert (=> b!1436560 m!1325893))

(check-sat (not b!1436556) (not b!1436561) (not b!1436562) (not start!124062) (not b!1436560) (not b!1436557))
(check-sat)
(get-model)

(declare-fun b!1436594 () Bool)

(declare-fun e!810665 () Bool)

(declare-fun call!67609 () Bool)

(assert (=> b!1436594 (= e!810665 call!67609)))

(declare-fun bm!67606 () Bool)

(declare-fun c!133047 () Bool)

(assert (=> bm!67606 (= call!67609 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133047 (Cons!33642 (select (arr!47145 a!2862) #b00000000000000000000000000000000) Nil!33643) Nil!33643)))))

(declare-fun b!1436595 () Bool)

(declare-fun e!810666 () Bool)

(declare-fun contains!9884 (List!33646 (_ BitVec 64)) Bool)

(assert (=> b!1436595 (= e!810666 (contains!9884 Nil!33643 (select (arr!47145 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1436596 () Bool)

(declare-fun e!810668 () Bool)

(declare-fun e!810667 () Bool)

(assert (=> b!1436596 (= e!810668 e!810667)))

(declare-fun res!969507 () Bool)

(assert (=> b!1436596 (=> (not res!969507) (not e!810667))))

(assert (=> b!1436596 (= res!969507 (not e!810666))))

(declare-fun res!969508 () Bool)

(assert (=> b!1436596 (=> (not res!969508) (not e!810666))))

(assert (=> b!1436596 (= res!969508 (validKeyInArray!0 (select (arr!47145 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!154575 () Bool)

(declare-fun res!969506 () Bool)

(assert (=> d!154575 (=> res!969506 e!810668)))

(assert (=> d!154575 (= res!969506 (bvsge #b00000000000000000000000000000000 (size!47695 a!2862)))))

(assert (=> d!154575 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33643) e!810668)))

(declare-fun b!1436597 () Bool)

(assert (=> b!1436597 (= e!810667 e!810665)))

(assert (=> b!1436597 (= c!133047 (validKeyInArray!0 (select (arr!47145 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1436598 () Bool)

(assert (=> b!1436598 (= e!810665 call!67609)))

(assert (= (and d!154575 (not res!969506)) b!1436596))

(assert (= (and b!1436596 res!969508) b!1436595))

(assert (= (and b!1436596 res!969507) b!1436597))

(assert (= (and b!1436597 c!133047) b!1436598))

(assert (= (and b!1436597 (not c!133047)) b!1436594))

(assert (= (or b!1436598 b!1436594) bm!67606))

(declare-fun m!1325917 () Bool)

(assert (=> bm!67606 m!1325917))

(declare-fun m!1325919 () Bool)

(assert (=> bm!67606 m!1325919))

(assert (=> b!1436595 m!1325917))

(assert (=> b!1436595 m!1325917))

(declare-fun m!1325921 () Bool)

(assert (=> b!1436595 m!1325921))

(assert (=> b!1436596 m!1325917))

(assert (=> b!1436596 m!1325917))

(declare-fun m!1325923 () Bool)

(assert (=> b!1436596 m!1325923))

(assert (=> b!1436597 m!1325917))

(assert (=> b!1436597 m!1325917))

(assert (=> b!1436597 m!1325923))

(assert (=> b!1436561 d!154575))

(declare-fun d!154577 () Bool)

(assert (=> d!154577 (= (validKeyInArray!0 (select (arr!47145 a!2862) i!1006)) (and (not (= (select (arr!47145 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47145 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1436556 d!154577))

(declare-fun d!154579 () Bool)

(declare-fun res!969523 () Bool)

(declare-fun e!810689 () Bool)

(assert (=> d!154579 (=> res!969523 e!810689)))

(assert (=> d!154579 (= res!969523 (bvsge #b00000000000000000000000000000000 (size!47695 a!2862)))))

(assert (=> d!154579 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!810689)))

(declare-fun b!1436622 () Bool)

(declare-fun e!810688 () Bool)

(assert (=> b!1436622 (= e!810689 e!810688)))

(declare-fun c!133053 () Bool)

(assert (=> b!1436622 (= c!133053 (validKeyInArray!0 (select (arr!47145 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1436623 () Bool)

(declare-fun call!67615 () Bool)

(assert (=> b!1436623 (= e!810688 call!67615)))

(declare-fun b!1436624 () Bool)

(declare-fun e!810687 () Bool)

(assert (=> b!1436624 (= e!810688 e!810687)))

(declare-fun lt!632157 () (_ BitVec 64))

(assert (=> b!1436624 (= lt!632157 (select (arr!47145 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48550 0))(
  ( (Unit!48551) )
))
(declare-fun lt!632156 () Unit!48550)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97699 (_ BitVec 64) (_ BitVec 32)) Unit!48550)

(assert (=> b!1436624 (= lt!632156 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632157 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1436624 (arrayContainsKey!0 a!2862 lt!632157 #b00000000000000000000000000000000)))

(declare-fun lt!632155 () Unit!48550)

(assert (=> b!1436624 (= lt!632155 lt!632156)))

(declare-fun res!969522 () Bool)

(declare-datatypes ((SeekEntryResult!11402 0))(
  ( (MissingZero!11402 (index!48000 (_ BitVec 32))) (Found!11402 (index!48001 (_ BitVec 32))) (Intermediate!11402 (undefined!12214 Bool) (index!48002 (_ BitVec 32)) (x!129723 (_ BitVec 32))) (Undefined!11402) (MissingVacant!11402 (index!48003 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97699 (_ BitVec 32)) SeekEntryResult!11402)

(assert (=> b!1436624 (= res!969522 (= (seekEntryOrOpen!0 (select (arr!47145 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11402 #b00000000000000000000000000000000)))))

(assert (=> b!1436624 (=> (not res!969522) (not e!810687))))

(declare-fun bm!67612 () Bool)

(assert (=> bm!67612 (= call!67615 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1436625 () Bool)

(assert (=> b!1436625 (= e!810687 call!67615)))

(assert (= (and d!154579 (not res!969523)) b!1436622))

(assert (= (and b!1436622 c!133053) b!1436624))

(assert (= (and b!1436622 (not c!133053)) b!1436623))

(assert (= (and b!1436624 res!969522) b!1436625))

(assert (= (or b!1436625 b!1436623) bm!67612))

(assert (=> b!1436622 m!1325917))

(assert (=> b!1436622 m!1325917))

(assert (=> b!1436622 m!1325923))

(assert (=> b!1436624 m!1325917))

(declare-fun m!1325933 () Bool)

(assert (=> b!1436624 m!1325933))

(declare-fun m!1325935 () Bool)

(assert (=> b!1436624 m!1325935))

(assert (=> b!1436624 m!1325917))

(declare-fun m!1325937 () Bool)

(assert (=> b!1436624 m!1325937))

(declare-fun m!1325939 () Bool)

(assert (=> bm!67612 m!1325939))

(assert (=> b!1436562 d!154579))

(declare-fun d!154587 () Bool)

(declare-fun lt!632172 () (_ BitVec 32))

(declare-fun lt!632171 () (_ BitVec 32))

(assert (=> d!154587 (= lt!632172 (bvmul (bvxor lt!632171 (bvlshr lt!632171 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154587 (= lt!632171 ((_ extract 31 0) (bvand (bvxor (select (arr!47145 a!2862) j!93) (bvlshr (select (arr!47145 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154587 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!969524 (let ((h!34979 ((_ extract 31 0) (bvand (bvxor (select (arr!47145 a!2862) j!93) (bvlshr (select (arr!47145 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129720 (bvmul (bvxor h!34979 (bvlshr h!34979 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129720 (bvlshr x!129720 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!969524 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!969524 #b00000000000000000000000000000000))))))

(assert (=> d!154587 (= (toIndex!0 (select (arr!47145 a!2862) j!93) mask!2687) (bvand (bvxor lt!632172 (bvlshr lt!632172 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1436560 d!154587))

(declare-fun d!154593 () Bool)

(assert (=> d!154593 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124062 d!154593))

(declare-fun d!154603 () Bool)

(assert (=> d!154603 (= (array_inv!36173 a!2862) (bvsge (size!47695 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124062 d!154603))

(declare-fun d!154605 () Bool)

(assert (=> d!154605 (= (validKeyInArray!0 (select (arr!47145 a!2862) j!93)) (and (not (= (select (arr!47145 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47145 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1436557 d!154605))

(check-sat (not b!1436624) (not b!1436596) (not b!1436597) (not bm!67606) (not b!1436622) (not b!1436595) (not bm!67612))
(check-sat)
