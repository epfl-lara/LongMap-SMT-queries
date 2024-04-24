; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119396 () Bool)

(assert start!119396)

(declare-fun b!1391700 () Bool)

(declare-fun res!931177 () Bool)

(declare-fun e!788210 () Bool)

(assert (=> b!1391700 (=> (not res!931177) (not e!788210))))

(declare-datatypes ((array!95255 0))(
  ( (array!95256 (arr!45991 (Array (_ BitVec 32) (_ BitVec 64))) (size!46542 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95255)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391700 (= res!931177 (validKeyInArray!0 (select (arr!45991 a!2901) j!112)))))

(declare-fun b!1391702 () Bool)

(declare-fun res!931182 () Bool)

(assert (=> b!1391702 (=> (not res!931182) (not e!788210))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1391702 (= res!931182 (and (= (size!46542 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46542 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46542 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1391703 () Bool)

(declare-fun res!931178 () Bool)

(assert (=> b!1391703 (=> (not res!931178) (not e!788210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95255 (_ BitVec 32)) Bool)

(assert (=> b!1391703 (= res!931178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391704 () Bool)

(declare-fun res!931180 () Bool)

(assert (=> b!1391704 (=> (not res!931180) (not e!788210))))

(declare-datatypes ((List!32497 0))(
  ( (Nil!32494) (Cons!32493 (h!33719 (_ BitVec 64)) (t!47183 List!32497)) )
))
(declare-fun arrayNoDuplicates!0 (array!95255 (_ BitVec 32) List!32497) Bool)

(assert (=> b!1391704 (= res!931180 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32494))))

(declare-fun b!1391705 () Bool)

(declare-fun res!931181 () Bool)

(assert (=> b!1391705 (=> (not res!931181) (not e!788210))))

(assert (=> b!1391705 (= res!931181 (validKeyInArray!0 (select (arr!45991 a!2901) i!1037)))))

(declare-fun b!1391706 () Bool)

(declare-fun e!788208 () Bool)

(declare-datatypes ((SeekEntryResult!10211 0))(
  ( (MissingZero!10211 (index!43215 (_ BitVec 32))) (Found!10211 (index!43216 (_ BitVec 32))) (Intermediate!10211 (undefined!11023 Bool) (index!43217 (_ BitVec 32)) (x!125044 (_ BitVec 32))) (Undefined!10211) (MissingVacant!10211 (index!43218 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95255 (_ BitVec 32)) SeekEntryResult!10211)

(assert (=> b!1391706 (= e!788208 (= (seekEntryOrOpen!0 (select (arr!45991 a!2901) j!112) a!2901 mask!2840) (Found!10211 j!112)))))

(declare-fun res!931179 () Bool)

(assert (=> start!119396 (=> (not res!931179) (not e!788210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119396 (= res!931179 (validMask!0 mask!2840))))

(assert (=> start!119396 e!788210))

(assert (=> start!119396 true))

(declare-fun array_inv!35272 (array!95255) Bool)

(assert (=> start!119396 (array_inv!35272 a!2901)))

(declare-fun b!1391701 () Bool)

(declare-fun lt!611257 () SeekEntryResult!10211)

(get-info :version)

(assert (=> b!1391701 (= e!788210 (not (or (not ((_ is Intermediate!10211) lt!611257)) (undefined!11023 lt!611257) (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111))))))

(assert (=> b!1391701 e!788208))

(declare-fun res!931183 () Bool)

(assert (=> b!1391701 (=> (not res!931183) (not e!788208))))

(assert (=> b!1391701 (= res!931183 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46453 0))(
  ( (Unit!46454) )
))
(declare-fun lt!611258 () Unit!46453)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95255 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46453)

(assert (=> b!1391701 (= lt!611258 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95255 (_ BitVec 32)) SeekEntryResult!10211)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391701 (= lt!611257 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45991 a!2901) j!112) mask!2840) (select (arr!45991 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119396 res!931179) b!1391702))

(assert (= (and b!1391702 res!931182) b!1391705))

(assert (= (and b!1391705 res!931181) b!1391700))

(assert (= (and b!1391700 res!931177) b!1391703))

(assert (= (and b!1391703 res!931178) b!1391704))

(assert (= (and b!1391704 res!931180) b!1391701))

(assert (= (and b!1391701 res!931183) b!1391706))

(declare-fun m!1277809 () Bool)

(assert (=> b!1391704 m!1277809))

(declare-fun m!1277811 () Bool)

(assert (=> start!119396 m!1277811))

(declare-fun m!1277813 () Bool)

(assert (=> start!119396 m!1277813))

(declare-fun m!1277815 () Bool)

(assert (=> b!1391703 m!1277815))

(declare-fun m!1277817 () Bool)

(assert (=> b!1391705 m!1277817))

(assert (=> b!1391705 m!1277817))

(declare-fun m!1277819 () Bool)

(assert (=> b!1391705 m!1277819))

(declare-fun m!1277821 () Bool)

(assert (=> b!1391706 m!1277821))

(assert (=> b!1391706 m!1277821))

(declare-fun m!1277823 () Bool)

(assert (=> b!1391706 m!1277823))

(assert (=> b!1391700 m!1277821))

(assert (=> b!1391700 m!1277821))

(declare-fun m!1277825 () Bool)

(assert (=> b!1391700 m!1277825))

(assert (=> b!1391701 m!1277821))

(declare-fun m!1277827 () Bool)

(assert (=> b!1391701 m!1277827))

(assert (=> b!1391701 m!1277821))

(declare-fun m!1277829 () Bool)

(assert (=> b!1391701 m!1277829))

(assert (=> b!1391701 m!1277827))

(assert (=> b!1391701 m!1277821))

(declare-fun m!1277831 () Bool)

(assert (=> b!1391701 m!1277831))

(declare-fun m!1277833 () Bool)

(assert (=> b!1391701 m!1277833))

(check-sat (not start!119396) (not b!1391701) (not b!1391703) (not b!1391700) (not b!1391704) (not b!1391705) (not b!1391706))
(check-sat)
(get-model)

(declare-fun b!1391757 () Bool)

(declare-fun e!788235 () Bool)

(declare-fun call!66759 () Bool)

(assert (=> b!1391757 (= e!788235 call!66759)))

(declare-fun bm!66756 () Bool)

(assert (=> bm!66756 (= call!66759 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1391758 () Bool)

(declare-fun e!788237 () Bool)

(declare-fun e!788236 () Bool)

(assert (=> b!1391758 (= e!788237 e!788236)))

(declare-fun c!129715 () Bool)

(assert (=> b!1391758 (= c!129715 (validKeyInArray!0 (select (arr!45991 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1391759 () Bool)

(assert (=> b!1391759 (= e!788236 call!66759)))

(declare-fun b!1391760 () Bool)

(assert (=> b!1391760 (= e!788236 e!788235)))

(declare-fun lt!611278 () (_ BitVec 64))

(assert (=> b!1391760 (= lt!611278 (select (arr!45991 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!611279 () Unit!46453)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95255 (_ BitVec 64) (_ BitVec 32)) Unit!46453)

(assert (=> b!1391760 (= lt!611279 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611278 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1391760 (arrayContainsKey!0 a!2901 lt!611278 #b00000000000000000000000000000000)))

(declare-fun lt!611277 () Unit!46453)

(assert (=> b!1391760 (= lt!611277 lt!611279)))

(declare-fun res!931230 () Bool)

(assert (=> b!1391760 (= res!931230 (= (seekEntryOrOpen!0 (select (arr!45991 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10211 #b00000000000000000000000000000000)))))

(assert (=> b!1391760 (=> (not res!931230) (not e!788235))))

(declare-fun d!150543 () Bool)

(declare-fun res!931231 () Bool)

(assert (=> d!150543 (=> res!931231 e!788237)))

(assert (=> d!150543 (= res!931231 (bvsge #b00000000000000000000000000000000 (size!46542 a!2901)))))

(assert (=> d!150543 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!788237)))

(assert (= (and d!150543 (not res!931231)) b!1391758))

(assert (= (and b!1391758 c!129715) b!1391760))

(assert (= (and b!1391758 (not c!129715)) b!1391759))

(assert (= (and b!1391760 res!931230) b!1391757))

(assert (= (or b!1391757 b!1391759) bm!66756))

(declare-fun m!1277887 () Bool)

(assert (=> bm!66756 m!1277887))

(declare-fun m!1277889 () Bool)

(assert (=> b!1391758 m!1277889))

(assert (=> b!1391758 m!1277889))

(declare-fun m!1277891 () Bool)

(assert (=> b!1391758 m!1277891))

(assert (=> b!1391760 m!1277889))

(declare-fun m!1277893 () Bool)

(assert (=> b!1391760 m!1277893))

(declare-fun m!1277895 () Bool)

(assert (=> b!1391760 m!1277895))

(assert (=> b!1391760 m!1277889))

(declare-fun m!1277897 () Bool)

(assert (=> b!1391760 m!1277897))

(assert (=> b!1391703 d!150543))

(declare-fun d!150551 () Bool)

(assert (=> d!150551 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119396 d!150551))

(declare-fun d!150559 () Bool)

(assert (=> d!150559 (= (array_inv!35272 a!2901) (bvsge (size!46542 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119396 d!150559))

(declare-fun b!1391830 () Bool)

(declare-fun e!788280 () SeekEntryResult!10211)

(declare-fun lt!611312 () SeekEntryResult!10211)

(assert (=> b!1391830 (= e!788280 (Found!10211 (index!43217 lt!611312)))))

(declare-fun b!1391831 () Bool)

(declare-fun e!788281 () SeekEntryResult!10211)

(assert (=> b!1391831 (= e!788281 (MissingZero!10211 (index!43217 lt!611312)))))

(declare-fun b!1391832 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95255 (_ BitVec 32)) SeekEntryResult!10211)

(assert (=> b!1391832 (= e!788281 (seekKeyOrZeroReturnVacant!0 (x!125044 lt!611312) (index!43217 lt!611312) (index!43217 lt!611312) (select (arr!45991 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391833 () Bool)

(declare-fun e!788282 () SeekEntryResult!10211)

(assert (=> b!1391833 (= e!788282 Undefined!10211)))

(declare-fun d!150561 () Bool)

(declare-fun lt!611311 () SeekEntryResult!10211)

(assert (=> d!150561 (and (or ((_ is Undefined!10211) lt!611311) (not ((_ is Found!10211) lt!611311)) (and (bvsge (index!43216 lt!611311) #b00000000000000000000000000000000) (bvslt (index!43216 lt!611311) (size!46542 a!2901)))) (or ((_ is Undefined!10211) lt!611311) ((_ is Found!10211) lt!611311) (not ((_ is MissingZero!10211) lt!611311)) (and (bvsge (index!43215 lt!611311) #b00000000000000000000000000000000) (bvslt (index!43215 lt!611311) (size!46542 a!2901)))) (or ((_ is Undefined!10211) lt!611311) ((_ is Found!10211) lt!611311) ((_ is MissingZero!10211) lt!611311) (not ((_ is MissingVacant!10211) lt!611311)) (and (bvsge (index!43218 lt!611311) #b00000000000000000000000000000000) (bvslt (index!43218 lt!611311) (size!46542 a!2901)))) (or ((_ is Undefined!10211) lt!611311) (ite ((_ is Found!10211) lt!611311) (= (select (arr!45991 a!2901) (index!43216 lt!611311)) (select (arr!45991 a!2901) j!112)) (ite ((_ is MissingZero!10211) lt!611311) (= (select (arr!45991 a!2901) (index!43215 lt!611311)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10211) lt!611311) (= (select (arr!45991 a!2901) (index!43218 lt!611311)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!150561 (= lt!611311 e!788282)))

(declare-fun c!129744 () Bool)

(assert (=> d!150561 (= c!129744 (and ((_ is Intermediate!10211) lt!611312) (undefined!11023 lt!611312)))))

(assert (=> d!150561 (= lt!611312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45991 a!2901) j!112) mask!2840) (select (arr!45991 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!150561 (validMask!0 mask!2840)))

(assert (=> d!150561 (= (seekEntryOrOpen!0 (select (arr!45991 a!2901) j!112) a!2901 mask!2840) lt!611311)))

(declare-fun b!1391834 () Bool)

(declare-fun c!129743 () Bool)

(declare-fun lt!611310 () (_ BitVec 64))

(assert (=> b!1391834 (= c!129743 (= lt!611310 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1391834 (= e!788280 e!788281)))

(declare-fun b!1391835 () Bool)

(assert (=> b!1391835 (= e!788282 e!788280)))

(assert (=> b!1391835 (= lt!611310 (select (arr!45991 a!2901) (index!43217 lt!611312)))))

(declare-fun c!129745 () Bool)

(assert (=> b!1391835 (= c!129745 (= lt!611310 (select (arr!45991 a!2901) j!112)))))

(assert (= (and d!150561 c!129744) b!1391833))

(assert (= (and d!150561 (not c!129744)) b!1391835))

(assert (= (and b!1391835 c!129745) b!1391830))

(assert (= (and b!1391835 (not c!129745)) b!1391834))

(assert (= (and b!1391834 c!129743) b!1391831))

(assert (= (and b!1391834 (not c!129743)) b!1391832))

(assert (=> b!1391832 m!1277821))

(declare-fun m!1277923 () Bool)

(assert (=> b!1391832 m!1277923))

(assert (=> d!150561 m!1277811))

(assert (=> d!150561 m!1277821))

(assert (=> d!150561 m!1277827))

(declare-fun m!1277925 () Bool)

(assert (=> d!150561 m!1277925))

(declare-fun m!1277927 () Bool)

(assert (=> d!150561 m!1277927))

(assert (=> d!150561 m!1277827))

(assert (=> d!150561 m!1277821))

(assert (=> d!150561 m!1277831))

(declare-fun m!1277929 () Bool)

(assert (=> d!150561 m!1277929))

(declare-fun m!1277931 () Bool)

(assert (=> b!1391835 m!1277931))

(assert (=> b!1391706 d!150561))

(declare-fun b!1391836 () Bool)

(declare-fun e!788283 () Bool)

(declare-fun call!66766 () Bool)

(assert (=> b!1391836 (= e!788283 call!66766)))

(declare-fun bm!66763 () Bool)

(assert (=> bm!66763 (= call!66766 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1391837 () Bool)

(declare-fun e!788285 () Bool)

(declare-fun e!788284 () Bool)

(assert (=> b!1391837 (= e!788285 e!788284)))

(declare-fun c!129746 () Bool)

(assert (=> b!1391837 (= c!129746 (validKeyInArray!0 (select (arr!45991 a!2901) j!112)))))

(declare-fun b!1391838 () Bool)

(assert (=> b!1391838 (= e!788284 call!66766)))

(declare-fun b!1391839 () Bool)

(assert (=> b!1391839 (= e!788284 e!788283)))

(declare-fun lt!611314 () (_ BitVec 64))

(assert (=> b!1391839 (= lt!611314 (select (arr!45991 a!2901) j!112))))

(declare-fun lt!611315 () Unit!46453)

(assert (=> b!1391839 (= lt!611315 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!611314 j!112))))

(assert (=> b!1391839 (arrayContainsKey!0 a!2901 lt!611314 #b00000000000000000000000000000000)))

(declare-fun lt!611313 () Unit!46453)

(assert (=> b!1391839 (= lt!611313 lt!611315)))

(declare-fun res!931247 () Bool)

(assert (=> b!1391839 (= res!931247 (= (seekEntryOrOpen!0 (select (arr!45991 a!2901) j!112) a!2901 mask!2840) (Found!10211 j!112)))))

(assert (=> b!1391839 (=> (not res!931247) (not e!788283))))

(declare-fun d!150569 () Bool)

(declare-fun res!931248 () Bool)

(assert (=> d!150569 (=> res!931248 e!788285)))

(assert (=> d!150569 (= res!931248 (bvsge j!112 (size!46542 a!2901)))))

(assert (=> d!150569 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!788285)))

(assert (= (and d!150569 (not res!931248)) b!1391837))

(assert (= (and b!1391837 c!129746) b!1391839))

(assert (= (and b!1391837 (not c!129746)) b!1391838))

(assert (= (and b!1391839 res!931247) b!1391836))

(assert (= (or b!1391836 b!1391838) bm!66763))

(declare-fun m!1277933 () Bool)

(assert (=> bm!66763 m!1277933))

(assert (=> b!1391837 m!1277821))

(assert (=> b!1391837 m!1277821))

(assert (=> b!1391837 m!1277825))

(assert (=> b!1391839 m!1277821))

(declare-fun m!1277935 () Bool)

(assert (=> b!1391839 m!1277935))

(declare-fun m!1277937 () Bool)

(assert (=> b!1391839 m!1277937))

(assert (=> b!1391839 m!1277821))

(assert (=> b!1391839 m!1277823))

(assert (=> b!1391701 d!150569))

(declare-fun d!150571 () Bool)

(assert (=> d!150571 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!611324 () Unit!46453)

(declare-fun choose!38 (array!95255 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46453)

(assert (=> d!150571 (= lt!611324 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150571 (validMask!0 mask!2840)))

(assert (=> d!150571 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!611324)))

(declare-fun bs!40460 () Bool)

(assert (= bs!40460 d!150571))

(assert (=> bs!40460 m!1277833))

(declare-fun m!1277951 () Bool)

(assert (=> bs!40460 m!1277951))

(assert (=> bs!40460 m!1277811))

(assert (=> b!1391701 d!150571))

(declare-fun b!1391903 () Bool)

(declare-fun e!788324 () Bool)

(declare-fun e!788327 () Bool)

(assert (=> b!1391903 (= e!788324 e!788327)))

(declare-fun res!931273 () Bool)

(declare-fun lt!611348 () SeekEntryResult!10211)

(assert (=> b!1391903 (= res!931273 (and ((_ is Intermediate!10211) lt!611348) (not (undefined!11023 lt!611348)) (bvslt (x!125044 lt!611348) #b01111111111111111111111111111110) (bvsge (x!125044 lt!611348) #b00000000000000000000000000000000) (bvsge (x!125044 lt!611348) #b00000000000000000000000000000000)))))

(assert (=> b!1391903 (=> (not res!931273) (not e!788327))))

(declare-fun b!1391904 () Bool)

(declare-fun e!788325 () SeekEntryResult!10211)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391904 (= e!788325 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!45991 a!2901) j!112) mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (arr!45991 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391905 () Bool)

(assert (=> b!1391905 (and (bvsge (index!43217 lt!611348) #b00000000000000000000000000000000) (bvslt (index!43217 lt!611348) (size!46542 a!2901)))))

(declare-fun e!788323 () Bool)

(assert (=> b!1391905 (= e!788323 (= (select (arr!45991 a!2901) (index!43217 lt!611348)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1391906 () Bool)

(assert (=> b!1391906 (= e!788325 (Intermediate!10211 false (toIndex!0 (select (arr!45991 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1391907 () Bool)

(assert (=> b!1391907 (= e!788324 (bvsge (x!125044 lt!611348) #b01111111111111111111111111111110))))

(declare-fun d!150577 () Bool)

(assert (=> d!150577 e!788324))

(declare-fun c!129769 () Bool)

(assert (=> d!150577 (= c!129769 (and ((_ is Intermediate!10211) lt!611348) (undefined!11023 lt!611348)))))

(declare-fun e!788326 () SeekEntryResult!10211)

(assert (=> d!150577 (= lt!611348 e!788326)))

(declare-fun c!129768 () Bool)

(assert (=> d!150577 (= c!129768 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!611347 () (_ BitVec 64))

(assert (=> d!150577 (= lt!611347 (select (arr!45991 a!2901) (toIndex!0 (select (arr!45991 a!2901) j!112) mask!2840)))))

(assert (=> d!150577 (validMask!0 mask!2840)))

(assert (=> d!150577 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45991 a!2901) j!112) mask!2840) (select (arr!45991 a!2901) j!112) a!2901 mask!2840) lt!611348)))

(declare-fun b!1391908 () Bool)

(assert (=> b!1391908 (= e!788326 e!788325)))

(declare-fun c!129770 () Bool)

(assert (=> b!1391908 (= c!129770 (or (= lt!611347 (select (arr!45991 a!2901) j!112)) (= (bvadd lt!611347 lt!611347) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1391909 () Bool)

(assert (=> b!1391909 (and (bvsge (index!43217 lt!611348) #b00000000000000000000000000000000) (bvslt (index!43217 lt!611348) (size!46542 a!2901)))))

(declare-fun res!931271 () Bool)

(assert (=> b!1391909 (= res!931271 (= (select (arr!45991 a!2901) (index!43217 lt!611348)) (select (arr!45991 a!2901) j!112)))))

(assert (=> b!1391909 (=> res!931271 e!788323)))

(assert (=> b!1391909 (= e!788327 e!788323)))

(declare-fun b!1391910 () Bool)

(assert (=> b!1391910 (and (bvsge (index!43217 lt!611348) #b00000000000000000000000000000000) (bvslt (index!43217 lt!611348) (size!46542 a!2901)))))

(declare-fun res!931272 () Bool)

(assert (=> b!1391910 (= res!931272 (= (select (arr!45991 a!2901) (index!43217 lt!611348)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1391910 (=> res!931272 e!788323)))

(declare-fun b!1391911 () Bool)

(assert (=> b!1391911 (= e!788326 (Intermediate!10211 true (toIndex!0 (select (arr!45991 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(assert (= (and d!150577 c!129768) b!1391911))

(assert (= (and d!150577 (not c!129768)) b!1391908))

(assert (= (and b!1391908 c!129770) b!1391906))

(assert (= (and b!1391908 (not c!129770)) b!1391904))

(assert (= (and d!150577 c!129769) b!1391907))

(assert (= (and d!150577 (not c!129769)) b!1391903))

(assert (= (and b!1391903 res!931273) b!1391909))

(assert (= (and b!1391909 (not res!931271)) b!1391910))

(assert (= (and b!1391910 (not res!931272)) b!1391905))

(assert (=> b!1391904 m!1277827))

(declare-fun m!1277969 () Bool)

(assert (=> b!1391904 m!1277969))

(assert (=> b!1391904 m!1277969))

(assert (=> b!1391904 m!1277821))

(declare-fun m!1277971 () Bool)

(assert (=> b!1391904 m!1277971))

(declare-fun m!1277973 () Bool)

(assert (=> b!1391905 m!1277973))

(assert (=> b!1391909 m!1277973))

(assert (=> d!150577 m!1277827))

(declare-fun m!1277975 () Bool)

(assert (=> d!150577 m!1277975))

(assert (=> d!150577 m!1277811))

(assert (=> b!1391910 m!1277973))

(assert (=> b!1391701 d!150577))

(declare-fun d!150585 () Bool)

(declare-fun lt!611363 () (_ BitVec 32))

(declare-fun lt!611362 () (_ BitVec 32))

(assert (=> d!150585 (= lt!611363 (bvmul (bvxor lt!611362 (bvlshr lt!611362 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150585 (= lt!611362 ((_ extract 31 0) (bvand (bvxor (select (arr!45991 a!2901) j!112) (bvlshr (select (arr!45991 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150585 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!931274 (let ((h!33723 ((_ extract 31 0) (bvand (bvxor (select (arr!45991 a!2901) j!112) (bvlshr (select (arr!45991 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125050 (bvmul (bvxor h!33723 (bvlshr h!33723 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125050 (bvlshr x!125050 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!931274 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!931274 #b00000000000000000000000000000000))))))

(assert (=> d!150585 (= (toIndex!0 (select (arr!45991 a!2901) j!112) mask!2840) (bvand (bvxor lt!611363 (bvlshr lt!611363 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1391701 d!150585))

(declare-fun d!150593 () Bool)

(assert (=> d!150593 (= (validKeyInArray!0 (select (arr!45991 a!2901) j!112)) (and (not (= (select (arr!45991 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45991 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1391700 d!150593))

(declare-fun d!150597 () Bool)

(assert (=> d!150597 (= (validKeyInArray!0 (select (arr!45991 a!2901) i!1037)) (and (not (= (select (arr!45991 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45991 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1391705 d!150597))

(declare-fun b!1391953 () Bool)

(declare-fun e!788356 () Bool)

(declare-fun e!788355 () Bool)

(assert (=> b!1391953 (= e!788356 e!788355)))

(declare-fun res!931292 () Bool)

(assert (=> b!1391953 (=> (not res!931292) (not e!788355))))

(declare-fun e!788357 () Bool)

(assert (=> b!1391953 (= res!931292 (not e!788357))))

(declare-fun res!931294 () Bool)

(assert (=> b!1391953 (=> (not res!931294) (not e!788357))))

(assert (=> b!1391953 (= res!931294 (validKeyInArray!0 (select (arr!45991 a!2901) #b00000000000000000000000000000000)))))

(declare-fun d!150599 () Bool)

(declare-fun res!931293 () Bool)

(assert (=> d!150599 (=> res!931293 e!788356)))

(assert (=> d!150599 (= res!931293 (bvsge #b00000000000000000000000000000000 (size!46542 a!2901)))))

(assert (=> d!150599 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32494) e!788356)))

(declare-fun b!1391954 () Bool)

(declare-fun e!788354 () Bool)

(assert (=> b!1391954 (= e!788355 e!788354)))

(declare-fun c!129783 () Bool)

(assert (=> b!1391954 (= c!129783 (validKeyInArray!0 (select (arr!45991 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1391955 () Bool)

(declare-fun call!66773 () Bool)

(assert (=> b!1391955 (= e!788354 call!66773)))

(declare-fun b!1391956 () Bool)

(declare-fun contains!9804 (List!32497 (_ BitVec 64)) Bool)

(assert (=> b!1391956 (= e!788357 (contains!9804 Nil!32494 (select (arr!45991 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66770 () Bool)

(assert (=> bm!66770 (= call!66773 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129783 (Cons!32493 (select (arr!45991 a!2901) #b00000000000000000000000000000000) Nil!32494) Nil!32494)))))

(declare-fun b!1391957 () Bool)

(assert (=> b!1391957 (= e!788354 call!66773)))

(assert (= (and d!150599 (not res!931293)) b!1391953))

(assert (= (and b!1391953 res!931294) b!1391956))

(assert (= (and b!1391953 res!931292) b!1391954))

(assert (= (and b!1391954 c!129783) b!1391955))

(assert (= (and b!1391954 (not c!129783)) b!1391957))

(assert (= (or b!1391955 b!1391957) bm!66770))

(assert (=> b!1391953 m!1277889))

(assert (=> b!1391953 m!1277889))

(assert (=> b!1391953 m!1277891))

(assert (=> b!1391954 m!1277889))

(assert (=> b!1391954 m!1277889))

(assert (=> b!1391954 m!1277891))

(assert (=> b!1391956 m!1277889))

(assert (=> b!1391956 m!1277889))

(declare-fun m!1277997 () Bool)

(assert (=> b!1391956 m!1277997))

(assert (=> bm!66770 m!1277889))

(declare-fun m!1277999 () Bool)

(assert (=> bm!66770 m!1277999))

(assert (=> b!1391704 d!150599))

(check-sat (not bm!66770) (not b!1391837) (not b!1391832) (not b!1391904) (not d!150561) (not d!150571) (not b!1391956) (not bm!66756) (not b!1391758) (not d!150577) (not b!1391839) (not b!1391953) (not bm!66763) (not b!1391954) (not b!1391760))
(check-sat)
