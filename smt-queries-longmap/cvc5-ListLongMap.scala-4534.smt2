; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62842 () Bool)

(assert start!62842)

(declare-fun b!708773 () Bool)

(declare-fun res!472386 () Bool)

(declare-fun e!398904 () Bool)

(assert (=> b!708773 (=> (not res!472386) (not e!398904))))

(declare-datatypes ((List!13373 0))(
  ( (Nil!13370) (Cons!13369 (h!14414 (_ BitVec 64)) (t!19664 List!13373)) )
))
(declare-fun lt!318152 () List!13373)

(declare-fun contains!3950 (List!13373 (_ BitVec 64)) Bool)

(assert (=> b!708773 (= res!472386 (not (contains!3950 lt!318152 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708774 () Bool)

(declare-fun res!472388 () Bool)

(declare-fun e!398905 () Bool)

(assert (=> b!708774 (=> (not res!472388) (not e!398905))))

(declare-fun acc!652 () List!13373)

(assert (=> b!708774 (= res!472388 (not (contains!3950 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708775 () Bool)

(declare-fun res!472378 () Bool)

(assert (=> b!708775 (=> (not res!472378) (not e!398905))))

(declare-fun newAcc!49 () List!13373)

(declare-fun k!2824 () (_ BitVec 64))

(assert (=> b!708775 (= res!472378 (contains!3950 newAcc!49 k!2824))))

(declare-fun b!708776 () Bool)

(declare-fun res!472377 () Bool)

(assert (=> b!708776 (=> (not res!472377) (not e!398905))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40360 0))(
  ( (array!40361 (arr!19332 (Array (_ BitVec 32) (_ BitVec 64))) (size!19723 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40360)

(assert (=> b!708776 (= res!472377 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19723 a!3591)))))

(declare-fun b!708777 () Bool)

(declare-fun res!472382 () Bool)

(assert (=> b!708777 (=> (not res!472382) (not e!398905))))

(assert (=> b!708777 (= res!472382 (not (contains!3950 acc!652 k!2824)))))

(declare-fun b!708778 () Bool)

(declare-fun res!472387 () Bool)

(assert (=> b!708778 (=> (not res!472387) (not e!398904))))

(declare-fun noDuplicate!1197 (List!13373) Bool)

(declare-fun $colon$colon!506 (List!13373 (_ BitVec 64)) List!13373)

(assert (=> b!708778 (= res!472387 (noDuplicate!1197 ($colon$colon!506 newAcc!49 (select (arr!19332 a!3591) from!2969))))))

(declare-fun b!708779 () Bool)

(declare-fun res!472379 () Bool)

(assert (=> b!708779 (=> (not res!472379) (not e!398905))))

(assert (=> b!708779 (= res!472379 (not (contains!3950 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708780 () Bool)

(declare-fun res!472374 () Bool)

(assert (=> b!708780 (=> (not res!472374) (not e!398905))))

(assert (=> b!708780 (= res!472374 (noDuplicate!1197 acc!652))))

(declare-fun b!708781 () Bool)

(declare-fun res!472383 () Bool)

(assert (=> b!708781 (=> (not res!472383) (not e!398905))))

(assert (=> b!708781 (= res!472383 (noDuplicate!1197 newAcc!49))))

(declare-fun b!708782 () Bool)

(declare-fun res!472384 () Bool)

(assert (=> b!708782 (=> (not res!472384) (not e!398905))))

(declare-fun arrayContainsKey!0 (array!40360 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!708782 (= res!472384 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!708783 () Bool)

(declare-fun res!472376 () Bool)

(assert (=> b!708783 (=> (not res!472376) (not e!398905))))

(assert (=> b!708783 (= res!472376 (not (contains!3950 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!472390 () Bool)

(assert (=> start!62842 (=> (not res!472390) (not e!398905))))

(assert (=> start!62842 (= res!472390 (and (bvslt (size!19723 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19723 a!3591))))))

(assert (=> start!62842 e!398905))

(assert (=> start!62842 true))

(declare-fun array_inv!15128 (array!40360) Bool)

(assert (=> start!62842 (array_inv!15128 a!3591)))

(declare-fun b!708784 () Bool)

(assert (=> b!708784 (= e!398905 e!398904)))

(declare-fun res!472389 () Bool)

(assert (=> b!708784 (=> (not res!472389) (not e!398904))))

(assert (=> b!708784 (= res!472389 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(assert (=> b!708784 (= lt!318152 ($colon$colon!506 acc!652 (select (arr!19332 a!3591) from!2969)))))

(declare-fun b!708785 () Bool)

(declare-fun res!472393 () Bool)

(assert (=> b!708785 (=> (not res!472393) (not e!398905))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!708785 (= res!472393 (validKeyInArray!0 k!2824))))

(declare-fun b!708786 () Bool)

(declare-fun res!472380 () Bool)

(assert (=> b!708786 (=> (not res!472380) (not e!398905))))

(declare-fun -!360 (List!13373 (_ BitVec 64)) List!13373)

(assert (=> b!708786 (= res!472380 (= (-!360 newAcc!49 k!2824) acc!652))))

(declare-fun b!708787 () Bool)

(declare-fun res!472373 () Bool)

(assert (=> b!708787 (=> (not res!472373) (not e!398905))))

(declare-fun subseq!395 (List!13373 List!13373) Bool)

(assert (=> b!708787 (= res!472373 (subseq!395 acc!652 newAcc!49))))

(declare-fun b!708788 () Bool)

(declare-fun res!472392 () Bool)

(assert (=> b!708788 (=> (not res!472392) (not e!398904))))

(assert (=> b!708788 (= res!472392 (noDuplicate!1197 lt!318152))))

(declare-fun b!708789 () Bool)

(declare-fun res!472391 () Bool)

(assert (=> b!708789 (=> (not res!472391) (not e!398904))))

(assert (=> b!708789 (= res!472391 (not (contains!3950 lt!318152 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708790 () Bool)

(declare-fun res!472385 () Bool)

(assert (=> b!708790 (=> (not res!472385) (not e!398905))))

(declare-fun arrayNoDuplicates!0 (array!40360 (_ BitVec 32) List!13373) Bool)

(assert (=> b!708790 (= res!472385 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!708791 () Bool)

(declare-fun res!472375 () Bool)

(assert (=> b!708791 (=> (not res!472375) (not e!398905))))

(assert (=> b!708791 (= res!472375 (not (contains!3950 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!708792 () Bool)

(assert (=> b!708792 (= e!398904 (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969)))))

(declare-fun b!708793 () Bool)

(declare-fun res!472381 () Bool)

(assert (=> b!708793 (=> (not res!472381) (not e!398905))))

(assert (=> b!708793 (= res!472381 (validKeyInArray!0 (select (arr!19332 a!3591) from!2969)))))

(assert (= (and start!62842 res!472390) b!708780))

(assert (= (and b!708780 res!472374) b!708781))

(assert (= (and b!708781 res!472383) b!708779))

(assert (= (and b!708779 res!472379) b!708774))

(assert (= (and b!708774 res!472388) b!708782))

(assert (= (and b!708782 res!472384) b!708777))

(assert (= (and b!708777 res!472382) b!708785))

(assert (= (and b!708785 res!472393) b!708790))

(assert (= (and b!708790 res!472385) b!708787))

(assert (= (and b!708787 res!472373) b!708775))

(assert (= (and b!708775 res!472378) b!708786))

(assert (= (and b!708786 res!472380) b!708791))

(assert (= (and b!708791 res!472375) b!708783))

(assert (= (and b!708783 res!472376) b!708776))

(assert (= (and b!708776 res!472377) b!708793))

(assert (= (and b!708793 res!472381) b!708784))

(assert (= (and b!708784 res!472389) b!708788))

(assert (= (and b!708788 res!472392) b!708778))

(assert (= (and b!708778 res!472387) b!708773))

(assert (= (and b!708773 res!472386) b!708789))

(assert (= (and b!708789 res!472391) b!708792))

(declare-fun m!666169 () Bool)

(assert (=> b!708780 m!666169))

(declare-fun m!666171 () Bool)

(assert (=> b!708774 m!666171))

(declare-fun m!666173 () Bool)

(assert (=> start!62842 m!666173))

(declare-fun m!666175 () Bool)

(assert (=> b!708784 m!666175))

(assert (=> b!708784 m!666175))

(declare-fun m!666177 () Bool)

(assert (=> b!708784 m!666177))

(declare-fun m!666179 () Bool)

(assert (=> b!708788 m!666179))

(assert (=> b!708793 m!666175))

(assert (=> b!708793 m!666175))

(declare-fun m!666181 () Bool)

(assert (=> b!708793 m!666181))

(declare-fun m!666183 () Bool)

(assert (=> b!708785 m!666183))

(declare-fun m!666185 () Bool)

(assert (=> b!708773 m!666185))

(declare-fun m!666187 () Bool)

(assert (=> b!708782 m!666187))

(declare-fun m!666189 () Bool)

(assert (=> b!708779 m!666189))

(declare-fun m!666191 () Bool)

(assert (=> b!708781 m!666191))

(declare-fun m!666193 () Bool)

(assert (=> b!708783 m!666193))

(assert (=> b!708778 m!666175))

(assert (=> b!708778 m!666175))

(declare-fun m!666195 () Bool)

(assert (=> b!708778 m!666195))

(assert (=> b!708778 m!666195))

(declare-fun m!666197 () Bool)

(assert (=> b!708778 m!666197))

(declare-fun m!666199 () Bool)

(assert (=> b!708790 m!666199))

(declare-fun m!666201 () Bool)

(assert (=> b!708792 m!666201))

(declare-fun m!666203 () Bool)

(assert (=> b!708787 m!666203))

(declare-fun m!666205 () Bool)

(assert (=> b!708775 m!666205))

(declare-fun m!666207 () Bool)

(assert (=> b!708791 m!666207))

(declare-fun m!666209 () Bool)

(assert (=> b!708786 m!666209))

(declare-fun m!666211 () Bool)

(assert (=> b!708789 m!666211))

(declare-fun m!666213 () Bool)

(assert (=> b!708777 m!666213))

(push 1)

(assert (not b!708778))

(assert (not b!708791))

(assert (not b!708773))

(assert (not b!708782))

(assert (not b!708781))

(assert (not b!708777))

(assert (not b!708792))

(assert (not start!62842))

(assert (not b!708784))

(assert (not b!708788))

(assert (not b!708785))

(assert (not b!708775))

(assert (not b!708787))

(assert (not b!708786))

(assert (not b!708790))

(assert (not b!708783))

(assert (not b!708789))

(assert (not b!708774))

(assert (not b!708779))

(assert (not b!708780))

(assert (not b!708793))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96953 () Bool)

(declare-fun lt!318168 () Bool)

(declare-fun content!340 (List!13373) (Set (_ BitVec 64)))

(assert (=> d!96953 (= lt!318168 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!340 newAcc!49)))))

(declare-fun e!398959 () Bool)

(assert (=> d!96953 (= lt!318168 e!398959)))

(declare-fun res!472551 () Bool)

(assert (=> d!96953 (=> (not res!472551) (not e!398959))))

(assert (=> d!96953 (= res!472551 (is-Cons!13369 newAcc!49))))

(assert (=> d!96953 (= (contains!3950 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318168)))

(declare-fun b!708957 () Bool)

(declare-fun e!398960 () Bool)

(assert (=> b!708957 (= e!398959 e!398960)))

(declare-fun res!472552 () Bool)

(assert (=> b!708957 (=> res!472552 e!398960)))

(assert (=> b!708957 (= res!472552 (= (h!14414 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708958 () Bool)

(assert (=> b!708958 (= e!398960 (contains!3950 (t!19664 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96953 res!472551) b!708957))

(assert (= (and b!708957 (not res!472552)) b!708958))

(declare-fun m!666335 () Bool)

(assert (=> d!96953 m!666335))

(declare-fun m!666337 () Bool)

(assert (=> d!96953 m!666337))

(declare-fun m!666339 () Bool)

(assert (=> b!708958 m!666339))

(assert (=> b!708783 d!96953))

(declare-fun d!96965 () Bool)

(assert (=> d!96965 (= (array_inv!15128 a!3591) (bvsge (size!19723 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62842 d!96965))

(declare-fun d!96971 () Bool)

(declare-fun lt!318169 () Bool)

(assert (=> d!96971 (= lt!318169 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!340 lt!318152)))))

(declare-fun e!398963 () Bool)

(assert (=> d!96971 (= lt!318169 e!398963)))

(declare-fun res!472555 () Bool)

(assert (=> d!96971 (=> (not res!472555) (not e!398963))))

(assert (=> d!96971 (= res!472555 (is-Cons!13369 lt!318152))))

(assert (=> d!96971 (= (contains!3950 lt!318152 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318169)))

(declare-fun b!708961 () Bool)

(declare-fun e!398964 () Bool)

(assert (=> b!708961 (= e!398963 e!398964)))

(declare-fun res!472556 () Bool)

(assert (=> b!708961 (=> res!472556 e!398964)))

(assert (=> b!708961 (= res!472556 (= (h!14414 lt!318152) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708962 () Bool)

(assert (=> b!708962 (= e!398964 (contains!3950 (t!19664 lt!318152) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96971 res!472555) b!708961))

(assert (= (and b!708961 (not res!472556)) b!708962))

(declare-fun m!666345 () Bool)

(assert (=> d!96971 m!666345))

(declare-fun m!666347 () Bool)

(assert (=> d!96971 m!666347))

(declare-fun m!666349 () Bool)

(assert (=> b!708962 m!666349))

(assert (=> b!708773 d!96971))

(declare-fun d!96973 () Bool)

(assert (=> d!96973 (= ($colon$colon!506 acc!652 (select (arr!19332 a!3591) from!2969)) (Cons!13369 (select (arr!19332 a!3591) from!2969) acc!652))))

(assert (=> b!708784 d!96973))

(declare-fun d!96975 () Bool)

(assert (=> d!96975 (= (validKeyInArray!0 k!2824) (and (not (= k!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!708785 d!96975))

(declare-fun d!96977 () Bool)

(declare-fun lt!318170 () Bool)

(assert (=> d!96977 (= lt!318170 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!340 acc!652)))))

(declare-fun e!398965 () Bool)

(assert (=> d!96977 (= lt!318170 e!398965)))

(declare-fun res!472557 () Bool)

(assert (=> d!96977 (=> (not res!472557) (not e!398965))))

(assert (=> d!96977 (= res!472557 (is-Cons!13369 acc!652))))

(assert (=> d!96977 (= (contains!3950 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318170)))

(declare-fun b!708963 () Bool)

(declare-fun e!398966 () Bool)

(assert (=> b!708963 (= e!398965 e!398966)))

(declare-fun res!472558 () Bool)

(assert (=> b!708963 (=> res!472558 e!398966)))

(assert (=> b!708963 (= res!472558 (= (h!14414 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708964 () Bool)

(assert (=> b!708964 (= e!398966 (contains!3950 (t!19664 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96977 res!472557) b!708963))

(assert (= (and b!708963 (not res!472558)) b!708964))

(declare-fun m!666351 () Bool)

(assert (=> d!96977 m!666351))

(declare-fun m!666353 () Bool)

(assert (=> d!96977 m!666353))

(declare-fun m!666355 () Bool)

(assert (=> b!708964 m!666355))

(assert (=> b!708774 d!96977))

(declare-fun d!96979 () Bool)

(declare-fun lt!318171 () Bool)

(assert (=> d!96979 (= lt!318171 (set.member k!2824 (content!340 newAcc!49)))))

(declare-fun e!398967 () Bool)

(assert (=> d!96979 (= lt!318171 e!398967)))

(declare-fun res!472559 () Bool)

(assert (=> d!96979 (=> (not res!472559) (not e!398967))))

(assert (=> d!96979 (= res!472559 (is-Cons!13369 newAcc!49))))

(assert (=> d!96979 (= (contains!3950 newAcc!49 k!2824) lt!318171)))

(declare-fun b!708965 () Bool)

(declare-fun e!398968 () Bool)

(assert (=> b!708965 (= e!398967 e!398968)))

(declare-fun res!472560 () Bool)

(assert (=> b!708965 (=> res!472560 e!398968)))

(assert (=> b!708965 (= res!472560 (= (h!14414 newAcc!49) k!2824))))

(declare-fun b!708966 () Bool)

(assert (=> b!708966 (= e!398968 (contains!3950 (t!19664 newAcc!49) k!2824))))

(assert (= (and d!96979 res!472559) b!708965))

(assert (= (and b!708965 (not res!472560)) b!708966))

(assert (=> d!96979 m!666335))

(declare-fun m!666357 () Bool)

(assert (=> d!96979 m!666357))

(declare-fun m!666359 () Bool)

(assert (=> b!708966 m!666359))

(assert (=> b!708775 d!96979))

(declare-fun d!96981 () Bool)

(declare-fun e!399006 () Bool)

(assert (=> d!96981 e!399006))

(declare-fun res!472591 () Bool)

(assert (=> d!96981 (=> (not res!472591) (not e!399006))))

(declare-fun lt!318180 () List!13373)

(declare-fun size!19726 (List!13373) Int)

(assert (=> d!96981 (= res!472591 (<= (size!19726 lt!318180) (size!19726 newAcc!49)))))

(declare-fun e!399004 () List!13373)

(assert (=> d!96981 (= lt!318180 e!399004)))

(declare-fun c!78575 () Bool)

(assert (=> d!96981 (= c!78575 (is-Cons!13369 newAcc!49))))

(assert (=> d!96981 (= (-!360 newAcc!49 k!2824) lt!318180)))

(declare-fun bm!34419 () Bool)

(declare-fun call!34422 () List!13373)

(assert (=> bm!34419 (= call!34422 (-!360 (t!19664 newAcc!49) k!2824))))

(declare-fun b!709005 () Bool)

(assert (=> b!709005 (= e!399004 Nil!13370)))

(declare-fun b!709006 () Bool)

(declare-fun e!399005 () List!13373)

(assert (=> b!709006 (= e!399005 (Cons!13369 (h!14414 newAcc!49) call!34422))))

(declare-fun b!709007 () Bool)

(assert (=> b!709007 (= e!399006 (= (content!340 lt!318180) (set.minus (content!340 newAcc!49) (set.insert k!2824 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun b!709008 () Bool)

(assert (=> b!709008 (= e!399004 e!399005)))

(declare-fun c!78574 () Bool)

(assert (=> b!709008 (= c!78574 (= k!2824 (h!14414 newAcc!49)))))

(declare-fun b!709009 () Bool)

(assert (=> b!709009 (= e!399005 call!34422)))

(assert (= (and d!96981 c!78575) b!709008))

(assert (= (and d!96981 (not c!78575)) b!709005))

(assert (= (and b!709008 c!78574) b!709009))

(assert (= (and b!709008 (not c!78574)) b!709006))

(assert (= (or b!709009 b!709006) bm!34419))

(assert (= (and d!96981 res!472591) b!709007))

(declare-fun m!666387 () Bool)

(assert (=> d!96981 m!666387))

(declare-fun m!666389 () Bool)

(assert (=> d!96981 m!666389))

(declare-fun m!666391 () Bool)

(assert (=> bm!34419 m!666391))

(declare-fun m!666393 () Bool)

(assert (=> b!709007 m!666393))

(assert (=> b!709007 m!666335))

(declare-fun m!666395 () Bool)

(assert (=> b!709007 m!666395))

(assert (=> b!708786 d!96981))

(declare-fun b!709036 () Bool)

(declare-fun e!399031 () Bool)

(assert (=> b!709036 (= e!399031 (subseq!395 (t!19664 acc!652) (t!19664 newAcc!49)))))

(declare-fun b!709035 () Bool)

(declare-fun e!399033 () Bool)

(declare-fun e!399034 () Bool)

(assert (=> b!709035 (= e!399033 e!399034)))

(declare-fun res!472618 () Bool)

(assert (=> b!709035 (=> res!472618 e!399034)))

(assert (=> b!709035 (= res!472618 e!399031)))

(declare-fun res!472617 () Bool)

(assert (=> b!709035 (=> (not res!472617) (not e!399031))))

(assert (=> b!709035 (= res!472617 (= (h!14414 acc!652) (h!14414 newAcc!49)))))

(declare-fun b!709034 () Bool)

(declare-fun e!399032 () Bool)

(assert (=> b!709034 (= e!399032 e!399033)))

(declare-fun res!472619 () Bool)

(assert (=> b!709034 (=> (not res!472619) (not e!399033))))

(assert (=> b!709034 (= res!472619 (is-Cons!13369 newAcc!49))))

(declare-fun d!96997 () Bool)

(declare-fun res!472616 () Bool)

(assert (=> d!96997 (=> res!472616 e!399032)))

(assert (=> d!96997 (= res!472616 (is-Nil!13370 acc!652))))

(assert (=> d!96997 (= (subseq!395 acc!652 newAcc!49) e!399032)))

(declare-fun b!709037 () Bool)

(assert (=> b!709037 (= e!399034 (subseq!395 acc!652 (t!19664 newAcc!49)))))

(assert (= (and d!96997 (not res!472616)) b!709034))

(assert (= (and b!709034 res!472619) b!709035))

(assert (= (and b!709035 res!472617) b!709036))

(assert (= (and b!709035 (not res!472618)) b!709037))

(declare-fun m!666423 () Bool)

(assert (=> b!709036 m!666423))

(declare-fun m!666425 () Bool)

(assert (=> b!709037 m!666425))

(assert (=> b!708787 d!96997))

(declare-fun d!97015 () Bool)

(declare-fun lt!318183 () Bool)

(assert (=> d!97015 (= lt!318183 (set.member k!2824 (content!340 acc!652)))))

(declare-fun e!399035 () Bool)

(assert (=> d!97015 (= lt!318183 e!399035)))

(declare-fun res!472620 () Bool)

(assert (=> d!97015 (=> (not res!472620) (not e!399035))))

(assert (=> d!97015 (= res!472620 (is-Cons!13369 acc!652))))

(assert (=> d!97015 (= (contains!3950 acc!652 k!2824) lt!318183)))

(declare-fun b!709038 () Bool)

(declare-fun e!399036 () Bool)

(assert (=> b!709038 (= e!399035 e!399036)))

(declare-fun res!472621 () Bool)

(assert (=> b!709038 (=> res!472621 e!399036)))

(assert (=> b!709038 (= res!472621 (= (h!14414 acc!652) k!2824))))

(declare-fun b!709039 () Bool)

(assert (=> b!709039 (= e!399036 (contains!3950 (t!19664 acc!652) k!2824))))

(assert (= (and d!97015 res!472620) b!709038))

(assert (= (and b!709038 (not res!472621)) b!709039))

(assert (=> d!97015 m!666351))

(declare-fun m!666427 () Bool)

(assert (=> d!97015 m!666427))

(declare-fun m!666429 () Bool)

(assert (=> b!709039 m!666429))

(assert (=> b!708777 d!97015))

(declare-fun d!97017 () Bool)

(declare-fun res!472630 () Bool)

(declare-fun e!399045 () Bool)

(assert (=> d!97017 (=> res!472630 e!399045)))

(assert (=> d!97017 (= res!472630 (is-Nil!13370 lt!318152))))

(assert (=> d!97017 (= (noDuplicate!1197 lt!318152) e!399045)))

(declare-fun b!709048 () Bool)

(declare-fun e!399046 () Bool)

(assert (=> b!709048 (= e!399045 e!399046)))

(declare-fun res!472631 () Bool)

(assert (=> b!709048 (=> (not res!472631) (not e!399046))))

(assert (=> b!709048 (= res!472631 (not (contains!3950 (t!19664 lt!318152) (h!14414 lt!318152))))))

(declare-fun b!709049 () Bool)

(assert (=> b!709049 (= e!399046 (noDuplicate!1197 (t!19664 lt!318152)))))

(assert (= (and d!97017 (not res!472630)) b!709048))

(assert (= (and b!709048 res!472631) b!709049))

(declare-fun m!666431 () Bool)

(assert (=> b!709048 m!666431))

(declare-fun m!666433 () Bool)

(assert (=> b!709049 m!666433))

(assert (=> b!708788 d!97017))

(declare-fun d!97019 () Bool)

(declare-fun lt!318184 () Bool)

(assert (=> d!97019 (= lt!318184 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!340 lt!318152)))))

(declare-fun e!399057 () Bool)

(assert (=> d!97019 (= lt!318184 e!399057)))

(declare-fun res!472640 () Bool)

(assert (=> d!97019 (=> (not res!472640) (not e!399057))))

(assert (=> d!97019 (= res!472640 (is-Cons!13369 lt!318152))))

(assert (=> d!97019 (= (contains!3950 lt!318152 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318184)))

(declare-fun b!709056 () Bool)

(declare-fun e!399058 () Bool)

(assert (=> b!709056 (= e!399057 e!399058)))

(declare-fun res!472641 () Bool)

(assert (=> b!709056 (=> res!472641 e!399058)))

(assert (=> b!709056 (= res!472641 (= (h!14414 lt!318152) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709057 () Bool)

(assert (=> b!709057 (= e!399058 (contains!3950 (t!19664 lt!318152) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97019 res!472640) b!709056))

(assert (= (and b!709056 (not res!472641)) b!709057))

(assert (=> d!97019 m!666345))

(declare-fun m!666435 () Bool)

(assert (=> d!97019 m!666435))

(declare-fun m!666439 () Bool)

(assert (=> b!709057 m!666439))

(assert (=> b!708789 d!97019))

(declare-fun d!97021 () Bool)

(declare-fun res!472646 () Bool)

(declare-fun e!399061 () Bool)

(assert (=> d!97021 (=> res!472646 e!399061)))

(assert (=> d!97021 (= res!472646 (is-Nil!13370 ($colon$colon!506 newAcc!49 (select (arr!19332 a!3591) from!2969))))))

(assert (=> d!97021 (= (noDuplicate!1197 ($colon$colon!506 newAcc!49 (select (arr!19332 a!3591) from!2969))) e!399061)))

(declare-fun b!709064 () Bool)

(declare-fun e!399062 () Bool)

(assert (=> b!709064 (= e!399061 e!399062)))

(declare-fun res!472647 () Bool)

(assert (=> b!709064 (=> (not res!472647) (not e!399062))))

(assert (=> b!709064 (= res!472647 (not (contains!3950 (t!19664 ($colon$colon!506 newAcc!49 (select (arr!19332 a!3591) from!2969))) (h!14414 ($colon$colon!506 newAcc!49 (select (arr!19332 a!3591) from!2969))))))))

(declare-fun b!709065 () Bool)

(assert (=> b!709065 (= e!399062 (noDuplicate!1197 (t!19664 ($colon$colon!506 newAcc!49 (select (arr!19332 a!3591) from!2969)))))))

(assert (= (and d!97021 (not res!472646)) b!709064))

(assert (= (and b!709064 res!472647) b!709065))

(declare-fun m!666441 () Bool)

(assert (=> b!709064 m!666441))

(declare-fun m!666443 () Bool)

(assert (=> b!709065 m!666443))

(assert (=> b!708778 d!97021))

(declare-fun d!97025 () Bool)

(assert (=> d!97025 (= ($colon$colon!506 newAcc!49 (select (arr!19332 a!3591) from!2969)) (Cons!13369 (select (arr!19332 a!3591) from!2969) newAcc!49))))

(assert (=> b!708778 d!97025))

(declare-fun d!97029 () Bool)

(declare-fun lt!318185 () Bool)

(assert (=> d!97029 (= lt!318185 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!340 acc!652)))))

(declare-fun e!399063 () Bool)

(assert (=> d!97029 (= lt!318185 e!399063)))

(declare-fun res!472648 () Bool)

(assert (=> d!97029 (=> (not res!472648) (not e!399063))))

(assert (=> d!97029 (= res!472648 (is-Cons!13369 acc!652))))

(assert (=> d!97029 (= (contains!3950 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318185)))

(declare-fun b!709066 () Bool)

(declare-fun e!399064 () Bool)

(assert (=> b!709066 (= e!399063 e!399064)))

(declare-fun res!472649 () Bool)

(assert (=> b!709066 (=> res!472649 e!399064)))

(assert (=> b!709066 (= res!472649 (= (h!14414 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709067 () Bool)

(assert (=> b!709067 (= e!399064 (contains!3950 (t!19664 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97029 res!472648) b!709066))

(assert (= (and b!709066 (not res!472649)) b!709067))

(assert (=> d!97029 m!666351))

(declare-fun m!666449 () Bool)

(assert (=> d!97029 m!666449))

(declare-fun m!666451 () Bool)

(assert (=> b!709067 m!666451))

(assert (=> b!708779 d!97029))

(declare-fun d!97031 () Bool)

(declare-fun res!472680 () Bool)

(declare-fun e!399100 () Bool)

(assert (=> d!97031 (=> res!472680 e!399100)))

(assert (=> d!97031 (= res!472680 (bvsge from!2969 (size!19723 a!3591)))))

(assert (=> d!97031 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!399100)))

(declare-fun bm!34422 () Bool)

(declare-fun call!34425 () Bool)

(declare-fun c!78580 () Bool)

(assert (=> bm!34422 (= call!34425 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78580 (Cons!13369 (select (arr!19332 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!709106 () Bool)

(declare-fun e!399099 () Bool)

(assert (=> b!709106 (= e!399099 call!34425)))

(declare-fun b!709107 () Bool)

(declare-fun e!399102 () Bool)

(assert (=> b!709107 (= e!399102 e!399099)))

(assert (=> b!709107 (= c!78580 (validKeyInArray!0 (select (arr!19332 a!3591) from!2969)))))

(declare-fun b!709108 () Bool)

(assert (=> b!709108 (= e!399099 call!34425)))

(declare-fun b!709109 () Bool)

(assert (=> b!709109 (= e!399100 e!399102)))

(declare-fun res!472682 () Bool)

(assert (=> b!709109 (=> (not res!472682) (not e!399102))))

(declare-fun e!399101 () Bool)

(assert (=> b!709109 (= res!472682 (not e!399101))))

(declare-fun res!472681 () Bool)

(assert (=> b!709109 (=> (not res!472681) (not e!399101))))

(assert (=> b!709109 (= res!472681 (validKeyInArray!0 (select (arr!19332 a!3591) from!2969)))))

(declare-fun b!709110 () Bool)

(assert (=> b!709110 (= e!399101 (contains!3950 acc!652 (select (arr!19332 a!3591) from!2969)))))

(assert (= (and d!97031 (not res!472680)) b!709109))

(assert (= (and b!709109 res!472681) b!709110))

(assert (= (and b!709109 res!472682) b!709107))

(assert (= (and b!709107 c!78580) b!709108))

(assert (= (and b!709107 (not c!78580)) b!709106))

(assert (= (or b!709108 b!709106) bm!34422))

(assert (=> bm!34422 m!666175))

(declare-fun m!666485 () Bool)

(assert (=> bm!34422 m!666485))

(assert (=> b!709107 m!666175))

(assert (=> b!709107 m!666175))

(assert (=> b!709107 m!666181))

(assert (=> b!709109 m!666175))

(assert (=> b!709109 m!666175))

(assert (=> b!709109 m!666181))

(assert (=> b!709110 m!666175))

(assert (=> b!709110 m!666175))

(declare-fun m!666487 () Bool)

(assert (=> b!709110 m!666487))

(assert (=> b!708790 d!97031))

(declare-fun d!97057 () Bool)

(declare-fun lt!318191 () Bool)

(assert (=> d!97057 (= lt!318191 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!340 newAcc!49)))))

(declare-fun e!399103 () Bool)

(assert (=> d!97057 (= lt!318191 e!399103)))

(declare-fun res!472683 () Bool)

(assert (=> d!97057 (=> (not res!472683) (not e!399103))))

(assert (=> d!97057 (= res!472683 (is-Cons!13369 newAcc!49))))

(assert (=> d!97057 (= (contains!3950 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318191)))

(declare-fun b!709111 () Bool)

(declare-fun e!399104 () Bool)

(assert (=> b!709111 (= e!399103 e!399104)))

(declare-fun res!472684 () Bool)

(assert (=> b!709111 (=> res!472684 e!399104)))

(assert (=> b!709111 (= res!472684 (= (h!14414 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!709112 () Bool)

(assert (=> b!709112 (= e!399104 (contains!3950 (t!19664 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97057 res!472683) b!709111))

(assert (= (and b!709111 (not res!472684)) b!709112))

(assert (=> d!97057 m!666335))

(declare-fun m!666489 () Bool)

(assert (=> d!97057 m!666489))

(declare-fun m!666491 () Bool)

(assert (=> b!709112 m!666491))

(assert (=> b!708791 d!97057))

(declare-fun d!97059 () Bool)

(declare-fun res!472685 () Bool)

(declare-fun e!399105 () Bool)

(assert (=> d!97059 (=> res!472685 e!399105)))

(assert (=> d!97059 (= res!472685 (is-Nil!13370 acc!652))))

(assert (=> d!97059 (= (noDuplicate!1197 acc!652) e!399105)))

(declare-fun b!709113 () Bool)

(declare-fun e!399106 () Bool)

(assert (=> b!709113 (= e!399105 e!399106)))

(declare-fun res!472686 () Bool)

(assert (=> b!709113 (=> (not res!472686) (not e!399106))))

(assert (=> b!709113 (= res!472686 (not (contains!3950 (t!19664 acc!652) (h!14414 acc!652))))))

(declare-fun b!709114 () Bool)

(assert (=> b!709114 (= e!399106 (noDuplicate!1197 (t!19664 acc!652)))))

(assert (= (and d!97059 (not res!472685)) b!709113))

(assert (= (and b!709113 res!472686) b!709114))

(declare-fun m!666493 () Bool)

(assert (=> b!709113 m!666493))

(declare-fun m!666495 () Bool)

(assert (=> b!709114 m!666495))

(assert (=> b!708780 d!97059))

(declare-fun d!97061 () Bool)

(declare-fun res!472687 () Bool)

(declare-fun e!399107 () Bool)

(assert (=> d!97061 (=> res!472687 e!399107)))

(assert (=> d!97061 (= res!472687 (is-Nil!13370 newAcc!49))))

(assert (=> d!97061 (= (noDuplicate!1197 newAcc!49) e!399107)))

(declare-fun b!709115 () Bool)

(declare-fun e!399108 () Bool)

(assert (=> b!709115 (= e!399107 e!399108)))

(declare-fun res!472688 () Bool)

(assert (=> b!709115 (=> (not res!472688) (not e!399108))))

(assert (=> b!709115 (= res!472688 (not (contains!3950 (t!19664 newAcc!49) (h!14414 newAcc!49))))))

(declare-fun b!709116 () Bool)

(assert (=> b!709116 (= e!399108 (noDuplicate!1197 (t!19664 newAcc!49)))))

(assert (= (and d!97061 (not res!472687)) b!709115))

(assert (= (and b!709115 res!472688) b!709116))

(declare-fun m!666497 () Bool)

(assert (=> b!709115 m!666497))

(declare-fun m!666499 () Bool)

(assert (=> b!709116 m!666499))

(assert (=> b!708781 d!97061))

(declare-fun d!97063 () Bool)

(declare-fun res!472693 () Bool)

(declare-fun e!399113 () Bool)

(assert (=> d!97063 (=> res!472693 e!399113)))

(assert (=> d!97063 (= res!472693 (= (select (arr!19332 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k!2824))))

(assert (=> d!97063 (= (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!399113)))

(declare-fun b!709121 () Bool)

(declare-fun e!399114 () Bool)

(assert (=> b!709121 (= e!399113 e!399114)))

(declare-fun res!472694 () Bool)

(assert (=> b!709121 (=> (not res!472694) (not e!399114))))

(assert (=> b!709121 (= res!472694 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19723 a!3591)))))

(declare-fun b!709122 () Bool)

(assert (=> b!709122 (= e!399114 (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97063 (not res!472693)) b!709121))

(assert (= (and b!709121 res!472694) b!709122))

(declare-fun m!666501 () Bool)

(assert (=> d!97063 m!666501))

(declare-fun m!666503 () Bool)

(assert (=> b!709122 m!666503))

(assert (=> b!708792 d!97063))

(declare-fun d!97065 () Bool)

(assert (=> d!97065 (= (validKeyInArray!0 (select (arr!19332 a!3591) from!2969)) (and (not (= (select (arr!19332 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19332 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!708793 d!97065))

(declare-fun d!97067 () Bool)

(declare-fun res!472698 () Bool)

(declare-fun e!399119 () Bool)

(assert (=> d!97067 (=> res!472698 e!399119)))

(assert (=> d!97067 (= res!472698 (= (select (arr!19332 a!3591) from!2969) k!2824))))

(assert (=> d!97067 (= (arrayContainsKey!0 a!3591 k!2824 from!2969) e!399119)))

(declare-fun b!709128 () Bool)

(declare-fun e!399120 () Bool)

(assert (=> b!709128 (= e!399119 e!399120)))

(declare-fun res!472699 () Bool)

(assert (=> b!709128 (=> (not res!472699) (not e!399120))))

(assert (=> b!709128 (= res!472699 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19723 a!3591)))))

(declare-fun b!709129 () Bool)

(assert (=> b!709129 (= e!399120 (arrayContainsKey!0 a!3591 k!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!97067 (not res!472698)) b!709128))

(assert (= (and b!709128 res!472699) b!709129))

(assert (=> d!97067 m!666175))

(declare-fun m!666505 () Bool)

(assert (=> b!709129 m!666505))

(assert (=> b!708782 d!97067))

(push 1)

