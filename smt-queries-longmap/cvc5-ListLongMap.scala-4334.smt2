; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60032 () Bool)

(assert start!60032)

(declare-fun b!667778 () Bool)

(declare-fun res!434946 () Bool)

(declare-fun e!382168 () Bool)

(assert (=> b!667778 (=> (not res!434946) (not e!382168))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39079 0))(
  ( (array!39080 (arr!18732 (Array (_ BitVec 32) (_ BitVec 64))) (size!19096 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39079)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!667778 (= res!434946 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19096 a!3626)) (= from!3004 i!1382)))))

(declare-fun res!434934 () Bool)

(assert (=> start!60032 (=> (not res!434934) (not e!382168))))

(assert (=> start!60032 (= res!434934 (and (bvslt (size!19096 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19096 a!3626))))))

(assert (=> start!60032 e!382168))

(assert (=> start!60032 true))

(declare-fun array_inv!14528 (array!39079) Bool)

(assert (=> start!60032 (array_inv!14528 a!3626)))

(declare-fun b!667779 () Bool)

(declare-fun e!382176 () Bool)

(declare-datatypes ((List!12773 0))(
  ( (Nil!12770) (Cons!12769 (h!13814 (_ BitVec 64)) (t!19001 List!12773)) )
))
(declare-fun acc!681 () List!12773)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3350 (List!12773 (_ BitVec 64)) Bool)

(assert (=> b!667779 (= e!382176 (not (contains!3350 acc!681 k!2843)))))

(declare-fun b!667780 () Bool)

(declare-fun res!434947 () Bool)

(assert (=> b!667780 (=> (not res!434947) (not e!382168))))

