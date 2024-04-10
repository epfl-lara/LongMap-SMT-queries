; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60026 () Bool)

(assert start!60026)

(declare-fun b!667553 () Bool)

(declare-fun e!382077 () Bool)

(declare-datatypes ((List!12770 0))(
  ( (Nil!12767) (Cons!12766 (h!13811 (_ BitVec 64)) (t!18998 List!12770)) )
))
(declare-fun lt!310866 () List!12770)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3347 (List!12770 (_ BitVec 64)) Bool)

(assert (=> b!667553 (= e!382077 (not (contains!3347 lt!310866 k!2843)))))

(declare-fun b!667554 () Bool)

(declare-datatypes ((Unit!23370 0))(
  ( (Unit!23371) )
))
(declare-fun e!382067 () Unit!23370)

(declare-fun Unit!23372 () Unit!23370)

(assert (=> b!667554 (= e!382067 Unit!23372)))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun lt!310872 () Unit!23370)

(declare-datatypes ((array!39073 0))(
  ( (array!39074 (arr!18729 (Array (_ BitVec 32) (_ BitVec 64))) (size!19093 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39073)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39073 (_ BitVec 64) (_ BitVec 32)) Unit!23370)

(assert (=> b!667554 (= lt!310872 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!667554 false))

(declare-fun b!667555 () Bool)

(declare-fun e!382075 () Unit!23370)

(declare-fun lt!310868 () Unit!23370)

(assert (=> b!667555 (= e!382075 lt!310868)))

(declare-fun lt!310867 () Unit!23370)

(declare-fun acc!681 () List!12770)

(declare-fun lemmaListSubSeqRefl!0 (List!12770) Unit!23370)

(assert (=> b!667555 (= lt!310867 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!86 (List!12770 List!12770) Bool)

(assert (=> b!667555 (subseq!86 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39073 List!12770 List!12770 (_ BitVec 32)) Unit!23370)

(declare-fun $colon$colon!218 (List!12770 (_ BitVec 64)) List!12770)

(assert (=> b!667555 (= lt!310868 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!218 acc!681 (select (arr!18729 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39073 (_ BitVec 32) List!12770) Bool)

(assert (=> b!667555 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!667556 () Bool)

(declare-fun e!382071 () Bool)

(assert (=> b!667556 (= e!382071 (contains!3347 lt!310866 k!2843))))

(declare-fun b!667557 () Bool)

(declare-fun res!434764 () Bool)

(declare-fun e!382068 () Bool)

(assert (=> b!667557 (=> (not res!434764) (not e!382068))))

(assert (=> b!667557 (= res!434764 (not (contains!3347 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667558 () Bool)

(declare-fun e!382076 () Bool)

(assert (=> b!667558 (= e!382076 (contains!3347 acc!681 k!2843))))

(declare-fun b!667559 () Bool)

(declare-fun res!434753 () Bool)

(declare-fun e!382069 () Bool)

(assert (=> b!667559 (=> res!434753 e!382069)))

(assert (=> b!667559 (= res!434753 (contains!3347 lt!310866 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667560 () Bool)

(declare-fun res!434755 () Bool)

(assert (=> b!667560 (=> (not res!434755) (not e!382068))))

(declare-fun e!382070 () Bool)

(assert (=> b!667560 (= res!434755 e!382070)))

(declare-fun res!434749 () Bool)

(assert (=> b!667560 (=> res!434749 e!382070)))

(assert (=> b!667560 (= res!434749 e!382076)))

(declare-fun res!434756 () Bool)

(assert (=> b!667560 (=> (not res!434756) (not e!382076))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!667560 (= res!434756 (bvsgt from!3004 i!1382))))

(declare-fun b!667561 () Bool)

(assert (=> b!667561 (= e!382069 true)))

(declare-fun lt!310865 () Bool)

(declare-fun e!382072 () Bool)

(assert (=> b!667561 (= lt!310865 e!382072)))

(declare-fun res!434757 () Bool)

(assert (=> b!667561 (=> res!434757 e!382072)))

(assert (=> b!667561 (= res!434757 e!382071)))

(declare-fun res!434761 () Bool)

(assert (=> b!667561 (=> (not res!434761) (not e!382071))))

(assert (=> b!667561 (= res!434761 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667562 () Bool)

(declare-fun res!434748 () Bool)

(assert (=> b!667562 (=> (not res!434748) (not e!382068))))

(declare-fun noDuplicate!594 (List!12770) Bool)

(assert (=> b!667562 (= res!434748 (noDuplicate!594 acc!681))))

(declare-fun b!667563 () Bool)

(declare-fun Unit!23373 () Unit!23370)

(assert (=> b!667563 (= e!382075 Unit!23373)))

(declare-fun res!434750 () Bool)

(assert (=> start!60026 (=> (not res!434750) (not e!382068))))

(assert (=> start!60026 (= res!434750 (and (bvslt (size!19093 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19093 a!3626))))))

(assert (=> start!60026 e!382068))

(assert (=> start!60026 true))

(declare-fun array_inv!14525 (array!39073) Bool)

(assert (=> start!60026 (array_inv!14525 a!3626)))

(declare-fun b!667564 () Bool)

(declare-fun res!434760 () Bool)

(assert (=> b!667564 (=> res!434760 e!382069)))

(assert (=> b!667564 (= res!434760 (contains!3347 lt!310866 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667565 () Bool)

(declare-fun res!434747 () Bool)

(assert (=> b!667565 (=> (not res!434747) (not e!382068))))

(declare-fun arrayContainsKey!0 (array!39073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!667565 (= res!434747 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!667566 () Bool)

(assert (=> b!667566 (= e!382072 e!382077)))

(declare-fun res!434759 () Bool)

(assert (=> b!667566 (=> (not res!434759) (not e!382077))))

(assert (=> b!667566 (= res!434759 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667567 () Bool)

(declare-fun res!434762 () Bool)

(assert (=> b!667567 (=> (not res!434762) (not e!382068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!667567 (= res!434762 (validKeyInArray!0 k!2843))))

(declare-fun b!667568 () Bool)

(declare-fun res!434758 () Bool)

(assert (=> b!667568 (=> (not res!434758) (not e!382068))))

(assert (=> b!667568 (= res!434758 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19093 a!3626))))))

(declare-fun b!667569 () Bool)

(assert (=> b!667569 (= e!382068 (not e!382069))))

(declare-fun res!434754 () Bool)

(assert (=> b!667569 (=> res!434754 e!382069)))

(assert (=> b!667569 (= res!434754 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!667569 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!310866)))

(declare-fun lt!310869 () Unit!23370)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39073 (_ BitVec 64) (_ BitVec 32) List!12770 List!12770) Unit!23370)

(assert (=> b!667569 (= lt!310869 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!310866))))

(declare-fun -!84 (List!12770 (_ BitVec 64)) List!12770)

(assert (=> b!667569 (= (-!84 lt!310866 k!2843) acc!681)))

(assert (=> b!667569 (= lt!310866 ($colon$colon!218 acc!681 k!2843))))

(declare-fun lt!310871 () Unit!23370)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12770) Unit!23370)

(assert (=> b!667569 (= lt!310871 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!667569 (subseq!86 acc!681 acc!681)))

(declare-fun lt!310870 () Unit!23370)

(assert (=> b!667569 (= lt!310870 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667569 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310873 () Unit!23370)

(assert (=> b!667569 (= lt!310873 e!382075)))

(declare-fun c!76772 () Bool)

(assert (=> b!667569 (= c!76772 (validKeyInArray!0 (select (arr!18729 a!3626) from!3004)))))

(declare-fun lt!310864 () Unit!23370)

(assert (=> b!667569 (= lt!310864 e!382067)))

(declare-fun c!76771 () Bool)

(assert (=> b!667569 (= c!76771 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667569 (arrayContainsKey!0 (array!39074 (store (arr!18729 a!3626) i!1382 k!2843) (size!19093 a!3626)) k!2843 from!3004)))

(declare-fun b!667570 () Bool)

(declare-fun res!434751 () Bool)

(assert (=> b!667570 (=> (not res!434751) (not e!382068))))

(assert (=> b!667570 (= res!434751 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!667571 () Bool)

(declare-fun e!382074 () Bool)

(assert (=> b!667571 (= e!382070 e!382074)))

(declare-fun res!434765 () Bool)

(assert (=> b!667571 (=> (not res!434765) (not e!382074))))

(assert (=> b!667571 (= res!434765 (bvsle from!3004 i!1382))))

(declare-fun b!667572 () Bool)

(declare-fun Unit!23374 () Unit!23370)

(assert (=> b!667572 (= e!382067 Unit!23374)))

(declare-fun b!667573 () Bool)

(declare-fun res!434746 () Bool)

(assert (=> b!667573 (=> (not res!434746) (not e!382068))))

(assert (=> b!667573 (= res!434746 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12767))))

(declare-fun b!667574 () Bool)

(declare-fun res!434752 () Bool)

(assert (=> b!667574 (=> (not res!434752) (not e!382068))))

(assert (=> b!667574 (= res!434752 (not (contains!3347 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667575 () Bool)

(declare-fun res!434745 () Bool)

(assert (=> b!667575 (=> res!434745 e!382069)))

(assert (=> b!667575 (= res!434745 (not (noDuplicate!594 lt!310866)))))

(declare-fun b!667576 () Bool)

(declare-fun res!434763 () Bool)

(assert (=> b!667576 (=> (not res!434763) (not e!382068))))

(assert (=> b!667576 (= res!434763 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19093 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!667577 () Bool)

(assert (=> b!667577 (= e!382074 (not (contains!3347 acc!681 k!2843)))))

(assert (= (and start!60026 res!434750) b!667562))

(assert (= (and b!667562 res!434748) b!667557))

(assert (= (and b!667557 res!434764) b!667574))

(assert (= (and b!667574 res!434752) b!667560))

(assert (= (and b!667560 res!434756) b!667558))

(assert (= (and b!667560 (not res!434749)) b!667571))

(assert (= (and b!667571 res!434765) b!667577))

(assert (= (and b!667560 res!434755) b!667573))

(assert (= (and b!667573 res!434746) b!667570))

(assert (= (and b!667570 res!434751) b!667568))

(assert (= (and b!667568 res!434758) b!667567))

(assert (= (and b!667567 res!434762) b!667565))

(assert (= (and b!667565 res!434747) b!667576))

(assert (= (and b!667576 res!434763) b!667569))

(assert (= (and b!667569 c!76771) b!667554))

(assert (= (and b!667569 (not c!76771)) b!667572))

(assert (= (and b!667569 c!76772) b!667555))

(assert (= (and b!667569 (not c!76772)) b!667563))

(assert (= (and b!667569 (not res!434754)) b!667575))

(assert (= (and b!667575 (not res!434745)) b!667559))

(assert (= (and b!667559 (not res!434753)) b!667564))

(assert (= (and b!667564 (not res!434760)) b!667561))

(assert (= (and b!667561 res!434761) b!667556))

(assert (= (and b!667561 (not res!434757)) b!667566))

(assert (= (and b!667566 res!434759) b!667553))

(declare-fun m!638075 () Bool)

(assert (=> b!667570 m!638075))

(declare-fun m!638077 () Bool)

(assert (=> b!667569 m!638077))

(declare-fun m!638079 () Bool)

(assert (=> b!667569 m!638079))

(declare-fun m!638081 () Bool)

(assert (=> b!667569 m!638081))

(declare-fun m!638083 () Bool)

(assert (=> b!667569 m!638083))

(declare-fun m!638085 () Bool)

(assert (=> b!667569 m!638085))

(declare-fun m!638087 () Bool)

(assert (=> b!667569 m!638087))

(declare-fun m!638089 () Bool)

(assert (=> b!667569 m!638089))

(declare-fun m!638091 () Bool)

(assert (=> b!667569 m!638091))

(assert (=> b!667569 m!638079))

(declare-fun m!638093 () Bool)

(assert (=> b!667569 m!638093))

(declare-fun m!638095 () Bool)

(assert (=> b!667569 m!638095))

(declare-fun m!638097 () Bool)

(assert (=> b!667569 m!638097))

(declare-fun m!638099 () Bool)

(assert (=> b!667569 m!638099))

(declare-fun m!638101 () Bool)

(assert (=> b!667569 m!638101))

(declare-fun m!638103 () Bool)

(assert (=> b!667575 m!638103))

(declare-fun m!638105 () Bool)

(assert (=> b!667567 m!638105))

(declare-fun m!638107 () Bool)

(assert (=> b!667564 m!638107))

(declare-fun m!638109 () Bool)

(assert (=> b!667558 m!638109))

(declare-fun m!638111 () Bool)

(assert (=> start!60026 m!638111))

(assert (=> b!667555 m!638077))

(assert (=> b!667555 m!638079))

(declare-fun m!638113 () Bool)

(assert (=> b!667555 m!638113))

(declare-fun m!638115 () Bool)

(assert (=> b!667555 m!638115))

(assert (=> b!667555 m!638079))

(assert (=> b!667555 m!638113))

(assert (=> b!667555 m!638085))

(assert (=> b!667555 m!638101))

(declare-fun m!638117 () Bool)

(assert (=> b!667565 m!638117))

(assert (=> b!667577 m!638109))

(declare-fun m!638119 () Bool)

(assert (=> b!667574 m!638119))

(declare-fun m!638121 () Bool)

(assert (=> b!667553 m!638121))

(declare-fun m!638123 () Bool)

(assert (=> b!667557 m!638123))

(declare-fun m!638125 () Bool)

(assert (=> b!667554 m!638125))

(assert (=> b!667556 m!638121))

(declare-fun m!638127 () Bool)

(assert (=> b!667562 m!638127))

(declare-fun m!638129 () Bool)

(assert (=> b!667573 m!638129))

(declare-fun m!638131 () Bool)

(assert (=> b!667559 m!638131))

(push 1)

(assert (not b!667577))

(assert (not b!667573))

(assert (not b!667555))

(assert (not b!667553))

(assert (not b!667574))

(assert (not b!667569))

(assert (not b!667570))

(assert (not b!667557))

(assert (not b!667564))

(assert (not b!667559))

(assert (not b!667558))

(assert (not b!667567))

(assert (not b!667562))

(assert (not b!667575))

(assert (not b!667565))

(assert (not b!667556))

(assert (not start!60026))

(assert (not b!667554))

(check-sat)

(pop 1)

