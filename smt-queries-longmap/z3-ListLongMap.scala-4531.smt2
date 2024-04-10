; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62656 () Bool)

(assert start!62656)

(declare-fun b!707495 () Bool)

(declare-fun res!471307 () Bool)

(declare-fun e!398107 () Bool)

(assert (=> b!707495 (=> (not res!471307) (not e!398107))))

(declare-datatypes ((List!13365 0))(
  ( (Nil!13362) (Cons!13361 (h!14406 (_ BitVec 64)) (t!19647 List!13365)) )
))
(declare-fun acc!652 () List!13365)

(declare-fun contains!3942 (List!13365 (_ BitVec 64)) Bool)

(assert (=> b!707495 (= res!471307 (not (contains!3942 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!471311 () Bool)

(assert (=> start!62656 (=> (not res!471311) (not e!398107))))

(declare-datatypes ((array!40335 0))(
  ( (array!40336 (arr!19324 (Array (_ BitVec 32) (_ BitVec 64))) (size!19709 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40335)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62656 (= res!471311 (and (bvslt (size!19709 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19709 a!3591))))))

(assert (=> start!62656 e!398107))

(assert (=> start!62656 true))

(declare-fun array_inv!15120 (array!40335) Bool)

(assert (=> start!62656 (array_inv!15120 a!3591)))

(declare-fun b!707496 () Bool)

(declare-fun res!471315 () Bool)

(assert (=> b!707496 (=> (not res!471315) (not e!398107))))

(assert (=> b!707496 (= res!471315 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!707497 () Bool)

(declare-fun res!471319 () Bool)

(assert (=> b!707497 (=> (not res!471319) (not e!398107))))

(assert (=> b!707497 (= res!471319 (not (contains!3942 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707498 () Bool)

(declare-fun res!471312 () Bool)

(assert (=> b!707498 (=> (not res!471312) (not e!398107))))

(declare-fun newAcc!49 () List!13365)

(declare-fun k0!2824 () (_ BitVec 64))

(assert (=> b!707498 (= res!471312 (contains!3942 newAcc!49 k0!2824))))

(declare-fun b!707499 () Bool)

(declare-fun res!471313 () Bool)

(assert (=> b!707499 (=> (not res!471313) (not e!398107))))

(declare-fun subseq!387 (List!13365 List!13365) Bool)

(assert (=> b!707499 (= res!471313 (subseq!387 acc!652 newAcc!49))))

(declare-fun b!707500 () Bool)

(declare-fun res!471314 () Bool)

(assert (=> b!707500 (=> (not res!471314) (not e!398107))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!707500 (= res!471314 (validKeyInArray!0 (select (arr!19324 a!3591) from!2969)))))

(declare-fun b!707501 () Bool)

(declare-fun res!471309 () Bool)

(assert (=> b!707501 (=> (not res!471309) (not e!398107))))

(assert (=> b!707501 (= res!471309 (not (contains!3942 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707502 () Bool)

(declare-fun res!471306 () Bool)

(assert (=> b!707502 (=> (not res!471306) (not e!398107))))

(declare-fun arrayNoDuplicates!0 (array!40335 (_ BitVec 32) List!13365) Bool)

(assert (=> b!707502 (= res!471306 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!707503 () Bool)

(declare-fun res!471305 () Bool)

(assert (=> b!707503 (=> (not res!471305) (not e!398107))))

(assert (=> b!707503 (= res!471305 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19709 a!3591)))))

(declare-fun b!707504 () Bool)

(declare-fun res!471317 () Bool)

(assert (=> b!707504 (=> (not res!471317) (not e!398107))))

(assert (=> b!707504 (= res!471317 (not (contains!3942 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707505 () Bool)

(declare-fun res!471321 () Bool)

(assert (=> b!707505 (=> (not res!471321) (not e!398107))))

(assert (=> b!707505 (= res!471321 (validKeyInArray!0 k0!2824))))

(declare-fun b!707506 () Bool)

(declare-fun res!471318 () Bool)

(assert (=> b!707506 (=> (not res!471318) (not e!398107))))

(assert (=> b!707506 (= res!471318 (not (contains!3942 acc!652 k0!2824)))))

(declare-fun b!707507 () Bool)

(declare-fun res!471320 () Bool)

(assert (=> b!707507 (=> (not res!471320) (not e!398107))))

(declare-fun noDuplicate!1189 (List!13365) Bool)

(assert (=> b!707507 (= res!471320 (noDuplicate!1189 acc!652))))

(declare-fun b!707508 () Bool)

(declare-fun res!471316 () Bool)

(assert (=> b!707508 (=> (not res!471316) (not e!398107))))

(declare-fun -!352 (List!13365 (_ BitVec 64)) List!13365)

(assert (=> b!707508 (= res!471316 (= (-!352 newAcc!49 k0!2824) acc!652))))

(declare-fun b!707509 () Bool)

(declare-fun $colon$colon!498 (List!13365 (_ BitVec 64)) List!13365)

(assert (=> b!707509 (= e!398107 (not (noDuplicate!1189 ($colon$colon!498 acc!652 (select (arr!19324 a!3591) from!2969)))))))

(declare-fun b!707510 () Bool)

(declare-fun res!471310 () Bool)

(assert (=> b!707510 (=> (not res!471310) (not e!398107))))

(declare-fun arrayContainsKey!0 (array!40335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!707510 (= res!471310 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!707511 () Bool)

(declare-fun res!471308 () Bool)

(assert (=> b!707511 (=> (not res!471308) (not e!398107))))

(assert (=> b!707511 (= res!471308 (noDuplicate!1189 newAcc!49))))

(assert (= (and start!62656 res!471311) b!707507))

(assert (= (and b!707507 res!471320) b!707511))

(assert (= (and b!707511 res!471308) b!707497))

(assert (= (and b!707497 res!471319) b!707495))

(assert (= (and b!707495 res!471307) b!707510))

(assert (= (and b!707510 res!471310) b!707506))

(assert (= (and b!707506 res!471318) b!707505))

(assert (= (and b!707505 res!471321) b!707502))

(assert (= (and b!707502 res!471306) b!707499))

(assert (= (and b!707499 res!471313) b!707498))

(assert (= (and b!707498 res!471312) b!707508))

(assert (= (and b!707508 res!471316) b!707504))

(assert (= (and b!707504 res!471317) b!707501))

(assert (= (and b!707501 res!471309) b!707503))

(assert (= (and b!707503 res!471305) b!707500))

(assert (= (and b!707500 res!471314) b!707496))

(assert (= (and b!707496 res!471315) b!707509))

(declare-fun m!665047 () Bool)

(assert (=> start!62656 m!665047))

(declare-fun m!665049 () Bool)

(assert (=> b!707499 m!665049))

(declare-fun m!665051 () Bool)

(assert (=> b!707501 m!665051))

(declare-fun m!665053 () Bool)

(assert (=> b!707508 m!665053))

(declare-fun m!665055 () Bool)

(assert (=> b!707498 m!665055))

(declare-fun m!665057 () Bool)

(assert (=> b!707502 m!665057))

(declare-fun m!665059 () Bool)

(assert (=> b!707507 m!665059))

(declare-fun m!665061 () Bool)

(assert (=> b!707506 m!665061))

(declare-fun m!665063 () Bool)

(assert (=> b!707511 m!665063))

(declare-fun m!665065 () Bool)

(assert (=> b!707497 m!665065))

(declare-fun m!665067 () Bool)

(assert (=> b!707495 m!665067))

(declare-fun m!665069 () Bool)

(assert (=> b!707505 m!665069))

(declare-fun m!665071 () Bool)

(assert (=> b!707500 m!665071))

(assert (=> b!707500 m!665071))

(declare-fun m!665073 () Bool)

(assert (=> b!707500 m!665073))

(assert (=> b!707509 m!665071))

(assert (=> b!707509 m!665071))

(declare-fun m!665075 () Bool)

(assert (=> b!707509 m!665075))

(assert (=> b!707509 m!665075))

(declare-fun m!665077 () Bool)

(assert (=> b!707509 m!665077))

(declare-fun m!665079 () Bool)

(assert (=> b!707504 m!665079))

(declare-fun m!665081 () Bool)

(assert (=> b!707510 m!665081))

(check-sat (not b!707508) (not b!707497) (not b!707509) (not b!707510) (not b!707500) (not b!707502) (not b!707511) (not b!707495) (not b!707505) (not b!707504) (not start!62656) (not b!707498) (not b!707507) (not b!707501) (not b!707506) (not b!707499))
(check-sat)
(get-model)

(declare-fun d!96499 () Bool)

(declare-fun res!471377 () Bool)

(declare-fun e!398118 () Bool)

(assert (=> d!96499 (=> res!471377 e!398118)))

(get-info :version)

(assert (=> d!96499 (= res!471377 ((_ is Nil!13362) newAcc!49))))

(assert (=> d!96499 (= (noDuplicate!1189 newAcc!49) e!398118)))

(declare-fun b!707567 () Bool)

(declare-fun e!398119 () Bool)

(assert (=> b!707567 (= e!398118 e!398119)))

(declare-fun res!471378 () Bool)

(assert (=> b!707567 (=> (not res!471378) (not e!398119))))

(assert (=> b!707567 (= res!471378 (not (contains!3942 (t!19647 newAcc!49) (h!14406 newAcc!49))))))

(declare-fun b!707568 () Bool)

(assert (=> b!707568 (= e!398119 (noDuplicate!1189 (t!19647 newAcc!49)))))

(assert (= (and d!96499 (not res!471377)) b!707567))

(assert (= (and b!707567 res!471378) b!707568))

(declare-fun m!665119 () Bool)

(assert (=> b!707567 m!665119))

(declare-fun m!665121 () Bool)

(assert (=> b!707568 m!665121))

(assert (=> b!707511 d!96499))

(declare-fun d!96501 () Bool)

(assert (=> d!96501 (= (validKeyInArray!0 (select (arr!19324 a!3591) from!2969)) (and (not (= (select (arr!19324 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19324 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!707500 d!96501))

(declare-fun d!96503 () Bool)

(declare-fun res!471383 () Bool)

(declare-fun e!398124 () Bool)

(assert (=> d!96503 (=> res!471383 e!398124)))

(assert (=> d!96503 (= res!471383 (= (select (arr!19324 a!3591) from!2969) k0!2824))))

(assert (=> d!96503 (= (arrayContainsKey!0 a!3591 k0!2824 from!2969) e!398124)))

(declare-fun b!707573 () Bool)

(declare-fun e!398125 () Bool)

(assert (=> b!707573 (= e!398124 e!398125)))

(declare-fun res!471384 () Bool)

(assert (=> b!707573 (=> (not res!471384) (not e!398125))))

(assert (=> b!707573 (= res!471384 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19709 a!3591)))))

(declare-fun b!707574 () Bool)

(assert (=> b!707574 (= e!398125 (arrayContainsKey!0 a!3591 k0!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!96503 (not res!471383)) b!707573))

(assert (= (and b!707573 res!471384) b!707574))

(assert (=> d!96503 m!665071))

(declare-fun m!665123 () Bool)

(assert (=> b!707574 m!665123))

(assert (=> b!707510 d!96503))

(declare-fun b!707583 () Bool)

(declare-fun e!398134 () Bool)

(declare-fun e!398136 () Bool)

(assert (=> b!707583 (= e!398134 e!398136)))

(declare-fun res!471396 () Bool)

(assert (=> b!707583 (=> (not res!471396) (not e!398136))))

(assert (=> b!707583 (= res!471396 ((_ is Cons!13361) newAcc!49))))

(declare-fun b!707585 () Bool)

(declare-fun e!398135 () Bool)

(assert (=> b!707585 (= e!398135 (subseq!387 (t!19647 acc!652) (t!19647 newAcc!49)))))

(declare-fun d!96505 () Bool)

(declare-fun res!471395 () Bool)

(assert (=> d!96505 (=> res!471395 e!398134)))

(assert (=> d!96505 (= res!471395 ((_ is Nil!13362) acc!652))))

(assert (=> d!96505 (= (subseq!387 acc!652 newAcc!49) e!398134)))

(declare-fun b!707586 () Bool)

(declare-fun e!398137 () Bool)

(assert (=> b!707586 (= e!398137 (subseq!387 acc!652 (t!19647 newAcc!49)))))

(declare-fun b!707584 () Bool)

(assert (=> b!707584 (= e!398136 e!398137)))

(declare-fun res!471393 () Bool)

(assert (=> b!707584 (=> res!471393 e!398137)))

(assert (=> b!707584 (= res!471393 e!398135)))

(declare-fun res!471394 () Bool)

(assert (=> b!707584 (=> (not res!471394) (not e!398135))))

(assert (=> b!707584 (= res!471394 (= (h!14406 acc!652) (h!14406 newAcc!49)))))

(assert (= (and d!96505 (not res!471395)) b!707583))

(assert (= (and b!707583 res!471396) b!707584))

(assert (= (and b!707584 res!471394) b!707585))

(assert (= (and b!707584 (not res!471393)) b!707586))

(declare-fun m!665125 () Bool)

(assert (=> b!707585 m!665125))

(declare-fun m!665127 () Bool)

(assert (=> b!707586 m!665127))

(assert (=> b!707499 d!96505))

(declare-fun d!96511 () Bool)

(assert (=> d!96511 (= (array_inv!15120 a!3591) (bvsge (size!19709 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62656 d!96511))

(declare-fun d!96513 () Bool)

(declare-fun res!471407 () Bool)

(declare-fun e!398150 () Bool)

(assert (=> d!96513 (=> res!471407 e!398150)))

(assert (=> d!96513 (= res!471407 ((_ is Nil!13362) ($colon$colon!498 acc!652 (select (arr!19324 a!3591) from!2969))))))

(assert (=> d!96513 (= (noDuplicate!1189 ($colon$colon!498 acc!652 (select (arr!19324 a!3591) from!2969))) e!398150)))

(declare-fun b!707601 () Bool)

(declare-fun e!398151 () Bool)

(assert (=> b!707601 (= e!398150 e!398151)))

(declare-fun res!471408 () Bool)

(assert (=> b!707601 (=> (not res!471408) (not e!398151))))

(assert (=> b!707601 (= res!471408 (not (contains!3942 (t!19647 ($colon$colon!498 acc!652 (select (arr!19324 a!3591) from!2969))) (h!14406 ($colon$colon!498 acc!652 (select (arr!19324 a!3591) from!2969))))))))

(declare-fun b!707602 () Bool)

(assert (=> b!707602 (= e!398151 (noDuplicate!1189 (t!19647 ($colon$colon!498 acc!652 (select (arr!19324 a!3591) from!2969)))))))

(assert (= (and d!96513 (not res!471407)) b!707601))

(assert (= (and b!707601 res!471408) b!707602))

(declare-fun m!665129 () Bool)

(assert (=> b!707601 m!665129))

(declare-fun m!665131 () Bool)

(assert (=> b!707602 m!665131))

(assert (=> b!707509 d!96513))

(declare-fun d!96515 () Bool)

(assert (=> d!96515 (= ($colon$colon!498 acc!652 (select (arr!19324 a!3591) from!2969)) (Cons!13361 (select (arr!19324 a!3591) from!2969) acc!652))))

(assert (=> b!707509 d!96515))

(declare-fun b!707648 () Bool)

(declare-fun e!398194 () Bool)

(declare-fun call!34364 () Bool)

(assert (=> b!707648 (= e!398194 call!34364)))

(declare-fun c!78467 () Bool)

(declare-fun bm!34361 () Bool)

(assert (=> bm!34361 (= call!34364 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78467 (Cons!13361 (select (arr!19324 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!707649 () Bool)

(declare-fun e!398197 () Bool)

(assert (=> b!707649 (= e!398197 e!398194)))

(assert (=> b!707649 (= c!78467 (validKeyInArray!0 (select (arr!19324 a!3591) from!2969)))))

(declare-fun b!707650 () Bool)

(declare-fun e!398195 () Bool)

(assert (=> b!707650 (= e!398195 (contains!3942 acc!652 (select (arr!19324 a!3591) from!2969)))))

(declare-fun b!707651 () Bool)

(declare-fun e!398196 () Bool)

(assert (=> b!707651 (= e!398196 e!398197)))

(declare-fun res!471450 () Bool)

(assert (=> b!707651 (=> (not res!471450) (not e!398197))))

(assert (=> b!707651 (= res!471450 (not e!398195))))

(declare-fun res!471449 () Bool)

(assert (=> b!707651 (=> (not res!471449) (not e!398195))))

(assert (=> b!707651 (= res!471449 (validKeyInArray!0 (select (arr!19324 a!3591) from!2969)))))

(declare-fun d!96517 () Bool)

(declare-fun res!471448 () Bool)

(assert (=> d!96517 (=> res!471448 e!398196)))

(assert (=> d!96517 (= res!471448 (bvsge from!2969 (size!19709 a!3591)))))

(assert (=> d!96517 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!398196)))

(declare-fun b!707652 () Bool)

(assert (=> b!707652 (= e!398194 call!34364)))

(assert (= (and d!96517 (not res!471448)) b!707651))

(assert (= (and b!707651 res!471449) b!707650))

(assert (= (and b!707651 res!471450) b!707649))

(assert (= (and b!707649 c!78467) b!707648))

(assert (= (and b!707649 (not c!78467)) b!707652))

(assert (= (or b!707648 b!707652) bm!34361))

(assert (=> bm!34361 m!665071))

(declare-fun m!665173 () Bool)

(assert (=> bm!34361 m!665173))

(assert (=> b!707649 m!665071))

(assert (=> b!707649 m!665071))

(assert (=> b!707649 m!665073))

(assert (=> b!707650 m!665071))

(assert (=> b!707650 m!665071))

(declare-fun m!665175 () Bool)

(assert (=> b!707650 m!665175))

(assert (=> b!707651 m!665071))

(assert (=> b!707651 m!665071))

(assert (=> b!707651 m!665073))

(assert (=> b!707502 d!96517))

(declare-fun d!96541 () Bool)

(declare-fun lt!318020 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!334 (List!13365) (InoxSet (_ BitVec 64)))

(assert (=> d!96541 (= lt!318020 (select (content!334 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398236 () Bool)

(assert (=> d!96541 (= lt!318020 e!398236)))

(declare-fun res!471490 () Bool)

(assert (=> d!96541 (=> (not res!471490) (not e!398236))))

(assert (=> d!96541 (= res!471490 ((_ is Cons!13361) newAcc!49))))

(assert (=> d!96541 (= (contains!3942 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318020)))

(declare-fun b!707691 () Bool)

(declare-fun e!398237 () Bool)

(assert (=> b!707691 (= e!398236 e!398237)))

(declare-fun res!471489 () Bool)

(assert (=> b!707691 (=> res!471489 e!398237)))

(assert (=> b!707691 (= res!471489 (= (h!14406 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707692 () Bool)

(assert (=> b!707692 (= e!398237 (contains!3942 (t!19647 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96541 res!471490) b!707691))

(assert (= (and b!707691 (not res!471489)) b!707692))

(declare-fun m!665201 () Bool)

(assert (=> d!96541 m!665201))

(declare-fun m!665203 () Bool)

(assert (=> d!96541 m!665203))

(declare-fun m!665205 () Bool)

(assert (=> b!707692 m!665205))

(assert (=> b!707501 d!96541))

(declare-fun d!96555 () Bool)

(declare-fun lt!318021 () Bool)

(assert (=> d!96555 (= lt!318021 (select (content!334 acc!652) k0!2824))))

(declare-fun e!398238 () Bool)

(assert (=> d!96555 (= lt!318021 e!398238)))

(declare-fun res!471492 () Bool)

(assert (=> d!96555 (=> (not res!471492) (not e!398238))))

(assert (=> d!96555 (= res!471492 ((_ is Cons!13361) acc!652))))

(assert (=> d!96555 (= (contains!3942 acc!652 k0!2824) lt!318021)))

(declare-fun b!707693 () Bool)

(declare-fun e!398239 () Bool)

(assert (=> b!707693 (= e!398238 e!398239)))

(declare-fun res!471491 () Bool)

(assert (=> b!707693 (=> res!471491 e!398239)))

(assert (=> b!707693 (= res!471491 (= (h!14406 acc!652) k0!2824))))

(declare-fun b!707694 () Bool)

(assert (=> b!707694 (= e!398239 (contains!3942 (t!19647 acc!652) k0!2824))))

(assert (= (and d!96555 res!471492) b!707693))

(assert (= (and b!707693 (not res!471491)) b!707694))

(declare-fun m!665207 () Bool)

(assert (=> d!96555 m!665207))

(declare-fun m!665211 () Bool)

(assert (=> d!96555 m!665211))

(declare-fun m!665215 () Bool)

(assert (=> b!707694 m!665215))

(assert (=> b!707506 d!96555))

(declare-fun d!96559 () Bool)

(declare-fun lt!318022 () Bool)

(assert (=> d!96559 (= lt!318022 (select (content!334 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398242 () Bool)

(assert (=> d!96559 (= lt!318022 e!398242)))

(declare-fun res!471496 () Bool)

(assert (=> d!96559 (=> (not res!471496) (not e!398242))))

(assert (=> d!96559 (= res!471496 ((_ is Cons!13361) acc!652))))

(assert (=> d!96559 (= (contains!3942 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318022)))

(declare-fun b!707697 () Bool)

(declare-fun e!398243 () Bool)

(assert (=> b!707697 (= e!398242 e!398243)))

(declare-fun res!471495 () Bool)

(assert (=> b!707697 (=> res!471495 e!398243)))

(assert (=> b!707697 (= res!471495 (= (h!14406 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707698 () Bool)

(assert (=> b!707698 (= e!398243 (contains!3942 (t!19647 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96559 res!471496) b!707697))

(assert (= (and b!707697 (not res!471495)) b!707698))

(assert (=> d!96559 m!665207))

(declare-fun m!665217 () Bool)

(assert (=> d!96559 m!665217))

(declare-fun m!665219 () Bool)

(assert (=> b!707698 m!665219))

(assert (=> b!707495 d!96559))

(declare-fun d!96561 () Bool)

(assert (=> d!96561 (= (validKeyInArray!0 k0!2824) (and (not (= k0!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!707505 d!96561))

(declare-fun d!96563 () Bool)

(declare-fun lt!318023 () Bool)

(assert (=> d!96563 (= lt!318023 (select (content!334 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398248 () Bool)

(assert (=> d!96563 (= lt!318023 e!398248)))

(declare-fun res!471502 () Bool)

(assert (=> d!96563 (=> (not res!471502) (not e!398248))))

(assert (=> d!96563 (= res!471502 ((_ is Cons!13361) newAcc!49))))

(assert (=> d!96563 (= (contains!3942 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318023)))

(declare-fun b!707703 () Bool)

(declare-fun e!398249 () Bool)

(assert (=> b!707703 (= e!398248 e!398249)))

(declare-fun res!471501 () Bool)

(assert (=> b!707703 (=> res!471501 e!398249)))

(assert (=> b!707703 (= res!471501 (= (h!14406 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707704 () Bool)

(assert (=> b!707704 (= e!398249 (contains!3942 (t!19647 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96563 res!471502) b!707703))

(assert (= (and b!707703 (not res!471501)) b!707704))

(assert (=> d!96563 m!665201))

(declare-fun m!665223 () Bool)

(assert (=> d!96563 m!665223))

(declare-fun m!665227 () Bool)

(assert (=> b!707704 m!665227))

(assert (=> b!707504 d!96563))

(declare-fun d!96569 () Bool)

(declare-fun lt!318024 () Bool)

(assert (=> d!96569 (= lt!318024 (select (content!334 newAcc!49) k0!2824))))

(declare-fun e!398252 () Bool)

(assert (=> d!96569 (= lt!318024 e!398252)))

(declare-fun res!471506 () Bool)

(assert (=> d!96569 (=> (not res!471506) (not e!398252))))

(assert (=> d!96569 (= res!471506 ((_ is Cons!13361) newAcc!49))))

(assert (=> d!96569 (= (contains!3942 newAcc!49 k0!2824) lt!318024)))

(declare-fun b!707707 () Bool)

(declare-fun e!398253 () Bool)

(assert (=> b!707707 (= e!398252 e!398253)))

(declare-fun res!471505 () Bool)

(assert (=> b!707707 (=> res!471505 e!398253)))

(assert (=> b!707707 (= res!471505 (= (h!14406 newAcc!49) k0!2824))))

(declare-fun b!707708 () Bool)

(assert (=> b!707708 (= e!398253 (contains!3942 (t!19647 newAcc!49) k0!2824))))

(assert (= (and d!96569 res!471506) b!707707))

(assert (= (and b!707707 (not res!471505)) b!707708))

(assert (=> d!96569 m!665201))

(declare-fun m!665229 () Bool)

(assert (=> d!96569 m!665229))

(declare-fun m!665231 () Bool)

(assert (=> b!707708 m!665231))

(assert (=> b!707498 d!96569))

(declare-fun b!707754 () Bool)

(declare-fun e!398289 () List!13365)

(declare-fun e!398290 () List!13365)

(assert (=> b!707754 (= e!398289 e!398290)))

(declare-fun c!78481 () Bool)

(assert (=> b!707754 (= c!78481 (= k0!2824 (h!14406 newAcc!49)))))

(declare-fun bm!34369 () Bool)

(declare-fun call!34372 () List!13365)

(assert (=> bm!34369 (= call!34372 (-!352 (t!19647 newAcc!49) k0!2824))))

(declare-fun b!707755 () Bool)

(assert (=> b!707755 (= e!398289 Nil!13362)))

(declare-fun e!398291 () Bool)

(declare-fun b!707756 () Bool)

(declare-fun lt!318032 () List!13365)

(assert (=> b!707756 (= e!398291 (= (content!334 lt!318032) ((_ map and) (content!334 newAcc!49) ((_ map not) (store ((as const (Array (_ BitVec 64) Bool)) false) k0!2824 true)))))))

(declare-fun b!707757 () Bool)

(assert (=> b!707757 (= e!398290 (Cons!13361 (h!14406 newAcc!49) call!34372))))

(declare-fun b!707758 () Bool)

(assert (=> b!707758 (= e!398290 call!34372)))

(declare-fun d!96573 () Bool)

(assert (=> d!96573 e!398291))

(declare-fun res!471528 () Bool)

(assert (=> d!96573 (=> (not res!471528) (not e!398291))))

(declare-fun size!19712 (List!13365) Int)

(assert (=> d!96573 (= res!471528 (<= (size!19712 lt!318032) (size!19712 newAcc!49)))))

(assert (=> d!96573 (= lt!318032 e!398289)))

(declare-fun c!78480 () Bool)

(assert (=> d!96573 (= c!78480 ((_ is Cons!13361) newAcc!49))))

(assert (=> d!96573 (= (-!352 newAcc!49 k0!2824) lt!318032)))

(assert (= (and d!96573 c!78480) b!707754))

(assert (= (and d!96573 (not c!78480)) b!707755))

(assert (= (and b!707754 c!78481) b!707758))

(assert (= (and b!707754 (not c!78481)) b!707757))

(assert (= (or b!707758 b!707757) bm!34369))

(assert (= (and d!96573 res!471528) b!707756))

(declare-fun m!665263 () Bool)

(assert (=> bm!34369 m!665263))

(declare-fun m!665265 () Bool)

(assert (=> b!707756 m!665265))

(assert (=> b!707756 m!665201))

(declare-fun m!665267 () Bool)

(assert (=> b!707756 m!665267))

(declare-fun m!665269 () Bool)

(assert (=> d!96573 m!665269))

(declare-fun m!665271 () Bool)

(assert (=> d!96573 m!665271))

(assert (=> b!707508 d!96573))

(declare-fun d!96591 () Bool)

(declare-fun lt!318033 () Bool)

(assert (=> d!96591 (= lt!318033 (select (content!334 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!398292 () Bool)

(assert (=> d!96591 (= lt!318033 e!398292)))

(declare-fun res!471530 () Bool)

(assert (=> d!96591 (=> (not res!471530) (not e!398292))))

(assert (=> d!96591 (= res!471530 ((_ is Cons!13361) acc!652))))

(assert (=> d!96591 (= (contains!3942 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318033)))

(declare-fun b!707759 () Bool)

(declare-fun e!398293 () Bool)

(assert (=> b!707759 (= e!398292 e!398293)))

(declare-fun res!471529 () Bool)

(assert (=> b!707759 (=> res!471529 e!398293)))

(assert (=> b!707759 (= res!471529 (= (h!14406 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707760 () Bool)

(assert (=> b!707760 (= e!398293 (contains!3942 (t!19647 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96591 res!471530) b!707759))

(assert (= (and b!707759 (not res!471529)) b!707760))

(assert (=> d!96591 m!665207))

(declare-fun m!665273 () Bool)

(assert (=> d!96591 m!665273))

(declare-fun m!665275 () Bool)

(assert (=> b!707760 m!665275))

(assert (=> b!707497 d!96591))

(declare-fun d!96593 () Bool)

(declare-fun res!471531 () Bool)

(declare-fun e!398294 () Bool)

(assert (=> d!96593 (=> res!471531 e!398294)))

(assert (=> d!96593 (= res!471531 ((_ is Nil!13362) acc!652))))

(assert (=> d!96593 (= (noDuplicate!1189 acc!652) e!398294)))

(declare-fun b!707761 () Bool)

(declare-fun e!398295 () Bool)

(assert (=> b!707761 (= e!398294 e!398295)))

(declare-fun res!471532 () Bool)

(assert (=> b!707761 (=> (not res!471532) (not e!398295))))

(assert (=> b!707761 (= res!471532 (not (contains!3942 (t!19647 acc!652) (h!14406 acc!652))))))

(declare-fun b!707762 () Bool)

(assert (=> b!707762 (= e!398295 (noDuplicate!1189 (t!19647 acc!652)))))

(assert (= (and d!96593 (not res!471531)) b!707761))

(assert (= (and b!707761 res!471532) b!707762))

(declare-fun m!665277 () Bool)

(assert (=> b!707761 m!665277))

(declare-fun m!665279 () Bool)

(assert (=> b!707762 m!665279))

(assert (=> b!707507 d!96593))

(check-sat (not b!707568) (not d!96559) (not b!707651) (not b!707574) (not d!96541) (not b!707602) (not b!707708) (not d!96573) (not b!707692) (not b!707601) (not d!96591) (not bm!34361) (not b!707698) (not b!707585) (not b!707586) (not b!707649) (not bm!34369) (not d!96563) (not d!96569) (not b!707704) (not b!707762) (not b!707760) (not b!707694) (not d!96555) (not b!707567) (not b!707756) (not b!707650) (not b!707761))
(check-sat)
