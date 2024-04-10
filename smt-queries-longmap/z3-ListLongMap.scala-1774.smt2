; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32292 () Bool)

(assert start!32292)

(declare-fun b!321824 () Bool)

(declare-fun res!175950 () Bool)

(declare-fun e!199292 () Bool)

(assert (=> b!321824 (=> (not res!175950) (not e!199292))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321824 (= res!175950 (validKeyInArray!0 k0!2497))))

(declare-fun b!321825 () Bool)

(declare-fun res!175953 () Bool)

(assert (=> b!321825 (=> (not res!175953) (not e!199292))))

(declare-datatypes ((array!16482 0))(
  ( (array!16483 (arr!7800 (Array (_ BitVec 32) (_ BitVec 64))) (size!8152 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16482)

(declare-fun arrayContainsKey!0 (array!16482 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321825 (= res!175953 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321826 () Bool)

(declare-fun res!175944 () Bool)

(assert (=> b!321826 (=> (not res!175944) (not e!199292))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16482 (_ BitVec 32)) Bool)

(assert (=> b!321826 (= res!175944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321827 () Bool)

(declare-fun res!175946 () Bool)

(declare-fun e!199294 () Bool)

(assert (=> b!321827 (=> (not res!175946) (not e!199294))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!321827 (= res!175946 (and (= (select (arr!7800 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8152 a!3305))))))

(declare-fun b!321829 () Bool)

(declare-fun lt!156267 () (_ BitVec 32))

(assert (=> b!321829 (= e!199294 (and (bvsge mask!3777 #b00000000000000000000000000000000) (or (bvslt lt!156267 #b00000000000000000000000000000000) (bvsge lt!156267 (bvadd #b00000000000000000000000000000001 mask!3777)))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321829 (= lt!156267 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!321830 () Bool)

(declare-fun res!175951 () Bool)

(assert (=> b!321830 (=> (not res!175951) (not e!199294))))

(assert (=> b!321830 (= res!175951 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7800 a!3305) index!1840) k0!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7800 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7800 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!321831 () Bool)

(declare-fun res!175949 () Bool)

(assert (=> b!321831 (=> (not res!175949) (not e!199294))))

(declare-datatypes ((SeekEntryResult!2931 0))(
  ( (MissingZero!2931 (index!13900 (_ BitVec 32))) (Found!2931 (index!13901 (_ BitVec 32))) (Intermediate!2931 (undefined!3743 Bool) (index!13902 (_ BitVec 32)) (x!32158 (_ BitVec 32))) (Undefined!2931) (MissingVacant!2931 (index!13903 (_ BitVec 32))) )
))
(declare-fun lt!156266 () SeekEntryResult!2931)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16482 (_ BitVec 32)) SeekEntryResult!2931)

(assert (=> b!321831 (= res!175949 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156266))))

(declare-fun b!321828 () Bool)

(assert (=> b!321828 (= e!199292 e!199294)))

(declare-fun res!175948 () Bool)

(assert (=> b!321828 (=> (not res!175948) (not e!199294))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321828 (= res!175948 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156266))))

(assert (=> b!321828 (= lt!156266 (Intermediate!2931 false resIndex!58 resX!58))))

(declare-fun res!175945 () Bool)

(assert (=> start!32292 (=> (not res!175945) (not e!199292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32292 (= res!175945 (validMask!0 mask!3777))))

(assert (=> start!32292 e!199292))

(declare-fun array_inv!5763 (array!16482) Bool)

(assert (=> start!32292 (array_inv!5763 a!3305)))

(assert (=> start!32292 true))

(declare-fun b!321832 () Bool)

(declare-fun res!175952 () Bool)

(assert (=> b!321832 (=> (not res!175952) (not e!199292))))

(assert (=> b!321832 (= res!175952 (and (= (size!8152 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8152 a!3305))))))

(declare-fun b!321833 () Bool)

(declare-fun res!175947 () Bool)

(assert (=> b!321833 (=> (not res!175947) (not e!199292))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16482 (_ BitVec 32)) SeekEntryResult!2931)

(assert (=> b!321833 (= res!175947 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2931 i!1250)))))

(assert (= (and start!32292 res!175945) b!321832))

(assert (= (and b!321832 res!175952) b!321824))

(assert (= (and b!321824 res!175950) b!321825))

(assert (= (and b!321825 res!175953) b!321833))

(assert (= (and b!321833 res!175947) b!321826))

(assert (= (and b!321826 res!175944) b!321828))

(assert (= (and b!321828 res!175948) b!321827))

(assert (= (and b!321827 res!175946) b!321831))

(assert (= (and b!321831 res!175949) b!321830))

(assert (= (and b!321830 res!175951) b!321829))

(declare-fun m!329891 () Bool)

(assert (=> b!321825 m!329891))

(declare-fun m!329893 () Bool)

(assert (=> b!321827 m!329893))

(declare-fun m!329895 () Bool)

(assert (=> b!321826 m!329895))

(declare-fun m!329897 () Bool)

(assert (=> b!321833 m!329897))

(declare-fun m!329899 () Bool)

(assert (=> b!321830 m!329899))

(declare-fun m!329901 () Bool)

(assert (=> b!321831 m!329901))

(declare-fun m!329903 () Bool)

(assert (=> b!321824 m!329903))

(declare-fun m!329905 () Bool)

(assert (=> start!32292 m!329905))

(declare-fun m!329907 () Bool)

(assert (=> start!32292 m!329907))

(declare-fun m!329909 () Bool)

(assert (=> b!321828 m!329909))

(assert (=> b!321828 m!329909))

(declare-fun m!329911 () Bool)

(assert (=> b!321828 m!329911))

(declare-fun m!329913 () Bool)

(assert (=> b!321829 m!329913))

(check-sat (not b!321824) (not b!321833) (not b!321826) (not b!321828) (not start!32292) (not b!321825) (not b!321831) (not b!321829))
(check-sat)
(get-model)

(declare-fun d!69523 () Bool)

(assert (=> d!69523 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32292 d!69523))

(declare-fun d!69525 () Bool)

(assert (=> d!69525 (= (array_inv!5763 a!3305) (bvsge (size!8152 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32292 d!69525))

(declare-fun bm!26062 () Bool)

(declare-fun call!26065 () Bool)

(assert (=> bm!26062 (= call!26065 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun d!69527 () Bool)

(declare-fun res!175989 () Bool)

(declare-fun e!199311 () Bool)

(assert (=> d!69527 (=> res!175989 e!199311)))

(assert (=> d!69527 (= res!175989 (bvsge #b00000000000000000000000000000000 (size!8152 a!3305)))))

(assert (=> d!69527 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!199311)))

(declare-fun b!321872 () Bool)

(declare-fun e!199312 () Bool)

(declare-fun e!199310 () Bool)

(assert (=> b!321872 (= e!199312 e!199310)))

(declare-fun lt!156281 () (_ BitVec 64))

(assert (=> b!321872 (= lt!156281 (select (arr!7800 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9830 0))(
  ( (Unit!9831) )
))
(declare-fun lt!156280 () Unit!9830)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16482 (_ BitVec 64) (_ BitVec 32)) Unit!9830)

(assert (=> b!321872 (= lt!156280 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!156281 #b00000000000000000000000000000000))))

(assert (=> b!321872 (arrayContainsKey!0 a!3305 lt!156281 #b00000000000000000000000000000000)))

(declare-fun lt!156282 () Unit!9830)

(assert (=> b!321872 (= lt!156282 lt!156280)))

(declare-fun res!175988 () Bool)

(assert (=> b!321872 (= res!175988 (= (seekEntryOrOpen!0 (select (arr!7800 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!2931 #b00000000000000000000000000000000)))))

(assert (=> b!321872 (=> (not res!175988) (not e!199310))))

(declare-fun b!321873 () Bool)

(assert (=> b!321873 (= e!199310 call!26065)))

(declare-fun b!321874 () Bool)

(assert (=> b!321874 (= e!199312 call!26065)))

(declare-fun b!321875 () Bool)

(assert (=> b!321875 (= e!199311 e!199312)))

(declare-fun c!50568 () Bool)

(assert (=> b!321875 (= c!50568 (validKeyInArray!0 (select (arr!7800 a!3305) #b00000000000000000000000000000000)))))

(assert (= (and d!69527 (not res!175989)) b!321875))

(assert (= (and b!321875 c!50568) b!321872))

(assert (= (and b!321875 (not c!50568)) b!321874))

(assert (= (and b!321872 res!175988) b!321873))

(assert (= (or b!321873 b!321874) bm!26062))

(declare-fun m!329939 () Bool)

(assert (=> bm!26062 m!329939))

(declare-fun m!329941 () Bool)

(assert (=> b!321872 m!329941))

(declare-fun m!329943 () Bool)

(assert (=> b!321872 m!329943))

(declare-fun m!329945 () Bool)

(assert (=> b!321872 m!329945))

(assert (=> b!321872 m!329941))

(declare-fun m!329947 () Bool)

(assert (=> b!321872 m!329947))

(assert (=> b!321875 m!329941))

(assert (=> b!321875 m!329941))

(declare-fun m!329949 () Bool)

(assert (=> b!321875 m!329949))

(assert (=> b!321826 d!69527))

(declare-fun b!321939 () Bool)

(declare-fun e!199352 () SeekEntryResult!2931)

(assert (=> b!321939 (= e!199352 (Intermediate!2931 true index!1840 x!1490))))

(declare-fun e!199349 () SeekEntryResult!2931)

(declare-fun b!321940 () Bool)

(assert (=> b!321940 (= e!199349 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 x!1490 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!321942 () Bool)

(assert (=> b!321942 (= e!199349 (Intermediate!2931 false index!1840 x!1490))))

(declare-fun b!321943 () Bool)

(declare-fun lt!156297 () SeekEntryResult!2931)

(assert (=> b!321943 (and (bvsge (index!13902 lt!156297) #b00000000000000000000000000000000) (bvslt (index!13902 lt!156297) (size!8152 a!3305)))))

(declare-fun e!199350 () Bool)

(assert (=> b!321943 (= e!199350 (= (select (arr!7800 a!3305) (index!13902 lt!156297)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!321944 () Bool)

(declare-fun e!199351 () Bool)

(declare-fun e!199348 () Bool)

(assert (=> b!321944 (= e!199351 e!199348)))

(declare-fun res!176011 () Bool)

(get-info :version)

(assert (=> b!321944 (= res!176011 (and ((_ is Intermediate!2931) lt!156297) (not (undefined!3743 lt!156297)) (bvslt (x!32158 lt!156297) #b01111111111111111111111111111110) (bvsge (x!32158 lt!156297) #b00000000000000000000000000000000) (bvsge (x!32158 lt!156297) x!1490)))))

(assert (=> b!321944 (=> (not res!176011) (not e!199348))))

(declare-fun b!321945 () Bool)

(assert (=> b!321945 (and (bvsge (index!13902 lt!156297) #b00000000000000000000000000000000) (bvslt (index!13902 lt!156297) (size!8152 a!3305)))))

(declare-fun res!176012 () Bool)

(assert (=> b!321945 (= res!176012 (= (select (arr!7800 a!3305) (index!13902 lt!156297)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!321945 (=> res!176012 e!199350)))

(declare-fun b!321946 () Bool)

(assert (=> b!321946 (= e!199352 e!199349)))

(declare-fun c!50591 () Bool)

(declare-fun lt!156298 () (_ BitVec 64))

(assert (=> b!321946 (= c!50591 (or (= lt!156298 k0!2497) (= (bvadd lt!156298 lt!156298) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!321947 () Bool)

(assert (=> b!321947 (= e!199351 (bvsge (x!32158 lt!156297) #b01111111111111111111111111111110))))

(declare-fun d!69531 () Bool)

(assert (=> d!69531 e!199351))

(declare-fun c!50590 () Bool)

(assert (=> d!69531 (= c!50590 (and ((_ is Intermediate!2931) lt!156297) (undefined!3743 lt!156297)))))

(assert (=> d!69531 (= lt!156297 e!199352)))

(declare-fun c!50592 () Bool)

(assert (=> d!69531 (= c!50592 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!69531 (= lt!156298 (select (arr!7800 a!3305) index!1840))))

(assert (=> d!69531 (validMask!0 mask!3777)))

(assert (=> d!69531 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156297)))

(declare-fun b!321941 () Bool)

(assert (=> b!321941 (and (bvsge (index!13902 lt!156297) #b00000000000000000000000000000000) (bvslt (index!13902 lt!156297) (size!8152 a!3305)))))

(declare-fun res!176013 () Bool)

(assert (=> b!321941 (= res!176013 (= (select (arr!7800 a!3305) (index!13902 lt!156297)) k0!2497))))

(assert (=> b!321941 (=> res!176013 e!199350)))

(assert (=> b!321941 (= e!199348 e!199350)))

(assert (= (and d!69531 c!50592) b!321939))

(assert (= (and d!69531 (not c!50592)) b!321946))

(assert (= (and b!321946 c!50591) b!321942))

(assert (= (and b!321946 (not c!50591)) b!321940))

(assert (= (and d!69531 c!50590) b!321947))

(assert (= (and d!69531 (not c!50590)) b!321944))

(assert (= (and b!321944 res!176011) b!321941))

(assert (= (and b!321941 (not res!176013)) b!321945))

(assert (= (and b!321945 (not res!176012)) b!321943))

(declare-fun m!329953 () Bool)

(assert (=> b!321945 m!329953))

(assert (=> d!69531 m!329899))

(assert (=> d!69531 m!329905))

(assert (=> b!321941 m!329953))

(assert (=> b!321940 m!329913))

(assert (=> b!321940 m!329913))

(declare-fun m!329957 () Bool)

(assert (=> b!321940 m!329957))

(assert (=> b!321943 m!329953))

(assert (=> b!321831 d!69531))

(declare-fun d!69539 () Bool)

(declare-fun res!176024 () Bool)

(declare-fun e!199367 () Bool)

(assert (=> d!69539 (=> res!176024 e!199367)))

(assert (=> d!69539 (= res!176024 (= (select (arr!7800 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!69539 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!199367)))

(declare-fun b!321970 () Bool)

(declare-fun e!199368 () Bool)

(assert (=> b!321970 (= e!199367 e!199368)))

(declare-fun res!176025 () Bool)

(assert (=> b!321970 (=> (not res!176025) (not e!199368))))

(assert (=> b!321970 (= res!176025 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8152 a!3305)))))

(declare-fun b!321971 () Bool)

(assert (=> b!321971 (= e!199368 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69539 (not res!176024)) b!321970))

(assert (= (and b!321970 res!176025) b!321971))

(assert (=> d!69539 m!329941))

(declare-fun m!329963 () Bool)

(assert (=> b!321971 m!329963))

(assert (=> b!321825 d!69539))

(declare-fun d!69543 () Bool)

(assert (=> d!69543 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!321824 d!69543))

(declare-fun d!69547 () Bool)

(declare-fun lt!156305 () (_ BitVec 32))

(assert (=> d!69547 (and (bvsge lt!156305 #b00000000000000000000000000000000) (bvslt lt!156305 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69547 (= lt!156305 (choose!52 index!1840 x!1490 mask!3777))))

(assert (=> d!69547 (validMask!0 mask!3777)))

(assert (=> d!69547 (= (nextIndex!0 index!1840 x!1490 mask!3777) lt!156305)))

(declare-fun bs!11228 () Bool)

(assert (= bs!11228 d!69547))

(declare-fun m!329973 () Bool)

(assert (=> bs!11228 m!329973))

(assert (=> bs!11228 m!329905))

(assert (=> b!321829 d!69547))

(declare-fun b!321972 () Bool)

(declare-fun e!199373 () SeekEntryResult!2931)

(assert (=> b!321972 (= e!199373 (Intermediate!2931 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun e!199370 () SeekEntryResult!2931)

(declare-fun b!321973 () Bool)

(assert (=> b!321973 (= e!199370 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000 mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!321975 () Bool)

(assert (=> b!321975 (= e!199370 (Intermediate!2931 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!321976 () Bool)

(declare-fun lt!156306 () SeekEntryResult!2931)

(assert (=> b!321976 (and (bvsge (index!13902 lt!156306) #b00000000000000000000000000000000) (bvslt (index!13902 lt!156306) (size!8152 a!3305)))))

(declare-fun e!199371 () Bool)

(assert (=> b!321976 (= e!199371 (= (select (arr!7800 a!3305) (index!13902 lt!156306)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!321977 () Bool)

(declare-fun e!199372 () Bool)

(declare-fun e!199369 () Bool)

(assert (=> b!321977 (= e!199372 e!199369)))

(declare-fun res!176027 () Bool)

(assert (=> b!321977 (= res!176027 (and ((_ is Intermediate!2931) lt!156306) (not (undefined!3743 lt!156306)) (bvslt (x!32158 lt!156306) #b01111111111111111111111111111110) (bvsge (x!32158 lt!156306) #b00000000000000000000000000000000) (bvsge (x!32158 lt!156306) #b00000000000000000000000000000000)))))

(assert (=> b!321977 (=> (not res!176027) (not e!199369))))

(declare-fun b!321978 () Bool)

(assert (=> b!321978 (and (bvsge (index!13902 lt!156306) #b00000000000000000000000000000000) (bvslt (index!13902 lt!156306) (size!8152 a!3305)))))

(declare-fun res!176028 () Bool)

(assert (=> b!321978 (= res!176028 (= (select (arr!7800 a!3305) (index!13902 lt!156306)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!321978 (=> res!176028 e!199371)))

(declare-fun b!321979 () Bool)

(assert (=> b!321979 (= e!199373 e!199370)))

(declare-fun c!50600 () Bool)

(declare-fun lt!156307 () (_ BitVec 64))

(assert (=> b!321979 (= c!50600 (or (= lt!156307 k0!2497) (= (bvadd lt!156307 lt!156307) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!321980 () Bool)

(assert (=> b!321980 (= e!199372 (bvsge (x!32158 lt!156306) #b01111111111111111111111111111110))))

(declare-fun d!69549 () Bool)

(assert (=> d!69549 e!199372))

(declare-fun c!50599 () Bool)

(assert (=> d!69549 (= c!50599 (and ((_ is Intermediate!2931) lt!156306) (undefined!3743 lt!156306)))))

(assert (=> d!69549 (= lt!156306 e!199373)))

(declare-fun c!50601 () Bool)

(assert (=> d!69549 (= c!50601 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!69549 (= lt!156307 (select (arr!7800 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!69549 (validMask!0 mask!3777)))

(assert (=> d!69549 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156306)))

(declare-fun b!321974 () Bool)

(assert (=> b!321974 (and (bvsge (index!13902 lt!156306) #b00000000000000000000000000000000) (bvslt (index!13902 lt!156306) (size!8152 a!3305)))))

(declare-fun res!176029 () Bool)

(assert (=> b!321974 (= res!176029 (= (select (arr!7800 a!3305) (index!13902 lt!156306)) k0!2497))))

(assert (=> b!321974 (=> res!176029 e!199371)))

(assert (=> b!321974 (= e!199369 e!199371)))

(assert (= (and d!69549 c!50601) b!321972))

(assert (= (and d!69549 (not c!50601)) b!321979))

(assert (= (and b!321979 c!50600) b!321975))

(assert (= (and b!321979 (not c!50600)) b!321973))

(assert (= (and d!69549 c!50599) b!321980))

(assert (= (and d!69549 (not c!50599)) b!321977))

(assert (= (and b!321977 res!176027) b!321974))

(assert (= (and b!321974 (not res!176029)) b!321978))

(assert (= (and b!321978 (not res!176028)) b!321976))

(declare-fun m!329975 () Bool)

(assert (=> b!321978 m!329975))

(assert (=> d!69549 m!329909))

(declare-fun m!329977 () Bool)

(assert (=> d!69549 m!329977))

(assert (=> d!69549 m!329905))

(assert (=> b!321974 m!329975))

(assert (=> b!321973 m!329909))

(declare-fun m!329979 () Bool)

(assert (=> b!321973 m!329979))

(assert (=> b!321973 m!329979))

(declare-fun m!329981 () Bool)

(assert (=> b!321973 m!329981))

(assert (=> b!321976 m!329975))

(assert (=> b!321828 d!69549))

(declare-fun d!69551 () Bool)

(declare-fun lt!156319 () (_ BitVec 32))

(declare-fun lt!156318 () (_ BitVec 32))

(assert (=> d!69551 (= lt!156319 (bvmul (bvxor lt!156318 (bvlshr lt!156318 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69551 (= lt!156318 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69551 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!176030 (let ((h!5389 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32165 (bvmul (bvxor h!5389 (bvlshr h!5389 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32165 (bvlshr x!32165 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!176030 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!176030 #b00000000000000000000000000000000))))))

(assert (=> d!69551 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!156319 (bvlshr lt!156319 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!321828 d!69551))

(declare-fun b!322032 () Bool)

(declare-fun e!199411 () SeekEntryResult!2931)

(declare-fun lt!156352 () SeekEntryResult!2931)

(assert (=> b!322032 (= e!199411 (MissingZero!2931 (index!13902 lt!156352)))))

(declare-fun d!69557 () Bool)

(declare-fun lt!156354 () SeekEntryResult!2931)

(assert (=> d!69557 (and (or ((_ is Undefined!2931) lt!156354) (not ((_ is Found!2931) lt!156354)) (and (bvsge (index!13901 lt!156354) #b00000000000000000000000000000000) (bvslt (index!13901 lt!156354) (size!8152 a!3305)))) (or ((_ is Undefined!2931) lt!156354) ((_ is Found!2931) lt!156354) (not ((_ is MissingZero!2931) lt!156354)) (and (bvsge (index!13900 lt!156354) #b00000000000000000000000000000000) (bvslt (index!13900 lt!156354) (size!8152 a!3305)))) (or ((_ is Undefined!2931) lt!156354) ((_ is Found!2931) lt!156354) ((_ is MissingZero!2931) lt!156354) (not ((_ is MissingVacant!2931) lt!156354)) (and (bvsge (index!13903 lt!156354) #b00000000000000000000000000000000) (bvslt (index!13903 lt!156354) (size!8152 a!3305)))) (or ((_ is Undefined!2931) lt!156354) (ite ((_ is Found!2931) lt!156354) (= (select (arr!7800 a!3305) (index!13901 lt!156354)) k0!2497) (ite ((_ is MissingZero!2931) lt!156354) (= (select (arr!7800 a!3305) (index!13900 lt!156354)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2931) lt!156354) (= (select (arr!7800 a!3305) (index!13903 lt!156354)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!199412 () SeekEntryResult!2931)

(assert (=> d!69557 (= lt!156354 e!199412)))

(declare-fun c!50617 () Bool)

(assert (=> d!69557 (= c!50617 (and ((_ is Intermediate!2931) lt!156352) (undefined!3743 lt!156352)))))

(assert (=> d!69557 (= lt!156352 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!69557 (validMask!0 mask!3777)))

(assert (=> d!69557 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!156354)))

(declare-fun b!322033 () Bool)

(declare-fun e!199410 () SeekEntryResult!2931)

(assert (=> b!322033 (= e!199412 e!199410)))

(declare-fun lt!156353 () (_ BitVec 64))

(assert (=> b!322033 (= lt!156353 (select (arr!7800 a!3305) (index!13902 lt!156352)))))

(declare-fun c!50616 () Bool)

(assert (=> b!322033 (= c!50616 (= lt!156353 k0!2497))))

(declare-fun b!322034 () Bool)

(declare-fun c!50618 () Bool)

(assert (=> b!322034 (= c!50618 (= lt!156353 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!322034 (= e!199410 e!199411)))

(declare-fun b!322035 () Bool)

(assert (=> b!322035 (= e!199410 (Found!2931 (index!13902 lt!156352)))))

(declare-fun b!322036 () Bool)

(assert (=> b!322036 (= e!199412 Undefined!2931)))

(declare-fun b!322037 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16482 (_ BitVec 32)) SeekEntryResult!2931)

(assert (=> b!322037 (= e!199411 (seekKeyOrZeroReturnVacant!0 (x!32158 lt!156352) (index!13902 lt!156352) (index!13902 lt!156352) k0!2497 a!3305 mask!3777))))

(assert (= (and d!69557 c!50617) b!322036))

(assert (= (and d!69557 (not c!50617)) b!322033))

(assert (= (and b!322033 c!50616) b!322035))

(assert (= (and b!322033 (not c!50616)) b!322034))

(assert (= (and b!322034 c!50618) b!322032))

(assert (= (and b!322034 (not c!50618)) b!322037))

(declare-fun m!330011 () Bool)

(assert (=> d!69557 m!330011))

(assert (=> d!69557 m!329909))

(assert (=> d!69557 m!329911))

(assert (=> d!69557 m!329905))

(declare-fun m!330013 () Bool)

(assert (=> d!69557 m!330013))

(declare-fun m!330015 () Bool)

(assert (=> d!69557 m!330015))

(assert (=> d!69557 m!329909))

(declare-fun m!330017 () Bool)

(assert (=> b!322033 m!330017))

(declare-fun m!330019 () Bool)

(assert (=> b!322037 m!330019))

(assert (=> b!321833 d!69557))

(check-sat (not d!69557) (not b!321940) (not bm!26062) (not b!322037) (not d!69531) (not d!69547) (not b!321973) (not b!321971) (not b!321872) (not d!69549) (not b!321875))
(check-sat)
