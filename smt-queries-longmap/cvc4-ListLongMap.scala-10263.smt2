; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120820 () Bool)

(assert start!120820)

(declare-fun b!1405615 () Bool)

(declare-fun res!943443 () Bool)

(declare-fun e!795790 () Bool)

(assert (=> b!1405615 (=> (not res!943443) (not e!795790))))

(declare-datatypes ((array!96151 0))(
  ( (array!96152 (arr!46424 (Array (_ BitVec 32) (_ BitVec 64))) (size!46975 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96151)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405615 (= res!943443 (validKeyInArray!0 (select (arr!46424 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1405616 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10638 0))(
  ( (MissingZero!10638 (index!44929 (_ BitVec 32))) (Found!10638 (index!44930 (_ BitVec 32))) (Intermediate!10638 (undefined!11450 Bool) (index!44931 (_ BitVec 32)) (x!126692 (_ BitVec 32))) (Undefined!10638) (MissingVacant!10638 (index!44932 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96151 (_ BitVec 32)) SeekEntryResult!10638)

(assert (=> b!1405616 (= e!795790 (not (= (seekEntryOrOpen!0 (select (arr!46424 a!2901) j!112) a!2901 mask!2840) (Found!10638 j!112))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96151 (_ BitVec 32)) Bool)

(assert (=> b!1405616 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47277 0))(
  ( (Unit!47278) )
))
(declare-fun lt!619064 () Unit!47277)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96151 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47277)

(assert (=> b!1405616 (= lt!619064 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!619063 () SeekEntryResult!10638)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96151 (_ BitVec 32)) SeekEntryResult!10638)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405616 (= lt!619063 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46424 a!2901) j!112) mask!2840) (select (arr!46424 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!943442 () Bool)

(assert (=> start!120820 (=> (not res!943442) (not e!795790))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120820 (= res!943442 (validMask!0 mask!2840))))

(assert (=> start!120820 e!795790))

(assert (=> start!120820 true))

(declare-fun array_inv!35705 (array!96151) Bool)

(assert (=> start!120820 (array_inv!35705 a!2901)))

(declare-fun b!1405617 () Bool)

(declare-fun res!943444 () Bool)

(assert (=> b!1405617 (=> (not res!943444) (not e!795790))))

(assert (=> b!1405617 (= res!943444 (validKeyInArray!0 (select (arr!46424 a!2901) j!112)))))

(declare-fun b!1405618 () Bool)

(declare-fun res!943445 () Bool)

(assert (=> b!1405618 (=> (not res!943445) (not e!795790))))

(assert (=> b!1405618 (= res!943445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405619 () Bool)

(declare-fun res!943446 () Bool)

(assert (=> b!1405619 (=> (not res!943446) (not e!795790))))

(assert (=> b!1405619 (= res!943446 (and (= (size!46975 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46975 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46975 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405620 () Bool)

(declare-fun res!943447 () Bool)

(assert (=> b!1405620 (=> (not res!943447) (not e!795790))))

(declare-datatypes ((List!32930 0))(
  ( (Nil!32927) (Cons!32926 (h!34182 (_ BitVec 64)) (t!47616 List!32930)) )
))
(declare-fun arrayNoDuplicates!0 (array!96151 (_ BitVec 32) List!32930) Bool)

(assert (=> b!1405620 (= res!943447 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32927))))

(assert (= (and start!120820 res!943442) b!1405619))

(assert (= (and b!1405619 res!943446) b!1405615))

(assert (= (and b!1405615 res!943443) b!1405617))

(assert (= (and b!1405617 res!943444) b!1405618))

(assert (= (and b!1405618 res!943445) b!1405620))

(assert (= (and b!1405620 res!943447) b!1405616))

(declare-fun m!1294707 () Bool)

(assert (=> b!1405615 m!1294707))

(assert (=> b!1405615 m!1294707))

(declare-fun m!1294709 () Bool)

(assert (=> b!1405615 m!1294709))

(declare-fun m!1294711 () Bool)

(assert (=> b!1405620 m!1294711))

(declare-fun m!1294713 () Bool)

(assert (=> b!1405616 m!1294713))

(declare-fun m!1294715 () Bool)

(assert (=> b!1405616 m!1294715))

(assert (=> b!1405616 m!1294713))

(declare-fun m!1294717 () Bool)

(assert (=> b!1405616 m!1294717))

(assert (=> b!1405616 m!1294713))

(declare-fun m!1294719 () Bool)

(assert (=> b!1405616 m!1294719))

(assert (=> b!1405616 m!1294715))

(assert (=> b!1405616 m!1294713))

(declare-fun m!1294721 () Bool)

(assert (=> b!1405616 m!1294721))

(declare-fun m!1294723 () Bool)

(assert (=> b!1405616 m!1294723))

(assert (=> b!1405617 m!1294713))

(assert (=> b!1405617 m!1294713))

(declare-fun m!1294725 () Bool)

(assert (=> b!1405617 m!1294725))

(declare-fun m!1294727 () Bool)

(assert (=> start!120820 m!1294727))

(declare-fun m!1294729 () Bool)

(assert (=> start!120820 m!1294729))

(declare-fun m!1294731 () Bool)

(assert (=> b!1405618 m!1294731))

(push 1)

(assert (not b!1405616))

(assert (not b!1405617))

(assert (not start!120820))

(assert (not b!1405615))

(assert (not b!1405620))

(assert (not b!1405618))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1405687 () Bool)

(declare-fun e!795829 () Bool)

(declare-fun e!795830 () Bool)

(assert (=> b!1405687 (= e!795829 e!795830)))

(declare-fun res!943485 () Bool)

(declare-fun lt!619089 () SeekEntryResult!10638)

(assert (=> b!1405687 (= res!943485 (and (is-Intermediate!10638 lt!619089) (not (undefined!11450 lt!619089)) (bvslt (x!126692 lt!619089) #b01111111111111111111111111111110) (bvsge (x!126692 lt!619089) #b00000000000000000000000000000000) (bvsge (x!126692 lt!619089) #b00000000000000000000000000000000)))))

(assert (=> b!1405687 (=> (not res!943485) (not e!795830))))

(declare-fun b!1405688 () Bool)

(assert (=> b!1405688 (and (bvsge (index!44931 lt!619089) #b00000000000000000000000000000000) (bvslt (index!44931 lt!619089) (size!46975 a!2901)))))

(declare-fun res!943486 () Bool)

(assert (=> b!1405688 (= res!943486 (= (select (arr!46424 a!2901) (index!44931 lt!619089)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!795828 () Bool)

(assert (=> b!1405688 (=> res!943486 e!795828)))

(declare-fun b!1405689 () Bool)

(declare-fun e!795827 () SeekEntryResult!10638)

(assert (=> b!1405689 (= e!795827 (Intermediate!10638 true (toIndex!0 (select (arr!46424 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1405690 () Bool)

(declare-fun e!795831 () SeekEntryResult!10638)

(assert (=> b!1405690 (= e!795827 e!795831)))

(declare-fun lt!619088 () (_ BitVec 64))

(declare-fun c!130570 () Bool)

(assert (=> b!1405690 (= c!130570 (or (= lt!619088 (select (arr!46424 a!2901) j!112)) (= (bvadd lt!619088 lt!619088) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1405691 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405691 (= e!795831 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46424 a!2901) j!112) mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (arr!46424 a!2901) j!112) a!2901 mask!2840))))

(declare-fun d!151597 () Bool)

(assert (=> d!151597 e!795829))

(declare-fun c!130568 () Bool)

(assert (=> d!151597 (= c!130568 (and (is-Intermediate!10638 lt!619089) (undefined!11450 lt!619089)))))

(assert (=> d!151597 (= lt!619089 e!795827)))

(declare-fun c!130569 () Bool)

(assert (=> d!151597 (= c!130569 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151597 (= lt!619088 (select (arr!46424 a!2901) (toIndex!0 (select (arr!46424 a!2901) j!112) mask!2840)))))

(assert (=> d!151597 (validMask!0 mask!2840)))

(assert (=> d!151597 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46424 a!2901) j!112) mask!2840) (select (arr!46424 a!2901) j!112) a!2901 mask!2840) lt!619089)))

(declare-fun b!1405692 () Bool)

(assert (=> b!1405692 (= e!795831 (Intermediate!10638 false (toIndex!0 (select (arr!46424 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1405693 () Bool)

(assert (=> b!1405693 (and (bvsge (index!44931 lt!619089) #b00000000000000000000000000000000) (bvslt (index!44931 lt!619089) (size!46975 a!2901)))))

(declare-fun res!943484 () Bool)

(assert (=> b!1405693 (= res!943484 (= (select (arr!46424 a!2901) (index!44931 lt!619089)) (select (arr!46424 a!2901) j!112)))))

(assert (=> b!1405693 (=> res!943484 e!795828)))

(assert (=> b!1405693 (= e!795830 e!795828)))

(declare-fun b!1405694 () Bool)

(assert (=> b!1405694 (= e!795829 (bvsge (x!126692 lt!619089) #b01111111111111111111111111111110))))

(declare-fun b!1405695 () Bool)

(assert (=> b!1405695 (and (bvsge (index!44931 lt!619089) #b00000000000000000000000000000000) (bvslt (index!44931 lt!619089) (size!46975 a!2901)))))

(assert (=> b!1405695 (= e!795828 (= (select (arr!46424 a!2901) (index!44931 lt!619089)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!151597 c!130569) b!1405689))

(assert (= (and d!151597 (not c!130569)) b!1405690))

(assert (= (and b!1405690 c!130570) b!1405692))

(assert (= (and b!1405690 (not c!130570)) b!1405691))

(assert (= (and d!151597 c!130568) b!1405694))

(assert (= (and d!151597 (not c!130568)) b!1405687))

(assert (= (and b!1405687 res!943485) b!1405693))

(assert (= (and b!1405693 (not res!943484)) b!1405688))

(assert (= (and b!1405688 (not res!943486)) b!1405695))

(assert (=> d!151597 m!1294715))

(declare-fun m!1294771 () Bool)

(assert (=> d!151597 m!1294771))

(assert (=> d!151597 m!1294727))

(assert (=> b!1405691 m!1294715))

(declare-fun m!1294773 () Bool)

(assert (=> b!1405691 m!1294773))

(assert (=> b!1405691 m!1294773))

(assert (=> b!1405691 m!1294713))

(declare-fun m!1294775 () Bool)

(assert (=> b!1405691 m!1294775))

(declare-fun m!1294777 () Bool)

(assert (=> b!1405695 m!1294777))

(assert (=> b!1405693 m!1294777))

(assert (=> b!1405688 m!1294777))

(assert (=> b!1405616 d!151597))

(declare-fun b!1405729 () Bool)

(declare-fun e!795849 () SeekEntryResult!10638)

(assert (=> b!1405729 (= e!795849 Undefined!10638)))

(declare-fun d!151603 () Bool)

(declare-fun lt!619103 () SeekEntryResult!10638)

(assert (=> d!151603 (and (or (is-Undefined!10638 lt!619103) (not (is-Found!10638 lt!619103)) (and (bvsge (index!44930 lt!619103) #b00000000000000000000000000000000) (bvslt (index!44930 lt!619103) (size!46975 a!2901)))) (or (is-Undefined!10638 lt!619103) (is-Found!10638 lt!619103) (not (is-MissingZero!10638 lt!619103)) (and (bvsge (index!44929 lt!619103) #b00000000000000000000000000000000) (bvslt (index!44929 lt!619103) (size!46975 a!2901)))) (or (is-Undefined!10638 lt!619103) (is-Found!10638 lt!619103) (is-MissingZero!10638 lt!619103) (not (is-MissingVacant!10638 lt!619103)) (and (bvsge (index!44932 lt!619103) #b00000000000000000000000000000000) (bvslt (index!44932 lt!619103) (size!46975 a!2901)))) (or (is-Undefined!10638 lt!619103) (ite (is-Found!10638 lt!619103) (= (select (arr!46424 a!2901) (index!44930 lt!619103)) (select (arr!46424 a!2901) j!112)) (ite (is-MissingZero!10638 lt!619103) (= (select (arr!46424 a!2901) (index!44929 lt!619103)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10638 lt!619103) (= (select (arr!46424 a!2901) (index!44932 lt!619103)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151603 (= lt!619103 e!795849)))

(declare-fun c!130586 () Bool)

(declare-fun lt!619102 () SeekEntryResult!10638)

(assert (=> d!151603 (= c!130586 (and (is-Intermediate!10638 lt!619102) (undefined!11450 lt!619102)))))

(assert (=> d!151603 (= lt!619102 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46424 a!2901) j!112) mask!2840) (select (arr!46424 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151603 (validMask!0 mask!2840)))

(assert (=> d!151603 (= (seekEntryOrOpen!0 (select (arr!46424 a!2901) j!112) a!2901 mask!2840) lt!619103)))

(declare-fun b!1405730 () Bool)

(declare-fun c!130587 () Bool)

(declare-fun lt!619104 () (_ BitVec 64))

(assert (=> b!1405730 (= c!130587 (= lt!619104 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!795850 () SeekEntryResult!10638)

(declare-fun e!795851 () SeekEntryResult!10638)

(assert (=> b!1405730 (= e!795850 e!795851)))

(declare-fun b!1405731 () Bool)

(assert (=> b!1405731 (= e!795851 (MissingZero!10638 (index!44931 lt!619102)))))

(declare-fun b!1405732 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96151 (_ BitVec 32)) SeekEntryResult!10638)

(assert (=> b!1405732 (= e!795851 (seekKeyOrZeroReturnVacant!0 (x!126692 lt!619102) (index!44931 lt!619102) (index!44931 lt!619102) (select (arr!46424 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405733 () Bool)

(assert (=> b!1405733 (= e!795850 (Found!10638 (index!44931 lt!619102)))))

(declare-fun b!1405734 () Bool)

(assert (=> b!1405734 (= e!795849 e!795850)))

(assert (=> b!1405734 (= lt!619104 (select (arr!46424 a!2901) (index!44931 lt!619102)))))

(declare-fun c!130588 () Bool)

(assert (=> b!1405734 (= c!130588 (= lt!619104 (select (arr!46424 a!2901) j!112)))))

(assert (= (and d!151603 c!130586) b!1405729))

(assert (= (and d!151603 (not c!130586)) b!1405734))

(assert (= (and b!1405734 c!130588) b!1405733))

(assert (= (and b!1405734 (not c!130588)) b!1405730))

(assert (= (and b!1405730 c!130587) b!1405731))

(assert (= (and b!1405730 (not c!130587)) b!1405732))

(assert (=> d!151603 m!1294713))

(assert (=> d!151603 m!1294715))

(declare-fun m!1294787 () Bool)

(assert (=> d!151603 m!1294787))

(assert (=> d!151603 m!1294727))

(assert (=> d!151603 m!1294715))

(assert (=> d!151603 m!1294713))

(assert (=> d!151603 m!1294721))

(declare-fun m!1294789 () Bool)

(assert (=> d!151603 m!1294789))

(declare-fun m!1294791 () Bool)

(assert (=> d!151603 m!1294791))

(assert (=> b!1405732 m!1294713))

(declare-fun m!1294793 () Bool)

(assert (=> b!1405732 m!1294793))

(declare-fun m!1294795 () Bool)

(assert (=> b!1405734 m!1294795))

(assert (=> b!1405616 d!151603))

(declare-fun d!151607 () Bool)

(assert (=> d!151607 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!619107 () Unit!47277)

(declare-fun choose!38 (array!96151 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47277)

(assert (=> d!151607 (= lt!619107 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151607 (validMask!0 mask!2840)))

(assert (=> d!151607 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!619107)))

(declare-fun bs!40927 () Bool)

(assert (= bs!40927 d!151607))

(assert (=> bs!40927 m!1294723))

(declare-fun m!1294797 () Bool)

(assert (=> bs!40927 m!1294797))

(assert (=> bs!40927 m!1294727))

(assert (=> b!1405616 d!151607))

(declare-fun d!151609 () Bool)

(declare-fun lt!619121 () (_ BitVec 32))

(declare-fun lt!619120 () (_ BitVec 32))

(assert (=> d!151609 (= lt!619121 (bvmul (bvxor lt!619120 (bvlshr lt!619120 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151609 (= lt!619120 ((_ extract 31 0) (bvand (bvxor (select (arr!46424 a!2901) j!112) (bvlshr (select (arr!46424 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151609 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!943496 (let ((h!34184 ((_ extract 31 0) (bvand (bvxor (select (arr!46424 a!2901) j!112) (bvlshr (select (arr!46424 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!126697 (bvmul (bvxor h!34184 (bvlshr h!34184 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!126697 (bvlshr x!126697 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!943496 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!943496 #b00000000000000000000000000000000))))))

(assert (=> d!151609 (= (toIndex!0 (select (arr!46424 a!2901) j!112) mask!2840) (bvand (bvxor lt!619121 (bvlshr lt!619121 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1405616 d!151609))

(declare-fun bm!66969 () Bool)

(declare-fun call!66972 () Bool)

(assert (=> bm!66969 (= call!66972 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!151613 () Bool)

(declare-fun res!943505 () Bool)

(declare-fun e!795878 () Bool)

(assert (=> d!151613 (=> res!943505 e!795878)))

(assert (=> d!151613 (= res!943505 (bvsge j!112 (size!46975 a!2901)))))

(assert (=> d!151613 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!795878)))

(declare-fun b!1405776 () Bool)

(declare-fun e!795877 () Bool)

(assert (=> b!1405776 (= e!795877 call!66972)))

(declare-fun b!1405777 () Bool)

(assert (=> b!1405777 (= e!795878 e!795877)))

(declare-fun c!130603 () Bool)

(assert (=> b!1405777 (= c!130603 (validKeyInArray!0 (select (arr!46424 a!2901) j!112)))))

(declare-fun b!1405778 () Bool)

(declare-fun e!795876 () Bool)

(assert (=> b!1405778 (= e!795876 call!66972)))

(declare-fun b!1405779 () Bool)

(assert (=> b!1405779 (= e!795877 e!795876)))

(declare-fun lt!619133 () (_ BitVec 64))

(assert (=> b!1405779 (= lt!619133 (select (arr!46424 a!2901) j!112))))

(declare-fun lt!619132 () Unit!47277)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96151 (_ BitVec 64) (_ BitVec 32)) Unit!47277)

(assert (=> b!1405779 (= lt!619132 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619133 j!112))))

(declare-fun arrayContainsKey!0 (array!96151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1405779 (arrayContainsKey!0 a!2901 lt!619133 #b00000000000000000000000000000000)))

(declare-fun lt!619131 () Unit!47277)

(assert (=> b!1405779 (= lt!619131 lt!619132)))

(declare-fun res!943504 () Bool)

(assert (=> b!1405779 (= res!943504 (= (seekEntryOrOpen!0 (select (arr!46424 a!2901) j!112) a!2901 mask!2840) (Found!10638 j!112)))))

(assert (=> b!1405779 (=> (not res!943504) (not e!795876))))

(assert (= (and d!151613 (not res!943505)) b!1405777))

(assert (= (and b!1405777 c!130603) b!1405779))

(assert (= (and b!1405777 (not c!130603)) b!1405776))

(assert (= (and b!1405779 res!943504) b!1405778))

(assert (= (or b!1405778 b!1405776) bm!66969))

(declare-fun m!1294817 () Bool)

(assert (=> bm!66969 m!1294817))

(assert (=> b!1405777 m!1294713))

(assert (=> b!1405777 m!1294713))

(assert (=> b!1405777 m!1294725))

(assert (=> b!1405779 m!1294713))

(declare-fun m!1294819 () Bool)

(assert (=> b!1405779 m!1294819))

(declare-fun m!1294821 () Bool)

(assert (=> b!1405779 m!1294821))

(assert (=> b!1405779 m!1294713))

(assert (=> b!1405779 m!1294719))

(assert (=> b!1405616 d!151613))

(declare-fun d!151617 () Bool)

(assert (=> d!151617 (= (validKeyInArray!0 (select (arr!46424 a!2901) i!1037)) (and (not (= (select (arr!46424 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46424 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1405615 d!151617))

(declare-fun d!151619 () Bool)

(assert (=> d!151619 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120820 d!151619))

(declare-fun d!151623 () Bool)

(assert (=> d!151623 (= (array_inv!35705 a!2901) (bvsge (size!46975 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120820 d!151623))

(declare-fun bm!66972 () Bool)

(declare-fun call!66975 () Bool)

(declare-fun c!130612 () Bool)

(assert (=> bm!66972 (= call!66975 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130612 (Cons!32926 (select (arr!46424 a!2901) #b00000000000000000000000000000000) Nil!32927) Nil!32927)))))

(declare-fun d!151625 () Bool)

(declare-fun res!943514 () Bool)

(declare-fun e!795893 () Bool)

(assert (=> d!151625 (=> res!943514 e!795893)))

(assert (=> d!151625 (= res!943514 (bvsge #b00000000000000000000000000000000 (size!46975 a!2901)))))

(assert (=> d!151625 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32927) e!795893)))

(declare-fun b!1405802 () Bool)

(declare-fun e!795896 () Bool)

(assert (=> b!1405802 (= e!795893 e!795896)))

(declare-fun res!943515 () Bool)

(assert (=> b!1405802 (=> (not res!943515) (not e!795896))))

(declare-fun e!795895 () Bool)

(assert (=> b!1405802 (= res!943515 (not e!795895))))

(declare-fun res!943513 () Bool)

(assert (=> b!1405802 (=> (not res!943513) (not e!795895))))

(assert (=> b!1405802 (= res!943513 (validKeyInArray!0 (select (arr!46424 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1405803 () Bool)

(declare-fun e!795894 () Bool)

(assert (=> b!1405803 (= e!795896 e!795894)))

(assert (=> b!1405803 (= c!130612 (validKeyInArray!0 (select (arr!46424 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1405804 () Bool)

(assert (=> b!1405804 (= e!795894 call!66975)))

(declare-fun b!1405805 () Bool)

(declare-fun contains!9830 (List!32930 (_ BitVec 64)) Bool)

(assert (=> b!1405805 (= e!795895 (contains!9830 Nil!32927 (select (arr!46424 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1405806 () Bool)

(assert (=> b!1405806 (= e!795894 call!66975)))

(assert (= (and d!151625 (not res!943514)) b!1405802))

(assert (= (and b!1405802 res!943513) b!1405805))

(assert (= (and b!1405802 res!943515) b!1405803))

(assert (= (and b!1405803 c!130612) b!1405806))

(assert (= (and b!1405803 (not c!130612)) b!1405804))

(assert (= (or b!1405806 b!1405804) bm!66972))

(declare-fun m!1294825 () Bool)

(assert (=> bm!66972 m!1294825))

(declare-fun m!1294827 () Bool)

(assert (=> bm!66972 m!1294827))

(assert (=> b!1405802 m!1294825))

(assert (=> b!1405802 m!1294825))

(declare-fun m!1294829 () Bool)

(assert (=> b!1405802 m!1294829))

(assert (=> b!1405803 m!1294825))

(assert (=> b!1405803 m!1294825))

(assert (=> b!1405803 m!1294829))

(assert (=> b!1405805 m!1294825))

(assert (=> b!1405805 m!1294825))

(declare-fun m!1294831 () Bool)

(assert (=> b!1405805 m!1294831))

(assert (=> b!1405620 d!151625))

(declare-fun bm!66973 () Bool)

(declare-fun call!66976 () Bool)

(assert (=> bm!66973 (= call!66976 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!151629 () Bool)

(declare-fun res!943517 () Bool)

(declare-fun e!795899 () Bool)

(assert (=> d!151629 (=> res!943517 e!795899)))

(assert (=> d!151629 (= res!943517 (bvsge #b00000000000000000000000000000000 (size!46975 a!2901)))))

(assert (=> d!151629 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!795899)))

(declare-fun b!1405807 () Bool)

(declare-fun e!795898 () Bool)

(assert (=> b!1405807 (= e!795898 call!66976)))

(declare-fun b!1405808 () Bool)

(assert (=> b!1405808 (= e!795899 e!795898)))

(declare-fun c!130613 () Bool)

(assert (=> b!1405808 (= c!130613 (validKeyInArray!0 (select (arr!46424 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1405809 () Bool)

(declare-fun e!795897 () Bool)

(assert (=> b!1405809 (= e!795897 call!66976)))

(declare-fun b!1405810 () Bool)

(assert (=> b!1405810 (= e!795898 e!795897)))

(declare-fun lt!619151 () (_ BitVec 64))

(assert (=> b!1405810 (= lt!619151 (select (arr!46424 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!619150 () Unit!47277)

(assert (=> b!1405810 (= lt!619150 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619151 #b00000000000000000000000000000000))))

(assert (=> b!1405810 (arrayContainsKey!0 a!2901 lt!619151 #b00000000000000000000000000000000)))

(declare-fun lt!619149 () Unit!47277)

(assert (=> b!1405810 (= lt!619149 lt!619150)))

(declare-fun res!943516 () Bool)

(assert (=> b!1405810 (= res!943516 (= (seekEntryOrOpen!0 (select (arr!46424 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10638 #b00000000000000000000000000000000)))))

(assert (=> b!1405810 (=> (not res!943516) (not e!795897))))

(assert (= (and d!151629 (not res!943517)) b!1405808))

(assert (= (and b!1405808 c!130613) b!1405810))

(assert (= (and b!1405808 (not c!130613)) b!1405807))

(assert (= (and b!1405810 res!943516) b!1405809))

(assert (= (or b!1405809 b!1405807) bm!66973))

(declare-fun m!1294833 () Bool)

(assert (=> bm!66973 m!1294833))

(assert (=> b!1405808 m!1294825))

(assert (=> b!1405808 m!1294825))

(assert (=> b!1405808 m!1294829))

(assert (=> b!1405810 m!1294825))

(declare-fun m!1294835 () Bool)

(assert (=> b!1405810 m!1294835))

(declare-fun m!1294837 () Bool)

(assert (=> b!1405810 m!1294837))

(assert (=> b!1405810 m!1294825))

(declare-fun m!1294839 () Bool)

(assert (=> b!1405810 m!1294839))

(assert (=> b!1405618 d!151629))

(declare-fun d!151631 () Bool)

(assert (=> d!151631 (= (validKeyInArray!0 (select (arr!46424 a!2901) j!112)) (and (not (= (select (arr!46424 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46424 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1405617 d!151631))

(push 1)

(assert (not b!1405805))

(assert (not b!1405779))

(assert (not b!1405691))

(assert (not d!151603))

(assert (not d!151597))

(assert (not b!1405802))

(assert (not b!1405777))

(assert (not b!1405808))

(assert (not d!151607))

(assert (not bm!66973))

(assert (not b!1405810))

(assert (not bm!66972))

(assert (not b!1405732))

(assert (not b!1405803))

(assert (not bm!66969))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

