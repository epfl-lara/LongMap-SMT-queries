; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63442 () Bool)

(assert start!63442)

(declare-fun b!714629 () Bool)

(declare-fun res!477662 () Bool)

(declare-fun e!401590 () Bool)

(assert (=> b!714629 (=> (not res!477662) (not e!401590))))

(declare-datatypes ((List!13430 0))(
  ( (Nil!13427) (Cons!13426 (h!14471 (_ BitVec 64)) (t!19745 List!13430)) )
))
(declare-fun newAcc!49 () List!13430)

(declare-fun noDuplicate!1254 (List!13430) Bool)

(assert (=> b!714629 (= res!477662 (noDuplicate!1254 newAcc!49))))

(declare-fun b!714630 () Bool)

(declare-fun res!477667 () Bool)

(assert (=> b!714630 (=> (not res!477667) (not e!401590))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40501 0))(
  ( (array!40502 (arr!19389 (Array (_ BitVec 32) (_ BitVec 64))) (size!19802 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40501)

(assert (=> b!714630 (= res!477667 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19802 a!3591)))))

(declare-fun b!714631 () Bool)

(declare-fun res!477673 () Bool)

(assert (=> b!714631 (=> (not res!477673) (not e!401590))))

(declare-fun acc!652 () List!13430)

(declare-fun contains!4007 (List!13430 (_ BitVec 64)) Bool)

(assert (=> b!714631 (= res!477673 (not (contains!4007 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714632 () Bool)

(declare-fun res!477675 () Bool)

(assert (=> b!714632 (=> (not res!477675) (not e!401590))))

(declare-fun k!2824 () (_ BitVec 64))

(assert (=> b!714632 (= res!477675 (contains!4007 newAcc!49 k!2824))))

(declare-fun b!714633 () Bool)

(declare-fun res!477676 () Bool)

(assert (=> b!714633 (=> (not res!477676) (not e!401590))))

(declare-fun -!417 (List!13430 (_ BitVec 64)) List!13430)

(assert (=> b!714633 (= res!477676 (= (-!417 newAcc!49 k!2824) acc!652))))

(declare-fun b!714634 () Bool)

(declare-fun res!477659 () Bool)

(assert (=> b!714634 (=> (not res!477659) (not e!401590))))

(declare-fun arrayContainsKey!0 (array!40501 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!714634 (= res!477659 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!714635 () Bool)

(declare-fun res!477674 () Bool)

(assert (=> b!714635 (=> (not res!477674) (not e!401590))))

(assert (=> b!714635 (= res!477674 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!714636 () Bool)

(declare-fun res!477664 () Bool)

(assert (=> b!714636 (=> (not res!477664) (not e!401590))))

(assert (=> b!714636 (= res!477664 (not (contains!4007 acc!652 k!2824)))))

(declare-fun b!714637 () Bool)

(declare-fun res!477661 () Bool)

(assert (=> b!714637 (=> (not res!477661) (not e!401590))))

(assert (=> b!714637 (= res!477661 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!714638 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40501 (_ BitVec 32) List!13430) Bool)

(assert (=> b!714638 (= e!401590 (not (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652)))))

(declare-fun b!714639 () Bool)

(declare-fun res!477670 () Bool)

(assert (=> b!714639 (=> (not res!477670) (not e!401590))))

(assert (=> b!714639 (= res!477670 (not (contains!4007 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714640 () Bool)

(declare-fun res!477671 () Bool)

(assert (=> b!714640 (=> (not res!477671) (not e!401590))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!714640 (= res!477671 (validKeyInArray!0 k!2824))))

(declare-fun b!714641 () Bool)

(declare-fun res!477660 () Bool)

(assert (=> b!714641 (=> (not res!477660) (not e!401590))))

(assert (=> b!714641 (= res!477660 (not (contains!4007 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714642 () Bool)

(declare-fun res!477672 () Bool)

(assert (=> b!714642 (=> (not res!477672) (not e!401590))))

(declare-fun subseq!452 (List!13430 List!13430) Bool)

(assert (=> b!714642 (= res!477672 (subseq!452 acc!652 newAcc!49))))

(declare-fun b!714643 () Bool)

(declare-fun res!477666 () Bool)

(assert (=> b!714643 (=> (not res!477666) (not e!401590))))

(assert (=> b!714643 (= res!477666 (not (contains!4007 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!714644 () Bool)

(declare-fun res!477665 () Bool)

(assert (=> b!714644 (=> (not res!477665) (not e!401590))))

(assert (=> b!714644 (= res!477665 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun res!477668 () Bool)

(assert (=> start!63442 (=> (not res!477668) (not e!401590))))

(assert (=> start!63442 (= res!477668 (and (bvslt (size!19802 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19802 a!3591))))))

(assert (=> start!63442 e!401590))

(assert (=> start!63442 true))

(declare-fun array_inv!15185 (array!40501) Bool)

(assert (=> start!63442 (array_inv!15185 a!3591)))

(declare-fun b!714645 () Bool)

(declare-fun res!477669 () Bool)

(assert (=> b!714645 (=> (not res!477669) (not e!401590))))

(assert (=> b!714645 (= res!477669 (not (validKeyInArray!0 (select (arr!19389 a!3591) from!2969))))))

(declare-fun b!714646 () Bool)

(declare-fun res!477663 () Bool)

(assert (=> b!714646 (=> (not res!477663) (not e!401590))))

(assert (=> b!714646 (= res!477663 (noDuplicate!1254 acc!652))))

(assert (= (and start!63442 res!477668) b!714646))

(assert (= (and b!714646 res!477663) b!714629))

(assert (= (and b!714629 res!477662) b!714639))

(assert (= (and b!714639 res!477670) b!714631))

(assert (= (and b!714631 res!477673) b!714634))

(assert (= (and b!714634 res!477659) b!714636))

(assert (= (and b!714636 res!477664) b!714640))

(assert (= (and b!714640 res!477671) b!714644))

(assert (= (and b!714644 res!477665) b!714642))

(assert (= (and b!714642 res!477672) b!714632))

(assert (= (and b!714632 res!477675) b!714633))

(assert (= (and b!714633 res!477676) b!714641))

(assert (= (and b!714641 res!477660) b!714643))

(assert (= (and b!714643 res!477666) b!714630))

(assert (= (and b!714630 res!477667) b!714645))

(assert (= (and b!714645 res!477669) b!714637))

(assert (= (and b!714637 res!477661) b!714635))

(assert (= (and b!714635 res!477674) b!714638))

(declare-fun m!671101 () Bool)

(assert (=> b!714645 m!671101))

(assert (=> b!714645 m!671101))

(declare-fun m!671103 () Bool)

(assert (=> b!714645 m!671103))

(declare-fun m!671105 () Bool)

(assert (=> b!714640 m!671105))

(declare-fun m!671107 () Bool)

(assert (=> b!714644 m!671107))

(declare-fun m!671109 () Bool)

(assert (=> b!714631 m!671109))

(declare-fun m!671111 () Bool)

(assert (=> b!714629 m!671111))

(declare-fun m!671113 () Bool)

(assert (=> b!714641 m!671113))

(declare-fun m!671115 () Bool)

(assert (=> b!714639 m!671115))

(declare-fun m!671117 () Bool)

(assert (=> b!714636 m!671117))

(declare-fun m!671119 () Bool)

(assert (=> b!714632 m!671119))

(declare-fun m!671121 () Bool)

(assert (=> b!714634 m!671121))

(declare-fun m!671123 () Bool)

(assert (=> b!714646 m!671123))

(declare-fun m!671125 () Bool)

(assert (=> start!63442 m!671125))

(declare-fun m!671127 () Bool)

(assert (=> b!714638 m!671127))

(declare-fun m!671129 () Bool)

(assert (=> b!714643 m!671129))

(declare-fun m!671131 () Bool)

(assert (=> b!714633 m!671131))

(declare-fun m!671133 () Bool)

(assert (=> b!714642 m!671133))

(declare-fun m!671135 () Bool)

(assert (=> b!714635 m!671135))

(push 1)

(assert (not b!714638))

(assert (not b!714631))

(assert (not b!714641))

(assert (not b!714632))

(assert (not b!714639))

(assert (not start!63442))

(assert (not b!714642))

(assert (not b!714646))

(assert (not b!714634))

(assert (not b!714635))

(assert (not b!714645))

(assert (not b!714643))

(assert (not b!714636))

(assert (not b!714633))

(assert (not b!714640))

(assert (not b!714644))

(assert (not b!714629))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!714811 () Bool)

(declare-fun e!401658 () Bool)

(declare-fun e!401654 () Bool)

(assert (=> b!714811 (= e!401658 e!401654)))

(declare-fun res!477830 () Bool)

(assert (=> b!714811 (=> (not res!477830) (not e!401654))))

(declare-fun e!401657 () Bool)

(assert (=> b!714811 (= res!477830 (not e!401657))))

(declare-fun res!477831 () Bool)

(assert (=> b!714811 (=> (not res!477831) (not e!401657))))

(assert (=> b!714811 (= res!477831 (validKeyInArray!0 (select (arr!19389 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun d!98343 () Bool)

(declare-fun res!477829 () Bool)

(assert (=> d!98343 (=> res!477829 e!401658)))

(assert (=> d!98343 (= res!477829 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19802 a!3591)))))

(assert (=> d!98343 (= (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652) e!401658)))

(declare-fun call!34616 () Bool)

(declare-fun bm!34613 () Bool)

(declare-fun c!78856 () Bool)

(assert (=> bm!34613 (= call!34616 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (ite c!78856 (Cons!13426 (select (arr!19389 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) acc!652) acc!652)))))

(declare-fun b!714812 () Bool)

(declare-fun e!401655 () Bool)

(assert (=> b!714812 (= e!401654 e!401655)))

(assert (=> b!714812 (= c!78856 (validKeyInArray!0 (select (arr!19389 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!714813 () Bool)

(assert (=> b!714813 (= e!401657 (contains!4007 acc!652 (select (arr!19389 a!3591) (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!714814 () Bool)

(assert (=> b!714814 (= e!401655 call!34616)))

(declare-fun b!714815 () Bool)

(assert (=> b!714815 (= e!401655 call!34616)))

(assert (= (and d!98343 (not res!477829)) b!714811))

(assert (= (and b!714811 res!477831) b!714813))

(assert (= (and b!714811 res!477830) b!714812))

(assert (= (and b!714812 c!78856) b!714814))

(assert (= (and b!714812 (not c!78856)) b!714815))

(assert (= (or b!714814 b!714815) bm!34613))

(declare-fun m!671245 () Bool)

(assert (=> b!714811 m!671245))

(assert (=> b!714811 m!671245))

(declare-fun m!671247 () Bool)

(assert (=> b!714811 m!671247))

(assert (=> bm!34613 m!671245))

(declare-fun m!671249 () Bool)

(assert (=> bm!34613 m!671249))

(assert (=> b!714812 m!671245))

(assert (=> b!714812 m!671245))

(assert (=> b!714812 m!671247))

(assert (=> b!714813 m!671245))

(assert (=> b!714813 m!671245))

(declare-fun m!671251 () Bool)

(assert (=> b!714813 m!671251))

(assert (=> b!714638 d!98343))

(declare-fun d!98353 () Bool)

(declare-fun lt!318798 () Bool)

(declare-fun content!369 (List!13430) (Set (_ BitVec 64)))

(assert (=> d!98353 (= lt!318798 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!369 acc!652)))))

(declare-fun e!401679 () Bool)

(assert (=> d!98353 (= lt!318798 e!401679)))

(declare-fun res!477846 () Bool)

(assert (=> d!98353 (=> (not res!477846) (not e!401679))))

(assert (=> d!98353 (= res!477846 (is-Cons!13426 acc!652))))

(assert (=> d!98353 (= (contains!4007 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318798)))

(declare-fun b!714840 () Bool)

(declare-fun e!401678 () Bool)

(assert (=> b!714840 (= e!401679 e!401678)))

(declare-fun res!477847 () Bool)

(assert (=> b!714840 (=> res!477847 e!401678)))

(assert (=> b!714840 (= res!477847 (= (h!14471 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714841 () Bool)

(assert (=> b!714841 (= e!401678 (contains!4007 (t!19745 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98353 res!477846) b!714840))

(assert (= (and b!714840 (not res!477847)) b!714841))

(declare-fun m!671277 () Bool)

(assert (=> d!98353 m!671277))

(declare-fun m!671279 () Bool)

(assert (=> d!98353 m!671279))

(declare-fun m!671281 () Bool)

(assert (=> b!714841 m!671281))

(assert (=> b!714639 d!98353))

(declare-fun d!98365 () Bool)

(assert (=> d!98365 (= (array_inv!15185 a!3591) (bvsge (size!19802 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!63442 d!98365))

(declare-fun d!98367 () Bool)

(assert (=> d!98367 (= (validKeyInArray!0 (select (arr!19389 a!3591) from!2969)) (and (not (= (select (arr!19389 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19389 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!714645 d!98367))

(declare-fun d!98369 () Bool)

(declare-fun res!477862 () Bool)

(declare-fun e!401699 () Bool)

(assert (=> d!98369 (=> res!477862 e!401699)))

(assert (=> d!98369 (= res!477862 (= (select (arr!19389 a!3591) from!2969) k!2824))))

(assert (=> d!98369 (= (arrayContainsKey!0 a!3591 k!2824 from!2969) e!401699)))

(declare-fun b!714864 () Bool)

(declare-fun e!401700 () Bool)

(assert (=> b!714864 (= e!401699 e!401700)))

(declare-fun res!477863 () Bool)

(assert (=> b!714864 (=> (not res!477863) (not e!401700))))

(assert (=> b!714864 (= res!477863 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19802 a!3591)))))

(declare-fun b!714865 () Bool)

(assert (=> b!714865 (= e!401700 (arrayContainsKey!0 a!3591 k!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98369 (not res!477862)) b!714864))

(assert (= (and b!714864 res!477863) b!714865))

(assert (=> d!98369 m!671101))

(declare-fun m!671289 () Bool)

(assert (=> b!714865 m!671289))

(assert (=> b!714634 d!98369))

(declare-fun d!98377 () Bool)

(declare-fun res!477864 () Bool)

(declare-fun e!401701 () Bool)

(assert (=> d!98377 (=> res!477864 e!401701)))

(assert (=> d!98377 (= res!477864 (= (select (arr!19389 a!3591) (bvadd #b00000000000000000000000000000001 from!2969)) k!2824))))

(assert (=> d!98377 (= (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969)) e!401701)))

(declare-fun b!714866 () Bool)

(declare-fun e!401702 () Bool)

(assert (=> b!714866 (= e!401701 e!401702)))

(declare-fun res!477865 () Bool)

(assert (=> b!714866 (=> (not res!477865) (not e!401702))))

(assert (=> b!714866 (= res!477865 (bvslt (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001) (size!19802 a!3591)))))

(declare-fun b!714867 () Bool)

(assert (=> b!714867 (= e!401702 (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!98377 (not res!477864)) b!714866))

(assert (= (and b!714866 res!477865) b!714867))

(assert (=> d!98377 m!671245))

(declare-fun m!671291 () Bool)

(assert (=> b!714867 m!671291))

(assert (=> b!714635 d!98377))

(declare-fun d!98379 () Bool)

(declare-fun res!477879 () Bool)

(declare-fun e!401718 () Bool)

(assert (=> d!98379 (=> res!477879 e!401718)))

(assert (=> d!98379 (= res!477879 (is-Nil!13427 acc!652))))

(assert (=> d!98379 (= (noDuplicate!1254 acc!652) e!401718)))

(declare-fun b!714885 () Bool)

(declare-fun e!401719 () Bool)

(assert (=> b!714885 (= e!401718 e!401719)))

(declare-fun res!477880 () Bool)

(assert (=> b!714885 (=> (not res!477880) (not e!401719))))

(assert (=> b!714885 (= res!477880 (not (contains!4007 (t!19745 acc!652) (h!14471 acc!652))))))

(declare-fun b!714886 () Bool)

(assert (=> b!714886 (= e!401719 (noDuplicate!1254 (t!19745 acc!652)))))

(assert (= (and d!98379 (not res!477879)) b!714885))

(assert (= (and b!714885 res!477880) b!714886))

(declare-fun m!671303 () Bool)

(assert (=> b!714885 m!671303))

(declare-fun m!671305 () Bool)

(assert (=> b!714886 m!671305))

(assert (=> b!714646 d!98379))

(declare-fun d!98383 () Bool)

(declare-fun lt!318803 () Bool)

(assert (=> d!98383 (= lt!318803 (set.member k!2824 (content!369 acc!652)))))

(declare-fun e!401725 () Bool)

(assert (=> d!98383 (= lt!318803 e!401725)))

(declare-fun res!477885 () Bool)

(assert (=> d!98383 (=> (not res!477885) (not e!401725))))

(assert (=> d!98383 (= res!477885 (is-Cons!13426 acc!652))))

(assert (=> d!98383 (= (contains!4007 acc!652 k!2824) lt!318803)))

(declare-fun b!714891 () Bool)

(declare-fun e!401724 () Bool)

(assert (=> b!714891 (= e!401725 e!401724)))

(declare-fun res!477886 () Bool)

(assert (=> b!714891 (=> res!477886 e!401724)))

(assert (=> b!714891 (= res!477886 (= (h!14471 acc!652) k!2824))))

(declare-fun b!714892 () Bool)

(assert (=> b!714892 (= e!401724 (contains!4007 (t!19745 acc!652) k!2824))))

(assert (= (and d!98383 res!477885) b!714891))

(assert (= (and b!714891 (not res!477886)) b!714892))

(assert (=> d!98383 m!671277))

(declare-fun m!671309 () Bool)

(assert (=> d!98383 m!671309))

(declare-fun m!671313 () Bool)

(assert (=> b!714892 m!671313))

(assert (=> b!714636 d!98383))

(declare-fun b!714934 () Bool)

(declare-fun e!401762 () Bool)

(assert (=> b!714934 (= e!401762 (subseq!452 (t!19745 acc!652) (t!19745 newAcc!49)))))

(declare-fun b!714933 () Bool)

(declare-fun e!401764 () Bool)

(declare-fun e!401763 () Bool)

(assert (=> b!714933 (= e!401764 e!401763)))

(declare-fun res!477920 () Bool)

(assert (=> b!714933 (=> res!477920 e!401763)))

(assert (=> b!714933 (= res!477920 e!401762)))

(declare-fun res!477921 () Bool)

(assert (=> b!714933 (=> (not res!477921) (not e!401762))))

(assert (=> b!714933 (= res!477921 (= (h!14471 acc!652) (h!14471 newAcc!49)))))

(declare-fun b!714932 () Bool)

(declare-fun e!401765 () Bool)

(assert (=> b!714932 (= e!401765 e!401764)))

(declare-fun res!477923 () Bool)

(assert (=> b!714932 (=> (not res!477923) (not e!401764))))

(assert (=> b!714932 (= res!477923 (is-Cons!13426 newAcc!49))))

(declare-fun b!714935 () Bool)

(assert (=> b!714935 (= e!401763 (subseq!452 acc!652 (t!19745 newAcc!49)))))

(declare-fun d!98387 () Bool)

(declare-fun res!477922 () Bool)

(assert (=> d!98387 (=> res!477922 e!401765)))

(assert (=> d!98387 (= res!477922 (is-Nil!13427 acc!652))))

(assert (=> d!98387 (= (subseq!452 acc!652 newAcc!49) e!401765)))

(assert (= (and d!98387 (not res!477922)) b!714932))

(assert (= (and b!714932 res!477923) b!714933))

(assert (= (and b!714933 res!477921) b!714934))

(assert (= (and b!714933 (not res!477920)) b!714935))

(declare-fun m!671333 () Bool)

(assert (=> b!714934 m!671333))

(declare-fun m!671335 () Bool)

(assert (=> b!714935 m!671335))

(assert (=> b!714642 d!98387))

(declare-fun d!98397 () Bool)

(declare-fun lt!318806 () Bool)

(assert (=> d!98397 (= lt!318806 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!369 newAcc!49)))))

(declare-fun e!401767 () Bool)

(assert (=> d!98397 (= lt!318806 e!401767)))

(declare-fun res!477924 () Bool)

(assert (=> d!98397 (=> (not res!477924) (not e!401767))))

(assert (=> d!98397 (= res!477924 (is-Cons!13426 newAcc!49))))

(assert (=> d!98397 (= (contains!4007 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318806)))

(declare-fun b!714936 () Bool)

(declare-fun e!401766 () Bool)

(assert (=> b!714936 (= e!401767 e!401766)))

(declare-fun res!477925 () Bool)

(assert (=> b!714936 (=> res!477925 e!401766)))

(assert (=> b!714936 (= res!477925 (= (h!14471 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!714937 () Bool)

(assert (=> b!714937 (= e!401766 (contains!4007 (t!19745 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!98397 res!477924) b!714936))

(assert (= (and b!714936 (not res!477925)) b!714937))

(declare-fun m!671337 () Bool)

(assert (=> d!98397 m!671337))

(declare-fun m!671339 () Bool)

(assert (=> d!98397 m!671339))

(declare-fun m!671341 () Bool)

(assert (=> b!714937 m!671341))

(assert (=> b!714643 d!98397))

(declare-fun d!98399 () Bool)

(declare-fun lt!318807 () Bool)

(assert (=> d!98399 (= lt!318807 (set.member k!2824 (content!369 newAcc!49)))))

(declare-fun e!401769 () Bool)

(assert (=> d!98399 (= lt!318807 e!401769)))

(declare-fun res!477926 () Bool)

(assert (=> d!98399 (=> (not res!477926) (not e!401769))))

(assert (=> d!98399 (= res!477926 (is-Cons!13426 newAcc!49))))

(assert (=> d!98399 (= (contains!4007 newAcc!49 k!2824) lt!318807)))

(declare-fun b!714938 () Bool)

(declare-fun e!401768 () Bool)

(assert (=> b!714938 (= e!401769 e!401768)))

(declare-fun res!477927 () Bool)

(assert (=> b!714938 (=> res!477927 e!401768)))

(assert (=> b!714938 (= res!477927 (= (h!14471 newAcc!49) k!2824))))

(declare-fun b!714939 () Bool)

(assert (=> b!714939 (= e!401768 (contains!4007 (t!19745 newAcc!49) k!2824))))

(assert (= (and d!98399 res!477926) b!714938))

(assert (= (and b!714938 (not res!477927)) b!714939))

(assert (=> d!98399 m!671337))

(declare-fun m!671343 () Bool)

(assert (=> d!98399 m!671343))

(declare-fun m!671345 () Bool)

(assert (=> b!714939 m!671345))

(assert (=> b!714632 d!98399))

(declare-fun b!714970 () Bool)

(declare-fun e!401796 () List!13430)

(assert (=> b!714970 (= e!401796 Nil!13427)))

(declare-fun bm!34628 () Bool)

(declare-fun call!34631 () List!13430)

(assert (=> bm!34628 (= call!34631 (-!417 (t!19745 newAcc!49) k!2824))))

(declare-fun b!714971 () Bool)

(declare-fun e!401795 () List!13430)

(assert (=> b!714971 (= e!401796 e!401795)))

(declare-fun c!78880 () Bool)

(assert (=> b!714971 (= c!78880 (= k!2824 (h!14471 newAcc!49)))))

(declare-fun b!714972 () Bool)

(assert (=> b!714972 (= e!401795 call!34631)))

(declare-fun d!98401 () Bool)

(declare-fun e!401797 () Bool)

(assert (=> d!98401 e!401797))

(declare-fun res!477946 () Bool)

(assert (=> d!98401 (=> (not res!477946) (not e!401797))))

(declare-fun lt!318811 () List!13430)

(declare-fun size!19807 (List!13430) Int)

(assert (=> d!98401 (= res!477946 (<= (size!19807 lt!318811) (size!19807 newAcc!49)))))

(assert (=> d!98401 (= lt!318811 e!401796)))

(declare-fun c!78879 () Bool)

(assert (=> d!98401 (= c!78879 (is-Cons!13426 newAcc!49))))

(assert (=> d!98401 (= (-!417 newAcc!49 k!2824) lt!318811)))

(declare-fun b!714973 () Bool)

(assert (=> b!714973 (= e!401797 (= (content!369 lt!318811) (set.minus (content!369 newAcc!49) (set.insert k!2824 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun b!714974 () Bool)

(assert (=> b!714974 (= e!401795 (Cons!13426 (h!14471 newAcc!49) call!34631))))

(assert (= (and d!98401 c!78879) b!714971))

(assert (= (and d!98401 (not c!78879)) b!714970))

(assert (= (and b!714971 c!78880) b!714972))

(assert (= (and b!714971 (not c!78880)) b!714974))

(assert (= (or b!714972 b!714974) bm!34628))

(assert (= (and d!98401 res!477946) b!714973))

(declare-fun m!671371 () Bool)

(assert (=> bm!34628 m!671371))

(declare-fun m!671373 () Bool)

(assert (=> d!98401 m!671373))

(declare-fun m!671375 () Bool)

(assert (=> d!98401 m!671375))

(declare-fun m!671377 () Bool)

(assert (=> b!714973 m!671377))

(assert (=> b!714973 m!671337))

(declare-fun m!671379 () Bool)

(assert (=> b!714973 m!671379))

(assert (=> b!714633 d!98401))

(declare-fun b!714977 () Bool)

(declare-fun e!401803 () Bool)

(declare-fun e!401800 () Bool)

(assert (=> b!714977 (= e!401803 e!401800)))

(declare-fun res!477950 () Bool)

(assert (=> b!714977 (=> (not res!477950) (not e!401800))))

(declare-fun e!401802 () Bool)

(assert (=> b!714977 (= res!477950 (not e!401802))))

(declare-fun res!477951 () Bool)

(assert (=> b!714977 (=> (not res!477951) (not e!401802))))

(assert (=> b!714977 (= res!477951 (validKeyInArray!0 (select (arr!19389 a!3591) from!2969)))))

(declare-fun d!98415 () Bool)

(declare-fun res!477949 () Bool)

(assert (=> d!98415 (=> res!477949 e!401803)))

(assert (=> d!98415 (= res!477949 (bvsge from!2969 (size!19802 a!3591)))))

(assert (=> d!98415 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!401803)))

(declare-fun bm!34629 () Bool)

(declare-fun c!78881 () Bool)

(declare-fun call!34632 () Bool)

(assert (=> bm!34629 (= call!34632 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78881 (Cons!13426 (select (arr!19389 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!714978 () Bool)

(declare-fun e!401801 () Bool)

(assert (=> b!714978 (= e!401800 e!401801)))

(assert (=> b!714978 (= c!78881 (validKeyInArray!0 (select (arr!19389 a!3591) from!2969)))))

(declare-fun b!714979 () Bool)

(assert (=> b!714979 (= e!401802 (contains!4007 acc!652 (select (arr!19389 a!3591) from!2969)))))

(declare-fun b!714980 () Bool)

(assert (=> b!714980 (= e!401801 call!34632)))

(declare-fun b!714981 () Bool)

(assert (=> b!714981 (= e!401801 call!34632)))

(assert (= (and d!98415 (not res!477949)) b!714977))

(assert (= (and b!714977 res!477951) b!714979))

(assert (= (and b!714977 res!477950) b!714978))

(assert (= (and b!714978 c!78881) b!714980))

(assert (= (and b!714978 (not c!78881)) b!714981))

(assert (= (or b!714980 b!714981) bm!34629))

(assert (=> b!714977 m!671101))

(assert (=> b!714977 m!671101))

(assert (=> b!714977 m!671103))

(assert (=> bm!34629 m!671101))

(declare-fun m!671383 () Bool)

(assert (=> bm!34629 m!671383))

(assert (=> b!714978 m!671101))

(assert (=> b!714978 m!671101))

(assert (=> b!714978 m!671103))

(assert (=> b!714979 m!671101))

(assert (=> b!714979 m!671101))

(declare-fun m!671385 () Bool)

(assert (=> b!714979 m!671385))

(assert (=> b!714644 d!98415))

(declare-fun d!98421 () Bool)

(declare-fun res!477954 () Bool)

(declare-fun e!401806 () Bool)

(assert (=> d!98421 (=> res!477954 e!401806)))

(assert (=> d!98421 (= res!477954 (is-Nil!13427 newAcc!49))))

(assert (=> d!98421 (= (noDuplicate!1254 newAcc!49) e!401806)))

(declare-fun b!714984 () Bool)

(declare-fun e!401807 () Bool)

(assert (=> b!714984 (= e!401806 e!401807)))

(declare-fun res!477955 () Bool)

(assert (=> b!714984 (=> (not res!477955) (not e!401807))))

(assert (=> b!714984 (= res!477955 (not (contains!4007 (t!19745 newAcc!49) (h!14471 newAcc!49))))))

(declare-fun b!714985 () Bool)

