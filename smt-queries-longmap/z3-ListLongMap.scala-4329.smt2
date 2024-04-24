; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60060 () Bool)

(assert start!60060)

(declare-fun b!666877 () Bool)

(declare-fun res!434103 () Bool)

(declare-fun e!381889 () Bool)

(assert (=> b!666877 (=> res!434103 e!381889)))

(declare-fun lt!310606 () Bool)

(assert (=> b!666877 (= res!434103 lt!310606)))

(declare-fun b!666878 () Bool)

(declare-fun e!381892 () Bool)

(assert (=> b!666878 (= e!381892 (not e!381889))))

(declare-fun res!434106 () Bool)

(assert (=> b!666878 (=> res!434106 e!381889)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!666878 (= res!434106 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((List!12660 0))(
  ( (Nil!12657) (Cons!12656 (h!13704 (_ BitVec 64)) (t!18880 List!12660)) )
))
(declare-fun lt!310610 () List!12660)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun acc!681 () List!12660)

(declare-fun -!71 (List!12660 (_ BitVec 64)) List!12660)

(assert (=> b!666878 (= (-!71 lt!310610 k0!2843) acc!681)))

(declare-fun $colon$colon!203 (List!12660 (_ BitVec 64)) List!12660)

(assert (=> b!666878 (= lt!310610 ($colon$colon!203 acc!681 k0!2843))))

(declare-datatypes ((Unit!23289 0))(
  ( (Unit!23290) )
))
(declare-fun lt!310611 () Unit!23289)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12660) Unit!23289)

(assert (=> b!666878 (= lt!310611 (lemmaLMinusHeadEqualsTail!0 k0!2843 acc!681))))

(declare-fun subseq!74 (List!12660 List!12660) Bool)

(assert (=> b!666878 (subseq!74 acc!681 acc!681)))

(declare-fun lt!310613 () Unit!23289)

(declare-fun lemmaListSubSeqRefl!0 (List!12660) Unit!23289)

(assert (=> b!666878 (= lt!310613 (lemmaListSubSeqRefl!0 acc!681))))

