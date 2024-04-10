; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124060 () Bool)

(assert start!124060)

(declare-fun b!1436535 () Bool)

(declare-fun res!969452 () Bool)

(declare-fun e!810644 () Bool)

(assert (=> b!1436535 (=> (not res!969452) (not e!810644))))

(declare-datatypes ((array!97697 0))(
  ( (array!97698 (arr!47144 (Array (_ BitVec 32) (_ BitVec 64))) (size!47694 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!97697)

(declare-datatypes ((List!33645 0))(
  ( (Nil!33642) (Cons!33641 (h!34976 (_ BitVec 64)) (t!48339 List!33645)) )
))
(declare-fun arrayNoDuplicates!0 (array!97697 (_ BitVec 32) List!33645) Bool)

(assert (=> b!1436535 (= res!969452 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33642))))

(declare-fun b!1436536 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!632142 () (_ BitVec 32))

(assert (=> b!1436536 (= e!810644 (and (bvsge mask!2687 #b00000000000000000000000000000000) (or (bvslt lt!632142 #b00000000000000000000000000000000) (bvsge lt!632142 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1436536 (= lt!632142 (toIndex!0 (select (arr!47144 a!2862) j!93) mask!2687))))

(declare-fun res!969451 () Bool)

(assert (=> start!124060 (=> (not res!969451) (not e!810644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124060 (= res!969451 (validMask!0 mask!2687))))

(assert (=> start!124060 e!810644))

(assert (=> start!124060 true))

(declare-fun array_inv!36172 (array!97697) Bool)

(assert (=> start!124060 (array_inv!36172 a!2862)))

(declare-fun b!1436537 () Bool)

(declare-fun res!969453 () Bool)

(assert (=> b!1436537 (=> (not res!969453) (not e!810644))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97697 (_ BitVec 32)) Bool)

(assert (=> b!1436537 (= res!969453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1436538 () Bool)

(declare-fun res!969457 () Bool)

(assert (=> b!1436538 (=> (not res!969457) (not e!810644))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1436538 (= res!969457 (validKeyInArray!0 (select (arr!47144 a!2862) j!93)))))

(declare-fun b!1436539 () Bool)

(declare-fun res!969455 () Bool)

(assert (=> b!1436539 (=> (not res!969455) (not e!810644))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1436539 (= res!969455 (and (= (size!47694 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47694 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47694 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1436540 () Bool)

(declare-fun res!969454 () Bool)

(assert (=> b!1436540 (=> (not res!969454) (not e!810644))))

(assert (=> b!1436540 (= res!969454 (validKeyInArray!0 (select (arr!47144 a!2862) i!1006)))))

(declare-fun b!1436541 () Bool)

(declare-fun res!969456 () Bool)

(assert (=> b!1436541 (=> (not res!969456) (not e!810644))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1436541 (= res!969456 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47694 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47694 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47694 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19) (= (select (store (arr!47144 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!124060 res!969451) b!1436539))

(assert (= (and b!1436539 res!969455) b!1436540))

(assert (= (and b!1436540 res!969454) b!1436538))

(assert (= (and b!1436538 res!969457) b!1436537))

(assert (= (and b!1436537 res!969453) b!1436535))

(assert (= (and b!1436535 res!969452) b!1436541))

(assert (= (and b!1436541 res!969456) b!1436536))

(declare-fun m!1325851 () Bool)

(assert (=> b!1436541 m!1325851))

(declare-fun m!1325853 () Bool)

(assert (=> b!1436541 m!1325853))

(declare-fun m!1325855 () Bool)

(assert (=> b!1436538 m!1325855))

(assert (=> b!1436538 m!1325855))

(declare-fun m!1325857 () Bool)

(assert (=> b!1436538 m!1325857))

(declare-fun m!1325859 () Bool)

(assert (=> start!124060 m!1325859))

(declare-fun m!1325861 () Bool)

(assert (=> start!124060 m!1325861))

(declare-fun m!1325863 () Bool)

(assert (=> b!1436537 m!1325863))

(declare-fun m!1325865 () Bool)

(assert (=> b!1436535 m!1325865))

(assert (=> b!1436536 m!1325855))

(assert (=> b!1436536 m!1325855))

(declare-fun m!1325867 () Bool)

(assert (=> b!1436536 m!1325867))

(declare-fun m!1325869 () Bool)

(assert (=> b!1436540 m!1325869))

(assert (=> b!1436540 m!1325869))

(declare-fun m!1325871 () Bool)

(assert (=> b!1436540 m!1325871))

(push 1)

(assert (not b!1436536))

(assert (not start!124060))

(assert (not b!1436538))

(assert (not b!1436540))

(assert (not b!1436537))

(assert (not b!1436535))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!154581 () Bool)

(assert (=> d!154581 (= (validKeyInArray!0 (select (arr!47144 a!2862) i!1006)) (and (not (= (select (arr!47144 a!2862) i!1006) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47144 a!2862) i!1006) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1436540 d!154581))

(declare-fun d!154583 () Bool)

(declare-fun res!969520 () Bool)

(declare-fun e!810684 () Bool)

(assert (=> d!154583 (=> res!969520 e!810684)))

(assert (=> d!154583 (= res!969520 (bvsge #b00000000000000000000000000000000 (size!47694 a!2862)))))

(assert (=> d!154583 (= (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33642) e!810684)))

(declare-fun b!1436617 () Bool)

(declare-fun e!810683 () Bool)

(declare-fun call!67614 () Bool)

(assert (=> b!1436617 (= e!810683 call!67614)))

(declare-fun b!1436618 () Bool)

(declare-fun e!810686 () Bool)

(assert (=> b!1436618 (= e!810684 e!810686)))

(declare-fun res!969521 () Bool)

(assert (=> b!1436618 (=> (not res!969521) (not e!810686))))

(declare-fun e!810685 () Bool)

(assert (=> b!1436618 (= res!969521 (not e!810685))))

(declare-fun res!969519 () Bool)

(assert (=> b!1436618 (=> (not res!969519) (not e!810685))))

(assert (=> b!1436618 (= res!969519 (validKeyInArray!0 (select (arr!47144 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1436619 () Bool)

(assert (=> b!1436619 (= e!810683 call!67614)))

(declare-fun b!1436620 () Bool)

(assert (=> b!1436620 (= e!810686 e!810683)))

(declare-fun c!133052 () Bool)

(assert (=> b!1436620 (= c!133052 (validKeyInArray!0 (select (arr!47144 a!2862) #b00000000000000000000000000000000)))))

(declare-fun b!1436621 () Bool)

(declare-fun contains!9885 (List!33645 (_ BitVec 64)) Bool)

(assert (=> b!1436621 (= e!810685 (contains!9885 Nil!33642 (select (arr!47144 a!2862) #b00000000000000000000000000000000)))))

(declare-fun bm!67611 () Bool)

(assert (=> bm!67611 (= call!67614 (arrayNoDuplicates!0 a!2862 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!133052 (Cons!33641 (select (arr!47144 a!2862) #b00000000000000000000000000000000) Nil!33642) Nil!33642)))))

(assert (= (and d!154583 (not res!969520)) b!1436618))

(assert (= (and b!1436618 res!969519) b!1436621))

(assert (= (and b!1436618 res!969521) b!1436620))

(assert (= (and b!1436620 c!133052) b!1436619))

(assert (= (and b!1436620 (not c!133052)) b!1436617))

(assert (= (or b!1436619 b!1436617) bm!67611))

(declare-fun m!1325925 () Bool)

(assert (=> b!1436618 m!1325925))

(assert (=> b!1436618 m!1325925))

(declare-fun m!1325927 () Bool)

(assert (=> b!1436618 m!1325927))

(assert (=> b!1436620 m!1325925))

(assert (=> b!1436620 m!1325925))

(assert (=> b!1436620 m!1325927))

(assert (=> b!1436621 m!1325925))

(assert (=> b!1436621 m!1325925))

(declare-fun m!1325929 () Bool)

(assert (=> b!1436621 m!1325929))

(assert (=> bm!67611 m!1325925))

(declare-fun m!1325931 () Bool)

(assert (=> bm!67611 m!1325931))

(assert (=> b!1436535 d!154583))

(declare-fun b!1436634 () Bool)

(declare-fun e!810696 () Bool)

(declare-fun e!810697 () Bool)

(assert (=> b!1436634 (= e!810696 e!810697)))

(declare-fun c!133056 () Bool)

(assert (=> b!1436634 (= c!133056 (validKeyInArray!0 (select (arr!47144 a!2862) #b00000000000000000000000000000000)))))

(declare-fun d!154585 () Bool)

(declare-fun res!969529 () Bool)

(assert (=> d!154585 (=> res!969529 e!810696)))

(assert (=> d!154585 (= res!969529 (bvsge #b00000000000000000000000000000000 (size!47694 a!2862)))))

(assert (=> d!154585 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687) e!810696)))

(declare-fun bm!67615 () Bool)

(declare-fun call!67618 () Bool)

(assert (=> bm!67615 (= call!67618 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2862 mask!2687))))

(declare-fun b!1436635 () Bool)

(declare-fun e!810698 () Bool)

(assert (=> b!1436635 (= e!810698 call!67618)))

(declare-fun b!1436636 () Bool)

(assert (=> b!1436636 (= e!810697 call!67618)))

(declare-fun b!1436637 () Bool)

(assert (=> b!1436637 (= e!810697 e!810698)))

(declare-fun lt!632168 () (_ BitVec 64))

(assert (=> b!1436637 (= lt!632168 (select (arr!47144 a!2862) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!48552 0))(
  ( (Unit!48553) )
))
(declare-fun lt!632170 () Unit!48552)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!97697 (_ BitVec 64) (_ BitVec 32)) Unit!48552)

(assert (=> b!1436637 (= lt!632170 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2862 lt!632168 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!97697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1436637 (arrayContainsKey!0 a!2862 lt!632168 #b00000000000000000000000000000000)))

(declare-fun lt!632169 () Unit!48552)

(assert (=> b!1436637 (= lt!632169 lt!632170)))

(declare-fun res!969530 () Bool)

(declare-datatypes ((SeekEntryResult!11403 0))(
  ( (MissingZero!11403 (index!48004 (_ BitVec 32))) (Found!11403 (index!48005 (_ BitVec 32))) (Intermediate!11403 (undefined!12215 Bool) (index!48006 (_ BitVec 32)) (x!129724 (_ BitVec 32))) (Undefined!11403) (MissingVacant!11403 (index!48007 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97697 (_ BitVec 32)) SeekEntryResult!11403)

(assert (=> b!1436637 (= res!969530 (= (seekEntryOrOpen!0 (select (arr!47144 a!2862) #b00000000000000000000000000000000) a!2862 mask!2687) (Found!11403 #b00000000000000000000000000000000)))))

(assert (=> b!1436637 (=> (not res!969530) (not e!810698))))

(assert (= (and d!154585 (not res!969529)) b!1436634))

(assert (= (and b!1436634 c!133056) b!1436637))

(assert (= (and b!1436634 (not c!133056)) b!1436636))

(assert (= (and b!1436637 res!969530) b!1436635))

(assert (= (or b!1436635 b!1436636) bm!67615))

(assert (=> b!1436634 m!1325925))

(assert (=> b!1436634 m!1325925))

(assert (=> b!1436634 m!1325927))

(declare-fun m!1325941 () Bool)

(assert (=> bm!67615 m!1325941))

(assert (=> b!1436637 m!1325925))

(declare-fun m!1325943 () Bool)

(assert (=> b!1436637 m!1325943))

(declare-fun m!1325945 () Bool)

(assert (=> b!1436637 m!1325945))

(assert (=> b!1436637 m!1325925))

(declare-fun m!1325947 () Bool)

(assert (=> b!1436637 m!1325947))

(assert (=> b!1436537 d!154585))

(declare-fun d!154589 () Bool)

(assert (=> d!154589 (= (validKeyInArray!0 (select (arr!47144 a!2862) j!93)) (and (not (= (select (arr!47144 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47144 a!2862) j!93) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1436538 d!154589))

(declare-fun d!154591 () Bool)

(assert (=> d!154591 (= (validMask!0 mask!2687) (and (or (= mask!2687 #b00000000000000000000000000000111) (= mask!2687 #b00000000000000000000000000001111) (= mask!2687 #b00000000000000000000000000011111) (= mask!2687 #b00000000000000000000000000111111) (= mask!2687 #b00000000000000000000000001111111) (= mask!2687 #b00000000000000000000000011111111) (= mask!2687 #b00000000000000000000000111111111) (= mask!2687 #b00000000000000000000001111111111) (= mask!2687 #b00000000000000000000011111111111) (= mask!2687 #b00000000000000000000111111111111) (= mask!2687 #b00000000000000000001111111111111) (= mask!2687 #b00000000000000000011111111111111) (= mask!2687 #b00000000000000000111111111111111) (= mask!2687 #b00000000000000001111111111111111) (= mask!2687 #b00000000000000011111111111111111) (= mask!2687 #b00000000000000111111111111111111) (= mask!2687 #b00000000000001111111111111111111) (= mask!2687 #b00000000000011111111111111111111) (= mask!2687 #b00000000000111111111111111111111) (= mask!2687 #b00000000001111111111111111111111) (= mask!2687 #b00000000011111111111111111111111) (= mask!2687 #b00000000111111111111111111111111) (= mask!2687 #b00000001111111111111111111111111) (= mask!2687 #b00000011111111111111111111111111) (= mask!2687 #b00000111111111111111111111111111) (= mask!2687 #b00001111111111111111111111111111) (= mask!2687 #b00011111111111111111111111111111) (= mask!2687 #b00111111111111111111111111111111)) (bvsle mask!2687 #b00111111111111111111111111111111)))))

(assert (=> start!124060 d!154591))

(declare-fun d!154595 () Bool)

(assert (=> d!154595 (= (array_inv!36172 a!2862) (bvsge (size!47694 a!2862) #b00000000000000000000000000000000))))

(assert (=> start!124060 d!154595))

(declare-fun d!154599 () Bool)

(declare-fun lt!632178 () (_ BitVec 32))

(declare-fun lt!632177 () (_ BitVec 32))

(assert (=> d!154599 (= lt!632178 (bvmul (bvxor lt!632177 (bvlshr lt!632177 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!154599 (= lt!632177 ((_ extract 31 0) (bvand (bvxor (select (arr!47144 a!2862) j!93) (bvlshr (select (arr!47144 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!154599 (and (bvsge mask!2687 #b00000000000000000000000000000000) (let ((res!969531 (let ((h!34980 ((_ extract 31 0) (bvand (bvxor (select (arr!47144 a!2862) j!93) (bvlshr (select (arr!47144 a!2862) j!93) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!129721 (bvmul (bvxor h!34980 (bvlshr h!34980 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!129721 (bvlshr x!129721 #b00000000000000000000000000001101)) mask!2687))))) (and (bvslt res!969531 (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge res!969531 #b00000000000000000000000000000000))))))

(assert (=> d!154599 (= (toIndex!0 (select (arr!47144 a!2862) j!93) mask!2687) (bvand (bvxor lt!632178 (bvlshr lt!632178 #b00000000000000000000000000001101)) mask!2687))))

(assert (=> b!1436536 d!154599))

(push 1)

(assert (not b!1436634))

(assert (not b!1436618))

(assert (not b!1436637))

(assert (not bm!67615))

(assert (not b!1436621))

(assert (not bm!67611))

(assert (not b!1436620))

(check-sat)

