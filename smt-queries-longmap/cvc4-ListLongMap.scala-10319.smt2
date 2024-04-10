; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121240 () Bool)

(assert start!121240)

(declare-fun b!1409726 () Bool)

(declare-fun res!947449 () Bool)

(declare-fun e!797741 () Bool)

(assert (=> b!1409726 (=> (not res!947449) (not e!797741))))

(declare-datatypes ((array!96394 0))(
  ( (array!96395 (arr!46540 (Array (_ BitVec 32) (_ BitVec 64))) (size!47090 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96394)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409726 (= res!947449 (validKeyInArray!0 (select (arr!46540 a!2901) i!1037)))))

(declare-fun b!1409727 () Bool)

(declare-fun res!947448 () Bool)

(assert (=> b!1409727 (=> (not res!947448) (not e!797741))))

(declare-datatypes ((List!33059 0))(
  ( (Nil!33056) (Cons!33055 (h!34318 (_ BitVec 64)) (t!47753 List!33059)) )
))
(declare-fun arrayNoDuplicates!0 (array!96394 (_ BitVec 32) List!33059) Bool)

(assert (=> b!1409727 (= res!947448 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33056))))

(declare-fun b!1409728 () Bool)

(declare-fun res!947450 () Bool)

(assert (=> b!1409728 (=> (not res!947450) (not e!797741))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1409728 (= res!947450 (and (= (size!47090 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47090 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47090 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409729 () Bool)

(declare-fun e!797739 () Bool)

(assert (=> b!1409729 (= e!797741 (not e!797739))))

(declare-fun res!947453 () Bool)

(assert (=> b!1409729 (=> res!947453 e!797739)))

(declare-datatypes ((SeekEntryResult!10851 0))(
  ( (MissingZero!10851 (index!45781 (_ BitVec 32))) (Found!10851 (index!45782 (_ BitVec 32))) (Intermediate!10851 (undefined!11663 Bool) (index!45783 (_ BitVec 32)) (x!127364 (_ BitVec 32))) (Undefined!10851) (MissingVacant!10851 (index!45784 (_ BitVec 32))) )
))
(declare-fun lt!620831 () SeekEntryResult!10851)

(assert (=> b!1409729 (= res!947453 (or (not (is-Intermediate!10851 lt!620831)) (undefined!11663 lt!620831)))))

(declare-fun e!797738 () Bool)

(assert (=> b!1409729 e!797738))

(declare-fun res!947455 () Bool)

(assert (=> b!1409729 (=> (not res!947455) (not e!797738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96394 (_ BitVec 32)) Bool)

(assert (=> b!1409729 (= res!947455 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47676 0))(
  ( (Unit!47677) )
))
(declare-fun lt!620832 () Unit!47676)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47676)

(assert (=> b!1409729 (= lt!620832 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96394 (_ BitVec 32)) SeekEntryResult!10851)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409729 (= lt!620831 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46540 a!2901) j!112) mask!2840) (select (arr!46540 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409730 () Bool)

(declare-fun res!947452 () Bool)

(assert (=> b!1409730 (=> (not res!947452) (not e!797741))))

(assert (=> b!1409730 (= res!947452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!947454 () Bool)

(assert (=> start!121240 (=> (not res!947454) (not e!797741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121240 (= res!947454 (validMask!0 mask!2840))))

(assert (=> start!121240 e!797741))

(assert (=> start!121240 true))

(declare-fun array_inv!35568 (array!96394) Bool)

(assert (=> start!121240 (array_inv!35568 a!2901)))

(declare-fun b!1409731 () Bool)

(declare-fun lt!620830 () SeekEntryResult!10851)

(assert (=> b!1409731 (= e!797739 (or (= lt!620831 lt!620830) (not (is-Intermediate!10851 lt!620830)) (and (bvsge (x!127364 lt!620831) #b00000000000000000000000000000000) (bvsle (x!127364 lt!620831) #b01111111111111111111111111111110))))))

(assert (=> b!1409731 (= lt!620830 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96395 (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47090 a!2901)) mask!2840))))

(declare-fun b!1409732 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96394 (_ BitVec 32)) SeekEntryResult!10851)

(assert (=> b!1409732 (= e!797738 (= (seekEntryOrOpen!0 (select (arr!46540 a!2901) j!112) a!2901 mask!2840) (Found!10851 j!112)))))

(declare-fun b!1409733 () Bool)

(declare-fun res!947451 () Bool)

(assert (=> b!1409733 (=> (not res!947451) (not e!797741))))

(assert (=> b!1409733 (= res!947451 (validKeyInArray!0 (select (arr!46540 a!2901) j!112)))))

(assert (= (and start!121240 res!947454) b!1409728))

(assert (= (and b!1409728 res!947450) b!1409726))

(assert (= (and b!1409726 res!947449) b!1409733))

(assert (= (and b!1409733 res!947451) b!1409730))

(assert (= (and b!1409730 res!947452) b!1409727))

(assert (= (and b!1409727 res!947448) b!1409729))

(assert (= (and b!1409729 res!947455) b!1409732))

(assert (= (and b!1409729 (not res!947453)) b!1409731))

(declare-fun m!1299563 () Bool)

(assert (=> b!1409733 m!1299563))

(assert (=> b!1409733 m!1299563))

(declare-fun m!1299565 () Bool)

(assert (=> b!1409733 m!1299565))

(declare-fun m!1299567 () Bool)

(assert (=> b!1409731 m!1299567))

(declare-fun m!1299569 () Bool)

(assert (=> b!1409731 m!1299569))

(assert (=> b!1409731 m!1299569))

(declare-fun m!1299571 () Bool)

(assert (=> b!1409731 m!1299571))

(assert (=> b!1409731 m!1299571))

(assert (=> b!1409731 m!1299569))

(declare-fun m!1299573 () Bool)

(assert (=> b!1409731 m!1299573))

(declare-fun m!1299575 () Bool)

(assert (=> start!121240 m!1299575))

(declare-fun m!1299577 () Bool)

(assert (=> start!121240 m!1299577))

(assert (=> b!1409729 m!1299563))

(declare-fun m!1299579 () Bool)

(assert (=> b!1409729 m!1299579))

(assert (=> b!1409729 m!1299563))

(declare-fun m!1299581 () Bool)

(assert (=> b!1409729 m!1299581))

(assert (=> b!1409729 m!1299579))

(assert (=> b!1409729 m!1299563))

(declare-fun m!1299583 () Bool)

(assert (=> b!1409729 m!1299583))

(declare-fun m!1299585 () Bool)

(assert (=> b!1409729 m!1299585))

(declare-fun m!1299587 () Bool)

(assert (=> b!1409730 m!1299587))

(declare-fun m!1299589 () Bool)

(assert (=> b!1409727 m!1299589))

(declare-fun m!1299591 () Bool)

(assert (=> b!1409726 m!1299591))

(assert (=> b!1409726 m!1299591))

(declare-fun m!1299593 () Bool)

(assert (=> b!1409726 m!1299593))

(assert (=> b!1409732 m!1299563))

(assert (=> b!1409732 m!1299563))

(declare-fun m!1299595 () Bool)

(assert (=> b!1409732 m!1299595))

(push 1)

(assert (not start!121240))

(assert (not b!1409733))

(assert (not b!1409729))

(assert (not b!1409731))

(assert (not b!1409732))

(assert (not b!1409730))

(assert (not b!1409727))

(assert (not b!1409726))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!151733 () Bool)

(declare-fun res!947470 () Bool)

(declare-fun e!797769 () Bool)

(assert (=> d!151733 (=> res!947470 e!797769)))

(assert (=> d!151733 (= res!947470 (bvsge j!112 (size!47090 a!2901)))))

(assert (=> d!151733 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!797769)))

(declare-fun b!1409774 () Bool)

(declare-fun e!797770 () Bool)

(assert (=> b!1409774 (= e!797769 e!797770)))

(declare-fun c!130619 () Bool)

(assert (=> b!1409774 (= c!130619 (validKeyInArray!0 (select (arr!46540 a!2901) j!112)))))

(declare-fun b!1409775 () Bool)

(declare-fun call!67020 () Bool)

(assert (=> b!1409775 (= e!797770 call!67020)))

(declare-fun b!1409776 () Bool)

(declare-fun e!797771 () Bool)

(assert (=> b!1409776 (= e!797771 call!67020)))

(declare-fun bm!67017 () Bool)

(assert (=> bm!67017 (= call!67020 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1409777 () Bool)

(assert (=> b!1409777 (= e!797770 e!797771)))

(declare-fun lt!620862 () (_ BitVec 64))

(assert (=> b!1409777 (= lt!620862 (select (arr!46540 a!2901) j!112))))

(declare-fun lt!620861 () Unit!47676)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96394 (_ BitVec 64) (_ BitVec 32)) Unit!47676)

(assert (=> b!1409777 (= lt!620861 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!620862 j!112))))

(declare-fun arrayContainsKey!0 (array!96394 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1409777 (arrayContainsKey!0 a!2901 lt!620862 #b00000000000000000000000000000000)))

(declare-fun lt!620860 () Unit!47676)

(assert (=> b!1409777 (= lt!620860 lt!620861)))

(declare-fun res!947471 () Bool)

(assert (=> b!1409777 (= res!947471 (= (seekEntryOrOpen!0 (select (arr!46540 a!2901) j!112) a!2901 mask!2840) (Found!10851 j!112)))))

(assert (=> b!1409777 (=> (not res!947471) (not e!797771))))

(assert (= (and d!151733 (not res!947470)) b!1409774))

(assert (= (and b!1409774 c!130619) b!1409777))

(assert (= (and b!1409774 (not c!130619)) b!1409775))

(assert (= (and b!1409777 res!947471) b!1409776))

(assert (= (or b!1409776 b!1409775) bm!67017))

(assert (=> b!1409774 m!1299563))

(assert (=> b!1409774 m!1299563))

(assert (=> b!1409774 m!1299565))

(declare-fun m!1299609 () Bool)

(assert (=> bm!67017 m!1299609))

(assert (=> b!1409777 m!1299563))

(declare-fun m!1299611 () Bool)

(assert (=> b!1409777 m!1299611))

(declare-fun m!1299613 () Bool)

(assert (=> b!1409777 m!1299613))

(assert (=> b!1409777 m!1299563))

(assert (=> b!1409777 m!1299595))

(assert (=> b!1409729 d!151733))

(declare-fun d!151737 () Bool)

(assert (=> d!151737 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!620871 () Unit!47676)

(declare-fun choose!38 (array!96394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47676)

(assert (=> d!151737 (= lt!620871 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151737 (validMask!0 mask!2840)))

(assert (=> d!151737 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!620871)))

(declare-fun bs!41105 () Bool)

(assert (= bs!41105 d!151737))

(assert (=> bs!41105 m!1299585))

(declare-fun m!1299631 () Bool)

(assert (=> bs!41105 m!1299631))

(assert (=> bs!41105 m!1299575))

(assert (=> b!1409729 d!151737))

(declare-fun b!1409851 () Bool)

(declare-fun e!797814 () SeekEntryResult!10851)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409851 (= e!797814 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46540 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46540 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409852 () Bool)

(assert (=> b!1409852 (= e!797814 (Intermediate!10851 false (toIndex!0 (select (arr!46540 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1409853 () Bool)

(declare-fun e!797813 () Bool)

(declare-fun e!797816 () Bool)

(assert (=> b!1409853 (= e!797813 e!797816)))

(declare-fun res!947497 () Bool)

(declare-fun lt!620889 () SeekEntryResult!10851)

(assert (=> b!1409853 (= res!947497 (and (is-Intermediate!10851 lt!620889) (not (undefined!11663 lt!620889)) (bvslt (x!127364 lt!620889) #b01111111111111111111111111111110) (bvsge (x!127364 lt!620889) #b00000000000000000000000000000000) (bvsge (x!127364 lt!620889) #b00000000000000000000000000000000)))))

(assert (=> b!1409853 (=> (not res!947497) (not e!797816))))

(declare-fun b!1409854 () Bool)

(declare-fun e!797815 () SeekEntryResult!10851)

(assert (=> b!1409854 (= e!797815 e!797814)))

(declare-fun lt!620890 () (_ BitVec 64))

(declare-fun c!130647 () Bool)

(assert (=> b!1409854 (= c!130647 (or (= lt!620890 (select (arr!46540 a!2901) j!112)) (= (bvadd lt!620890 lt!620890) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1409856 () Bool)

(assert (=> b!1409856 (and (bvsge (index!45783 lt!620889) #b00000000000000000000000000000000) (bvslt (index!45783 lt!620889) (size!47090 a!2901)))))

(declare-fun res!947496 () Bool)

(assert (=> b!1409856 (= res!947496 (= (select (arr!46540 a!2901) (index!45783 lt!620889)) (select (arr!46540 a!2901) j!112)))))

(declare-fun e!797817 () Bool)

(assert (=> b!1409856 (=> res!947496 e!797817)))

(assert (=> b!1409856 (= e!797816 e!797817)))

(declare-fun b!1409857 () Bool)

(assert (=> b!1409857 (= e!797813 (bvsge (x!127364 lt!620889) #b01111111111111111111111111111110))))

(declare-fun b!1409858 () Bool)

(assert (=> b!1409858 (= e!797815 (Intermediate!10851 true (toIndex!0 (select (arr!46540 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1409859 () Bool)

(assert (=> b!1409859 (and (bvsge (index!45783 lt!620889) #b00000000000000000000000000000000) (bvslt (index!45783 lt!620889) (size!47090 a!2901)))))

(assert (=> b!1409859 (= e!797817 (= (select (arr!46540 a!2901) (index!45783 lt!620889)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1409855 () Bool)

(assert (=> b!1409855 (and (bvsge (index!45783 lt!620889) #b00000000000000000000000000000000) (bvslt (index!45783 lt!620889) (size!47090 a!2901)))))

(declare-fun res!947495 () Bool)

(assert (=> b!1409855 (= res!947495 (= (select (arr!46540 a!2901) (index!45783 lt!620889)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1409855 (=> res!947495 e!797817)))

(declare-fun d!151745 () Bool)

(assert (=> d!151745 e!797813))

(declare-fun c!130646 () Bool)

(assert (=> d!151745 (= c!130646 (and (is-Intermediate!10851 lt!620889) (undefined!11663 lt!620889)))))

(assert (=> d!151745 (= lt!620889 e!797815)))

(declare-fun c!130645 () Bool)

(assert (=> d!151745 (= c!130645 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151745 (= lt!620890 (select (arr!46540 a!2901) (toIndex!0 (select (arr!46540 a!2901) j!112) mask!2840)))))

(assert (=> d!151745 (validMask!0 mask!2840)))

(assert (=> d!151745 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46540 a!2901) j!112) mask!2840) (select (arr!46540 a!2901) j!112) a!2901 mask!2840) lt!620889)))

(assert (= (and d!151745 c!130645) b!1409858))

(assert (= (and d!151745 (not c!130645)) b!1409854))

(assert (= (and b!1409854 c!130647) b!1409852))

(assert (= (and b!1409854 (not c!130647)) b!1409851))

(assert (= (and d!151745 c!130646) b!1409857))

(assert (= (and d!151745 (not c!130646)) b!1409853))

(assert (= (and b!1409853 res!947497) b!1409856))

(assert (= (and b!1409856 (not res!947496)) b!1409855))

(assert (= (and b!1409855 (not res!947495)) b!1409859))

(declare-fun m!1299643 () Bool)

(assert (=> b!1409856 m!1299643))

(assert (=> b!1409859 m!1299643))

(assert (=> d!151745 m!1299579))

(declare-fun m!1299645 () Bool)

(assert (=> d!151745 m!1299645))

(assert (=> d!151745 m!1299575))

(assert (=> b!1409851 m!1299579))

(declare-fun m!1299647 () Bool)

(assert (=> b!1409851 m!1299647))

(assert (=> b!1409851 m!1299647))

(assert (=> b!1409851 m!1299563))

(declare-fun m!1299649 () Bool)

(assert (=> b!1409851 m!1299649))

(assert (=> b!1409855 m!1299643))

(assert (=> b!1409729 d!151745))

(declare-fun d!151751 () Bool)

(declare-fun lt!620911 () (_ BitVec 32))

(declare-fun lt!620910 () (_ BitVec 32))

(assert (=> d!151751 (= lt!620911 (bvmul (bvxor lt!620910 (bvlshr lt!620910 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151751 (= lt!620910 ((_ extract 31 0) (bvand (bvxor (select (arr!46540 a!2901) j!112) (bvlshr (select (arr!46540 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151751 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947502 (let ((h!34320 ((_ extract 31 0) (bvand (bvxor (select (arr!46540 a!2901) j!112) (bvlshr (select (arr!46540 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127369 (bvmul (bvxor h!34320 (bvlshr h!34320 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127369 (bvlshr x!127369 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947502 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947502 #b00000000000000000000000000000000))))))

(assert (=> d!151751 (= (toIndex!0 (select (arr!46540 a!2901) j!112) mask!2840) (bvand (bvxor lt!620911 (bvlshr lt!620911 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1409729 d!151751))

(declare-fun d!151757 () Bool)

(declare-fun res!947506 () Bool)

(declare-fun e!797826 () Bool)

(assert (=> d!151757 (=> res!947506 e!797826)))

(assert (=> d!151757 (= res!947506 (bvsge #b00000000000000000000000000000000 (size!47090 a!2901)))))

(assert (=> d!151757 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!797826)))

(declare-fun b!1409873 () Bool)

(declare-fun e!797827 () Bool)

(assert (=> b!1409873 (= e!797826 e!797827)))

(declare-fun c!130652 () Bool)

(assert (=> b!1409873 (= c!130652 (validKeyInArray!0 (select (arr!46540 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1409874 () Bool)

(declare-fun call!67023 () Bool)

(assert (=> b!1409874 (= e!797827 call!67023)))

(declare-fun b!1409875 () Bool)

(declare-fun e!797828 () Bool)

(assert (=> b!1409875 (= e!797828 call!67023)))

(declare-fun bm!67020 () Bool)

(assert (=> bm!67020 (= call!67023 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1409876 () Bool)

(assert (=> b!1409876 (= e!797827 e!797828)))

(declare-fun lt!620914 () (_ BitVec 64))

(assert (=> b!1409876 (= lt!620914 (select (arr!46540 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!620913 () Unit!47676)

(assert (=> b!1409876 (= lt!620913 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!620914 #b00000000000000000000000000000000))))

(assert (=> b!1409876 (arrayContainsKey!0 a!2901 lt!620914 #b00000000000000000000000000000000)))

(declare-fun lt!620912 () Unit!47676)

(assert (=> b!1409876 (= lt!620912 lt!620913)))

(declare-fun res!947507 () Bool)

(assert (=> b!1409876 (= res!947507 (= (seekEntryOrOpen!0 (select (arr!46540 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10851 #b00000000000000000000000000000000)))))

(assert (=> b!1409876 (=> (not res!947507) (not e!797828))))

(assert (= (and d!151757 (not res!947506)) b!1409873))

(assert (= (and b!1409873 c!130652) b!1409876))

(assert (= (and b!1409873 (not c!130652)) b!1409874))

(assert (= (and b!1409876 res!947507) b!1409875))

(assert (= (or b!1409875 b!1409874) bm!67020))

(declare-fun m!1299665 () Bool)

(assert (=> b!1409873 m!1299665))

(assert (=> b!1409873 m!1299665))

(declare-fun m!1299667 () Bool)

(assert (=> b!1409873 m!1299667))

(declare-fun m!1299669 () Bool)

(assert (=> bm!67020 m!1299669))

(assert (=> b!1409876 m!1299665))

(declare-fun m!1299671 () Bool)

(assert (=> b!1409876 m!1299671))

(declare-fun m!1299673 () Bool)

(assert (=> b!1409876 m!1299673))

(assert (=> b!1409876 m!1299665))

(declare-fun m!1299675 () Bool)

(assert (=> b!1409876 m!1299675))

(assert (=> b!1409730 d!151757))

(declare-fun b!1409937 () Bool)

(declare-fun c!130672 () Bool)

(declare-fun lt!620937 () (_ BitVec 64))

(assert (=> b!1409937 (= c!130672 (= lt!620937 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!797868 () SeekEntryResult!10851)

(declare-fun e!797869 () SeekEntryResult!10851)

(assert (=> b!1409937 (= e!797868 e!797869)))

(declare-fun b!1409938 () Bool)

(declare-fun e!797870 () SeekEntryResult!10851)

(assert (=> b!1409938 (= e!797870 Undefined!10851)))

(declare-fun b!1409939 () Bool)

(declare-fun lt!620935 () SeekEntryResult!10851)

(assert (=> b!1409939 (= e!797868 (Found!10851 (index!45783 lt!620935)))))

(declare-fun b!1409940 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96394 (_ BitVec 32)) SeekEntryResult!10851)

(assert (=> b!1409940 (= e!797869 (seekKeyOrZeroReturnVacant!0 (x!127364 lt!620935) (index!45783 lt!620935) (index!45783 lt!620935) (select (arr!46540 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409941 () Bool)

(assert (=> b!1409941 (= e!797870 e!797868)))

(assert (=> b!1409941 (= lt!620937 (select (arr!46540 a!2901) (index!45783 lt!620935)))))

(declare-fun c!130673 () Bool)

(assert (=> b!1409941 (= c!130673 (= lt!620937 (select (arr!46540 a!2901) j!112)))))

(declare-fun b!1409936 () Bool)

(assert (=> b!1409936 (= e!797869 (MissingZero!10851 (index!45783 lt!620935)))))

(declare-fun d!151763 () Bool)

(declare-fun lt!620936 () SeekEntryResult!10851)

(assert (=> d!151763 (and (or (is-Undefined!10851 lt!620936) (not (is-Found!10851 lt!620936)) (and (bvsge (index!45782 lt!620936) #b00000000000000000000000000000000) (bvslt (index!45782 lt!620936) (size!47090 a!2901)))) (or (is-Undefined!10851 lt!620936) (is-Found!10851 lt!620936) (not (is-MissingZero!10851 lt!620936)) (and (bvsge (index!45781 lt!620936) #b00000000000000000000000000000000) (bvslt (index!45781 lt!620936) (size!47090 a!2901)))) (or (is-Undefined!10851 lt!620936) (is-Found!10851 lt!620936) (is-MissingZero!10851 lt!620936) (not (is-MissingVacant!10851 lt!620936)) (and (bvsge (index!45784 lt!620936) #b00000000000000000000000000000000) (bvslt (index!45784 lt!620936) (size!47090 a!2901)))) (or (is-Undefined!10851 lt!620936) (ite (is-Found!10851 lt!620936) (= (select (arr!46540 a!2901) (index!45782 lt!620936)) (select (arr!46540 a!2901) j!112)) (ite (is-MissingZero!10851 lt!620936) (= (select (arr!46540 a!2901) (index!45781 lt!620936)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10851 lt!620936) (= (select (arr!46540 a!2901) (index!45784 lt!620936)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151763 (= lt!620936 e!797870)))

(declare-fun c!130671 () Bool)

(assert (=> d!151763 (= c!130671 (and (is-Intermediate!10851 lt!620935) (undefined!11663 lt!620935)))))

(assert (=> d!151763 (= lt!620935 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46540 a!2901) j!112) mask!2840) (select (arr!46540 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151763 (validMask!0 mask!2840)))

(assert (=> d!151763 (= (seekEntryOrOpen!0 (select (arr!46540 a!2901) j!112) a!2901 mask!2840) lt!620936)))

(assert (= (and d!151763 c!130671) b!1409938))

(assert (= (and d!151763 (not c!130671)) b!1409941))

(assert (= (and b!1409941 c!130673) b!1409939))

(assert (= (and b!1409941 (not c!130673)) b!1409937))

(assert (= (and b!1409937 c!130672) b!1409936))

(assert (= (and b!1409937 (not c!130672)) b!1409940))

(assert (=> b!1409940 m!1299563))

(declare-fun m!1299711 () Bool)

(assert (=> b!1409940 m!1299711))

(declare-fun m!1299713 () Bool)

(assert (=> b!1409941 m!1299713))

(assert (=> d!151763 m!1299575))

(declare-fun m!1299715 () Bool)

(assert (=> d!151763 m!1299715))

(declare-fun m!1299717 () Bool)

(assert (=> d!151763 m!1299717))

(assert (=> d!151763 m!1299563))

(assert (=> d!151763 m!1299579))

(assert (=> d!151763 m!1299579))

(assert (=> d!151763 m!1299563))

(assert (=> d!151763 m!1299583))

(declare-fun m!1299719 () Bool)

(assert (=> d!151763 m!1299719))

(assert (=> b!1409732 d!151763))

(declare-fun d!151791 () Bool)

(assert (=> d!151791 (= (validKeyInArray!0 (select (arr!46540 a!2901) i!1037)) (and (not (= (select (arr!46540 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46540 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1409726 d!151791))

(declare-fun e!797872 () SeekEntryResult!10851)

(declare-fun b!1409942 () Bool)

(assert (=> b!1409942 (= e!797872 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96395 (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47090 a!2901)) mask!2840))))

(declare-fun b!1409943 () Bool)

(assert (=> b!1409943 (= e!797872 (Intermediate!10851 false (toIndex!0 (select (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1409944 () Bool)

(declare-fun e!797871 () Bool)

(declare-fun e!797874 () Bool)

(assert (=> b!1409944 (= e!797871 e!797874)))

(declare-fun res!947533 () Bool)

(declare-fun lt!620940 () SeekEntryResult!10851)

(assert (=> b!1409944 (= res!947533 (and (is-Intermediate!10851 lt!620940) (not (undefined!11663 lt!620940)) (bvslt (x!127364 lt!620940) #b01111111111111111111111111111110) (bvsge (x!127364 lt!620940) #b00000000000000000000000000000000) (bvsge (x!127364 lt!620940) #b00000000000000000000000000000000)))))

(assert (=> b!1409944 (=> (not res!947533) (not e!797874))))

(declare-fun b!1409945 () Bool)

(declare-fun e!797873 () SeekEntryResult!10851)

(assert (=> b!1409945 (= e!797873 e!797872)))

(declare-fun lt!620941 () (_ BitVec 64))

(declare-fun c!130676 () Bool)

(assert (=> b!1409945 (= c!130676 (or (= lt!620941 (select (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!620941 lt!620941) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1409947 () Bool)

(assert (=> b!1409947 (and (bvsge (index!45783 lt!620940) #b00000000000000000000000000000000) (bvslt (index!45783 lt!620940) (size!47090 (array!96395 (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47090 a!2901)))))))

(declare-fun res!947532 () Bool)

(assert (=> b!1409947 (= res!947532 (= (select (arr!46540 (array!96395 (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47090 a!2901))) (index!45783 lt!620940)) (select (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun e!797875 () Bool)

(assert (=> b!1409947 (=> res!947532 e!797875)))

(assert (=> b!1409947 (= e!797874 e!797875)))

(declare-fun b!1409948 () Bool)

(assert (=> b!1409948 (= e!797871 (bvsge (x!127364 lt!620940) #b01111111111111111111111111111110))))

(declare-fun b!1409949 () Bool)

(assert (=> b!1409949 (= e!797873 (Intermediate!10851 true (toIndex!0 (select (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1409950 () Bool)

(assert (=> b!1409950 (and (bvsge (index!45783 lt!620940) #b00000000000000000000000000000000) (bvslt (index!45783 lt!620940) (size!47090 (array!96395 (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47090 a!2901)))))))

(assert (=> b!1409950 (= e!797875 (= (select (arr!46540 (array!96395 (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47090 a!2901))) (index!45783 lt!620940)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1409946 () Bool)

(assert (=> b!1409946 (and (bvsge (index!45783 lt!620940) #b00000000000000000000000000000000) (bvslt (index!45783 lt!620940) (size!47090 (array!96395 (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47090 a!2901)))))))

(declare-fun res!947531 () Bool)

(assert (=> b!1409946 (= res!947531 (= (select (arr!46540 (array!96395 (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47090 a!2901))) (index!45783 lt!620940)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1409946 (=> res!947531 e!797875)))

(declare-fun d!151793 () Bool)

(assert (=> d!151793 e!797871))

(declare-fun c!130675 () Bool)

(assert (=> d!151793 (= c!130675 (and (is-Intermediate!10851 lt!620940) (undefined!11663 lt!620940)))))

(assert (=> d!151793 (= lt!620940 e!797873)))

(declare-fun c!130674 () Bool)

(assert (=> d!151793 (= c!130674 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151793 (= lt!620941 (select (arr!46540 (array!96395 (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47090 a!2901))) (toIndex!0 (select (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151793 (validMask!0 mask!2840)))

(assert (=> d!151793 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96395 (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47090 a!2901)) mask!2840) lt!620940)))

(assert (= (and d!151793 c!130674) b!1409949))

(assert (= (and d!151793 (not c!130674)) b!1409945))

(assert (= (and b!1409945 c!130676) b!1409943))

(assert (= (and b!1409945 (not c!130676)) b!1409942))

(assert (= (and d!151793 c!130675) b!1409948))

(assert (= (and d!151793 (not c!130675)) b!1409944))

(assert (= (and b!1409944 res!947533) b!1409947))

(assert (= (and b!1409947 (not res!947532)) b!1409946))

(assert (= (and b!1409946 (not res!947531)) b!1409950))

(declare-fun m!1299721 () Bool)

(assert (=> b!1409947 m!1299721))

(assert (=> b!1409950 m!1299721))

(assert (=> d!151793 m!1299571))

(declare-fun m!1299723 () Bool)

(assert (=> d!151793 m!1299723))

(assert (=> d!151793 m!1299575))

(assert (=> b!1409942 m!1299571))

(declare-fun m!1299725 () Bool)

(assert (=> b!1409942 m!1299725))

(assert (=> b!1409942 m!1299725))

(assert (=> b!1409942 m!1299569))

(declare-fun m!1299729 () Bool)

(assert (=> b!1409942 m!1299729))

(assert (=> b!1409946 m!1299721))

(assert (=> b!1409731 d!151793))

(declare-fun d!151795 () Bool)

(declare-fun lt!620943 () (_ BitVec 32))

(declare-fun lt!620942 () (_ BitVec 32))

(assert (=> d!151795 (= lt!620943 (bvmul (bvxor lt!620942 (bvlshr lt!620942 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151795 (= lt!620942 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151795 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947502 (let ((h!34320 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127369 (bvmul (bvxor h!34320 (bvlshr h!34320 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127369 (bvlshr x!127369 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947502 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947502 #b00000000000000000000000000000000))))))

(assert (=> d!151795 (= (toIndex!0 (select (store (arr!46540 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!620943 (bvlshr lt!620943 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1409731 d!151795))

(declare-fun d!151797 () Bool)

