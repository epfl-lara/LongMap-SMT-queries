; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51826 () Bool)

(assert start!51826)

(declare-fun b!566792 () Bool)

(declare-fun res!357566 () Bool)

(declare-fun e!326190 () Bool)

(assert (=> b!566792 (=> (not res!357566) (not e!326190))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!566792 (= res!357566 (validKeyInArray!0 k0!1914))))

(declare-fun b!566793 () Bool)

(declare-fun e!326189 () Bool)

(declare-datatypes ((SeekEntryResult!5535 0))(
  ( (MissingZero!5535 (index!24367 (_ BitVec 32))) (Found!5535 (index!24368 (_ BitVec 32))) (Intermediate!5535 (undefined!6347 Bool) (index!24369 (_ BitVec 32)) (x!53234 (_ BitVec 32))) (Undefined!5535) (MissingVacant!5535 (index!24370 (_ BitVec 32))) )
))
(declare-fun lt!258305 () SeekEntryResult!5535)

(declare-datatypes ((array!35577 0))(
  ( (array!35578 (arr!17086 (Array (_ BitVec 32) (_ BitVec 64))) (size!17450 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35577)

(get-info :version)

(assert (=> b!566793 (= e!326189 (not (or (not ((_ is Intermediate!5535) lt!258305)) (undefined!6347 lt!258305) (and (bvsge (index!24369 lt!258305) #b00000000000000000000000000000000) (bvslt (index!24369 lt!258305) (size!17450 a!3118))))))))

(declare-fun e!326186 () Bool)

(assert (=> b!566793 e!326186))

(declare-fun res!357562 () Bool)

(assert (=> b!566793 (=> (not res!357562) (not e!326186))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35577 (_ BitVec 32)) Bool)

(assert (=> b!566793 (= res!357562 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17772 0))(
  ( (Unit!17773) )
))
(declare-fun lt!258303 () Unit!17772)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35577 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17772)

(assert (=> b!566793 (= lt!258303 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!566794 () Bool)

(declare-fun res!357560 () Bool)

(assert (=> b!566794 (=> (not res!357560) (not e!326190))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!566794 (= res!357560 (and (= (size!17450 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17450 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17450 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!566795 () Bool)

(declare-fun e!326187 () Bool)

(assert (=> b!566795 (= e!326187 e!326189)))

(declare-fun res!357564 () Bool)

(assert (=> b!566795 (=> (not res!357564) (not e!326189))))

(declare-fun lt!258304 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35577 (_ BitVec 32)) SeekEntryResult!5535)

(assert (=> b!566795 (= res!357564 (= lt!258305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258304 (select (store (arr!17086 a!3118) i!1132 k0!1914) j!142) (array!35578 (store (arr!17086 a!3118) i!1132 k0!1914) (size!17450 a!3118)) mask!3119)))))

(declare-fun lt!258306 () (_ BitVec 32))

(assert (=> b!566795 (= lt!258305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258306 (select (arr!17086 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!566795 (= lt!258304 (toIndex!0 (select (store (arr!17086 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!566795 (= lt!258306 (toIndex!0 (select (arr!17086 a!3118) j!142) mask!3119))))

(declare-fun res!357569 () Bool)

(assert (=> start!51826 (=> (not res!357569) (not e!326190))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51826 (= res!357569 (validMask!0 mask!3119))))

(assert (=> start!51826 e!326190))

(assert (=> start!51826 true))

(declare-fun array_inv!12882 (array!35577) Bool)

(assert (=> start!51826 (array_inv!12882 a!3118)))

(declare-fun b!566796 () Bool)

(assert (=> b!566796 (= e!326190 e!326187)))

(declare-fun res!357567 () Bool)

(assert (=> b!566796 (=> (not res!357567) (not e!326187))))

(declare-fun lt!258307 () SeekEntryResult!5535)

(assert (=> b!566796 (= res!357567 (or (= lt!258307 (MissingZero!5535 i!1132)) (= lt!258307 (MissingVacant!5535 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35577 (_ BitVec 32)) SeekEntryResult!5535)

(assert (=> b!566796 (= lt!258307 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!566797 () Bool)

(assert (=> b!566797 (= e!326186 (= (seekEntryOrOpen!0 (select (arr!17086 a!3118) j!142) a!3118 mask!3119) (Found!5535 j!142)))))

(declare-fun b!566798 () Bool)

(declare-fun res!357565 () Bool)

(assert (=> b!566798 (=> (not res!357565) (not e!326187))))

(declare-datatypes ((List!11166 0))(
  ( (Nil!11163) (Cons!11162 (h!12171 (_ BitVec 64)) (t!17394 List!11166)) )
))
(declare-fun arrayNoDuplicates!0 (array!35577 (_ BitVec 32) List!11166) Bool)

(assert (=> b!566798 (= res!357565 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11163))))

(declare-fun b!566799 () Bool)

(declare-fun res!357563 () Bool)

(assert (=> b!566799 (=> (not res!357563) (not e!326190))))

(declare-fun arrayContainsKey!0 (array!35577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!566799 (= res!357563 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!566800 () Bool)

(declare-fun res!357561 () Bool)

(assert (=> b!566800 (=> (not res!357561) (not e!326190))))

(assert (=> b!566800 (= res!357561 (validKeyInArray!0 (select (arr!17086 a!3118) j!142)))))

(declare-fun b!566801 () Bool)

(declare-fun res!357568 () Bool)

(assert (=> b!566801 (=> (not res!357568) (not e!326187))))

(assert (=> b!566801 (= res!357568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51826 res!357569) b!566794))

(assert (= (and b!566794 res!357560) b!566800))

(assert (= (and b!566800 res!357561) b!566792))

(assert (= (and b!566792 res!357566) b!566799))

(assert (= (and b!566799 res!357563) b!566796))

(assert (= (and b!566796 res!357567) b!566801))

(assert (= (and b!566801 res!357568) b!566798))

(assert (= (and b!566798 res!357565) b!566795))

(assert (= (and b!566795 res!357564) b!566793))

(assert (= (and b!566793 res!357562) b!566797))

(declare-fun m!545397 () Bool)

(assert (=> b!566800 m!545397))

(assert (=> b!566800 m!545397))

(declare-fun m!545399 () Bool)

(assert (=> b!566800 m!545399))

(declare-fun m!545401 () Bool)

(assert (=> b!566798 m!545401))

(declare-fun m!545403 () Bool)

(assert (=> start!51826 m!545403))

(declare-fun m!545405 () Bool)

(assert (=> start!51826 m!545405))

(declare-fun m!545407 () Bool)

(assert (=> b!566799 m!545407))

(declare-fun m!545409 () Bool)

(assert (=> b!566793 m!545409))

(declare-fun m!545411 () Bool)

(assert (=> b!566793 m!545411))

(declare-fun m!545413 () Bool)

(assert (=> b!566796 m!545413))

(assert (=> b!566795 m!545397))

(declare-fun m!545415 () Bool)

(assert (=> b!566795 m!545415))

(assert (=> b!566795 m!545397))

(declare-fun m!545417 () Bool)

(assert (=> b!566795 m!545417))

(declare-fun m!545419 () Bool)

(assert (=> b!566795 m!545419))

(assert (=> b!566795 m!545397))

(declare-fun m!545421 () Bool)

(assert (=> b!566795 m!545421))

(assert (=> b!566795 m!545417))

(declare-fun m!545423 () Bool)

(assert (=> b!566795 m!545423))

(assert (=> b!566795 m!545417))

(declare-fun m!545425 () Bool)

(assert (=> b!566795 m!545425))

(declare-fun m!545427 () Bool)

(assert (=> b!566801 m!545427))

(declare-fun m!545429 () Bool)

(assert (=> b!566792 m!545429))

(assert (=> b!566797 m!545397))

(assert (=> b!566797 m!545397))

(declare-fun m!545431 () Bool)

(assert (=> b!566797 m!545431))

(check-sat (not b!566799) (not b!566800) (not b!566796) (not b!566798) (not b!566797) (not b!566792) (not b!566801) (not b!566793) (not b!566795) (not start!51826))
(check-sat)
(get-model)

(declare-fun b!566866 () Bool)

(declare-fun lt!258340 () SeekEntryResult!5535)

(declare-fun e!326229 () SeekEntryResult!5535)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35577 (_ BitVec 32)) SeekEntryResult!5535)

(assert (=> b!566866 (= e!326229 (seekKeyOrZeroReturnVacant!0 (x!53234 lt!258340) (index!24369 lt!258340) (index!24369 lt!258340) (select (arr!17086 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!566867 () Bool)

(assert (=> b!566867 (= e!326229 (MissingZero!5535 (index!24369 lt!258340)))))

(declare-fun b!566868 () Bool)

(declare-fun e!326231 () SeekEntryResult!5535)

(assert (=> b!566868 (= e!326231 (Found!5535 (index!24369 lt!258340)))))

(declare-fun b!566869 () Bool)

(declare-fun e!326230 () SeekEntryResult!5535)

(assert (=> b!566869 (= e!326230 e!326231)))

(declare-fun lt!258338 () (_ BitVec 64))

(assert (=> b!566869 (= lt!258338 (select (arr!17086 a!3118) (index!24369 lt!258340)))))

(declare-fun c!64976 () Bool)

(assert (=> b!566869 (= c!64976 (= lt!258338 (select (arr!17086 a!3118) j!142)))))

(declare-fun d!84189 () Bool)

(declare-fun lt!258339 () SeekEntryResult!5535)

(assert (=> d!84189 (and (or ((_ is Undefined!5535) lt!258339) (not ((_ is Found!5535) lt!258339)) (and (bvsge (index!24368 lt!258339) #b00000000000000000000000000000000) (bvslt (index!24368 lt!258339) (size!17450 a!3118)))) (or ((_ is Undefined!5535) lt!258339) ((_ is Found!5535) lt!258339) (not ((_ is MissingZero!5535) lt!258339)) (and (bvsge (index!24367 lt!258339) #b00000000000000000000000000000000) (bvslt (index!24367 lt!258339) (size!17450 a!3118)))) (or ((_ is Undefined!5535) lt!258339) ((_ is Found!5535) lt!258339) ((_ is MissingZero!5535) lt!258339) (not ((_ is MissingVacant!5535) lt!258339)) (and (bvsge (index!24370 lt!258339) #b00000000000000000000000000000000) (bvslt (index!24370 lt!258339) (size!17450 a!3118)))) (or ((_ is Undefined!5535) lt!258339) (ite ((_ is Found!5535) lt!258339) (= (select (arr!17086 a!3118) (index!24368 lt!258339)) (select (arr!17086 a!3118) j!142)) (ite ((_ is MissingZero!5535) lt!258339) (= (select (arr!17086 a!3118) (index!24367 lt!258339)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5535) lt!258339) (= (select (arr!17086 a!3118) (index!24370 lt!258339)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84189 (= lt!258339 e!326230)))

(declare-fun c!64977 () Bool)

(assert (=> d!84189 (= c!64977 (and ((_ is Intermediate!5535) lt!258340) (undefined!6347 lt!258340)))))

(assert (=> d!84189 (= lt!258340 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17086 a!3118) j!142) mask!3119) (select (arr!17086 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84189 (validMask!0 mask!3119)))

(assert (=> d!84189 (= (seekEntryOrOpen!0 (select (arr!17086 a!3118) j!142) a!3118 mask!3119) lt!258339)))

(declare-fun b!566870 () Bool)

(declare-fun c!64978 () Bool)

(assert (=> b!566870 (= c!64978 (= lt!258338 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!566870 (= e!326231 e!326229)))

(declare-fun b!566871 () Bool)

(assert (=> b!566871 (= e!326230 Undefined!5535)))

(assert (= (and d!84189 c!64977) b!566871))

(assert (= (and d!84189 (not c!64977)) b!566869))

(assert (= (and b!566869 c!64976) b!566868))

(assert (= (and b!566869 (not c!64976)) b!566870))

(assert (= (and b!566870 c!64978) b!566867))

(assert (= (and b!566870 (not c!64978)) b!566866))

(assert (=> b!566866 m!545397))

(declare-fun m!545481 () Bool)

(assert (=> b!566866 m!545481))

(declare-fun m!545483 () Bool)

(assert (=> b!566869 m!545483))

(declare-fun m!545485 () Bool)

(assert (=> d!84189 m!545485))

(declare-fun m!545487 () Bool)

(assert (=> d!84189 m!545487))

(assert (=> d!84189 m!545403))

(assert (=> d!84189 m!545415))

(assert (=> d!84189 m!545397))

(declare-fun m!545489 () Bool)

(assert (=> d!84189 m!545489))

(assert (=> d!84189 m!545397))

(assert (=> d!84189 m!545415))

(declare-fun m!545491 () Bool)

(assert (=> d!84189 m!545491))

(assert (=> b!566797 d!84189))

(declare-fun d!84197 () Bool)

(assert (=> d!84197 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!566792 d!84197))

(declare-fun b!566911 () Bool)

(declare-fun e!326258 () Bool)

(declare-fun call!32507 () Bool)

(assert (=> b!566911 (= e!326258 call!32507)))

(declare-fun b!566912 () Bool)

(declare-fun e!326259 () Bool)

(declare-fun contains!2868 (List!11166 (_ BitVec 64)) Bool)

(assert (=> b!566912 (= e!326259 (contains!2868 Nil!11163 (select (arr!17086 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!566913 () Bool)

(declare-fun e!326256 () Bool)

(assert (=> b!566913 (= e!326256 e!326258)))

(declare-fun c!64994 () Bool)

(assert (=> b!566913 (= c!64994 (validKeyInArray!0 (select (arr!17086 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!566914 () Bool)

(declare-fun e!326257 () Bool)

(assert (=> b!566914 (= e!326257 e!326256)))

(declare-fun res!357623 () Bool)

(assert (=> b!566914 (=> (not res!357623) (not e!326256))))

(assert (=> b!566914 (= res!357623 (not e!326259))))

(declare-fun res!357621 () Bool)

(assert (=> b!566914 (=> (not res!357621) (not e!326259))))

(assert (=> b!566914 (= res!357621 (validKeyInArray!0 (select (arr!17086 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!566915 () Bool)

(assert (=> b!566915 (= e!326258 call!32507)))

(declare-fun d!84199 () Bool)

(declare-fun res!357622 () Bool)

(assert (=> d!84199 (=> res!357622 e!326257)))

(assert (=> d!84199 (= res!357622 (bvsge #b00000000000000000000000000000000 (size!17450 a!3118)))))

(assert (=> d!84199 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11163) e!326257)))

(declare-fun bm!32504 () Bool)

(assert (=> bm!32504 (= call!32507 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64994 (Cons!11162 (select (arr!17086 a!3118) #b00000000000000000000000000000000) Nil!11163) Nil!11163)))))

(assert (= (and d!84199 (not res!357622)) b!566914))

(assert (= (and b!566914 res!357621) b!566912))

(assert (= (and b!566914 res!357623) b!566913))

(assert (= (and b!566913 c!64994) b!566915))

(assert (= (and b!566913 (not c!64994)) b!566911))

(assert (= (or b!566915 b!566911) bm!32504))

(declare-fun m!545527 () Bool)

(assert (=> b!566912 m!545527))

(assert (=> b!566912 m!545527))

(declare-fun m!545529 () Bool)

(assert (=> b!566912 m!545529))

(assert (=> b!566913 m!545527))

(assert (=> b!566913 m!545527))

(declare-fun m!545531 () Bool)

(assert (=> b!566913 m!545531))

(assert (=> b!566914 m!545527))

(assert (=> b!566914 m!545527))

(assert (=> b!566914 m!545531))

(assert (=> bm!32504 m!545527))

(declare-fun m!545533 () Bool)

(assert (=> bm!32504 m!545533))

(assert (=> b!566798 d!84199))

(declare-fun b!566924 () Bool)

(declare-fun e!326268 () Bool)

(declare-fun e!326266 () Bool)

(assert (=> b!566924 (= e!326268 e!326266)))

(declare-fun lt!258360 () (_ BitVec 64))

(assert (=> b!566924 (= lt!258360 (select (arr!17086 a!3118) j!142))))

(declare-fun lt!258361 () Unit!17772)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35577 (_ BitVec 64) (_ BitVec 32)) Unit!17772)

(assert (=> b!566924 (= lt!258361 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258360 j!142))))

(assert (=> b!566924 (arrayContainsKey!0 a!3118 lt!258360 #b00000000000000000000000000000000)))

(declare-fun lt!258359 () Unit!17772)

(assert (=> b!566924 (= lt!258359 lt!258361)))

(declare-fun res!357628 () Bool)

(assert (=> b!566924 (= res!357628 (= (seekEntryOrOpen!0 (select (arr!17086 a!3118) j!142) a!3118 mask!3119) (Found!5535 j!142)))))

(assert (=> b!566924 (=> (not res!357628) (not e!326266))))

(declare-fun call!32510 () Bool)

(declare-fun bm!32507 () Bool)

(assert (=> bm!32507 (= call!32510 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!566926 () Bool)

(assert (=> b!566926 (= e!326268 call!32510)))

(declare-fun b!566927 () Bool)

(declare-fun e!326267 () Bool)

(assert (=> b!566927 (= e!326267 e!326268)))

(declare-fun c!64997 () Bool)

(assert (=> b!566927 (= c!64997 (validKeyInArray!0 (select (arr!17086 a!3118) j!142)))))

(declare-fun d!84207 () Bool)

(declare-fun res!357629 () Bool)

(assert (=> d!84207 (=> res!357629 e!326267)))

(assert (=> d!84207 (= res!357629 (bvsge j!142 (size!17450 a!3118)))))

(assert (=> d!84207 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!326267)))

(declare-fun b!566925 () Bool)

(assert (=> b!566925 (= e!326266 call!32510)))

(assert (= (and d!84207 (not res!357629)) b!566927))

(assert (= (and b!566927 c!64997) b!566924))

(assert (= (and b!566927 (not c!64997)) b!566926))

(assert (= (and b!566924 res!357628) b!566925))

(assert (= (or b!566925 b!566926) bm!32507))

(assert (=> b!566924 m!545397))

(declare-fun m!545535 () Bool)

(assert (=> b!566924 m!545535))

(declare-fun m!545537 () Bool)

(assert (=> b!566924 m!545537))

(assert (=> b!566924 m!545397))

(assert (=> b!566924 m!545431))

(declare-fun m!545539 () Bool)

(assert (=> bm!32507 m!545539))

(assert (=> b!566927 m!545397))

(assert (=> b!566927 m!545397))

(assert (=> b!566927 m!545399))

(assert (=> b!566793 d!84207))

(declare-fun d!84211 () Bool)

(assert (=> d!84211 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!258370 () Unit!17772)

(declare-fun choose!38 (array!35577 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17772)

(assert (=> d!84211 (= lt!258370 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84211 (validMask!0 mask!3119)))

(assert (=> d!84211 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!258370)))

(declare-fun bs!17602 () Bool)

(assert (= bs!17602 d!84211))

(assert (=> bs!17602 m!545409))

(declare-fun m!545543 () Bool)

(assert (=> bs!17602 m!545543))

(assert (=> bs!17602 m!545403))

(assert (=> b!566793 d!84211))

(declare-fun d!84219 () Bool)

(declare-fun res!357644 () Bool)

(declare-fun e!326292 () Bool)

(assert (=> d!84219 (=> res!357644 e!326292)))

(assert (=> d!84219 (= res!357644 (= (select (arr!17086 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84219 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!326292)))

(declare-fun b!566960 () Bool)

(declare-fun e!326293 () Bool)

(assert (=> b!566960 (= e!326292 e!326293)))

(declare-fun res!357645 () Bool)

(assert (=> b!566960 (=> (not res!357645) (not e!326293))))

(assert (=> b!566960 (= res!357645 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17450 a!3118)))))

(declare-fun b!566961 () Bool)

(assert (=> b!566961 (= e!326293 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84219 (not res!357644)) b!566960))

(assert (= (and b!566960 res!357645) b!566961))

(assert (=> d!84219 m!545527))

(declare-fun m!545559 () Bool)

(assert (=> b!566961 m!545559))

(assert (=> b!566799 d!84219))

(declare-fun d!84223 () Bool)

(assert (=> d!84223 (= (validKeyInArray!0 (select (arr!17086 a!3118) j!142)) (and (not (= (select (arr!17086 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17086 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!566800 d!84223))

(declare-fun b!567026 () Bool)

(declare-fun e!326333 () SeekEntryResult!5535)

(assert (=> b!567026 (= e!326333 (Intermediate!5535 false lt!258304 #b00000000000000000000000000000000))))

(declare-fun b!567027 () Bool)

(declare-fun e!326334 () SeekEntryResult!5535)

(assert (=> b!567027 (= e!326334 e!326333)))

(declare-fun lt!258392 () (_ BitVec 64))

(declare-fun c!65029 () Bool)

(assert (=> b!567027 (= c!65029 (or (= lt!258392 (select (store (arr!17086 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!258392 lt!258392) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!567028 () Bool)

(declare-fun lt!258393 () SeekEntryResult!5535)

(assert (=> b!567028 (and (bvsge (index!24369 lt!258393) #b00000000000000000000000000000000) (bvslt (index!24369 lt!258393) (size!17450 (array!35578 (store (arr!17086 a!3118) i!1132 k0!1914) (size!17450 a!3118)))))))

(declare-fun res!357673 () Bool)

(assert (=> b!567028 (= res!357673 (= (select (arr!17086 (array!35578 (store (arr!17086 a!3118) i!1132 k0!1914) (size!17450 a!3118))) (index!24369 lt!258393)) (select (store (arr!17086 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun e!326332 () Bool)

(assert (=> b!567028 (=> res!357673 e!326332)))

(declare-fun e!326335 () Bool)

(assert (=> b!567028 (= e!326335 e!326332)))

(declare-fun b!567029 () Bool)

(declare-fun e!326336 () Bool)

(assert (=> b!567029 (= e!326336 (bvsge (x!53234 lt!258393) #b01111111111111111111111111111110))))

(declare-fun b!567030 () Bool)

(assert (=> b!567030 (and (bvsge (index!24369 lt!258393) #b00000000000000000000000000000000) (bvslt (index!24369 lt!258393) (size!17450 (array!35578 (store (arr!17086 a!3118) i!1132 k0!1914) (size!17450 a!3118)))))))

(assert (=> b!567030 (= e!326332 (= (select (arr!17086 (array!35578 (store (arr!17086 a!3118) i!1132 k0!1914) (size!17450 a!3118))) (index!24369 lt!258393)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!84225 () Bool)

(assert (=> d!84225 e!326336))

(declare-fun c!65027 () Bool)

(assert (=> d!84225 (= c!65027 (and ((_ is Intermediate!5535) lt!258393) (undefined!6347 lt!258393)))))

(assert (=> d!84225 (= lt!258393 e!326334)))

(declare-fun c!65028 () Bool)

(assert (=> d!84225 (= c!65028 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84225 (= lt!258392 (select (arr!17086 (array!35578 (store (arr!17086 a!3118) i!1132 k0!1914) (size!17450 a!3118))) lt!258304))))

(assert (=> d!84225 (validMask!0 mask!3119)))

(assert (=> d!84225 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258304 (select (store (arr!17086 a!3118) i!1132 k0!1914) j!142) (array!35578 (store (arr!17086 a!3118) i!1132 k0!1914) (size!17450 a!3118)) mask!3119) lt!258393)))

(declare-fun b!567031 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!567031 (= e!326333 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258304 #b00000000000000000000000000000000 mask!3119) (select (store (arr!17086 a!3118) i!1132 k0!1914) j!142) (array!35578 (store (arr!17086 a!3118) i!1132 k0!1914) (size!17450 a!3118)) mask!3119))))

(declare-fun b!567032 () Bool)

(assert (=> b!567032 (= e!326334 (Intermediate!5535 true lt!258304 #b00000000000000000000000000000000))))

(declare-fun b!567033 () Bool)

(assert (=> b!567033 (= e!326336 e!326335)))

(declare-fun res!357671 () Bool)

(assert (=> b!567033 (= res!357671 (and ((_ is Intermediate!5535) lt!258393) (not (undefined!6347 lt!258393)) (bvslt (x!53234 lt!258393) #b01111111111111111111111111111110) (bvsge (x!53234 lt!258393) #b00000000000000000000000000000000) (bvsge (x!53234 lt!258393) #b00000000000000000000000000000000)))))

(assert (=> b!567033 (=> (not res!357671) (not e!326335))))

(declare-fun b!567034 () Bool)

(assert (=> b!567034 (and (bvsge (index!24369 lt!258393) #b00000000000000000000000000000000) (bvslt (index!24369 lt!258393) (size!17450 (array!35578 (store (arr!17086 a!3118) i!1132 k0!1914) (size!17450 a!3118)))))))

(declare-fun res!357672 () Bool)

(assert (=> b!567034 (= res!357672 (= (select (arr!17086 (array!35578 (store (arr!17086 a!3118) i!1132 k0!1914) (size!17450 a!3118))) (index!24369 lt!258393)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!567034 (=> res!357672 e!326332)))

(assert (= (and d!84225 c!65028) b!567032))

(assert (= (and d!84225 (not c!65028)) b!567027))

(assert (= (and b!567027 c!65029) b!567026))

(assert (= (and b!567027 (not c!65029)) b!567031))

(assert (= (and d!84225 c!65027) b!567029))

(assert (= (and d!84225 (not c!65027)) b!567033))

(assert (= (and b!567033 res!357671) b!567028))

(assert (= (and b!567028 (not res!357673)) b!567034))

(assert (= (and b!567034 (not res!357672)) b!567030))

(declare-fun m!545579 () Bool)

(assert (=> b!567028 m!545579))

(declare-fun m!545581 () Bool)

(assert (=> d!84225 m!545581))

(assert (=> d!84225 m!545403))

(assert (=> b!567034 m!545579))

(assert (=> b!567030 m!545579))

(declare-fun m!545583 () Bool)

(assert (=> b!567031 m!545583))

(assert (=> b!567031 m!545583))

(assert (=> b!567031 m!545417))

(declare-fun m!545587 () Bool)

(assert (=> b!567031 m!545587))

(assert (=> b!566795 d!84225))

(declare-fun b!567039 () Bool)

(declare-fun e!326341 () SeekEntryResult!5535)

(assert (=> b!567039 (= e!326341 (Intermediate!5535 false lt!258306 #b00000000000000000000000000000000))))

(declare-fun b!567040 () Bool)

(declare-fun e!326342 () SeekEntryResult!5535)

(assert (=> b!567040 (= e!326342 e!326341)))

(declare-fun lt!258397 () (_ BitVec 64))

(declare-fun c!65033 () Bool)

(assert (=> b!567040 (= c!65033 (or (= lt!258397 (select (arr!17086 a!3118) j!142)) (= (bvadd lt!258397 lt!258397) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!567041 () Bool)

(declare-fun lt!258398 () SeekEntryResult!5535)

(assert (=> b!567041 (and (bvsge (index!24369 lt!258398) #b00000000000000000000000000000000) (bvslt (index!24369 lt!258398) (size!17450 a!3118)))))

(declare-fun res!357678 () Bool)

(assert (=> b!567041 (= res!357678 (= (select (arr!17086 a!3118) (index!24369 lt!258398)) (select (arr!17086 a!3118) j!142)))))

(declare-fun e!326340 () Bool)

(assert (=> b!567041 (=> res!357678 e!326340)))

(declare-fun e!326343 () Bool)

(assert (=> b!567041 (= e!326343 e!326340)))

(declare-fun b!567042 () Bool)

(declare-fun e!326344 () Bool)

(assert (=> b!567042 (= e!326344 (bvsge (x!53234 lt!258398) #b01111111111111111111111111111110))))

(declare-fun b!567043 () Bool)

(assert (=> b!567043 (and (bvsge (index!24369 lt!258398) #b00000000000000000000000000000000) (bvslt (index!24369 lt!258398) (size!17450 a!3118)))))

(assert (=> b!567043 (= e!326340 (= (select (arr!17086 a!3118) (index!24369 lt!258398)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!84239 () Bool)

(assert (=> d!84239 e!326344))

(declare-fun c!65031 () Bool)

(assert (=> d!84239 (= c!65031 (and ((_ is Intermediate!5535) lt!258398) (undefined!6347 lt!258398)))))

(assert (=> d!84239 (= lt!258398 e!326342)))

(declare-fun c!65032 () Bool)

(assert (=> d!84239 (= c!65032 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84239 (= lt!258397 (select (arr!17086 a!3118) lt!258306))))

(assert (=> d!84239 (validMask!0 mask!3119)))

(assert (=> d!84239 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258306 (select (arr!17086 a!3118) j!142) a!3118 mask!3119) lt!258398)))

(declare-fun b!567044 () Bool)

(assert (=> b!567044 (= e!326341 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258306 #b00000000000000000000000000000000 mask!3119) (select (arr!17086 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!567045 () Bool)

(assert (=> b!567045 (= e!326342 (Intermediate!5535 true lt!258306 #b00000000000000000000000000000000))))

(declare-fun b!567046 () Bool)

(assert (=> b!567046 (= e!326344 e!326343)))

(declare-fun res!357676 () Bool)

(assert (=> b!567046 (= res!357676 (and ((_ is Intermediate!5535) lt!258398) (not (undefined!6347 lt!258398)) (bvslt (x!53234 lt!258398) #b01111111111111111111111111111110) (bvsge (x!53234 lt!258398) #b00000000000000000000000000000000) (bvsge (x!53234 lt!258398) #b00000000000000000000000000000000)))))

(assert (=> b!567046 (=> (not res!357676) (not e!326343))))

(declare-fun b!567047 () Bool)

(assert (=> b!567047 (and (bvsge (index!24369 lt!258398) #b00000000000000000000000000000000) (bvslt (index!24369 lt!258398) (size!17450 a!3118)))))

(declare-fun res!357677 () Bool)

(assert (=> b!567047 (= res!357677 (= (select (arr!17086 a!3118) (index!24369 lt!258398)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!567047 (=> res!357677 e!326340)))

(assert (= (and d!84239 c!65032) b!567045))

(assert (= (and d!84239 (not c!65032)) b!567040))

(assert (= (and b!567040 c!65033) b!567039))

(assert (= (and b!567040 (not c!65033)) b!567044))

(assert (= (and d!84239 c!65031) b!567042))

(assert (= (and d!84239 (not c!65031)) b!567046))

(assert (= (and b!567046 res!357676) b!567041))

(assert (= (and b!567041 (not res!357678)) b!567047))

(assert (= (and b!567047 (not res!357677)) b!567043))

(declare-fun m!545593 () Bool)

(assert (=> b!567041 m!545593))

(declare-fun m!545595 () Bool)

(assert (=> d!84239 m!545595))

(assert (=> d!84239 m!545403))

(assert (=> b!567047 m!545593))

(assert (=> b!567043 m!545593))

(declare-fun m!545597 () Bool)

(assert (=> b!567044 m!545597))

(assert (=> b!567044 m!545597))

(assert (=> b!567044 m!545397))

(declare-fun m!545599 () Bool)

(assert (=> b!567044 m!545599))

(assert (=> b!566795 d!84239))

(declare-fun d!84243 () Bool)

(declare-fun lt!258418 () (_ BitVec 32))

(declare-fun lt!258417 () (_ BitVec 32))

(assert (=> d!84243 (= lt!258418 (bvmul (bvxor lt!258417 (bvlshr lt!258417 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84243 (= lt!258417 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17086 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17086 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84243 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!357679 (let ((h!12174 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17086 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17086 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53239 (bvmul (bvxor h!12174 (bvlshr h!12174 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53239 (bvlshr x!53239 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!357679 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!357679 #b00000000000000000000000000000000))))))

(assert (=> d!84243 (= (toIndex!0 (select (store (arr!17086 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!258418 (bvlshr lt!258418 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!566795 d!84243))

(declare-fun d!84253 () Bool)

(declare-fun lt!258420 () (_ BitVec 32))

(declare-fun lt!258419 () (_ BitVec 32))

(assert (=> d!84253 (= lt!258420 (bvmul (bvxor lt!258419 (bvlshr lt!258419 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84253 (= lt!258419 ((_ extract 31 0) (bvand (bvxor (select (arr!17086 a!3118) j!142) (bvlshr (select (arr!17086 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84253 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!357679 (let ((h!12174 ((_ extract 31 0) (bvand (bvxor (select (arr!17086 a!3118) j!142) (bvlshr (select (arr!17086 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53239 (bvmul (bvxor h!12174 (bvlshr h!12174 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53239 (bvlshr x!53239 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!357679 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!357679 #b00000000000000000000000000000000))))))

(assert (=> d!84253 (= (toIndex!0 (select (arr!17086 a!3118) j!142) mask!3119) (bvand (bvxor lt!258420 (bvlshr lt!258420 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!566795 d!84253))

(declare-fun b!567052 () Bool)

(declare-fun e!326350 () Bool)

(declare-fun e!326348 () Bool)

(assert (=> b!567052 (= e!326350 e!326348)))

(declare-fun lt!258422 () (_ BitVec 64))

(assert (=> b!567052 (= lt!258422 (select (arr!17086 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!258423 () Unit!17772)

(assert (=> b!567052 (= lt!258423 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258422 #b00000000000000000000000000000000))))

(assert (=> b!567052 (arrayContainsKey!0 a!3118 lt!258422 #b00000000000000000000000000000000)))

(declare-fun lt!258421 () Unit!17772)

(assert (=> b!567052 (= lt!258421 lt!258423)))

(declare-fun res!357682 () Bool)

(assert (=> b!567052 (= res!357682 (= (seekEntryOrOpen!0 (select (arr!17086 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5535 #b00000000000000000000000000000000)))))

(assert (=> b!567052 (=> (not res!357682) (not e!326348))))

(declare-fun bm!32512 () Bool)

(declare-fun call!32515 () Bool)

(assert (=> bm!32512 (= call!32515 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!567054 () Bool)

(assert (=> b!567054 (= e!326350 call!32515)))

(declare-fun b!567055 () Bool)

(declare-fun e!326349 () Bool)

(assert (=> b!567055 (= e!326349 e!326350)))

(declare-fun c!65035 () Bool)

(assert (=> b!567055 (= c!65035 (validKeyInArray!0 (select (arr!17086 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84255 () Bool)

(declare-fun res!357683 () Bool)

(assert (=> d!84255 (=> res!357683 e!326349)))

(assert (=> d!84255 (= res!357683 (bvsge #b00000000000000000000000000000000 (size!17450 a!3118)))))

(assert (=> d!84255 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!326349)))

(declare-fun b!567053 () Bool)

(assert (=> b!567053 (= e!326348 call!32515)))

(assert (= (and d!84255 (not res!357683)) b!567055))

(assert (= (and b!567055 c!65035) b!567052))

(assert (= (and b!567055 (not c!65035)) b!567054))

(assert (= (and b!567052 res!357682) b!567053))

(assert (= (or b!567053 b!567054) bm!32512))

(assert (=> b!567052 m!545527))

(declare-fun m!545609 () Bool)

(assert (=> b!567052 m!545609))

(declare-fun m!545611 () Bool)

(assert (=> b!567052 m!545611))

(assert (=> b!567052 m!545527))

(declare-fun m!545613 () Bool)

(assert (=> b!567052 m!545613))

(declare-fun m!545615 () Bool)

(assert (=> bm!32512 m!545615))

(assert (=> b!567055 m!545527))

(assert (=> b!567055 m!545527))

(assert (=> b!567055 m!545531))

(assert (=> b!566801 d!84255))

(declare-fun lt!258426 () SeekEntryResult!5535)

(declare-fun e!326351 () SeekEntryResult!5535)

(declare-fun b!567056 () Bool)

(assert (=> b!567056 (= e!326351 (seekKeyOrZeroReturnVacant!0 (x!53234 lt!258426) (index!24369 lt!258426) (index!24369 lt!258426) k0!1914 a!3118 mask!3119))))

(declare-fun b!567057 () Bool)

(assert (=> b!567057 (= e!326351 (MissingZero!5535 (index!24369 lt!258426)))))

(declare-fun b!567058 () Bool)

(declare-fun e!326353 () SeekEntryResult!5535)

(assert (=> b!567058 (= e!326353 (Found!5535 (index!24369 lt!258426)))))

(declare-fun b!567059 () Bool)

(declare-fun e!326352 () SeekEntryResult!5535)

(assert (=> b!567059 (= e!326352 e!326353)))

(declare-fun lt!258424 () (_ BitVec 64))

(assert (=> b!567059 (= lt!258424 (select (arr!17086 a!3118) (index!24369 lt!258426)))))

(declare-fun c!65036 () Bool)

(assert (=> b!567059 (= c!65036 (= lt!258424 k0!1914))))

(declare-fun d!84257 () Bool)

(declare-fun lt!258425 () SeekEntryResult!5535)

(assert (=> d!84257 (and (or ((_ is Undefined!5535) lt!258425) (not ((_ is Found!5535) lt!258425)) (and (bvsge (index!24368 lt!258425) #b00000000000000000000000000000000) (bvslt (index!24368 lt!258425) (size!17450 a!3118)))) (or ((_ is Undefined!5535) lt!258425) ((_ is Found!5535) lt!258425) (not ((_ is MissingZero!5535) lt!258425)) (and (bvsge (index!24367 lt!258425) #b00000000000000000000000000000000) (bvslt (index!24367 lt!258425) (size!17450 a!3118)))) (or ((_ is Undefined!5535) lt!258425) ((_ is Found!5535) lt!258425) ((_ is MissingZero!5535) lt!258425) (not ((_ is MissingVacant!5535) lt!258425)) (and (bvsge (index!24370 lt!258425) #b00000000000000000000000000000000) (bvslt (index!24370 lt!258425) (size!17450 a!3118)))) (or ((_ is Undefined!5535) lt!258425) (ite ((_ is Found!5535) lt!258425) (= (select (arr!17086 a!3118) (index!24368 lt!258425)) k0!1914) (ite ((_ is MissingZero!5535) lt!258425) (= (select (arr!17086 a!3118) (index!24367 lt!258425)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5535) lt!258425) (= (select (arr!17086 a!3118) (index!24370 lt!258425)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84257 (= lt!258425 e!326352)))

(declare-fun c!65037 () Bool)

(assert (=> d!84257 (= c!65037 (and ((_ is Intermediate!5535) lt!258426) (undefined!6347 lt!258426)))))

(assert (=> d!84257 (= lt!258426 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84257 (validMask!0 mask!3119)))

(assert (=> d!84257 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!258425)))

(declare-fun b!567060 () Bool)

(declare-fun c!65038 () Bool)

(assert (=> b!567060 (= c!65038 (= lt!258424 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!567060 (= e!326353 e!326351)))

(declare-fun b!567061 () Bool)

(assert (=> b!567061 (= e!326352 Undefined!5535)))

(assert (= (and d!84257 c!65037) b!567061))

(assert (= (and d!84257 (not c!65037)) b!567059))

(assert (= (and b!567059 c!65036) b!567058))

(assert (= (and b!567059 (not c!65036)) b!567060))

(assert (= (and b!567060 c!65038) b!567057))

(assert (= (and b!567060 (not c!65038)) b!567056))

(declare-fun m!545617 () Bool)

(assert (=> b!567056 m!545617))

(declare-fun m!545619 () Bool)

(assert (=> b!567059 m!545619))

(declare-fun m!545621 () Bool)

(assert (=> d!84257 m!545621))

(declare-fun m!545623 () Bool)

(assert (=> d!84257 m!545623))

(assert (=> d!84257 m!545403))

(declare-fun m!545625 () Bool)

(assert (=> d!84257 m!545625))

(declare-fun m!545627 () Bool)

(assert (=> d!84257 m!545627))

(assert (=> d!84257 m!545625))

(declare-fun m!545629 () Bool)

(assert (=> d!84257 m!545629))

(assert (=> b!566796 d!84257))

(declare-fun d!84259 () Bool)

(assert (=> d!84259 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51826 d!84259))

(declare-fun d!84265 () Bool)

(assert (=> d!84265 (= (array_inv!12882 a!3118) (bvsge (size!17450 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51826 d!84265))

(check-sat (not bm!32507) (not b!567044) (not bm!32512) (not b!567056) (not d!84189) (not d!84257) (not d!84239) (not b!566866) (not b!566913) (not b!567052) (not b!567031) (not b!566927) (not b!566924) (not bm!32504) (not b!566961) (not b!566914) (not b!567055) (not d!84225) (not b!566912) (not d!84211))
(check-sat)
