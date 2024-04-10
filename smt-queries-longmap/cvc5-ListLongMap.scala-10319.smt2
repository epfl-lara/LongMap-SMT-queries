; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!121236 () Bool)

(assert start!121236)

(declare-fun b!1409678 () Bool)

(declare-fun e!797717 () Bool)

(declare-fun e!797716 () Bool)

(assert (=> b!1409678 (= e!797717 (not e!797716))))

(declare-fun res!947406 () Bool)

(assert (=> b!1409678 (=> res!947406 e!797716)))

(declare-datatypes ((SeekEntryResult!10849 0))(
  ( (MissingZero!10849 (index!45773 (_ BitVec 32))) (Found!10849 (index!45774 (_ BitVec 32))) (Intermediate!10849 (undefined!11661 Bool) (index!45775 (_ BitVec 32)) (x!127362 (_ BitVec 32))) (Undefined!10849) (MissingVacant!10849 (index!45776 (_ BitVec 32))) )
))
(declare-fun lt!620813 () SeekEntryResult!10849)

(assert (=> b!1409678 (= res!947406 (or (not (is-Intermediate!10849 lt!620813)) (undefined!11661 lt!620813)))))

(declare-fun e!797714 () Bool)

(assert (=> b!1409678 e!797714))

(declare-fun res!947404 () Bool)

(assert (=> b!1409678 (=> (not res!947404) (not e!797714))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96390 0))(
  ( (array!96391 (arr!46538 (Array (_ BitVec 32) (_ BitVec 64))) (size!47088 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96390)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96390 (_ BitVec 32)) Bool)

(assert (=> b!1409678 (= res!947404 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47672 0))(
  ( (Unit!47673) )
))
(declare-fun lt!620812 () Unit!47672)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96390 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47672)

