; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120878 () Bool)

(assert start!120878)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun e!795948 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1405881 () Bool)

(declare-datatypes ((array!96158 0))(
  ( (array!96159 (arr!46426 (Array (_ BitVec 32) (_ BitVec 64))) (size!46977 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96158)

(declare-datatypes ((SeekEntryResult!10640 0))(
  ( (MissingZero!10640 (index!44937 (_ BitVec 32))) (Found!10640 (index!44938 (_ BitVec 32))) (Intermediate!10640 (undefined!11452 Bool) (index!44939 (_ BitVec 32)) (x!126708 (_ BitVec 32))) (Undefined!10640) (MissingVacant!10640 (index!44940 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96158 (_ BitVec 32)) SeekEntryResult!10640)

(assert (=> b!1405881 (= e!795948 (= (seekEntryOrOpen!0 (select (arr!46426 a!2901) j!112) a!2901 mask!2840) (Found!10640 j!112)))))

(declare-fun b!1405882 () Bool)

(declare-fun res!943565 () Bool)

(declare-fun e!795950 () Bool)

(assert (=> b!1405882 (=> (not res!943565) (not e!795950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96158 (_ BitVec 32)) Bool)

(assert (=> b!1405882 (= res!943565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!943563 () Bool)

(assert (=> start!120878 (=> (not res!943563) (not e!795950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120878 (= res!943563 (validMask!0 mask!2840))))

(assert (=> start!120878 e!795950))

(assert (=> start!120878 true))

(declare-fun array_inv!35707 (array!96158) Bool)

(assert (=> start!120878 (array_inv!35707 a!2901)))

(declare-fun b!1405883 () Bool)

(declare-fun res!943567 () Bool)

(assert (=> b!1405883 (=> (not res!943567) (not e!795950))))

(declare-datatypes ((List!32932 0))(
  ( (Nil!32929) (Cons!32928 (h!34187 (_ BitVec 64)) (t!47618 List!32932)) )
))
(declare-fun arrayNoDuplicates!0 (array!96158 (_ BitVec 32) List!32932) Bool)

(assert (=> b!1405883 (= res!943567 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32929))))

(declare-fun b!1405884 () Bool)

(declare-fun res!943561 () Bool)

(assert (=> b!1405884 (=> (not res!943561) (not e!795950))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1405884 (= res!943561 (and (= (size!46977 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46977 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46977 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1405885 () Bool)

(declare-fun res!943564 () Bool)

(assert (=> b!1405885 (=> (not res!943564) (not e!795950))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405885 (= res!943564 (validKeyInArray!0 (select (arr!46426 a!2901) j!112)))))

(declare-fun b!1405886 () Bool)

(declare-fun lt!619184 () SeekEntryResult!10640)

(get-info :version)

(assert (=> b!1405886 (= e!795950 (not (or (not ((_ is Intermediate!10640) lt!619184)) (not (undefined!11452 lt!619184)))))))

(assert (=> b!1405886 e!795948))

(declare-fun res!943562 () Bool)

(assert (=> b!1405886 (=> (not res!943562) (not e!795948))))

(assert (=> b!1405886 (= res!943562 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47281 0))(
  ( (Unit!47282) )
))
(declare-fun lt!619183 () Unit!47281)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96158 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47281)

(assert (=> b!1405886 (= lt!619183 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96158 (_ BitVec 32)) SeekEntryResult!10640)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405886 (= lt!619184 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46426 a!2901) j!112) mask!2840) (select (arr!46426 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1405887 () Bool)

(declare-fun res!943566 () Bool)

(assert (=> b!1405887 (=> (not res!943566) (not e!795950))))

(assert (=> b!1405887 (= res!943566 (validKeyInArray!0 (select (arr!46426 a!2901) i!1037)))))

(assert (= (and start!120878 res!943563) b!1405884))

(assert (= (and b!1405884 res!943561) b!1405887))

(assert (= (and b!1405887 res!943566) b!1405885))

(assert (= (and b!1405885 res!943564) b!1405882))

(assert (= (and b!1405882 res!943565) b!1405883))

(assert (= (and b!1405883 res!943567) b!1405886))

(assert (= (and b!1405886 res!943562) b!1405881))

(declare-fun m!1294885 () Bool)

(assert (=> b!1405882 m!1294885))

(declare-fun m!1294887 () Bool)

(assert (=> b!1405885 m!1294887))

(assert (=> b!1405885 m!1294887))

(declare-fun m!1294889 () Bool)

(assert (=> b!1405885 m!1294889))

(declare-fun m!1294891 () Bool)

(assert (=> start!120878 m!1294891))

(declare-fun m!1294893 () Bool)

(assert (=> start!120878 m!1294893))

(declare-fun m!1294895 () Bool)

(assert (=> b!1405887 m!1294895))

(assert (=> b!1405887 m!1294895))

(declare-fun m!1294897 () Bool)

(assert (=> b!1405887 m!1294897))

(declare-fun m!1294899 () Bool)

(assert (=> b!1405883 m!1294899))

(assert (=> b!1405886 m!1294887))

(declare-fun m!1294901 () Bool)

(assert (=> b!1405886 m!1294901))

(assert (=> b!1405886 m!1294887))

(declare-fun m!1294903 () Bool)

(assert (=> b!1405886 m!1294903))

(assert (=> b!1405886 m!1294901))

(assert (=> b!1405886 m!1294887))

(declare-fun m!1294905 () Bool)

(assert (=> b!1405886 m!1294905))

(declare-fun m!1294907 () Bool)

(assert (=> b!1405886 m!1294907))

(assert (=> b!1405881 m!1294887))

(assert (=> b!1405881 m!1294887))

(declare-fun m!1294909 () Bool)

(assert (=> b!1405881 m!1294909))

(check-sat (not b!1405886) (not b!1405885) (not b!1405883) (not b!1405881) (not b!1405882) (not start!120878) (not b!1405887))
(check-sat)
(get-model)

(declare-fun d!151661 () Bool)

(assert (=> d!151661 (= (validKeyInArray!0 (select (arr!46426 a!2901) j!112)) (and (not (= (select (arr!46426 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46426 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1405885 d!151661))

(declare-fun d!151663 () Bool)

(assert (=> d!151663 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!120878 d!151663))

(declare-fun d!151671 () Bool)

(assert (=> d!151671 (= (array_inv!35707 a!2901) (bvsge (size!46977 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!120878 d!151671))

(declare-fun b!1405964 () Bool)

(declare-fun e!795998 () Bool)

(declare-fun e!795997 () Bool)

(assert (=> b!1405964 (= e!795998 e!795997)))

(declare-fun res!943628 () Bool)

(assert (=> b!1405964 (=> (not res!943628) (not e!795997))))

(declare-fun e!795996 () Bool)

(assert (=> b!1405964 (= res!943628 (not e!795996))))

(declare-fun res!943629 () Bool)

(assert (=> b!1405964 (=> (not res!943629) (not e!795996))))

(assert (=> b!1405964 (= res!943629 (validKeyInArray!0 (select (arr!46426 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1405965 () Bool)

(declare-fun e!795995 () Bool)

(assert (=> b!1405965 (= e!795997 e!795995)))

(declare-fun c!130636 () Bool)

(assert (=> b!1405965 (= c!130636 (validKeyInArray!0 (select (arr!46426 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66993 () Bool)

(declare-fun call!66996 () Bool)

(assert (=> bm!66993 (= call!66996 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!130636 (Cons!32928 (select (arr!46426 a!2901) #b00000000000000000000000000000000) Nil!32929) Nil!32929)))))

(declare-fun b!1405966 () Bool)

(assert (=> b!1405966 (= e!795995 call!66996)))

(declare-fun d!151673 () Bool)

(declare-fun res!943630 () Bool)

(assert (=> d!151673 (=> res!943630 e!795998)))

(assert (=> d!151673 (= res!943630 (bvsge #b00000000000000000000000000000000 (size!46977 a!2901)))))

(assert (=> d!151673 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32929) e!795998)))

(declare-fun b!1405967 () Bool)

(declare-fun contains!9833 (List!32932 (_ BitVec 64)) Bool)

(assert (=> b!1405967 (= e!795996 (contains!9833 Nil!32929 (select (arr!46426 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1405968 () Bool)

(assert (=> b!1405968 (= e!795995 call!66996)))

(assert (= (and d!151673 (not res!943630)) b!1405964))

(assert (= (and b!1405964 res!943629) b!1405967))

(assert (= (and b!1405964 res!943628) b!1405965))

(assert (= (and b!1405965 c!130636) b!1405968))

(assert (= (and b!1405965 (not c!130636)) b!1405966))

(assert (= (or b!1405968 b!1405966) bm!66993))

(declare-fun m!1294975 () Bool)

(assert (=> b!1405964 m!1294975))

(assert (=> b!1405964 m!1294975))

(declare-fun m!1294977 () Bool)

(assert (=> b!1405964 m!1294977))

(assert (=> b!1405965 m!1294975))

(assert (=> b!1405965 m!1294975))

(assert (=> b!1405965 m!1294977))

(assert (=> bm!66993 m!1294975))

(declare-fun m!1294979 () Bool)

(assert (=> bm!66993 m!1294979))

(assert (=> b!1405967 m!1294975))

(assert (=> b!1405967 m!1294975))

(declare-fun m!1294981 () Bool)

(assert (=> b!1405967 m!1294981))

(assert (=> b!1405883 d!151673))

(declare-fun d!151679 () Bool)

(declare-fun res!943636 () Bool)

(declare-fun e!796006 () Bool)

(assert (=> d!151679 (=> res!943636 e!796006)))

(assert (=> d!151679 (= res!943636 (bvsge #b00000000000000000000000000000000 (size!46977 a!2901)))))

(assert (=> d!151679 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!796006)))

(declare-fun b!1405977 () Bool)

(declare-fun e!796007 () Bool)

(declare-fun e!796005 () Bool)

(assert (=> b!1405977 (= e!796007 e!796005)))

(declare-fun lt!619229 () (_ BitVec 64))

(assert (=> b!1405977 (= lt!619229 (select (arr!46426 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!619227 () Unit!47281)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96158 (_ BitVec 64) (_ BitVec 32)) Unit!47281)

(assert (=> b!1405977 (= lt!619227 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619229 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96158 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1405977 (arrayContainsKey!0 a!2901 lt!619229 #b00000000000000000000000000000000)))

(declare-fun lt!619228 () Unit!47281)

(assert (=> b!1405977 (= lt!619228 lt!619227)))

(declare-fun res!943635 () Bool)

(assert (=> b!1405977 (= res!943635 (= (seekEntryOrOpen!0 (select (arr!46426 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10640 #b00000000000000000000000000000000)))))

(assert (=> b!1405977 (=> (not res!943635) (not e!796005))))

(declare-fun b!1405978 () Bool)

(declare-fun call!66999 () Bool)

(assert (=> b!1405978 (= e!796005 call!66999)))

(declare-fun b!1405979 () Bool)

(assert (=> b!1405979 (= e!796006 e!796007)))

(declare-fun c!130639 () Bool)

(assert (=> b!1405979 (= c!130639 (validKeyInArray!0 (select (arr!46426 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1405980 () Bool)

(assert (=> b!1405980 (= e!796007 call!66999)))

(declare-fun bm!66996 () Bool)

(assert (=> bm!66996 (= call!66999 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!151679 (not res!943636)) b!1405979))

(assert (= (and b!1405979 c!130639) b!1405977))

(assert (= (and b!1405979 (not c!130639)) b!1405980))

(assert (= (and b!1405977 res!943635) b!1405978))

(assert (= (or b!1405978 b!1405980) bm!66996))

(assert (=> b!1405977 m!1294975))

(declare-fun m!1294987 () Bool)

(assert (=> b!1405977 m!1294987))

(declare-fun m!1294989 () Bool)

(assert (=> b!1405977 m!1294989))

(assert (=> b!1405977 m!1294975))

(declare-fun m!1294991 () Bool)

(assert (=> b!1405977 m!1294991))

(assert (=> b!1405979 m!1294975))

(assert (=> b!1405979 m!1294975))

(assert (=> b!1405979 m!1294977))

(declare-fun m!1294993 () Bool)

(assert (=> bm!66996 m!1294993))

(assert (=> b!1405882 d!151679))

(declare-fun d!151685 () Bool)

(assert (=> d!151685 (= (validKeyInArray!0 (select (arr!46426 a!2901) i!1037)) (and (not (= (select (arr!46426 a!2901) i!1037) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46426 a!2901) i!1037) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1405887 d!151685))

(declare-fun d!151687 () Bool)

(declare-fun res!943638 () Bool)

(declare-fun e!796009 () Bool)

(assert (=> d!151687 (=> res!943638 e!796009)))

(assert (=> d!151687 (= res!943638 (bvsge j!112 (size!46977 a!2901)))))

(assert (=> d!151687 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!796009)))

(declare-fun b!1405981 () Bool)

(declare-fun e!796010 () Bool)

(declare-fun e!796008 () Bool)

(assert (=> b!1405981 (= e!796010 e!796008)))

(declare-fun lt!619232 () (_ BitVec 64))

(assert (=> b!1405981 (= lt!619232 (select (arr!46426 a!2901) j!112))))

(declare-fun lt!619230 () Unit!47281)

(assert (=> b!1405981 (= lt!619230 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!619232 j!112))))

(assert (=> b!1405981 (arrayContainsKey!0 a!2901 lt!619232 #b00000000000000000000000000000000)))

(declare-fun lt!619231 () Unit!47281)

(assert (=> b!1405981 (= lt!619231 lt!619230)))

(declare-fun res!943637 () Bool)

(assert (=> b!1405981 (= res!943637 (= (seekEntryOrOpen!0 (select (arr!46426 a!2901) j!112) a!2901 mask!2840) (Found!10640 j!112)))))

(assert (=> b!1405981 (=> (not res!943637) (not e!796008))))

(declare-fun b!1405982 () Bool)

(declare-fun call!67000 () Bool)

(assert (=> b!1405982 (= e!796008 call!67000)))

(declare-fun b!1405983 () Bool)

(assert (=> b!1405983 (= e!796009 e!796010)))

(declare-fun c!130640 () Bool)

(assert (=> b!1405983 (= c!130640 (validKeyInArray!0 (select (arr!46426 a!2901) j!112)))))

(declare-fun b!1405984 () Bool)

(assert (=> b!1405984 (= e!796010 call!67000)))

(declare-fun bm!66997 () Bool)

(assert (=> bm!66997 (= call!67000 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(assert (= (and d!151687 (not res!943638)) b!1405983))

(assert (= (and b!1405983 c!130640) b!1405981))

(assert (= (and b!1405983 (not c!130640)) b!1405984))

(assert (= (and b!1405981 res!943637) b!1405982))

(assert (= (or b!1405982 b!1405984) bm!66997))

(assert (=> b!1405981 m!1294887))

(declare-fun m!1294995 () Bool)

(assert (=> b!1405981 m!1294995))

(declare-fun m!1294997 () Bool)

(assert (=> b!1405981 m!1294997))

(assert (=> b!1405981 m!1294887))

(assert (=> b!1405981 m!1294909))

(assert (=> b!1405983 m!1294887))

(assert (=> b!1405983 m!1294887))

(assert (=> b!1405983 m!1294889))

(declare-fun m!1294999 () Bool)

(assert (=> bm!66997 m!1294999))

(assert (=> b!1405886 d!151687))

(declare-fun d!151689 () Bool)

(assert (=> d!151689 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!619235 () Unit!47281)

(declare-fun choose!38 (array!96158 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47281)

(assert (=> d!151689 (= lt!619235 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!151689 (validMask!0 mask!2840)))

(assert (=> d!151689 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!619235)))

(declare-fun bs!40935 () Bool)

(assert (= bs!40935 d!151689))

(assert (=> bs!40935 m!1294907))

(declare-fun m!1295001 () Bool)

(assert (=> bs!40935 m!1295001))

(assert (=> bs!40935 m!1294891))

(assert (=> b!1405886 d!151689))

(declare-fun b!1406075 () Bool)

(declare-fun lt!619271 () SeekEntryResult!10640)

(assert (=> b!1406075 (and (bvsge (index!44939 lt!619271) #b00000000000000000000000000000000) (bvslt (index!44939 lt!619271) (size!46977 a!2901)))))

(declare-fun e!796067 () Bool)

(assert (=> b!1406075 (= e!796067 (= (select (arr!46426 a!2901) (index!44939 lt!619271)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1406076 () Bool)

(declare-fun e!796068 () SeekEntryResult!10640)

(declare-fun e!796065 () SeekEntryResult!10640)

(assert (=> b!1406076 (= e!796068 e!796065)))

(declare-fun c!130669 () Bool)

(declare-fun lt!619270 () (_ BitVec 64))

(assert (=> b!1406076 (= c!130669 (or (= lt!619270 (select (arr!46426 a!2901) j!112)) (= (bvadd lt!619270 lt!619270) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1406077 () Bool)

(assert (=> b!1406077 (= e!796065 (Intermediate!10640 false (toIndex!0 (select (arr!46426 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1406078 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406078 (= e!796065 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46426 a!2901) j!112) mask!2840) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!2840) (select (arr!46426 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406080 () Bool)

(assert (=> b!1406080 (= e!796068 (Intermediate!10640 true (toIndex!0 (select (arr!46426 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1406081 () Bool)

(assert (=> b!1406081 (and (bvsge (index!44939 lt!619271) #b00000000000000000000000000000000) (bvslt (index!44939 lt!619271) (size!46977 a!2901)))))

(declare-fun res!943676 () Bool)

(assert (=> b!1406081 (= res!943676 (= (select (arr!46426 a!2901) (index!44939 lt!619271)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1406081 (=> res!943676 e!796067)))

(declare-fun b!1406082 () Bool)

(assert (=> b!1406082 (and (bvsge (index!44939 lt!619271) #b00000000000000000000000000000000) (bvslt (index!44939 lt!619271) (size!46977 a!2901)))))

(declare-fun res!943675 () Bool)

(assert (=> b!1406082 (= res!943675 (= (select (arr!46426 a!2901) (index!44939 lt!619271)) (select (arr!46426 a!2901) j!112)))))

(assert (=> b!1406082 (=> res!943675 e!796067)))

(declare-fun e!796069 () Bool)

(assert (=> b!1406082 (= e!796069 e!796067)))

(declare-fun b!1406083 () Bool)

(declare-fun e!796066 () Bool)

(assert (=> b!1406083 (= e!796066 e!796069)))

(declare-fun res!943677 () Bool)

(assert (=> b!1406083 (= res!943677 (and ((_ is Intermediate!10640) lt!619271) (not (undefined!11452 lt!619271)) (bvslt (x!126708 lt!619271) #b01111111111111111111111111111110) (bvsge (x!126708 lt!619271) #b00000000000000000000000000000000) (bvsge (x!126708 lt!619271) #b00000000000000000000000000000000)))))

(assert (=> b!1406083 (=> (not res!943677) (not e!796069))))

(declare-fun b!1406079 () Bool)

(assert (=> b!1406079 (= e!796066 (bvsge (x!126708 lt!619271) #b01111111111111111111111111111110))))

(declare-fun d!151691 () Bool)

(assert (=> d!151691 e!796066))

(declare-fun c!130670 () Bool)

(assert (=> d!151691 (= c!130670 (and ((_ is Intermediate!10640) lt!619271) (undefined!11452 lt!619271)))))

(assert (=> d!151691 (= lt!619271 e!796068)))

(declare-fun c!130671 () Bool)

(assert (=> d!151691 (= c!130671 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!151691 (= lt!619270 (select (arr!46426 a!2901) (toIndex!0 (select (arr!46426 a!2901) j!112) mask!2840)))))

(assert (=> d!151691 (validMask!0 mask!2840)))

(assert (=> d!151691 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46426 a!2901) j!112) mask!2840) (select (arr!46426 a!2901) j!112) a!2901 mask!2840) lt!619271)))

(assert (= (and d!151691 c!130671) b!1406080))

(assert (= (and d!151691 (not c!130671)) b!1406076))

(assert (= (and b!1406076 c!130669) b!1406077))

(assert (= (and b!1406076 (not c!130669)) b!1406078))

(assert (= (and d!151691 c!130670) b!1406079))

(assert (= (and d!151691 (not c!130670)) b!1406083))

(assert (= (and b!1406083 res!943677) b!1406082))

(assert (= (and b!1406082 (not res!943675)) b!1406081))

(assert (= (and b!1406081 (not res!943676)) b!1406075))

(declare-fun m!1295045 () Bool)

(assert (=> b!1406081 m!1295045))

(assert (=> d!151691 m!1294901))

(declare-fun m!1295047 () Bool)

(assert (=> d!151691 m!1295047))

(assert (=> d!151691 m!1294891))

(assert (=> b!1406078 m!1294901))

(declare-fun m!1295051 () Bool)

(assert (=> b!1406078 m!1295051))

(assert (=> b!1406078 m!1295051))

(assert (=> b!1406078 m!1294887))

(declare-fun m!1295053 () Bool)

(assert (=> b!1406078 m!1295053))

(assert (=> b!1406082 m!1295045))

(assert (=> b!1406075 m!1295045))

(assert (=> b!1405886 d!151691))

(declare-fun d!151711 () Bool)

(declare-fun lt!619277 () (_ BitVec 32))

(declare-fun lt!619276 () (_ BitVec 32))

(assert (=> d!151711 (= lt!619277 (bvmul (bvxor lt!619276 (bvlshr lt!619276 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!151711 (= lt!619276 ((_ extract 31 0) (bvand (bvxor (select (arr!46426 a!2901) j!112) (bvlshr (select (arr!46426 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!151711 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!943681 (let ((h!34192 ((_ extract 31 0) (bvand (bvxor (select (arr!46426 a!2901) j!112) (bvlshr (select (arr!46426 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!126716 (bvmul (bvxor h!34192 (bvlshr h!34192 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!126716 (bvlshr x!126716 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!943681 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!943681 #b00000000000000000000000000000000))))))

(assert (=> d!151711 (= (toIndex!0 (select (arr!46426 a!2901) j!112) mask!2840) (bvand (bvxor lt!619277 (bvlshr lt!619277 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1405886 d!151711))

(declare-fun b!1406119 () Bool)

(declare-fun e!796090 () SeekEntryResult!10640)

(declare-fun e!796089 () SeekEntryResult!10640)

(assert (=> b!1406119 (= e!796090 e!796089)))

(declare-fun lt!619295 () (_ BitVec 64))

(declare-fun lt!619293 () SeekEntryResult!10640)

(assert (=> b!1406119 (= lt!619295 (select (arr!46426 a!2901) (index!44939 lt!619293)))))

(declare-fun c!130688 () Bool)

(assert (=> b!1406119 (= c!130688 (= lt!619295 (select (arr!46426 a!2901) j!112)))))

(declare-fun d!151717 () Bool)

(declare-fun lt!619294 () SeekEntryResult!10640)

(assert (=> d!151717 (and (or ((_ is Undefined!10640) lt!619294) (not ((_ is Found!10640) lt!619294)) (and (bvsge (index!44938 lt!619294) #b00000000000000000000000000000000) (bvslt (index!44938 lt!619294) (size!46977 a!2901)))) (or ((_ is Undefined!10640) lt!619294) ((_ is Found!10640) lt!619294) (not ((_ is MissingZero!10640) lt!619294)) (and (bvsge (index!44937 lt!619294) #b00000000000000000000000000000000) (bvslt (index!44937 lt!619294) (size!46977 a!2901)))) (or ((_ is Undefined!10640) lt!619294) ((_ is Found!10640) lt!619294) ((_ is MissingZero!10640) lt!619294) (not ((_ is MissingVacant!10640) lt!619294)) (and (bvsge (index!44940 lt!619294) #b00000000000000000000000000000000) (bvslt (index!44940 lt!619294) (size!46977 a!2901)))) (or ((_ is Undefined!10640) lt!619294) (ite ((_ is Found!10640) lt!619294) (= (select (arr!46426 a!2901) (index!44938 lt!619294)) (select (arr!46426 a!2901) j!112)) (ite ((_ is MissingZero!10640) lt!619294) (= (select (arr!46426 a!2901) (index!44937 lt!619294)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10640) lt!619294) (= (select (arr!46426 a!2901) (index!44940 lt!619294)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!151717 (= lt!619294 e!796090)))

(declare-fun c!130690 () Bool)

(assert (=> d!151717 (= c!130690 (and ((_ is Intermediate!10640) lt!619293) (undefined!11452 lt!619293)))))

(assert (=> d!151717 (= lt!619293 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46426 a!2901) j!112) mask!2840) (select (arr!46426 a!2901) j!112) a!2901 mask!2840))))

(assert (=> d!151717 (validMask!0 mask!2840)))

(assert (=> d!151717 (= (seekEntryOrOpen!0 (select (arr!46426 a!2901) j!112) a!2901 mask!2840) lt!619294)))

(declare-fun e!796091 () SeekEntryResult!10640)

(declare-fun b!1406120 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96158 (_ BitVec 32)) SeekEntryResult!10640)

(assert (=> b!1406120 (= e!796091 (seekKeyOrZeroReturnVacant!0 (x!126708 lt!619293) (index!44939 lt!619293) (index!44939 lt!619293) (select (arr!46426 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406121 () Bool)

(assert (=> b!1406121 (= e!796089 (Found!10640 (index!44939 lt!619293)))))

(declare-fun b!1406122 () Bool)

(assert (=> b!1406122 (= e!796090 Undefined!10640)))

(declare-fun b!1406123 () Bool)

(declare-fun c!130689 () Bool)

(assert (=> b!1406123 (= c!130689 (= lt!619295 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1406123 (= e!796089 e!796091)))

(declare-fun b!1406124 () Bool)

(assert (=> b!1406124 (= e!796091 (MissingZero!10640 (index!44939 lt!619293)))))

(assert (= (and d!151717 c!130690) b!1406122))

(assert (= (and d!151717 (not c!130690)) b!1406119))

(assert (= (and b!1406119 c!130688) b!1406121))

(assert (= (and b!1406119 (not c!130688)) b!1406123))

(assert (= (and b!1406123 c!130689) b!1406124))

(assert (= (and b!1406123 (not c!130689)) b!1406120))

(declare-fun m!1295065 () Bool)

(assert (=> b!1406119 m!1295065))

(declare-fun m!1295067 () Bool)

(assert (=> d!151717 m!1295067))

(assert (=> d!151717 m!1294891))

(assert (=> d!151717 m!1294901))

(assert (=> d!151717 m!1294887))

(assert (=> d!151717 m!1294905))

(assert (=> d!151717 m!1294887))

(assert (=> d!151717 m!1294901))

(declare-fun m!1295069 () Bool)

(assert (=> d!151717 m!1295069))

(declare-fun m!1295071 () Bool)

(assert (=> d!151717 m!1295071))

(assert (=> b!1406120 m!1294887))

(declare-fun m!1295073 () Bool)

(assert (=> b!1406120 m!1295073))

(assert (=> b!1405881 d!151717))

(check-sat (not bm!66996) (not bm!66997) (not d!151691) (not b!1405979) (not bm!66993) (not b!1405965) (not d!151689) (not b!1406120) (not b!1405967) (not b!1405964) (not b!1405981) (not b!1406078) (not b!1405977) (not b!1405983) (not d!151717))
(check-sat)
