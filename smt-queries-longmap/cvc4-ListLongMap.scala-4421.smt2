; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61176 () Bool)

(assert start!61176)

(declare-fun b!685609 () Bool)

(declare-datatypes ((Unit!24142 0))(
  ( (Unit!24143) )
))
(declare-fun e!390456 () Unit!24142)

(declare-fun Unit!24144 () Unit!24142)

(assert (=> b!685609 (= e!390456 Unit!24144)))

(declare-fun b!685610 () Bool)

(declare-fun res!450932 () Bool)

(declare-fun e!390461 () Bool)

(assert (=> b!685610 (=> (not res!450932) (not e!390461))))

(declare-fun e!390458 () Bool)

(assert (=> b!685610 (= res!450932 e!390458)))

(declare-fun res!450936 () Bool)

(assert (=> b!685610 (=> res!450936 e!390458)))

(declare-fun e!390455 () Bool)

(assert (=> b!685610 (= res!450936 e!390455)))

(declare-fun res!450929 () Bool)

(assert (=> b!685610 (=> (not res!450929) (not e!390455))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!685610 (= res!450929 (bvsgt from!3004 i!1382))))

(declare-fun b!685611 () Bool)

(declare-fun e!390460 () Bool)

(assert (=> b!685611 (= e!390458 e!390460)))

(declare-fun res!450924 () Bool)

(assert (=> b!685611 (=> (not res!450924) (not e!390460))))

(assert (=> b!685611 (= res!450924 (bvsle from!3004 i!1382))))

(declare-fun b!685612 () Bool)

(declare-fun e!390457 () Unit!24142)

(declare-fun lt!314727 () Unit!24142)

(assert (=> b!685612 (= e!390457 lt!314727)))

(declare-fun lt!314731 () Unit!24142)

(declare-datatypes ((List!13036 0))(
  ( (Nil!13033) (Cons!13032 (h!14077 (_ BitVec 64)) (t!19288 List!13036)) )
))
(declare-fun acc!681 () List!13036)

(declare-fun lemmaListSubSeqRefl!0 (List!13036) Unit!24142)

