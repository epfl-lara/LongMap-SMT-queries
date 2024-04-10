; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63376 () Bool)

(assert start!63376)

(declare-fun b!714018 () Bool)

(declare-fun res!477116 () Bool)

(declare-fun e!401338 () Bool)

(assert (=> b!714018 (=> (not res!477116) (not e!401338))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13421 0))(
  ( (Nil!13418) (Cons!13417 (h!14462 (_ BitVec 64)) (t!19736 List!13421)) )
))
(declare-fun acc!652 () List!13421)

(declare-datatypes ((array!40480 0))(
  ( (array!40481 (arr!19380 (Array (_ BitVec 32) (_ BitVec 64))) (size!19791 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40480)

(declare-fun arrayNoDuplicates!0 (array!40480 (_ BitVec 32) List!13421) Bool)

(assert (=> b!714018 (= res!477116 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun b!714019 () Bool)

(declare-fun arrayContainsKey!0 (array!40480 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!714019 (= e!401338 (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969)))))

(declare-fun b!714021 () Bool)

(declare-fun res!477105 () Bool)

(assert (=> b!714021 (=> (not res!477105) (not e!401338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!714021 (= res!477105 (validKeyInArray!0 k!2824))))

(declare-fun b!714022 () Bool)

(declare-fun res!477115 () Bool)

(assert (=> b!714022 (=> (not res!477115) (not e!401338))))

(assert (=> b!714022 (= res!477115 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19791 a!3591)))))

(declare-fun b!714023 () Bool)

(declare-fun res!477110 () Bool)

(assert (=> b!714023 (=> (not res!477110) (not e!401338))))

(declare-fun noDuplicate!1245 (List!13421) Bool)

(assert (=> b!714023 (= res!477110 (noDuplicate!1245 acc!652))))

(declare-fun b!714024 () Bool)

(declare-fun res!477104 () Bool)

(assert (=> b!714024 (=> (not res!477104) (not e!401338))))

(assert (=> b!714024 (= res!477104 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!714025 () Bool)

(declare-fun res!477114 () Bool)

(assert (=> b!714025 (=> (not res!477114) (not e!401338))))

(declare-fun contains!3998 (List!13421 (_ BitVec 64)) Bool)

(assert (=> b!714025 (= res!477114 (not (contains!3998 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714026 () Bool)

(declare-fun res!477106 () Bool)

(assert (=> b!714026 (=> (not res!477106) (not e!401338))))

(declare-fun newAcc!49 () List!13421)

(declare-fun -!408 (List!13421 (_ BitVec 64)) List!13421)

(assert (=> b!714026 (= res!477106 (= (-!408 newAcc!49 k!2824) acc!652))))

(declare-fun b!714027 () Bool)

(declare-fun res!477113 () Bool)

(assert (=> b!714027 (=> (not res!477113) (not e!401338))))

(assert (=> b!714027 (= res!477113 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!714028 () Bool)

(declare-fun res!477107 () Bool)

(assert (=> b!714028 (=> (not res!477107) (not e!401338))))

(assert (=> b!714028 (= res!477107 (not (contains!3998 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714029 () Bool)

(declare-fun res!477117 () Bool)

(assert (=> b!714029 (=> (not res!477117) (not e!401338))))

(assert (=> b!714029 (= res!477117 (not (validKeyInArray!0 (select (arr!19380 a!3591) from!2969))))))

(declare-fun b!714030 () Bool)

(declare-fun res!477109 () Bool)

(assert (=> b!714030 (=> (not res!477109) (not e!401338))))

(assert (=> b!714030 (= res!477109 (not (contains!3998 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714020 () Bool)

(declare-fun res!477102 () Bool)

(assert (=> b!714020 (=> (not res!477102) (not e!401338))))

(assert (=> b!714020 (= res!477102 (not (contains!3998 acc!652 k!2824)))))

(declare-fun res!477103 () Bool)

(assert (=> start!63376 (=> (not res!477103) (not e!401338))))

(assert (=> start!63376 (= res!477103 (and (bvslt (size!19791 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19791 a!3591))))))

(assert (=> start!63376 e!401338))

(assert (=> start!63376 true))

(declare-fun array_inv!15176 (array!40480) Bool)

(assert (=> start!63376 (array_inv!15176 a!3591)))

(declare-fun b!714031 () Bool)

(declare-fun res!477108 () Bool)

(assert (=> b!714031 (=> (not res!477108) (not e!401338))))

(assert (=> b!714031 (= res!477108 (not (contains!3998 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714032 () Bool)

(declare-fun res!477111 () Bool)

(assert (=> b!714032 (=> (not res!477111) (not e!401338))))

(declare-fun subseq!443 (List!13421 List!13421) Bool)

(assert (=> b!714032 (= res!477111 (subseq!443 acc!652 newAcc!49))))

(declare-fun b!714033 () Bool)

(declare-fun res!477118 () Bool)

(assert (=> b!714033 (=> (not res!477118) (not e!401338))))

(assert (=> b!714033 (= res!477118 (contains!3998 newAcc!49 k!2824))))

(declare-fun b!714034 () Bool)

(declare-fun res!477112 () Bool)

(assert (=> b!714034 (=> (not res!477112) (not e!401338))))

(assert (=> b!714034 (= res!477112 (noDuplicate!1245 newAcc!49))))

(assert (= (and start!63376 res!477103) b!714023))

(assert (= (and b!714023 res!477110) b!714034))

(assert (= (and b!714034 res!477112) b!714025))

(assert (= (and b!714025 res!477114) b!714028))

(assert (= (and b!714028 res!477107) b!714027))

(assert (= (and b!714027 res!477113) b!714020))

(assert (= (and b!714020 res!477102) b!714021))

(assert (= (and b!714021 res!477105) b!714018))

(assert (= (and b!714018 res!477116) b!714032))

(assert (= (and b!714032 res!477111) b!714033))

(assert (= (and b!714033 res!477118) b!714026))

(assert (= (and b!714026 res!477106) b!714030))

(assert (= (and b!714030 res!477109) b!714031))

(assert (= (and b!714031 res!477108) b!714022))

(assert (= (and b!714022 res!477115) b!714029))

(assert (= (and b!714029 res!477117) b!714024))

(assert (= (and b!714024 res!477104) b!714019))

(declare-fun m!670651 () Bool)

(assert (=> b!714027 m!670651))

(declare-fun m!670653 () Bool)

(assert (=> b!714025 m!670653))

(declare-fun m!670655 () Bool)

(assert (=> b!714018 m!670655))

(declare-fun m!670657 () Bool)

(assert (=> b!714029 m!670657))

(assert (=> b!714029 m!670657))

(declare-fun m!670659 () Bool)

(assert (=> b!714029 m!670659))

(declare-fun m!670661 () Bool)

(assert (=> start!63376 m!670661))

(declare-fun m!670663 () Bool)

(assert (=> b!714034 m!670663))

(declare-fun m!670665 () Bool)

(assert (=> b!714030 m!670665))

(declare-fun m!670667 () Bool)

(assert (=> b!714020 m!670667))

(declare-fun m!670669 () Bool)

(assert (=> b!714026 m!670669))

(declare-fun m!670671 () Bool)

(assert (=> b!714019 m!670671))

(declare-fun m!670673 () Bool)

(assert (=> b!714021 m!670673))

(declare-fun m!670675 () Bool)

(assert (=> b!714028 m!670675))

(declare-fun m!670677 () Bool)

(assert (=> b!714031 m!670677))

(declare-fun m!670679 () Bool)

(assert (=> b!714023 m!670679))

(declare-fun m!670681 () Bool)

(assert (=> b!714032 m!670681))

(declare-fun m!670683 () Bool)

(assert (=> b!714033 m!670683))

(push 1)

(assert (not b!714033))

(assert (not b!714020))

(assert (not b!714032))

(assert (not b!714028))

(assert (not b!714026))

(assert (not b!714025))

(assert (not b!714023))

(assert (not b!714034))

(assert (not b!714019))

(assert (not b!714027))

(assert (not b!714021))

(assert (not b!714018))

(assert (not b!714031))

(assert (not b!714029))

(assert (not b!714030))

(assert (not start!63376))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!714176 () Bool)

(declare-fun e!401388 () Bool)

(declare-fun e!401386 () Bool)

(assert (=> b!714176 (= e!401388 e!401386)))

(declare-fun res!477251 () Bool)

(assert (=> b!714176 (=> (not res!477251) (not e!401386))))

(assert (=> b!714176 (= res!477251 (is-Cons!13417 newAcc!49))))

(declare-fun b!714179 () Bool)

(declare-fun e!401389 () Bool)

(assert (=> b!714179 (= e!401389 (subseq!443 acc!652 (t!19736 newAcc!49)))))

(declare-fun b!714177 () Bool)

(assert (=> b!714177 (= e!401386 e!401389)))

(declare-fun res!477250 () Bool)

(assert (=> b!714177 (=> res!477250 e!401389)))

(declare-fun e!401387 () Bool)

(assert (=> b!714177 (= res!477250 e!401387)))

(declare-fun res!477249 () Bool)

(assert (=> b!714177 (=> (not res!477249) (not e!401387))))

(assert (=> b!714177 (= res!477249 (= (h!14462 acc!652) (h!14462 newAcc!49)))))

(declare-fun d!98233 () Bool)

(declare-fun res!477248 () Bool)

(assert (=> d!98233 (=> res!477248 e!401388)))

(assert (=> d!98233 (= res!477248 (is-Nil!13418 acc!652))))

(assert (=> d!98233 (= (subseq!443 acc!652 newAcc!49) e!401388)))

(declare-fun b!714178 () Bool)

(assert (=> b!714178 (= e!401387 (subseq!443 (t!19736 acc!652) (t!19736 newAcc!49)))))

(assert (= (and d!98233 (not res!477248)) b!714176))

(assert (= (and b!714176 res!477251) b!714177))

(assert (= (and b!714177 res!477249) b!714178))

(assert (= (and b!714177 (not res!477250)) b!714179))

(declare-fun m!670779 () Bool)

(assert (=> b!714179 m!670779))

(declare-fun m!670781 () Bool)

(assert (=> b!714178 m!670781))

(assert (=> b!714032 d!98233))

(declare-fun d!98241 () Bool)

(assert (=> d!98241 (= (array_inv!15176 a!3591) (bvsge (size!19791 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63376 d!98241))

(declare-fun d!98245 () Bool)

(assert (=> d!98245 (= (validKeyInArray!0 k!2824) (and (not (= k!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!714021 d!98245))

(declare-fun d!98251 () Bool)

(declare-fun lt!318746 () Bool)

(declare-fun content!366 (List!13421) (Set (_ BitVec 64)))

(assert (=> d!98251 (= lt!318746 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!366 newAcc!49)))))

(declare-fun e!401426 () Bool)

(assert (=> d!98251 (= lt!318746 e!401426)))

(declare-fun res!477286 () Bool)

(assert (=> d!98251 (=> (not res!477286) (not e!401426))))

(assert (=> d!98251 (= res!477286 (is-Cons!13417 newAcc!49))))

(assert (=> d!98251 (= (contains!3998 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318746)))

(declare-fun b!714219 () Bool)

(declare-fun e!401427 () Bool)

(assert (=> b!714219 (= e!401426 e!401427)))

(declare-fun res!477285 () Bool)

(assert (=> b!714219 (=> res!477285 e!401427)))

(assert (=> b!714219 (= res!477285 (= (h!14462 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714220 () Bool)

(assert (=> b!714220 (= e!401427 (contains!3998 (t!19736 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98251 res!477286) b!714219))

(assert (= (and b!714219 (not res!477285)) b!714220))

(declare-fun m!670805 () Bool)

(assert (=> d!98251 m!670805))

(declare-fun m!670807 () Bool)

(assert (=> d!98251 m!670807))

(declare-fun m!670809 () Bool)

(assert (=> b!714220 m!670809))

(assert (=> b!714031 d!98251))

(declare-fun d!98261 () Bool)

(declare-fun lt!318747 () Bool)

(assert (=> d!98261 (= lt!318747 (set.member k!2824 (content!366 newAcc!49)))))

(declare-fun e!401430 () Bool)

(assert (=> d!98261 (= lt!318747 e!401430)))

(declare-fun res!477290 () Bool)

(assert (=> d!98261 (=> (not res!477290) (not e!401430))))

(assert (=> d!98261 (= res!477290 (is-Cons!13417 newAcc!49))))

(assert (=> d!98261 (= (contains!3998 newAcc!49 k!2824) lt!318747)))

(declare-fun b!714223 () Bool)

(declare-fun e!401431 () Bool)

(assert (=> b!714223 (= e!401430 e!401431)))

(declare-fun res!477289 () Bool)

(assert (=> b!714223 (=> res!477289 e!401431)))

(assert (=> b!714223 (= res!477289 (= (h!14462 newAcc!49) k!2824))))

(declare-fun b!714224 () Bool)

(assert (=> b!714224 (= e!401431 (contains!3998 (t!19736 newAcc!49) k!2824))))

(assert (= (and d!98261 res!477290) b!714223))

(assert (= (and b!714223 (not res!477289)) b!714224))

(assert (=> d!98261 m!670805))

(declare-fun m!670811 () Bool)

(assert (=> d!98261 m!670811))

(declare-fun m!670813 () Bool)

(assert (=> b!714224 m!670813))

(assert (=> b!714033 d!98261))

(declare-fun d!98263 () Bool)

(assert (=> d!98263 (= (validKeyInArray!0 (select (arr!19380 a!3591) from!2969)) (and (not (= (select (arr!19380 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19380 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!714029 d!98263))

(declare-fun b!714274 () Bool)

(declare-fun e!401478 () Bool)

(declare-fun call!34605 () Bool)

(assert (=> b!714274 (= e!401478 call!34605)))

(declare-fun bm!34602 () Bool)

(declare-fun c!78839 () Bool)

(assert (=> bm!34602 (= call!34605 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78839 (Cons!13417 (select (arr!19380 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun d!98267 () Bool)

(declare-fun res!477330 () Bool)

(declare-fun e!401477 () Bool)

(assert (=> d!98267 (=> res!477330 e!401477)))

(assert (=> d!98267 (= res!477330 (bvsge from!2969 (size!19791 a!3591)))))

(assert (=> d!98267 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!401477)))

(declare-fun b!714275 () Bool)

(assert (=> b!714275 (= e!401478 call!34605)))

(declare-fun b!714276 () Bool)

(declare-fun e!401476 () Bool)

(assert (=> b!714276 (= e!401476 e!401478)))

(assert (=> b!714276 (= c!78839 (validKeyInArray!0 (select (arr!19380 a!3591) from!2969)))))

(declare-fun e!401479 () Bool)

(declare-fun b!714277 () Bool)

(assert (=> b!714277 (= e!401479 (contains!3998 acc!652 (select (arr!19380 a!3591) from!2969)))))

(declare-fun b!714278 () Bool)

(assert (=> b!714278 (= e!401477 e!401476)))

(declare-fun res!477332 () Bool)

(assert (=> b!714278 (=> (not res!477332) (not e!401476))))

(assert (=> b!714278 (= res!477332 (not e!401479))))

(declare-fun res!477331 () Bool)

(assert (=> b!714278 (=> (not res!477331) (not e!401479))))

(assert (=> b!714278 (= res!477331 (validKeyInArray!0 (select (arr!19380 a!3591) from!2969)))))

(assert (= (and d!98267 (not res!477330)) b!714278))

(assert (= (and b!714278 res!477331) b!714277))

(assert (= (and b!714278 res!477332) b!714276))

(assert (= (and b!714276 c!78839) b!714275))

(assert (= (and b!714276 (not c!78839)) b!714274))

(assert (= (or b!714275 b!714274) bm!34602))

(assert (=> bm!34602 m!670657))

(declare-fun m!670855 () Bool)

(assert (=> bm!34602 m!670855))

(assert (=> b!714276 m!670657))

(assert (=> b!714276 m!670657))

(assert (=> b!714276 m!670659))

(assert (=> b!714277 m!670657))

(assert (=> b!714277 m!670657))

(declare-fun m!670859 () Bool)

(assert (=> b!714277 m!670859))

(assert (=> b!714278 m!670657))

(assert (=> b!714278 m!670657))

(assert (=> b!714278 m!670659))

(assert (=> b!714018 d!98267))

(declare-fun d!98293 () Bool)

(declare-fun lt!318753 () Bool)

(assert (=> d!98293 (= lt!318753 (set.member k!2824 (content!366 acc!652)))))

(declare-fun e!401482 () Bool)

(assert (=> d!98293 (= lt!318753 e!401482)))

(declare-fun res!477336 () Bool)

(assert (=> d!98293 (=> (not res!477336) (not e!401482))))

(assert (=> d!98293 (= res!477336 (is-Cons!13417 acc!652))))

(assert (=> d!98293 (= (contains!3998 acc!652 k!2824) lt!318753)))

(declare-fun b!714281 () Bool)

(declare-fun e!401483 () Bool)

(assert (=> b!714281 (= e!401482 e!401483)))

(declare-fun res!477335 () Bool)

(assert (=> b!714281 (=> res!477335 e!401483)))

(assert (=> b!714281 (= res!477335 (= (h!14462 acc!652) k!2824))))

(declare-fun b!714282 () Bool)

(assert (=> b!714282 (= e!401483 (contains!3998 (t!19736 acc!652) k!2824))))

(assert (= (and d!98293 res!477336) b!714281))

(assert (= (and b!714281 (not res!477335)) b!714282))

(declare-fun m!670863 () Bool)

(assert (=> d!98293 m!670863))

(declare-fun m!670865 () Bool)

(assert (=> d!98293 m!670865))

(declare-fun m!670867 () Bool)

(assert (=> b!714282 m!670867))

(assert (=> b!714020 d!98293))

(declare-fun d!98297 () Bool)

(declare-fun lt!318755 () Bool)

(assert (=> d!98297 (= lt!318755 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!366 newAcc!49)))))

(declare-fun e!401486 () Bool)

(assert (=> d!98297 (= lt!318755 e!401486)))

(declare-fun res!477340 () Bool)

(assert (=> d!98297 (=> (not res!477340) (not e!401486))))

(assert (=> d!98297 (= res!477340 (is-Cons!13417 newAcc!49))))

(assert (=> d!98297 (= (contains!3998 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318755)))

(declare-fun b!714285 () Bool)

(declare-fun e!401487 () Bool)

(assert (=> b!714285 (= e!401486 e!401487)))

(declare-fun res!477339 () Bool)

(assert (=> b!714285 (=> res!477339 e!401487)))

(assert (=> b!714285 (= res!477339 (= (h!14462 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714286 () Bool)

(assert (=> b!714286 (= e!401487 (contains!3998 (t!19736 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98297 res!477340) b!714285))

(assert (= (and b!714285 (not res!477339)) b!714286))

(assert (=> d!98297 m!670805))

(declare-fun m!670873 () Bool)

(assert (=> d!98297 m!670873))

(declare-fun m!670875 () Bool)

(assert (=> b!714286 m!670875))

(assert (=> b!714030 d!98297))

(declare-fun d!98301 () Bool)

(declare-fun res!477355 () Bool)

(declare-fun e!401507 () Bool)

(assert (=> d!98301 (=> res!477355 e!401507)))

(assert (=> d!98301 (= res!477355 (= (select (arr!19380 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k!2824))))

(assert (=> d!98301 (= (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!401507)))

(declare-fun b!714309 () Bool)

(declare-fun e!401508 () Bool)

(assert (=> b!714309 (= e!401507 e!401508)))

(declare-fun res!477356 () Bool)

(assert (=> b!714309 (=> (not res!477356) (not e!401508))))

(assert (=> b!714309 (= res!477356 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19791 a!3591)))))

(declare-fun b!714310 () Bool)

(assert (=> b!714310 (= e!401508 (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98301 (not res!477355)) b!714309))

(assert (= (and b!714309 res!477356) b!714310))

(declare-fun m!670882 () Bool)

(assert (=> d!98301 m!670882))

(declare-fun m!670885 () Bool)

(assert (=> b!714310 m!670885))

(assert (=> b!714019 d!98301))

(declare-fun b!714340 () Bool)

(declare-fun e!401533 () List!13421)

(declare-fun call!34611 () List!13421)

(assert (=> b!714340 (= e!401533 (Cons!13417 (h!14462 newAcc!49) call!34611))))

(declare-fun b!714341 () Bool)

(declare-fun e!401535 () List!13421)

(assert (=> b!714341 (= e!401535 e!401533)))

(declare-fun c!78851 () Bool)

(assert (=> b!714341 (= c!78851 (= k!2824 (h!14462 newAcc!49)))))

(declare-fun bm!34608 () Bool)

(assert (=> bm!34608 (= call!34611 (-!408 (t!19736 newAcc!49) k!2824))))

(declare-fun b!714342 () Bool)

(declare-fun lt!318762 () List!13421)

(declare-fun e!401534 () Bool)

(assert (=> b!714342 (= e!401534 (= (content!366 lt!318762) (set.minus (content!366 newAcc!49) (set.insert k!2824 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun b!714343 () Bool)

(assert (=> b!714343 (= e!401533 call!34611)))

(declare-fun d!98305 () Bool)

(assert (=> d!98305 e!401534))

(declare-fun res!477374 () Bool)

(assert (=> d!98305 (=> (not res!477374) (not e!401534))))

(declare-fun size!19795 (List!13421) Int)

(assert (=> d!98305 (= res!477374 (<= (size!19795 lt!318762) (size!19795 newAcc!49)))))

(assert (=> d!98305 (= lt!318762 e!401535)))

(declare-fun c!78850 () Bool)

(assert (=> d!98305 (= c!78850 (is-Cons!13417 newAcc!49))))

(assert (=> d!98305 (= (-!408 newAcc!49 k!2824) lt!318762)))

(declare-fun b!714344 () Bool)

(assert (=> b!714344 (= e!401535 Nil!13418)))

(assert (= (and d!98305 c!78850) b!714341))

(assert (= (and d!98305 (not c!78850)) b!714344))

(assert (= (and b!714341 c!78851) b!714343))

(assert (= (and b!714341 (not c!78851)) b!714340))

(assert (= (or b!714343 b!714340) bm!34608))

(assert (= (and d!98305 res!477374) b!714342))