(declare-datatypes ((array!39045 0))(
  ( (array!39046 (arr!18712 (Array (_ BitVec 32) (_ BitVec 64))) (size!19076 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39045)

(declare-fun arrayNoDuplicates!0 (array!39045 (_ BitVec 32) List!12660) Bool)

(assert (=> b!666878 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310607 () Unit!23289)

(declare-fun e!381891 () Unit!23289)

(assert (=> b!666878 (= lt!310607 e!381891)))

(declare-fun c!76756 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!666878 (= c!76756 (validKeyInArray!0 (select (arr!18712 a!3626) from!3004)))))

(declare-fun lt!310614 () Unit!23289)

(declare-fun e!381890 () Unit!23289)

(assert (=> b!666878 (= lt!310614 e!381890)))

(declare-fun c!76757 () Bool)

(assert (=> b!666878 (= c!76757 lt!310606)))

(declare-fun arrayContainsKey!0 (array!39045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!666878 (= lt!310606 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!666878 (arrayContainsKey!0 (array!39046 (store (arr!18712 a!3626) i!1382 k0!2843) (size!19076 a!3626)) k0!2843 from!3004)))

(declare-fun b!666879 () Bool)

(declare-fun Unit!23291 () Unit!23289)

(assert (=> b!666879 (= e!381891 Unit!23291)))

(declare-fun b!666880 () Bool)

(declare-fun e!381894 () Bool)

(declare-fun contains!3312 (List!12660 (_ BitVec 64)) Bool)

(assert (=> b!666880 (= e!381894 (not (contains!3312 acc!681 k0!2843)))))

(declare-fun b!666881 () Bool)

(declare-fun res!434112 () Bool)

(assert (=> b!666881 (=> (not res!434112) (not e!381892))))

(assert (=> b!666881 (= res!434112 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19076 a!3626))))))

(declare-fun b!666882 () Bool)

(declare-fun res!434114 () Bool)

(assert (=> b!666882 (=> (not res!434114) (not e!381892))))

(declare-fun e!381887 () Bool)

(assert (=> b!666882 (= res!434114 e!381887)))

(declare-fun res!434118 () Bool)

(assert (=> b!666882 (=> res!434118 e!381887)))

(declare-fun e!381888 () Bool)

(assert (=> b!666882 (= res!434118 e!381888)))

(declare-fun res!434109 () Bool)

(assert (=> b!666882 (=> (not res!434109) (not e!381888))))

(assert (=> b!666882 (= res!434109 (bvsgt from!3004 i!1382))))

(declare-fun b!666883 () Bool)

(declare-fun res!434113 () Bool)

(assert (=> b!666883 (=> (not res!434113) (not e!381892))))

(assert (=> b!666883 (= res!434113 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!666884 () Bool)

(declare-fun res!434111 () Bool)

(assert (=> b!666884 (=> res!434111 e!381889)))

(assert (=> b!666884 (= res!434111 (not (subseq!74 acc!681 lt!310610)))))

(declare-fun b!666885 () Bool)

(declare-fun res!434120 () Bool)

(assert (=> b!666885 (=> res!434120 e!381889)))

(assert (=> b!666885 (= res!434120 (not (contains!3312 lt!310610 k0!2843)))))

(declare-fun b!666886 () Bool)

(assert (=> b!666886 (= e!381889 true)))

(declare-fun lt!310612 () Bool)

(assert (=> b!666886 (= lt!310612 (contains!3312 lt!310610 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666887 () Bool)

(declare-fun res!434102 () Bool)

(assert (=> b!666887 (=> (not res!434102) (not e!381892))))

(assert (=> b!666887 (= res!434102 (validKeyInArray!0 k0!2843))))

(declare-fun b!666889 () Bool)

(declare-fun res!434122 () Bool)

(assert (=> b!666889 (=> (not res!434122) (not e!381892))))

(declare-fun noDuplicate!586 (List!12660) Bool)

(assert (=> b!666889 (= res!434122 (noDuplicate!586 acc!681))))

(declare-fun b!666890 () Bool)

(declare-fun res!434119 () Bool)

(assert (=> b!666890 (=> (not res!434119) (not e!381892))))

(assert (=> b!666890 (= res!434119 (not (contains!3312 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666891 () Bool)

(declare-fun lt!310608 () Unit!23289)

(assert (=> b!666891 (= e!381891 lt!310608)))

(declare-fun lt!310609 () Unit!23289)

(assert (=> b!666891 (= lt!310609 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!666891 (subseq!74 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39045 List!12660 List!12660 (_ BitVec 32)) Unit!23289)

(assert (=> b!666891 (= lt!310608 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!203 acc!681 (select (arr!18712 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!666891 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!666892 () Bool)

(declare-fun res!434104 () Bool)

(assert (=> b!666892 (=> res!434104 e!381889)))

(assert (=> b!666892 (= res!434104 (not (noDuplicate!586 lt!310610)))))

(declare-fun b!666893 () Bool)

(declare-fun res!434117 () Bool)

(assert (=> b!666893 (=> (not res!434117) (not e!381892))))

(assert (=> b!666893 (= res!434117 (not (contains!3312 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!666894 () Bool)

(declare-fun res!434107 () Bool)

(assert (=> b!666894 (=> (not res!434107) (not e!381892))))

(assert (=> b!666894 (= res!434107 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!666895 () Bool)

(declare-fun Unit!23292 () Unit!23289)

(assert (=> b!666895 (= e!381890 Unit!23292)))

(declare-fun lt!310615 () Unit!23289)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39045 (_ BitVec 64) (_ BitVec 32)) Unit!23289)

(assert (=> b!666895 (= lt!310615 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!666895 false))

(declare-fun b!666896 () Bool)

(declare-fun res!434110 () Bool)

(assert (=> b!666896 (=> (not res!434110) (not e!381892))))

(assert (=> b!666896 (= res!434110 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19076 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!666897 () Bool)

(declare-fun res!434105 () Bool)

(assert (=> b!666897 (=> (not res!434105) (not e!381892))))

(assert (=> b!666897 (= res!434105 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12657))))

(declare-fun res!434108 () Bool)

(assert (=> start!60060 (=> (not res!434108) (not e!381892))))

(assert (=> start!60060 (= res!434108 (and (bvslt (size!19076 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19076 a!3626))))))

(assert (=> start!60060 e!381892))

(assert (=> start!60060 true))

(declare-fun array_inv!14571 (array!39045) Bool)

(assert (=> start!60060 (array_inv!14571 a!3626)))

(declare-fun b!666888 () Bool)

(assert (=> b!666888 (= e!381888 (contains!3312 acc!681 k0!2843))))

(declare-fun b!666898 () Bool)

(declare-fun Unit!23293 () Unit!23289)

(assert (=> b!666898 (= e!381890 Unit!23293)))

(declare-fun b!666899 () Bool)

(declare-fun res!434116 () Bool)

(assert (=> b!666899 (=> res!434116 e!381889)))

(assert (=> b!666899 (= res!434116 (contains!3312 lt!310610 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!666900 () Bool)

(declare-fun res!434115 () Bool)

(assert (=> b!666900 (=> res!434115 e!381889)))

(assert (=> b!666900 (= res!434115 (contains!3312 acc!681 k0!2843))))

(declare-fun b!666901 () Bool)

(assert (=> b!666901 (= e!381887 e!381894)))

(declare-fun res!434121 () Bool)

(assert (=> b!666901 (=> (not res!434121) (not e!381894))))

(assert (=> b!666901 (= res!434121 (bvsle from!3004 i!1382))))

(assert (= (and start!60060 res!434108) b!666889))

(assert (= (and b!666889 res!434122) b!666890))

(assert (= (and b!666890 res!434119) b!666893))

(assert (= (and b!666893 res!434117) b!666882))

(assert (= (and b!666882 res!434109) b!666888))

(assert (= (and b!666882 (not res!434118)) b!666901))

(assert (= (and b!666901 res!434121) b!666880))

(assert (= (and b!666882 res!434114) b!666897))

(assert (= (and b!666897 res!434105) b!666883))

(assert (= (and b!666883 res!434113) b!666881))

(assert (= (and b!666881 res!434112) b!666887))

(assert (= (and b!666887 res!434102) b!666894))

(assert (= (and b!666894 res!434107) b!666896))

(assert (= (and b!666896 res!434110) b!666878))

(assert (= (and b!666878 c!76757) b!666895))

(assert (= (and b!666878 (not c!76757)) b!666898))

(assert (= (and b!666878 c!76756) b!666891))

(assert (= (and b!666878 (not c!76756)) b!666879))

(assert (= (and b!666878 (not res!434106)) b!666892))

(assert (= (and b!666892 (not res!434104)) b!666877))

(assert (= (and b!666877 (not res!434103)) b!666900))

(assert (= (and b!666900 (not res!434115)) b!666884))

(assert (= (and b!666884 (not res!434111)) b!666885))

(assert (= (and b!666885 (not res!434120)) b!666899))

(assert (= (and b!666899 (not res!434116)) b!666886))

(declare-fun m!638095 () Bool)

(assert (=> start!60060 m!638095))

(declare-fun m!638097 () Bool)

(assert (=> b!666893 m!638097))

(declare-fun m!638099 () Bool)

(assert (=> b!666880 m!638099))

(assert (=> b!666888 m!638099))

(declare-fun m!638101 () Bool)

(assert (=> b!666886 m!638101))

(declare-fun m!638103 () Bool)

(assert (=> b!666883 m!638103))

(declare-fun m!638105 () Bool)

(assert (=> b!666895 m!638105))

(declare-fun m!638107 () Bool)

(assert (=> b!666878 m!638107))

(declare-fun m!638109 () Bool)

(assert (=> b!666878 m!638109))

(declare-fun m!638111 () Bool)

(assert (=> b!666878 m!638111))

(declare-fun m!638113 () Bool)

(assert (=> b!666878 m!638113))

(declare-fun m!638115 () Bool)

(assert (=> b!666878 m!638115))

(declare-fun m!638117 () Bool)

(assert (=> b!666878 m!638117))

(declare-fun m!638119 () Bool)

(assert (=> b!666878 m!638119))

(declare-fun m!638121 () Bool)

(assert (=> b!666878 m!638121))

(assert (=> b!666878 m!638109))

(declare-fun m!638123 () Bool)

(assert (=> b!666878 m!638123))

(declare-fun m!638125 () Bool)

(assert (=> b!666878 m!638125))

(declare-fun m!638127 () Bool)

(assert (=> b!666878 m!638127))

(declare-fun m!638129 () Bool)

(assert (=> b!666885 m!638129))

(declare-fun m!638131 () Bool)

(assert (=> b!666892 m!638131))

(declare-fun m!638133 () Bool)

(assert (=> b!666897 m!638133))

(declare-fun m!638135 () Bool)

(assert (=> b!666899 m!638135))

(assert (=> b!666900 m!638099))

(assert (=> b!666891 m!638107))

(assert (=> b!666891 m!638109))

(declare-fun m!638137 () Bool)

(assert (=> b!666891 m!638137))

(declare-fun m!638139 () Bool)

(assert (=> b!666891 m!638139))

(assert (=> b!666891 m!638109))

(assert (=> b!666891 m!638137))

(assert (=> b!666891 m!638115))

(assert (=> b!666891 m!638127))

(declare-fun m!638141 () Bool)

(assert (=> b!666889 m!638141))

(declare-fun m!638143 () Bool)

(assert (=> b!666894 m!638143))

(declare-fun m!638145 () Bool)

(assert (=> b!666884 m!638145))

(declare-fun m!638147 () Bool)

(assert (=> b!666887 m!638147))

(declare-fun m!638149 () Bool)

(assert (=> b!666890 m!638149))

(check-sat (not b!666878) (not b!666885) (not b!666889) (not b!666897) (not b!666891) (not b!666888) (not b!666890) (not b!666892) (not b!666893) (not b!666880) (not b!666884) (not b!666894) (not b!666895) (not b!666900) (not b!666886) (not b!666899) (not b!666887) (not start!60060) (not b!666883))
(check-sat)