(assert (=> b!667780 (= res!434947 (not (contains!3350 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667781 () Bool)

(declare-fun res!434952 () Bool)

(declare-fun e!382167 () Bool)

(assert (=> b!667781 (=> res!434952 e!382167)))

(declare-fun lt!310956 () List!12773)

(assert (=> b!667781 (= res!434952 (contains!3350 lt!310956 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667782 () Bool)

(declare-fun e!382170 () Bool)

(assert (=> b!667782 (= e!382170 (contains!3350 lt!310956 k!2843))))

(declare-fun b!667783 () Bool)

(declare-fun e!382172 () Bool)

(assert (=> b!667783 (= e!382172 (not (contains!3350 lt!310956 k!2843)))))

(declare-fun b!667784 () Bool)

(declare-datatypes ((Unit!23385 0))(
  ( (Unit!23386) )
))
(declare-fun e!382166 () Unit!23385)

(declare-fun Unit!23387 () Unit!23385)

(assert (=> b!667784 (= e!382166 Unit!23387)))

(declare-fun b!667785 () Bool)

(declare-fun res!434944 () Bool)

(assert (=> b!667785 (=> (not res!434944) (not e!382168))))

(declare-fun arrayContainsKey!0 (array!39079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!667785 (= res!434944 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!667786 () Bool)

(declare-fun res!434940 () Bool)

(assert (=> b!667786 (=> (not res!434940) (not e!382168))))

(declare-fun arrayNoDuplicates!0 (array!39079 (_ BitVec 32) List!12773) Bool)

(assert (=> b!667786 (= res!434940 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!667787 () Bool)

(declare-fun e!382173 () Unit!23385)

(declare-fun Unit!23388 () Unit!23385)

(assert (=> b!667787 (= e!382173 Unit!23388)))

(declare-fun b!667788 () Bool)

(declare-fun res!434950 () Bool)

(assert (=> b!667788 (=> res!434950 e!382167)))

(assert (=> b!667788 (= res!434950 (contains!3350 lt!310956 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667789 () Bool)

(declare-fun res!434939 () Bool)

(assert (=> b!667789 (=> (not res!434939) (not e!382168))))

(assert (=> b!667789 (= res!434939 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12770))))

(declare-fun b!667790 () Bool)

(declare-fun res!434951 () Bool)

(assert (=> b!667790 (=> (not res!434951) (not e!382168))))

(declare-fun noDuplicate!597 (List!12773) Bool)

(assert (=> b!667790 (= res!434951 (noDuplicate!597 acc!681))))

(declare-fun b!667791 () Bool)

(declare-fun res!434954 () Bool)

(assert (=> b!667791 (=> (not res!434954) (not e!382168))))

(assert (=> b!667791 (= res!434954 (not (contains!3350 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667792 () Bool)

(declare-fun e!382171 () Bool)

(assert (=> b!667792 (= e!382171 (contains!3350 acc!681 k!2843))))

(declare-fun b!667793 () Bool)

(declare-fun e!382169 () Bool)

(assert (=> b!667793 (= e!382169 e!382176)))

(declare-fun res!434945 () Bool)

(assert (=> b!667793 (=> (not res!434945) (not e!382176))))

(assert (=> b!667793 (= res!434945 (bvsle from!3004 i!1382))))

(declare-fun b!667794 () Bool)

(assert (=> b!667794 (= e!382168 (not e!382167))))

(declare-fun res!434942 () Bool)

(assert (=> b!667794 (=> res!434942 e!382167)))

(assert (=> b!667794 (= res!434942 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!667794 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!310956)))

(declare-fun lt!310959 () Unit!23385)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39079 (_ BitVec 64) (_ BitVec 32) List!12773 List!12773) Unit!23385)

(assert (=> b!667794 (= lt!310959 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!310956))))

(declare-fun -!87 (List!12773 (_ BitVec 64)) List!12773)

(assert (=> b!667794 (= (-!87 lt!310956 k!2843) acc!681)))

(declare-fun $colon$colon!221 (List!12773 (_ BitVec 64)) List!12773)

(assert (=> b!667794 (= lt!310956 ($colon$colon!221 acc!681 k!2843))))

(declare-fun lt!310962 () Unit!23385)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12773) Unit!23385)

(assert (=> b!667794 (= lt!310962 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!89 (List!12773 List!12773) Bool)

(assert (=> b!667794 (subseq!89 acc!681 acc!681)))

(declare-fun lt!310955 () Unit!23385)

(declare-fun lemmaListSubSeqRefl!0 (List!12773) Unit!23385)

(assert (=> b!667794 (= lt!310955 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667794 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310961 () Unit!23385)

(assert (=> b!667794 (= lt!310961 e!382166)))

(declare-fun c!76790 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!667794 (= c!76790 (validKeyInArray!0 (select (arr!18732 a!3626) from!3004)))))

(declare-fun lt!310960 () Unit!23385)

(assert (=> b!667794 (= lt!310960 e!382173)))

(declare-fun c!76789 () Bool)

(assert (=> b!667794 (= c!76789 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667794 (arrayContainsKey!0 (array!39080 (store (arr!18732 a!3626) i!1382 k!2843) (size!19096 a!3626)) k!2843 from!3004)))

(declare-fun b!667795 () Bool)

(declare-fun Unit!23389 () Unit!23385)

(assert (=> b!667795 (= e!382173 Unit!23389)))

(declare-fun lt!310957 () Unit!23385)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39079 (_ BitVec 64) (_ BitVec 32)) Unit!23385)

(assert (=> b!667795 (= lt!310957 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!667795 false))

(declare-fun b!667796 () Bool)

(declare-fun res!434949 () Bool)

(assert (=> b!667796 (=> (not res!434949) (not e!382168))))

(assert (=> b!667796 (= res!434949 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19096 a!3626))))))

(declare-fun b!667797 () Bool)

(declare-fun lt!310963 () Unit!23385)

(assert (=> b!667797 (= e!382166 lt!310963)))

(declare-fun lt!310954 () Unit!23385)

(assert (=> b!667797 (= lt!310954 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667797 (subseq!89 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39079 List!12773 List!12773 (_ BitVec 32)) Unit!23385)

(assert (=> b!667797 (= lt!310963 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!221 acc!681 (select (arr!18732 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667797 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!667798 () Bool)

(declare-fun res!434953 () Bool)

(assert (=> b!667798 (=> (not res!434953) (not e!382168))))

(assert (=> b!667798 (= res!434953 (validKeyInArray!0 k!2843))))

(declare-fun b!667799 () Bool)

(declare-fun res!434948 () Bool)

(assert (=> b!667799 (=> (not res!434948) (not e!382168))))

(assert (=> b!667799 (= res!434948 e!382169)))

(declare-fun res!434941 () Bool)

(assert (=> b!667799 (=> res!434941 e!382169)))

(assert (=> b!667799 (= res!434941 e!382171)))

(declare-fun res!434943 () Bool)

(assert (=> b!667799 (=> (not res!434943) (not e!382171))))

(assert (=> b!667799 (= res!434943 (bvsgt from!3004 i!1382))))

(declare-fun b!667800 () Bool)

(assert (=> b!667800 (= e!382167 true)))

(declare-fun lt!310958 () Bool)

(declare-fun e!382174 () Bool)

(assert (=> b!667800 (= lt!310958 e!382174)))

(declare-fun res!434938 () Bool)

(assert (=> b!667800 (=> res!434938 e!382174)))

(assert (=> b!667800 (= res!434938 e!382170)))

(declare-fun res!434936 () Bool)

(assert (=> b!667800 (=> (not res!434936) (not e!382170))))

(assert (=> b!667800 (= res!434936 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667801 () Bool)

(declare-fun res!434937 () Bool)

(assert (=> b!667801 (=> res!434937 e!382167)))

(assert (=> b!667801 (= res!434937 (not (noDuplicate!597 lt!310956)))))

(declare-fun b!667802 () Bool)

(assert (=> b!667802 (= e!382174 e!382172)))

(declare-fun res!434935 () Bool)

(assert (=> b!667802 (=> (not res!434935) (not e!382172))))

(assert (=> b!667802 (= res!434935 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60032 res!434934) b!667790))

(assert (= (and b!667790 res!434951) b!667780))

(assert (= (and b!667780 res!434947) b!667791))

(assert (= (and b!667791 res!434954) b!667799))

(assert (= (and b!667799 res!434943) b!667792))

(assert (= (and b!667799 (not res!434941)) b!667793))

(assert (= (and b!667793 res!434945) b!667779))

(assert (= (and b!667799 res!434948) b!667789))

(assert (= (and b!667789 res!434939) b!667786))

(assert (= (and b!667786 res!434940) b!667796))

(assert (= (and b!667796 res!434949) b!667798))

(assert (= (and b!667798 res!434953) b!667785))

(assert (= (and b!667785 res!434944) b!667778))

(assert (= (and b!667778 res!434946) b!667794))

(assert (= (and b!667794 c!76789) b!667795))

(assert (= (and b!667794 (not c!76789)) b!667787))

(assert (= (and b!667794 c!76790) b!667797))

(assert (= (and b!667794 (not c!76790)) b!667784))

(assert (= (and b!667794 (not res!434942)) b!667801))

(assert (= (and b!667801 (not res!434937)) b!667781))

(assert (= (and b!667781 (not res!434952)) b!667788))

(assert (= (and b!667788 (not res!434950)) b!667800))

(assert (= (and b!667800 res!434936) b!667782))

(assert (= (and b!667800 (not res!434938)) b!667802))

(assert (= (and b!667802 res!434935) b!667783))

(declare-fun m!638249 () Bool)

(assert (=> b!667785 m!638249))

(declare-fun m!638251 () Bool)

(assert (=> b!667798 m!638251))

(declare-fun m!638253 () Bool)

(assert (=> b!667792 m!638253))

(declare-fun m!638255 () Bool)

(assert (=> b!667801 m!638255))

(declare-fun m!638257 () Bool)

(assert (=> b!667786 m!638257))

(declare-fun m!638259 () Bool)

(assert (=> b!667789 m!638259))

(assert (=> b!667779 m!638253))

(declare-fun m!638261 () Bool)

(assert (=> b!667790 m!638261))

(declare-fun m!638263 () Bool)

(assert (=> b!667791 m!638263))

(declare-fun m!638265 () Bool)

(assert (=> b!667781 m!638265))

(declare-fun m!638267 () Bool)

(assert (=> b!667780 m!638267))

(declare-fun m!638269 () Bool)

(assert (=> b!667794 m!638269))

(declare-fun m!638271 () Bool)

(assert (=> b!667794 m!638271))

(declare-fun m!638273 () Bool)

(assert (=> b!667794 m!638273))

(declare-fun m!638275 () Bool)

(assert (=> b!667794 m!638275))

(declare-fun m!638277 () Bool)

(assert (=> b!667794 m!638277))

(declare-fun m!638279 () Bool)

(assert (=> b!667794 m!638279))

(declare-fun m!638281 () Bool)

(assert (=> b!667794 m!638281))

(declare-fun m!638283 () Bool)

(assert (=> b!667794 m!638283))

(assert (=> b!667794 m!638271))

(declare-fun m!638285 () Bool)

(assert (=> b!667794 m!638285))

(declare-fun m!638287 () Bool)

(assert (=> b!667794 m!638287))

(declare-fun m!638289 () Bool)

(assert (=> b!667794 m!638289))

(declare-fun m!638291 () Bool)

(assert (=> b!667794 m!638291))

(declare-fun m!638293 () Bool)

(assert (=> b!667794 m!638293))

(declare-fun m!638295 () Bool)

(assert (=> b!667795 m!638295))

(declare-fun m!638297 () Bool)

(assert (=> start!60032 m!638297))

(assert (=> b!667797 m!638269))

(assert (=> b!667797 m!638271))

(declare-fun m!638299 () Bool)

(assert (=> b!667797 m!638299))

(declare-fun m!638301 () Bool)

(assert (=> b!667797 m!638301))

(assert (=> b!667797 m!638271))

(assert (=> b!667797 m!638299))

(assert (=> b!667797 m!638279))

(assert (=> b!667797 m!638293))

(declare-fun m!638303 () Bool)

(assert (=> b!667782 m!638303))

(assert (=> b!667783 m!638303))

(declare-fun m!638305 () Bool)

(assert (=> b!667788 m!638305))

(push 1)

(assert (not b!667785))

(assert (not b!667794))

(assert (not b!667782))

(assert (not b!667798))

(assert (not b!667780))

(assert (not b!667783))

(assert (not b!667791))

(assert (not b!667792))

(assert (not b!667788))

(assert (not b!667779))

(assert (not b!667801))

(assert (not b!667795))

(assert (not b!667790))

(assert (not b!667797))

(assert (not b!667781))

(assert (not b!667786))

(assert (not b!667789))

(assert (not start!60032))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

