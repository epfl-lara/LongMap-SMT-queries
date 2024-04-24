; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61644 () Bool)

(assert start!61644)

(declare-fun b!689628 () Bool)

(declare-datatypes ((Unit!24321 0))(
  ( (Unit!24322) )
))
(declare-fun e!392676 () Unit!24321)

(declare-fun Unit!24323 () Unit!24321)

(assert (=> b!689628 (= e!392676 Unit!24323)))

(declare-fun b!689629 () Bool)

(declare-fun res!454076 () Bool)

(declare-fun e!392670 () Bool)

(assert (=> b!689629 (=> (not res!454076) (not e!392670))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39723 0))(
  ( (array!39724 (arr!19030 (Array (_ BitVec 32) (_ BitVec 64))) (size!19410 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39723)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!689629 (= res!454076 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19410 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!689630 () Bool)

(declare-fun res!454081 () Bool)

(declare-fun e!392669 () Bool)

(assert (=> b!689630 (=> res!454081 e!392669)))

(declare-fun e!392677 () Bool)

(assert (=> b!689630 (= res!454081 e!392677)))

(declare-fun res!454078 () Bool)

(assert (=> b!689630 (=> (not res!454078) (not e!392677))))

(declare-fun e!392675 () Bool)

(assert (=> b!689630 (= res!454078 e!392675)))

(declare-fun res!454072 () Bool)

(assert (=> b!689630 (=> res!454072 e!392675)))

(assert (=> b!689630 (= res!454072 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!689631 () Bool)

(declare-fun res!454080 () Bool)

(assert (=> b!689631 (=> (not res!454080) (not e!392670))))

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!689631 (= res!454080 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!689632 () Bool)

(declare-fun lt!316245 () Unit!24321)

(assert (=> b!689632 (= e!392676 lt!316245)))

(declare-fun lt!316252 () Unit!24321)

(declare-datatypes ((List!12978 0))(
  ( (Nil!12975) (Cons!12974 (h!14022 (_ BitVec 64)) (t!19234 List!12978)) )
))
(declare-fun acc!681 () List!12978)

(declare-fun lemmaListSubSeqRefl!0 (List!12978) Unit!24321)

(assert (=> b!689632 (= lt!316252 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!239 (List!12978 List!12978) Bool)

(assert (=> b!689632 (subseq!239 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39723 List!12978 List!12978 (_ BitVec 32)) Unit!24321)

(declare-fun $colon$colon!401 (List!12978 (_ BitVec 64)) List!12978)

(assert (=> b!689632 (= lt!316245 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!401 acc!681 (select (arr!19030 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39723 (_ BitVec 32) List!12978) Bool)

(assert (=> b!689632 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!689633 () Bool)

(declare-fun e!392674 () Bool)

(declare-fun contains!3630 (List!12978 (_ BitVec 64)) Bool)

(assert (=> b!689633 (= e!392674 (contains!3630 acc!681 k0!2843))))

(declare-fun b!689634 () Bool)

(declare-fun e!392672 () Bool)

(assert (=> b!689634 (= e!392672 (not (contains!3630 acc!681 k0!2843)))))

(declare-fun b!689635 () Bool)

(declare-fun res!454075 () Bool)

(assert (=> b!689635 (=> (not res!454075) (not e!392670))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!689635 (= res!454075 (validKeyInArray!0 k0!2843))))

(declare-fun b!689636 () Bool)

(assert (=> b!689636 (= e!392670 (not e!392669))))

(declare-fun res!454071 () Bool)

(assert (=> b!689636 (=> res!454071 e!392669)))

(assert (=> b!689636 (= res!454071 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun lt!316255 () List!12978)

(assert (=> b!689636 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!316255)))

(declare-fun lt!316248 () Unit!24321)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39723 (_ BitVec 64) (_ BitVec 32) List!12978 List!12978) Unit!24321)

(assert (=> b!689636 (= lt!316248 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!316255))))

(declare-fun -!203 (List!12978 (_ BitVec 64)) List!12978)

(assert (=> b!689636 (= (-!203 lt!316255 k0!2843) acc!681)))

(assert (=> b!689636 (= lt!316255 ($colon$colon!401 acc!681 k0!2843))))

(declare-fun lt!316251 () Unit!24321)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12978) Unit!24321)

(assert (=> b!689636 (= lt!316251 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(assert (=> b!689636 (subseq!239 acc!681 acc!681)))

(declare-fun lt!316253 () Unit!24321)

(assert (=> b!689636 (= lt!316253 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!689636 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!316249 () Unit!24321)

(assert (=> b!689636 (= lt!316249 e!392676)))

(declare-fun c!78149 () Bool)

(assert (=> b!689636 (= c!78149 (validKeyInArray!0 (select (arr!19030 a!3626) from!3004)))))

(declare-fun lt!316246 () Unit!24321)

(declare-fun e!392671 () Unit!24321)

(assert (=> b!689636 (= lt!316246 e!392671)))

(declare-fun c!78148 () Bool)

(assert (=> b!689636 (= c!78148 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun lt!316250 () array!39723)

(assert (=> b!689636 (arrayContainsKey!0 lt!316250 k0!2843 from!3004)))

(assert (=> b!689636 (= lt!316250 (array!39724 (store (arr!19030 a!3626) i!1382 k0!2843) (size!19410 a!3626)))))

(declare-fun b!689637 () Bool)

(declare-fun e!392673 () Bool)

(assert (=> b!689637 (= e!392677 e!392673)))

(declare-fun res!454077 () Bool)

(assert (=> b!689637 (=> res!454077 e!392673)))

(assert (=> b!689637 (= res!454077 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun res!454088 () Bool)

(assert (=> start!61644 (=> (not res!454088) (not e!392670))))

(assert (=> start!61644 (= res!454088 (and (bvslt (size!19410 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19410 a!3626))))))

(assert (=> start!61644 e!392670))

(assert (=> start!61644 true))

(declare-fun array_inv!14889 (array!39723) Bool)

(assert (=> start!61644 (array_inv!14889 a!3626)))

(declare-fun b!689638 () Bool)

(declare-fun res!454074 () Bool)

(assert (=> b!689638 (=> res!454074 e!392669)))

(declare-fun noDuplicate!904 (List!12978) Bool)

(assert (=> b!689638 (= res!454074 (not (noDuplicate!904 lt!316255)))))

(declare-fun b!689639 () Bool)

(declare-fun res!454070 () Bool)

(assert (=> b!689639 (=> (not res!454070) (not e!392670))))

(assert (=> b!689639 (= res!454070 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!689640 () Bool)

(assert (=> b!689640 (= e!392669 true)))

(assert (=> b!689640 (arrayNoDuplicates!0 lt!316250 (bvadd #b00000000000000000000000000000001 from!3004) lt!316255)))

(declare-fun lt!316247 () Unit!24321)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39723 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12978) Unit!24321)

(assert (=> b!689640 (= lt!316247 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!316255))))

(declare-fun b!689641 () Bool)

(declare-fun res!454090 () Bool)

(assert (=> b!689641 (=> (not res!454090) (not e!392670))))

(declare-fun e!392679 () Bool)

(assert (=> b!689641 (= res!454090 e!392679)))

(declare-fun res!454089 () Bool)

(assert (=> b!689641 (=> res!454089 e!392679)))

(assert (=> b!689641 (= res!454089 e!392674)))

(declare-fun res!454079 () Bool)

(assert (=> b!689641 (=> (not res!454079) (not e!392674))))

(assert (=> b!689641 (= res!454079 (bvsgt from!3004 i!1382))))

(declare-fun b!689642 () Bool)

(declare-fun res!454083 () Bool)

(assert (=> b!689642 (=> (not res!454083) (not e!392670))))

(assert (=> b!689642 (= res!454083 (not (contains!3630 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689643 () Bool)

(declare-fun res!454069 () Bool)

(assert (=> b!689643 (=> res!454069 e!392669)))

(assert (=> b!689643 (= res!454069 (contains!3630 lt!316255 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689644 () Bool)

(assert (=> b!689644 (= e!392675 (not (contains!3630 lt!316255 k0!2843)))))

(declare-fun b!689645 () Bool)

(declare-fun res!454082 () Bool)

(assert (=> b!689645 (=> (not res!454082) (not e!392670))))

(assert (=> b!689645 (= res!454082 (not (contains!3630 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!689646 () Bool)

(declare-fun Unit!24324 () Unit!24321)

(assert (=> b!689646 (= e!392671 Unit!24324)))

(declare-fun lt!316254 () Unit!24321)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39723 (_ BitVec 64) (_ BitVec 32)) Unit!24321)

(assert (=> b!689646 (= lt!316254 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!689646 false))

(declare-fun b!689647 () Bool)

(assert (=> b!689647 (= e!392673 (contains!3630 lt!316255 k0!2843))))

(declare-fun b!689648 () Bool)

(assert (=> b!689648 (= e!392679 e!392672)))

(declare-fun res!454084 () Bool)

(assert (=> b!689648 (=> (not res!454084) (not e!392672))))

(assert (=> b!689648 (= res!454084 (bvsle from!3004 i!1382))))

(declare-fun b!689649 () Bool)

(declare-fun Unit!24325 () Unit!24321)

(assert (=> b!689649 (= e!392671 Unit!24325)))

(declare-fun b!689650 () Bool)

(declare-fun res!454073 () Bool)

(assert (=> b!689650 (=> (not res!454073) (not e!392670))))

(assert (=> b!689650 (= res!454073 (noDuplicate!904 acc!681))))

(declare-fun b!689651 () Bool)

(declare-fun res!454085 () Bool)

(assert (=> b!689651 (=> res!454085 e!392669)))

(assert (=> b!689651 (= res!454085 (contains!3630 lt!316255 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!689652 () Bool)

(declare-fun res!454086 () Bool)

(assert (=> b!689652 (=> (not res!454086) (not e!392670))))

(assert (=> b!689652 (= res!454086 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12975))))

(declare-fun b!689653 () Bool)

(declare-fun res!454087 () Bool)

(assert (=> b!689653 (=> (not res!454087) (not e!392670))))

(assert (=> b!689653 (= res!454087 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19410 a!3626))))))

(assert (= (and start!61644 res!454088) b!689650))

(assert (= (and b!689650 res!454073) b!689642))

(assert (= (and b!689642 res!454083) b!689645))

(assert (= (and b!689645 res!454082) b!689641))

(assert (= (and b!689641 res!454079) b!689633))

(assert (= (and b!689641 (not res!454089)) b!689648))

(assert (= (and b!689648 res!454084) b!689634))

(assert (= (and b!689641 res!454090) b!689652))

(assert (= (and b!689652 res!454086) b!689639))

(assert (= (and b!689639 res!454070) b!689653))

(assert (= (and b!689653 res!454087) b!689635))

(assert (= (and b!689635 res!454075) b!689631))

(assert (= (and b!689631 res!454080) b!689629))

(assert (= (and b!689629 res!454076) b!689636))

(assert (= (and b!689636 c!78148) b!689646))

(assert (= (and b!689636 (not c!78148)) b!689649))

(assert (= (and b!689636 c!78149) b!689632))

(assert (= (and b!689636 (not c!78149)) b!689628))

(assert (= (and b!689636 (not res!454071)) b!689638))

(assert (= (and b!689638 (not res!454074)) b!689651))

(assert (= (and b!689651 (not res!454085)) b!689643))

(assert (= (and b!689643 (not res!454069)) b!689630))

(assert (= (and b!689630 (not res!454072)) b!689644))

(assert (= (and b!689630 res!454078) b!689637))

(assert (= (and b!689637 (not res!454077)) b!689647))

(assert (= (and b!689630 (not res!454081)) b!689640))

(declare-fun m!653767 () Bool)

(assert (=> start!61644 m!653767))

(declare-fun m!653769 () Bool)

(assert (=> b!689640 m!653769))

(declare-fun m!653771 () Bool)

(assert (=> b!689640 m!653771))

(declare-fun m!653773 () Bool)

(assert (=> b!689642 m!653773))

(declare-fun m!653775 () Bool)

(assert (=> b!689631 m!653775))

(declare-fun m!653777 () Bool)

(assert (=> b!689636 m!653777))

(declare-fun m!653779 () Bool)

(assert (=> b!689636 m!653779))

(declare-fun m!653781 () Bool)

(assert (=> b!689636 m!653781))

(declare-fun m!653783 () Bool)

(assert (=> b!689636 m!653783))

(declare-fun m!653785 () Bool)

(assert (=> b!689636 m!653785))

(declare-fun m!653787 () Bool)

(assert (=> b!689636 m!653787))

(declare-fun m!653789 () Bool)

(assert (=> b!689636 m!653789))

(declare-fun m!653791 () Bool)

(assert (=> b!689636 m!653791))

(declare-fun m!653793 () Bool)

(assert (=> b!689636 m!653793))

(declare-fun m!653795 () Bool)

(assert (=> b!689636 m!653795))

(declare-fun m!653797 () Bool)

(assert (=> b!689636 m!653797))

(assert (=> b!689636 m!653781))

(declare-fun m!653799 () Bool)

(assert (=> b!689636 m!653799))

(declare-fun m!653801 () Bool)

(assert (=> b!689636 m!653801))

(declare-fun m!653803 () Bool)

(assert (=> b!689646 m!653803))

(declare-fun m!653805 () Bool)

(assert (=> b!689650 m!653805))

(declare-fun m!653807 () Bool)

(assert (=> b!689638 m!653807))

(declare-fun m!653809 () Bool)

(assert (=> b!689639 m!653809))

(assert (=> b!689632 m!653779))

(assert (=> b!689632 m!653781))

(declare-fun m!653811 () Bool)

(assert (=> b!689632 m!653811))

(declare-fun m!653813 () Bool)

(assert (=> b!689632 m!653813))

(assert (=> b!689632 m!653781))

(assert (=> b!689632 m!653811))

(assert (=> b!689632 m!653793))

(assert (=> b!689632 m!653801))

(declare-fun m!653815 () Bool)

(assert (=> b!689652 m!653815))

(declare-fun m!653817 () Bool)

(assert (=> b!689644 m!653817))

(declare-fun m!653819 () Bool)

(assert (=> b!689634 m!653819))

(declare-fun m!653821 () Bool)

(assert (=> b!689635 m!653821))

(declare-fun m!653823 () Bool)

(assert (=> b!689645 m!653823))

(declare-fun m!653825 () Bool)

(assert (=> b!689643 m!653825))

(declare-fun m!653827 () Bool)

(assert (=> b!689651 m!653827))

(assert (=> b!689647 m!653817))

(assert (=> b!689633 m!653819))

(check-sat (not b!689647) (not b!689651) (not b!689640) (not start!61644) (not b!689636) (not b!689644) (not b!689639) (not b!689635) (not b!689642) (not b!689634) (not b!689650) (not b!689631) (not b!689638) (not b!689645) (not b!689646) (not b!689652) (not b!689632) (not b!689643) (not b!689633))
(check-sat)
