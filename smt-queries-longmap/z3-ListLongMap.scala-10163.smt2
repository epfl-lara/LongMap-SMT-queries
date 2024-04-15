; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119738 () Bool)

(assert start!119738)

(declare-fun b!1394854 () Bool)

(declare-fun res!934317 () Bool)

(declare-fun e!789689 () Bool)

(assert (=> b!1394854 (=> (not res!934317) (not e!789689))))

(declare-datatypes ((array!95373 0))(
  ( (array!95374 (arr!46045 (Array (_ BitVec 32) (_ BitVec 64))) (size!46597 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95373)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95373 (_ BitVec 32)) Bool)

(assert (=> b!1394854 (= res!934317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394855 () Bool)

(declare-fun res!934314 () Bool)

(assert (=> b!1394855 (=> (not res!934314) (not e!789689))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394855 (= res!934314 (and (= (size!46597 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46597 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46597 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394856 () Bool)

(declare-fun e!789691 () Bool)

(assert (=> b!1394856 (= e!789691 (or (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(declare-fun b!1394857 () Bool)

(declare-fun res!934319 () Bool)

(assert (=> b!1394857 (=> res!934319 e!789691)))

(declare-datatypes ((SeekEntryResult!10388 0))(
  ( (MissingZero!10388 (index!43923 (_ BitVec 32))) (Found!10388 (index!43924 (_ BitVec 32))) (Intermediate!10388 (undefined!11200 Bool) (index!43925 (_ BitVec 32)) (x!125581 (_ BitVec 32))) (Undefined!10388) (MissingVacant!10388 (index!43926 (_ BitVec 32))) )
))
(declare-fun lt!612605 () SeekEntryResult!10388)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95373 (_ BitVec 32)) SeekEntryResult!10388)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394857 (= res!934319 (= lt!612605 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95374 (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46597 a!2901)) mask!2840)))))

(declare-fun b!1394858 () Bool)

(assert (=> b!1394858 (= e!789689 (not e!789691))))

(declare-fun res!934313 () Bool)

(assert (=> b!1394858 (=> res!934313 e!789691)))

(get-info :version)

(assert (=> b!1394858 (= res!934313 (or (not ((_ is Intermediate!10388) lt!612605)) (undefined!11200 lt!612605)))))

(declare-fun e!789690 () Bool)

(assert (=> b!1394858 e!789690))

(declare-fun res!934321 () Bool)

(assert (=> b!1394858 (=> (not res!934321) (not e!789690))))

(assert (=> b!1394858 (= res!934321 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46623 0))(
  ( (Unit!46624) )
))
(declare-fun lt!612604 () Unit!46623)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95373 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46623)

(assert (=> b!1394858 (= lt!612604 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1394858 (= lt!612605 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46045 a!2901) j!112) mask!2840) (select (arr!46045 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!934315 () Bool)

(assert (=> start!119738 (=> (not res!934315) (not e!789689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119738 (= res!934315 (validMask!0 mask!2840))))

(assert (=> start!119738 e!789689))

(assert (=> start!119738 true))

(declare-fun array_inv!35278 (array!95373) Bool)

(assert (=> start!119738 (array_inv!35278 a!2901)))

(declare-fun b!1394859 () Bool)

(declare-fun res!934316 () Bool)

(assert (=> b!1394859 (=> (not res!934316) (not e!789689))))

(declare-datatypes ((List!32642 0))(
  ( (Nil!32639) (Cons!32638 (h!33871 (_ BitVec 64)) (t!47328 List!32642)) )
))
(declare-fun arrayNoDuplicates!0 (array!95373 (_ BitVec 32) List!32642) Bool)

(assert (=> b!1394859 (= res!934316 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32639))))

(declare-fun b!1394860 () Bool)

(declare-fun res!934320 () Bool)

(assert (=> b!1394860 (=> (not res!934320) (not e!789689))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394860 (= res!934320 (validKeyInArray!0 (select (arr!46045 a!2901) i!1037)))))

(declare-fun b!1394861 () Bool)

(declare-fun res!934318 () Bool)

(assert (=> b!1394861 (=> (not res!934318) (not e!789689))))

(assert (=> b!1394861 (= res!934318 (validKeyInArray!0 (select (arr!46045 a!2901) j!112)))))

(declare-fun b!1394862 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95373 (_ BitVec 32)) SeekEntryResult!10388)

(assert (=> b!1394862 (= e!789690 (= (seekEntryOrOpen!0 (select (arr!46045 a!2901) j!112) a!2901 mask!2840) (Found!10388 j!112)))))

(assert (= (and start!119738 res!934315) b!1394855))

(assert (= (and b!1394855 res!934314) b!1394860))

(assert (= (and b!1394860 res!934320) b!1394861))

(assert (= (and b!1394861 res!934318) b!1394854))

(assert (= (and b!1394854 res!934317) b!1394859))

(assert (= (and b!1394859 res!934316) b!1394858))

(assert (= (and b!1394858 res!934321) b!1394862))

(assert (= (and b!1394858 (not res!934313)) b!1394857))

(assert (= (and b!1394857 (not res!934319)) b!1394856))

(declare-fun m!1280905 () Bool)

(assert (=> b!1394861 m!1280905))

(assert (=> b!1394861 m!1280905))

(declare-fun m!1280907 () Bool)

(assert (=> b!1394861 m!1280907))

(declare-fun m!1280909 () Bool)

(assert (=> b!1394860 m!1280909))

(assert (=> b!1394860 m!1280909))

(declare-fun m!1280911 () Bool)

(assert (=> b!1394860 m!1280911))

(declare-fun m!1280913 () Bool)

(assert (=> b!1394857 m!1280913))

(declare-fun m!1280915 () Bool)

(assert (=> b!1394857 m!1280915))

(assert (=> b!1394857 m!1280915))

(declare-fun m!1280917 () Bool)

(assert (=> b!1394857 m!1280917))

(assert (=> b!1394857 m!1280917))

(assert (=> b!1394857 m!1280915))

(declare-fun m!1280919 () Bool)

(assert (=> b!1394857 m!1280919))

(declare-fun m!1280921 () Bool)

(assert (=> b!1394859 m!1280921))

(declare-fun m!1280923 () Bool)

(assert (=> b!1394854 m!1280923))

(declare-fun m!1280925 () Bool)

(assert (=> start!119738 m!1280925))

(declare-fun m!1280927 () Bool)

(assert (=> start!119738 m!1280927))

(assert (=> b!1394858 m!1280905))

(declare-fun m!1280929 () Bool)

(assert (=> b!1394858 m!1280929))

(assert (=> b!1394858 m!1280905))

(declare-fun m!1280931 () Bool)

(assert (=> b!1394858 m!1280931))

(assert (=> b!1394858 m!1280929))

(assert (=> b!1394858 m!1280905))

(declare-fun m!1280933 () Bool)

(assert (=> b!1394858 m!1280933))

(declare-fun m!1280935 () Bool)

(assert (=> b!1394858 m!1280935))

(assert (=> b!1394862 m!1280905))

(assert (=> b!1394862 m!1280905))

(declare-fun m!1280937 () Bool)

(assert (=> b!1394862 m!1280937))

(check-sat (not b!1394862) (not start!119738) (not b!1394858) (not b!1394854) (not b!1394860) (not b!1394857) (not b!1394861) (not b!1394859))
(check-sat)
(get-model)

(declare-fun b!1394925 () Bool)

(declare-fun e!789724 () Bool)

(declare-fun call!66785 () Bool)

(assert (=> b!1394925 (= e!789724 call!66785)))

(declare-fun d!150509 () Bool)

(declare-fun res!934381 () Bool)

(declare-fun e!789725 () Bool)

(assert (=> d!150509 (=> res!934381 e!789725)))

(assert (=> d!150509 (= res!934381 (bvsge j!112 (size!46597 a!2901)))))

(assert (=> d!150509 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!789725)))

(declare-fun b!1394926 () Bool)

(assert (=> b!1394926 (= e!789725 e!789724)))

(declare-fun c!129727 () Bool)

(assert (=> b!1394926 (= c!129727 (validKeyInArray!0 (select (arr!46045 a!2901) j!112)))))

(declare-fun bm!66782 () Bool)

(assert (=> bm!66782 (= call!66785 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1394927 () Bool)

(declare-fun e!789723 () Bool)

(assert (=> b!1394927 (= e!789723 call!66785)))

(declare-fun b!1394928 () Bool)

(assert (=> b!1394928 (= e!789724 e!789723)))

(declare-fun lt!612625 () (_ BitVec 64))

(assert (=> b!1394928 (= lt!612625 (select (arr!46045 a!2901) j!112))))

(declare-fun lt!612626 () Unit!46623)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95373 (_ BitVec 64) (_ BitVec 32)) Unit!46623)

(assert (=> b!1394928 (= lt!612626 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!612625 j!112))))

(declare-fun arrayContainsKey!0 (array!95373 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1394928 (arrayContainsKey!0 a!2901 lt!612625 #b00000000000000000000000000000000)))

(declare-fun lt!612624 () Unit!46623)

(assert (=> b!1394928 (= lt!612624 lt!612626)))

(declare-fun res!934380 () Bool)

(assert (=> b!1394928 (= res!934380 (= (seekEntryOrOpen!0 (select (arr!46045 a!2901) j!112) a!2901 mask!2840) (Found!10388 j!112)))))

(assert (=> b!1394928 (=> (not res!934380) (not e!789723))))

(assert (= (and d!150509 (not res!934381)) b!1394926))

(assert (= (and b!1394926 c!129727) b!1394928))

(assert (= (and b!1394926 (not c!129727)) b!1394925))

(assert (= (and b!1394928 res!934380) b!1394927))

(assert (= (or b!1394927 b!1394925) bm!66782))

(assert (=> b!1394926 m!1280905))

(assert (=> b!1394926 m!1280905))

(assert (=> b!1394926 m!1280907))

(declare-fun m!1281007 () Bool)

(assert (=> bm!66782 m!1281007))

(assert (=> b!1394928 m!1280905))

(declare-fun m!1281009 () Bool)

(assert (=> b!1394928 m!1281009))

(declare-fun m!1281011 () Bool)

(assert (=> b!1394928 m!1281011))

(assert (=> b!1394928 m!1280905))

(assert (=> b!1394928 m!1280937))

(assert (=> b!1394858 d!150509))

(declare-fun d!150511 () Bool)

(assert (=> d!150511 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612629 () Unit!46623)

(declare-fun choose!38 (array!95373 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46623)

(assert (=> d!150511 (= lt!612629 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150511 (validMask!0 mask!2840)))

(assert (=> d!150511 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!612629)))

(declare-fun bs!40573 () Bool)

(assert (= bs!40573 d!150511))

(assert (=> bs!40573 m!1280935))

(declare-fun m!1281013 () Bool)

(assert (=> bs!40573 m!1281013))

(assert (=> bs!40573 m!1280925))

(assert (=> b!1394858 d!150511))

(declare-fun b!1394983 () Bool)

(declare-fun lt!612646 () SeekEntryResult!10388)

(assert (=> b!1394983 (and (bvsge (index!43925 lt!612646) #b00000000000000000000000000000000) (bvslt (index!43925 lt!612646) (size!46597 a!2901)))))

(declare-fun e!789759 () Bool)

(assert (=> b!1394983 (= e!789759 (= (select (arr!46045 a!2901) (index!43925 lt!612646)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1394984 () Bool)

(declare-fun e!789761 () SeekEntryResult!10388)

(declare-fun e!789757 () SeekEntryResult!10388)

(assert (=> b!1394984 (= e!789761 e!789757)))

(declare-fun c!129746 () Bool)

(declare-fun lt!612647 () (_ BitVec 64))

(assert (=> b!1394984 (= c!129746 (or (= lt!612647 (select (arr!46045 a!2901) j!112)) (= (bvadd lt!612647 lt!612647) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1394985 () Bool)

(declare-fun e!789760 () Bool)

(declare-fun e!789758 () Bool)

(assert (=> b!1394985 (= e!789760 e!789758)))

(declare-fun res!934403 () Bool)

(assert (=> b!1394985 (= res!934403 (and ((_ is Intermediate!10388) lt!612646) (not (undefined!11200 lt!612646)) (bvslt (x!125581 lt!612646) #b01111111111111111111111111111110) (bvsge (x!125581 lt!612646) #b00000000000000000000000000000000) (bvsge (x!125581 lt!612646) #b00000000000000000000000000000000)))))

(assert (=> b!1394985 (=> (not res!934403) (not e!789758))))

(declare-fun b!1394986 () Bool)

(assert (=> b!1394986 (= e!789761 (Intermediate!10388 true (toIndex!0 (select (arr!46045 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!150519 () Bool)

(assert (=> d!150519 e!789760))

(declare-fun c!129747 () Bool)

(assert (=> d!150519 (= c!129747 (and ((_ is Intermediate!10388) lt!612646) (undefined!11200 lt!612646)))))

(assert (=> d!150519 (= lt!612646 e!789761)))

(declare-fun c!129745 () Bool)

(assert (=> d!150519 (= c!129745 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150519 (= lt!612647 (select (arr!46045 a!2901) (toIndex!0 (select (arr!46045 a!2901) j!112) mask!2840)))))

(assert (=> d!150519 (validMask!0 mask!2840)))

(assert (=> d!150519 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46045 a!2901) j!112) mask!2840) (select (arr!46045 a!2901) j!112) a!2901 mask!2840) lt!612646)))

(declare-fun b!1394982 () Bool)

(assert (=> b!1394982 (and (bvsge (index!43925 lt!612646) #b00000000000000000000000000000000) (bvslt (index!43925 lt!612646) (size!46597 a!2901)))))

(declare-fun res!934401 () Bool)

(assert (=> b!1394982 (= res!934401 (= (select (arr!46045 a!2901) (index!43925 lt!612646)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1394982 (=> res!934401 e!789759)))

(declare-fun b!1394987 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394987 (= e!789757 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46045 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46045 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1394988 () Bool)

(assert (=> b!1394988 (= e!789757 (Intermediate!10388 false (toIndex!0 (select (arr!46045 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1394989 () Bool)

(assert (=> b!1394989 (and (bvsge (index!43925 lt!612646) #b00000000000000000000000000000000) (bvslt (index!43925 lt!612646) (size!46597 a!2901)))))

(declare-fun res!934402 () Bool)

(assert (=> b!1394989 (= res!934402 (= (select (arr!46045 a!2901) (index!43925 lt!612646)) (select (arr!46045 a!2901) j!112)))))

(assert (=> b!1394989 (=> res!934402 e!789759)))

(assert (=> b!1394989 (= e!789758 e!789759)))

(declare-fun b!1394990 () Bool)

(assert (=> b!1394990 (= e!789760 (bvsge (x!125581 lt!612646) #b01111111111111111111111111111110))))

(assert (= (and d!150519 c!129745) b!1394986))

(assert (= (and d!150519 (not c!129745)) b!1394984))

(assert (= (and b!1394984 c!129746) b!1394988))

(assert (= (and b!1394984 (not c!129746)) b!1394987))

(assert (= (and d!150519 c!129747) b!1394990))

(assert (= (and d!150519 (not c!129747)) b!1394985))

(assert (= (and b!1394985 res!934403) b!1394989))

(assert (= (and b!1394989 (not res!934402)) b!1394982))

(assert (= (and b!1394982 (not res!934401)) b!1394983))

(assert (=> b!1394987 m!1280929))

(declare-fun m!1281017 () Bool)

(assert (=> b!1394987 m!1281017))

(assert (=> b!1394987 m!1281017))

(assert (=> b!1394987 m!1280905))

(declare-fun m!1281021 () Bool)

(assert (=> b!1394987 m!1281021))

(declare-fun m!1281025 () Bool)

(assert (=> b!1394982 m!1281025))

(assert (=> b!1394989 m!1281025))

(assert (=> d!150519 m!1280929))

(declare-fun m!1281029 () Bool)

(assert (=> d!150519 m!1281029))

(assert (=> d!150519 m!1280925))

(assert (=> b!1394983 m!1281025))

(assert (=> b!1394858 d!150519))

(declare-fun d!150529 () Bool)

(declare-fun lt!612667 () (_ BitVec 32))

(declare-fun lt!612666 () (_ BitVec 32))

(assert (=> d!150529 (= lt!612667 (bvmul (bvxor lt!612666 (bvlshr lt!612666 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150529 (= lt!612666 ((_ extract 31 0) (bvand (bvxor (select (arr!46045 a!2901) j!112) (bvlshr (select (arr!46045 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150529 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!934408 (let ((h!33874 ((_ extract 31 0) (bvand (bvxor (select (arr!46045 a!2901) j!112) (bvlshr (select (arr!46045 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125586 (bvmul (bvxor h!33874 (bvlshr h!33874 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125586 (bvlshr x!125586 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!934408 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!934408 #b00000000000000000000000000000000))))))

(assert (=> d!150529 (= (toIndex!0 (select (arr!46045 a!2901) j!112) mask!2840) (bvand (bvxor lt!612667 (bvlshr lt!612667 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1394858 d!150529))

(declare-fun d!150537 () Bool)

(declare-fun res!934423 () Bool)

(declare-fun e!789785 () Bool)

(assert (=> d!150537 (=> res!934423 e!789785)))

(assert (=> d!150537 (= res!934423 (bvsge #b00000000000000000000000000000000 (size!46597 a!2901)))))

(assert (=> d!150537 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32639) e!789785)))

(declare-fun b!1395019 () Bool)

(declare-fun e!789787 () Bool)

(declare-fun e!789784 () Bool)

(assert (=> b!1395019 (= e!789787 e!789784)))

(declare-fun c!129754 () Bool)

(assert (=> b!1395019 (= c!129754 (validKeyInArray!0 (select (arr!46045 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66791 () Bool)

(declare-fun call!66794 () Bool)

(assert (=> bm!66791 (= call!66794 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129754 (Cons!32638 (select (arr!46045 a!2901) #b00000000000000000000000000000000) Nil!32639) Nil!32639)))))

(declare-fun b!1395020 () Bool)

(assert (=> b!1395020 (= e!789784 call!66794)))

(declare-fun b!1395021 () Bool)

(assert (=> b!1395021 (= e!789784 call!66794)))

(declare-fun b!1395022 () Bool)

(assert (=> b!1395022 (= e!789785 e!789787)))

(declare-fun res!934424 () Bool)

(assert (=> b!1395022 (=> (not res!934424) (not e!789787))))

(declare-fun e!789786 () Bool)

(assert (=> b!1395022 (= res!934424 (not e!789786))))

(declare-fun res!934422 () Bool)

(assert (=> b!1395022 (=> (not res!934422) (not e!789786))))

(assert (=> b!1395022 (= res!934422 (validKeyInArray!0 (select (arr!46045 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1395023 () Bool)

(declare-fun contains!9737 (List!32642 (_ BitVec 64)) Bool)

(assert (=> b!1395023 (= e!789786 (contains!9737 Nil!32639 (select (arr!46045 a!2901) #b00000000000000000000000000000000)))))

(assert (= (and d!150537 (not res!934423)) b!1395022))

(assert (= (and b!1395022 res!934422) b!1395023))

(assert (= (and b!1395022 res!934424) b!1395019))

(assert (= (and b!1395019 c!129754) b!1395021))

(assert (= (and b!1395019 (not c!129754)) b!1395020))

(assert (= (or b!1395021 b!1395020) bm!66791))

(declare-fun m!1281051 () Bool)

(assert (=> b!1395019 m!1281051))

(assert (=> b!1395019 m!1281051))

(declare-fun m!1281053 () Bool)

(assert (=> b!1395019 m!1281053))

(assert (=> bm!66791 m!1281051))

(declare-fun m!1281059 () Bool)

(assert (=> bm!66791 m!1281059))

(assert (=> b!1395022 m!1281051))

(assert (=> b!1395022 m!1281051))

(assert (=> b!1395022 m!1281053))

(assert (=> b!1395023 m!1281051))

(assert (=> b!1395023 m!1281051))

(declare-fun m!1281063 () Bool)

(assert (=> b!1395023 m!1281063))

(assert (=> b!1394859 d!150537))

(declare-fun d!150541 () Bool)

(assert (=> d!150541 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119738 d!150541))

(declare-fun d!150547 () Bool)

(assert (=> d!150547 (= (array_inv!35278 a!2901) (bvsge (size!46597 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119738 d!150547))

(declare-fun b!1395059 () Bool)

(declare-fun e!789812 () Bool)

(declare-fun call!66799 () Bool)

(assert (=> b!1395059 (= e!789812 call!66799)))

(declare-fun d!150549 () Bool)

(declare-fun res!934441 () Bool)

(declare-fun e!789813 () Bool)

(assert (=> d!150549 (=> res!934441 e!789813)))

(assert (=> d!150549 (= res!934441 (bvsge #b00000000000000000000000000000000 (size!46597 a!2901)))))

(assert (=> d!150549 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!789813)))

(declare-fun b!1395060 () Bool)

(assert (=> b!1395060 (= e!789813 e!789812)))

(declare-fun c!129765 () Bool)

(assert (=> b!1395060 (= c!129765 (validKeyInArray!0 (select (arr!46045 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66796 () Bool)

(assert (=> bm!66796 (= call!66799 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1395061 () Bool)

(declare-fun e!789811 () Bool)

(assert (=> b!1395061 (= e!789811 call!66799)))

(declare-fun b!1395062 () Bool)

(assert (=> b!1395062 (= e!789812 e!789811)))

(declare-fun lt!612683 () (_ BitVec 64))

(assert (=> b!1395062 (= lt!612683 (select (arr!46045 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!612684 () Unit!46623)

(assert (=> b!1395062 (= lt!612684 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!612683 #b00000000000000000000000000000000))))

(assert (=> b!1395062 (arrayContainsKey!0 a!2901 lt!612683 #b00000000000000000000000000000000)))

(declare-fun lt!612682 () Unit!46623)

(assert (=> b!1395062 (= lt!612682 lt!612684)))

(declare-fun res!934440 () Bool)

(assert (=> b!1395062 (= res!934440 (= (seekEntryOrOpen!0 (select (arr!46045 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10388 #b00000000000000000000000000000000)))))

(assert (=> b!1395062 (=> (not res!934440) (not e!789811))))

(assert (= (and d!150549 (not res!934441)) b!1395060))

(assert (= (and b!1395060 c!129765) b!1395062))

(assert (= (and b!1395060 (not c!129765)) b!1395059))

(assert (= (and b!1395062 res!934440) b!1395061))

(assert (= (or b!1395061 b!1395059) bm!66796))

(assert (=> b!1395060 m!1281051))

(assert (=> b!1395060 m!1281051))

(assert (=> b!1395060 m!1281053))

(declare-fun m!1281075 () Bool)

(assert (=> bm!66796 m!1281075))

(assert (=> b!1395062 m!1281051))

(declare-fun m!1281077 () Bool)

(assert (=> b!1395062 m!1281077))

(declare-fun m!1281079 () Bool)

(assert (=> b!1395062 m!1281079))

(assert (=> b!1395062 m!1281051))

(declare-fun m!1281081 () Bool)

(assert (=> b!1395062 m!1281081))

(assert (=> b!1394854 d!150549))

(declare-fun d!150551 () Bool)

(assert (=> d!150551 (= (validKeyInArray!0 (select (arr!46045 a!2901) i!1037)) (and (not (= (select (arr!46045 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46045 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1394860 d!150551))

(declare-fun d!150553 () Bool)

(assert (=> d!150553 (= (validKeyInArray!0 (select (arr!46045 a!2901) j!112)) (and (not (= (select (arr!46045 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46045 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1394861 d!150553))

(declare-fun b!1395064 () Bool)

(declare-fun lt!612685 () SeekEntryResult!10388)

(assert (=> b!1395064 (and (bvsge (index!43925 lt!612685) #b00000000000000000000000000000000) (bvslt (index!43925 lt!612685) (size!46597 (array!95374 (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46597 a!2901)))))))

(declare-fun e!789816 () Bool)

(assert (=> b!1395064 (= e!789816 (= (select (arr!46045 (array!95374 (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46597 a!2901))) (index!43925 lt!612685)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1395065 () Bool)

(declare-fun e!789818 () SeekEntryResult!10388)

(declare-fun e!789814 () SeekEntryResult!10388)

(assert (=> b!1395065 (= e!789818 e!789814)))

(declare-fun lt!612686 () (_ BitVec 64))

(declare-fun c!129767 () Bool)

(assert (=> b!1395065 (= c!129767 (or (= lt!612686 (select (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!612686 lt!612686) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1395066 () Bool)

(declare-fun e!789817 () Bool)

(declare-fun e!789815 () Bool)

(assert (=> b!1395066 (= e!789817 e!789815)))

(declare-fun res!934444 () Bool)

(assert (=> b!1395066 (= res!934444 (and ((_ is Intermediate!10388) lt!612685) (not (undefined!11200 lt!612685)) (bvslt (x!125581 lt!612685) #b01111111111111111111111111111110) (bvsge (x!125581 lt!612685) #b00000000000000000000000000000000) (bvsge (x!125581 lt!612685) #b00000000000000000000000000000000)))))

(assert (=> b!1395066 (=> (not res!934444) (not e!789815))))

(declare-fun b!1395067 () Bool)

(assert (=> b!1395067 (= e!789818 (Intermediate!10388 true (toIndex!0 (select (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!150555 () Bool)

(assert (=> d!150555 e!789817))

(declare-fun c!129768 () Bool)

(assert (=> d!150555 (= c!129768 (and ((_ is Intermediate!10388) lt!612685) (undefined!11200 lt!612685)))))

(assert (=> d!150555 (= lt!612685 e!789818)))

(declare-fun c!129766 () Bool)

(assert (=> d!150555 (= c!129766 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!150555 (= lt!612686 (select (arr!46045 (array!95374 (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46597 a!2901))) (toIndex!0 (select (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!150555 (validMask!0 mask!2840)))

(assert (=> d!150555 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95374 (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46597 a!2901)) mask!2840) lt!612685)))

(declare-fun b!1395063 () Bool)

(assert (=> b!1395063 (and (bvsge (index!43925 lt!612685) #b00000000000000000000000000000000) (bvslt (index!43925 lt!612685) (size!46597 (array!95374 (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46597 a!2901)))))))

(declare-fun res!934442 () Bool)

(assert (=> b!1395063 (= res!934442 (= (select (arr!46045 (array!95374 (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46597 a!2901))) (index!43925 lt!612685)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1395063 (=> res!934442 e!789816)))

(declare-fun b!1395068 () Bool)

(assert (=> b!1395068 (= e!789814 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95374 (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46597 a!2901)) mask!2840))))

(declare-fun b!1395069 () Bool)

(assert (=> b!1395069 (= e!789814 (Intermediate!10388 false (toIndex!0 (select (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1395070 () Bool)

(assert (=> b!1395070 (and (bvsge (index!43925 lt!612685) #b00000000000000000000000000000000) (bvslt (index!43925 lt!612685) (size!46597 (array!95374 (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46597 a!2901)))))))

(declare-fun res!934443 () Bool)

(assert (=> b!1395070 (= res!934443 (= (select (arr!46045 (array!95374 (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46597 a!2901))) (index!43925 lt!612685)) (select (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(assert (=> b!1395070 (=> res!934443 e!789816)))

(assert (=> b!1395070 (= e!789815 e!789816)))

(declare-fun b!1395071 () Bool)

(assert (=> b!1395071 (= e!789817 (bvsge (x!125581 lt!612685) #b01111111111111111111111111111110))))

(assert (= (and d!150555 c!129766) b!1395067))

(assert (= (and d!150555 (not c!129766)) b!1395065))

(assert (= (and b!1395065 c!129767) b!1395069))

(assert (= (and b!1395065 (not c!129767)) b!1395068))

(assert (= (and d!150555 c!129768) b!1395071))

(assert (= (and d!150555 (not c!129768)) b!1395066))

(assert (= (and b!1395066 res!934444) b!1395070))

(assert (= (and b!1395070 (not res!934443)) b!1395063))

(assert (= (and b!1395063 (not res!934442)) b!1395064))

(assert (=> b!1395068 m!1280917))

(declare-fun m!1281083 () Bool)

(assert (=> b!1395068 m!1281083))

(assert (=> b!1395068 m!1281083))

(assert (=> b!1395068 m!1280915))

(declare-fun m!1281085 () Bool)

(assert (=> b!1395068 m!1281085))

(declare-fun m!1281087 () Bool)

(assert (=> b!1395063 m!1281087))

(assert (=> b!1395070 m!1281087))

(assert (=> d!150555 m!1280917))

(declare-fun m!1281089 () Bool)

(assert (=> d!150555 m!1281089))

(assert (=> d!150555 m!1280925))

(assert (=> b!1395064 m!1281087))

(assert (=> b!1394857 d!150555))

(declare-fun d!150557 () Bool)

(declare-fun lt!612690 () (_ BitVec 32))

(declare-fun lt!612689 () (_ BitVec 32))

(assert (=> d!150557 (= lt!612690 (bvmul (bvxor lt!612689 (bvlshr lt!612689 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150557 (= lt!612689 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150557 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!934408 (let ((h!33874 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125586 (bvmul (bvxor h!33874 (bvlshr h!33874 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125586 (bvlshr x!125586 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!934408 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!934408 #b00000000000000000000000000000000))))))

(assert (=> d!150557 (= (toIndex!0 (select (store (arr!46045 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!612690 (bvlshr lt!612690 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1394857 d!150557))

(declare-fun d!150559 () Bool)

(declare-fun lt!612717 () SeekEntryResult!10388)

(assert (=> d!150559 (and (or ((_ is Undefined!10388) lt!612717) (not ((_ is Found!10388) lt!612717)) (and (bvsge (index!43924 lt!612717) #b00000000000000000000000000000000) (bvslt (index!43924 lt!612717) (size!46597 a!2901)))) (or ((_ is Undefined!10388) lt!612717) ((_ is Found!10388) lt!612717) (not ((_ is MissingZero!10388) lt!612717)) (and (bvsge (index!43923 lt!612717) #b00000000000000000000000000000000) (bvslt (index!43923 lt!612717) (size!46597 a!2901)))) (or ((_ is Undefined!10388) lt!612717) ((_ is Found!10388) lt!612717) ((_ is MissingZero!10388) lt!612717) (not ((_ is MissingVacant!10388) lt!612717)) (and (bvsge (index!43926 lt!612717) #b00000000000000000000000000000000) (bvslt (index!43926 lt!612717) (size!46597 a!2901)))) (or ((_ is Undefined!10388) lt!612717) (ite ((_ is Found!10388) lt!612717) (= (select (arr!46045 a!2901) (index!43924 lt!612717)) (select (arr!46045 a!2901) j!112)) (ite ((_ is MissingZero!10388) lt!612717) (= (select (arr!46045 a!2901) (index!43923 lt!612717)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10388) lt!612717) (= (select (arr!46045 a!2901) (index!43926 lt!612717)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!789843 () SeekEntryResult!10388)

(assert (=> d!150559 (= lt!612717 e!789843)))

(declare-fun c!129787 () Bool)

(declare-fun lt!612719 () SeekEntryResult!10388)

(assert (=> d!150559 (= c!129787 (and ((_ is Intermediate!10388) lt!612719) (undefined!11200 lt!612719)))))

(assert (=> d!150559 (= lt!612719 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46045 a!2901) j!112) mask!2840) (select (arr!46045 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150559 (validMask!0 mask!2840)))

(assert (=> d!150559 (= (seekEntryOrOpen!0 (select (arr!46045 a!2901) j!112) a!2901 mask!2840) lt!612717)))

(declare-fun e!789845 () SeekEntryResult!10388)

(declare-fun b!1395115 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95373 (_ BitVec 32)) SeekEntryResult!10388)

(assert (=> b!1395115 (= e!789845 (seekKeyOrZeroReturnVacant!0 (x!125581 lt!612719) (index!43925 lt!612719) (index!43925 lt!612719) (select (arr!46045 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395116 () Bool)

(declare-fun e!789844 () SeekEntryResult!10388)

(assert (=> b!1395116 (= e!789843 e!789844)))

(declare-fun lt!612718 () (_ BitVec 64))

(assert (=> b!1395116 (= lt!612718 (select (arr!46045 a!2901) (index!43925 lt!612719)))))

(declare-fun c!129785 () Bool)

(assert (=> b!1395116 (= c!129785 (= lt!612718 (select (arr!46045 a!2901) j!112)))))

(declare-fun b!1395117 () Bool)

(assert (=> b!1395117 (= e!789843 Undefined!10388)))

(declare-fun b!1395118 () Bool)

(declare-fun c!129786 () Bool)

(assert (=> b!1395118 (= c!129786 (= lt!612718 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1395118 (= e!789844 e!789845)))

(declare-fun b!1395119 () Bool)

(assert (=> b!1395119 (= e!789844 (Found!10388 (index!43925 lt!612719)))))

(declare-fun b!1395120 () Bool)

(assert (=> b!1395120 (= e!789845 (MissingZero!10388 (index!43925 lt!612719)))))

(assert (= (and d!150559 c!129787) b!1395117))

(assert (= (and d!150559 (not c!129787)) b!1395116))

(assert (= (and b!1395116 c!129785) b!1395119))

(assert (= (and b!1395116 (not c!129785)) b!1395118))

(assert (= (and b!1395118 c!129786) b!1395120))

(assert (= (and b!1395118 (not c!129786)) b!1395115))

(declare-fun m!1281123 () Bool)

(assert (=> d!150559 m!1281123))

(declare-fun m!1281125 () Bool)

(assert (=> d!150559 m!1281125))

(assert (=> d!150559 m!1280929))

(assert (=> d!150559 m!1280905))

(assert (=> d!150559 m!1280933))

(declare-fun m!1281127 () Bool)

(assert (=> d!150559 m!1281127))

(assert (=> d!150559 m!1280925))

(assert (=> d!150559 m!1280905))

(assert (=> d!150559 m!1280929))

(assert (=> b!1395115 m!1280905))

(declare-fun m!1281129 () Bool)

(assert (=> b!1395115 m!1281129))

(declare-fun m!1281131 () Bool)

(assert (=> b!1395116 m!1281131))

(assert (=> b!1394862 d!150559))

(check-sat (not b!1395022) (not b!1395115) (not d!150559) (not d!150555) (not b!1395068) (not bm!66796) (not bm!66782) (not b!1394928) (not b!1394987) (not b!1395023) (not b!1395060) (not bm!66791) (not b!1395019) (not b!1395062) (not d!150519) (not d!150511) (not b!1394926))
(check-sat)
