; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59948 () Bool)

(assert start!59948)

(declare-fun res!432293 () Bool)

(declare-fun e!381100 () Bool)

(assert (=> start!59948 (=> (not res!432293) (not e!381100))))

(declare-datatypes ((array!38995 0))(
  ( (array!38996 (arr!18690 (Array (_ BitVec 32) (_ BitVec 64))) (size!19054 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38995)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!59948 (= res!432293 (and (bvslt (size!19054 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19054 a!3626))))))

(assert (=> start!59948 e!381100))

(assert (=> start!59948 true))

(declare-fun array_inv!14486 (array!38995) Bool)

(assert (=> start!59948 (array_inv!14486 a!3626)))

(declare-fun b!664628 () Bool)

(declare-fun res!432289 () Bool)

(declare-fun e!381099 () Bool)

(assert (=> b!664628 (=> res!432289 e!381099)))

(declare-datatypes ((List!12731 0))(
  ( (Nil!12728) (Cons!12727 (h!13772 (_ BitVec 64)) (t!18959 List!12731)) )
))
(declare-fun lt!309699 () List!12731)

(declare-fun noDuplicate!555 (List!12731) Bool)

(assert (=> b!664628 (= res!432289 (not (noDuplicate!555 lt!309699)))))

(declare-fun b!664629 () Bool)

(assert (=> b!664629 (= e!381100 (not e!381099))))

(declare-fun res!432292 () Bool)

(assert (=> b!664629 (=> res!432292 e!381099)))

(assert (=> b!664629 (= res!432292 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun acc!681 () List!12731)

(declare-fun -!45 (List!12731 (_ BitVec 64)) List!12731)

(assert (=> b!664629 (= (-!45 lt!309699 k!2843) acc!681)))

(declare-fun $colon$colon!179 (List!12731 (_ BitVec 64)) List!12731)

(assert (=> b!664629 (= lt!309699 ($colon$colon!179 acc!681 k!2843))))

(declare-datatypes ((Unit!23175 0))(
  ( (Unit!23176) )
))
(declare-fun lt!309695 () Unit!23175)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12731) Unit!23175)

(assert (=> b!664629 (= lt!309695 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!47 (List!12731 List!12731) Bool)

(assert (=> b!664629 (subseq!47 acc!681 acc!681)))

(declare-fun lt!309698 () Unit!23175)

(declare-fun lemmaListSubSeqRefl!0 (List!12731) Unit!23175)

(assert (=> b!664629 (= lt!309698 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun arrayNoDuplicates!0 (array!38995 (_ BitVec 32) List!12731) Bool)

(assert (=> b!664629 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309700 () Unit!23175)

(declare-fun e!381103 () Unit!23175)

(assert (=> b!664629 (= lt!309700 e!381103)))

(declare-fun c!76537 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!664629 (= c!76537 (validKeyInArray!0 (select (arr!18690 a!3626) from!3004)))))

(declare-fun lt!309697 () Unit!23175)

(declare-fun e!381105 () Unit!23175)

(assert (=> b!664629 (= lt!309697 e!381105)))

(declare-fun c!76538 () Bool)

(declare-fun lt!309694 () Bool)

(assert (=> b!664629 (= c!76538 lt!309694)))

(declare-fun arrayContainsKey!0 (array!38995 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!664629 (= lt!309694 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!664629 (arrayContainsKey!0 (array!38996 (store (arr!18690 a!3626) i!1382 k!2843) (size!19054 a!3626)) k!2843 from!3004)))

(declare-fun b!664630 () Bool)

(declare-fun res!432308 () Bool)

(assert (=> b!664630 (=> (not res!432308) (not e!381100))))

(assert (=> b!664630 (= res!432308 (validKeyInArray!0 k!2843))))

(declare-fun b!664631 () Bool)

(declare-fun res!432296 () Bool)

(assert (=> b!664631 (=> (not res!432296) (not e!381100))))

(assert (=> b!664631 (= res!432296 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12728))))

(declare-fun b!664632 () Bool)

(declare-fun res!432305 () Bool)

(assert (=> b!664632 (=> res!432305 e!381099)))

(declare-fun contains!3308 (List!12731 (_ BitVec 64)) Bool)

(assert (=> b!664632 (= res!432305 (not (contains!3308 lt!309699 k!2843)))))

(declare-fun b!664633 () Bool)

(declare-fun res!432291 () Bool)

(assert (=> b!664633 (=> (not res!432291) (not e!381100))))

(assert (=> b!664633 (= res!432291 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!664634 () Bool)

(declare-fun res!432300 () Bool)

(assert (=> b!664634 (=> (not res!432300) (not e!381100))))

(assert (=> b!664634 (= res!432300 (not (contains!3308 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664635 () Bool)

(declare-fun res!432307 () Bool)

(assert (=> b!664635 (=> res!432307 e!381099)))

(assert (=> b!664635 (= res!432307 (not (subseq!47 acc!681 lt!309699)))))

(declare-fun b!664636 () Bool)

(declare-fun res!432306 () Bool)

(assert (=> b!664636 (=> (not res!432306) (not e!381100))))

(assert (=> b!664636 (= res!432306 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19054 a!3626))))))

(declare-fun b!664637 () Bool)

(declare-fun lt!309703 () Unit!23175)

(assert (=> b!664637 (= e!381103 lt!309703)))

(declare-fun lt!309701 () Unit!23175)

(assert (=> b!664637 (= lt!309701 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664637 (subseq!47 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38995 List!12731 List!12731 (_ BitVec 32)) Unit!23175)

(assert (=> b!664637 (= lt!309703 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!179 acc!681 (select (arr!18690 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664637 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!664638 () Bool)

(declare-fun res!432302 () Bool)

(assert (=> b!664638 (=> res!432302 e!381099)))

(assert (=> b!664638 (= res!432302 (contains!3308 acc!681 k!2843))))

(declare-fun b!664639 () Bool)

(declare-fun res!432303 () Bool)

(assert (=> b!664639 (=> (not res!432303) (not e!381100))))

(assert (=> b!664639 (= res!432303 (noDuplicate!555 acc!681))))

(declare-fun b!664640 () Bool)

(declare-fun res!432290 () Bool)

(assert (=> b!664640 (=> (not res!432290) (not e!381100))))

(assert (=> b!664640 (= res!432290 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!664641 () Bool)

(declare-fun res!432298 () Bool)

(assert (=> b!664641 (=> (not res!432298) (not e!381100))))

(declare-fun e!381098 () Bool)

(assert (=> b!664641 (= res!432298 e!381098)))

(declare-fun res!432304 () Bool)

(assert (=> b!664641 (=> res!432304 e!381098)))

(declare-fun e!381101 () Bool)

(assert (=> b!664641 (= res!432304 e!381101)))

(declare-fun res!432297 () Bool)

(assert (=> b!664641 (=> (not res!432297) (not e!381101))))

(assert (=> b!664641 (= res!432297 (bvsgt from!3004 i!1382))))

(declare-fun b!664642 () Bool)

(assert (=> b!664642 (= e!381099 true)))

(declare-fun lt!309696 () Bool)

(assert (=> b!664642 (= lt!309696 (contains!3308 lt!309699 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664643 () Bool)

(assert (=> b!664643 (= e!381101 (contains!3308 acc!681 k!2843))))

(declare-fun b!664644 () Bool)

(declare-fun res!432299 () Bool)

(assert (=> b!664644 (=> res!432299 e!381099)))

(assert (=> b!664644 (= res!432299 (contains!3308 lt!309699 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664645 () Bool)

(declare-fun res!432301 () Bool)

(assert (=> b!664645 (=> (not res!432301) (not e!381100))))

(assert (=> b!664645 (= res!432301 (not (contains!3308 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664646 () Bool)

(declare-fun Unit!23177 () Unit!23175)

(assert (=> b!664646 (= e!381105 Unit!23177)))

(declare-fun lt!309702 () Unit!23175)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38995 (_ BitVec 64) (_ BitVec 32)) Unit!23175)

(assert (=> b!664646 (= lt!309702 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!664646 false))

(declare-fun b!664647 () Bool)

(declare-fun res!432295 () Bool)

(assert (=> b!664647 (=> res!432295 e!381099)))

(assert (=> b!664647 (= res!432295 lt!309694)))

(declare-fun b!664648 () Bool)

(declare-fun e!381104 () Bool)

(assert (=> b!664648 (= e!381098 e!381104)))

(declare-fun res!432294 () Bool)

(assert (=> b!664648 (=> (not res!432294) (not e!381104))))

(assert (=> b!664648 (= res!432294 (bvsle from!3004 i!1382))))

(declare-fun b!664649 () Bool)

(assert (=> b!664649 (= e!381104 (not (contains!3308 acc!681 k!2843)))))

(declare-fun b!664650 () Bool)

(declare-fun res!432288 () Bool)

(assert (=> b!664650 (=> (not res!432288) (not e!381100))))

(assert (=> b!664650 (= res!432288 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19054 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!664651 () Bool)

(declare-fun Unit!23178 () Unit!23175)

(assert (=> b!664651 (= e!381103 Unit!23178)))

(declare-fun b!664652 () Bool)

(declare-fun Unit!23179 () Unit!23175)

(assert (=> b!664652 (= e!381105 Unit!23179)))

(assert (= (and start!59948 res!432293) b!664639))

(assert (= (and b!664639 res!432303) b!664645))

(assert (= (and b!664645 res!432301) b!664634))

(assert (= (and b!664634 res!432300) b!664641))

(assert (= (and b!664641 res!432297) b!664643))

(assert (= (and b!664641 (not res!432304)) b!664648))

(assert (= (and b!664648 res!432294) b!664649))

(assert (= (and b!664641 res!432298) b!664631))

(assert (= (and b!664631 res!432296) b!664633))

(assert (= (and b!664633 res!432291) b!664636))

(assert (= (and b!664636 res!432306) b!664630))

(assert (= (and b!664630 res!432308) b!664640))

(assert (= (and b!664640 res!432290) b!664650))

(assert (= (and b!664650 res!432288) b!664629))

(assert (= (and b!664629 c!76538) b!664646))

(assert (= (and b!664629 (not c!76538)) b!664652))

(assert (= (and b!664629 c!76537) b!664637))

(assert (= (and b!664629 (not c!76537)) b!664651))

(assert (= (and b!664629 (not res!432292)) b!664628))

(assert (= (and b!664628 (not res!432289)) b!664647))

(assert (= (and b!664647 (not res!432295)) b!664638))

(assert (= (and b!664638 (not res!432302)) b!664635))

(assert (= (and b!664635 (not res!432307)) b!664632))

(assert (= (and b!664632 (not res!432305)) b!664644))

(assert (= (and b!664644 (not res!432299)) b!664642))

(declare-fun m!635885 () Bool)

(assert (=> b!664634 m!635885))

(declare-fun m!635887 () Bool)

(assert (=> b!664638 m!635887))

(declare-fun m!635889 () Bool)

(assert (=> b!664639 m!635889))

(assert (=> b!664643 m!635887))

(declare-fun m!635891 () Bool)

(assert (=> b!664632 m!635891))

(assert (=> b!664649 m!635887))

(declare-fun m!635893 () Bool)

(assert (=> b!664635 m!635893))

(declare-fun m!635895 () Bool)

(assert (=> b!664629 m!635895))

(declare-fun m!635897 () Bool)

(assert (=> b!664629 m!635897))

(declare-fun m!635899 () Bool)

(assert (=> b!664629 m!635899))

(declare-fun m!635901 () Bool)

(assert (=> b!664629 m!635901))

(declare-fun m!635903 () Bool)

(assert (=> b!664629 m!635903))

(declare-fun m!635905 () Bool)

(assert (=> b!664629 m!635905))

(declare-fun m!635907 () Bool)

(assert (=> b!664629 m!635907))

(declare-fun m!635909 () Bool)

(assert (=> b!664629 m!635909))

(assert (=> b!664629 m!635897))

(declare-fun m!635911 () Bool)

(assert (=> b!664629 m!635911))

(declare-fun m!635913 () Bool)

(assert (=> b!664629 m!635913))

(declare-fun m!635915 () Bool)

(assert (=> b!664629 m!635915))

(declare-fun m!635917 () Bool)

(assert (=> b!664644 m!635917))

(declare-fun m!635919 () Bool)

(assert (=> b!664646 m!635919))

(declare-fun m!635921 () Bool)

(assert (=> start!59948 m!635921))

(assert (=> b!664637 m!635895))

(assert (=> b!664637 m!635897))

(declare-fun m!635923 () Bool)

(assert (=> b!664637 m!635923))

(declare-fun m!635925 () Bool)

(assert (=> b!664637 m!635925))

(assert (=> b!664637 m!635897))

(assert (=> b!664637 m!635923))

(assert (=> b!664637 m!635905))

(assert (=> b!664637 m!635915))

(declare-fun m!635927 () Bool)

(assert (=> b!664631 m!635927))

(declare-fun m!635929 () Bool)

(assert (=> b!664630 m!635929))

(declare-fun m!635931 () Bool)

(assert (=> b!664628 m!635931))

(declare-fun m!635933 () Bool)

(assert (=> b!664642 m!635933))

(declare-fun m!635935 () Bool)

(assert (=> b!664645 m!635935))

(declare-fun m!635937 () Bool)

(assert (=> b!664640 m!635937))

(declare-fun m!635939 () Bool)

(assert (=> b!664633 m!635939))

(push 1)

(assert (not b!664633))

(assert (not b!664637))

(assert (not start!59948))

(assert (not b!664635))

(assert (not b!664640))

(assert (not b!664645))

(assert (not b!664649))

(assert (not b!664630))

(assert (not b!664632))

(assert (not b!664634))

(assert (not b!664638))

(assert (not b!664629))

(assert (not b!664631))

(assert (not b!664643))

(assert (not b!664642))

(assert (not b!664628))

(assert (not b!664639))

(assert (not b!664644))

(assert (not b!664646))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