(assert (=> b!685612 (= lt!314731 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!199 (List!13036 List!13036) Bool)

(assert (=> b!685612 (subseq!199 acc!681 acc!681)))

(declare-datatypes ((array!39635 0))(
  ( (array!39636 (arr!18995 (Array (_ BitVec 32) (_ BitVec 64))) (size!19367 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39635)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39635 List!13036 List!13036 (_ BitVec 32)) Unit!24142)

(declare-fun $colon$colon!364 (List!13036 (_ BitVec 64)) List!13036)

(assert (=> b!685612 (= lt!314727 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!364 acc!681 (select (arr!18995 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun arrayNoDuplicates!0 (array!39635 (_ BitVec 32) List!13036) Bool)

(assert (=> b!685612 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!685613 () Bool)

(declare-fun e!390462 () Bool)

(assert (=> b!685613 (= e!390462 true)))

(declare-fun lt!314723 () Bool)

(declare-fun lt!314725 () List!13036)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3613 (List!13036 (_ BitVec 64)) Bool)

(assert (=> b!685613 (= lt!314723 (contains!3613 lt!314725 k!2843))))

(declare-fun b!685614 () Bool)

(declare-fun Unit!24145 () Unit!24142)

(assert (=> b!685614 (= e!390456 Unit!24145)))

(declare-fun lt!314722 () Unit!24142)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39635 (_ BitVec 64) (_ BitVec 32)) Unit!24142)

(assert (=> b!685614 (= lt!314722 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!685614 false))

(declare-fun b!685615 () Bool)

(declare-fun res!450925 () Bool)

(assert (=> b!685615 (=> (not res!450925) (not e!390461))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!685615 (= res!450925 (validKeyInArray!0 k!2843))))

(declare-fun res!450930 () Bool)

(assert (=> start!61176 (=> (not res!450930) (not e!390461))))

(assert (=> start!61176 (= res!450930 (and (bvslt (size!19367 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19367 a!3626))))))

(assert (=> start!61176 e!390461))

(assert (=> start!61176 true))

(declare-fun array_inv!14791 (array!39635) Bool)

(assert (=> start!61176 (array_inv!14791 a!3626)))

(declare-fun b!685616 () Bool)

(declare-fun res!450940 () Bool)

(assert (=> b!685616 (=> (not res!450940) (not e!390461))))

(assert (=> b!685616 (= res!450940 (not (contains!3613 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685617 () Bool)

(declare-fun res!450926 () Bool)

(assert (=> b!685617 (=> (not res!450926) (not e!390461))))

(assert (=> b!685617 (= res!450926 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19367 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!685618 () Bool)

(declare-fun res!450935 () Bool)

(assert (=> b!685618 (=> res!450935 e!390462)))

(assert (=> b!685618 (= res!450935 (not (subseq!199 acc!681 lt!314725)))))

(declare-fun b!685619 () Bool)

(declare-fun Unit!24146 () Unit!24142)

(assert (=> b!685619 (= e!390457 Unit!24146)))

(declare-fun b!685620 () Bool)

(declare-fun res!450931 () Bool)

(assert (=> b!685620 (=> (not res!450931) (not e!390461))))

(assert (=> b!685620 (= res!450931 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!685621 () Bool)

(declare-fun res!450939 () Bool)

(assert (=> b!685621 (=> res!450939 e!390462)))

(declare-fun noDuplicate!860 (List!13036) Bool)

(assert (=> b!685621 (= res!450939 (not (noDuplicate!860 lt!314725)))))

(declare-fun b!685622 () Bool)

(declare-fun res!450937 () Bool)

(assert (=> b!685622 (=> (not res!450937) (not e!390461))))

(declare-fun arrayContainsKey!0 (array!39635 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!685622 (= res!450937 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!685623 () Bool)

(declare-fun res!450927 () Bool)

(assert (=> b!685623 (=> (not res!450927) (not e!390461))))

(assert (=> b!685623 (= res!450927 (not (contains!3613 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685624 () Bool)

(assert (=> b!685624 (= e!390455 (contains!3613 acc!681 k!2843))))

(declare-fun b!685625 () Bool)

(declare-fun res!450923 () Bool)

(assert (=> b!685625 (=> res!450923 e!390462)))

(declare-fun lt!314728 () Bool)

(assert (=> b!685625 (= res!450923 lt!314728)))

(declare-fun b!685626 () Bool)

(declare-fun res!450941 () Bool)

(assert (=> b!685626 (=> (not res!450941) (not e!390461))))

(assert (=> b!685626 (= res!450941 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19367 a!3626))))))

(declare-fun b!685627 () Bool)

(assert (=> b!685627 (= e!390461 (not e!390462))))

(declare-fun res!450938 () Bool)

(assert (=> b!685627 (=> res!450938 e!390462)))

(assert (=> b!685627 (= res!450938 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!164 (List!13036 (_ BitVec 64)) List!13036)

(assert (=> b!685627 (= (-!164 lt!314725 k!2843) acc!681)))

(assert (=> b!685627 (= lt!314725 ($colon$colon!364 acc!681 k!2843))))

(declare-fun lt!314726 () Unit!24142)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13036) Unit!24142)

(assert (=> b!685627 (= lt!314726 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!685627 (subseq!199 acc!681 acc!681)))

(declare-fun lt!314730 () Unit!24142)

(assert (=> b!685627 (= lt!314730 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!685627 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314724 () Unit!24142)

(assert (=> b!685627 (= lt!314724 e!390457)))

(declare-fun c!77711 () Bool)

(assert (=> b!685627 (= c!77711 (validKeyInArray!0 (select (arr!18995 a!3626) from!3004)))))

(declare-fun lt!314729 () Unit!24142)

(assert (=> b!685627 (= lt!314729 e!390456)))

(declare-fun c!77710 () Bool)

(assert (=> b!685627 (= c!77710 lt!314728)))

(assert (=> b!685627 (= lt!314728 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!685627 (arrayContainsKey!0 (array!39636 (store (arr!18995 a!3626) i!1382 k!2843) (size!19367 a!3626)) k!2843 from!3004)))

(declare-fun b!685628 () Bool)

(declare-fun res!450928 () Bool)

(assert (=> b!685628 (=> res!450928 e!390462)))

(assert (=> b!685628 (= res!450928 (contains!3613 acc!681 k!2843))))

(declare-fun b!685629 () Bool)

(declare-fun res!450933 () Bool)

(assert (=> b!685629 (=> (not res!450933) (not e!390461))))

(assert (=> b!685629 (= res!450933 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13033))))

(declare-fun b!685630 () Bool)

(declare-fun res!450934 () Bool)

(assert (=> b!685630 (=> (not res!450934) (not e!390461))))

(assert (=> b!685630 (= res!450934 (noDuplicate!860 acc!681))))

(declare-fun b!685631 () Bool)

(assert (=> b!685631 (= e!390460 (not (contains!3613 acc!681 k!2843)))))

(assert (= (and start!61176 res!450930) b!685630))

(assert (= (and b!685630 res!450934) b!685616))

(assert (= (and b!685616 res!450940) b!685623))

(assert (= (and b!685623 res!450927) b!685610))

(assert (= (and b!685610 res!450929) b!685624))

(assert (= (and b!685610 (not res!450936)) b!685611))

(assert (= (and b!685611 res!450924) b!685631))

(assert (= (and b!685610 res!450932) b!685629))

(assert (= (and b!685629 res!450933) b!685620))

(assert (= (and b!685620 res!450931) b!685626))

(assert (= (and b!685626 res!450941) b!685615))

(assert (= (and b!685615 res!450925) b!685622))

(assert (= (and b!685622 res!450937) b!685617))

(assert (= (and b!685617 res!450926) b!685627))

(assert (= (and b!685627 c!77710) b!685614))

(assert (= (and b!685627 (not c!77710)) b!685609))

(assert (= (and b!685627 c!77711) b!685612))

(assert (= (and b!685627 (not c!77711)) b!685619))

(assert (= (and b!685627 (not res!450938)) b!685621))

(assert (= (and b!685621 (not res!450939)) b!685625))

(assert (= (and b!685625 (not res!450923)) b!685628))

(assert (= (and b!685628 (not res!450928)) b!685618))

(assert (= (and b!685618 (not res!450935)) b!685613))

(declare-fun m!649783 () Bool)

(assert (=> b!685614 m!649783))

(declare-fun m!649785 () Bool)

(assert (=> b!685620 m!649785))

(declare-fun m!649787 () Bool)

(assert (=> start!61176 m!649787))

(declare-fun m!649789 () Bool)

(assert (=> b!685616 m!649789))

(declare-fun m!649791 () Bool)

(assert (=> b!685629 m!649791))

(declare-fun m!649793 () Bool)

(assert (=> b!685627 m!649793))

(declare-fun m!649795 () Bool)

(assert (=> b!685627 m!649795))

(declare-fun m!649797 () Bool)

(assert (=> b!685627 m!649797))

(declare-fun m!649799 () Bool)

(assert (=> b!685627 m!649799))

(declare-fun m!649801 () Bool)

(assert (=> b!685627 m!649801))

(declare-fun m!649803 () Bool)

(assert (=> b!685627 m!649803))

(declare-fun m!649805 () Bool)

(assert (=> b!685627 m!649805))

(declare-fun m!649807 () Bool)

(assert (=> b!685627 m!649807))

(assert (=> b!685627 m!649795))

(declare-fun m!649809 () Bool)

(assert (=> b!685627 m!649809))

(declare-fun m!649811 () Bool)

(assert (=> b!685627 m!649811))

(declare-fun m!649813 () Bool)

(assert (=> b!685627 m!649813))

(declare-fun m!649815 () Bool)

(assert (=> b!685630 m!649815))

(declare-fun m!649817 () Bool)

(assert (=> b!685628 m!649817))

(assert (=> b!685612 m!649793))

(assert (=> b!685612 m!649795))

(declare-fun m!649819 () Bool)

(assert (=> b!685612 m!649819))

(declare-fun m!649821 () Bool)

(assert (=> b!685612 m!649821))

(assert (=> b!685612 m!649795))

(assert (=> b!685612 m!649819))

(assert (=> b!685612 m!649803))

(assert (=> b!685612 m!649813))

(declare-fun m!649823 () Bool)

(assert (=> b!685623 m!649823))

(declare-fun m!649825 () Bool)

(assert (=> b!685615 m!649825))

(declare-fun m!649827 () Bool)

(assert (=> b!685613 m!649827))

(assert (=> b!685624 m!649817))

(declare-fun m!649829 () Bool)

(assert (=> b!685621 m!649829))

(declare-fun m!649831 () Bool)

(assert (=> b!685622 m!649831))

(assert (=> b!685631 m!649817))

(declare-fun m!649833 () Bool)

(assert (=> b!685618 m!649833))

(push 1)

(assert (not b!685613))

(assert (not b!685623))

(assert (not b!685615))

(assert (not b!685620))

(assert (not b!685630))

(assert (not b!685628))

(assert (not b!685631))

(assert (not b!685612))

(assert (not b!685629))

(assert (not start!61176))

(assert (not b!685614))

(assert (not b!685618))

(assert (not b!685622))

(assert (not b!685627))

(assert (not b!685624))

(assert (not b!685616))

(assert (not b!685621))

(check-sat)

