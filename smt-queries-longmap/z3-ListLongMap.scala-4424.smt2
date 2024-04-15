; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61256 () Bool)

(assert start!61256)

(declare-fun res!451364 () Bool)

(declare-fun e!390676 () Bool)

(assert (=> start!61256 (=> (not res!451364) (not e!390676))))

(declare-datatypes ((array!39651 0))(
  ( (array!39652 (arr!19001 (Array (_ BitVec 32) (_ BitVec 64))) (size!19375 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39651)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!61256 (= res!451364 (and (bvslt (size!19375 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19375 a!3626))))))

(assert (=> start!61256 e!390676))

(assert (=> start!61256 true))

(declare-fun array_inv!14884 (array!39651) Bool)

(assert (=> start!61256 (array_inv!14884 a!3626)))

(declare-fun b!686029 () Bool)

(declare-fun e!390674 () Bool)

(declare-datatypes ((List!13081 0))(
  ( (Nil!13078) (Cons!13077 (h!14122 (_ BitVec 64)) (t!19327 List!13081)) )
))
(declare-fun acc!681 () List!13081)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3603 (List!13081 (_ BitVec 64)) Bool)

(assert (=> b!686029 (= e!390674 (not (contains!3603 acc!681 k0!2843)))))

(declare-fun b!686030 () Bool)

(assert (=> b!686030 (= e!390676 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(declare-fun lt!314728 () List!13081)

(declare-fun arrayNoDuplicates!0 (array!39651 (_ BitVec 32) List!13081) Bool)

(assert (=> b!686030 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!314728)))

(declare-datatypes ((Unit!24155 0))(
  ( (Unit!24156) )
))
(declare-fun lt!314725 () Unit!24155)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39651 (_ BitVec 64) (_ BitVec 32) List!13081 List!13081) Unit!24155)

(assert (=> b!686030 (= lt!314725 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!314728))))

(declare-fun -!171 (List!13081 (_ BitVec 64)) List!13081)

(assert (=> b!686030 (= (-!171 lt!314728 k0!2843) acc!681)))

(declare-fun $colon$colon!370 (List!13081 (_ BitVec 64)) List!13081)

(assert (=> b!686030 (= lt!314728 ($colon$colon!370 acc!681 k0!2843))))

(declare-fun lt!314729 () Unit!24155)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13081) Unit!24155)

