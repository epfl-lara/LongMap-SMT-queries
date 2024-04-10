; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62714 () Bool)

(assert start!62714)

(declare-fun b!707821 () Bool)

(declare-fun res!471593 () Bool)

(declare-fun e!398316 () Bool)

(assert (=> b!707821 (=> (not res!471593) (not e!398316))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!707821 (= res!471593 (validKeyInArray!0 k!2824))))

(declare-fun b!707822 () Bool)

(declare-fun res!471581 () Bool)

(assert (=> b!707822 (=> (not res!471581) (not e!398316))))

(declare-datatypes ((array!40342 0))(
  ( (array!40343 (arr!19326 (Array (_ BitVec 32) (_ BitVec 64))) (size!19713 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40342)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13367 0))(
  ( (Nil!13364) (Cons!13363 (h!14408 (_ BitVec 64)) (t!19652 List!13367)) )
))
(declare-fun acc!652 () List!13367)

(declare-fun noDuplicate!1191 (List!13367) Bool)

(declare-fun $colon$colon!500 (List!13367 (_ BitVec 64)) List!13367)

(assert (=> b!707822 (= res!471581 (noDuplicate!1191 ($colon$colon!500 acc!652 (select (arr!19326 a!3591) from!2969))))))

(declare-fun b!707823 () Bool)

(declare-fun res!471583 () Bool)

(assert (=> b!707823 (=> (not res!471583) (not e!398316))))

(declare-fun contains!3944 (List!13367 (_ BitVec 64)) Bool)

(assert (=> b!707823 (= res!471583 (not (contains!3944 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707824 () Bool)

(declare-fun res!471590 () Bool)

(assert (=> b!707824 (=> (not res!471590) (not e!398316))))

(declare-fun newAcc!49 () List!13367)

(declare-fun subseq!389 (List!13367 List!13367) Bool)

(assert (=> b!707824 (= res!471590 (subseq!389 acc!652 newAcc!49))))

(declare-fun b!707825 () Bool)

(declare-fun res!471586 () Bool)

(assert (=> b!707825 (=> (not res!471586) (not e!398316))))

(declare-fun arrayNoDuplicates!0 (array!40342 (_ BitVec 32) List!13367) Bool)

(assert (=> b!707825 (= res!471586 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!707826 () Bool)

(declare-fun res!471579 () Bool)

(assert (=> b!707826 (=> (not res!471579) (not e!398316))))

(assert (=> b!707826 (= res!471579 (not (contains!3944 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707827 () Bool)

(declare-fun res!471588 () Bool)

(assert (=> b!707827 (=> (not res!471588) (not e!398316))))

(assert (=> b!707827 (= res!471588 (noDuplicate!1191 acc!652))))

(declare-fun b!707828 () Bool)

(declare-fun res!471577 () Bool)

(assert (=> b!707828 (=> (not res!471577) (not e!398316))))

(assert (=> b!707828 (= res!471577 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19713 a!3591)))))

(declare-fun b!707829 () Bool)

(declare-fun res!471592 () Bool)

(assert (=> b!707829 (=> (not res!471592) (not e!398316))))

(assert (=> b!707829 (= res!471592 (not (contains!3944 acc!652 k!2824)))))

(declare-fun b!707830 () Bool)

(declare-fun res!471580 () Bool)

(assert (=> b!707830 (=> (not res!471580) (not e!398316))))

(assert (=> b!707830 (= res!471580 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun res!471578 () Bool)

(assert (=> start!62714 (=> (not res!471578) (not e!398316))))

(assert (=> start!62714 (= res!471578 (and (bvslt (size!19713 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19713 a!3591))))))

(assert (=> start!62714 e!398316))

(assert (=> start!62714 true))

(declare-fun array_inv!15122 (array!40342) Bool)

(assert (=> start!62714 (array_inv!15122 a!3591)))

(declare-fun b!707831 () Bool)

(declare-fun res!471591 () Bool)

(assert (=> b!707831 (=> (not res!471591) (not e!398316))))

(assert (=> b!707831 (= res!471591 (contains!3944 newAcc!49 k!2824))))

(declare-fun b!707832 () Bool)

(declare-fun res!471587 () Bool)

(assert (=> b!707832 (=> (not res!471587) (not e!398316))))

(assert (=> b!707832 (= res!471587 (validKeyInArray!0 (select (arr!19326 a!3591) from!2969)))))

(declare-fun b!707833 () Bool)

(declare-fun res!471582 () Bool)

(assert (=> b!707833 (=> (not res!471582) (not e!398316))))

(declare-fun -!354 (List!13367 (_ BitVec 64)) List!13367)

(assert (=> b!707833 (= res!471582 (= (-!354 newAcc!49 k!2824) acc!652))))

(declare-fun b!707834 () Bool)

(declare-fun res!471589 () Bool)

(assert (=> b!707834 (=> (not res!471589) (not e!398316))))

(declare-fun arrayContainsKey!0 (array!40342 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!707834 (= res!471589 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!707835 () Bool)

(assert (=> b!707835 (= e!398316 (not (noDuplicate!1191 ($colon$colon!500 newAcc!49 (select (arr!19326 a!3591) from!2969)))))))

(declare-fun b!707836 () Bool)

(declare-fun res!471585 () Bool)

(assert (=> b!707836 (=> (not res!471585) (not e!398316))))

(assert (=> b!707836 (= res!471585 (not (contains!3944 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707837 () Bool)

(declare-fun res!471594 () Bool)

(assert (=> b!707837 (=> (not res!471594) (not e!398316))))

(assert (=> b!707837 (= res!471594 (noDuplicate!1191 newAcc!49))))

(declare-fun b!707838 () Bool)

(declare-fun res!471584 () Bool)

(assert (=> b!707838 (=> (not res!471584) (not e!398316))))

(assert (=> b!707838 (= res!471584 (not (contains!3944 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62714 res!471578) b!707827))

(assert (= (and b!707827 res!471588) b!707837))

(assert (= (and b!707837 res!471594) b!707823))

(assert (= (and b!707823 res!471583) b!707836))

(assert (= (and b!707836 res!471585) b!707834))

(assert (= (and b!707834 res!471589) b!707829))

(assert (= (and b!707829 res!471592) b!707821))

(assert (= (and b!707821 res!471593) b!707825))

(assert (= (and b!707825 res!471586) b!707824))

(assert (= (and b!707824 res!471590) b!707831))

(assert (= (and b!707831 res!471591) b!707833))

(assert (= (and b!707833 res!471582) b!707838))

(assert (= (and b!707838 res!471584) b!707826))

(assert (= (and b!707826 res!471579) b!707828))

(assert (= (and b!707828 res!471577) b!707832))

(assert (= (and b!707832 res!471587) b!707830))

(assert (= (and b!707830 res!471580) b!707822))

(assert (= (and b!707822 res!471581) b!707835))

(declare-fun m!665299 () Bool)

(assert (=> b!707831 m!665299))

(declare-fun m!665301 () Bool)

(assert (=> start!62714 m!665301))

(declare-fun m!665303 () Bool)

(assert (=> b!707838 m!665303))

(declare-fun m!665305 () Bool)

(assert (=> b!707823 m!665305))

(declare-fun m!665307 () Bool)

(assert (=> b!707835 m!665307))

(assert (=> b!707835 m!665307))

(declare-fun m!665309 () Bool)

(assert (=> b!707835 m!665309))

(assert (=> b!707835 m!665309))

(declare-fun m!665311 () Bool)

(assert (=> b!707835 m!665311))

(declare-fun m!665313 () Bool)

(assert (=> b!707829 m!665313))

(declare-fun m!665315 () Bool)

(assert (=> b!707826 m!665315))

(declare-fun m!665317 () Bool)

(assert (=> b!707825 m!665317))

(declare-fun m!665319 () Bool)

(assert (=> b!707834 m!665319))

(declare-fun m!665321 () Bool)

(assert (=> b!707824 m!665321))

(declare-fun m!665323 () Bool)

(assert (=> b!707836 m!665323))

(declare-fun m!665325 () Bool)

(assert (=> b!707837 m!665325))

(declare-fun m!665327 () Bool)

(assert (=> b!707833 m!665327))

(declare-fun m!665329 () Bool)

(assert (=> b!707827 m!665329))

(assert (=> b!707832 m!665307))

(assert (=> b!707832 m!665307))

(declare-fun m!665331 () Bool)

(assert (=> b!707832 m!665331))

(assert (=> b!707822 m!665307))

(assert (=> b!707822 m!665307))

(declare-fun m!665333 () Bool)

(assert (=> b!707822 m!665333))

(assert (=> b!707822 m!665333))

(declare-fun m!665335 () Bool)

(assert (=> b!707822 m!665335))

(declare-fun m!665337 () Bool)

(assert (=> b!707821 m!665337))

(push 1)

(assert (not b!707837))

(assert (not b!707824))

(assert (not b!707823))

(assert (not b!707833))

(assert (not b!707821))

(assert (not start!62714))

(assert (not b!707832))

(assert (not b!707836))

(assert (not b!707822))

(assert (not b!707831))

(assert (not b!707825))

(assert (not b!707835))

(assert (not b!707834))

(assert (not b!707827))

(assert (not b!707838))

(assert (not b!707829))

(assert (not b!707826))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!707990 () Bool)

(declare-fun e!398374 () Bool)

(declare-fun e!398373 () Bool)

(assert (=> b!707990 (= e!398374 e!398373)))

(declare-fun res!471747 () Bool)

(assert (=> b!707990 (=> res!471747 e!398373)))

(declare-fun e!398375 () Bool)

(assert (=> b!707990 (= res!471747 e!398375)))

(declare-fun res!471746 () Bool)

(assert (=> b!707990 (=> (not res!471746) (not e!398375))))

(assert (=> b!707990 (= res!471746 (= (h!14408 acc!652) (h!14408 newAcc!49)))))

(declare-fun b!707992 () Bool)

(assert (=> b!707992 (= e!398373 (subseq!389 acc!652 (t!19652 newAcc!49)))))

(declare-fun d!96611 () Bool)

(declare-fun res!471745 () Bool)

(declare-fun e!398372 () Bool)

(assert (=> d!96611 (=> res!471745 e!398372)))

(assert (=> d!96611 (= res!471745 (is-Nil!13364 acc!652))))

(assert (=> d!96611 (= (subseq!389 acc!652 newAcc!49) e!398372)))

(declare-fun b!707989 () Bool)

(assert (=> b!707989 (= e!398372 e!398374)))

(declare-fun res!471748 () Bool)

(assert (=> b!707989 (=> (not res!471748) (not e!398374))))

(assert (=> b!707989 (= res!471748 (is-Cons!13363 newAcc!49))))

(declare-fun b!707991 () Bool)

(assert (=> b!707991 (= e!398375 (subseq!389 (t!19652 acc!652) (t!19652 newAcc!49)))))

(assert (= (and d!96611 (not res!471745)) b!707989))

(assert (= (and b!707989 res!471748) b!707990))

(assert (= (and b!707990 res!471746) b!707991))

(assert (= (and b!707990 (not res!471747)) b!707992))

(declare-fun m!665445 () Bool)

(assert (=> b!707992 m!665445))

(declare-fun m!665447 () Bool)

(assert (=> b!707991 m!665447))

(assert (=> b!707824 d!96611))

(declare-fun d!96621 () Bool)

(declare-fun res!471759 () Bool)

(declare-fun e!398391 () Bool)

(assert (=> d!96621 (=> res!471759 e!398391)))

(assert (=> d!96621 (= res!471759 (is-Nil!13364 ($colon$colon!500 newAcc!49 (select (arr!19326 a!3591) from!2969))))))

(assert (=> d!96621 (= (noDuplicate!1191 ($colon$colon!500 newAcc!49 (select (arr!19326 a!3591) from!2969))) e!398391)))

(declare-fun b!708011 () Bool)

(declare-fun e!398392 () Bool)

(assert (=> b!708011 (= e!398391 e!398392)))

(declare-fun res!471760 () Bool)

(assert (=> b!708011 (=> (not res!471760) (not e!398392))))

(assert (=> b!708011 (= res!471760 (not (contains!3944 (t!19652 ($colon$colon!500 newAcc!49 (select (arr!19326 a!3591) from!2969))) (h!14408 ($colon$colon!500 newAcc!49 (select (arr!19326 a!3591) from!2969))))))))

(declare-fun b!708012 () Bool)

(assert (=> b!708012 (= e!398392 (noDuplicate!1191 (t!19652 ($colon$colon!500 newAcc!49 (select (arr!19326 a!3591) from!2969)))))))

(assert (= (and d!96621 (not res!471759)) b!708011))

(assert (= (and b!708011 res!471760) b!708012))

(declare-fun m!665457 () Bool)

(assert (=> b!708011 m!665457))

(declare-fun m!665459 () Bool)

(assert (=> b!708012 m!665459))

(assert (=> b!707835 d!96621))

(declare-fun d!96631 () Bool)

(assert (=> d!96631 (= ($colon$colon!500 newAcc!49 (select (arr!19326 a!3591) from!2969)) (Cons!13363 (select (arr!19326 a!3591) from!2969) newAcc!49))))

(assert (=> b!707835 d!96631))

(declare-fun d!96635 () Bool)

(declare-fun e!398433 () Bool)

(assert (=> d!96635 e!398433))

(declare-fun res!471790 () Bool)

(assert (=> d!96635 (=> (not res!471790) (not e!398433))))

(declare-fun lt!318053 () List!13367)

(declare-fun size!19717 (List!13367) Int)

(assert (=> d!96635 (= res!471790 (<= (size!19717 lt!318053) (size!19717 newAcc!49)))))

(declare-fun e!398431 () List!13367)

(assert (=> d!96635 (= lt!318053 e!398431)))

(declare-fun c!78502 () Bool)

(assert (=> d!96635 (= c!78502 (is-Cons!13363 newAcc!49))))

(assert (=> d!96635 (= (-!354 newAcc!49 k!2824) lt!318053)))

(declare-fun b!708058 () Bool)

(declare-fun e!398432 () List!13367)

(declare-fun call!34384 () List!13367)

(assert (=> b!708058 (= e!398432 (Cons!13363 (h!14408 newAcc!49) call!34384))))

(declare-fun bm!34381 () Bool)

(assert (=> bm!34381 (= call!34384 (-!354 (t!19652 newAcc!49) k!2824))))

(declare-fun b!708059 () Bool)

(assert (=> b!708059 (= e!398431 e!398432)))

(declare-fun c!78501 () Bool)

(assert (=> b!708059 (= c!78501 (= k!2824 (h!14408 newAcc!49)))))

(declare-fun b!708060 () Bool)

(declare-fun content!337 (List!13367) (Set (_ BitVec 64)))

(assert (=> b!708060 (= e!398433 (= (content!337 lt!318053) (set.minus (content!337 newAcc!49) (set.insert k!2824 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun b!708061 () Bool)

(assert (=> b!708061 (= e!398431 Nil!13364)))

(declare-fun b!708062 () Bool)

(assert (=> b!708062 (= e!398432 call!34384)))

(assert (= (and d!96635 c!78502) b!708059))

(assert (= (and d!96635 (not c!78502)) b!708061))

(assert (= (and b!708059 c!78501) b!708062))

(assert (= (and b!708059 (not c!78501)) b!708058))

(assert (= (or b!708062 b!708058) bm!34381))

(assert (= (and d!96635 res!471790) b!708060))

(declare-fun m!665497 () Bool)

(assert (=> d!96635 m!665497))

(declare-fun m!665499 () Bool)

(assert (=> d!96635 m!665499))

(declare-fun m!665501 () Bool)

(assert (=> bm!34381 m!665501))

(declare-fun m!665503 () Bool)

(assert (=> b!708060 m!665503))

(declare-fun m!665505 () Bool)

(assert (=> b!708060 m!665505))

(declare-fun m!665507 () Bool)

(assert (=> b!708060 m!665507))

(assert (=> b!707833 d!96635))

(declare-fun d!96655 () Bool)

(declare-fun res!471804 () Bool)

(declare-fun e!398448 () Bool)

(assert (=> d!96655 (=> res!471804 e!398448)))

(assert (=> d!96655 (= res!471804 (= (select (arr!19326 a!3591) from!2969) k!2824))))

(assert (=> d!96655 (= (arrayContainsKey!0 a!3591 k!2824 from!2969) e!398448)))

(declare-fun b!708078 () Bool)

(declare-fun e!398449 () Bool)

(assert (=> b!708078 (= e!398448 e!398449)))

(declare-fun res!471805 () Bool)

(assert (=> b!708078 (=> (not res!471805) (not e!398449))))

(assert (=> b!708078 (= res!471805 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19713 a!3591)))))

(declare-fun b!708079 () Bool)

(assert (=> b!708079 (= e!398449 (arrayContainsKey!0 a!3591 k!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!96655 (not res!471804)) b!708078))

(assert (= (and b!708078 res!471805) b!708079))

(assert (=> d!96655 m!665307))

(declare-fun m!665517 () Bool)

(assert (=> b!708079 m!665517))

(assert (=> b!707834 d!96655))

(declare-fun d!96661 () Bool)

(declare-fun lt!318060 () Bool)

(assert (=> d!96661 (= lt!318060 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!337 acc!652)))))

(declare-fun e!398472 () Bool)

(assert (=> d!96661 (= lt!318060 e!398472)))

(declare-fun res!471823 () Bool)

(assert (=> d!96661 (=> (not res!471823) (not e!398472))))

(assert (=> d!96661 (= res!471823 (is-Cons!13363 acc!652))))

(assert (=> d!96661 (= (contains!3944 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318060)))

(declare-fun b!708104 () Bool)

(declare-fun e!398471 () Bool)

(assert (=> b!708104 (= e!398472 e!398471)))

(declare-fun res!471822 () Bool)

(assert (=> b!708104 (=> res!471822 e!398471)))

(assert (=> b!708104 (= res!471822 (= (h!14408 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708105 () Bool)

(assert (=> b!708105 (= e!398471 (contains!3944 (t!19652 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96661 res!471823) b!708104))

(assert (= (and b!708104 (not res!471822)) b!708105))

(declare-fun m!665537 () Bool)

(assert (=> d!96661 m!665537))

(declare-fun m!665539 () Bool)

(assert (=> d!96661 m!665539))

(declare-fun m!665541 () Bool)

(assert (=> b!708105 m!665541))

(assert (=> b!707823 d!96661))

(declare-fun d!96677 () Bool)

(declare-fun res!471824 () Bool)

(declare-fun e!398473 () Bool)

(assert (=> d!96677 (=> res!471824 e!398473)))

(assert (=> d!96677 (= res!471824 (is-Nil!13364 newAcc!49))))

(assert (=> d!96677 (= (noDuplicate!1191 newAcc!49) e!398473)))

(declare-fun b!708106 () Bool)

(declare-fun e!398474 () Bool)

(assert (=> b!708106 (= e!398473 e!398474)))

(declare-fun res!471825 () Bool)

(assert (=> b!708106 (=> (not res!471825) (not e!398474))))

(assert (=> b!708106 (= res!471825 (not (contains!3944 (t!19652 newAcc!49) (h!14408 newAcc!49))))))

(declare-fun b!708107 () Bool)

(assert (=> b!708107 (= e!398474 (noDuplicate!1191 (t!19652 newAcc!49)))))

(assert (= (and d!96677 (not res!471824)) b!708106))

(assert (= (and b!708106 res!471825) b!708107))

(declare-fun m!665543 () Bool)

(assert (=> b!708106 m!665543))

(declare-fun m!665545 () Bool)

(assert (=> b!708107 m!665545))

(assert (=> b!707837 d!96677))

(declare-fun d!96679 () Bool)

(declare-fun lt!318061 () Bool)

(assert (=> d!96679 (= lt!318061 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!337 newAcc!49)))))

(declare-fun e!398476 () Bool)

(assert (=> d!96679 (= lt!318061 e!398476)))

(declare-fun res!471827 () Bool)

(assert (=> d!96679 (=> (not res!471827) (not e!398476))))

(assert (=> d!96679 (= res!471827 (is-Cons!13363 newAcc!49))))

(assert (=> d!96679 (= (contains!3944 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318061)))

(declare-fun b!708108 () Bool)

(declare-fun e!398475 () Bool)

(assert (=> b!708108 (= e!398476 e!398475)))

(declare-fun res!471826 () Bool)

(assert (=> b!708108 (=> res!471826 e!398475)))

(assert (=> b!708108 (= res!471826 (= (h!14408 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708109 () Bool)

(assert (=> b!708109 (= e!398475 (contains!3944 (t!19652 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96679 res!471827) b!708108))

(assert (= (and b!708108 (not res!471826)) b!708109))

(assert (=> d!96679 m!665505))

(declare-fun m!665547 () Bool)

(assert (=> d!96679 m!665547))

(declare-fun m!665549 () Bool)

(assert (=> b!708109 m!665549))

(assert (=> b!707838 d!96679))

(declare-fun d!96681 () Bool)

(declare-fun res!471828 () Bool)

(declare-fun e!398477 () Bool)

(assert (=> d!96681 (=> res!471828 e!398477)))

(assert (=> d!96681 (= res!471828 (is-Nil!13364 acc!652))))

(assert (=> d!96681 (= (noDuplicate!1191 acc!652) e!398477)))

(declare-fun b!708110 () Bool)

(declare-fun e!398478 () Bool)

(assert (=> b!708110 (= e!398477 e!398478)))

(declare-fun res!471829 () Bool)

(assert (=> b!708110 (=> (not res!471829) (not e!398478))))

(assert (=> b!708110 (= res!471829 (not (contains!3944 (t!19652 acc!652) (h!14408 acc!652))))))

(declare-fun b!708111 () Bool)

(assert (=> b!708111 (= e!398478 (noDuplicate!1191 (t!19652 acc!652)))))

(assert (= (and d!96681 (not res!471828)) b!708110))

(assert (= (and b!708110 res!471829) b!708111))

(declare-fun m!665551 () Bool)

(assert (=> b!708110 m!665551))

(declare-fun m!665553 () Bool)

(assert (=> b!708111 m!665553))

(assert (=> b!707827 d!96681))

(declare-fun d!96683 () Bool)

(declare-fun lt!318062 () Bool)

(assert (=> d!96683 (= lt!318062 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!337 acc!652)))))

(declare-fun e!398480 () Bool)

(assert (=> d!96683 (= lt!318062 e!398480)))

(declare-fun res!471831 () Bool)

(assert (=> d!96683 (=> (not res!471831) (not e!398480))))

(assert (=> d!96683 (= res!471831 (is-Cons!13363 acc!652))))

(assert (=> d!96683 (= (contains!3944 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318062)))

(declare-fun b!708112 () Bool)

(declare-fun e!398479 () Bool)

(assert (=> b!708112 (= e!398480 e!398479)))

(declare-fun res!471830 () Bool)

(assert (=> b!708112 (=> res!471830 e!398479)))

(assert (=> b!708112 (= res!471830 (= (h!14408 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708113 () Bool)

(assert (=> b!708113 (= e!398479 (contains!3944 (t!19652 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96683 res!471831) b!708112))

(assert (= (and b!708112 (not res!471830)) b!708113))

(assert (=> d!96683 m!665537))

(declare-fun m!665555 () Bool)

(assert (=> d!96683 m!665555))

(declare-fun m!665557 () Bool)

(assert (=> b!708113 m!665557))

(assert (=> b!707836 d!96683))

(declare-fun b!708151 () Bool)

(declare-fun e!398515 () Bool)

(declare-fun call!34391 () Bool)

(assert (=> b!708151 (= e!398515 call!34391)))

(declare-fun bm!34388 () Bool)

(declare-fun c!78514 () Bool)

(assert (=> bm!34388 (= call!34391 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78514 (Cons!13363 (select (arr!19326 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun d!96685 () Bool)

(declare-fun res!471857 () Bool)

(declare-fun e!398514 () Bool)

(assert (=> d!96685 (=> res!471857 e!398514)))

(assert (=> d!96685 (= res!471857 (bvsge from!2969 (size!19713 a!3591)))))

(assert (=> d!96685 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!398514)))

(declare-fun b!708152 () Bool)

(declare-fun e!398513 () Bool)

(assert (=> b!708152 (= e!398514 e!398513)))

(declare-fun res!471858 () Bool)

(assert (=> b!708152 (=> (not res!471858) (not e!398513))))

(declare-fun e!398512 () Bool)

(assert (=> b!708152 (= res!471858 (not e!398512))))

(declare-fun res!471859 () Bool)

(assert (=> b!708152 (=> (not res!471859) (not e!398512))))

(assert (=> b!708152 (= res!471859 (validKeyInArray!0 (select (arr!19326 a!3591) from!2969)))))

(declare-fun b!708153 () Bool)

(assert (=> b!708153 (= e!398515 call!34391)))

(declare-fun b!708154 () Bool)

(assert (=> b!708154 (= e!398512 (contains!3944 acc!652 (select (arr!19326 a!3591) from!2969)))))

(declare-fun b!708155 () Bool)

(assert (=> b!708155 (= e!398513 e!398515)))

(assert (=> b!708155 (= c!78514 (validKeyInArray!0 (select (arr!19326 a!3591) from!2969)))))

(assert (= (and d!96685 (not res!471857)) b!708152))

(assert (= (and b!708152 res!471859) b!708154))

(assert (= (and b!708152 res!471858) b!708155))

(assert (= (and b!708155 c!78514) b!708153))

(assert (= (and b!708155 (not c!78514)) b!708151))

(assert (= (or b!708153 b!708151) bm!34388))

(assert (=> bm!34388 m!665307))

(declare-fun m!665573 () Bool)

(assert (=> bm!34388 m!665573))

(assert (=> b!708152 m!665307))

(assert (=> b!708152 m!665307))

(assert (=> b!708152 m!665331))

(assert (=> b!708154 m!665307))

(assert (=> b!708154 m!665307))

(declare-fun m!665575 () Bool)

(assert (=> b!708154 m!665575))

(assert (=> b!708155 m!665307))

(assert (=> b!708155 m!665307))

(assert (=> b!708155 m!665331))

(assert (=> b!707825 d!96685))

(declare-fun d!96691 () Bool)

(declare-fun lt!318064 () Bool)

(assert (=> d!96691 (= lt!318064 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!337 newAcc!49)))))

(declare-fun e!398517 () Bool)

(assert (=> d!96691 (= lt!318064 e!398517)))

(declare-fun res!471861 () Bool)

(assert (=> d!96691 (=> (not res!471861) (not e!398517))))

(assert (=> d!96691 (= res!471861 (is-Cons!13363 newAcc!49))))

(assert (=> d!96691 (= (contains!3944 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318064)))

(declare-fun b!708156 () Bool)

(declare-fun e!398516 () Bool)

(assert (=> b!708156 (= e!398517 e!398516)))

(declare-fun res!471860 () Bool)

(assert (=> b!708156 (=> res!471860 e!398516)))

(assert (=> b!708156 (= res!471860 (= (h!14408 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708157 () Bool)

(assert (=> b!708157 (= e!398516 (contains!3944 (t!19652 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96691 res!471861) b!708156))

(assert (= (and b!708156 (not res!471860)) b!708157))

(assert (=> d!96691 m!665505))

(declare-fun m!665577 () Bool)

(assert (=> d!96691 m!665577))

(declare-fun m!665579 () Bool)

(assert (=> b!708157 m!665579))

(assert (=> b!707826 d!96691))

(declare-fun d!96693 () Bool)

(declare-fun lt!318065 () Bool)

(assert (=> d!96693 (= lt!318065 (set.member k!2824 (content!337 acc!652)))))

(declare-fun e!398519 () Bool)

(assert (=> d!96693 (= lt!318065 e!398519)))

(declare-fun res!471863 () Bool)

(assert (=> d!96693 (=> (not res!471863) (not e!398519))))

(assert (=> d!96693 (= res!471863 (is-Cons!13363 acc!652))))

(assert (=> d!96693 (= (contains!3944 acc!652 k!2824) lt!318065)))

(declare-fun b!708158 () Bool)

(declare-fun e!398518 () Bool)

(assert (=> b!708158 (= e!398519 e!398518)))

(declare-fun res!471862 () Bool)

(assert (=> b!708158 (=> res!471862 e!398518)))

(assert (=> b!708158 (= res!471862 (= (h!14408 acc!652) k!2824))))

(declare-fun b!708159 () Bool)

(assert (=> b!708159 (= e!398518 (contains!3944 (t!19652 acc!652) k!2824))))

(assert (= (and d!96693 res!471863) b!708158))

(assert (= (and b!708158 (not res!471862)) b!708159))

(assert (=> d!96693 m!665537))

(declare-fun m!665581 () Bool)

(assert (=> d!96693 m!665581))

(declare-fun m!665583 () Bool)

(assert (=> b!708159 m!665583))

(assert (=> b!707829 d!96693))

(declare-fun d!96695 () Bool)

(assert (=> d!96695 (= (validKeyInArray!0 (select (arr!19326 a!3591) from!2969)) (and (not (= (select (arr!19326 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19326 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!707832 d!96695))

(declare-fun d!96697 () Bool)

(assert (=> d!96697 (= (validKeyInArray!0 k!2824) (and (not (= k!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!707821 d!96697))

(declare-fun d!96699 () Bool)

(declare-fun res!471867 () Bool)

(declare-fun e!398524 () Bool)

(assert (=> d!96699 (=> res!471867 e!398524)))

(assert (=> d!96699 (= res!471867 (is-Nil!13364 ($colon$colon!500 acc!652 (select (arr!19326 a!3591) from!2969))))))

(assert (=> d!96699 (= (noDuplicate!1191 ($colon$colon!500 acc!652 (select (arr!19326 a!3591) from!2969))) e!398524)))

(declare-fun b!708165 () Bool)

(declare-fun e!398525 () Bool)

(assert (=> b!708165 (= e!398524 e!398525)))

(declare-fun res!471868 () Bool)

(assert (=> b!708165 (=> (not res!471868) (not e!398525))))

(assert (=> b!708165 (= res!471868 (not (contains!3944 (t!19652 ($colon$colon!500 acc!652 (select (arr!19326 a!3591) from!2969))) (h!14408 ($colon$colon!500 acc!652 (select (arr!19326 a!3591) from!2969))))))))

(declare-fun b!708166 () Bool)

(assert (=> b!708166 (= e!398525 (noDuplicate!1191 (t!19652 ($colon$colon!500 acc!652 (select (arr!19326 a!3591) from!2969)))))))

(assert (= (and d!96699 (not res!471867)) b!708165))

(assert (= (and b!708165 res!471868) b!708166))

(declare-fun m!665585 () Bool)

(assert (=> b!708165 m!665585))

(declare-fun m!665587 () Bool)

(assert (=> b!708166 m!665587))

(assert (=> b!707822 d!96699))

(declare-fun d!96701 () Bool)

(assert (=> d!96701 (= ($colon$colon!500 acc!652 (select (arr!19326 a!3591) from!2969)) (Cons!13363 (select (arr!19326 a!3591) from!2969) acc!652))))

(assert (=> b!707822 d!96701))

(declare-fun d!96703 () Bool)

(assert (=> d!96703 (= (array_inv!15122 a!3591) (bvsge (size!19713 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62714 d!96703))

(declare-fun d!96707 () Bool)

(declare-fun lt!318067 () Bool)

(assert (=> d!96707 (= lt!318067 (set.member k!2824 (content!337 newAcc!49)))))

(declare-fun e!398529 () Bool)

(assert (=> d!96707 (= lt!318067 e!398529)))

(declare-fun res!471872 () Bool)

(assert (=> d!96707 (=> (not res!471872) (not e!398529))))

(assert (=> d!96707 (= res!471872 (is-Cons!13363 newAcc!49))))

(assert (=> d!96707 (= (contains!3944 newAcc!49 k!2824) lt!318067)))

(declare-fun b!708169 () Bool)

(declare-fun e!398528 () Bool)

(assert (=> b!708169 (= e!398529 e!398528)))

(declare-fun res!471871 () Bool)

(assert (=> b!708169 (=> res!471871 e!398528)))

(assert (=> b!708169 (= res!471871 (= (h!14408 newAcc!49) k!2824))))

(declare-fun b!708170 () Bool)

(assert (=> b!708170 (= e!398528 (contains!3944 (t!19652 newAcc!49) k!2824))))

(assert (= (and d!96707 res!471872) b!708169))

(assert (= (and b!708169 (not res!471871)) b!708170))

(assert (=> d!96707 m!665505))

(declare-fun m!665599 () Bool)

(assert (=> d!96707 m!665599))

(declare-fun m!665601 () Bool)

(assert (=> b!708170 m!665601))

(assert (=> b!707831 d!96707))

(push 1)

(assert (not b!708152))

(assert (not b!708110))

(assert (not b!708154))

(assert (not b!708166))

(assert (not b!708011))

(assert (not d!96707))

(assert (not bm!34388))

(assert (not b!708155))

(assert (not b!708113))

(assert (not b!708105))

(assert (not d!96691))

(assert (not b!708111))

(assert (not b!708170))

(assert (not d!96679))

(assert (not bm!34381))

(assert (not d!96693))

(assert (not b!708165))

(assert (not b!708109))

(assert (not b!707991))

(assert (not b!708106))

(assert (not b!708012))

(assert (not d!96683))

(assert (not b!708079))

(assert (not d!96661))

(assert (not b!708157))

(assert (not d!96635))

(assert (not b!707992))

(assert (not b!708060))

(assert (not b!708107))

(assert (not b!708159))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!708244 () Bool)

(declare-fun e!398592 () Bool)

(declare-fun e!398591 () Bool)

(assert (=> b!708244 (= e!398592 e!398591)))

(declare-fun res!471923 () Bool)

(assert (=> b!708244 (=> res!471923 e!398591)))

(declare-fun e!398593 () Bool)

(assert (=> b!708244 (= res!471923 e!398593)))

(declare-fun res!471922 () Bool)

(assert (=> b!708244 (=> (not res!471922) (not e!398593))))

(assert (=> b!708244 (= res!471922 (= (h!14408 acc!652) (h!14408 (t!19652 newAcc!49))))))

(declare-fun b!708246 () Bool)

(assert (=> b!708246 (= e!398591 (subseq!389 acc!652 (t!19652 (t!19652 newAcc!49))))))

(declare-fun d!96767 () Bool)

(declare-fun res!471921 () Bool)

(declare-fun e!398590 () Bool)

(assert (=> d!96767 (=> res!471921 e!398590)))

(assert (=> d!96767 (= res!471921 (is-Nil!13364 acc!652))))

(assert (=> d!96767 (= (subseq!389 acc!652 (t!19652 newAcc!49)) e!398590)))

(declare-fun b!708243 () Bool)

(assert (=> b!708243 (= e!398590 e!398592)))

(declare-fun res!471924 () Bool)

(assert (=> b!708243 (=> (not res!471924) (not e!398592))))

(assert (=> b!708243 (= res!471924 (is-Cons!13363 (t!19652 newAcc!49)))))

(declare-fun b!708245 () Bool)

(assert (=> b!708245 (= e!398593 (subseq!389 (t!19652 acc!652) (t!19652 (t!19652 newAcc!49))))))

(assert (= (and d!96767 (not res!471921)) b!708243))

(assert (= (and b!708243 res!471924) b!708244))

(assert (= (and b!708244 res!471922) b!708245))

(assert (= (and b!708244 (not res!471923)) b!708246))

(declare-fun m!665713 () Bool)

(assert (=> b!708246 m!665713))

(declare-fun m!665715 () Bool)

(assert (=> b!708245 m!665715))

(assert (=> b!707992 d!96767))

(declare-fun b!708248 () Bool)

(declare-fun e!398596 () Bool)

(declare-fun e!398595 () Bool)

(assert (=> b!708248 (= e!398596 e!398595)))

(declare-fun res!471927 () Bool)

(assert (=> b!708248 (=> res!471927 e!398595)))

(declare-fun e!398597 () Bool)

(assert (=> b!708248 (= res!471927 e!398597)))

(declare-fun res!471926 () Bool)

(assert (=> b!708248 (=> (not res!471926) (not e!398597))))

(assert (=> b!708248 (= res!471926 (= (h!14408 (t!19652 acc!652)) (h!14408 (t!19652 newAcc!49))))))

(declare-fun b!708250 () Bool)

(assert (=> b!708250 (= e!398595 (subseq!389 (t!19652 acc!652) (t!19652 (t!19652 newAcc!49))))))

(declare-fun d!96769 () Bool)

(declare-fun res!471925 () Bool)

(declare-fun e!398594 () Bool)

(assert (=> d!96769 (=> res!471925 e!398594)))

(assert (=> d!96769 (= res!471925 (is-Nil!13364 (t!19652 acc!652)))))

(assert (=> d!96769 (= (subseq!389 (t!19652 acc!652) (t!19652 newAcc!49)) e!398594)))

(declare-fun b!708247 () Bool)

(assert (=> b!708247 (= e!398594 e!398596)))

(declare-fun res!471928 () Bool)

(assert (=> b!708247 (=> (not res!471928) (not e!398596))))

(assert (=> b!708247 (= res!471928 (is-Cons!13363 (t!19652 newAcc!49)))))

(declare-fun b!708249 () Bool)

(assert (=> b!708249 (= e!398597 (subseq!389 (t!19652 (t!19652 acc!652)) (t!19652 (t!19652 newAcc!49))))))

(assert (= (and d!96769 (not res!471925)) b!708247))

(assert (= (and b!708247 res!471928) b!708248))

(assert (= (and b!708248 res!471926) b!708249))

(assert (= (and b!708248 (not res!471927)) b!708250))

(assert (=> b!708250 m!665715))

(declare-fun m!665717 () Bool)

(assert (=> b!708249 m!665717))

(assert (=> b!707991 d!96769))

(declare-fun d!96771 () Bool)

(declare-fun lt!318086 () Bool)

(assert (=> d!96771 (= lt!318086 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!337 (t!19652 newAcc!49))))))

(declare-fun e!398599 () Bool)

(assert (=> d!96771 (= lt!318086 e!398599)))

(declare-fun res!471930 () Bool)

(assert (=> d!96771 (=> (not res!471930) (not e!398599))))

(assert (=> d!96771 (= res!471930 (is-Cons!13363 (t!19652 newAcc!49)))))

(assert (=> d!96771 (= (contains!3944 (t!19652 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000) lt!318086)))

(declare-fun b!708251 () Bool)

(declare-fun e!398598 () Bool)

(assert (=> b!708251 (= e!398599 e!398598)))

(declare-fun res!471929 () Bool)

(assert (=> b!708251 (=> res!471929 e!398598)))

(assert (=> b!708251 (= res!471929 (= (h!14408 (t!19652 newAcc!49)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708252 () Bool)

(assert (=> b!708252 (= e!398598 (contains!3944 (t!19652 (t!19652 newAcc!49)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96771 res!471930) b!708251))

(assert (= (and b!708251 (not res!471929)) b!708252))

(declare-fun m!665719 () Bool)

(assert (=> d!96771 m!665719))

(declare-fun m!665721 () Bool)

(assert (=> d!96771 m!665721))

(declare-fun m!665723 () Bool)

(assert (=> b!708252 m!665723))

(assert (=> b!708109 d!96771))

(declare-fun d!96773 () Bool)

(declare-fun lt!318087 () Bool)

(assert (=> d!96773 (= lt!318087 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!337 (t!19652 acc!652))))))

(declare-fun e!398601 () Bool)

(assert (=> d!96773 (= lt!318087 e!398601)))

(declare-fun res!471932 () Bool)

(assert (=> d!96773 (=> (not res!471932) (not e!398601))))

(assert (=> d!96773 (= res!471932 (is-Cons!13363 (t!19652 acc!652)))))

(assert (=> d!96773 (= (contains!3944 (t!19652 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000) lt!318087)))

(declare-fun b!708253 () Bool)

(declare-fun e!398600 () Bool)

(assert (=> b!708253 (= e!398601 e!398600)))

(declare-fun res!471931 () Bool)

(assert (=> b!708253 (=> res!471931 e!398600)))

(assert (=> b!708253 (= res!471931 (= (h!14408 (t!19652 acc!652)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!708254 () Bool)

(assert (=> b!708254 (= e!398600 (contains!3944 (t!19652 (t!19652 acc!652)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96773 res!471932) b!708253))

(assert (= (and b!708253 (not res!471931)) b!708254))

(declare-fun m!665725 () Bool)

(assert (=> d!96773 m!665725))

(declare-fun m!665727 () Bool)

(assert (=> d!96773 m!665727))

(declare-fun m!665729 () Bool)

(assert (=> b!708254 m!665729))

(assert (=> b!708113 d!96773))

(declare-fun d!96775 () Bool)

(declare-fun c!78530 () Bool)

(assert (=> d!96775 (= c!78530 (is-Nil!13364 lt!318053))))

(declare-fun e!398604 () (Set (_ BitVec 64)))

(assert (=> d!96775 (= (content!337 lt!318053) e!398604)))

(declare-fun b!708259 () Bool)

(assert (=> b!708259 (= e!398604 (as set.empty (Set (_ BitVec 64))))))

(declare-fun b!708260 () Bool)

(assert (=> b!708260 (= e!398604 (set.union (set.insert (h!14408 lt!318053) (as set.empty (Set (_ BitVec 64)))) (content!337 (t!19652 lt!318053))))))

(assert (= (and d!96775 c!78530) b!708259))

(assert (= (and d!96775 (not c!78530)) b!708260))

(declare-fun m!665731 () Bool)

(assert (=> b!708260 m!665731))

(declare-fun m!665733 () Bool)

(assert (=> b!708260 m!665733))

(assert (=> b!708060 d!96775))

(declare-fun d!96777 () Bool)

(declare-fun c!78531 () Bool)

(assert (=> d!96777 (= c!78531 (is-Nil!13364 newAcc!49))))

(declare-fun e!398605 () (Set (_ BitVec 64)))

(assert (=> d!96777 (= (content!337 newAcc!49) e!398605)))

(declare-fun b!708261 () Bool)

(assert (=> b!708261 (= e!398605 (as set.empty (Set (_ BitVec 64))))))

(declare-fun b!708262 () Bool)

(assert (=> b!708262 (= e!398605 (set.union (set.insert (h!14408 newAcc!49) (as set.empty (Set (_ BitVec 64)))) (content!337 (t!19652 newAcc!49))))))

(assert (= (and d!96777 c!78531) b!708261))

(assert (= (and d!96777 (not c!78531)) b!708262))

(declare-fun m!665735 () Bool)

(assert (=> b!708262 m!665735))

(assert (=> b!708262 m!665719))

(assert (=> b!708060 d!96777))

(declare-fun d!96779 () Bool)

(declare-fun e!398608 () Bool)

(assert (=> d!96779 e!398608))

(declare-fun res!471933 () Bool)

(assert (=> d!96779 (=> (not res!471933) (not e!398608))))

(declare-fun lt!318088 () List!13367)

(assert (=> d!96779 (= res!471933 (<= (size!19717 lt!318088) (size!19717 (t!19652 newAcc!49))))))

(declare-fun e!398606 () List!13367)

(assert (=> d!96779 (= lt!318088 e!398606)))

(declare-fun c!78533 () Bool)

(assert (=> d!96779 (= c!78533 (is-Cons!13363 (t!19652 newAcc!49)))))

(assert (=> d!96779 (= (-!354 (t!19652 newAcc!49) k!2824) lt!318088)))

(declare-fun b!708263 () Bool)

(declare-fun e!398607 () List!13367)

(declare-fun call!34397 () List!13367)

(assert (=> b!708263 (= e!398607 (Cons!13363 (h!14408 (t!19652 newAcc!49)) call!34397))))

(declare-fun bm!34394 () Bool)

(assert (=> bm!34394 (= call!34397 (-!354 (t!19652 (t!19652 newAcc!49)) k!2824))))

(declare-fun b!708264 () Bool)

(assert (=> b!708264 (= e!398606 e!398607)))

(declare-fun c!78532 () Bool)

(assert (=> b!708264 (= c!78532 (= k!2824 (h!14408 (t!19652 newAcc!49))))))

(declare-fun b!708265 () Bool)

(assert (=> b!708265 (= e!398608 (= (content!337 lt!318088) (set.minus (content!337 (t!19652 newAcc!49)) (set.insert k!2824 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun b!708266 () Bool)

(assert (=> b!708266 (= e!398606 Nil!13364)))

(declare-fun b!708267 () Bool)

(assert (=> b!708267 (= e!398607 call!34397)))

(assert (= (and d!96779 c!78533) b!708264))

(assert (= (and d!96779 (not c!78533)) b!708266))

(assert (= (and b!708264 c!78532) b!708267))

(assert (= (and b!708264 (not c!78532)) b!708263))

(assert (= (or b!708267 b!708263) bm!34394))

(assert (= (and d!96779 res!471933) b!708265))

(declare-fun m!665737 () Bool)

(assert (=> d!96779 m!665737))

(declare-fun m!665739 () Bool)

(assert (=> d!96779 m!665739))

(declare-fun m!665741 () Bool)

(assert (=> bm!34394 m!665741))

(declare-fun m!665743 () Bool)

(assert (=> b!708265 m!665743))

(assert (=> b!708265 m!665719))

(assert (=> b!708265 m!665507))

(assert (=> bm!34381 d!96779))

(declare-fun d!96781 () Bool)

(declare-fun lt!318089 () Bool)

(assert (=> d!96781 (= lt!318089 (set.member (h!14408 ($colon$colon!500 acc!652 (select (arr!19326 a!3591) from!2969))) (content!337 (t!19652 ($colon$colon!500 acc!652 (select (arr!19326 a!3591) from!2969))))))))

(declare-fun e!398610 () Bool)

(assert (=> d!96781 (= lt!318089 e!398610)))

(declare-fun res!471935 () Bool)

(assert (=> d!96781 (=> (not res!471935) (not e!398610))))

(assert (=> d!96781 (= res!471935 (is-Cons!13363 (t!19652 ($colon$colon!500 acc!652 (select (arr!19326 a!3591) from!2969)))))))

(assert (=> d!96781 (= (contains!3944 (t!19652 ($colon$colon!500 acc!652 (select (arr!19326 a!3591) from!2969))) (h!14408 ($colon$colon!500 acc!652 (select (arr!19326 a!3591) from!2969)))) lt!318089)))

(declare-fun b!708268 () Bool)

(declare-fun e!398609 () Bool)

(assert (=> b!708268 (= e!398610 e!398609)))

(declare-fun res!471934 () Bool)

(assert (=> b!708268 (=> res!471934 e!398609)))

(assert (=> b!708268 (= res!471934 (= (h!14408 (t!19652 ($colon$colon!500 acc!652 (select (arr!19326 a!3591) from!2969)))) (h!14408 ($colon$colon!500 acc!652 (select (arr!19326 a!3591) from!2969)))))))

(declare-fun b!708269 () Bool)

(assert (=> b!708269 (= e!398609 (contains!3944 (t!19652 (t!19652 ($colon$colon!500 acc!652 (select (arr!19326 a!3591) from!2969)))) (h!14408 ($colon$colon!500 acc!652 (select (arr!19326 a!3591) from!2969)))))))

(assert (= (and d!96781 res!471935) b!708268))

(assert (= (and b!708268 (not res!471934)) b!708269))

(declare-fun m!665745 () Bool)

(assert (=> d!96781 m!665745))

(declare-fun m!665747 () Bool)

(assert (=> d!96781 m!665747))

(declare-fun m!665749 () Bool)

(assert (=> b!708269 m!665749))

(assert (=> b!708165 d!96781))

(declare-fun d!96783 () Bool)

(declare-fun lt!318090 () Bool)

(assert (=> d!96783 (= lt!318090 (set.member (select (arr!19326 a!3591) from!2969) (content!337 acc!652)))))

(declare-fun e!398612 () Bool)

(assert (=> d!96783 (= lt!318090 e!398612)))

(declare-fun res!471937 () Bool)

(assert (=> d!96783 (=> (not res!471937) (not e!398612))))

(assert (=> d!96783 (= res!471937 (is-Cons!13363 acc!652))))

(assert (=> d!96783 (= (contains!3944 acc!652 (select (arr!19326 a!3591) from!2969)) lt!318090)))

(declare-fun b!708270 () Bool)

(declare-fun e!398611 () Bool)

(assert (=> b!708270 (= e!398612 e!398611)))

(declare-fun res!471936 () Bool)

(assert (=> b!708270 (=> res!471936 e!398611)))

(assert (=> b!708270 (= res!471936 (= (h!14408 acc!652) (select (arr!19326 a!3591) from!2969)))))

(declare-fun b!708271 () Bool)

(assert (=> b!708271 (= e!398611 (contains!3944 (t!19652 acc!652) (select (arr!19326 a!3591) from!2969)))))

(assert (= (and d!96783 res!471937) b!708270))

(assert (= (and b!708270 (not res!471936)) b!708271))

(assert (=> d!96783 m!665537))

(assert (=> d!96783 m!665307))

(declare-fun m!665751 () Bool)

(assert (=> d!96783 m!665751))

(assert (=> b!708271 m!665307))

(declare-fun m!665753 () Bool)

(assert (=> b!708271 m!665753))

(assert (=> b!708154 d!96783))

(declare-fun d!96785 () Bool)

(declare-fun res!471938 () Bool)

(declare-fun e!398613 () Bool)

(assert (=> d!96785 (=> res!471938 e!398613)))

(assert (=> d!96785 (= res!471938 (is-Nil!13364 (t!19652 ($colon$colon!500 acc!652 (select (arr!19326 a!3591) from!2969)))))))

(assert (=> d!96785 (= (noDuplicate!1191 (t!19652 ($colon$colon!500 acc!652 (select (arr!19326 a!3591) from!2969)))) e!398613)))

(declare-fun b!708272 () Bool)

(declare-fun e!398614 () Bool)

(assert (=> b!708272 (= e!398613 e!398614)))

(declare-fun res!471939 () Bool)

(assert (=> b!708272 (=> (not res!471939) (not e!398614))))

(assert (=> b!708272 (= res!471939 (not (contains!3944 (t!19652 (t!19652 ($colon$colon!500 acc!652 (select (arr!19326 a!3591) from!2969)))) (h!14408 (t!19652 ($colon$colon!500 acc!652 (select (arr!19326 a!3591) from!2969)))))))))

(declare-fun b!708273 () Bool)

(assert (=> b!708273 (= e!398614 (noDuplicate!1191 (t!19652 (t!19652 ($colon$colon!500 acc!652 (select (arr!19326 a!3591) from!2969))))))))

(assert (= (and d!96785 (not res!471938)) b!708272))

(assert (= (and b!708272 res!471939) b!708273))

(declare-fun m!665755 () Bool)

(assert (=> b!708272 m!665755))

(declare-fun m!665757 () Bool)

(assert (=> b!708273 m!665757))

(assert (=> b!708166 d!96785))

(assert (=> b!708155 d!96695))

(declare-fun d!96787 () Bool)

(declare-fun res!471940 () Bool)

(declare-fun e!398615 () Bool)

(assert (=> d!96787 (=> res!471940 e!398615)))

(assert (=> d!96787 (= res!471940 (= (select (arr!19326 a!3591) (bvadd from!2969 #b00000000000000000000000000000001)) k!2824))))

(assert (=> d!96787 (= (arrayContainsKey!0 a!3591 k!2824 (bvadd from!2969 #b00000000000000000000000000000001)) e!398615)))

(declare-fun b!708274 () Bool)

(declare-fun e!398616 () Bool)

(assert (=> b!708274 (= e!398615 e!398616)))

(declare-fun res!471941 () Bool)

(assert (=> b!708274 (=> (not res!471941) (not e!398616))))

(assert (=> b!708274 (= res!471941 (bvslt (bvadd from!2969 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!19713 a!3591)))))

(declare-fun b!708275 () Bool)

(assert (=> b!708275 (= e!398616 (arrayContainsKey!0 a!3591 k!2824 (bvadd from!2969 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!96787 (not res!471940)) b!708274))

(assert (= (and b!708274 res!471941) b!708275))

(declare-fun m!665759 () Bool)

(assert (=> d!96787 m!665759))

(declare-fun m!665761 () Bool)

(assert (=> b!708275 m!665761))

(assert (=> b!708079 d!96787))

(declare-fun d!96789 () Bool)

(declare-fun lt!318093 () Int)

(assert (=> d!96789 (>= lt!318093 0)))

(declare-fun e!398619 () Int)

(assert (=> d!96789 (= lt!318093 e!398619)))

(declare-fun c!78536 () Bool)

(assert (=> d!96789 (= c!78536 (is-Nil!13364 lt!318053))))

(assert (=> d!96789 (= (size!19717 lt!318053) lt!318093)))

(declare-fun b!708280 () Bool)

(assert (=> b!708280 (= e!398619 0)))

(declare-fun b!708281 () Bool)

(assert (=> b!708281 (= e!398619 (+ 1 (size!19717 (t!19652 lt!318053))))))

(assert (= (and d!96789 c!78536) b!708280))

(assert (= (and d!96789 (not c!78536)) b!708281))

(declare-fun m!665763 () Bool)

(assert (=> b!708281 m!665763))

(assert (=> d!96635 d!96789))

(declare-fun d!96791 () Bool)

(declare-fun lt!318094 () Int)

(assert (=> d!96791 (>= lt!318094 0)))

(declare-fun e!398620 () Int)

(assert (=> d!96791 (= lt!318094 e!398620)))

(declare-fun c!78537 () Bool)

(assert (=> d!96791 (= c!78537 (is-Nil!13364 newAcc!49))))

(assert (=> d!96791 (= (size!19717 newAcc!49) lt!318094)))

(declare-fun b!708282 () Bool)

(assert (=> b!708282 (= e!398620 0)))

(declare-fun b!708283 () Bool)

(assert (=> b!708283 (= e!398620 (+ 1 (size!19717 (t!19652 newAcc!49))))))

(assert (= (and d!96791 c!78537) b!708282))

(assert (= (and d!96791 (not c!78537)) b!708283))

(assert (=> b!708283 m!665739))

(assert (=> d!96635 d!96791))

(declare-fun d!96793 () Bool)

(declare-fun c!78538 () Bool)

(assert (=> d!96793 (= c!78538 (is-Nil!13364 acc!652))))

(declare-fun e!398621 () (Set (_ BitVec 64)))

(assert (=> d!96793 (= (content!337 acc!652) e!398621)))

(declare-fun b!708284 () Bool)

(assert (=> b!708284 (= e!398621 (as set.empty (Set (_ BitVec 64))))))

(declare-fun b!708285 () Bool)

(assert (=> b!708285 (= e!398621 (set.union (set.insert (h!14408 acc!652) (as set.empty (Set (_ BitVec 64)))) (content!337 (t!19652 acc!652))))))

(assert (= (and d!96793 c!78538) b!708284))

(assert (= (and d!96793 (not c!78538)) b!708285))

(declare-fun m!665765 () Bool)

(assert (=> b!708285 m!665765))

(assert (=> b!708285 m!665725))

(assert (=> d!96693 d!96793))

(assert (=> d!96683 d!96793))

(declare-fun d!96795 () Bool)

(declare-fun lt!318095 () Bool)

(assert (=> d!96795 (= lt!318095 (set.member (h!14408 acc!652) (content!337 (t!19652 acc!652))))))

(declare-fun e!398623 () Bool)

(assert (=> d!96795 (= lt!318095 e!398623)))

(declare-fun res!471943 () Bool)

(assert (=> d!96795 (=> (not res!471943) (not e!398623))))

(assert (=> d!96795 (= res!471943 (is-Cons!13363 (t!19652 acc!652)))))

(assert (=> d!96795 (= (contains!3944 (t!19652 acc!652) (h!14408 acc!652)) lt!318095)))

(declare-fun b!708286 () Bool)

(declare-fun e!398622 () Bool)

(assert (=> b!708286 (= e!398623 e!398622)))

(declare-fun res!471942 () Bool)

(assert (=> b!708286 (=> res!471942 e!398622)))

(assert (=> b!708286 (= res!471942 (= (h!14408 (t!19652 acc!652)) (h!14408 acc!652)))))

(declare-fun b!708287 () Bool)

(assert (=> b!708287 (= e!398622 (contains!3944 (t!19652 (t!19652 acc!652)) (h!14408 acc!652)))))

(assert (= (and d!96795 res!471943) b!708286))

(assert (= (and b!708286 (not res!471942)) b!708287))

(assert (=> d!96795 m!665725))

(declare-fun m!665767 () Bool)

(assert (=> d!96795 m!665767))

(declare-fun m!665769 () Bool)

(assert (=> b!708287 m!665769))

(assert (=> b!708110 d!96795))

(declare-fun d!96797 () Bool)

(declare-fun res!471944 () Bool)

(declare-fun e!398624 () Bool)

(assert (=> d!96797 (=> res!471944 e!398624)))

(assert (=> d!96797 (= res!471944 (is-Nil!13364 (t!19652 acc!652)))))

(assert (=> d!96797 (= (noDuplicate!1191 (t!19652 acc!652)) e!398624)))

(declare-fun b!708288 () Bool)

(declare-fun e!398625 () Bool)

(assert (=> b!708288 (= e!398624 e!398625)))

