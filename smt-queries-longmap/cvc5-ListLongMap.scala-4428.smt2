; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61460 () Bool)

(assert start!61460)

(declare-fun b!687545 () Bool)

(declare-datatypes ((Unit!24237 0))(
  ( (Unit!24238) )
))
(declare-fun e!391609 () Unit!24237)

(declare-fun Unit!24239 () Unit!24237)

(assert (=> b!687545 (= e!391609 Unit!24239)))

(declare-fun b!687547 () Bool)

(declare-fun res!452421 () Bool)

(declare-fun e!391605 () Bool)

(assert (=> b!687547 (=> (not res!452421) (not e!391605))))

(declare-datatypes ((array!39682 0))(
  ( (array!39683 (arr!19014 (Array (_ BitVec 32) (_ BitVec 64))) (size!19393 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39682)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13055 0))(
  ( (Nil!13052) (Cons!13051 (h!14096 (_ BitVec 64)) (t!19316 List!13055)) )
))
(declare-fun acc!681 () List!13055)

(declare-fun arrayNoDuplicates!0 (array!39682 (_ BitVec 32) List!13055) Bool)

(assert (=> b!687547 (= res!452421 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!687548 () Bool)

(declare-fun res!452433 () Bool)

(assert (=> b!687548 (=> (not res!452433) (not e!391605))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!687548 (= res!452433 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19393 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!687549 () Bool)

(declare-fun e!391603 () Bool)

(declare-fun lt!315453 () List!13055)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3632 (List!13055 (_ BitVec 64)) Bool)

(assert (=> b!687549 (= e!391603 (not (contains!3632 lt!315453 k!2843)))))

(declare-fun b!687550 () Bool)

(declare-fun res!452425 () Bool)

(assert (=> b!687550 (=> (not res!452425) (not e!391605))))

(declare-fun noDuplicate!879 (List!13055) Bool)

(assert (=> b!687550 (= res!452425 (noDuplicate!879 acc!681))))

(declare-fun b!687551 () Bool)

(declare-fun res!452436 () Bool)

(assert (=> b!687551 (=> (not res!452436) (not e!391605))))

(assert (=> b!687551 (= res!452436 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19393 a!3626))))))

(declare-fun b!687552 () Bool)

(declare-fun res!452424 () Bool)

(assert (=> b!687552 (=> (not res!452424) (not e!391605))))

(assert (=> b!687552 (= res!452424 (not (contains!3632 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687553 () Bool)

(declare-fun e!391606 () Unit!24237)

(declare-fun Unit!24240 () Unit!24237)

(assert (=> b!687553 (= e!391606 Unit!24240)))

(declare-fun b!687554 () Bool)

(declare-fun res!452427 () Bool)

(declare-fun e!391608 () Bool)

(assert (=> b!687554 (=> res!452427 e!391608)))

(declare-fun e!391607 () Bool)

(assert (=> b!687554 (= res!452427 e!391607)))

(declare-fun res!452434 () Bool)

(assert (=> b!687554 (=> (not res!452434) (not e!391607))))

(assert (=> b!687554 (= res!452434 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!452437 () Bool)

(assert (=> start!61460 (=> (not res!452437) (not e!391605))))

(assert (=> start!61460 (= res!452437 (and (bvslt (size!19393 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19393 a!3626))))))

(assert (=> start!61460 e!391605))

(assert (=> start!61460 true))

(declare-fun array_inv!14810 (array!39682) Bool)

(assert (=> start!61460 (array_inv!14810 a!3626)))

(declare-fun b!687546 () Bool)

(assert (=> b!687546 (= e!391605 (not e!391608))))

(declare-fun res!452422 () Bool)

(assert (=> b!687546 (=> res!452422 e!391608)))

(assert (=> b!687546 (= res!452422 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!687546 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315453)))

(declare-fun lt!315450 () Unit!24237)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39682 (_ BitVec 64) (_ BitVec 32) List!13055 List!13055) Unit!24237)

(assert (=> b!687546 (= lt!315450 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315453))))

(declare-fun -!183 (List!13055 (_ BitVec 64)) List!13055)

(assert (=> b!687546 (= (-!183 lt!315453 k!2843) acc!681)))

(declare-fun $colon$colon!383 (List!13055 (_ BitVec 64)) List!13055)

(assert (=> b!687546 (= lt!315453 ($colon$colon!383 acc!681 k!2843))))

(declare-fun lt!315455 () Unit!24237)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13055) Unit!24237)

(assert (=> b!687546 (= lt!315455 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!218 (List!13055 List!13055) Bool)

(assert (=> b!687546 (subseq!218 acc!681 acc!681)))

(declare-fun lt!315449 () Unit!24237)

(declare-fun lemmaListSubSeqRefl!0 (List!13055) Unit!24237)

(assert (=> b!687546 (= lt!315449 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!687546 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315456 () Unit!24237)

(assert (=> b!687546 (= lt!315456 e!391606)))

(declare-fun c!77930 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!687546 (= c!77930 (validKeyInArray!0 (select (arr!19014 a!3626) from!3004)))))

(declare-fun lt!315451 () Unit!24237)

(assert (=> b!687546 (= lt!315451 e!391609)))

(declare-fun c!77929 () Bool)

(declare-fun arrayContainsKey!0 (array!39682 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!687546 (= c!77929 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!687546 (arrayContainsKey!0 (array!39683 (store (arr!19014 a!3626) i!1382 k!2843) (size!19393 a!3626)) k!2843 from!3004)))

(declare-fun b!687555 () Bool)

(assert (=> b!687555 (= e!391608 e!391603)))

(declare-fun res!452441 () Bool)

(assert (=> b!687555 (=> (not res!452441) (not e!391603))))

(assert (=> b!687555 (= res!452441 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!687556 () Bool)

(declare-fun e!391610 () Bool)

(assert (=> b!687556 (= e!391610 (not (contains!3632 acc!681 k!2843)))))

(declare-fun b!687557 () Bool)

(declare-fun res!452439 () Bool)

(assert (=> b!687557 (=> res!452439 e!391608)))

(assert (=> b!687557 (= res!452439 (contains!3632 lt!315453 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687558 () Bool)

(declare-fun e!391604 () Bool)

(assert (=> b!687558 (= e!391604 (contains!3632 acc!681 k!2843))))

(declare-fun b!687559 () Bool)

(assert (=> b!687559 (= e!391607 (contains!3632 lt!315453 k!2843))))

(declare-fun b!687560 () Bool)

(declare-fun res!452435 () Bool)

(assert (=> b!687560 (=> (not res!452435) (not e!391605))))

(assert (=> b!687560 (= res!452435 (validKeyInArray!0 k!2843))))

(declare-fun b!687561 () Bool)

(declare-fun res!452440 () Bool)

(assert (=> b!687561 (=> (not res!452440) (not e!391605))))

(assert (=> b!687561 (= res!452440 (not (contains!3632 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!687562 () Bool)

(declare-fun res!452438 () Bool)

(assert (=> b!687562 (=> res!452438 e!391608)))

(assert (=> b!687562 (= res!452438 (not (noDuplicate!879 lt!315453)))))

(declare-fun b!687563 () Bool)

(declare-fun Unit!24241 () Unit!24237)

(assert (=> b!687563 (= e!391609 Unit!24241)))

(declare-fun lt!315452 () Unit!24237)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39682 (_ BitVec 64) (_ BitVec 32)) Unit!24237)

(assert (=> b!687563 (= lt!315452 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!687563 false))

(declare-fun b!687564 () Bool)

(declare-fun res!452426 () Bool)

(assert (=> b!687564 (=> (not res!452426) (not e!391605))))

(declare-fun e!391602 () Bool)

(assert (=> b!687564 (= res!452426 e!391602)))

(declare-fun res!452431 () Bool)

(assert (=> b!687564 (=> res!452431 e!391602)))

(assert (=> b!687564 (= res!452431 e!391604)))

(declare-fun res!452428 () Bool)

(assert (=> b!687564 (=> (not res!452428) (not e!391604))))

(assert (=> b!687564 (= res!452428 (bvsgt from!3004 i!1382))))

(declare-fun b!687565 () Bool)

(declare-fun res!452429 () Bool)

(assert (=> b!687565 (=> res!452429 e!391608)))

(assert (=> b!687565 (= res!452429 (contains!3632 lt!315453 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687566 () Bool)

(declare-fun res!452423 () Bool)

(assert (=> b!687566 (=> (not res!452423) (not e!391605))))

(assert (=> b!687566 (= res!452423 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13052))))

(declare-fun b!687567 () Bool)

(declare-fun res!452432 () Bool)

(assert (=> b!687567 (=> (not res!452432) (not e!391605))))

(assert (=> b!687567 (= res!452432 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!687568 () Bool)

(assert (=> b!687568 (= e!391602 e!391610)))

(declare-fun res!452430 () Bool)

(assert (=> b!687568 (=> (not res!452430) (not e!391610))))

(assert (=> b!687568 (= res!452430 (bvsle from!3004 i!1382))))

(declare-fun b!687569 () Bool)

(declare-fun lt!315454 () Unit!24237)

(assert (=> b!687569 (= e!391606 lt!315454)))

(declare-fun lt!315457 () Unit!24237)

(assert (=> b!687569 (= lt!315457 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!687569 (subseq!218 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39682 List!13055 List!13055 (_ BitVec 32)) Unit!24237)

(assert (=> b!687569 (= lt!315454 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!383 acc!681 (select (arr!19014 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!687569 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(assert (= (and start!61460 res!452437) b!687550))

(assert (= (and b!687550 res!452425) b!687552))

(assert (= (and b!687552 res!452424) b!687561))

(assert (= (and b!687561 res!452440) b!687564))

(assert (= (and b!687564 res!452428) b!687558))

(assert (= (and b!687564 (not res!452431)) b!687568))

(assert (= (and b!687568 res!452430) b!687556))

(assert (= (and b!687564 res!452426) b!687566))

(assert (= (and b!687566 res!452423) b!687547))

(assert (= (and b!687547 res!452421) b!687551))

(assert (= (and b!687551 res!452436) b!687560))

(assert (= (and b!687560 res!452435) b!687567))

(assert (= (and b!687567 res!452432) b!687548))

(assert (= (and b!687548 res!452433) b!687546))

(assert (= (and b!687546 c!77929) b!687563))

(assert (= (and b!687546 (not c!77929)) b!687545))

(assert (= (and b!687546 c!77930) b!687569))

(assert (= (and b!687546 (not c!77930)) b!687553))

(assert (= (and b!687546 (not res!452422)) b!687562))

(assert (= (and b!687562 (not res!452438)) b!687557))

(assert (= (and b!687557 (not res!452439)) b!687565))

(assert (= (and b!687565 (not res!452429)) b!687554))

(assert (= (and b!687554 res!452434) b!687559))

(assert (= (and b!687554 (not res!452427)) b!687555))

(assert (= (and b!687555 res!452441) b!687549))

(declare-fun m!651569 () Bool)

(assert (=> b!687556 m!651569))

(assert (=> b!687558 m!651569))

(declare-fun m!651571 () Bool)

(assert (=> b!687546 m!651571))

(declare-fun m!651573 () Bool)

(assert (=> b!687546 m!651573))

(declare-fun m!651575 () Bool)

(assert (=> b!687546 m!651575))

(declare-fun m!651577 () Bool)

(assert (=> b!687546 m!651577))

(declare-fun m!651579 () Bool)

(assert (=> b!687546 m!651579))

(declare-fun m!651581 () Bool)

(assert (=> b!687546 m!651581))

(declare-fun m!651583 () Bool)

(assert (=> b!687546 m!651583))

(declare-fun m!651585 () Bool)

(assert (=> b!687546 m!651585))

(declare-fun m!651587 () Bool)

(assert (=> b!687546 m!651587))

(declare-fun m!651589 () Bool)

(assert (=> b!687546 m!651589))

(assert (=> b!687546 m!651573))

(declare-fun m!651591 () Bool)

(assert (=> b!687546 m!651591))

(declare-fun m!651593 () Bool)

(assert (=> b!687546 m!651593))

(declare-fun m!651595 () Bool)

(assert (=> b!687546 m!651595))

(declare-fun m!651597 () Bool)

(assert (=> start!61460 m!651597))

(declare-fun m!651599 () Bool)

(assert (=> b!687552 m!651599))

(declare-fun m!651601 () Bool)

(assert (=> b!687562 m!651601))

(declare-fun m!651603 () Bool)

(assert (=> b!687557 m!651603))

(assert (=> b!687569 m!651571))

(assert (=> b!687569 m!651573))

(declare-fun m!651605 () Bool)

(assert (=> b!687569 m!651605))

(declare-fun m!651607 () Bool)

(assert (=> b!687569 m!651607))

(assert (=> b!687569 m!651573))

(assert (=> b!687569 m!651605))

(assert (=> b!687569 m!651579))

(assert (=> b!687569 m!651595))

(declare-fun m!651609 () Bool)

(assert (=> b!687547 m!651609))

(declare-fun m!651611 () Bool)

(assert (=> b!687550 m!651611))

(declare-fun m!651613 () Bool)

(assert (=> b!687549 m!651613))

(declare-fun m!651615 () Bool)

(assert (=> b!687566 m!651615))

(declare-fun m!651617 () Bool)

(assert (=> b!687560 m!651617))

(declare-fun m!651619 () Bool)

(assert (=> b!687565 m!651619))

(declare-fun m!651621 () Bool)

(assert (=> b!687563 m!651621))

(declare-fun m!651623 () Bool)

(assert (=> b!687567 m!651623))

(assert (=> b!687559 m!651613))

(declare-fun m!651625 () Bool)

(assert (=> b!687561 m!651625))

(push 1)

(assert (not b!687565))

(assert (not b!687567))

(assert (not b!687561))

(assert (not b!687552))

(assert (not b!687546))

(assert (not b!687547))

(assert (not b!687558))

(assert (not start!61460))

(assert (not b!687566))

(assert (not b!687549))

(assert (not b!687556))

(assert (not b!687562))

(assert (not b!687560))

(assert (not b!687569))

(assert (not b!687557))

(assert (not b!687559))

(assert (not b!687550))

(assert (not b!687563))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95085 () Bool)

(declare-fun lt!315518 () Bool)

(declare-fun content!301 (List!13055) (Set (_ BitVec 64)))

(assert (=> d!95085 (= lt!315518 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!301 lt!315453)))))

(declare-fun e!391711 () Bool)

(assert (=> d!95085 (= lt!315518 e!391711)))

(declare-fun res!452603 () Bool)

(assert (=> d!95085 (=> (not res!452603) (not e!391711))))

(assert (=> d!95085 (= res!452603 (is-Cons!13051 lt!315453))))

(assert (=> d!95085 (= (contains!3632 lt!315453 #b0000000000000000000000000000000000000000000000000000000000000000) lt!315518)))

(declare-fun b!687761 () Bool)

(declare-fun e!391710 () Bool)

(assert (=> b!687761 (= e!391711 e!391710)))

(declare-fun res!452604 () Bool)

(assert (=> b!687761 (=> res!452604 e!391710)))

(assert (=> b!687761 (= res!452604 (= (h!14096 lt!315453) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687762 () Bool)

(assert (=> b!687762 (= e!391710 (contains!3632 (t!19316 lt!315453) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95085 res!452603) b!687761))

(assert (= (and b!687761 (not res!452604)) b!687762))

(declare-fun m!651771 () Bool)

(assert (=> d!95085 m!651771))

(declare-fun m!651773 () Bool)

(assert (=> d!95085 m!651773))

(declare-fun m!651775 () Bool)

(assert (=> b!687762 m!651775))

(assert (=> b!687557 d!95085))

(declare-fun d!95089 () Bool)

(assert (=> d!95089 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315453)))

(declare-fun lt!315523 () Unit!24237)

(declare-fun choose!66 (array!39682 (_ BitVec 64) (_ BitVec 32) List!13055 List!13055) Unit!24237)

(assert (=> d!95089 (= lt!315523 (choose!66 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315453))))

(assert (=> d!95089 (bvslt (size!19393 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95089 (= (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315453) lt!315523)))

(declare-fun bs!20167 () Bool)

(assert (= bs!20167 d!95089))

(assert (=> bs!20167 m!651587))

(declare-fun m!651777 () Bool)

(assert (=> bs!20167 m!651777))

(assert (=> b!687546 d!95089))

(declare-fun e!391760 () Bool)

(declare-fun lt!315531 () List!13055)

(declare-fun b!687817 () Bool)

(assert (=> b!687817 (= e!391760 (= (content!301 lt!315531) (set.minus (content!301 lt!315453) (set.insert k!2843 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun b!687818 () Bool)

(declare-fun e!391759 () List!13055)

(declare-fun e!391761 () List!13055)

(assert (=> b!687818 (= e!391759 e!391761)))

(declare-fun c!77955 () Bool)

(assert (=> b!687818 (= c!77955 (= k!2843 (h!14096 lt!315453)))))

(declare-fun b!687819 () Bool)

(assert (=> b!687819 (= e!391759 Nil!13052)))

(declare-fun b!687820 () Bool)

(declare-fun call!34164 () List!13055)

(assert (=> b!687820 (= e!391761 (Cons!13051 (h!14096 lt!315453) call!34164))))

(declare-fun bm!34161 () Bool)

(assert (=> bm!34161 (= call!34164 (-!183 (t!19316 lt!315453) k!2843))))

(declare-fun b!687821 () Bool)

(assert (=> b!687821 (= e!391761 call!34164)))

(declare-fun d!95091 () Bool)

(assert (=> d!95091 e!391760))

(declare-fun res!452643 () Bool)

(assert (=> d!95091 (=> (not res!452643) (not e!391760))))

(declare-fun size!19396 (List!13055) Int)

(assert (=> d!95091 (= res!452643 (<= (size!19396 lt!315531) (size!19396 lt!315453)))))

(assert (=> d!95091 (= lt!315531 e!391759)))

(declare-fun c!77954 () Bool)

(assert (=> d!95091 (= c!77954 (is-Cons!13051 lt!315453))))

(assert (=> d!95091 (= (-!183 lt!315453 k!2843) lt!315531)))

(assert (= (and d!95091 c!77954) b!687818))

(assert (= (and d!95091 (not c!77954)) b!687819))

(assert (= (and b!687818 c!77955) b!687821))

(assert (= (and b!687818 (not c!77955)) b!687820))

(assert (= (or b!687821 b!687820) bm!34161))

(assert (= (and d!95091 res!452643) b!687817))

(declare-fun m!651811 () Bool)

(assert (=> b!687817 m!651811))

(assert (=> b!687817 m!651771))

(declare-fun m!651813 () Bool)

(assert (=> b!687817 m!651813))

(declare-fun m!651815 () Bool)

(assert (=> bm!34161 m!651815))

(declare-fun m!651817 () Bool)

(assert (=> d!95091 m!651817))

(declare-fun m!651819 () Bool)

(assert (=> d!95091 m!651819))

(assert (=> b!687546 d!95091))

(declare-fun b!687839 () Bool)

(declare-fun e!391778 () Bool)

(declare-fun e!391780 () Bool)

(assert (=> b!687839 (= e!391778 e!391780)))

(declare-fun res!452663 () Bool)

(assert (=> b!687839 (=> res!452663 e!391780)))

(declare-fun e!391781 () Bool)

(assert (=> b!687839 (= res!452663 e!391781)))

(declare-fun res!452661 () Bool)

(assert (=> b!687839 (=> (not res!452661) (not e!391781))))

(assert (=> b!687839 (= res!452661 (= (h!14096 acc!681) (h!14096 acc!681)))))

(declare-fun d!95107 () Bool)

(declare-fun res!452660 () Bool)

(declare-fun e!391779 () Bool)

(assert (=> d!95107 (=> res!452660 e!391779)))

(assert (=> d!95107 (= res!452660 (is-Nil!13052 acc!681))))

(assert (=> d!95107 (= (subseq!218 acc!681 acc!681) e!391779)))

(declare-fun b!687841 () Bool)

(assert (=> b!687841 (= e!391780 (subseq!218 acc!681 (t!19316 acc!681)))))

(declare-fun b!687840 () Bool)

(assert (=> b!687840 (= e!391781 (subseq!218 (t!19316 acc!681) (t!19316 acc!681)))))

(declare-fun b!687838 () Bool)

(assert (=> b!687838 (= e!391779 e!391778)))

(declare-fun res!452662 () Bool)

(assert (=> b!687838 (=> (not res!452662) (not e!391778))))

(assert (=> b!687838 (= res!452662 (is-Cons!13051 acc!681))))

(assert (= (and d!95107 (not res!452660)) b!687838))

(assert (= (and b!687838 res!452662) b!687839))

(assert (= (and b!687839 res!452661) b!687840))

(assert (= (and b!687839 (not res!452663)) b!687841))

(declare-fun m!651831 () Bool)

(assert (=> b!687841 m!651831))

(declare-fun m!651835 () Bool)

(assert (=> b!687840 m!651835))

(assert (=> b!687546 d!95107))

(declare-fun d!95117 () Bool)

(assert (=> d!95117 (= (-!183 ($colon$colon!383 acc!681 k!2843) k!2843) acc!681)))

(declare-fun lt!315546 () Unit!24237)

(declare-fun choose!16 ((_ BitVec 64) List!13055) Unit!24237)

(assert (=> d!95117 (= lt!315546 (choose!16 k!2843 acc!681))))

(assert (=> d!95117 (not (contains!3632 acc!681 k!2843))))

(assert (=> d!95117 (= (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681) lt!315546)))

(declare-fun bs!20172 () Bool)

(assert (= bs!20172 d!95117))

(assert (=> bs!20172 m!651585))

(assert (=> bs!20172 m!651585))

(declare-fun m!651841 () Bool)

(assert (=> bs!20172 m!651841))

(declare-fun m!651843 () Bool)

(assert (=> bs!20172 m!651843))

(assert (=> bs!20172 m!651569))

(assert (=> b!687546 d!95117))

(declare-fun d!95125 () Bool)

(declare-fun res!452673 () Bool)

(declare-fun e!391798 () Bool)

(assert (=> d!95125 (=> res!452673 e!391798)))

(assert (=> d!95125 (= res!452673 (= (select (arr!19014 (array!39683 (store (arr!19014 a!3626) i!1382 k!2843) (size!19393 a!3626))) from!3004) k!2843))))

(assert (=> d!95125 (= (arrayContainsKey!0 (array!39683 (store (arr!19014 a!3626) i!1382 k!2843) (size!19393 a!3626)) k!2843 from!3004) e!391798)))

(declare-fun b!687863 () Bool)

(declare-fun e!391799 () Bool)

(assert (=> b!687863 (= e!391798 e!391799)))

(declare-fun res!452674 () Bool)

(assert (=> b!687863 (=> (not res!452674) (not e!391799))))

(assert (=> b!687863 (= res!452674 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19393 (array!39683 (store (arr!19014 a!3626) i!1382 k!2843) (size!19393 a!3626)))))))

(declare-fun b!687864 () Bool)

(assert (=> b!687864 (= e!391799 (arrayContainsKey!0 (array!39683 (store (arr!19014 a!3626) i!1382 k!2843) (size!19393 a!3626)) k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95125 (not res!452673)) b!687863))

(assert (= (and b!687863 res!452674) b!687864))

(declare-fun m!651859 () Bool)

(assert (=> d!95125 m!651859))

(declare-fun m!651861 () Bool)

(assert (=> b!687864 m!651861))

(assert (=> b!687546 d!95125))

(declare-fun b!687914 () Bool)

(declare-fun e!391841 () Bool)

(declare-fun e!391843 () Bool)

(assert (=> b!687914 (= e!391841 e!391843)))

(declare-fun c!77972 () Bool)

(assert (=> b!687914 (= c!77972 (validKeyInArray!0 (select (arr!19014 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!95131 () Bool)

(declare-fun res!452706 () Bool)

(declare-fun e!391842 () Bool)

(assert (=> d!95131 (=> res!452706 e!391842)))

(assert (=> d!95131 (= res!452706 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19393 a!3626)))))

(assert (=> d!95131 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315453) e!391842)))

(declare-fun b!687915 () Bool)

(declare-fun call!34175 () Bool)

(assert (=> b!687915 (= e!391843 call!34175)))

(declare-fun b!687916 () Bool)

(declare-fun e!391840 () Bool)

(assert (=> b!687916 (= e!391840 (contains!3632 lt!315453 (select (arr!19014 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34172 () Bool)

(assert (=> bm!34172 (= call!34175 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77972 (Cons!13051 (select (arr!19014 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) lt!315453) lt!315453)))))

(declare-fun b!687917 () Bool)

(assert (=> b!687917 (= e!391842 e!391841)))

(declare-fun res!452704 () Bool)

(assert (=> b!687917 (=> (not res!452704) (not e!391841))))

(assert (=> b!687917 (= res!452704 (not e!391840))))

(declare-fun res!452705 () Bool)

(assert (=> b!687917 (=> (not res!452705) (not e!391840))))

(assert (=> b!687917 (= res!452705 (validKeyInArray!0 (select (arr!19014 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!687918 () Bool)

(assert (=> b!687918 (= e!391843 call!34175)))

(assert (= (and d!95131 (not res!452706)) b!687917))

(assert (= (and b!687917 res!452705) b!687916))

(assert (= (and b!687917 res!452704) b!687914))

(assert (= (and b!687914 c!77972) b!687918))

(assert (= (and b!687914 (not c!77972)) b!687915))

(assert (= (or b!687918 b!687915) bm!34172))

(declare-fun m!651893 () Bool)

(assert (=> b!687914 m!651893))

(assert (=> b!687914 m!651893))

(declare-fun m!651895 () Bool)

(assert (=> b!687914 m!651895))

(assert (=> b!687916 m!651893))

(assert (=> b!687916 m!651893))

(declare-fun m!651897 () Bool)

(assert (=> b!687916 m!651897))

(assert (=> bm!34172 m!651893))

(declare-fun m!651903 () Bool)

(assert (=> bm!34172 m!651903))

(assert (=> b!687917 m!651893))

(assert (=> b!687917 m!651893))

(assert (=> b!687917 m!651895))

(assert (=> b!687546 d!95131))

(declare-fun d!95147 () Bool)

(declare-fun res!452713 () Bool)

(declare-fun e!391852 () Bool)

(assert (=> d!95147 (=> res!452713 e!391852)))

(assert (=> d!95147 (= res!452713 (= (select (arr!19014 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k!2843))))

(assert (=> d!95147 (= (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!391852)))

(declare-fun b!687929 () Bool)

(declare-fun e!391853 () Bool)

(assert (=> b!687929 (= e!391852 e!391853)))

(declare-fun res!452714 () Bool)

(assert (=> b!687929 (=> (not res!452714) (not e!391853))))

(assert (=> b!687929 (= res!452714 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19393 a!3626)))))

(declare-fun b!687930 () Bool)

(assert (=> b!687930 (= e!391853 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!95147 (not res!452713)) b!687929))

(assert (= (and b!687929 res!452714) b!687930))

(assert (=> d!95147 m!651893))

(declare-fun m!651909 () Bool)

(assert (=> b!687930 m!651909))

(assert (=> b!687546 d!95147))

(declare-fun d!95151 () Bool)

(assert (=> d!95151 (subseq!218 acc!681 acc!681)))

(declare-fun lt!315561 () Unit!24237)

(declare-fun choose!36 (List!13055) Unit!24237)

(assert (=> d!95151 (= lt!315561 (choose!36 acc!681))))

(assert (=> d!95151 (= (lemmaListSubSeqRefl!0 acc!681) lt!315561)))

(declare-fun bs!20175 () Bool)

(assert (= bs!20175 d!95151))

(assert (=> bs!20175 m!651595))

(declare-fun m!651935 () Bool)

(assert (=> bs!20175 m!651935))

(assert (=> b!687546 d!95151))

(declare-fun d!95167 () Bool)

(assert (=> d!95167 (= (validKeyInArray!0 (select (arr!19014 a!3626) from!3004)) (and (not (= (select (arr!19014 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19014 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!687546 d!95167))

(declare-fun d!95171 () Bool)

(assert (=> d!95171 (= ($colon$colon!383 acc!681 k!2843) (Cons!13051 k!2843 acc!681))))

(assert (=> b!687546 d!95171))

(declare-fun b!687943 () Bool)

(declare-fun e!391867 () Bool)

(declare-fun e!391869 () Bool)

(assert (=> b!687943 (= e!391867 e!391869)))

(declare-fun c!77975 () Bool)

(assert (=> b!687943 (= c!77975 (validKeyInArray!0 (select (arr!19014 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun d!95175 () Bool)

(declare-fun res!452729 () Bool)

(declare-fun e!391868 () Bool)

(assert (=> d!95175 (=> res!452729 e!391868)))

(assert (=> d!95175 (= res!452729 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19393 a!3626)))))

(assert (=> d!95175 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!391868)))

(declare-fun b!687944 () Bool)

(declare-fun call!34178 () Bool)

(assert (=> b!687944 (= e!391869 call!34178)))

(declare-fun e!391866 () Bool)

(declare-fun b!687945 () Bool)

(assert (=> b!687945 (= e!391866 (contains!3632 acc!681 (select (arr!19014 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34175 () Bool)

(assert (=> bm!34175 (= call!34178 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77975 (Cons!13051 (select (arr!19014 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!687946 () Bool)

(assert (=> b!687946 (= e!391868 e!391867)))

(declare-fun res!452727 () Bool)

(assert (=> b!687946 (=> (not res!452727) (not e!391867))))

(assert (=> b!687946 (= res!452727 (not e!391866))))

(declare-fun res!452728 () Bool)

(assert (=> b!687946 (=> (not res!452728) (not e!391866))))

(assert (=> b!687946 (= res!452728 (validKeyInArray!0 (select (arr!19014 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!687947 () Bool)

(assert (=> b!687947 (= e!391869 call!34178)))

(assert (= (and d!95175 (not res!452729)) b!687946))

(assert (= (and b!687946 res!452728) b!687945))

(assert (= (and b!687946 res!452727) b!687943))

(assert (= (and b!687943 c!77975) b!687947))

(assert (= (and b!687943 (not c!77975)) b!687944))

(assert (= (or b!687947 b!687944) bm!34175))

(assert (=> b!687943 m!651893))

(assert (=> b!687943 m!651893))

(assert (=> b!687943 m!651895))

(assert (=> b!687945 m!651893))

(assert (=> b!687945 m!651893))

(declare-fun m!651943 () Bool)

(assert (=> b!687945 m!651943))

(assert (=> bm!34175 m!651893))

(declare-fun m!651947 () Bool)

(assert (=> bm!34175 m!651947))

(assert (=> b!687946 m!651893))

(assert (=> b!687946 m!651893))

(assert (=> b!687946 m!651895))

(assert (=> b!687546 d!95175))

(declare-fun b!687948 () Bool)

(declare-fun e!391871 () Bool)

(declare-fun e!391873 () Bool)

(assert (=> b!687948 (= e!391871 e!391873)))

(declare-fun c!77976 () Bool)

(assert (=> b!687948 (= c!77976 (validKeyInArray!0 (select (arr!19014 a!3626) from!3004)))))

(declare-fun d!95183 () Bool)

(declare-fun res!452732 () Bool)

(declare-fun e!391872 () Bool)

(assert (=> d!95183 (=> res!452732 e!391872)))

(assert (=> d!95183 (= res!452732 (bvsge from!3004 (size!19393 a!3626)))))

(assert (=> d!95183 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!391872)))

(declare-fun b!687949 () Bool)

(declare-fun call!34179 () Bool)

(assert (=> b!687949 (= e!391873 call!34179)))

(declare-fun e!391870 () Bool)

(declare-fun b!687950 () Bool)

(assert (=> b!687950 (= e!391870 (contains!3632 acc!681 (select (arr!19014 a!3626) from!3004)))))

(declare-fun bm!34176 () Bool)

(assert (=> bm!34176 (= call!34179 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77976 (Cons!13051 (select (arr!19014 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!687951 () Bool)

(assert (=> b!687951 (= e!391872 e!391871)))

(declare-fun res!452730 () Bool)

(assert (=> b!687951 (=> (not res!452730) (not e!391871))))

(assert (=> b!687951 (= res!452730 (not e!391870))))

(declare-fun res!452731 () Bool)

(assert (=> b!687951 (=> (not res!452731) (not e!391870))))

(assert (=> b!687951 (= res!452731 (validKeyInArray!0 (select (arr!19014 a!3626) from!3004)))))

(declare-fun b!687952 () Bool)

(assert (=> b!687952 (= e!391873 call!34179)))

(assert (= (and d!95183 (not res!452732)) b!687951))

(assert (= (and b!687951 res!452731) b!687950))

(assert (= (and b!687951 res!452730) b!687948))

(assert (= (and b!687948 c!77976) b!687952))

(assert (= (and b!687948 (not c!77976)) b!687949))

(assert (= (or b!687952 b!687949) bm!34176))

(assert (=> b!687948 m!651573))

(assert (=> b!687948 m!651573))

(assert (=> b!687948 m!651591))

(assert (=> b!687950 m!651573))

(assert (=> b!687950 m!651573))

(declare-fun m!651951 () Bool)

(assert (=> b!687950 m!651951))

(assert (=> bm!34176 m!651573))

(declare-fun m!651953 () Bool)

(assert (=> bm!34176 m!651953))

(assert (=> b!687951 m!651573))

(assert (=> b!687951 m!651573))

(assert (=> b!687951 m!651591))

(assert (=> b!687547 d!95183))

(declare-fun b!687958 () Bool)

(declare-fun e!391879 () Bool)

(declare-fun e!391881 () Bool)

(assert (=> b!687958 (= e!391879 e!391881)))

(declare-fun c!77978 () Bool)

(assert (=> b!687958 (= c!77978 (validKeyInArray!0 (select (arr!19014 a!3626) #b00000000000000000000000000000000)))))

(declare-fun d!95187 () Bool)

(declare-fun res!452738 () Bool)

(declare-fun e!391880 () Bool)

(assert (=> d!95187 (=> res!452738 e!391880)))

(assert (=> d!95187 (= res!452738 (bvsge #b00000000000000000000000000000000 (size!19393 a!3626)))))

(assert (=> d!95187 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13052) e!391880)))

(declare-fun b!687959 () Bool)

(declare-fun call!34181 () Bool)

(assert (=> b!687959 (= e!391881 call!34181)))

(declare-fun b!687960 () Bool)

(declare-fun e!391878 () Bool)

(assert (=> b!687960 (= e!391878 (contains!3632 Nil!13052 (select (arr!19014 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34178 () Bool)

(assert (=> bm!34178 (= call!34181 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77978 (Cons!13051 (select (arr!19014 a!3626) #b00000000000000000000000000000000) Nil!13052) Nil!13052)))))

(declare-fun b!687961 () Bool)

(assert (=> b!687961 (= e!391880 e!391879)))

(declare-fun res!452736 () Bool)

(assert (=> b!687961 (=> (not res!452736) (not e!391879))))

(assert (=> b!687961 (= res!452736 (not e!391878))))

(declare-fun res!452737 () Bool)

(assert (=> b!687961 (=> (not res!452737) (not e!391878))))

(assert (=> b!687961 (= res!452737 (validKeyInArray!0 (select (arr!19014 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!687962 () Bool)

(assert (=> b!687962 (= e!391881 call!34181)))

(assert (= (and d!95187 (not res!452738)) b!687961))

(assert (= (and b!687961 res!452737) b!687960))

(assert (= (and b!687961 res!452736) b!687958))

(assert (= (and b!687958 c!77978) b!687962))

(assert (= (and b!687958 (not c!77978)) b!687959))

(assert (= (or b!687962 b!687959) bm!34178))

(declare-fun m!651961 () Bool)

(assert (=> b!687958 m!651961))

(assert (=> b!687958 m!651961))

(declare-fun m!651963 () Bool)

(assert (=> b!687958 m!651963))

(assert (=> b!687960 m!651961))

(assert (=> b!687960 m!651961))

(declare-fun m!651965 () Bool)

(assert (=> b!687960 m!651965))

(assert (=> bm!34178 m!651961))

(declare-fun m!651967 () Bool)

(assert (=> bm!34178 m!651967))

(assert (=> b!687961 m!651961))

(assert (=> b!687961 m!651961))

(assert (=> b!687961 m!651963))

(assert (=> b!687566 d!95187))

(declare-fun d!95197 () Bool)

(declare-fun res!452741 () Bool)

(declare-fun e!391884 () Bool)

(assert (=> d!95197 (=> res!452741 e!391884)))

(assert (=> d!95197 (= res!452741 (= (select (arr!19014 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!95197 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!391884)))

(declare-fun b!687965 () Bool)

(declare-fun e!391885 () Bool)

(assert (=> b!687965 (= e!391884 e!391885)))

(declare-fun res!452742 () Bool)

(assert (=> b!687965 (=> (not res!452742) (not e!391885))))

(assert (=> b!687965 (= res!452742 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19393 a!3626)))))

(declare-fun b!687966 () Bool)

(assert (=> b!687966 (= e!391885 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!95197 (not res!452741)) b!687965))

(assert (= (and b!687965 res!452742) b!687966))

(assert (=> d!95197 m!651961))

(declare-fun m!651969 () Bool)

(assert (=> b!687966 m!651969))

(assert (=> b!687567 d!95197))

(declare-fun d!95199 () Bool)

(declare-fun lt!315572 () Bool)

(assert (=> d!95199 (= lt!315572 (set.member k!2843 (content!301 acc!681)))))

(declare-fun e!391887 () Bool)

(assert (=> d!95199 (= lt!315572 e!391887)))

(declare-fun res!452743 () Bool)

(assert (=> d!95199 (=> (not res!452743) (not e!391887))))

(assert (=> d!95199 (= res!452743 (is-Cons!13051 acc!681))))

(assert (=> d!95199 (= (contains!3632 acc!681 k!2843) lt!315572)))

(declare-fun b!687967 () Bool)

(declare-fun e!391886 () Bool)

(assert (=> b!687967 (= e!391887 e!391886)))

(declare-fun res!452744 () Bool)

(assert (=> b!687967 (=> res!452744 e!391886)))

(assert (=> b!687967 (= res!452744 (= (h!14096 acc!681) k!2843))))

(declare-fun b!687968 () Bool)

(assert (=> b!687968 (= e!391886 (contains!3632 (t!19316 acc!681) k!2843))))

(assert (= (and d!95199 res!452743) b!687967))

(assert (= (and b!687967 (not res!452744)) b!687968))

(declare-fun m!651971 () Bool)

(assert (=> d!95199 m!651971))

(declare-fun m!651973 () Bool)

(assert (=> d!95199 m!651973))

(declare-fun m!651975 () Bool)

(assert (=> b!687968 m!651975))

(assert (=> b!687556 d!95199))

(declare-fun d!95201 () Bool)

(declare-fun lt!315574 () Bool)

(assert (=> d!95201 (= lt!315574 (set.member k!2843 (content!301 lt!315453)))))

(declare-fun e!391889 () Bool)

(assert (=> d!95201 (= lt!315574 e!391889)))

(declare-fun res!452745 () Bool)

(assert (=> d!95201 (=> (not res!452745) (not e!391889))))

(assert (=> d!95201 (= res!452745 (is-Cons!13051 lt!315453))))

(assert (=> d!95201 (= (contains!3632 lt!315453 k!2843) lt!315574)))

(declare-fun b!687969 () Bool)

(declare-fun e!391888 () Bool)

(assert (=> b!687969 (= e!391889 e!391888)))

(declare-fun res!452746 () Bool)

(assert (=> b!687969 (=> res!452746 e!391888)))

(assert (=> b!687969 (= res!452746 (= (h!14096 lt!315453) k!2843))))

(declare-fun b!687970 () Bool)

(assert (=> b!687970 (= e!391888 (contains!3632 (t!19316 lt!315453) k!2843))))

(assert (= (and d!95201 res!452745) b!687969))

(assert (= (and b!687969 (not res!452746)) b!687970))

(assert (=> d!95201 m!651771))

(declare-fun m!651979 () Bool)

(assert (=> d!95201 m!651979))

(declare-fun m!651981 () Bool)

(assert (=> b!687970 m!651981))

(assert (=> b!687549 d!95201))

(declare-fun d!95205 () Bool)

(assert (=> d!95205 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!687560 d!95205))

(declare-fun d!95207 () Bool)

(assert (=> d!95207 (= (array_inv!14810 a!3626) (bvsge (size!19393 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61460 d!95207))

(declare-fun d!95209 () Bool)

(assert (=> d!95209 (= ($colon$colon!383 acc!681 (select (arr!19014 a!3626) from!3004)) (Cons!13051 (select (arr!19014 a!3626) from!3004) acc!681))))

(assert (=> b!687569 d!95209))

(assert (=> b!687569 d!95107))

(declare-fun d!95211 () Bool)

(assert (=> d!95211 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315583 () Unit!24237)

(declare-fun choose!80 (array!39682 List!13055 List!13055 (_ BitVec 32)) Unit!24237)

(assert (=> d!95211 (= lt!315583 (choose!80 a!3626 ($colon$colon!383 acc!681 (select (arr!19014 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!95211 (bvslt (size!19393 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!95211 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!383 acc!681 (select (arr!19014 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!315583)))

(declare-fun bs!20180 () Bool)

(assert (= bs!20180 d!95211))

(assert (=> bs!20180 m!651571))

(assert (=> bs!20180 m!651605))

(declare-fun m!652001 () Bool)

(assert (=> bs!20180 m!652001))

(assert (=> b!687569 d!95211))

(assert (=> b!687569 d!95151))

(assert (=> b!687569 d!95175))

(assert (=> b!687558 d!95199))

(assert (=> b!687559 d!95201))

(declare-fun d!95221 () Bool)

(declare-fun res!452759 () Bool)

(declare-fun e!391902 () Bool)

(assert (=> d!95221 (=> res!452759 e!391902)))

(assert (=> d!95221 (= res!452759 (is-Nil!13052 lt!315453))))

(assert (=> d!95221 (= (noDuplicate!879 lt!315453) e!391902)))

(declare-fun b!687983 () Bool)

(declare-fun e!391903 () Bool)

(assert (=> b!687983 (= e!391902 e!391903)))

(declare-fun res!452760 () Bool)

(assert (=> b!687983 (=> (not res!452760) (not e!391903))))

(assert (=> b!687983 (= res!452760 (not (contains!3632 (t!19316 lt!315453) (h!14096 lt!315453))))))

(declare-fun b!687984 () Bool)

(assert (=> b!687984 (= e!391903 (noDuplicate!879 (t!19316 lt!315453)))))

(assert (= (and d!95221 (not res!452759)) b!687983))

(assert (= (and b!687983 res!452760) b!687984))

(declare-fun m!652003 () Bool)

(assert (=> b!687983 m!652003))

(declare-fun m!652005 () Bool)

(assert (=> b!687984 m!652005))

(assert (=> b!687562 d!95221))

(declare-fun d!95223 () Bool)

(assert (=> d!95223 (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))

(declare-fun lt!315586 () Unit!24237)

(declare-fun choose!13 (array!39682 (_ BitVec 64) (_ BitVec 32)) Unit!24237)

(assert (=> d!95223 (= lt!315586 (choose!13 a!3626 k!2843 from!3004))))

(assert (=> d!95223 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!95223 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004) lt!315586)))

(declare-fun bs!20181 () Bool)

(assert (= bs!20181 d!95223))

(assert (=> bs!20181 m!651623))

(declare-fun m!652007 () Bool)

(assert (=> bs!20181 m!652007))

(assert (=> b!687563 d!95223))

(declare-fun d!95225 () Bool)

(declare-fun lt!315587 () Bool)

(assert (=> d!95225 (= lt!315587 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!301 acc!681)))))

(declare-fun e!391905 () Bool)

(assert (=> d!95225 (= lt!315587 e!391905)))

(declare-fun res!452761 () Bool)

(assert (=> d!95225 (=> (not res!452761) (not e!391905))))

(assert (=> d!95225 (= res!452761 (is-Cons!13051 acc!681))))

(assert (=> d!95225 (= (contains!3632 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!315587)))

(declare-fun b!687985 () Bool)

(declare-fun e!391904 () Bool)

(assert (=> b!687985 (= e!391905 e!391904)))

(declare-fun res!452762 () Bool)

(assert (=> b!687985 (=> res!452762 e!391904)))

(assert (=> b!687985 (= res!452762 (= (h!14096 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687986 () Bool)

(assert (=> b!687986 (= e!391904 (contains!3632 (t!19316 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95225 res!452761) b!687985))

(assert (= (and b!687985 (not res!452762)) b!687986))

(assert (=> d!95225 m!651971))

(declare-fun m!652009 () Bool)

(assert (=> d!95225 m!652009))

(declare-fun m!652011 () Bool)

(assert (=> b!687986 m!652011))

(assert (=> b!687552 d!95225))

(declare-fun d!95227 () Bool)

(declare-fun lt!315588 () Bool)

(assert (=> d!95227 (= lt!315588 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!301 acc!681)))))

(declare-fun e!391907 () Bool)

(assert (=> d!95227 (= lt!315588 e!391907)))

(declare-fun res!452763 () Bool)

(assert (=> d!95227 (=> (not res!452763) (not e!391907))))

(assert (=> d!95227 (= res!452763 (is-Cons!13051 acc!681))))

(assert (=> d!95227 (= (contains!3632 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!315588)))

(declare-fun b!687987 () Bool)

(declare-fun e!391906 () Bool)

(assert (=> b!687987 (= e!391907 e!391906)))

(declare-fun res!452764 () Bool)

(assert (=> b!687987 (=> res!452764 e!391906)))

(assert (=> b!687987 (= res!452764 (= (h!14096 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687988 () Bool)

(assert (=> b!687988 (= e!391906 (contains!3632 (t!19316 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95227 res!452763) b!687987))

(assert (= (and b!687987 (not res!452764)) b!687988))

(assert (=> d!95227 m!651971))

(declare-fun m!652013 () Bool)

(assert (=> d!95227 m!652013))

(declare-fun m!652015 () Bool)

(assert (=> b!687988 m!652015))

(assert (=> b!687561 d!95227))

(declare-fun d!95229 () Bool)

(declare-fun res!452765 () Bool)

(declare-fun e!391908 () Bool)

(assert (=> d!95229 (=> res!452765 e!391908)))

(assert (=> d!95229 (= res!452765 (is-Nil!13052 acc!681))))

(assert (=> d!95229 (= (noDuplicate!879 acc!681) e!391908)))

(declare-fun b!687989 () Bool)

(declare-fun e!391909 () Bool)

(assert (=> b!687989 (= e!391908 e!391909)))

(declare-fun res!452766 () Bool)

(assert (=> b!687989 (=> (not res!452766) (not e!391909))))

(assert (=> b!687989 (= res!452766 (not (contains!3632 (t!19316 acc!681) (h!14096 acc!681))))))

(declare-fun b!687990 () Bool)

(assert (=> b!687990 (= e!391909 (noDuplicate!879 (t!19316 acc!681)))))

(assert (= (and d!95229 (not res!452765)) b!687989))

(assert (= (and b!687989 res!452766) b!687990))

(declare-fun m!652017 () Bool)

(assert (=> b!687989 m!652017))

(declare-fun m!652019 () Bool)

(assert (=> b!687990 m!652019))

(assert (=> b!687550 d!95229))

(declare-fun d!95231 () Bool)

(declare-fun lt!315589 () Bool)

(assert (=> d!95231 (= lt!315589 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!301 lt!315453)))))

(declare-fun e!391911 () Bool)

(assert (=> d!95231 (= lt!315589 e!391911)))

(declare-fun res!452767 () Bool)

(assert (=> d!95231 (=> (not res!452767) (not e!391911))))

(assert (=> d!95231 (= res!452767 (is-Cons!13051 lt!315453))))

(assert (=> d!95231 (= (contains!3632 lt!315453 #b1000000000000000000000000000000000000000000000000000000000000000) lt!315589)))

(declare-fun b!687991 () Bool)

(declare-fun e!391910 () Bool)

(assert (=> b!687991 (= e!391911 e!391910)))

(declare-fun res!452768 () Bool)

(assert (=> b!687991 (=> res!452768 e!391910)))

(assert (=> b!687991 (= res!452768 (= (h!14096 lt!315453) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!687992 () Bool)

(assert (=> b!687992 (= e!391910 (contains!3632 (t!19316 lt!315453) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!95231 res!452767) b!687991))

(assert (= (and b!687991 (not res!452768)) b!687992))

(assert (=> d!95231 m!651771))

(declare-fun m!652021 () Bool)

(assert (=> d!95231 m!652021))

(declare-fun m!652023 () Bool)

(assert (=> b!687992 m!652023))

(assert (=> b!687565 d!95231))

(push 1)

