; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119522 () Bool)

(assert start!119522)

(declare-fun b!1392592 () Bool)

(declare-fun res!932169 () Bool)

(declare-fun e!788567 () Bool)

(assert (=> b!1392592 (=> (not res!932169) (not e!788567))))

(declare-datatypes ((array!95255 0))(
  ( (array!95256 (arr!45987 (Array (_ BitVec 32) (_ BitVec 64))) (size!46537 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95255)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392592 (= res!932169 (validKeyInArray!0 (select (arr!45987 a!2901) j!112)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1392593 () Bool)

(declare-fun e!788566 () Bool)

(declare-datatypes ((SeekEntryResult!10304 0))(
  ( (MissingZero!10304 (index!43587 (_ BitVec 32))) (Found!10304 (index!43588 (_ BitVec 32))) (Intermediate!10304 (undefined!11116 Bool) (index!43589 (_ BitVec 32)) (x!125270 (_ BitVec 32))) (Undefined!10304) (MissingVacant!10304 (index!43590 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95255 (_ BitVec 32)) SeekEntryResult!10304)

(assert (=> b!1392593 (= e!788566 (= (seekEntryOrOpen!0 (select (arr!45987 a!2901) j!112) a!2901 mask!2840) (Found!10304 j!112)))))

(declare-fun res!932171 () Bool)

(assert (=> start!119522 (=> (not res!932171) (not e!788567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119522 (= res!932171 (validMask!0 mask!2840))))

(assert (=> start!119522 e!788567))

(assert (=> start!119522 true))

(declare-fun array_inv!35015 (array!95255) Bool)

(assert (=> start!119522 (array_inv!35015 a!2901)))

(declare-fun b!1392594 () Bool)

(declare-fun res!932172 () Bool)

(assert (=> b!1392594 (=> (not res!932172) (not e!788567))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1392594 (= res!932172 (and (= (size!46537 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46537 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46537 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1392595 () Bool)

(declare-fun res!932167 () Bool)

(declare-fun e!788564 () Bool)

(assert (=> b!1392595 (=> res!932167 e!788564)))

(declare-fun lt!611655 () SeekEntryResult!10304)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95255 (_ BitVec 32)) SeekEntryResult!10304)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392595 (= res!932167 (not (= lt!611655 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95256 (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46537 a!2901)) mask!2840))))))

(declare-fun b!1392596 () Bool)

(declare-fun res!932165 () Bool)

(assert (=> b!1392596 (=> (not res!932165) (not e!788567))))

(declare-datatypes ((List!32506 0))(
  ( (Nil!32503) (Cons!32502 (h!33732 (_ BitVec 64)) (t!47200 List!32506)) )
))
(declare-fun arrayNoDuplicates!0 (array!95255 (_ BitVec 32) List!32506) Bool)

(assert (=> b!1392596 (= res!932165 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32503))))

(declare-fun b!1392597 () Bool)

(declare-fun res!932166 () Bool)

(assert (=> b!1392597 (=> (not res!932166) (not e!788567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95255 (_ BitVec 32)) Bool)

(assert (=> b!1392597 (= res!932166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392598 () Bool)

(declare-fun res!932168 () Bool)

(assert (=> b!1392598 (=> (not res!932168) (not e!788567))))

(assert (=> b!1392598 (= res!932168 (validKeyInArray!0 (select (arr!45987 a!2901) i!1037)))))

(declare-fun b!1392599 () Bool)

(assert (=> b!1392599 (= e!788564 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(declare-fun b!1392600 () Bool)

(assert (=> b!1392600 (= e!788567 (not e!788564))))

(declare-fun res!932170 () Bool)

(assert (=> b!1392600 (=> res!932170 e!788564)))

(get-info :version)

(assert (=> b!1392600 (= res!932170 (or (not ((_ is Intermediate!10304) lt!611655)) (undefined!11116 lt!611655)))))

(assert (=> b!1392600 e!788566))

(declare-fun res!932173 () Bool)

(assert (=> b!1392600 (=> (not res!932173) (not e!788566))))

(assert (=> b!1392600 (= res!932173 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46612 0))(
  ( (Unit!46613) )
))
(declare-fun lt!611654 () Unit!46612)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95255 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46612)

(assert (=> b!1392600 (= lt!611654 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1392600 (= lt!611655 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45987 a!2901) j!112) mask!2840) (select (arr!45987 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119522 res!932171) b!1392594))

(assert (= (and b!1392594 res!932172) b!1392598))

(assert (= (and b!1392598 res!932168) b!1392592))

(assert (= (and b!1392592 res!932169) b!1392597))

(assert (= (and b!1392597 res!932166) b!1392596))

(assert (= (and b!1392596 res!932165) b!1392600))

(assert (= (and b!1392600 res!932173) b!1392593))

(assert (= (and b!1392600 (not res!932170)) b!1392595))

(assert (= (and b!1392595 (not res!932167)) b!1392599))

(declare-fun m!1278367 () Bool)

(assert (=> b!1392593 m!1278367))

(assert (=> b!1392593 m!1278367))

(declare-fun m!1278369 () Bool)

(assert (=> b!1392593 m!1278369))

(declare-fun m!1278371 () Bool)

(assert (=> b!1392597 m!1278371))

(declare-fun m!1278373 () Bool)

(assert (=> b!1392595 m!1278373))

(declare-fun m!1278375 () Bool)

(assert (=> b!1392595 m!1278375))

(assert (=> b!1392595 m!1278375))

(declare-fun m!1278377 () Bool)

(assert (=> b!1392595 m!1278377))

(assert (=> b!1392595 m!1278377))

(assert (=> b!1392595 m!1278375))

(declare-fun m!1278379 () Bool)

(assert (=> b!1392595 m!1278379))

(declare-fun m!1278381 () Bool)

(assert (=> start!119522 m!1278381))

(declare-fun m!1278383 () Bool)

(assert (=> start!119522 m!1278383))

(declare-fun m!1278385 () Bool)

(assert (=> b!1392596 m!1278385))

(declare-fun m!1278387 () Bool)

(assert (=> b!1392598 m!1278387))

(assert (=> b!1392598 m!1278387))

(declare-fun m!1278389 () Bool)

(assert (=> b!1392598 m!1278389))

(assert (=> b!1392600 m!1278367))

(declare-fun m!1278391 () Bool)

(assert (=> b!1392600 m!1278391))

(assert (=> b!1392600 m!1278367))

(declare-fun m!1278393 () Bool)

(assert (=> b!1392600 m!1278393))

(assert (=> b!1392600 m!1278391))

(assert (=> b!1392600 m!1278367))

(declare-fun m!1278395 () Bool)

(assert (=> b!1392600 m!1278395))

(declare-fun m!1278397 () Bool)

(assert (=> b!1392600 m!1278397))

(assert (=> b!1392592 m!1278367))

(assert (=> b!1392592 m!1278367))

(declare-fun m!1278399 () Bool)

(assert (=> b!1392592 m!1278399))

(check-sat (not b!1392596) (not b!1392600) (not b!1392598) (not b!1392593) (not b!1392597) (not b!1392592) (not start!119522) (not b!1392595))
(check-sat)
(get-model)

(declare-fun d!150501 () Bool)

(declare-fun res!932209 () Bool)

(declare-fun e!788592 () Bool)

(assert (=> d!150501 (=> res!932209 e!788592)))

(assert (=> d!150501 (= res!932209 (bvsge j!112 (size!46537 a!2901)))))

(assert (=> d!150501 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!788592)))

(declare-fun call!66786 () Bool)

(declare-fun bm!66783 () Bool)

(assert (=> bm!66783 (= call!66786 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1392644 () Bool)

(declare-fun e!788593 () Bool)

(assert (=> b!1392644 (= e!788592 e!788593)))

(declare-fun c!129668 () Bool)

(assert (=> b!1392644 (= c!129668 (validKeyInArray!0 (select (arr!45987 a!2901) j!112)))))

(declare-fun b!1392645 () Bool)

(declare-fun e!788594 () Bool)

(assert (=> b!1392645 (= e!788593 e!788594)))

(declare-fun lt!611676 () (_ BitVec 64))

(assert (=> b!1392645 (= lt!611676 (select (arr!45987 a!2901) j!112))))

(declare-fun lt!611675 () Unit!46612)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95255 (_ BitVec 64) (_ BitVec 32)) Unit!46612)

(assert (=> b!1392645 (= lt!611675 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611676 j!112))))

(declare-fun arrayContainsKey!0 (array!95255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1392645 (arrayContainsKey!0 a!2901 lt!611676 #b00000000000000000000000000000000)))

(declare-fun lt!611674 () Unit!46612)

(assert (=> b!1392645 (= lt!611674 lt!611675)))

(declare-fun res!932210 () Bool)

(assert (=> b!1392645 (= res!932210 (= (seekEntryOrOpen!0 (select (arr!45987 a!2901) j!112) a!2901 mask!2840) (Found!10304 j!112)))))

(assert (=> b!1392645 (=> (not res!932210) (not e!788594))))

(declare-fun b!1392646 () Bool)

(assert (=> b!1392646 (= e!788593 call!66786)))

(declare-fun b!1392647 () Bool)

(assert (=> b!1392647 (= e!788594 call!66786)))

(assert (= (and d!150501 (not res!932209)) b!1392644))

(assert (= (and b!1392644 c!129668) b!1392645))

(assert (= (and b!1392644 (not c!129668)) b!1392646))

(assert (= (and b!1392645 res!932210) b!1392647))

(assert (= (or b!1392647 b!1392646) bm!66783))

(declare-fun m!1278435 () Bool)

(assert (=> bm!66783 m!1278435))

(assert (=> b!1392644 m!1278367))

(assert (=> b!1392644 m!1278367))

(assert (=> b!1392644 m!1278399))

(assert (=> b!1392645 m!1278367))

(declare-fun m!1278439 () Bool)

(assert (=> b!1392645 m!1278439))

(declare-fun m!1278441 () Bool)

(assert (=> b!1392645 m!1278441))

(assert (=> b!1392645 m!1278367))

(assert (=> b!1392645 m!1278369))

(assert (=> b!1392600 d!150501))

(declare-fun d!150505 () Bool)

(assert (=> d!150505 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!611682 () Unit!46612)

(declare-fun choose!38 (array!95255 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46612)

(assert (=> d!150505 (= lt!611682 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150505 (validMask!0 mask!2840)))

(assert (=> d!150505 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!611682)))

(declare-fun bs!40514 () Bool)

(assert (= bs!40514 d!150505))

(assert (=> bs!40514 m!1278397))

(declare-fun m!1278453 () Bool)

(assert (=> bs!40514 m!1278453))

(assert (=> bs!40514 m!1278381))

(assert (=> b!1392600 d!150505))

(declare-fun b!1392711 () Bool)

(declare-fun e!788642 () SeekEntryResult!10304)

(assert (=> b!1392711 (= e!788642 (Intermediate!10304 false (toIndex!0 (select (arr!45987 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!150511 () Bool)

(declare-fun e!788641 () Bool)

(assert (=> d!150511 e!788641))

(declare-fun c!129690 () Bool)

(declare-fun lt!611703 () SeekEntryResult!10304)

(assert (=> d!150511 (= c!129690 (and ((_ is Intermediate!10304) lt!611703) (undefined!11116 lt!611703)))))

(declare-fun e!788640 () SeekEntryResult!10304)

(assert (=> d!150511 (= lt!611703 e!788640)))

(declare-fun c!129688 () Bool)

(assert (=> d!150511 (= c!129688 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!611702 () (_ BitVec 64))

(assert (=> d!150511 (= lt!611702 (select (arr!45987 a!2901) (toIndex!0 (select (arr!45987 a!2901) j!112) mask!2840)))))

(assert (=> d!150511 (validMask!0 mask!2840)))

(assert (=> d!150511 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45987 a!2901) j!112) mask!2840) (select (arr!45987 a!2901) j!112) a!2901 mask!2840) lt!611703)))

(declare-fun b!1392712 () Bool)

(assert (=> b!1392712 (and (bvsge (index!43589 lt!611703) #b00000000000000000000000000000000) (bvslt (index!43589 lt!611703) (size!46537 a!2901)))))

(declare-fun e!788639 () Bool)

(assert (=> b!1392712 (= e!788639 (= (select (arr!45987 a!2901) (index!43589 lt!611703)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1392713 () Bool)

(assert (=> b!1392713 (= e!788640 e!788642)))

(declare-fun c!129689 () Bool)

(assert (=> b!1392713 (= c!129689 (or (= lt!611702 (select (arr!45987 a!2901) j!112)) (= (bvadd lt!611702 lt!611702) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1392714 () Bool)

(assert (=> b!1392714 (and (bvsge (index!43589 lt!611703) #b00000000000000000000000000000000) (bvslt (index!43589 lt!611703) (size!46537 a!2901)))))

(declare-fun res!932243 () Bool)

(assert (=> b!1392714 (= res!932243 (= (select (arr!45987 a!2901) (index!43589 lt!611703)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1392714 (=> res!932243 e!788639)))

(declare-fun b!1392715 () Bool)

(declare-fun e!788638 () Bool)

(assert (=> b!1392715 (= e!788641 e!788638)))

(declare-fun res!932241 () Bool)

(assert (=> b!1392715 (= res!932241 (and ((_ is Intermediate!10304) lt!611703) (not (undefined!11116 lt!611703)) (bvslt (x!125270 lt!611703) #b01111111111111111111111111111110) (bvsge (x!125270 lt!611703) #b00000000000000000000000000000000) (bvsge (x!125270 lt!611703) #b00000000000000000000000000000000)))))

(assert (=> b!1392715 (=> (not res!932241) (not e!788638))))

(declare-fun b!1392716 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392716 (= e!788642 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!45987 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!45987 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392717 () Bool)

(assert (=> b!1392717 (= e!788641 (bvsge (x!125270 lt!611703) #b01111111111111111111111111111110))))

(declare-fun b!1392718 () Bool)

(assert (=> b!1392718 (= e!788640 (Intermediate!10304 true (toIndex!0 (select (arr!45987 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1392720 () Bool)

(assert (=> b!1392720 (and (bvsge (index!43589 lt!611703) #b00000000000000000000000000000000) (bvslt (index!43589 lt!611703) (size!46537 a!2901)))))

(declare-fun res!932242 () Bool)

(assert (=> b!1392720 (= res!932242 (= (select (arr!45987 a!2901) (index!43589 lt!611703)) (select (arr!45987 a!2901) j!112)))))

(assert (=> b!1392720 (=> res!932242 e!788639)))

(assert (=> b!1392720 (= e!788638 e!788639)))

(assert (= (and d!150511 c!129688) b!1392718))

(assert (= (and d!150511 (not c!129688)) b!1392713))

(assert (= (and b!1392713 c!129689) b!1392711))

(assert (= (and b!1392713 (not c!129689)) b!1392716))

(assert (= (and d!150511 c!129690) b!1392717))

(assert (= (and d!150511 (not c!129690)) b!1392715))

(assert (= (and b!1392715 res!932241) b!1392720))

(assert (= (and b!1392720 (not res!932242)) b!1392714))

(assert (= (and b!1392714 (not res!932243)) b!1392712))

(assert (=> b!1392716 m!1278391))

(declare-fun m!1278475 () Bool)

(assert (=> b!1392716 m!1278475))

(assert (=> b!1392716 m!1278475))

(assert (=> b!1392716 m!1278367))

(declare-fun m!1278477 () Bool)

(assert (=> b!1392716 m!1278477))

(assert (=> d!150511 m!1278391))

(declare-fun m!1278479 () Bool)

(assert (=> d!150511 m!1278479))

(assert (=> d!150511 m!1278381))

(declare-fun m!1278481 () Bool)

(assert (=> b!1392720 m!1278481))

(assert (=> b!1392712 m!1278481))

(assert (=> b!1392714 m!1278481))

(assert (=> b!1392600 d!150511))

(declare-fun d!150523 () Bool)

(declare-fun lt!611718 () (_ BitVec 32))

(declare-fun lt!611717 () (_ BitVec 32))

(assert (=> d!150523 (= lt!611718 (bvmul (bvxor lt!611717 (bvlshr lt!611717 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150523 (= lt!611717 ((_ extract 31 0) (bvand (bvxor (select (arr!45987 a!2901) j!112) (bvlshr (select (arr!45987 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150523 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!932244 (let ((h!33735 ((_ extract 31 0) (bvand (bvxor (select (arr!45987 a!2901) j!112) (bvlshr (select (arr!45987 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125275 (bvmul (bvxor h!33735 (bvlshr h!33735 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125275 (bvlshr x!125275 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!932244 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!932244 #b00000000000000000000000000000000))))))

(assert (=> d!150523 (= (toIndex!0 (select (arr!45987 a!2901) j!112) mask!2840) (bvand (bvxor lt!611718 (bvlshr lt!611718 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1392600 d!150523))

(declare-fun b!1392737 () Bool)

(declare-fun e!788656 () SeekEntryResult!10304)

(assert (=> b!1392737 (= e!788656 (Intermediate!10304 false (toIndex!0 (select (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!150535 () Bool)

(declare-fun e!788655 () Bool)

(assert (=> d!150535 e!788655))

(declare-fun c!129697 () Bool)

(declare-fun lt!611720 () SeekEntryResult!10304)

(assert (=> d!150535 (= c!129697 (and ((_ is Intermediate!10304) lt!611720) (undefined!11116 lt!611720)))))

(declare-fun e!788654 () SeekEntryResult!10304)

(assert (=> d!150535 (= lt!611720 e!788654)))

(declare-fun c!129695 () Bool)

(assert (=> d!150535 (= c!129695 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!611719 () (_ BitVec 64))

(assert (=> d!150535 (= lt!611719 (select (arr!45987 (array!95256 (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46537 a!2901))) (toIndex!0 (select (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!150535 (validMask!0 mask!2840)))

(assert (=> d!150535 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95256 (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46537 a!2901)) mask!2840) lt!611720)))

(declare-fun b!1392738 () Bool)

(assert (=> b!1392738 (and (bvsge (index!43589 lt!611720) #b00000000000000000000000000000000) (bvslt (index!43589 lt!611720) (size!46537 (array!95256 (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46537 a!2901)))))))

(declare-fun e!788653 () Bool)

(assert (=> b!1392738 (= e!788653 (= (select (arr!45987 (array!95256 (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46537 a!2901))) (index!43589 lt!611720)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1392739 () Bool)

(assert (=> b!1392739 (= e!788654 e!788656)))

(declare-fun c!129696 () Bool)

(assert (=> b!1392739 (= c!129696 (or (= lt!611719 (select (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!611719 lt!611719) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1392740 () Bool)

(assert (=> b!1392740 (and (bvsge (index!43589 lt!611720) #b00000000000000000000000000000000) (bvslt (index!43589 lt!611720) (size!46537 (array!95256 (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46537 a!2901)))))))

(declare-fun res!932252 () Bool)

(assert (=> b!1392740 (= res!932252 (= (select (arr!45987 (array!95256 (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46537 a!2901))) (index!43589 lt!611720)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1392740 (=> res!932252 e!788653)))

(declare-fun b!1392741 () Bool)

(declare-fun e!788652 () Bool)

(assert (=> b!1392741 (= e!788655 e!788652)))

(declare-fun res!932250 () Bool)

(assert (=> b!1392741 (= res!932250 (and ((_ is Intermediate!10304) lt!611720) (not (undefined!11116 lt!611720)) (bvslt (x!125270 lt!611720) #b01111111111111111111111111111110) (bvsge (x!125270 lt!611720) #b00000000000000000000000000000000) (bvsge (x!125270 lt!611720) #b00000000000000000000000000000000)))))

(assert (=> b!1392741 (=> (not res!932250) (not e!788652))))

(declare-fun b!1392742 () Bool)

(assert (=> b!1392742 (= e!788656 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95256 (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46537 a!2901)) mask!2840))))

(declare-fun b!1392743 () Bool)

(assert (=> b!1392743 (= e!788655 (bvsge (x!125270 lt!611720) #b01111111111111111111111111111110))))

(declare-fun b!1392744 () Bool)

(assert (=> b!1392744 (= e!788654 (Intermediate!10304 true (toIndex!0 (select (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1392745 () Bool)

(assert (=> b!1392745 (and (bvsge (index!43589 lt!611720) #b00000000000000000000000000000000) (bvslt (index!43589 lt!611720) (size!46537 (array!95256 (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46537 a!2901)))))))

(declare-fun res!932251 () Bool)

(assert (=> b!1392745 (= res!932251 (= (select (arr!45987 (array!95256 (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46537 a!2901))) (index!43589 lt!611720)) (select (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1392745 (=> res!932251 e!788653)))

(assert (=> b!1392745 (= e!788652 e!788653)))

(assert (= (and d!150535 c!129695) b!1392744))

(assert (= (and d!150535 (not c!129695)) b!1392739))

(assert (= (and b!1392739 c!129696) b!1392737))

(assert (= (and b!1392739 (not c!129696)) b!1392742))

(assert (= (and d!150535 c!129697) b!1392743))

(assert (= (and d!150535 (not c!129697)) b!1392741))

(assert (= (and b!1392741 res!932250) b!1392745))

(assert (= (and b!1392745 (not res!932251)) b!1392740))

(assert (= (and b!1392740 (not res!932252)) b!1392738))

(assert (=> b!1392742 m!1278377))

(declare-fun m!1278493 () Bool)

(assert (=> b!1392742 m!1278493))

(assert (=> b!1392742 m!1278493))

(assert (=> b!1392742 m!1278375))

(declare-fun m!1278495 () Bool)

(assert (=> b!1392742 m!1278495))

(assert (=> d!150535 m!1278377))

(declare-fun m!1278497 () Bool)

(assert (=> d!150535 m!1278497))

(assert (=> d!150535 m!1278381))

(declare-fun m!1278499 () Bool)

(assert (=> b!1392745 m!1278499))

(assert (=> b!1392738 m!1278499))

(assert (=> b!1392740 m!1278499))

(assert (=> b!1392595 d!150535))

(declare-fun d!150537 () Bool)

(declare-fun lt!611724 () (_ BitVec 32))

(declare-fun lt!611723 () (_ BitVec 32))

(assert (=> d!150537 (= lt!611724 (bvmul (bvxor lt!611723 (bvlshr lt!611723 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150537 (= lt!611723 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150537 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!932244 (let ((h!33735 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125275 (bvmul (bvxor h!33735 (bvlshr h!33735 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125275 (bvlshr x!125275 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!932244 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!932244 #b00000000000000000000000000000000))))))

(assert (=> d!150537 (= (toIndex!0 (select (store (arr!45987 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!611724 (bvlshr lt!611724 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1392595 d!150537))

(declare-fun bm!66796 () Bool)

(declare-fun call!66799 () Bool)

(declare-fun c!129705 () Bool)

(assert (=> bm!66796 (= call!66799 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129705 (Cons!32502 (select (arr!45987 a!2901) #b00000000000000000000000000000000) Nil!32503) Nil!32503)))))

(declare-fun b!1392775 () Bool)

(declare-fun e!788678 () Bool)

(declare-fun e!788679 () Bool)

(assert (=> b!1392775 (= e!788678 e!788679)))

(assert (=> b!1392775 (= c!129705 (validKeyInArray!0 (select (arr!45987 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1392777 () Bool)

(declare-fun e!788680 () Bool)

(declare-fun contains!9772 (List!32506 (_ BitVec 64)) Bool)

(assert (=> b!1392777 (= e!788680 (contains!9772 Nil!32503 (select (arr!45987 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1392778 () Bool)

(assert (=> b!1392778 (= e!788679 call!66799)))

(declare-fun b!1392779 () Bool)

(assert (=> b!1392779 (= e!788679 call!66799)))

(declare-fun d!150539 () Bool)

(declare-fun res!932270 () Bool)

(declare-fun e!788681 () Bool)

(assert (=> d!150539 (=> res!932270 e!788681)))

(assert (=> d!150539 (= res!932270 (bvsge #b00000000000000000000000000000000 (size!46537 a!2901)))))

(assert (=> d!150539 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32503) e!788681)))

(declare-fun b!1392776 () Bool)

(assert (=> b!1392776 (= e!788681 e!788678)))

(declare-fun res!932268 () Bool)

(assert (=> b!1392776 (=> (not res!932268) (not e!788678))))

(assert (=> b!1392776 (= res!932268 (not e!788680))))

(declare-fun res!932269 () Bool)

(assert (=> b!1392776 (=> (not res!932269) (not e!788680))))

(assert (=> b!1392776 (= res!932269 (validKeyInArray!0 (select (arr!45987 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!150539 (not res!932270)) b!1392776))

(assert (= (and b!1392776 res!932269) b!1392777))

(assert (= (and b!1392776 res!932268) b!1392775))

(assert (= (and b!1392775 c!129705) b!1392779))

(assert (= (and b!1392775 (not c!129705)) b!1392778))

(assert (= (or b!1392779 b!1392778) bm!66796))

(declare-fun m!1278511 () Bool)

(assert (=> bm!66796 m!1278511))

(declare-fun m!1278513 () Bool)

(assert (=> bm!66796 m!1278513))

(assert (=> b!1392775 m!1278511))

(assert (=> b!1392775 m!1278511))

(declare-fun m!1278515 () Bool)

(assert (=> b!1392775 m!1278515))

(assert (=> b!1392777 m!1278511))

(assert (=> b!1392777 m!1278511))

(declare-fun m!1278517 () Bool)

(assert (=> b!1392777 m!1278517))

(assert (=> b!1392776 m!1278511))

(assert (=> b!1392776 m!1278511))

(assert (=> b!1392776 m!1278515))

(assert (=> b!1392596 d!150539))

(declare-fun d!150547 () Bool)

(declare-fun res!932271 () Bool)

(declare-fun e!788682 () Bool)

(assert (=> d!150547 (=> res!932271 e!788682)))

(assert (=> d!150547 (= res!932271 (bvsge #b00000000000000000000000000000000 (size!46537 a!2901)))))

(assert (=> d!150547 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!788682)))

(declare-fun bm!66797 () Bool)

(declare-fun call!66800 () Bool)

(assert (=> bm!66797 (= call!66800 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1392780 () Bool)

(declare-fun e!788683 () Bool)

(assert (=> b!1392780 (= e!788682 e!788683)))

(declare-fun c!129706 () Bool)

(assert (=> b!1392780 (= c!129706 (validKeyInArray!0 (select (arr!45987 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1392781 () Bool)

(declare-fun e!788684 () Bool)

(assert (=> b!1392781 (= e!788683 e!788684)))

(declare-fun lt!611732 () (_ BitVec 64))

(assert (=> b!1392781 (= lt!611732 (select (arr!45987 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!611731 () Unit!46612)

(assert (=> b!1392781 (= lt!611731 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611732 #b00000000000000000000000000000000))))

(assert (=> b!1392781 (arrayContainsKey!0 a!2901 lt!611732 #b00000000000000000000000000000000)))

(declare-fun lt!611730 () Unit!46612)

(assert (=> b!1392781 (= lt!611730 lt!611731)))

(declare-fun res!932272 () Bool)

(assert (=> b!1392781 (= res!932272 (= (seekEntryOrOpen!0 (select (arr!45987 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10304 #b00000000000000000000000000000000)))))

(assert (=> b!1392781 (=> (not res!932272) (not e!788684))))

(declare-fun b!1392782 () Bool)

(assert (=> b!1392782 (= e!788683 call!66800)))

(declare-fun b!1392783 () Bool)

(assert (=> b!1392783 (= e!788684 call!66800)))

(assert (= (and d!150547 (not res!932271)) b!1392780))

(assert (= (and b!1392780 c!129706) b!1392781))

(assert (= (and b!1392780 (not c!129706)) b!1392782))

(assert (= (and b!1392781 res!932272) b!1392783))

(assert (= (or b!1392783 b!1392782) bm!66797))

(declare-fun m!1278519 () Bool)

(assert (=> bm!66797 m!1278519))

(assert (=> b!1392780 m!1278511))

(assert (=> b!1392780 m!1278511))

(assert (=> b!1392780 m!1278515))

(assert (=> b!1392781 m!1278511))

(declare-fun m!1278521 () Bool)

(assert (=> b!1392781 m!1278521))

(declare-fun m!1278523 () Bool)

(assert (=> b!1392781 m!1278523))

(assert (=> b!1392781 m!1278511))

(declare-fun m!1278525 () Bool)

(assert (=> b!1392781 m!1278525))

(assert (=> b!1392597 d!150547))

(declare-fun d!150549 () Bool)

(assert (=> d!150549 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119522 d!150549))

(declare-fun d!150555 () Bool)

(assert (=> d!150555 (= (array_inv!35015 a!2901) (bvsge (size!46537 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119522 d!150555))

(declare-fun d!150559 () Bool)

(assert (=> d!150559 (= (validKeyInArray!0 (select (arr!45987 a!2901) j!112)) (and (not (= (select (arr!45987 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45987 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1392592 d!150559))

(declare-fun d!150565 () Bool)

(assert (=> d!150565 (= (validKeyInArray!0 (select (arr!45987 a!2901) i!1037)) (and (not (= (select (arr!45987 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45987 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1392598 d!150565))

(declare-fun b!1392864 () Bool)

(declare-fun e!788730 () SeekEntryResult!10304)

(declare-fun lt!611764 () SeekEntryResult!10304)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95255 (_ BitVec 32)) SeekEntryResult!10304)

(assert (=> b!1392864 (= e!788730 (seekKeyOrZeroReturnVacant!0 (x!125270 lt!611764) (index!43589 lt!611764) (index!43589 lt!611764) (select (arr!45987 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392865 () Bool)

(declare-fun c!129743 () Bool)

(declare-fun lt!611765 () (_ BitVec 64))

(assert (=> b!1392865 (= c!129743 (= lt!611765 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!788729 () SeekEntryResult!10304)

(assert (=> b!1392865 (= e!788729 e!788730)))

(declare-fun b!1392866 () Bool)

(assert (=> b!1392866 (= e!788729 (Found!10304 (index!43589 lt!611764)))))

(declare-fun b!1392867 () Bool)

(declare-fun e!788728 () SeekEntryResult!10304)

(assert (=> b!1392867 (= e!788728 Undefined!10304)))

(declare-fun b!1392868 () Bool)

(assert (=> b!1392868 (= e!788730 (MissingZero!10304 (index!43589 lt!611764)))))

(declare-fun d!150567 () Bool)

(declare-fun lt!611763 () SeekEntryResult!10304)

(assert (=> d!150567 (and (or ((_ is Undefined!10304) lt!611763) (not ((_ is Found!10304) lt!611763)) (and (bvsge (index!43588 lt!611763) #b00000000000000000000000000000000) (bvslt (index!43588 lt!611763) (size!46537 a!2901)))) (or ((_ is Undefined!10304) lt!611763) ((_ is Found!10304) lt!611763) (not ((_ is MissingZero!10304) lt!611763)) (and (bvsge (index!43587 lt!611763) #b00000000000000000000000000000000) (bvslt (index!43587 lt!611763) (size!46537 a!2901)))) (or ((_ is Undefined!10304) lt!611763) ((_ is Found!10304) lt!611763) ((_ is MissingZero!10304) lt!611763) (not ((_ is MissingVacant!10304) lt!611763)) (and (bvsge (index!43590 lt!611763) #b00000000000000000000000000000000) (bvslt (index!43590 lt!611763) (size!46537 a!2901)))) (or ((_ is Undefined!10304) lt!611763) (ite ((_ is Found!10304) lt!611763) (= (select (arr!45987 a!2901) (index!43588 lt!611763)) (select (arr!45987 a!2901) j!112)) (ite ((_ is MissingZero!10304) lt!611763) (= (select (arr!45987 a!2901) (index!43587 lt!611763)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10304) lt!611763) (= (select (arr!45987 a!2901) (index!43590 lt!611763)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150567 (= lt!611763 e!788728)))

(declare-fun c!129742 () Bool)

(assert (=> d!150567 (= c!129742 (and ((_ is Intermediate!10304) lt!611764) (undefined!11116 lt!611764)))))

(assert (=> d!150567 (= lt!611764 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45987 a!2901) j!112) mask!2840) (select (arr!45987 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150567 (validMask!0 mask!2840)))

(assert (=> d!150567 (= (seekEntryOrOpen!0 (select (arr!45987 a!2901) j!112) a!2901 mask!2840) lt!611763)))

(declare-fun b!1392869 () Bool)

(assert (=> b!1392869 (= e!788728 e!788729)))

(assert (=> b!1392869 (= lt!611765 (select (arr!45987 a!2901) (index!43589 lt!611764)))))

(declare-fun c!129741 () Bool)

(assert (=> b!1392869 (= c!129741 (= lt!611765 (select (arr!45987 a!2901) j!112)))))

(assert (= (and d!150567 c!129742) b!1392867))

(assert (= (and d!150567 (not c!129742)) b!1392869))

(assert (= (and b!1392869 c!129741) b!1392866))

(assert (= (and b!1392869 (not c!129741)) b!1392865))

(assert (= (and b!1392865 c!129743) b!1392868))

(assert (= (and b!1392865 (not c!129743)) b!1392864))

(assert (=> b!1392864 m!1278367))

(declare-fun m!1278559 () Bool)

(assert (=> b!1392864 m!1278559))

(declare-fun m!1278561 () Bool)

(assert (=> d!150567 m!1278561))

(assert (=> d!150567 m!1278391))

(assert (=> d!150567 m!1278367))

(assert (=> d!150567 m!1278395))

(assert (=> d!150567 m!1278381))

(assert (=> d!150567 m!1278367))

(assert (=> d!150567 m!1278391))

(declare-fun m!1278563 () Bool)

(assert (=> d!150567 m!1278563))

(declare-fun m!1278565 () Bool)

(assert (=> d!150567 m!1278565))

(declare-fun m!1278567 () Bool)

(assert (=> b!1392869 m!1278567))

(assert (=> b!1392593 d!150567))

(check-sat (not b!1392742) (not b!1392776) (not d!150567) (not b!1392645) (not b!1392644) (not bm!66783) (not d!150535) (not d!150505) (not b!1392777) (not b!1392775) (not d!150511) (not b!1392864) (not bm!66797) (not b!1392716) (not bm!66796) (not b!1392781) (not b!1392780))
