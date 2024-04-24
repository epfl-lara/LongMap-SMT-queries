; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116632 () Bool)

(assert start!116632)

(declare-datatypes ((array!93256 0))(
  ( (array!93257 (arr!45031 (Array (_ BitVec 32) (_ BitVec 64))) (size!45582 (_ BitVec 32))) )
))
(declare-fun a!3861 () array!93256)

(declare-datatypes ((List!32086 0))(
  ( (Nil!32083) (Cons!32082 (h!33300 (_ BitVec 64)) (t!46772 List!32086)) )
))
(declare-fun newAcc!98 () List!32086)

(declare-fun b!1374950 () Bool)

(declare-fun from!3239 () (_ BitVec 32))

(declare-fun e!778991 () Bool)

(declare-fun arrayNoDuplicates!0 (array!93256 (_ BitVec 32) List!32086) Bool)

(assert (=> b!1374950 (= e!778991 (not (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98)))))

(declare-fun b!1374951 () Bool)

(declare-fun res!917380 () Bool)

(declare-fun e!778993 () Bool)

(assert (=> b!1374951 (=> (not res!917380) (not e!778993))))

(declare-fun contains!9771 (List!32086 (_ BitVec 64)) Bool)

(assert (=> b!1374951 (= res!917380 (not (contains!9771 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374952 () Bool)

(declare-fun res!917379 () Bool)

(assert (=> b!1374952 (=> (not res!917379) (not e!778993))))

(declare-fun acc!866 () List!32086)

(assert (=> b!1374952 (= res!917379 (not (contains!9771 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!917383 () Bool)

(assert (=> start!116632 (=> (not res!917383) (not e!778993))))

(assert (=> start!116632 (= res!917383 (and (bvslt (size!45582 a!3861) #b01111111111111111111111111111111) (bvsge from!3239 #b00000000000000000000000000000000) (bvsle from!3239 (size!45582 a!3861))))))

(assert (=> start!116632 e!778993))

(declare-fun array_inv!34312 (array!93256) Bool)

(assert (=> start!116632 (array_inv!34312 a!3861)))

(assert (=> start!116632 true))

(declare-fun b!1374953 () Bool)

(declare-fun res!917381 () Bool)

(assert (=> b!1374953 (=> (not res!917381) (not e!778993))))

(assert (=> b!1374953 (= res!917381 (not (contains!9771 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374954 () Bool)

(declare-fun res!917385 () Bool)

(assert (=> b!1374954 (=> (not res!917385) (not e!778993))))

(declare-fun noDuplicate!2602 (List!32086) Bool)

(assert (=> b!1374954 (= res!917385 (noDuplicate!2602 acc!866))))

(declare-fun b!1374955 () Bool)

(declare-fun res!917377 () Bool)

(assert (=> b!1374955 (=> (not res!917377) (not e!778993))))

(assert (=> b!1374955 (= res!917377 (not (contains!9771 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1374956 () Bool)

(declare-fun res!917384 () Bool)

(assert (=> b!1374956 (=> (not res!917384) (not e!778991))))

(assert (=> b!1374956 (= res!917384 (bvsge from!3239 (size!45582 a!3861)))))

(declare-fun b!1374957 () Bool)

(declare-fun res!917378 () Bool)

(assert (=> b!1374957 (=> (not res!917378) (not e!778993))))

(declare-fun subseq!1130 (List!32086 List!32086) Bool)

(assert (=> b!1374957 (= res!917378 (subseq!1130 newAcc!98 acc!866))))

(declare-fun b!1374958 () Bool)

(assert (=> b!1374958 (= e!778993 e!778991)))

(declare-fun res!917382 () Bool)

(assert (=> b!1374958 (=> (not res!917382) (not e!778991))))

(assert (=> b!1374958 (= res!917382 (arrayNoDuplicates!0 a!3861 from!3239 acc!866))))

(declare-datatypes ((Unit!45332 0))(
  ( (Unit!45333) )
))
(declare-fun lt!603567 () Unit!45332)

(declare-fun noDuplicateSubseq!317 (List!32086 List!32086) Unit!45332)

(assert (=> b!1374958 (= lt!603567 (noDuplicateSubseq!317 newAcc!98 acc!866))))

(assert (= (and start!116632 res!917383) b!1374954))

(assert (= (and b!1374954 res!917385) b!1374952))

(assert (= (and b!1374952 res!917379) b!1374955))

(assert (= (and b!1374955 res!917377) b!1374951))

(assert (= (and b!1374951 res!917380) b!1374953))

(assert (= (and b!1374953 res!917381) b!1374957))

(assert (= (and b!1374957 res!917378) b!1374958))

(assert (= (and b!1374958 res!917382) b!1374956))

(assert (= (and b!1374956 res!917384) b!1374950))

(declare-fun m!1258465 () Bool)

(assert (=> b!1374958 m!1258465))

(declare-fun m!1258467 () Bool)

(assert (=> b!1374958 m!1258467))

(declare-fun m!1258469 () Bool)

(assert (=> b!1374957 m!1258469))

(declare-fun m!1258471 () Bool)

(assert (=> b!1374955 m!1258471))

(declare-fun m!1258473 () Bool)

(assert (=> b!1374951 m!1258473))

(declare-fun m!1258475 () Bool)

(assert (=> b!1374954 m!1258475))

(declare-fun m!1258477 () Bool)

(assert (=> b!1374953 m!1258477))

(declare-fun m!1258479 () Bool)

(assert (=> start!116632 m!1258479))

(declare-fun m!1258481 () Bool)

(assert (=> b!1374952 m!1258481))

(declare-fun m!1258483 () Bool)

(assert (=> b!1374950 m!1258483))

(check-sat (not b!1374950) (not start!116632) (not b!1374954) (not b!1374957) (not b!1374958) (not b!1374952) (not b!1374953) (not b!1374955) (not b!1374951))
(check-sat)
(get-model)

(declare-fun d!148485 () Bool)

(declare-fun res!917444 () Bool)

(declare-fun e!779016 () Bool)

(assert (=> d!148485 (=> res!917444 e!779016)))

(get-info :version)

(assert (=> d!148485 (= res!917444 ((_ is Nil!32083) acc!866))))

(assert (=> d!148485 (= (noDuplicate!2602 acc!866) e!779016)))

(declare-fun b!1375017 () Bool)

(declare-fun e!779017 () Bool)

(assert (=> b!1375017 (= e!779016 e!779017)))

(declare-fun res!917445 () Bool)

(assert (=> b!1375017 (=> (not res!917445) (not e!779017))))

(assert (=> b!1375017 (= res!917445 (not (contains!9771 (t!46772 acc!866) (h!33300 acc!866))))))

(declare-fun b!1375018 () Bool)

(assert (=> b!1375018 (= e!779017 (noDuplicate!2602 (t!46772 acc!866)))))

(assert (= (and d!148485 (not res!917444)) b!1375017))

(assert (= (and b!1375017 res!917445) b!1375018))

(declare-fun m!1258525 () Bool)

(assert (=> b!1375017 m!1258525))

(declare-fun m!1258527 () Bool)

(assert (=> b!1375018 m!1258527))

(assert (=> b!1374954 d!148485))

(declare-fun d!148487 () Bool)

(declare-fun lt!603576 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!749 (List!32086) (InoxSet (_ BitVec 64)))

(assert (=> d!148487 (= lt!603576 (select (content!749 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!779022 () Bool)

(assert (=> d!148487 (= lt!603576 e!779022)))

(declare-fun res!917450 () Bool)

(assert (=> d!148487 (=> (not res!917450) (not e!779022))))

(assert (=> d!148487 (= res!917450 ((_ is Cons!32082) acc!866))))

(assert (=> d!148487 (= (contains!9771 acc!866 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603576)))

(declare-fun b!1375023 () Bool)

(declare-fun e!779023 () Bool)

(assert (=> b!1375023 (= e!779022 e!779023)))

(declare-fun res!917451 () Bool)

(assert (=> b!1375023 (=> res!917451 e!779023)))

(assert (=> b!1375023 (= res!917451 (= (h!33300 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1375024 () Bool)

(assert (=> b!1375024 (= e!779023 (contains!9771 (t!46772 acc!866) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148487 res!917450) b!1375023))

(assert (= (and b!1375023 (not res!917451)) b!1375024))

(declare-fun m!1258529 () Bool)

(assert (=> d!148487 m!1258529))

(declare-fun m!1258531 () Bool)

(assert (=> d!148487 m!1258531))

(declare-fun m!1258533 () Bool)

(assert (=> b!1375024 m!1258533))

(assert (=> b!1374955 d!148487))

(declare-fun b!1375068 () Bool)

(declare-fun e!779062 () Bool)

(declare-fun call!65703 () Bool)

(assert (=> b!1375068 (= e!779062 call!65703)))

(declare-fun b!1375069 () Bool)

(declare-fun e!779060 () Bool)

(assert (=> b!1375069 (= e!779060 e!779062)))

(declare-fun c!128241 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375069 (= c!128241 (validKeyInArray!0 (select (arr!45031 a!3861) from!3239)))))

(declare-fun b!1375070 () Bool)

(assert (=> b!1375070 (= e!779062 call!65703)))

(declare-fun e!779063 () Bool)

(declare-fun b!1375071 () Bool)

(assert (=> b!1375071 (= e!779063 (contains!9771 newAcc!98 (select (arr!45031 a!3861) from!3239)))))

(declare-fun bm!65700 () Bool)

(assert (=> bm!65700 (= call!65703 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!128241 (Cons!32082 (select (arr!45031 a!3861) from!3239) newAcc!98) newAcc!98)))))

(declare-fun b!1375072 () Bool)

(declare-fun e!779061 () Bool)

(assert (=> b!1375072 (= e!779061 e!779060)))

(declare-fun res!917482 () Bool)

(assert (=> b!1375072 (=> (not res!917482) (not e!779060))))

(assert (=> b!1375072 (= res!917482 (not e!779063))))

(declare-fun res!917483 () Bool)

(assert (=> b!1375072 (=> (not res!917483) (not e!779063))))

(assert (=> b!1375072 (= res!917483 (validKeyInArray!0 (select (arr!45031 a!3861) from!3239)))))

(declare-fun d!148493 () Bool)

(declare-fun res!917481 () Bool)

(assert (=> d!148493 (=> res!917481 e!779061)))

(assert (=> d!148493 (= res!917481 (bvsge from!3239 (size!45582 a!3861)))))

(assert (=> d!148493 (= (arrayNoDuplicates!0 a!3861 from!3239 newAcc!98) e!779061)))

(assert (= (and d!148493 (not res!917481)) b!1375072))

(assert (= (and b!1375072 res!917483) b!1375071))

(assert (= (and b!1375072 res!917482) b!1375069))

(assert (= (and b!1375069 c!128241) b!1375068))

(assert (= (and b!1375069 (not c!128241)) b!1375070))

(assert (= (or b!1375068 b!1375070) bm!65700))

(declare-fun m!1258549 () Bool)

(assert (=> b!1375069 m!1258549))

(assert (=> b!1375069 m!1258549))

(declare-fun m!1258551 () Bool)

(assert (=> b!1375069 m!1258551))

(assert (=> b!1375071 m!1258549))

(assert (=> b!1375071 m!1258549))

(declare-fun m!1258553 () Bool)

(assert (=> b!1375071 m!1258553))

(assert (=> bm!65700 m!1258549))

(declare-fun m!1258555 () Bool)

(assert (=> bm!65700 m!1258555))

(assert (=> b!1375072 m!1258549))

(assert (=> b!1375072 m!1258549))

(assert (=> b!1375072 m!1258551))

(assert (=> b!1374950 d!148493))

(declare-fun d!148499 () Bool)

(assert (=> d!148499 (= (array_inv!34312 a!3861) (bvsge (size!45582 a!3861) #b00000000000000000000000000000000))))

(assert (=> start!116632 d!148499))

(declare-fun d!148503 () Bool)

(declare-fun lt!603583 () Bool)

(assert (=> d!148503 (= lt!603583 (select (content!749 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!779065 () Bool)

(assert (=> d!148503 (= lt!603583 e!779065)))

(declare-fun res!917485 () Bool)

(assert (=> d!148503 (=> (not res!917485) (not e!779065))))

(assert (=> d!148503 (= res!917485 ((_ is Cons!32082) newAcc!98))))

(assert (=> d!148503 (= (contains!9771 newAcc!98 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603583)))

(declare-fun b!1375074 () Bool)

(declare-fun e!779066 () Bool)

(assert (=> b!1375074 (= e!779065 e!779066)))

(declare-fun res!917486 () Bool)

(assert (=> b!1375074 (=> res!917486 e!779066)))

(assert (=> b!1375074 (= res!917486 (= (h!33300 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1375075 () Bool)

(assert (=> b!1375075 (= e!779066 (contains!9771 (t!46772 newAcc!98) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148503 res!917485) b!1375074))

(assert (= (and b!1375074 (not res!917486)) b!1375075))

(declare-fun m!1258561 () Bool)

(assert (=> d!148503 m!1258561))

(declare-fun m!1258563 () Bool)

(assert (=> d!148503 m!1258563))

(declare-fun m!1258565 () Bool)

(assert (=> b!1375075 m!1258565))

(assert (=> b!1374951 d!148503))

(declare-fun b!1375105 () Bool)

(declare-fun e!779094 () Bool)

(declare-fun e!779095 () Bool)

(assert (=> b!1375105 (= e!779094 e!779095)))

(declare-fun res!917513 () Bool)

(assert (=> b!1375105 (=> res!917513 e!779095)))

(declare-fun e!779096 () Bool)

(assert (=> b!1375105 (= res!917513 e!779096)))

(declare-fun res!917516 () Bool)

(assert (=> b!1375105 (=> (not res!917516) (not e!779096))))

(assert (=> b!1375105 (= res!917516 (= (h!33300 newAcc!98) (h!33300 acc!866)))))

(declare-fun b!1375106 () Bool)

(assert (=> b!1375106 (= e!779096 (subseq!1130 (t!46772 newAcc!98) (t!46772 acc!866)))))

(declare-fun b!1375107 () Bool)

(assert (=> b!1375107 (= e!779095 (subseq!1130 newAcc!98 (t!46772 acc!866)))))

(declare-fun d!148505 () Bool)

(declare-fun res!917515 () Bool)

(declare-fun e!779097 () Bool)

(assert (=> d!148505 (=> res!917515 e!779097)))

(assert (=> d!148505 (= res!917515 ((_ is Nil!32083) newAcc!98))))

(assert (=> d!148505 (= (subseq!1130 newAcc!98 acc!866) e!779097)))

(declare-fun b!1375104 () Bool)

(assert (=> b!1375104 (= e!779097 e!779094)))

(declare-fun res!917514 () Bool)

(assert (=> b!1375104 (=> (not res!917514) (not e!779094))))

(assert (=> b!1375104 (= res!917514 ((_ is Cons!32082) acc!866))))

(assert (= (and d!148505 (not res!917515)) b!1375104))

(assert (= (and b!1375104 res!917514) b!1375105))

(assert (= (and b!1375105 res!917516) b!1375106))

(assert (= (and b!1375105 (not res!917513)) b!1375107))

(declare-fun m!1258583 () Bool)

(assert (=> b!1375106 m!1258583))

(declare-fun m!1258587 () Bool)

(assert (=> b!1375107 m!1258587))

(assert (=> b!1374957 d!148505))

(declare-fun d!148513 () Bool)

(declare-fun lt!603588 () Bool)

(assert (=> d!148513 (= lt!603588 (select (content!749 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!779100 () Bool)

(assert (=> d!148513 (= lt!603588 e!779100)))

(declare-fun res!917519 () Bool)

(assert (=> d!148513 (=> (not res!917519) (not e!779100))))

(assert (=> d!148513 (= res!917519 ((_ is Cons!32082) acc!866))))

(assert (=> d!148513 (= (contains!9771 acc!866 #b0000000000000000000000000000000000000000000000000000000000000000) lt!603588)))

(declare-fun b!1375110 () Bool)

(declare-fun e!779101 () Bool)

(assert (=> b!1375110 (= e!779100 e!779101)))

(declare-fun res!917520 () Bool)

(assert (=> b!1375110 (=> res!917520 e!779101)))

(assert (=> b!1375110 (= res!917520 (= (h!33300 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1375111 () Bool)

(assert (=> b!1375111 (= e!779101 (contains!9771 (t!46772 acc!866) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148513 res!917519) b!1375110))

(assert (= (and b!1375110 (not res!917520)) b!1375111))

(assert (=> d!148513 m!1258529))

(declare-fun m!1258593 () Bool)

(assert (=> d!148513 m!1258593))

(declare-fun m!1258595 () Bool)

(assert (=> b!1375111 m!1258595))

(assert (=> b!1374952 d!148513))

(declare-fun b!1375114 () Bool)

(declare-fun e!779106 () Bool)

(declare-fun call!65705 () Bool)

(assert (=> b!1375114 (= e!779106 call!65705)))

(declare-fun b!1375115 () Bool)

(declare-fun e!779104 () Bool)

(assert (=> b!1375115 (= e!779104 e!779106)))

(declare-fun c!128243 () Bool)

(assert (=> b!1375115 (= c!128243 (validKeyInArray!0 (select (arr!45031 a!3861) from!3239)))))

(declare-fun b!1375116 () Bool)

(assert (=> b!1375116 (= e!779106 call!65705)))

(declare-fun e!779107 () Bool)

(declare-fun b!1375117 () Bool)

(assert (=> b!1375117 (= e!779107 (contains!9771 acc!866 (select (arr!45031 a!3861) from!3239)))))

(declare-fun bm!65702 () Bool)

(assert (=> bm!65702 (= call!65705 (arrayNoDuplicates!0 a!3861 (bvadd from!3239 #b00000000000000000000000000000001) (ite c!128243 (Cons!32082 (select (arr!45031 a!3861) from!3239) acc!866) acc!866)))))

(declare-fun b!1375118 () Bool)

(declare-fun e!779105 () Bool)

(assert (=> b!1375118 (= e!779105 e!779104)))

(declare-fun res!917524 () Bool)

(assert (=> b!1375118 (=> (not res!917524) (not e!779104))))

(assert (=> b!1375118 (= res!917524 (not e!779107))))

(declare-fun res!917525 () Bool)

(assert (=> b!1375118 (=> (not res!917525) (not e!779107))))

(assert (=> b!1375118 (= res!917525 (validKeyInArray!0 (select (arr!45031 a!3861) from!3239)))))

(declare-fun d!148517 () Bool)

(declare-fun res!917523 () Bool)

(assert (=> d!148517 (=> res!917523 e!779105)))

(assert (=> d!148517 (= res!917523 (bvsge from!3239 (size!45582 a!3861)))))

(assert (=> d!148517 (= (arrayNoDuplicates!0 a!3861 from!3239 acc!866) e!779105)))

(assert (= (and d!148517 (not res!917523)) b!1375118))

(assert (= (and b!1375118 res!917525) b!1375117))

(assert (= (and b!1375118 res!917524) b!1375115))

(assert (= (and b!1375115 c!128243) b!1375114))

(assert (= (and b!1375115 (not c!128243)) b!1375116))

(assert (= (or b!1375114 b!1375116) bm!65702))

(assert (=> b!1375115 m!1258549))

(assert (=> b!1375115 m!1258549))

(assert (=> b!1375115 m!1258551))

(assert (=> b!1375117 m!1258549))

(assert (=> b!1375117 m!1258549))

(declare-fun m!1258601 () Bool)

(assert (=> b!1375117 m!1258601))

(assert (=> bm!65702 m!1258549))

(declare-fun m!1258603 () Bool)

(assert (=> bm!65702 m!1258603))

(assert (=> b!1375118 m!1258549))

(assert (=> b!1375118 m!1258549))

(assert (=> b!1375118 m!1258551))

(assert (=> b!1374958 d!148517))

(declare-fun d!148521 () Bool)

(assert (=> d!148521 (noDuplicate!2602 newAcc!98)))

(declare-fun lt!603598 () Unit!45332)

(declare-fun choose!2024 (List!32086 List!32086) Unit!45332)

(assert (=> d!148521 (= lt!603598 (choose!2024 newAcc!98 acc!866))))

(declare-fun e!779134 () Bool)

(assert (=> d!148521 e!779134))

(declare-fun res!917552 () Bool)

(assert (=> d!148521 (=> (not res!917552) (not e!779134))))

(assert (=> d!148521 (= res!917552 (subseq!1130 newAcc!98 acc!866))))

(assert (=> d!148521 (= (noDuplicateSubseq!317 newAcc!98 acc!866) lt!603598)))

(declare-fun b!1375144 () Bool)

(assert (=> b!1375144 (= e!779134 (noDuplicate!2602 acc!866))))

(assert (= (and d!148521 res!917552) b!1375144))

(declare-fun m!1258633 () Bool)

(assert (=> d!148521 m!1258633))

(declare-fun m!1258635 () Bool)

(assert (=> d!148521 m!1258635))

(assert (=> d!148521 m!1258469))

(assert (=> b!1375144 m!1258475))

(assert (=> b!1374958 d!148521))

(declare-fun d!148537 () Bool)

(declare-fun lt!603599 () Bool)

(assert (=> d!148537 (= lt!603599 (select (content!749 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!779137 () Bool)

(assert (=> d!148537 (= lt!603599 e!779137)))

(declare-fun res!917553 () Bool)

(assert (=> d!148537 (=> (not res!917553) (not e!779137))))

(assert (=> d!148537 (= res!917553 ((_ is Cons!32082) newAcc!98))))

(assert (=> d!148537 (= (contains!9771 newAcc!98 #b1000000000000000000000000000000000000000000000000000000000000000) lt!603599)))

(declare-fun b!1375150 () Bool)

(declare-fun e!779138 () Bool)

(assert (=> b!1375150 (= e!779137 e!779138)))

(declare-fun res!917554 () Bool)

(assert (=> b!1375150 (=> res!917554 e!779138)))

(assert (=> b!1375150 (= res!917554 (= (h!33300 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1375151 () Bool)

(assert (=> b!1375151 (= e!779138 (contains!9771 (t!46772 newAcc!98) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!148537 res!917553) b!1375150))

(assert (= (and b!1375150 (not res!917554)) b!1375151))

(assert (=> d!148537 m!1258561))

(declare-fun m!1258639 () Bool)

(assert (=> d!148537 m!1258639))

(declare-fun m!1258641 () Bool)

(assert (=> b!1375151 m!1258641))

(assert (=> b!1374953 d!148537))

(check-sat (not b!1375075) (not d!148537) (not b!1375117) (not b!1375106) (not b!1375024) (not b!1375151) (not d!148487) (not b!1375111) (not bm!65700) (not d!148513) (not b!1375107) (not b!1375115) (not b!1375144) (not b!1375018) (not d!148521) (not bm!65702) (not b!1375118) (not b!1375071) (not b!1375017) (not b!1375072) (not d!148503) (not b!1375069))
(check-sat)
