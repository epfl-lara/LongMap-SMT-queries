; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!115940 () Bool)

(assert start!115940)

(declare-fun b!1370301 () Bool)

(declare-fun res!913752 () Bool)

(declare-fun e!776173 () Bool)

(assert (=> b!1370301 (=> (not res!913752) (not e!776173))))

(declare-datatypes ((List!31995 0))(
  ( (Nil!31992) (Cons!31991 (h!33200 (_ BitVec 64)) (t!46689 List!31995)) )
))
(declare-fun newAcc!98 () List!31995)

(declare-fun acc!866 () List!31995)

(declare-fun subseq!1079 (List!31995 List!31995) Bool)

(assert (=> b!1370301 (= res!913752 (subseq!1079 newAcc!98 acc!866))))

(declare-fun b!1370302 () Bool)

(declare-fun res!913754 () Bool)

(declare-fun e!776171 () Bool)

(assert (=> b!1370302 (=> (not res!913754) (not e!776171))))

(declare-datatypes ((array!93015 0))(
  ( (array!93016 (arr!44927 (Array (_ BitVec 32) (_ BitVec 64))) (size!45477 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93015)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun contains!9677 (List!31995 (_ BitVec 64)) Bool)

(assert (=> b!1370302 (= res!913754 (not (contains!9677 acc!866 (select (arr!44927 a!3861) from!3239))))))

(declare-fun b!1370303 () Bool)

(declare-fun res!913744 () Bool)

(assert (=> b!1370303 (=> (not res!913744) (not e!776171))))

(assert (=> b!1370303 (= res!913744 (bvslt from!3239 (size!45477 a!3861)))))

(declare-fun res!913751 () Bool)

(assert (=> start!115940 (=> (not res!913751) (not e!776173))))

(assert (=> start!115940 (= res!913751 (and (bvslt (size!45477 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45477 a!3861))))))

(assert (=> start!115940 e!776173))

(declare-fun array_inv!33955 (array!93015) Bool)

(assert (=> start!115940 (array_inv!33955 a!3861)))

(assert (=> start!115940 true))

(declare-fun b!1370304 () Bool)

(declare-fun e!776169 () Bool)

(declare-fun lt!602419 () List!31995)

(assert (=> b!1370304 (= e!776169 (contains!9677 lt!602419 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370305 () Bool)

(declare-fun res!913746 () Bool)

(assert (=> b!1370305 (=> (not res!913746) (not e!776173))))

(assert (=> b!1370305 (= res!913746 (not (contains!9677 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370306 () Bool)

(declare-fun e!776170 () Bool)

(assert (=> b!1370306 (= e!776170 e!776169)))

(declare-fun res!913753 () Bool)

(assert (=> b!1370306 (=> res!913753 e!776169)))

(assert (=> b!1370306 (= res!913753 (contains!9677 lt!602419 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370307 () Bool)

(assert (=> b!1370307 (= e!776173 e!776171)))

(declare-fun res!913756 () Bool)

(assert (=> b!1370307 (=> (not res!913756) (not e!776171))))

(declare-fun arrayNoDuplicates!0 (array!93015 (_ BitVec 32) List!31995) Bool)

(assert (=> b!1370307 (= res!913756 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45291 0))(
  ( (Unit!45292) )
))
(declare-fun lt!602418 () Unit!45291)

(declare-fun noDuplicateSubseq!266 (List!31995 List!31995) Unit!45291)

(assert (=> b!1370307 (= lt!602418 (noDuplicateSubseq!266 newAcc!98 acc!866))))

(declare-fun b!1370308 () Bool)

(declare-fun res!913750 () Bool)

(assert (=> b!1370308 (=> (not res!913750) (not e!776173))))

(assert (=> b!1370308 (= res!913750 (not (contains!9677 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370309 () Bool)

(declare-fun res!913745 () Bool)

(assert (=> b!1370309 (=> (not res!913745) (not e!776173))))

(declare-fun noDuplicate!2534 (List!31995) Bool)

(assert (=> b!1370309 (= res!913745 (noDuplicate!2534 acc!866))))

(declare-fun b!1370310 () Bool)

(declare-fun res!913743 () Bool)

(assert (=> b!1370310 (=> (not res!913743) (not e!776170))))

(assert (=> b!1370310 (= res!913743 (noDuplicate!2534 lt!602419))))

(declare-fun b!1370311 () Bool)

(declare-fun res!913755 () Bool)

(assert (=> b!1370311 (=> (not res!913755) (not e!776171))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1370311 (= res!913755 (validKeyInArray!0 (select (arr!44927 a!3861) from!3239)))))

(declare-fun b!1370312 () Bool)

(assert (=> b!1370312 (= e!776171 e!776170)))

(declare-fun res!913747 () Bool)

(assert (=> b!1370312 (=> (not res!913747) (not e!776170))))

(assert (=> b!1370312 (= res!913747 (bvsge (bvadd #b00000000000000000000000000000001 from!3239) #b00000000000000000000000000000000))))

(assert (=> b!1370312 (= lt!602419 (Cons!31991 (select (arr!44927 a!3861) from!3239) acc!866))))

(declare-fun b!1370313 () Bool)

(declare-fun res!913749 () Bool)

(assert (=> b!1370313 (=> (not res!913749) (not e!776173))))

(assert (=> b!1370313 (= res!913749 (not (contains!9677 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1370314 () Bool)

(declare-fun res!913748 () Bool)

(assert (=> b!1370314 (=> (not res!913748) (not e!776173))))

(assert (=> b!1370314 (= res!913748 (not (contains!9677 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!115940 res!913751) b!1370309))

(assert (= (and b!1370309 res!913745) b!1370314))

(assert (= (and b!1370314 res!913748) b!1370305))

(assert (= (and b!1370305 res!913746) b!1370313))

(assert (= (and b!1370313 res!913749) b!1370308))

(assert (= (and b!1370308 res!913750) b!1370301))

(assert (= (and b!1370301 res!913752) b!1370307))

(assert (= (and b!1370307 res!913756) b!1370303))

(assert (= (and b!1370303 res!913744) b!1370311))

(assert (= (and b!1370311 res!913755) b!1370302))

(assert (= (and b!1370302 res!913754) b!1370312))

(assert (= (and b!1370312 res!913747) b!1370310))

(assert (= (and b!1370310 res!913743) b!1370306))

(assert (= (and b!1370306 (not res!913753)) b!1370304))

(declare-fun m!1253893 () Bool)

(assert (=> b!1370308 m!1253893))

(declare-fun m!1253895 () Bool)

(assert (=> b!1370305 m!1253895))

(declare-fun m!1253897 () Bool)

(assert (=> b!1370307 m!1253897))

(declare-fun m!1253899 () Bool)

(assert (=> b!1370307 m!1253899))

(declare-fun m!1253901 () Bool)

(assert (=> b!1370302 m!1253901))

(assert (=> b!1370302 m!1253901))

(declare-fun m!1253903 () Bool)

(assert (=> b!1370302 m!1253903))

(assert (=> b!1370312 m!1253901))

(assert (=> b!1370311 m!1253901))

(assert (=> b!1370311 m!1253901))

(declare-fun m!1253905 () Bool)

(assert (=> b!1370311 m!1253905))

(declare-fun m!1253907 () Bool)

(assert (=> b!1370309 m!1253907))

(declare-fun m!1253909 () Bool)

(assert (=> b!1370301 m!1253909))

(declare-fun m!1253911 () Bool)

(assert (=> b!1370306 m!1253911))

(declare-fun m!1253913 () Bool)

(assert (=> start!115940 m!1253913))

(declare-fun m!1253915 () Bool)

(assert (=> b!1370304 m!1253915))

(declare-fun m!1253917 () Bool)

(assert (=> b!1370313 m!1253917))

(declare-fun m!1253919 () Bool)

(assert (=> b!1370310 m!1253919))

(declare-fun m!1253921 () Bool)

(assert (=> b!1370314 m!1253921))

(push 1)

(assert (not b!1370302))

(assert (not b!1370309))

(assert (not b!1370310))

(assert (not b!1370314))

(assert (not b!1370305))

(assert (not b!1370313))

(assert (not b!1370311))

(assert (not b!1370307))

(assert (not start!115940))

(assert (not b!1370301))

(assert (not b!1370306))

(assert (not b!1370308))

(assert (not b!1370304))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!147167 () Bool)

(declare-fun res!913869 () Bool)

(declare-fun e!776232 () Bool)

(assert (=> d!147167 (=> res!913869 e!776232)))

(assert (=> d!147167 (= res!913869 (is-Nil!31992 acc!866))))

(assert (=> d!147167 (= (noDuplicate!2534 acc!866) e!776232)))

(declare-fun b!1370427 () Bool)

(declare-fun e!776233 () Bool)

(assert (=> b!1370427 (= e!776232 e!776233)))

(declare-fun res!913870 () Bool)

(assert (=> b!1370427 (=> (not res!913870) (not e!776233))))

(assert (=> b!1370427 (= res!913870 (not (contains!9677 (t!46689 acc!866) (h!33200 acc!866))))))

(declare-fun b!1370428 () Bool)

(assert (=> b!1370428 (= e!776233 (noDuplicate!2534 (t!46689 acc!866)))))

(assert (= (and d!147167 (not res!913869)) b!1370427))

(assert (= (and b!1370427 res!913870) b!1370428))

(declare-fun m!1254005 () Bool)

(assert (=> b!1370427 m!1254005))

(declare-fun m!1254007 () Bool)

(assert (=> b!1370428 m!1254007))

(assert (=> b!1370309 d!147167))

(declare-fun d!147173 () Bool)

(declare-fun lt!602439 () Bool)

(declare-fun content!730 (List!31995) (Set (_ BitVec 64)))

(assert (=> d!147173 (= lt!602439 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!730 newAcc!98)))))

(declare-fun e!776253 () Bool)

(assert (=> d!147173 (= lt!602439 e!776253)))

(declare-fun res!913888 () Bool)

(assert (=> d!147173 (=> (not res!913888) (not e!776253))))

(assert (=> d!147173 (= res!913888 (is-Cons!31991 newAcc!98))))

(assert (=> d!147173 (= (contains!9677 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602439)))

(declare-fun b!1370449 () Bool)

(declare-fun e!776252 () Bool)

(assert (=> b!1370449 (= e!776253 e!776252)))

(declare-fun res!913887 () Bool)

(assert (=> b!1370449 (=> res!913887 e!776252)))

(assert (=> b!1370449 (= res!913887 (= (h!33200 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370450 () Bool)

(assert (=> b!1370450 (= e!776252 (contains!9677 (t!46689 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147173 res!913888) b!1370449))

(assert (= (and b!1370449 (not res!913887)) b!1370450))

(declare-fun m!1254017 () Bool)

(assert (=> d!147173 m!1254017))

(declare-fun m!1254019 () Bool)

(assert (=> d!147173 m!1254019))

(declare-fun m!1254021 () Bool)

(assert (=> b!1370450 m!1254021))

(assert (=> b!1370308 d!147173))

(declare-fun b!1370489 () Bool)

(declare-fun e!776287 () Bool)

(declare-fun call!65534 () Bool)

(assert (=> b!1370489 (= e!776287 call!65534)))

(declare-fun e!776288 () Bool)

(declare-fun b!1370490 () Bool)

(assert (=> b!1370490 (= e!776288 (contains!9677 acc!866 (select (arr!44927 a!3861) from!3239)))))

(declare-fun b!1370491 () Bool)

(assert (=> b!1370491 (= e!776287 call!65534)))

(declare-fun c!127727 () Bool)

(declare-fun bm!65531 () Bool)

(assert (=> bm!65531 (= call!65534 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!127727 (Cons!31991 (select (arr!44927 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1370492 () Bool)

(declare-fun e!776285 () Bool)

(declare-fun e!776286 () Bool)

(assert (=> b!1370492 (= e!776285 e!776286)))

(declare-fun res!913916 () Bool)

(assert (=> b!1370492 (=> (not res!913916) (not e!776286))))

(assert (=> b!1370492 (= res!913916 (not e!776288))))

(declare-fun res!913914 () Bool)

(assert (=> b!1370492 (=> (not res!913914) (not e!776288))))

(assert (=> b!1370492 (= res!913914 (validKeyInArray!0 (select (arr!44927 a!3861) from!3239)))))

(declare-fun b!1370488 () Bool)

(assert (=> b!1370488 (= e!776286 e!776287)))

(assert (=> b!1370488 (= c!127727 (validKeyInArray!0 (select (arr!44927 a!3861) from!3239)))))

(declare-fun d!147179 () Bool)

(declare-fun res!913915 () Bool)

(assert (=> d!147179 (=> res!913915 e!776285)))

(assert (=> d!147179 (= res!913915 (bvsge from!3239 (size!45477 a!3861)))))

(assert (=> d!147179 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!776285)))

(assert (= (and d!147179 (not res!913915)) b!1370492))

(assert (= (and b!1370492 res!913914) b!1370490))

(assert (= (and b!1370492 res!913916) b!1370488))

(assert (= (and b!1370488 c!127727) b!1370491))

(assert (= (and b!1370488 (not c!127727)) b!1370489))

(assert (= (or b!1370491 b!1370489) bm!65531))

(assert (=> b!1370490 m!1253901))

(assert (=> b!1370490 m!1253901))

(assert (=> b!1370490 m!1253903))

(assert (=> bm!65531 m!1253901))

(declare-fun m!1254035 () Bool)

(assert (=> bm!65531 m!1254035))

(assert (=> b!1370492 m!1253901))

(assert (=> b!1370492 m!1253901))

(assert (=> b!1370492 m!1253905))

(assert (=> b!1370488 m!1253901))

(assert (=> b!1370488 m!1253901))

(assert (=> b!1370488 m!1253905))

(assert (=> b!1370307 d!147179))

(declare-fun d!147189 () Bool)

(assert (=> d!147189 (noDuplicate!2534 newAcc!98)))

(declare-fun lt!602455 () Unit!45291)

(declare-fun choose!2009 (List!31995 List!31995) Unit!45291)

(assert (=> d!147189 (= lt!602455 (choose!2009 newAcc!98 acc!866))))

(declare-fun e!776310 () Bool)

(assert (=> d!147189 e!776310))

(declare-fun res!913938 () Bool)

(assert (=> d!147189 (=> (not res!913938) (not e!776310))))

(assert (=> d!147189 (= res!913938 (subseq!1079 newAcc!98 acc!866))))

(assert (=> d!147189 (= (noDuplicateSubseq!266 newAcc!98 acc!866) lt!602455)))

(declare-fun b!1370514 () Bool)

(assert (=> b!1370514 (= e!776310 (noDuplicate!2534 acc!866))))

(assert (= (and d!147189 res!913938) b!1370514))

(declare-fun m!1254063 () Bool)

(assert (=> d!147189 m!1254063))

(declare-fun m!1254065 () Bool)

(assert (=> d!147189 m!1254065))

(assert (=> d!147189 m!1253909))

(assert (=> b!1370514 m!1253907))

(assert (=> b!1370307 d!147189))

(declare-fun b!1370538 () Bool)

(declare-fun e!776334 () Bool)

(assert (=> b!1370538 (= e!776334 (subseq!1079 newAcc!98 (t!46689 acc!866)))))

(declare-fun b!1370536 () Bool)

(declare-fun e!776333 () Bool)

(assert (=> b!1370536 (= e!776333 e!776334)))

(declare-fun res!913961 () Bool)

(assert (=> b!1370536 (=> res!913961 e!776334)))

(declare-fun e!776332 () Bool)

(assert (=> b!1370536 (= res!913961 e!776332)))

(declare-fun res!913960 () Bool)

(assert (=> b!1370536 (=> (not res!913960) (not e!776332))))

(assert (=> b!1370536 (= res!913960 (= (h!33200 newAcc!98) (h!33200 acc!866)))))

(declare-fun b!1370535 () Bool)

(declare-fun e!776331 () Bool)

(assert (=> b!1370535 (= e!776331 e!776333)))

(declare-fun res!913962 () Bool)

(assert (=> b!1370535 (=> (not res!913962) (not e!776333))))

(assert (=> b!1370535 (= res!913962 (is-Cons!31991 acc!866))))

(declare-fun d!147201 () Bool)

(declare-fun res!913959 () Bool)

(assert (=> d!147201 (=> res!913959 e!776331)))

(assert (=> d!147201 (= res!913959 (is-Nil!31992 newAcc!98))))

(assert (=> d!147201 (= (subseq!1079 newAcc!98 acc!866) e!776331)))

(declare-fun b!1370537 () Bool)

(assert (=> b!1370537 (= e!776332 (subseq!1079 (t!46689 newAcc!98) (t!46689 acc!866)))))

(assert (= (and d!147201 (not res!913959)) b!1370535))

(assert (= (and b!1370535 res!913962) b!1370536))

(assert (= (and b!1370536 res!913960) b!1370537))

(assert (= (and b!1370536 (not res!913961)) b!1370538))

(declare-fun m!1254071 () Bool)

(assert (=> b!1370538 m!1254071))

(declare-fun m!1254073 () Bool)

(assert (=> b!1370537 m!1254073))

(assert (=> b!1370301 d!147201))

(declare-fun d!147207 () Bool)

(assert (=> d!147207 (= (validKeyInArray!0 (select (arr!44927 a!3861) from!3239)) (and (not (= (select (arr!44927 a!3861) from!3239) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44927 a!3861) from!3239) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1370311 d!147207))

(declare-fun d!147215 () Bool)

(declare-fun res!913969 () Bool)

(declare-fun e!776342 () Bool)

(assert (=> d!147215 (=> res!913969 e!776342)))

(assert (=> d!147215 (= res!913969 (is-Nil!31992 lt!602419))))

(assert (=> d!147215 (= (noDuplicate!2534 lt!602419) e!776342)))

(declare-fun b!1370545 () Bool)

(declare-fun e!776344 () Bool)

(assert (=> b!1370545 (= e!776342 e!776344)))

(declare-fun res!913972 () Bool)

(assert (=> b!1370545 (=> (not res!913972) (not e!776344))))

(assert (=> b!1370545 (= res!913972 (not (contains!9677 (t!46689 lt!602419) (h!33200 lt!602419))))))

(declare-fun b!1370547 () Bool)

(assert (=> b!1370547 (= e!776344 (noDuplicate!2534 (t!46689 lt!602419)))))

(assert (= (and d!147215 (not res!913969)) b!1370545))

(assert (= (and b!1370545 res!913972) b!1370547))

(declare-fun m!1254091 () Bool)

(assert (=> b!1370545 m!1254091))

(declare-fun m!1254097 () Bool)

(assert (=> b!1370547 m!1254097))

(assert (=> b!1370310 d!147215))

(declare-fun d!147219 () Bool)

(declare-fun lt!602459 () Bool)

(assert (=> d!147219 (= lt!602459 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!730 lt!602419)))))

(declare-fun e!776346 () Bool)

(assert (=> d!147219 (= lt!602459 e!776346)))

(declare-fun res!913974 () Bool)

(assert (=> d!147219 (=> (not res!913974) (not e!776346))))

(assert (=> d!147219 (= res!913974 (is-Cons!31991 lt!602419))))

(assert (=> d!147219 (= (contains!9677 lt!602419 #b1000000000000000000000000000000000000000000000000000000000000000) lt!602459)))

(declare-fun b!1370549 () Bool)

(declare-fun e!776345 () Bool)

(assert (=> b!1370549 (= e!776346 e!776345)))

(declare-fun res!913973 () Bool)

(assert (=> b!1370549 (=> res!913973 e!776345)))

(assert (=> b!1370549 (= res!913973 (= (h!33200 lt!602419) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370550 () Bool)

(assert (=> b!1370550 (= e!776345 (contains!9677 (t!46689 lt!602419) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147219 res!913974) b!1370549))

(assert (= (and b!1370549 (not res!913973)) b!1370550))

(declare-fun m!1254099 () Bool)

(assert (=> d!147219 m!1254099))

(declare-fun m!1254101 () Bool)

(assert (=> d!147219 m!1254101))

(declare-fun m!1254103 () Bool)

(assert (=> b!1370550 m!1254103))

(assert (=> b!1370304 d!147219))

(declare-fun d!147221 () Bool)

(declare-fun lt!602460 () Bool)

(assert (=> d!147221 (= lt!602460 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!730 acc!866)))))

(declare-fun e!776348 () Bool)

(assert (=> d!147221 (= lt!602460 e!776348)))

(declare-fun res!913976 () Bool)

(assert (=> d!147221 (=> (not res!913976) (not e!776348))))

(assert (=> d!147221 (= res!913976 (is-Cons!31991 acc!866))))

(assert (=> d!147221 (= (contains!9677 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602460)))

(declare-fun b!1370551 () Bool)

(declare-fun e!776347 () Bool)

(assert (=> b!1370551 (= e!776348 e!776347)))

(declare-fun res!913975 () Bool)

(assert (=> b!1370551 (=> res!913975 e!776347)))

(assert (=> b!1370551 (= res!913975 (= (h!33200 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370552 () Bool)

(assert (=> b!1370552 (= e!776347 (contains!9677 (t!46689 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!147221 res!913976) b!1370551))

(assert (= (and b!1370551 (not res!913975)) b!1370552))

(declare-fun m!1254105 () Bool)

(assert (=> d!147221 m!1254105))

(declare-fun m!1254107 () Bool)

(assert (=> d!147221 m!1254107))

(declare-fun m!1254111 () Bool)

(assert (=> b!1370552 m!1254111))

(assert (=> b!1370314 d!147221))

(declare-fun d!147225 () Bool)

(declare-fun lt!602462 () Bool)

(assert (=> d!147225 (= lt!602462 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!730 newAcc!98)))))

(declare-fun e!776352 () Bool)

(assert (=> d!147225 (= lt!602462 e!776352)))

(declare-fun res!913980 () Bool)

(assert (=> d!147225 (=> (not res!913980) (not e!776352))))

(assert (=> d!147225 (= res!913980 (is-Cons!31991 newAcc!98))))

(assert (=> d!147225 (= (contains!9677 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!602462)))

(declare-fun b!1370555 () Bool)

(declare-fun e!776351 () Bool)

(assert (=> b!1370555 (= e!776352 e!776351)))

(declare-fun res!913979 () Bool)

(assert (=> b!1370555 (=> res!913979 e!776351)))

(assert (=> b!1370555 (= res!913979 (= (h!33200 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1370556 () Bool)

(assert (=> b!1370556 (= e!776351 (contains!9677 (t!46689 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

