; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120690 () Bool)

(assert start!120690)

(declare-fun b!1404741 () Bool)

(declare-fun res!943109 () Bool)

(declare-fun e!795212 () Bool)

(assert (=> b!1404741 (=> (not res!943109) (not e!795212))))

(declare-datatypes ((array!96048 0))(
  ( (array!96049 (arr!46373 (Array (_ BitVec 32) (_ BitVec 64))) (size!46923 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96048)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404741 (= res!943109 (validKeyInArray!0 (select (arr!46373 a!2901) i!1037)))))

(declare-fun b!1404742 () Bool)

(declare-fun res!943107 () Bool)

(assert (=> b!1404742 (=> (not res!943107) (not e!795212))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96048 (_ BitVec 32)) Bool)

(assert (=> b!1404742 (= res!943107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!943105 () Bool)

(assert (=> start!120690 (=> (not res!943105) (not e!795212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120690 (= res!943105 (validMask!0 mask!2840))))

(assert (=> start!120690 e!795212))

(assert (=> start!120690 true))

(declare-fun array_inv!35401 (array!96048) Bool)

(assert (=> start!120690 (array_inv!35401 a!2901)))

(declare-fun b!1404743 () Bool)

(declare-datatypes ((SeekEntryResult!10684 0))(
  ( (MissingZero!10684 (index!45113 (_ BitVec 32))) (Found!10684 (index!45114 (_ BitVec 32))) (Intermediate!10684 (undefined!11496 Bool) (index!45115 (_ BitVec 32)) (x!126733 (_ BitVec 32))) (Undefined!10684) (MissingVacant!10684 (index!45116 (_ BitVec 32))) )
))
(declare-fun lt!618786 () SeekEntryResult!10684)

(assert (=> b!1404743 (= e!795212 (not (or (not (is-Intermediate!10684 lt!618786)) (not (undefined!11496 lt!618786)))))))

(declare-fun e!795210 () Bool)

(assert (=> b!1404743 e!795210))

(declare-fun res!943108 () Bool)

(assert (=> b!1404743 (=> (not res!943108) (not e!795210))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1404743 (= res!943108 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47342 0))(
  ( (Unit!47343) )
))
(declare-fun lt!618785 () Unit!47342)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96048 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47342)

(assert (=> b!1404743 (= lt!618785 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96048 (_ BitVec 32)) SeekEntryResult!10684)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404743 (= lt!618786 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46373 a!2901) j!112) mask!2840) (select (arr!46373 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404744 () Bool)

(declare-fun res!943111 () Bool)

(assert (=> b!1404744 (=> (not res!943111) (not e!795212))))

(assert (=> b!1404744 (= res!943111 (and (= (size!46923 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46923 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46923 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404745 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96048 (_ BitVec 32)) SeekEntryResult!10684)

(assert (=> b!1404745 (= e!795210 (= (seekEntryOrOpen!0 (select (arr!46373 a!2901) j!112) a!2901 mask!2840) (Found!10684 j!112)))))

(declare-fun b!1404746 () Bool)

(declare-fun res!943106 () Bool)

(assert (=> b!1404746 (=> (not res!943106) (not e!795212))))

(declare-datatypes ((List!32892 0))(
  ( (Nil!32889) (Cons!32888 (h!34139 (_ BitVec 64)) (t!47586 List!32892)) )
))
(declare-fun arrayNoDuplicates!0 (array!96048 (_ BitVec 32) List!32892) Bool)

(assert (=> b!1404746 (= res!943106 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32889))))

(declare-fun b!1404747 () Bool)

(declare-fun res!943110 () Bool)

(assert (=> b!1404747 (=> (not res!943110) (not e!795212))))

(assert (=> b!1404747 (= res!943110 (validKeyInArray!0 (select (arr!46373 a!2901) j!112)))))

(assert (= (and start!120690 res!943105) b!1404744))

(assert (= (and b!1404744 res!943111) b!1404741))

(assert (= (and b!1404741 res!943109) b!1404747))

(assert (= (and b!1404747 res!943110) b!1404742))

(assert (= (and b!1404742 res!943107) b!1404746))

(assert (= (and b!1404746 res!943106) b!1404743))

(assert (= (and b!1404743 res!943108) b!1404745))

(declare-fun m!1293513 () Bool)

(assert (=> b!1404743 m!1293513))

(declare-fun m!1293515 () Bool)

(assert (=> b!1404743 m!1293515))

(assert (=> b!1404743 m!1293513))

(declare-fun m!1293517 () Bool)

(assert (=> b!1404743 m!1293517))

(assert (=> b!1404743 m!1293515))

(assert (=> b!1404743 m!1293513))

(declare-fun m!1293519 () Bool)

(assert (=> b!1404743 m!1293519))

(declare-fun m!1293521 () Bool)

(assert (=> b!1404743 m!1293521))

(assert (=> b!1404745 m!1293513))

(assert (=> b!1404745 m!1293513))

(declare-fun m!1293523 () Bool)

(assert (=> b!1404745 m!1293523))

(declare-fun m!1293525 () Bool)

(assert (=> start!120690 m!1293525))

(declare-fun m!1293527 () Bool)

(assert (=> start!120690 m!1293527))

(assert (=> b!1404747 m!1293513))

(assert (=> b!1404747 m!1293513))

(declare-fun m!1293529 () Bool)

(assert (=> b!1404747 m!1293529))

(declare-fun m!1293531 () Bool)

(assert (=> b!1404742 m!1293531))

(declare-fun m!1293533 () Bool)

(assert (=> b!1404746 m!1293533))

(declare-fun m!1293535 () Bool)

(assert (=> b!1404741 m!1293535))

(assert (=> b!1404741 m!1293535))

(declare-fun m!1293537 () Bool)

(assert (=> b!1404741 m!1293537))

(push 1)

(assert (not start!120690))

(assert (not b!1404743))

(assert (not b!1404747))

(assert (not b!1404741))

(assert (not b!1404746))

(assert (not b!1404742))

(assert (not b!1404745))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1404813 () Bool)

(declare-fun e!795250 () Bool)

(declare-fun call!66934 () Bool)

(assert (=> b!1404813 (= e!795250 call!66934)))

(declare-fun b!1404814 () Bool)

(declare-fun e!795249 () Bool)

(assert (=> b!1404814 (= e!795249 call!66934)))

(declare-fun bm!66931 () Bool)

(assert (=> bm!66931 (= call!66934 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!151321 () Bool)

(declare-fun res!943168 () Bool)

(declare-fun e!795251 () Bool)

(assert (=> d!151321 (=> res!943168 e!795251)))

(assert (=> d!151321 (= res!943168 (bvsge j!112 (size!46923 a!2901)))))

(assert (=> d!151321 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!795251)))

(declare-fun b!1404815 () Bool)

(assert (=> b!1404815 (= e!795251 e!795250)))

(declare-fun c!130284 () Bool)

(assert (=> b!1404815 (= c!130284 (validKeyInArray!0 (select (arr!46373 a!2901) j!112)))))

(declare-fun b!1404816 () Bool)

(assert (=> b!1404816 (= e!795250 e!795249)))

(declare-fun lt!618807 () (_ BitVec 64))

(assert (=> b!1404816 (= lt!618807 (select (arr!46373 a!2901) j!112))))

(declare-fun lt!618805 () Unit!47342)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96048 (_ BitVec 64) (_ BitVec 32)) Unit!47342)

(assert (=> b!1404816 (= lt!618805 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!618807 j!112))))

(declare-fun arrayContainsKey!0 (array!96048 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1404816 (arrayContainsKey!0 a!2901 lt!618807 #b00000000000000000000000000000000)))

(declare-fun lt!618806 () Unit!47342)

(assert (=> b!1404816 (= lt!618806 lt!618805)))

(declare-fun res!943167 () Bool)

(assert (=> b!1404816 (= res!943167 (= (seekEntryOrOpen!0 (select (arr!46373 a!2901) j!112) a!2901 mask!2840) (Found!10684 j!112)))))

(assert (=> b!1404816 (=> (not res!943167) (not e!795249))))

(assert (= (and d!151321 (not res!943168)) b!1404815))

(assert (= (and b!1404815 c!130284) b!1404816))

(assert (= (and b!1404815 (not c!130284)) b!1404813))

(assert (= (and b!1404816 res!943167) b!1404814))

(assert (= (or b!1404814 b!1404813) bm!66931))

(declare-fun m!1293599 () Bool)

(assert (=> bm!66931 m!1293599))

(assert (=> b!1404815 m!1293513))

(assert (=> b!1404815 m!1293513))

(assert (=> b!1404815 m!1293529))

(assert (=> b!1404816 m!1293513))

(declare-fun m!1293601 () Bool)

(assert (=> b!1404816 m!1293601))

(declare-fun m!1293603 () Bool)

(assert (=> b!1404816 m!1293603))

(assert (=> b!1404816 m!1293513))

(assert (=> b!1404816 m!1293523))

(assert (=> b!1404743 d!151321))

(declare-fun d!151329 () Bool)

(assert (=> d!151329 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!618816 () Unit!47342)

(declare-fun choose!38 (array!96048 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47342)

(assert (=> d!151329 (= lt!618816 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151329 (validMask!0 mask!2840)))

(assert (=> d!151329 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!618816)))

(declare-fun bs!40928 () Bool)

(assert (= bs!40928 d!151329))

(assert (=> bs!40928 m!1293521))

(declare-fun m!1293605 () Bool)

(assert (=> bs!40928 m!1293605))

(assert (=> bs!40928 m!1293525))

(assert (=> b!1404743 d!151329))

(declare-fun b!1404878 () Bool)

(declare-fun e!795295 () Bool)

(declare-fun e!795297 () Bool)

(assert (=> b!1404878 (= e!795295 e!795297)))

(declare-fun res!943198 () Bool)

(declare-fun lt!618839 () SeekEntryResult!10684)

(assert (=> b!1404878 (= res!943198 (and (is-Intermediate!10684 lt!618839) (not (undefined!11496 lt!618839)) (bvslt (x!126733 lt!618839) #b01111111111111111111111111111110) (bvsge (x!126733 lt!618839) #b00000000000000000000000000000000) (bvsge (x!126733 lt!618839) #b00000000000000000000000000000000)))))

(assert (=> b!1404878 (=> (not res!943198) (not e!795297))))

(declare-fun b!1404879 () Bool)

(declare-fun e!795296 () SeekEntryResult!10684)

(assert (=> b!1404879 (= e!795296 (Intermediate!10684 false (toIndex!0 (select (arr!46373 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!151331 () Bool)

(assert (=> d!151331 e!795295))

(declare-fun c!130303 () Bool)

(assert (=> d!151331 (= c!130303 (and (is-Intermediate!10684 lt!618839) (undefined!11496 lt!618839)))))

(declare-fun e!795298 () SeekEntryResult!10684)

(assert (=> d!151331 (= lt!618839 e!795298)))

(declare-fun c!130302 () Bool)

(assert (=> d!151331 (= c!130302 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!618840 () (_ BitVec 64))

(assert (=> d!151331 (= lt!618840 (select (arr!46373 a!2901) (toIndex!0 (select (arr!46373 a!2901) j!112) mask!2840)))))

(assert (=> d!151331 (validMask!0 mask!2840)))

(assert (=> d!151331 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46373 a!2901) j!112) mask!2840) (select (arr!46373 a!2901) j!112) a!2901 mask!2840) lt!618839)))

(declare-fun b!1404880 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404880 (= e!795296 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46373 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46373 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404881 () Bool)

(assert (=> b!1404881 (and (bvsge (index!45115 lt!618839) #b00000000000000000000000000000000) (bvslt (index!45115 lt!618839) (size!46923 a!2901)))))

(declare-fun e!795299 () Bool)

(assert (=> b!1404881 (= e!795299 (= (select (arr!46373 a!2901) (index!45115 lt!618839)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1404882 () Bool)

(assert (=> b!1404882 (= e!795298 (Intermediate!10684 true (toIndex!0 (select (arr!46373 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1404883 () Bool)

(assert (=> b!1404883 (and (bvsge (index!45115 lt!618839) #b00000000000000000000000000000000) (bvslt (index!45115 lt!618839) (size!46923 a!2901)))))

(declare-fun res!943200 () Bool)

(assert (=> b!1404883 (= res!943200 (= (select (arr!46373 a!2901) (index!45115 lt!618839)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1404883 (=> res!943200 e!795299)))

(declare-fun b!1404884 () Bool)

(assert (=> b!1404884 (= e!795295 (bvsge (x!126733 lt!618839) #b01111111111111111111111111111110))))

(declare-fun b!1404885 () Bool)

(assert (=> b!1404885 (= e!795298 e!795296)))

(declare-fun c!130301 () Bool)

(assert (=> b!1404885 (= c!130301 (or (= lt!618840 (select (arr!46373 a!2901) j!112)) (= (bvadd lt!618840 lt!618840) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1404886 () Bool)

(assert (=> b!1404886 (and (bvsge (index!45115 lt!618839) #b00000000000000000000000000000000) (bvslt (index!45115 lt!618839) (size!46923 a!2901)))))

(declare-fun res!943199 () Bool)

(assert (=> b!1404886 (= res!943199 (= (select (arr!46373 a!2901) (index!45115 lt!618839)) (select (arr!46373 a!2901) j!112)))))

(assert (=> b!1404886 (=> res!943199 e!795299)))

(assert (=> b!1404886 (= e!795297 e!795299)))

(assert (= (and d!151331 c!130302) b!1404882))

(assert (= (and d!151331 (not c!130302)) b!1404885))

(assert (= (and b!1404885 c!130301) b!1404879))

(assert (= (and b!1404885 (not c!130301)) b!1404880))

(assert (= (and d!151331 c!130303) b!1404884))

(assert (= (and d!151331 (not c!130303)) b!1404878))

(assert (= (and b!1404878 res!943198) b!1404886))

(assert (= (and b!1404886 (not res!943199)) b!1404883))

(assert (= (and b!1404883 (not res!943200)) b!1404881))

(assert (=> d!151331 m!1293515))

(declare-fun m!1293637 () Bool)

(assert (=> d!151331 m!1293637))

(assert (=> d!151331 m!1293525))

(declare-fun m!1293639 () Bool)

(assert (=> b!1404881 m!1293639))

(assert (=> b!1404883 m!1293639))

(assert (=> b!1404886 m!1293639))

(assert (=> b!1404880 m!1293515))

(declare-fun m!1293641 () Bool)

(assert (=> b!1404880 m!1293641))

(assert (=> b!1404880 m!1293641))

(assert (=> b!1404880 m!1293513))

(declare-fun m!1293643 () Bool)

(assert (=> b!1404880 m!1293643))

(assert (=> b!1404743 d!151331))

(declare-fun d!151351 () Bool)

(declare-fun lt!618853 () (_ BitVec 32))

(declare-fun lt!618852 () (_ BitVec 32))

(assert (=> d!151351 (= lt!618853 (bvmul (bvxor lt!618852 (bvlshr lt!618852 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151351 (= lt!618852 ((_ extract 31 0) (bvand (bvxor (select (arr!46373 a!2901) j!112) (bvlshr (select (arr!46373 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151351 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!943201 (let ((h!34142 ((_ extract 31 0) (bvand (bvxor (select (arr!46373 a!2901) j!112) (bvlshr (select (arr!46373 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!126737 (bvmul (bvxor h!34142 (bvlshr h!34142 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!126737 (bvlshr x!126737 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!943201 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!943201 #b00000000000000000000000000000000))))))

(assert (=> d!151351 (= (toIndex!0 (select (arr!46373 a!2901) j!112) mask!2840) (bvand (bvxor lt!618853 (bvlshr lt!618853 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1404743 d!151351))

(declare-fun b!1404905 () Bool)

(declare-fun e!795311 () Bool)

(declare-fun call!66945 () Bool)

(assert (=> b!1404905 (= e!795311 call!66945)))

(declare-fun b!1404906 () Bool)

(declare-fun e!795310 () Bool)

(assert (=> b!1404906 (= e!795310 call!66945)))

(declare-fun bm!66942 () Bool)

(assert (=> bm!66942 (= call!66945 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun d!151355 () Bool)

(declare-fun res!943209 () Bool)

(declare-fun e!795312 () Bool)

(assert (=> d!151355 (=> res!943209 e!795312)))

(assert (=> d!151355 (= res!943209 (bvsge #b00000000000000000000000000000000 (size!46923 a!2901)))))

(assert (=> d!151355 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!795312)))

(declare-fun b!1404907 () Bool)

(assert (=> b!1404907 (= e!795312 e!795311)))

(declare-fun c!130310 () Bool)

(assert (=> b!1404907 (= c!130310 (validKeyInArray!0 (select (arr!46373 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1404908 () Bool)

(assert (=> b!1404908 (= e!795311 e!795310)))

(declare-fun lt!618856 () (_ BitVec 64))

(assert (=> b!1404908 (= lt!618856 (select (arr!46373 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!618854 () Unit!47342)

(assert (=> b!1404908 (= lt!618854 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!618856 #b00000000000000000000000000000000))))

(assert (=> b!1404908 (arrayContainsKey!0 a!2901 lt!618856 #b00000000000000000000000000000000)))

(declare-fun lt!618855 () Unit!47342)

(assert (=> b!1404908 (= lt!618855 lt!618854)))

(declare-fun res!943208 () Bool)

(assert (=> b!1404908 (= res!943208 (= (seekEntryOrOpen!0 (select (arr!46373 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10684 #b00000000000000000000000000000000)))))

(assert (=> b!1404908 (=> (not res!943208) (not e!795310))))

(assert (= (and d!151355 (not res!943209)) b!1404907))

(assert (= (and b!1404907 c!130310) b!1404908))

(assert (= (and b!1404907 (not c!130310)) b!1404905))

(assert (= (and b!1404908 res!943208) b!1404906))

(assert (= (or b!1404906 b!1404905) bm!66942))

(declare-fun m!1293647 () Bool)

(assert (=> bm!66942 m!1293647))

(declare-fun m!1293649 () Bool)

(assert (=> b!1404907 m!1293649))

(assert (=> b!1404907 m!1293649))

(declare-fun m!1293651 () Bool)

(assert (=> b!1404907 m!1293651))

(assert (=> b!1404908 m!1293649))

(declare-fun m!1293653 () Bool)

(assert (=> b!1404908 m!1293653))

(declare-fun m!1293655 () Bool)

(assert (=> b!1404908 m!1293655))

(assert (=> b!1404908 m!1293649))

(declare-fun m!1293657 () Bool)

(assert (=> b!1404908 m!1293657))

(assert (=> b!1404742 d!151355))

(declare-fun d!151357 () Bool)

(assert (=> d!151357 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120690 d!151357))

(declare-fun d!151363 () Bool)

(assert (=> d!151363 (= (array_inv!35401 a!2901) (bvsge (size!46923 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120690 d!151363))

(declare-fun b!1404975 () Bool)

(declare-fun lt!618892 () SeekEntryResult!10684)

(declare-fun e!795349 () SeekEntryResult!10684)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96048 (_ BitVec 32)) SeekEntryResult!10684)

(assert (=> b!1404975 (= e!795349 (seekKeyOrZeroReturnVacant!0 (x!126733 lt!618892) (index!45115 lt!618892) (index!45115 lt!618892) (select (arr!46373 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404976 () Bool)

(assert (=> b!1404976 (= e!795349 (MissingZero!10684 (index!45115 lt!618892)))))

(declare-fun b!1404977 () Bool)

(declare-fun e!795348 () SeekEntryResult!10684)

(declare-fun e!795350 () SeekEntryResult!10684)

(assert (=> b!1404977 (= e!795348 e!795350)))

(declare-fun lt!618893 () (_ BitVec 64))

(assert (=> b!1404977 (= lt!618893 (select (arr!46373 a!2901) (index!45115 lt!618892)))))

(declare-fun c!130340 () Bool)

(assert (=> b!1404977 (= c!130340 (= lt!618893 (select (arr!46373 a!2901) j!112)))))

(declare-fun b!1404978 () Bool)

(declare-fun c!130338 () Bool)

(assert (=> b!1404978 (= c!130338 (= lt!618893 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1404978 (= e!795350 e!795349)))

(declare-fun b!1404979 () Bool)

(assert (=> b!1404979 (= e!795350 (Found!10684 (index!45115 lt!618892)))))

(declare-fun d!151365 () Bool)

(declare-fun lt!618894 () SeekEntryResult!10684)

(assert (=> d!151365 (and (or (is-Undefined!10684 lt!618894) (not (is-Found!10684 lt!618894)) (and (bvsge (index!45114 lt!618894) #b00000000000000000000000000000000) (bvslt (index!45114 lt!618894) (size!46923 a!2901)))) (or (is-Undefined!10684 lt!618894) (is-Found!10684 lt!618894) (not (is-MissingZero!10684 lt!618894)) (and (bvsge (index!45113 lt!618894) #b00000000000000000000000000000000) (bvslt (index!45113 lt!618894) (size!46923 a!2901)))) (or (is-Undefined!10684 lt!618894) (is-Found!10684 lt!618894) (is-MissingZero!10684 lt!618894) (not (is-MissingVacant!10684 lt!618894)) (and (bvsge (index!45116 lt!618894) #b00000000000000000000000000000000) (bvslt (index!45116 lt!618894) (size!46923 a!2901)))) (or (is-Undefined!10684 lt!618894) (ite (is-Found!10684 lt!618894) (= (select (arr!46373 a!2901) (index!45114 lt!618894)) (select (arr!46373 a!2901) j!112)) (ite (is-MissingZero!10684 lt!618894) (= (select (arr!46373 a!2901) (index!45113 lt!618894)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10684 lt!618894) (= (select (arr!46373 a!2901) (index!45116 lt!618894)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151365 (= lt!618894 e!795348)))

(declare-fun c!130339 () Bool)

(assert (=> d!151365 (= c!130339 (and (is-Intermediate!10684 lt!618892) (undefined!11496 lt!618892)))))

(assert (=> d!151365 (= lt!618892 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46373 a!2901) j!112) mask!2840) (select (arr!46373 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151365 (validMask!0 mask!2840)))

(assert (=> d!151365 (= (seekEntryOrOpen!0 (select (arr!46373 a!2901) j!112) a!2901 mask!2840) lt!618894)))

(declare-fun b!1404980 () Bool)

(assert (=> b!1404980 (= e!795348 Undefined!10684)))

(assert (= (and d!151365 c!130339) b!1404980))

(assert (= (and d!151365 (not c!130339)) b!1404977))

(assert (= (and b!1404977 c!130340) b!1404979))

(assert (= (and b!1404977 (not c!130340)) b!1404978))

(assert (= (and b!1404978 c!130338) b!1404976))

(assert (= (and b!1404978 (not c!130338)) b!1404975))

(assert (=> b!1404975 m!1293513))

(declare-fun m!1293685 () Bool)

(assert (=> b!1404975 m!1293685))

(declare-fun m!1293687 () Bool)

(assert (=> b!1404977 m!1293687))

(declare-fun m!1293689 () Bool)

(assert (=> d!151365 m!1293689))

(assert (=> d!151365 m!1293513))

(assert (=> d!151365 m!1293515))

(assert (=> d!151365 m!1293525))

(declare-fun m!1293691 () Bool)

(assert (=> d!151365 m!1293691))

(declare-fun m!1293693 () Bool)

(assert (=> d!151365 m!1293693))

(assert (=> d!151365 m!1293515))

(assert (=> d!151365 m!1293513))

(assert (=> d!151365 m!1293519))

(assert (=> b!1404745 d!151365))

(declare-fun d!151373 () Bool)

(assert (=> d!151373 (= (validKeyInArray!0 (select (arr!46373 a!2901) j!112)) (and (not (= (select (arr!46373 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46373 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1404747 d!151373))

(declare-fun b!1404995 () Bool)

(declare-fun e!795364 () Bool)

(declare-fun contains!9793 (List!32892 (_ BitVec 64)) Bool)

(assert (=> b!1404995 (= e!795364 (contains!9793 Nil!32889 (select (arr!46373 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!151375 () Bool)

(declare-fun res!943234 () Bool)

(declare-fun e!795362 () Bool)

(assert (=> d!151375 (=> res!943234 e!795362)))

(assert (=> d!151375 (= res!943234 (bvsge #b00000000000000000000000000000000 (size!46923 a!2901)))))

(assert (=> d!151375 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32889) e!795362)))

(declare-fun b!1404996 () Bool)

(declare-fun e!795363 () Bool)

(declare-fun call!66949 () Bool)

(assert (=> b!1404996 (= e!795363 call!66949)))

(declare-fun bm!66946 () Bool)

(declare-fun c!130344 () Bool)

(assert (=> bm!66946 (= call!66949 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130344 (Cons!32888 (select (arr!46373 a!2901) #b00000000000000000000000000000000) Nil!32889) Nil!32889)))))

(declare-fun b!1404997 () Bool)

(assert (=> b!1404997 (= e!795363 call!66949)))

(declare-fun b!1404998 () Bool)

(declare-fun e!795365 () Bool)

(assert (=> b!1404998 (= e!795362 e!795365)))

(declare-fun res!943232 () Bool)

(assert (=> b!1404998 (=> (not res!943232) (not e!795365))))

(assert (=> b!1404998 (= res!943232 (not e!795364))))

(declare-fun res!943233 () Bool)

(assert (=> b!1404998 (=> (not res!943233) (not e!795364))))

(assert (=> b!1404998 (= res!943233 (validKeyInArray!0 (select (arr!46373 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1404999 () Bool)

(assert (=> b!1404999 (= e!795365 e!795363)))

(assert (=> b!1404999 (= c!130344 (validKeyInArray!0 (select (arr!46373 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!151375 (not res!943234)) b!1404998))

(assert (= (and b!1404998 res!943233) b!1404995))

(assert (= (and b!1404998 res!943232) b!1404999))

(assert (= (and b!1404999 c!130344) b!1404997))

(assert (= (and b!1404999 (not c!130344)) b!1404996))

(assert (= (or b!1404997 b!1404996) bm!66946))

(assert (=> b!1404995 m!1293649))

(assert (=> b!1404995 m!1293649))

(declare-fun m!1293703 () Bool)

(assert (=> b!1404995 m!1293703))

(assert (=> bm!66946 m!1293649))

(declare-fun m!1293705 () Bool)

(assert (=> bm!66946 m!1293705))

(assert (=> b!1404998 m!1293649))

(assert (=> b!1404998 m!1293649))

(assert (=> b!1404998 m!1293651))

(assert (=> b!1404999 m!1293649))

(assert (=> b!1404999 m!1293649))

(assert (=> b!1404999 m!1293651))

(assert (=> b!1404746 d!151375))

(declare-fun d!151381 () Bool)

(assert (=> d!151381 (= (validKeyInArray!0 (select (arr!46373 a!2901) i!1037)) (and (not (= (select (arr!46373 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46373 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1404741 d!151381))

(push 1)

(assert (not d!151365))

(assert (not b!1404880))

(assert (not bm!66931))

(assert (not b!1404975))

(assert (not d!151329))

(assert (not d!151331))

(assert (not b!1404816))

(assert (not b!1404908))

(assert (not b!1404995))

(assert (not b!1404998))

(assert (not b!1404907))

(assert (not bm!66942))

(assert (not bm!66946))

(assert (not b!1404815))

(assert (not b!1404999))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

