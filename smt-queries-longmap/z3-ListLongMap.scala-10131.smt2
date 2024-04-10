; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119444 () Bool)

(assert start!119444)

(declare-fun res!931775 () Bool)

(declare-fun e!788268 () Bool)

(assert (=> start!119444 (=> (not res!931775) (not e!788268))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119444 (= res!931775 (validMask!0 mask!2840))))

(assert (=> start!119444 e!788268))

(assert (=> start!119444 true))

(declare-datatypes ((array!95228 0))(
  ( (array!95229 (arr!45975 (Array (_ BitVec 32) (_ BitVec 64))) (size!46525 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95228)

(declare-fun array_inv!35003 (array!95228) Bool)

(assert (=> start!119444 (array_inv!35003 a!2901)))

(declare-fun b!1392053 () Bool)

(declare-fun e!788267 () Bool)

(declare-fun lt!611446 () (_ BitVec 32))

(assert (=> b!1392053 (= e!788267 (or (bvslt mask!2840 #b00000000000000000000000000000000) (and (bvsge lt!611446 #b00000000000000000000000000000000) (bvslt lt!611446 (bvadd #b00000000000000000000000000000001 mask!2840)))))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392053 (= lt!611446 (toIndex!0 (select (store (arr!45975 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1392054 () Bool)

(declare-fun res!931780 () Bool)

(assert (=> b!1392054 (=> (not res!931780) (not e!788268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1392054 (= res!931780 (validKeyInArray!0 (select (arr!45975 a!2901) j!112)))))

(declare-fun b!1392055 () Bool)

(declare-fun e!788269 () Bool)

(declare-datatypes ((SeekEntryResult!10292 0))(
  ( (MissingZero!10292 (index!43539 (_ BitVec 32))) (Found!10292 (index!43540 (_ BitVec 32))) (Intermediate!10292 (undefined!11104 Bool) (index!43541 (_ BitVec 32)) (x!125220 (_ BitVec 32))) (Undefined!10292) (MissingVacant!10292 (index!43542 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95228 (_ BitVec 32)) SeekEntryResult!10292)

(assert (=> b!1392055 (= e!788269 (= (seekEntryOrOpen!0 (select (arr!45975 a!2901) j!112) a!2901 mask!2840) (Found!10292 j!112)))))

(declare-fun b!1392056 () Bool)

(declare-fun res!931773 () Bool)

(assert (=> b!1392056 (=> (not res!931773) (not e!788268))))

(declare-datatypes ((List!32494 0))(
  ( (Nil!32491) (Cons!32490 (h!33717 (_ BitVec 64)) (t!47188 List!32494)) )
))
(declare-fun arrayNoDuplicates!0 (array!95228 (_ BitVec 32) List!32494) Bool)

(assert (=> b!1392056 (= res!931773 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32491))))

(declare-fun b!1392057 () Bool)

(declare-fun res!931779 () Bool)

(assert (=> b!1392057 (=> (not res!931779) (not e!788268))))

(assert (=> b!1392057 (= res!931779 (validKeyInArray!0 (select (arr!45975 a!2901) i!1037)))))

(declare-fun b!1392058 () Bool)

(declare-fun res!931774 () Bool)

(assert (=> b!1392058 (=> (not res!931774) (not e!788268))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95228 (_ BitVec 32)) Bool)

(assert (=> b!1392058 (= res!931774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1392059 () Bool)

(declare-fun res!931778 () Bool)

(assert (=> b!1392059 (=> (not res!931778) (not e!788268))))

(assert (=> b!1392059 (= res!931778 (and (= (size!46525 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46525 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46525 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1392060 () Bool)

(assert (=> b!1392060 (= e!788268 (not e!788267))))

(declare-fun res!931776 () Bool)

(assert (=> b!1392060 (=> res!931776 e!788267)))

(declare-fun lt!611447 () SeekEntryResult!10292)

(get-info :version)

(assert (=> b!1392060 (= res!931776 (or (not ((_ is Intermediate!10292) lt!611447)) (undefined!11104 lt!611447)))))

(assert (=> b!1392060 e!788269))

(declare-fun res!931777 () Bool)

(assert (=> b!1392060 (=> (not res!931777) (not e!788269))))

(assert (=> b!1392060 (= res!931777 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46588 0))(
  ( (Unit!46589) )
))
(declare-fun lt!611448 () Unit!46588)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95228 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46588)

(assert (=> b!1392060 (= lt!611448 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95228 (_ BitVec 32)) SeekEntryResult!10292)

(assert (=> b!1392060 (= lt!611447 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45975 a!2901) j!112) mask!2840) (select (arr!45975 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119444 res!931775) b!1392059))

(assert (= (and b!1392059 res!931778) b!1392057))

(assert (= (and b!1392057 res!931779) b!1392054))

(assert (= (and b!1392054 res!931780) b!1392058))

(assert (= (and b!1392058 res!931774) b!1392056))

(assert (= (and b!1392056 res!931773) b!1392060))

(assert (= (and b!1392060 res!931777) b!1392055))

(assert (= (and b!1392060 (not res!931776)) b!1392053))

(declare-fun m!1277843 () Bool)

(assert (=> b!1392058 m!1277843))

(declare-fun m!1277845 () Bool)

(assert (=> b!1392057 m!1277845))

(assert (=> b!1392057 m!1277845))

(declare-fun m!1277847 () Bool)

(assert (=> b!1392057 m!1277847))

(declare-fun m!1277849 () Bool)

(assert (=> start!119444 m!1277849))

(declare-fun m!1277851 () Bool)

(assert (=> start!119444 m!1277851))

(declare-fun m!1277853 () Bool)

(assert (=> b!1392054 m!1277853))

(assert (=> b!1392054 m!1277853))

(declare-fun m!1277855 () Bool)

(assert (=> b!1392054 m!1277855))

(assert (=> b!1392055 m!1277853))

(assert (=> b!1392055 m!1277853))

(declare-fun m!1277857 () Bool)

(assert (=> b!1392055 m!1277857))

(declare-fun m!1277859 () Bool)

(assert (=> b!1392053 m!1277859))

(declare-fun m!1277861 () Bool)

(assert (=> b!1392053 m!1277861))

(assert (=> b!1392053 m!1277861))

(declare-fun m!1277863 () Bool)

(assert (=> b!1392053 m!1277863))

(assert (=> b!1392060 m!1277853))

(declare-fun m!1277865 () Bool)

(assert (=> b!1392060 m!1277865))

(assert (=> b!1392060 m!1277853))

(declare-fun m!1277867 () Bool)

(assert (=> b!1392060 m!1277867))

(assert (=> b!1392060 m!1277865))

(assert (=> b!1392060 m!1277853))

(declare-fun m!1277869 () Bool)

(assert (=> b!1392060 m!1277869))

(declare-fun m!1277871 () Bool)

(assert (=> b!1392060 m!1277871))

(declare-fun m!1277873 () Bool)

(assert (=> b!1392056 m!1277873))

(check-sat (not b!1392060) (not b!1392056) (not b!1392058) (not b!1392053) (not b!1392054) (not b!1392055) (not b!1392057) (not start!119444))
(check-sat)
(get-model)

(declare-fun d!150421 () Bool)

(declare-fun lt!611463 () (_ BitVec 32))

(declare-fun lt!611462 () (_ BitVec 32))

(assert (=> d!150421 (= lt!611463 (bvmul (bvxor lt!611462 (bvlshr lt!611462 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150421 (= lt!611462 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45975 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!45975 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150421 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!931805 (let ((h!33719 ((_ extract 31 0) (bvand (bvxor (select (store (arr!45975 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!45975 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125222 (bvmul (bvxor h!33719 (bvlshr h!33719 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125222 (bvlshr x!125222 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!931805 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!931805 #b00000000000000000000000000000000))))))

(assert (=> d!150421 (= (toIndex!0 (select (store (arr!45975 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!611463 (bvlshr lt!611463 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1392053 d!150421))

(declare-fun b!1392108 () Bool)

(declare-fun e!788303 () Bool)

(declare-fun e!788302 () Bool)

(assert (=> b!1392108 (= e!788303 e!788302)))

(declare-fun lt!611471 () (_ BitVec 64))

(assert (=> b!1392108 (= lt!611471 (select (arr!45975 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!611470 () Unit!46588)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95228 (_ BitVec 64) (_ BitVec 32)) Unit!46588)

(assert (=> b!1392108 (= lt!611470 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611471 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95228 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1392108 (arrayContainsKey!0 a!2901 lt!611471 #b00000000000000000000000000000000)))

(declare-fun lt!611472 () Unit!46588)

(assert (=> b!1392108 (= lt!611472 lt!611470)))

(declare-fun res!931820 () Bool)

(assert (=> b!1392108 (= res!931820 (= (seekEntryOrOpen!0 (select (arr!45975 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10292 #b00000000000000000000000000000000)))))

(assert (=> b!1392108 (=> (not res!931820) (not e!788302))))

(declare-fun b!1392109 () Bool)

(declare-fun call!66766 () Bool)

(assert (=> b!1392109 (= e!788302 call!66766)))

(declare-fun b!1392110 () Bool)

(assert (=> b!1392110 (= e!788303 call!66766)))

(declare-fun b!1392111 () Bool)

(declare-fun e!788301 () Bool)

(assert (=> b!1392111 (= e!788301 e!788303)))

(declare-fun c!129594 () Bool)

(assert (=> b!1392111 (= c!129594 (validKeyInArray!0 (select (arr!45975 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150425 () Bool)

(declare-fun res!931821 () Bool)

(assert (=> d!150425 (=> res!931821 e!788301)))

(assert (=> d!150425 (= res!931821 (bvsge #b00000000000000000000000000000000 (size!46525 a!2901)))))

(assert (=> d!150425 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!788301)))

(declare-fun bm!66763 () Bool)

(assert (=> bm!66763 (= call!66766 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!150425 (not res!931821)) b!1392111))

(assert (= (and b!1392111 c!129594) b!1392108))

(assert (= (and b!1392111 (not c!129594)) b!1392110))

(assert (= (and b!1392108 res!931820) b!1392109))

(assert (= (or b!1392109 b!1392110) bm!66763))

(declare-fun m!1277915 () Bool)

(assert (=> b!1392108 m!1277915))

(declare-fun m!1277917 () Bool)

(assert (=> b!1392108 m!1277917))

(declare-fun m!1277919 () Bool)

(assert (=> b!1392108 m!1277919))

(assert (=> b!1392108 m!1277915))

(declare-fun m!1277921 () Bool)

(assert (=> b!1392108 m!1277921))

(assert (=> b!1392111 m!1277915))

(assert (=> b!1392111 m!1277915))

(declare-fun m!1277923 () Bool)

(assert (=> b!1392111 m!1277923))

(declare-fun m!1277925 () Bool)

(assert (=> bm!66763 m!1277925))

(assert (=> b!1392058 d!150425))

(declare-fun d!150431 () Bool)

(assert (=> d!150431 (= (validKeyInArray!0 (select (arr!45975 a!2901) j!112)) (and (not (= (select (arr!45975 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45975 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1392054 d!150431))

(declare-fun d!150433 () Bool)

(assert (=> d!150433 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119444 d!150433))

(declare-fun d!150439 () Bool)

(assert (=> d!150439 (= (array_inv!35003 a!2901) (bvsge (size!46525 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119444 d!150439))

(declare-fun lt!611519 () SeekEntryResult!10292)

(declare-fun b!1392166 () Bool)

(declare-fun e!788338 () SeekEntryResult!10292)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95228 (_ BitVec 32)) SeekEntryResult!10292)

(assert (=> b!1392166 (= e!788338 (seekKeyOrZeroReturnVacant!0 (x!125220 lt!611519) (index!43541 lt!611519) (index!43541 lt!611519) (select (arr!45975 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392168 () Bool)

(declare-fun e!788339 () SeekEntryResult!10292)

(assert (=> b!1392168 (= e!788339 (Found!10292 (index!43541 lt!611519)))))

(declare-fun b!1392169 () Bool)

(declare-fun e!788337 () SeekEntryResult!10292)

(assert (=> b!1392169 (= e!788337 Undefined!10292)))

(declare-fun b!1392170 () Bool)

(declare-fun c!129618 () Bool)

(declare-fun lt!611520 () (_ BitVec 64))

(assert (=> b!1392170 (= c!129618 (= lt!611520 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1392170 (= e!788339 e!788338)))

(declare-fun b!1392171 () Bool)

(assert (=> b!1392171 (= e!788337 e!788339)))

(assert (=> b!1392171 (= lt!611520 (select (arr!45975 a!2901) (index!43541 lt!611519)))))

(declare-fun c!129617 () Bool)

(assert (=> b!1392171 (= c!129617 (= lt!611520 (select (arr!45975 a!2901) j!112)))))

(declare-fun b!1392167 () Bool)

(assert (=> b!1392167 (= e!788338 (MissingZero!10292 (index!43541 lt!611519)))))

(declare-fun d!150441 () Bool)

(declare-fun lt!611518 () SeekEntryResult!10292)

(assert (=> d!150441 (and (or ((_ is Undefined!10292) lt!611518) (not ((_ is Found!10292) lt!611518)) (and (bvsge (index!43540 lt!611518) #b00000000000000000000000000000000) (bvslt (index!43540 lt!611518) (size!46525 a!2901)))) (or ((_ is Undefined!10292) lt!611518) ((_ is Found!10292) lt!611518) (not ((_ is MissingZero!10292) lt!611518)) (and (bvsge (index!43539 lt!611518) #b00000000000000000000000000000000) (bvslt (index!43539 lt!611518) (size!46525 a!2901)))) (or ((_ is Undefined!10292) lt!611518) ((_ is Found!10292) lt!611518) ((_ is MissingZero!10292) lt!611518) (not ((_ is MissingVacant!10292) lt!611518)) (and (bvsge (index!43542 lt!611518) #b00000000000000000000000000000000) (bvslt (index!43542 lt!611518) (size!46525 a!2901)))) (or ((_ is Undefined!10292) lt!611518) (ite ((_ is Found!10292) lt!611518) (= (select (arr!45975 a!2901) (index!43540 lt!611518)) (select (arr!45975 a!2901) j!112)) (ite ((_ is MissingZero!10292) lt!611518) (= (select (arr!45975 a!2901) (index!43539 lt!611518)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10292) lt!611518) (= (select (arr!45975 a!2901) (index!43542 lt!611518)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150441 (= lt!611518 e!788337)))

(declare-fun c!129616 () Bool)

(assert (=> d!150441 (= c!129616 (and ((_ is Intermediate!10292) lt!611519) (undefined!11104 lt!611519)))))

(assert (=> d!150441 (= lt!611519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45975 a!2901) j!112) mask!2840) (select (arr!45975 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150441 (validMask!0 mask!2840)))

(assert (=> d!150441 (= (seekEntryOrOpen!0 (select (arr!45975 a!2901) j!112) a!2901 mask!2840) lt!611518)))

(assert (= (and d!150441 c!129616) b!1392169))

(assert (= (and d!150441 (not c!129616)) b!1392171))

(assert (= (and b!1392171 c!129617) b!1392168))

(assert (= (and b!1392171 (not c!129617)) b!1392170))

(assert (= (and b!1392170 c!129618) b!1392167))

(assert (= (and b!1392170 (not c!129618)) b!1392166))

(assert (=> b!1392166 m!1277853))

(declare-fun m!1277953 () Bool)

(assert (=> b!1392166 m!1277953))

(declare-fun m!1277955 () Bool)

(assert (=> b!1392171 m!1277955))

(declare-fun m!1277957 () Bool)

(assert (=> d!150441 m!1277957))

(declare-fun m!1277959 () Bool)

(assert (=> d!150441 m!1277959))

(declare-fun m!1277961 () Bool)

(assert (=> d!150441 m!1277961))

(assert (=> d!150441 m!1277865))

(assert (=> d!150441 m!1277853))

(assert (=> d!150441 m!1277869))

(assert (=> d!150441 m!1277849))

(assert (=> d!150441 m!1277853))

(assert (=> d!150441 m!1277865))

(assert (=> b!1392055 d!150441))

(declare-fun b!1392172 () Bool)

(declare-fun e!788342 () Bool)

(declare-fun e!788341 () Bool)

(assert (=> b!1392172 (= e!788342 e!788341)))

(declare-fun lt!611522 () (_ BitVec 64))

(assert (=> b!1392172 (= lt!611522 (select (arr!45975 a!2901) j!112))))

(declare-fun lt!611521 () Unit!46588)

(assert (=> b!1392172 (= lt!611521 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611522 j!112))))

(assert (=> b!1392172 (arrayContainsKey!0 a!2901 lt!611522 #b00000000000000000000000000000000)))

(declare-fun lt!611523 () Unit!46588)

(assert (=> b!1392172 (= lt!611523 lt!611521)))

(declare-fun res!931834 () Bool)

(assert (=> b!1392172 (= res!931834 (= (seekEntryOrOpen!0 (select (arr!45975 a!2901) j!112) a!2901 mask!2840) (Found!10292 j!112)))))

(assert (=> b!1392172 (=> (not res!931834) (not e!788341))))

(declare-fun b!1392173 () Bool)

(declare-fun call!66773 () Bool)

(assert (=> b!1392173 (= e!788341 call!66773)))

(declare-fun b!1392174 () Bool)

(assert (=> b!1392174 (= e!788342 call!66773)))

(declare-fun b!1392175 () Bool)

(declare-fun e!788340 () Bool)

(assert (=> b!1392175 (= e!788340 e!788342)))

(declare-fun c!129619 () Bool)

(assert (=> b!1392175 (= c!129619 (validKeyInArray!0 (select (arr!45975 a!2901) j!112)))))

(declare-fun d!150461 () Bool)

(declare-fun res!931835 () Bool)

(assert (=> d!150461 (=> res!931835 e!788340)))

(assert (=> d!150461 (= res!931835 (bvsge j!112 (size!46525 a!2901)))))

(assert (=> d!150461 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!788340)))

(declare-fun bm!66770 () Bool)

(assert (=> bm!66770 (= call!66773 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!150461 (not res!931835)) b!1392175))

(assert (= (and b!1392175 c!129619) b!1392172))

(assert (= (and b!1392175 (not c!129619)) b!1392174))

(assert (= (and b!1392172 res!931834) b!1392173))

(assert (= (or b!1392173 b!1392174) bm!66770))

(assert (=> b!1392172 m!1277853))

(declare-fun m!1277963 () Bool)

(assert (=> b!1392172 m!1277963))

(declare-fun m!1277965 () Bool)

(assert (=> b!1392172 m!1277965))

(assert (=> b!1392172 m!1277853))

(assert (=> b!1392172 m!1277857))

(assert (=> b!1392175 m!1277853))

(assert (=> b!1392175 m!1277853))

(assert (=> b!1392175 m!1277855))

(declare-fun m!1277967 () Bool)

(assert (=> bm!66770 m!1277967))

(assert (=> b!1392060 d!150461))

(declare-fun d!150463 () Bool)

(assert (=> d!150463 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!611526 () Unit!46588)

(declare-fun choose!38 (array!95228 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46588)

(assert (=> d!150463 (= lt!611526 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150463 (validMask!0 mask!2840)))

(assert (=> d!150463 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!611526)))

(declare-fun bs!40501 () Bool)

(assert (= bs!40501 d!150463))

(assert (=> bs!40501 m!1277871))

(declare-fun m!1277969 () Bool)

(assert (=> bs!40501 m!1277969))

(assert (=> bs!40501 m!1277849))

(assert (=> b!1392060 d!150463))

(declare-fun d!150465 () Bool)

(declare-fun e!788388 () Bool)

(assert (=> d!150465 e!788388))

(declare-fun c!129646 () Bool)

(declare-fun lt!611555 () SeekEntryResult!10292)

(assert (=> d!150465 (= c!129646 (and ((_ is Intermediate!10292) lt!611555) (undefined!11104 lt!611555)))))

(declare-fun e!788387 () SeekEntryResult!10292)

(assert (=> d!150465 (= lt!611555 e!788387)))

(declare-fun c!129645 () Bool)

(assert (=> d!150465 (= c!129645 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!611554 () (_ BitVec 64))

(assert (=> d!150465 (= lt!611554 (select (arr!45975 a!2901) (toIndex!0 (select (arr!45975 a!2901) j!112) mask!2840)))))

(assert (=> d!150465 (validMask!0 mask!2840)))

(assert (=> d!150465 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45975 a!2901) j!112) mask!2840) (select (arr!45975 a!2901) j!112) a!2901 mask!2840) lt!611555)))

(declare-fun b!1392252 () Bool)

(assert (=> b!1392252 (and (bvsge (index!43541 lt!611555) #b00000000000000000000000000000000) (bvslt (index!43541 lt!611555) (size!46525 a!2901)))))

(declare-fun e!788389 () Bool)

(assert (=> b!1392252 (= e!788389 (= (select (arr!45975 a!2901) (index!43541 lt!611555)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1392253 () Bool)

(assert (=> b!1392253 (= e!788388 (bvsge (x!125220 lt!611555) #b01111111111111111111111111111110))))

(declare-fun b!1392254 () Bool)

(assert (=> b!1392254 (and (bvsge (index!43541 lt!611555) #b00000000000000000000000000000000) (bvslt (index!43541 lt!611555) (size!46525 a!2901)))))

(declare-fun res!931863 () Bool)

(assert (=> b!1392254 (= res!931863 (= (select (arr!45975 a!2901) (index!43541 lt!611555)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1392254 (=> res!931863 e!788389)))

(declare-fun b!1392255 () Bool)

(assert (=> b!1392255 (= e!788387 (Intermediate!10292 true (toIndex!0 (select (arr!45975 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun e!788386 () SeekEntryResult!10292)

(declare-fun b!1392256 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1392256 (= e!788386 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!45975 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!45975 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1392257 () Bool)

(assert (=> b!1392257 (= e!788387 e!788386)))

(declare-fun c!129647 () Bool)

(assert (=> b!1392257 (= c!129647 (or (= lt!611554 (select (arr!45975 a!2901) j!112)) (= (bvadd lt!611554 lt!611554) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1392258 () Bool)

(assert (=> b!1392258 (and (bvsge (index!43541 lt!611555) #b00000000000000000000000000000000) (bvslt (index!43541 lt!611555) (size!46525 a!2901)))))

(declare-fun res!931864 () Bool)

(assert (=> b!1392258 (= res!931864 (= (select (arr!45975 a!2901) (index!43541 lt!611555)) (select (arr!45975 a!2901) j!112)))))

(assert (=> b!1392258 (=> res!931864 e!788389)))

(declare-fun e!788390 () Bool)

(assert (=> b!1392258 (= e!788390 e!788389)))

(declare-fun b!1392259 () Bool)

(assert (=> b!1392259 (= e!788388 e!788390)))

(declare-fun res!931865 () Bool)

(assert (=> b!1392259 (= res!931865 (and ((_ is Intermediate!10292) lt!611555) (not (undefined!11104 lt!611555)) (bvslt (x!125220 lt!611555) #b01111111111111111111111111111110) (bvsge (x!125220 lt!611555) #b00000000000000000000000000000000) (bvsge (x!125220 lt!611555) #b00000000000000000000000000000000)))))

(assert (=> b!1392259 (=> (not res!931865) (not e!788390))))

(declare-fun b!1392260 () Bool)

(assert (=> b!1392260 (= e!788386 (Intermediate!10292 false (toIndex!0 (select (arr!45975 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(assert (= (and d!150465 c!129645) b!1392255))

(assert (= (and d!150465 (not c!129645)) b!1392257))

(assert (= (and b!1392257 c!129647) b!1392260))

(assert (= (and b!1392257 (not c!129647)) b!1392256))

(assert (= (and d!150465 c!129646) b!1392253))

(assert (= (and d!150465 (not c!129646)) b!1392259))

(assert (= (and b!1392259 res!931865) b!1392258))

(assert (= (and b!1392258 (not res!931864)) b!1392254))

(assert (= (and b!1392254 (not res!931863)) b!1392252))

(assert (=> b!1392256 m!1277865))

(declare-fun m!1277995 () Bool)

(assert (=> b!1392256 m!1277995))

(assert (=> b!1392256 m!1277995))

(assert (=> b!1392256 m!1277853))

(declare-fun m!1277997 () Bool)

(assert (=> b!1392256 m!1277997))

(assert (=> d!150465 m!1277865))

(declare-fun m!1277999 () Bool)

(assert (=> d!150465 m!1277999))

(assert (=> d!150465 m!1277849))

(declare-fun m!1278001 () Bool)

(assert (=> b!1392258 m!1278001))

(assert (=> b!1392252 m!1278001))

(assert (=> b!1392254 m!1278001))

(assert (=> b!1392060 d!150465))

(declare-fun d!150479 () Bool)

(declare-fun lt!611557 () (_ BitVec 32))

(declare-fun lt!611556 () (_ BitVec 32))

(assert (=> d!150479 (= lt!611557 (bvmul (bvxor lt!611556 (bvlshr lt!611556 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150479 (= lt!611556 ((_ extract 31 0) (bvand (bvxor (select (arr!45975 a!2901) j!112) (bvlshr (select (arr!45975 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150479 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!931805 (let ((h!33719 ((_ extract 31 0) (bvand (bvxor (select (arr!45975 a!2901) j!112) (bvlshr (select (arr!45975 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125222 (bvmul (bvxor h!33719 (bvlshr h!33719 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125222 (bvlshr x!125222 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!931805 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!931805 #b00000000000000000000000000000000))))))

(assert (=> d!150479 (= (toIndex!0 (select (arr!45975 a!2901) j!112) mask!2840) (bvand (bvxor lt!611557 (bvlshr lt!611557 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1392060 d!150479))

(declare-fun d!150481 () Bool)

(assert (=> d!150481 (= (validKeyInArray!0 (select (arr!45975 a!2901) i!1037)) (and (not (= (select (arr!45975 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45975 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1392057 d!150481))

(declare-fun bm!66777 () Bool)

(declare-fun call!66780 () Bool)

(declare-fun c!129659 () Bool)

(assert (=> bm!66777 (= call!66780 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129659 (Cons!32490 (select (arr!45975 a!2901) #b00000000000000000000000000000000) Nil!32491) Nil!32491)))))

(declare-fun b!1392298 () Bool)

(declare-fun e!788418 () Bool)

(declare-fun contains!9770 (List!32494 (_ BitVec 64)) Bool)

(assert (=> b!1392298 (= e!788418 (contains!9770 Nil!32491 (select (arr!45975 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150483 () Bool)

(declare-fun res!931881 () Bool)

(declare-fun e!788420 () Bool)

(assert (=> d!150483 (=> res!931881 e!788420)))

(assert (=> d!150483 (= res!931881 (bvsge #b00000000000000000000000000000000 (size!46525 a!2901)))))

(assert (=> d!150483 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32491) e!788420)))

(declare-fun b!1392299 () Bool)

(declare-fun e!788417 () Bool)

(assert (=> b!1392299 (= e!788420 e!788417)))

(declare-fun res!931883 () Bool)

(assert (=> b!1392299 (=> (not res!931883) (not e!788417))))

(assert (=> b!1392299 (= res!931883 (not e!788418))))

(declare-fun res!931882 () Bool)

(assert (=> b!1392299 (=> (not res!931882) (not e!788418))))

(assert (=> b!1392299 (= res!931882 (validKeyInArray!0 (select (arr!45975 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1392300 () Bool)

(declare-fun e!788419 () Bool)

(assert (=> b!1392300 (= e!788417 e!788419)))

(assert (=> b!1392300 (= c!129659 (validKeyInArray!0 (select (arr!45975 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1392301 () Bool)

(assert (=> b!1392301 (= e!788419 call!66780)))

(declare-fun b!1392302 () Bool)

(assert (=> b!1392302 (= e!788419 call!66780)))

(assert (= (and d!150483 (not res!931881)) b!1392299))

(assert (= (and b!1392299 res!931882) b!1392298))

(assert (= (and b!1392299 res!931883) b!1392300))

(assert (= (and b!1392300 c!129659) b!1392301))

(assert (= (and b!1392300 (not c!129659)) b!1392302))

(assert (= (or b!1392301 b!1392302) bm!66777))

(assert (=> bm!66777 m!1277915))

(declare-fun m!1278011 () Bool)

(assert (=> bm!66777 m!1278011))

(assert (=> b!1392298 m!1277915))

(assert (=> b!1392298 m!1277915))

(declare-fun m!1278013 () Bool)

(assert (=> b!1392298 m!1278013))

(assert (=> b!1392299 m!1277915))

(assert (=> b!1392299 m!1277915))

(assert (=> b!1392299 m!1277923))

(assert (=> b!1392300 m!1277915))

(assert (=> b!1392300 m!1277915))

(assert (=> b!1392300 m!1277923))

(assert (=> b!1392056 d!150483))

(check-sat (not bm!66770) (not d!150441) (not b!1392172) (not b!1392111) (not b!1392175) (not b!1392300) (not bm!66763) (not b!1392299) (not b!1392108) (not b!1392298) (not d!150463) (not b!1392166) (not b!1392256) (not d!150465) (not bm!66777))
(check-sat)