(assert (=> b!686030 (= lt!314729 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!206 (List!13081 List!13081) Bool)

(assert (=> b!686030 (subseq!206 acc!681 acc!681)))

(declare-fun lt!314730 () Unit!24155)

(declare-fun lemmaListSubSeqRefl!0 (List!13081) Unit!24155)

(assert (=> b!686030 (= lt!314730 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686030 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314727 () Unit!24155)

(declare-fun e!390673 () Unit!24155)

(assert (=> b!686030 (= lt!314727 e!390673)))

(declare-fun c!77705 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!686030 (= c!77705 (validKeyInArray!0 (select (arr!19001 a!3626) from!3004)))))

(declare-fun lt!314726 () Unit!24155)

(declare-fun e!390671 () Unit!24155)

(assert (=> b!686030 (= lt!314726 e!390671)))

(declare-fun c!77706 () Bool)

(declare-fun arrayContainsKey!0 (array!39651 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!686030 (= c!77706 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!686030 (arrayContainsKey!0 (array!39652 (store (arr!19001 a!3626) i!1382 k0!2843) (size!19375 a!3626)) k0!2843 from!3004)))

(declare-fun b!686031 () Bool)

(declare-fun res!451355 () Bool)

(assert (=> b!686031 (=> (not res!451355) (not e!390676))))

(assert (=> b!686031 (= res!451355 (validKeyInArray!0 k0!2843))))

(declare-fun b!686032 () Bool)

(declare-fun res!451357 () Bool)

(assert (=> b!686032 (=> (not res!451357) (not e!390676))))

(assert (=> b!686032 (= res!451357 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19375 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!686033 () Bool)

(declare-fun Unit!24157 () Unit!24155)

(assert (=> b!686033 (= e!390671 Unit!24157)))

(declare-fun b!686034 () Bool)

(declare-fun res!451360 () Bool)

(assert (=> b!686034 (=> (not res!451360) (not e!390676))))

(assert (=> b!686034 (= res!451360 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!686035 () Bool)

(declare-fun res!451358 () Bool)

(assert (=> b!686035 (=> (not res!451358) (not e!390676))))

(declare-fun noDuplicate!872 (List!13081) Bool)

(assert (=> b!686035 (= res!451358 (noDuplicate!872 acc!681))))

(declare-fun b!686036 () Bool)

(declare-fun Unit!24158 () Unit!24155)

(assert (=> b!686036 (= e!390673 Unit!24158)))

(declare-fun b!686037 () Bool)

(declare-fun res!451353 () Bool)

(assert (=> b!686037 (=> (not res!451353) (not e!390676))))

(declare-fun e!390675 () Bool)

(assert (=> b!686037 (= res!451353 e!390675)))

(declare-fun res!451362 () Bool)

(assert (=> b!686037 (=> res!451362 e!390675)))

(declare-fun e!390677 () Bool)

(assert (=> b!686037 (= res!451362 e!390677)))

(declare-fun res!451354 () Bool)

(assert (=> b!686037 (=> (not res!451354) (not e!390677))))

(assert (=> b!686037 (= res!451354 (bvsgt from!3004 i!1382))))

(declare-fun b!686038 () Bool)

(declare-fun Unit!24159 () Unit!24155)

(assert (=> b!686038 (= e!390671 Unit!24159)))

(declare-fun lt!314731 () Unit!24155)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39651 (_ BitVec 64) (_ BitVec 32)) Unit!24155)

(assert (=> b!686038 (= lt!314731 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!686038 false))

(declare-fun b!686039 () Bool)

(declare-fun lt!314733 () Unit!24155)

(assert (=> b!686039 (= e!390673 lt!314733)))

(declare-fun lt!314732 () Unit!24155)

(assert (=> b!686039 (= lt!314732 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!686039 (subseq!206 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39651 List!13081 List!13081 (_ BitVec 32)) Unit!24155)

(assert (=> b!686039 (= lt!314733 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!370 acc!681 (select (arr!19001 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!686039 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!686040 () Bool)

(assert (=> b!686040 (= e!390677 (contains!3603 acc!681 k0!2843))))

(declare-fun b!686041 () Bool)

(declare-fun res!451361 () Bool)

(assert (=> b!686041 (=> (not res!451361) (not e!390676))))

(assert (=> b!686041 (= res!451361 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19375 a!3626))))))

(declare-fun b!686042 () Bool)

(declare-fun res!451356 () Bool)

(assert (=> b!686042 (=> (not res!451356) (not e!390676))))

(assert (=> b!686042 (= res!451356 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13078))))

(declare-fun b!686043 () Bool)

(declare-fun res!451363 () Bool)

(assert (=> b!686043 (=> (not res!451363) (not e!390676))))

(assert (=> b!686043 (= res!451363 (not (contains!3603 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686044 () Bool)

(assert (=> b!686044 (= e!390675 e!390674)))

(declare-fun res!451365 () Bool)

(assert (=> b!686044 (=> (not res!451365) (not e!390674))))

(assert (=> b!686044 (= res!451365 (bvsle from!3004 i!1382))))

(declare-fun b!686045 () Bool)

(declare-fun res!451359 () Bool)

(assert (=> b!686045 (=> (not res!451359) (not e!390676))))

(assert (=> b!686045 (= res!451359 (not (contains!3603 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!686046 () Bool)

(declare-fun res!451366 () Bool)

(assert (=> b!686046 (=> (not res!451366) (not e!390676))))

(assert (=> b!686046 (= res!451366 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(assert (= (and start!61256 res!451364) b!686035))

(assert (= (and b!686035 res!451358) b!686045))

(assert (= (and b!686045 res!451359) b!686043))

(assert (= (and b!686043 res!451363) b!686037))

(assert (= (and b!686037 res!451354) b!686040))

(assert (= (and b!686037 (not res!451362)) b!686044))

(assert (= (and b!686044 res!451365) b!686029))

(assert (= (and b!686037 res!451353) b!686042))

(assert (= (and b!686042 res!451356) b!686034))

(assert (= (and b!686034 res!451360) b!686041))

(assert (= (and b!686041 res!451361) b!686031))

(assert (= (and b!686031 res!451355) b!686046))

(assert (= (and b!686046 res!451366) b!686032))

(assert (= (and b!686032 res!451357) b!686030))

(assert (= (and b!686030 c!77706) b!686038))

(assert (= (and b!686030 (not c!77706)) b!686033))

(assert (= (and b!686030 c!77705) b!686039))

(assert (= (and b!686030 (not c!77705)) b!686036))

(declare-fun m!649647 () Bool)

(assert (=> start!61256 m!649647))

(declare-fun m!649649 () Bool)

(assert (=> b!686031 m!649649))

(declare-fun m!649651 () Bool)

(assert (=> b!686046 m!649651))

(declare-fun m!649653 () Bool)

(assert (=> b!686039 m!649653))

(declare-fun m!649655 () Bool)

(assert (=> b!686039 m!649655))

(declare-fun m!649657 () Bool)

(assert (=> b!686039 m!649657))

(declare-fun m!649659 () Bool)

(assert (=> b!686039 m!649659))

(assert (=> b!686039 m!649655))

(assert (=> b!686039 m!649657))

(declare-fun m!649661 () Bool)

(assert (=> b!686039 m!649661))

(declare-fun m!649663 () Bool)

(assert (=> b!686039 m!649663))

(declare-fun m!649665 () Bool)

(assert (=> b!686029 m!649665))

(assert (=> b!686040 m!649665))

(declare-fun m!649667 () Bool)

(assert (=> b!686042 m!649667))

(declare-fun m!649669 () Bool)

(assert (=> b!686045 m!649669))

(declare-fun m!649671 () Bool)

(assert (=> b!686043 m!649671))

(declare-fun m!649673 () Bool)

(assert (=> b!686030 m!649673))

(assert (=> b!686030 m!649653))

(declare-fun m!649675 () Bool)

(assert (=> b!686030 m!649675))

(assert (=> b!686030 m!649655))

(declare-fun m!649677 () Bool)

(assert (=> b!686030 m!649677))

(declare-fun m!649679 () Bool)

(assert (=> b!686030 m!649679))

(declare-fun m!649681 () Bool)

(assert (=> b!686030 m!649681))

(declare-fun m!649683 () Bool)

(assert (=> b!686030 m!649683))

(assert (=> b!686030 m!649655))

(declare-fun m!649685 () Bool)

(assert (=> b!686030 m!649685))

(declare-fun m!649687 () Bool)

(assert (=> b!686030 m!649687))

(assert (=> b!686030 m!649661))

(declare-fun m!649689 () Bool)

(assert (=> b!686030 m!649689))

(assert (=> b!686030 m!649663))

(declare-fun m!649691 () Bool)

(assert (=> b!686034 m!649691))

(declare-fun m!649693 () Bool)

(assert (=> b!686038 m!649693))

(declare-fun m!649695 () Bool)

(assert (=> b!686035 m!649695))

(check-sat (not b!686038) (not b!686035) (not b!686031) (not b!686045) (not b!686040) (not b!686046) (not b!686039) (not b!686029) (not b!686042) (not b!686034) (not start!61256) (not b!686030) (not b!686043))
(check-sat)
