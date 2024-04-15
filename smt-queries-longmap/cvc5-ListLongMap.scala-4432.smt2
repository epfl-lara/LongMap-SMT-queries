; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61560 () Bool)

(assert start!61560)

(declare-fun b!688572 () Bool)

(declare-fun e!392115 () Bool)

(assert (=> b!688572 (= e!392115 true)))

(declare-fun lt!315689 () Bool)

(declare-fun e!392109 () Bool)

(assert (=> b!688572 (= lt!315689 e!392109)))

(declare-fun res!453375 () Bool)

(assert (=> b!688572 (=> res!453375 e!392109)))

(declare-fun e!392107 () Bool)

(assert (=> b!688572 (= res!453375 e!392107)))

(declare-fun res!453368 () Bool)

(assert (=> b!688572 (=> (not res!453368) (not e!392107))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!688572 (= res!453368 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688573 () Bool)

(declare-fun e!392112 () Bool)

(assert (=> b!688573 (= e!392109 e!392112)))

(declare-fun res!453377 () Bool)

(assert (=> b!688573 (=> (not res!453377) (not e!392112))))

(assert (=> b!688573 (= res!453377 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!688574 () Bool)

(declare-datatypes ((List!13107 0))(
  ( (Nil!13104) (Cons!13103 (h!14148 (_ BitVec 64)) (t!19362 List!13107)) )
))
(declare-fun lt!315691 () List!13107)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3629 (List!13107 (_ BitVec 64)) Bool)

(assert (=> b!688574 (= e!392112 (not (contains!3629 lt!315691 k!2843)))))

(declare-fun b!688575 () Bool)

(declare-fun res!453382 () Bool)

(declare-fun e!392116 () Bool)

(assert (=> b!688575 (=> (not res!453382) (not e!392116))))

(declare-datatypes ((array!39712 0))(
  ( (array!39713 (arr!19027 (Array (_ BitVec 32) (_ BitVec 64))) (size!19408 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39712)

(declare-fun arrayContainsKey!0 (array!39712 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!688575 (= res!453382 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun res!453380 () Bool)

(assert (=> start!61560 (=> (not res!453380) (not e!392116))))

(assert (=> start!61560 (= res!453380 (and (bvslt (size!19408 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19408 a!3626))))))

(assert (=> start!61560 e!392116))

(assert (=> start!61560 true))

(declare-fun array_inv!14910 (array!39712) Bool)

(assert (=> start!61560 (array_inv!14910 a!3626)))

(declare-fun b!688576 () Bool)

(declare-fun res!453373 () Bool)

(assert (=> b!688576 (=> (not res!453373) (not e!392116))))

(declare-fun e!392111 () Bool)

(assert (=> b!688576 (= res!453373 e!392111)))

(declare-fun res!453374 () Bool)

(assert (=> b!688576 (=> res!453374 e!392111)))

(declare-fun e!392117 () Bool)

(assert (=> b!688576 (= res!453374 e!392117)))

(declare-fun res!453388 () Bool)

(assert (=> b!688576 (=> (not res!453388) (not e!392117))))

(assert (=> b!688576 (= res!453388 (bvsgt from!3004 i!1382))))

(declare-fun b!688577 () Bool)

(assert (=> b!688577 (= e!392116 (not e!392115))))

(declare-fun res!453376 () Bool)

(assert (=> b!688577 (=> res!453376 e!392115)))

(assert (=> b!688577 (= res!453376 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun arrayNoDuplicates!0 (array!39712 (_ BitVec 32) List!13107) Bool)

(assert (=> b!688577 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!315691)))

(declare-datatypes ((Unit!24285 0))(
  ( (Unit!24286) )
))
(declare-fun lt!315685 () Unit!24285)

(declare-fun acc!681 () List!13107)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39712 (_ BitVec 64) (_ BitVec 32) List!13107 List!13107) Unit!24285)

(assert (=> b!688577 (= lt!315685 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!315691))))

(declare-fun -!197 (List!13107 (_ BitVec 64)) List!13107)

(assert (=> b!688577 (= (-!197 lt!315691 k!2843) acc!681)))

(declare-fun $colon$colon!396 (List!13107 (_ BitVec 64)) List!13107)

(assert (=> b!688577 (= lt!315691 ($colon$colon!396 acc!681 k!2843))))

(declare-fun lt!315690 () Unit!24285)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13107) Unit!24285)

(assert (=> b!688577 (= lt!315690 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!232 (List!13107 List!13107) Bool)

(assert (=> b!688577 (subseq!232 acc!681 acc!681)))

(declare-fun lt!315688 () Unit!24285)

(declare-fun lemmaListSubSeqRefl!0 (List!13107) Unit!24285)

(assert (=> b!688577 (= lt!315688 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688577 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!315684 () Unit!24285)

(declare-fun e!392110 () Unit!24285)

(assert (=> b!688577 (= lt!315684 e!392110)))

(declare-fun c!77969 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!688577 (= c!77969 (validKeyInArray!0 (select (arr!19027 a!3626) from!3004)))))

(declare-fun lt!315692 () Unit!24285)

(declare-fun e!392108 () Unit!24285)

(assert (=> b!688577 (= lt!315692 e!392108)))

(declare-fun c!77970 () Bool)

(assert (=> b!688577 (= c!77970 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688577 (arrayContainsKey!0 (array!39713 (store (arr!19027 a!3626) i!1382 k!2843) (size!19408 a!3626)) k!2843 from!3004)))

(declare-fun b!688578 () Bool)

(declare-fun res!453378 () Bool)

(assert (=> b!688578 (=> res!453378 e!392115)))

(assert (=> b!688578 (= res!453378 (contains!3629 lt!315691 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688579 () Bool)

(declare-fun res!453383 () Bool)

(assert (=> b!688579 (=> (not res!453383) (not e!392116))))

(assert (=> b!688579 (= res!453383 (validKeyInArray!0 k!2843))))

(declare-fun b!688580 () Bool)

(declare-fun res!453379 () Bool)

(assert (=> b!688580 (=> (not res!453379) (not e!392116))))

(assert (=> b!688580 (= res!453379 (not (contains!3629 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688581 () Bool)

(declare-fun res!453384 () Bool)

(assert (=> b!688581 (=> (not res!453384) (not e!392116))))

(assert (=> b!688581 (= res!453384 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13104))))

(declare-fun b!688582 () Bool)

(declare-fun e!392114 () Bool)

(assert (=> b!688582 (= e!392111 e!392114)))

(declare-fun res!453381 () Bool)

(assert (=> b!688582 (=> (not res!453381) (not e!392114))))

(assert (=> b!688582 (= res!453381 (bvsle from!3004 i!1382))))

(declare-fun b!688583 () Bool)

(declare-fun res!453387 () Bool)

(assert (=> b!688583 (=> (not res!453387) (not e!392116))))

(assert (=> b!688583 (= res!453387 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!688584 () Bool)

(declare-fun res!453369 () Bool)

(assert (=> b!688584 (=> res!453369 e!392115)))

(assert (=> b!688584 (= res!453369 (contains!3629 lt!315691 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!688585 () Bool)

(declare-fun Unit!24287 () Unit!24285)

(assert (=> b!688585 (= e!392110 Unit!24287)))

(declare-fun b!688586 () Bool)

(declare-fun res!453372 () Bool)

(assert (=> b!688586 (=> (not res!453372) (not e!392116))))

(assert (=> b!688586 (= res!453372 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19408 a!3626))))))

(declare-fun b!688587 () Bool)

(declare-fun res!453371 () Bool)

(assert (=> b!688587 (=> (not res!453371) (not e!392116))))

(assert (=> b!688587 (= res!453371 (not (contains!3629 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!688588 () Bool)

(declare-fun lt!315693 () Unit!24285)

(assert (=> b!688588 (= e!392110 lt!315693)))

(declare-fun lt!315687 () Unit!24285)

(assert (=> b!688588 (= lt!315687 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!688588 (subseq!232 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39712 List!13107 List!13107 (_ BitVec 32)) Unit!24285)

(assert (=> b!688588 (= lt!315693 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!396 acc!681 (select (arr!19027 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!688588 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!688589 () Bool)

(assert (=> b!688589 (= e!392117 (contains!3629 acc!681 k!2843))))

(declare-fun b!688590 () Bool)

(assert (=> b!688590 (= e!392114 (not (contains!3629 acc!681 k!2843)))))

(declare-fun b!688591 () Bool)

(declare-fun Unit!24288 () Unit!24285)

(assert (=> b!688591 (= e!392108 Unit!24288)))

(declare-fun lt!315686 () Unit!24285)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39712 (_ BitVec 64) (_ BitVec 32)) Unit!24285)

(assert (=> b!688591 (= lt!315686 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!688591 false))

(declare-fun b!688592 () Bool)

(declare-fun res!453385 () Bool)

(assert (=> b!688592 (=> (not res!453385) (not e!392116))))

(assert (=> b!688592 (= res!453385 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19408 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!688593 () Bool)

(declare-fun res!453370 () Bool)

(assert (=> b!688593 (=> (not res!453370) (not e!392116))))

(declare-fun noDuplicate!898 (List!13107) Bool)

(assert (=> b!688593 (= res!453370 (noDuplicate!898 acc!681))))

(declare-fun b!688594 () Bool)

(assert (=> b!688594 (= e!392107 (contains!3629 lt!315691 k!2843))))

(declare-fun b!688595 () Bool)

(declare-fun res!453386 () Bool)

(assert (=> b!688595 (=> res!453386 e!392115)))

(assert (=> b!688595 (= res!453386 (not (noDuplicate!898 lt!315691)))))

(declare-fun b!688596 () Bool)

(declare-fun Unit!24289 () Unit!24285)

(assert (=> b!688596 (= e!392108 Unit!24289)))

(assert (= (and start!61560 res!453380) b!688593))

(assert (= (and b!688593 res!453370) b!688587))

(assert (= (and b!688587 res!453371) b!688580))

(assert (= (and b!688580 res!453379) b!688576))

(assert (= (and b!688576 res!453388) b!688589))

(assert (= (and b!688576 (not res!453374)) b!688582))

(assert (= (and b!688582 res!453381) b!688590))

(assert (= (and b!688576 res!453373) b!688581))

(assert (= (and b!688581 res!453384) b!688583))

(assert (= (and b!688583 res!453387) b!688586))

(assert (= (and b!688586 res!453372) b!688579))

(assert (= (and b!688579 res!453383) b!688575))

(assert (= (and b!688575 res!453382) b!688592))

(assert (= (and b!688592 res!453385) b!688577))

(assert (= (and b!688577 c!77970) b!688591))

(assert (= (and b!688577 (not c!77970)) b!688596))

(assert (= (and b!688577 c!77969) b!688588))

(assert (= (and b!688577 (not c!77969)) b!688585))

(assert (= (and b!688577 (not res!453376)) b!688595))

(assert (= (and b!688595 (not res!453386)) b!688584))

(assert (= (and b!688584 (not res!453369)) b!688578))

(assert (= (and b!688578 (not res!453378)) b!688572))

(assert (= (and b!688572 res!453368) b!688594))

(assert (= (and b!688572 (not res!453375)) b!688573))

(assert (= (and b!688573 res!453377) b!688574))

(declare-fun m!651881 () Bool)

(assert (=> b!688577 m!651881))

(declare-fun m!651883 () Bool)

(assert (=> b!688577 m!651883))

(declare-fun m!651885 () Bool)

(assert (=> b!688577 m!651885))

(declare-fun m!651887 () Bool)

(assert (=> b!688577 m!651887))

(declare-fun m!651889 () Bool)

(assert (=> b!688577 m!651889))

(declare-fun m!651891 () Bool)

(assert (=> b!688577 m!651891))

(declare-fun m!651893 () Bool)

(assert (=> b!688577 m!651893))

(declare-fun m!651895 () Bool)

(assert (=> b!688577 m!651895))

(assert (=> b!688577 m!651883))

(declare-fun m!651897 () Bool)

(assert (=> b!688577 m!651897))

(declare-fun m!651899 () Bool)

(assert (=> b!688577 m!651899))

(declare-fun m!651901 () Bool)

(assert (=> b!688577 m!651901))

(declare-fun m!651903 () Bool)

(assert (=> b!688577 m!651903))

(declare-fun m!651905 () Bool)

(assert (=> b!688577 m!651905))

(declare-fun m!651907 () Bool)

(assert (=> b!688580 m!651907))

(declare-fun m!651909 () Bool)

(assert (=> b!688579 m!651909))

(declare-fun m!651911 () Bool)

(assert (=> b!688589 m!651911))

(declare-fun m!651913 () Bool)

(assert (=> b!688581 m!651913))

(declare-fun m!651915 () Bool)

(assert (=> b!688594 m!651915))

(declare-fun m!651917 () Bool)

(assert (=> b!688587 m!651917))

(declare-fun m!651919 () Bool)

(assert (=> b!688575 m!651919))

(declare-fun m!651921 () Bool)

(assert (=> b!688591 m!651921))

(assert (=> b!688590 m!651911))

(declare-fun m!651923 () Bool)

(assert (=> b!688578 m!651923))

(declare-fun m!651925 () Bool)

(assert (=> b!688593 m!651925))

(assert (=> b!688574 m!651915))

(assert (=> b!688588 m!651881))

(assert (=> b!688588 m!651883))

(declare-fun m!651927 () Bool)

(assert (=> b!688588 m!651927))

(declare-fun m!651929 () Bool)

(assert (=> b!688588 m!651929))

(assert (=> b!688588 m!651883))

(assert (=> b!688588 m!651927))

(assert (=> b!688588 m!651893))

(assert (=> b!688588 m!651905))

(declare-fun m!651931 () Bool)

(assert (=> b!688583 m!651931))

(declare-fun m!651933 () Bool)

(assert (=> start!61560 m!651933))

(declare-fun m!651935 () Bool)

(assert (=> b!688595 m!651935))

(declare-fun m!651937 () Bool)

(assert (=> b!688584 m!651937))

(push 1)

(assert (not b!688594))

(assert (not b!688591))

(assert (not b!688590))

(assert (not b!688577))

(assert (not b!688574))

(assert (not b!688580))

(assert (not b!688583))

(assert (not start!61560))

(assert (not b!688581))

(assert (not b!688595))

(assert (not b!688584))

(assert (not b!688579))

(assert (not b!688589))

(assert (not b!688588))

(assert (not b!688587))

(assert (not b!688578))

(assert (not b!688575))

(assert (not b!688593))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