(assert (=> b!1409678 (= lt!620812 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96390 (_ BitVec 32)) SeekEntryResult!10849)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409678 (= lt!620813 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46538 a!2901) j!112) mask!2840) (select (arr!46538 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409680 () Bool)

(declare-fun lt!620814 () SeekEntryResult!10849)

(assert (=> b!1409680 (= e!797716 (or (= lt!620813 lt!620814) (not (is-Intermediate!10849 lt!620814)) (and (bvsge (x!127362 lt!620813) #b00000000000000000000000000000000) (bvsle (x!127362 lt!620813) #b01111111111111111111111111111110))))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1409680 (= lt!620814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96391 (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47088 a!2901)) mask!2840))))

(declare-fun b!1409681 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96390 (_ BitVec 32)) SeekEntryResult!10849)

(assert (=> b!1409681 (= e!797714 (= (seekEntryOrOpen!0 (select (arr!46538 a!2901) j!112) a!2901 mask!2840) (Found!10849 j!112)))))

(declare-fun b!1409682 () Bool)

(declare-fun res!947405 () Bool)

(assert (=> b!1409682 (=> (not res!947405) (not e!797717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409682 (= res!947405 (validKeyInArray!0 (select (arr!46538 a!2901) i!1037)))))

(declare-fun b!1409683 () Bool)

(declare-fun res!947402 () Bool)

(assert (=> b!1409683 (=> (not res!947402) (not e!797717))))

(declare-datatypes ((List!33057 0))(
  ( (Nil!33054) (Cons!33053 (h!34316 (_ BitVec 64)) (t!47751 List!33057)) )
))
(declare-fun arrayNoDuplicates!0 (array!96390 (_ BitVec 32) List!33057) Bool)

(assert (=> b!1409683 (= res!947402 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33054))))

(declare-fun b!1409684 () Bool)

(declare-fun res!947407 () Bool)

(assert (=> b!1409684 (=> (not res!947407) (not e!797717))))

(assert (=> b!1409684 (= res!947407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1409685 () Bool)

(declare-fun res!947401 () Bool)

(assert (=> b!1409685 (=> (not res!947401) (not e!797717))))

(assert (=> b!1409685 (= res!947401 (and (= (size!47088 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47088 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47088 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!947400 () Bool)

(assert (=> start!121236 (=> (not res!947400) (not e!797717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121236 (= res!947400 (validMask!0 mask!2840))))

(assert (=> start!121236 e!797717))

(assert (=> start!121236 true))

(declare-fun array_inv!35566 (array!96390) Bool)

(assert (=> start!121236 (array_inv!35566 a!2901)))

(declare-fun b!1409679 () Bool)

(declare-fun res!947403 () Bool)

(assert (=> b!1409679 (=> (not res!947403) (not e!797717))))

(assert (=> b!1409679 (= res!947403 (validKeyInArray!0 (select (arr!46538 a!2901) j!112)))))

(assert (= (and start!121236 res!947400) b!1409685))

(assert (= (and b!1409685 res!947401) b!1409682))

(assert (= (and b!1409682 res!947405) b!1409679))

(assert (= (and b!1409679 res!947403) b!1409684))

(assert (= (and b!1409684 res!947407) b!1409683))

(assert (= (and b!1409683 res!947402) b!1409678))

(assert (= (and b!1409678 res!947404) b!1409681))

(assert (= (and b!1409678 (not res!947406)) b!1409680))

(declare-fun m!1299495 () Bool)

(assert (=> start!121236 m!1299495))

(declare-fun m!1299497 () Bool)

(assert (=> start!121236 m!1299497))

(declare-fun m!1299499 () Bool)

(assert (=> b!1409684 m!1299499))

(declare-fun m!1299501 () Bool)

(assert (=> b!1409681 m!1299501))

(assert (=> b!1409681 m!1299501))

(declare-fun m!1299503 () Bool)

(assert (=> b!1409681 m!1299503))

(assert (=> b!1409678 m!1299501))

(declare-fun m!1299505 () Bool)

(assert (=> b!1409678 m!1299505))

(assert (=> b!1409678 m!1299501))

(declare-fun m!1299507 () Bool)

(assert (=> b!1409678 m!1299507))

(assert (=> b!1409678 m!1299505))

(assert (=> b!1409678 m!1299501))

(declare-fun m!1299509 () Bool)

(assert (=> b!1409678 m!1299509))

(declare-fun m!1299511 () Bool)

(assert (=> b!1409678 m!1299511))

(declare-fun m!1299513 () Bool)

(assert (=> b!1409682 m!1299513))

(assert (=> b!1409682 m!1299513))

(declare-fun m!1299515 () Bool)

(assert (=> b!1409682 m!1299515))

(assert (=> b!1409679 m!1299501))

(assert (=> b!1409679 m!1299501))

(declare-fun m!1299517 () Bool)

(assert (=> b!1409679 m!1299517))

(declare-fun m!1299519 () Bool)

(assert (=> b!1409680 m!1299519))

(declare-fun m!1299521 () Bool)

(assert (=> b!1409680 m!1299521))

(assert (=> b!1409680 m!1299521))

(declare-fun m!1299523 () Bool)

(assert (=> b!1409680 m!1299523))

(assert (=> b!1409680 m!1299523))

(assert (=> b!1409680 m!1299521))

(declare-fun m!1299525 () Bool)

(assert (=> b!1409680 m!1299525))

(declare-fun m!1299527 () Bool)

(assert (=> b!1409683 m!1299527))

(push 1)

(assert (not b!1409683))

(assert (not start!121236))

(assert (not b!1409684))

(assert (not b!1409682))

(assert (not b!1409680))

(assert (not b!1409678))

(assert (not b!1409681))

(assert (not b!1409679))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun call!67021 () Bool)

(declare-fun bm!67018 () Bool)

(assert (=> bm!67018 (= call!67021 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1409778 () Bool)

(declare-fun e!797774 () Bool)

(assert (=> b!1409778 (= e!797774 call!67021)))

(declare-fun d!151735 () Bool)

(declare-fun res!947473 () Bool)

(declare-fun e!797773 () Bool)

(assert (=> d!151735 (=> res!947473 e!797773)))

(assert (=> d!151735 (= res!947473 (bvsge j!112 (size!47088 a!2901)))))

(assert (=> d!151735 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!797773)))

(declare-fun b!1409779 () Bool)

(declare-fun e!797772 () Bool)

(assert (=> b!1409779 (= e!797773 e!797772)))

(declare-fun c!130620 () Bool)

(assert (=> b!1409779 (= c!130620 (validKeyInArray!0 (select (arr!46538 a!2901) j!112)))))

(declare-fun b!1409780 () Bool)

(assert (=> b!1409780 (= e!797772 e!797774)))

(declare-fun lt!620865 () (_ BitVec 64))

(assert (=> b!1409780 (= lt!620865 (select (arr!46538 a!2901) j!112))))

(declare-fun lt!620864 () Unit!47672)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96390 (_ BitVec 64) (_ BitVec 32)) Unit!47672)

(assert (=> b!1409780 (= lt!620864 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!620865 j!112))))

(declare-fun arrayContainsKey!0 (array!96390 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1409780 (arrayContainsKey!0 a!2901 lt!620865 #b00000000000000000000000000000000)))

(declare-fun lt!620863 () Unit!47672)

(assert (=> b!1409780 (= lt!620863 lt!620864)))

(declare-fun res!947472 () Bool)

(assert (=> b!1409780 (= res!947472 (= (seekEntryOrOpen!0 (select (arr!46538 a!2901) j!112) a!2901 mask!2840) (Found!10849 j!112)))))

(assert (=> b!1409780 (=> (not res!947472) (not e!797774))))

(declare-fun b!1409781 () Bool)

(assert (=> b!1409781 (= e!797772 call!67021)))

(assert (= (and d!151735 (not res!947473)) b!1409779))

(assert (= (and b!1409779 c!130620) b!1409780))

(assert (= (and b!1409779 (not c!130620)) b!1409781))

(assert (= (and b!1409780 res!947472) b!1409778))

(assert (= (or b!1409778 b!1409781) bm!67018))

(declare-fun m!1299615 () Bool)

(assert (=> bm!67018 m!1299615))

(assert (=> b!1409779 m!1299501))

(assert (=> b!1409779 m!1299501))

(assert (=> b!1409779 m!1299517))

(assert (=> b!1409780 m!1299501))

(declare-fun m!1299617 () Bool)

(assert (=> b!1409780 m!1299617))

(declare-fun m!1299619 () Bool)

(assert (=> b!1409780 m!1299619))

(assert (=> b!1409780 m!1299501))

(assert (=> b!1409780 m!1299503))

(assert (=> b!1409678 d!151735))

(declare-fun d!151739 () Bool)

(assert (=> d!151739 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!620874 () Unit!47672)

(declare-fun choose!38 (array!96390 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47672)

(assert (=> d!151739 (= lt!620874 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151739 (validMask!0 mask!2840)))

(assert (=> d!151739 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!620874)))

(declare-fun bs!41106 () Bool)

(assert (= bs!41106 d!151739))

(assert (=> bs!41106 m!1299511))

(declare-fun m!1299633 () Bool)

(assert (=> bs!41106 m!1299633))

(assert (=> bs!41106 m!1299495))

(assert (=> b!1409678 d!151739))

(declare-fun b!1409860 () Bool)

(declare-fun e!797818 () SeekEntryResult!10849)

(assert (=> b!1409860 (= e!797818 (Intermediate!10849 false (toIndex!0 (select (arr!46538 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!151747 () Bool)

(declare-fun e!797822 () Bool)

(assert (=> d!151747 e!797822))

(declare-fun c!130650 () Bool)

(declare-fun lt!620892 () SeekEntryResult!10849)

(assert (=> d!151747 (= c!130650 (and (is-Intermediate!10849 lt!620892) (undefined!11661 lt!620892)))))

(declare-fun e!797821 () SeekEntryResult!10849)

(assert (=> d!151747 (= lt!620892 e!797821)))

(declare-fun c!130649 () Bool)

(assert (=> d!151747 (= c!130649 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!620891 () (_ BitVec 64))

(assert (=> d!151747 (= lt!620891 (select (arr!46538 a!2901) (toIndex!0 (select (arr!46538 a!2901) j!112) mask!2840)))))

(assert (=> d!151747 (validMask!0 mask!2840)))

(assert (=> d!151747 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46538 a!2901) j!112) mask!2840) (select (arr!46538 a!2901) j!112) a!2901 mask!2840) lt!620892)))

(declare-fun b!1409861 () Bool)

(assert (=> b!1409861 (= e!797821 (Intermediate!10849 true (toIndex!0 (select (arr!46538 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1409862 () Bool)

(assert (=> b!1409862 (= e!797822 (bvsge (x!127362 lt!620892) #b01111111111111111111111111111110))))

(declare-fun b!1409863 () Bool)

(assert (=> b!1409863 (= e!797821 e!797818)))

(declare-fun c!130648 () Bool)

(assert (=> b!1409863 (= c!130648 (or (= lt!620891 (select (arr!46538 a!2901) j!112)) (= (bvadd lt!620891 lt!620891) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1409864 () Bool)

(assert (=> b!1409864 (and (bvsge (index!45775 lt!620892) #b00000000000000000000000000000000) (bvslt (index!45775 lt!620892) (size!47088 a!2901)))))

(declare-fun res!947499 () Bool)

(assert (=> b!1409864 (= res!947499 (= (select (arr!46538 a!2901) (index!45775 lt!620892)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!797819 () Bool)

(assert (=> b!1409864 (=> res!947499 e!797819)))

(declare-fun b!1409865 () Bool)

(assert (=> b!1409865 (and (bvsge (index!45775 lt!620892) #b00000000000000000000000000000000) (bvslt (index!45775 lt!620892) (size!47088 a!2901)))))

(declare-fun res!947498 () Bool)

(assert (=> b!1409865 (= res!947498 (= (select (arr!46538 a!2901) (index!45775 lt!620892)) (select (arr!46538 a!2901) j!112)))))

(assert (=> b!1409865 (=> res!947498 e!797819)))

(declare-fun e!797820 () Bool)

(assert (=> b!1409865 (= e!797820 e!797819)))

(declare-fun b!1409866 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409866 (= e!797818 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46538 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46538 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1409867 () Bool)

(assert (=> b!1409867 (and (bvsge (index!45775 lt!620892) #b00000000000000000000000000000000) (bvslt (index!45775 lt!620892) (size!47088 a!2901)))))

(assert (=> b!1409867 (= e!797819 (= (select (arr!46538 a!2901) (index!45775 lt!620892)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1409868 () Bool)

(assert (=> b!1409868 (= e!797822 e!797820)))

(declare-fun res!947500 () Bool)

(assert (=> b!1409868 (= res!947500 (and (is-Intermediate!10849 lt!620892) (not (undefined!11661 lt!620892)) (bvslt (x!127362 lt!620892) #b01111111111111111111111111111110) (bvsge (x!127362 lt!620892) #b00000000000000000000000000000000) (bvsge (x!127362 lt!620892) #b00000000000000000000000000000000)))))

(assert (=> b!1409868 (=> (not res!947500) (not e!797820))))

(assert (= (and d!151747 c!130649) b!1409861))

(assert (= (and d!151747 (not c!130649)) b!1409863))

(assert (= (and b!1409863 c!130648) b!1409860))

(assert (= (and b!1409863 (not c!130648)) b!1409866))

(assert (= (and d!151747 c!130650) b!1409862))

(assert (= (and d!151747 (not c!130650)) b!1409868))

(assert (= (and b!1409868 res!947500) b!1409865))

(assert (= (and b!1409865 (not res!947498)) b!1409864))

(assert (= (and b!1409864 (not res!947499)) b!1409867))

(declare-fun m!1299651 () Bool)

(assert (=> b!1409865 m!1299651))

(assert (=> b!1409867 m!1299651))

(assert (=> d!151747 m!1299505))

(declare-fun m!1299653 () Bool)

(assert (=> d!151747 m!1299653))

(assert (=> d!151747 m!1299495))

(assert (=> b!1409864 m!1299651))

(assert (=> b!1409866 m!1299505))

(declare-fun m!1299655 () Bool)

(assert (=> b!1409866 m!1299655))

(assert (=> b!1409866 m!1299655))

(assert (=> b!1409866 m!1299501))

(declare-fun m!1299657 () Bool)

(assert (=> b!1409866 m!1299657))

(assert (=> b!1409678 d!151747))

(declare-fun d!151753 () Bool)

(declare-fun lt!620916 () (_ BitVec 32))

(declare-fun lt!620915 () (_ BitVec 32))

(assert (=> d!151753 (= lt!620916 (bvmul (bvxor lt!620915 (bvlshr lt!620915 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151753 (= lt!620915 ((_ extract 31 0) (bvand (bvxor (select (arr!46538 a!2901) j!112) (bvlshr (select (arr!46538 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151753 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947503 (let ((h!34321 ((_ extract 31 0) (bvand (bvxor (select (arr!46538 a!2901) j!112) (bvlshr (select (arr!46538 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127370 (bvmul (bvxor h!34321 (bvlshr h!34321 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127370 (bvlshr x!127370 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947503 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947503 #b00000000000000000000000000000000))))))

(assert (=> d!151753 (= (toIndex!0 (select (arr!46538 a!2901) j!112) mask!2840) (bvand (bvxor lt!620916 (bvlshr lt!620916 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1409678 d!151753))

(declare-fun d!151759 () Bool)

(declare-fun res!947519 () Bool)

(declare-fun e!797844 () Bool)

(assert (=> d!151759 (=> res!947519 e!797844)))

(assert (=> d!151759 (= res!947519 (bvsge #b00000000000000000000000000000000 (size!47088 a!2901)))))

(assert (=> d!151759 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33054) e!797844)))

(declare-fun b!1409896 () Bool)

(declare-fun e!797843 () Bool)

(declare-fun call!67026 () Bool)

(assert (=> b!1409896 (= e!797843 call!67026)))

(declare-fun b!1409897 () Bool)

(declare-fun e!797845 () Bool)

(declare-fun contains!9803 (List!33057 (_ BitVec 64)) Bool)

(assert (=> b!1409897 (= e!797845 (contains!9803 Nil!33054 (select (arr!46538 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1409898 () Bool)

(declare-fun e!797842 () Bool)

(assert (=> b!1409898 (= e!797842 e!797843)))

(declare-fun c!130658 () Bool)

(assert (=> b!1409898 (= c!130658 (validKeyInArray!0 (select (arr!46538 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1409899 () Bool)

(assert (=> b!1409899 (= e!797843 call!67026)))

(declare-fun bm!67023 () Bool)

(assert (=> bm!67023 (= call!67026 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130658 (Cons!33053 (select (arr!46538 a!2901) #b00000000000000000000000000000000) Nil!33054) Nil!33054)))))

(declare-fun b!1409900 () Bool)

(assert (=> b!1409900 (= e!797844 e!797842)))

(declare-fun res!947518 () Bool)

(assert (=> b!1409900 (=> (not res!947518) (not e!797842))))

(assert (=> b!1409900 (= res!947518 (not e!797845))))

(declare-fun res!947517 () Bool)

(assert (=> b!1409900 (=> (not res!947517) (not e!797845))))

(assert (=> b!1409900 (= res!947517 (validKeyInArray!0 (select (arr!46538 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151759 (not res!947519)) b!1409900))

(assert (= (and b!1409900 res!947517) b!1409897))

(assert (= (and b!1409900 res!947518) b!1409898))

(assert (= (and b!1409898 c!130658) b!1409896))

(assert (= (and b!1409898 (not c!130658)) b!1409899))

(assert (= (or b!1409896 b!1409899) bm!67023))

(declare-fun m!1299687 () Bool)

(assert (=> b!1409897 m!1299687))

(assert (=> b!1409897 m!1299687))

(declare-fun m!1299689 () Bool)

(assert (=> b!1409897 m!1299689))

(assert (=> b!1409898 m!1299687))

(assert (=> b!1409898 m!1299687))

(declare-fun m!1299691 () Bool)

(assert (=> b!1409898 m!1299691))

(assert (=> bm!67023 m!1299687))

(declare-fun m!1299693 () Bool)

(assert (=> bm!67023 m!1299693))

(assert (=> b!1409900 m!1299687))

(assert (=> b!1409900 m!1299687))

(assert (=> b!1409900 m!1299691))

(assert (=> b!1409683 d!151759))

(declare-fun d!151771 () Bool)

(assert (=> d!151771 (= (validKeyInArray!0 (select (arr!46538 a!2901) j!112)) (and (not (= (select (arr!46538 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46538 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1409679 d!151771))

(declare-fun bm!67024 () Bool)

(declare-fun call!67027 () Bool)

(assert (=> bm!67024 (= call!67027 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1409901 () Bool)

(declare-fun e!797848 () Bool)

(assert (=> b!1409901 (= e!797848 call!67027)))

(declare-fun d!151773 () Bool)

(declare-fun res!947521 () Bool)

(declare-fun e!797847 () Bool)

(assert (=> d!151773 (=> res!947521 e!797847)))

(assert (=> d!151773 (= res!947521 (bvsge #b00000000000000000000000000000000 (size!47088 a!2901)))))

(assert (=> d!151773 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!797847)))

(declare-fun b!1409902 () Bool)

(declare-fun e!797846 () Bool)

(assert (=> b!1409902 (= e!797847 e!797846)))

(declare-fun c!130659 () Bool)

(assert (=> b!1409902 (= c!130659 (validKeyInArray!0 (select (arr!46538 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1409903 () Bool)

(assert (=> b!1409903 (= e!797846 e!797848)))

(declare-fun lt!620926 () (_ BitVec 64))

(assert (=> b!1409903 (= lt!620926 (select (arr!46538 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!620925 () Unit!47672)

(assert (=> b!1409903 (= lt!620925 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!620926 #b00000000000000000000000000000000))))

(assert (=> b!1409903 (arrayContainsKey!0 a!2901 lt!620926 #b00000000000000000000000000000000)))

(declare-fun lt!620924 () Unit!47672)

(assert (=> b!1409903 (= lt!620924 lt!620925)))

(declare-fun res!947520 () Bool)

(assert (=> b!1409903 (= res!947520 (= (seekEntryOrOpen!0 (select (arr!46538 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10849 #b00000000000000000000000000000000)))))

(assert (=> b!1409903 (=> (not res!947520) (not e!797848))))

(declare-fun b!1409904 () Bool)

(assert (=> b!1409904 (= e!797846 call!67027)))

(assert (= (and d!151773 (not res!947521)) b!1409902))

(assert (= (and b!1409902 c!130659) b!1409903))

(assert (= (and b!1409902 (not c!130659)) b!1409904))

(assert (= (and b!1409903 res!947520) b!1409901))

(assert (= (or b!1409901 b!1409904) bm!67024))

(declare-fun m!1299695 () Bool)

(assert (=> bm!67024 m!1299695))

(assert (=> b!1409902 m!1299687))

(assert (=> b!1409902 m!1299687))

(assert (=> b!1409902 m!1299691))

(assert (=> b!1409903 m!1299687))

(declare-fun m!1299697 () Bool)

(assert (=> b!1409903 m!1299697))

(declare-fun m!1299699 () Bool)

(assert (=> b!1409903 m!1299699))

(assert (=> b!1409903 m!1299687))

(declare-fun m!1299701 () Bool)

(assert (=> b!1409903 m!1299701))

(assert (=> b!1409684 d!151773))

(declare-fun d!151775 () Bool)

(assert (=> d!151775 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!121236 d!151775))

(declare-fun d!151781 () Bool)

(assert (=> d!151781 (= (array_inv!35566 a!2901) (bvsge (size!47088 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!121236 d!151781))

(declare-fun e!797855 () SeekEntryResult!10849)

(declare-fun b!1409917 () Bool)

(assert (=> b!1409917 (= e!797855 (Intermediate!10849 false (toIndex!0 (select (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!151783 () Bool)

(declare-fun e!797859 () Bool)

(assert (=> d!151783 e!797859))

(declare-fun c!130668 () Bool)

(declare-fun lt!620934 () SeekEntryResult!10849)

(assert (=> d!151783 (= c!130668 (and (is-Intermediate!10849 lt!620934) (undefined!11661 lt!620934)))))

(declare-fun e!797858 () SeekEntryResult!10849)

(assert (=> d!151783 (= lt!620934 e!797858)))

(declare-fun c!130667 () Bool)

(assert (=> d!151783 (= c!130667 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!620933 () (_ BitVec 64))

(assert (=> d!151783 (= lt!620933 (select (arr!46538 (array!96391 (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47088 a!2901))) (toIndex!0 (select (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!151783 (validMask!0 mask!2840)))

(assert (=> d!151783 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96391 (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47088 a!2901)) mask!2840) lt!620934)))

(declare-fun b!1409918 () Bool)

(assert (=> b!1409918 (= e!797858 (Intermediate!10849 true (toIndex!0 (select (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1409919 () Bool)

(assert (=> b!1409919 (= e!797859 (bvsge (x!127362 lt!620934) #b01111111111111111111111111111110))))

(declare-fun b!1409920 () Bool)

(assert (=> b!1409920 (= e!797858 e!797855)))

(declare-fun c!130666 () Bool)

(assert (=> b!1409920 (= c!130666 (or (= lt!620933 (select (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!620933 lt!620933) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1409921 () Bool)

(assert (=> b!1409921 (and (bvsge (index!45775 lt!620934) #b00000000000000000000000000000000) (bvslt (index!45775 lt!620934) (size!47088 (array!96391 (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47088 a!2901)))))))

(declare-fun res!947523 () Bool)

(assert (=> b!1409921 (= res!947523 (= (select (arr!46538 (array!96391 (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47088 a!2901))) (index!45775 lt!620934)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!797856 () Bool)

(assert (=> b!1409921 (=> res!947523 e!797856)))

(declare-fun b!1409922 () Bool)

(assert (=> b!1409922 (and (bvsge (index!45775 lt!620934) #b00000000000000000000000000000000) (bvslt (index!45775 lt!620934) (size!47088 (array!96391 (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47088 a!2901)))))))

(declare-fun res!947522 () Bool)

(assert (=> b!1409922 (= res!947522 (= (select (arr!46538 (array!96391 (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47088 a!2901))) (index!45775 lt!620934)) (select (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1409922 (=> res!947522 e!797856)))

(declare-fun e!797857 () Bool)

(assert (=> b!1409922 (= e!797857 e!797856)))

(declare-fun b!1409923 () Bool)

(assert (=> b!1409923 (= e!797855 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96391 (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47088 a!2901)) mask!2840))))

(declare-fun b!1409924 () Bool)

(assert (=> b!1409924 (and (bvsge (index!45775 lt!620934) #b00000000000000000000000000000000) (bvslt (index!45775 lt!620934) (size!47088 (array!96391 (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47088 a!2901)))))))

(assert (=> b!1409924 (= e!797856 (= (select (arr!46538 (array!96391 (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47088 a!2901))) (index!45775 lt!620934)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1409925 () Bool)

(assert (=> b!1409925 (= e!797859 e!797857)))

(declare-fun res!947524 () Bool)

(assert (=> b!1409925 (= res!947524 (and (is-Intermediate!10849 lt!620934) (not (undefined!11661 lt!620934)) (bvslt (x!127362 lt!620934) #b01111111111111111111111111111110) (bvsge (x!127362 lt!620934) #b00000000000000000000000000000000) (bvsge (x!127362 lt!620934) #b00000000000000000000000000000000)))))

(assert (=> b!1409925 (=> (not res!947524) (not e!797857))))

(assert (= (and d!151783 c!130667) b!1409918))

(assert (= (and d!151783 (not c!130667)) b!1409920))

(assert (= (and b!1409920 c!130666) b!1409917))

(assert (= (and b!1409920 (not c!130666)) b!1409923))

(assert (= (and d!151783 c!130668) b!1409919))

(assert (= (and d!151783 (not c!130668)) b!1409925))

(assert (= (and b!1409925 res!947524) b!1409922))

(assert (= (and b!1409922 (not res!947522)) b!1409921))

(assert (= (and b!1409921 (not res!947523)) b!1409924))

(declare-fun m!1299703 () Bool)

(assert (=> b!1409922 m!1299703))

(assert (=> b!1409924 m!1299703))

(assert (=> d!151783 m!1299523))

(declare-fun m!1299705 () Bool)

(assert (=> d!151783 m!1299705))

(assert (=> d!151783 m!1299495))

(assert (=> b!1409921 m!1299703))

(assert (=> b!1409923 m!1299523))

(declare-fun m!1299707 () Bool)

(assert (=> b!1409923 m!1299707))

(assert (=> b!1409923 m!1299707))

(assert (=> b!1409923 m!1299521))

(declare-fun m!1299709 () Bool)

(assert (=> b!1409923 m!1299709))

(assert (=> b!1409680 d!151783))

(declare-fun d!151785 () Bool)

(declare-fun lt!620939 () (_ BitVec 32))

(declare-fun lt!620938 () (_ BitVec 32))

(assert (=> d!151785 (= lt!620939 (bvmul (bvxor lt!620938 (bvlshr lt!620938 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151785 (= lt!620938 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151785 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!947503 (let ((h!34321 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!127370 (bvmul (bvxor h!34321 (bvlshr h!34321 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!127370 (bvlshr x!127370 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!947503 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!947503 #b00000000000000000000000000000000))))))

(assert (=> d!151785 (= (toIndex!0 (select (store (arr!46538 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!620939 (bvlshr lt!620939 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1409680 d!151785))

(declare-fun d!151787 () Bool)

(assert (=> d!151787 (= (validKeyInArray!0 (select (arr!46538 a!2901) i!1037)) (and (not (= (select (arr!46538 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46538 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1409682 d!151787))

(declare-fun b!1409968 () Bool)

(declare-fun e!797888 () SeekEntryResult!10849)

(declare-fun lt!620951 () SeekEntryResult!10849)

(assert (=> b!1409968 (= e!797888 (Found!10849 (index!45775 lt!620951)))))

(declare-fun b!1409969 () Bool)

(declare-fun c!130686 () Bool)

(declare-fun lt!620950 () (_ BitVec 64))

(assert (=> b!1409969 (= c!130686 (= lt!620950 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!797887 () SeekEntryResult!10849)

(assert (=> b!1409969 (= e!797888 e!797887)))

(declare-fun b!1409970 () Bool)

(declare-fun e!797886 () SeekEntryResult!10849)

(assert (=> b!1409970 (= e!797886 e!797888)))

(assert (=> b!1409970 (= lt!620950 (select (arr!46538 a!2901) (index!45775 lt!620951)))))

(declare-fun c!130684 () Bool)

(assert (=> b!1409970 (= c!130684 (= lt!620950 (select (arr!46538 a!2901) j!112)))))

(declare-fun b!1409971 () Bool)

(assert (=> b!1409971 (= e!797887 (MissingZero!10849 (index!45775 lt!620951)))))

(declare-fun d!151789 () Bool)

(declare-fun lt!620952 () SeekEntryResult!10849)

(assert (=> d!151789 (and (or (is-Undefined!10849 lt!620952) (not (is-Found!10849 lt!620952)) (and (bvsge (index!45774 lt!620952) #b00000000000000000000000000000000) (bvslt (index!45774 lt!620952) (size!47088 a!2901)))) (or (is-Undefined!10849 lt!620952) (is-Found!10849 lt!620952) (not (is-MissingZero!10849 lt!620952)) (and (bvsge (index!45773 lt!620952) #b00000000000000000000000000000000) (bvslt (index!45773 lt!620952) (size!47088 a!2901)))) (or (is-Undefined!10849 lt!620952) (is-Found!10849 lt!620952) (is-MissingZero!10849 lt!620952) (not (is-MissingVacant!10849 lt!620952)) (and (bvsge (index!45776 lt!620952) #b00000000000000000000000000000000) (bvslt (index!45776 lt!620952) (size!47088 a!2901)))) (or (is-Undefined!10849 lt!620952) (ite (is-Found!10849 lt!620952) (= (select (arr!46538 a!2901) (index!45774 lt!620952)) (select (arr!46538 a!2901) j!112)) (ite (is-MissingZero!10849 lt!620952) (= (select (arr!46538 a!2901) (index!45773 lt!620952)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10849 lt!620952) (= (select (arr!46538 a!2901) (index!45776 lt!620952)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151789 (= lt!620952 e!797886)))

(declare-fun c!130685 () Bool)

(assert (=> d!151789 (= c!130685 (and (is-Intermediate!10849 lt!620951) (undefined!11661 lt!620951)))))

(assert (=> d!151789 (= lt!620951 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46538 a!2901) j!112) mask!2840) (select (arr!46538 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151789 (validMask!0 mask!2840)))

(assert (=> d!151789 (= (seekEntryOrOpen!0 (select (arr!46538 a!2901) j!112) a!2901 mask!2840) lt!620952)))

(declare-fun b!1409972 () Bool)

(assert (=> b!1409972 (= e!797886 Undefined!10849)))

(declare-fun b!1409973 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96390 (_ BitVec 32)) SeekEntryResult!10849)

(assert (=> b!1409973 (= e!797887 (seekKeyOrZeroReturnVacant!0 (x!127362 lt!620951) (index!45775 lt!620951) (index!45775 lt!620951) (select (arr!46538 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and d!151789 c!130685) b!1409972))

(assert (= (and d!151789 (not c!130685)) b!1409970))

(assert (= (and b!1409970 c!130684) b!1409968))

(assert (= (and b!1409970 (not c!130684)) b!1409969))

(assert (= (and b!1409969 c!130686) b!1409971))

(assert (= (and b!1409969 (not c!130686)) b!1409973))

(declare-fun m!1299733 () Bool)

(assert (=> b!1409970 m!1299733))

(assert (=> d!151789 m!1299501))

(assert (=> d!151789 m!1299505))

(assert (=> d!151789 m!1299505))

(assert (=> d!151789 m!1299501))

(assert (=> d!151789 m!1299509))

(declare-fun m!1299735 () Bool)

(assert (=> d!151789 m!1299735))

(declare-fun m!1299737 () Bool)

(assert (=> d!151789 m!1299737))

(assert (=> d!151789 m!1299495))

(declare-fun m!1299739 () Bool)

(assert (=> d!151789 m!1299739))

(assert (=> b!1409973 m!1299501))

(declare-fun m!1299741 () Bool)

(assert (=> b!1409973 m!1299741))

(assert (=> b!1409681 d!151789))

(push 1)

(assert (not d!151747))

(assert (not d!151789))

(assert (not b!1409902))

(assert (not b!1409779))

(assert (not b!1409780))

(assert (not b!1409900))

(assert (not b!1409973))

(assert (not b!1409898))

(assert (not d!151783))

(assert (not bm!67023))

(assert (not b!1409903))

(assert (not bm!67018))

(assert (not b!1409897))

(assert (not b!1409923))

(assert (not b!1409866))

(assert (not bm!67024))

(assert (not d!151739))

(check-sat)

(pop 1)

(push 1)

(check-sat)

