; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60996 () Bool)

(assert start!60996)

(declare-fun b!684300 () Bool)

(declare-fun res!449895 () Bool)

(declare-fun e!389718 () Bool)

(assert (=> b!684300 (=> (not res!449895) (not e!389718))))

(declare-datatypes ((List!13024 0))(
  ( (Nil!13021) (Cons!13020 (h!14065 (_ BitVec 64)) (t!19270 List!13024)) )
))
(declare-fun acc!681 () List!13024)

(declare-fun noDuplicate!848 (List!13024) Bool)

(assert (=> b!684300 (= res!449895 (noDuplicate!848 acc!681))))

(declare-fun b!684301 () Bool)

(declare-fun e!389724 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3601 (List!13024 (_ BitVec 64)) Bool)

(assert (=> b!684301 (= e!389724 (not (contains!3601 acc!681 k!2843)))))

(declare-fun b!684302 () Bool)

(declare-fun res!449901 () Bool)

(assert (=> b!684302 (=> (not res!449901) (not e!389718))))

(assert (=> b!684302 (= res!449901 (not (contains!3601 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684303 () Bool)

(declare-fun e!389717 () Bool)

(assert (=> b!684303 (= e!389717 true)))

(declare-fun lt!314261 () Bool)

(assert (=> b!684303 (= lt!314261 (contains!3601 acc!681 k!2843))))

(declare-fun b!684305 () Bool)

(declare-fun e!389723 () Bool)

(assert (=> b!684305 (= e!389723 e!389724)))

(declare-fun res!449890 () Bool)

(assert (=> b!684305 (=> (not res!449890) (not e!389724))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!684305 (= res!449890 (bvsle from!3004 i!1382))))

(declare-fun b!684306 () Bool)

(declare-datatypes ((Unit!24082 0))(
  ( (Unit!24083) )
))
(declare-fun e!389722 () Unit!24082)

(declare-fun Unit!24084 () Unit!24082)

(assert (=> b!684306 (= e!389722 Unit!24084)))

(declare-fun b!684307 () Bool)

(declare-fun res!449900 () Bool)

(assert (=> b!684307 (=> (not res!449900) (not e!389718))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!684307 (= res!449900 (validKeyInArray!0 k!2843))))

(declare-fun b!684308 () Bool)

(declare-fun e!389720 () Unit!24082)

(declare-fun Unit!24085 () Unit!24082)

(assert (=> b!684308 (= e!389720 Unit!24085)))

(declare-fun res!449891 () Bool)

(assert (=> start!60996 (=> (not res!449891) (not e!389718))))

(declare-datatypes ((array!39605 0))(
  ( (array!39606 (arr!18983 (Array (_ BitVec 32) (_ BitVec 64))) (size!19350 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39605)

(assert (=> start!60996 (= res!449891 (and (bvslt (size!19350 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19350 a!3626))))))

(assert (=> start!60996 e!389718))

(assert (=> start!60996 true))

(declare-fun array_inv!14779 (array!39605) Bool)

(assert (=> start!60996 (array_inv!14779 a!3626)))

(declare-fun b!684304 () Bool)

(declare-fun e!389721 () Bool)

(assert (=> b!684304 (= e!389721 (contains!3601 acc!681 k!2843))))

(declare-fun b!684309 () Bool)

(declare-fun res!449893 () Bool)

(assert (=> b!684309 (=> res!449893 e!389717)))

(declare-fun lt!314258 () List!13024)

(assert (=> b!684309 (= res!449893 (not (noDuplicate!848 lt!314258)))))

(declare-fun b!684310 () Bool)

(declare-fun res!449892 () Bool)

(assert (=> b!684310 (=> (not res!449892) (not e!389718))))

(declare-fun arrayNoDuplicates!0 (array!39605 (_ BitVec 32) List!13024) Bool)

(assert (=> b!684310 (= res!449892 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!684311 () Bool)

(declare-fun res!449906 () Bool)

(assert (=> b!684311 (=> (not res!449906) (not e!389718))))

(declare-fun arrayContainsKey!0 (array!39605 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!684311 (= res!449906 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!684312 () Bool)

(declare-fun lt!314260 () Unit!24082)

(assert (=> b!684312 (= e!389720 lt!314260)))

(declare-fun lt!314264 () Unit!24082)

(declare-fun lemmaListSubSeqRefl!0 (List!13024) Unit!24082)

(assert (=> b!684312 (= lt!314264 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!187 (List!13024 List!13024) Bool)

(assert (=> b!684312 (subseq!187 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39605 List!13024 List!13024 (_ BitVec 32)) Unit!24082)

(declare-fun $colon$colon!352 (List!13024 (_ BitVec 64)) List!13024)

(assert (=> b!684312 (= lt!314260 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!352 acc!681 (select (arr!18983 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684312 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!684313 () Bool)

(assert (=> b!684313 (= e!389718 (not e!389717))))

(declare-fun res!449902 () Bool)

(assert (=> b!684313 (=> res!449902 e!389717)))

(assert (=> b!684313 (= res!449902 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!152 (List!13024 (_ BitVec 64)) List!13024)

(assert (=> b!684313 (= (-!152 lt!314258 k!2843) acc!681)))

(assert (=> b!684313 (= lt!314258 ($colon$colon!352 acc!681 k!2843))))

(declare-fun lt!314262 () Unit!24082)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13024) Unit!24082)

(assert (=> b!684313 (= lt!314262 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!684313 (subseq!187 acc!681 acc!681)))

(declare-fun lt!314265 () Unit!24082)

(assert (=> b!684313 (= lt!314265 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!684313 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314257 () Unit!24082)

(assert (=> b!684313 (= lt!314257 e!389720)))

(declare-fun c!77573 () Bool)

(assert (=> b!684313 (= c!77573 (validKeyInArray!0 (select (arr!18983 a!3626) from!3004)))))

(declare-fun lt!314263 () Unit!24082)

(assert (=> b!684313 (= lt!314263 e!389722)))

(declare-fun c!77572 () Bool)

(declare-fun lt!314266 () Bool)

(assert (=> b!684313 (= c!77572 lt!314266)))

(assert (=> b!684313 (= lt!314266 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!684313 (arrayContainsKey!0 (array!39606 (store (arr!18983 a!3626) i!1382 k!2843) (size!19350 a!3626)) k!2843 from!3004)))

(declare-fun b!684314 () Bool)

(declare-fun res!449898 () Bool)

(assert (=> b!684314 (=> (not res!449898) (not e!389718))))

(assert (=> b!684314 (= res!449898 (not (contains!3601 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!684315 () Bool)

(declare-fun res!449894 () Bool)

(assert (=> b!684315 (=> (not res!449894) (not e!389718))))

(assert (=> b!684315 (= res!449894 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19350 a!3626))))))

(declare-fun b!684316 () Bool)

(declare-fun res!449903 () Bool)

(assert (=> b!684316 (=> (not res!449903) (not e!389718))))

(assert (=> b!684316 (= res!449903 e!389723)))

(declare-fun res!449904 () Bool)

(assert (=> b!684316 (=> res!449904 e!389723)))

(assert (=> b!684316 (= res!449904 e!389721)))

(declare-fun res!449905 () Bool)

(assert (=> b!684316 (=> (not res!449905) (not e!389721))))

(assert (=> b!684316 (= res!449905 (bvsgt from!3004 i!1382))))

(declare-fun b!684317 () Bool)

(declare-fun Unit!24086 () Unit!24082)

(assert (=> b!684317 (= e!389722 Unit!24086)))

(declare-fun lt!314259 () Unit!24082)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39605 (_ BitVec 64) (_ BitVec 32)) Unit!24082)

(assert (=> b!684317 (= lt!314259 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!684317 false))

(declare-fun b!684318 () Bool)

(declare-fun res!449896 () Bool)

(assert (=> b!684318 (=> (not res!449896) (not e!389718))))

(assert (=> b!684318 (= res!449896 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13021))))

(declare-fun b!684319 () Bool)

(declare-fun res!449897 () Bool)

(assert (=> b!684319 (=> (not res!449897) (not e!389718))))

(assert (=> b!684319 (= res!449897 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19350 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!684320 () Bool)

(declare-fun res!449899 () Bool)

(assert (=> b!684320 (=> res!449899 e!389717)))

(assert (=> b!684320 (= res!449899 lt!314266)))

(assert (= (and start!60996 res!449891) b!684300))

(assert (= (and b!684300 res!449895) b!684302))

(assert (= (and b!684302 res!449901) b!684314))

(assert (= (and b!684314 res!449898) b!684316))

(assert (= (and b!684316 res!449905) b!684304))

(assert (= (and b!684316 (not res!449904)) b!684305))

(assert (= (and b!684305 res!449890) b!684301))

(assert (= (and b!684316 res!449903) b!684318))

(assert (= (and b!684318 res!449896) b!684310))

(assert (= (and b!684310 res!449892) b!684315))

(assert (= (and b!684315 res!449894) b!684307))

(assert (= (and b!684307 res!449900) b!684311))

(assert (= (and b!684311 res!449906) b!684319))

(assert (= (and b!684319 res!449897) b!684313))

(assert (= (and b!684313 c!77572) b!684317))

(assert (= (and b!684313 (not c!77572)) b!684306))

(assert (= (and b!684313 c!77573) b!684312))

(assert (= (and b!684313 (not c!77573)) b!684308))

(assert (= (and b!684313 (not res!449902)) b!684309))

(assert (= (and b!684309 (not res!449893)) b!684320))

(assert (= (and b!684320 (not res!449899)) b!684303))

(declare-fun m!648689 () Bool)

(assert (=> b!684312 m!648689))

(declare-fun m!648691 () Bool)

(assert (=> b!684312 m!648691))

(declare-fun m!648693 () Bool)

(assert (=> b!684312 m!648693))

(declare-fun m!648695 () Bool)

(assert (=> b!684312 m!648695))

(assert (=> b!684312 m!648691))

(assert (=> b!684312 m!648693))

(declare-fun m!648697 () Bool)

(assert (=> b!684312 m!648697))

(declare-fun m!648699 () Bool)

(assert (=> b!684312 m!648699))

(declare-fun m!648701 () Bool)

(assert (=> b!684313 m!648701))

(assert (=> b!684313 m!648689))

(assert (=> b!684313 m!648691))

(declare-fun m!648703 () Bool)

(assert (=> b!684313 m!648703))

(declare-fun m!648705 () Bool)

(assert (=> b!684313 m!648705))

(assert (=> b!684313 m!648697))

(declare-fun m!648707 () Bool)

(assert (=> b!684313 m!648707))

(declare-fun m!648709 () Bool)

(assert (=> b!684313 m!648709))

(assert (=> b!684313 m!648691))

(declare-fun m!648711 () Bool)

(assert (=> b!684313 m!648711))

(declare-fun m!648713 () Bool)

(assert (=> b!684313 m!648713))

(assert (=> b!684313 m!648699))

(declare-fun m!648715 () Bool)

(assert (=> b!684300 m!648715))

(declare-fun m!648717 () Bool)

(assert (=> b!684309 m!648717))

(declare-fun m!648719 () Bool)

(assert (=> b!684302 m!648719))

(declare-fun m!648721 () Bool)

(assert (=> b!684303 m!648721))

(declare-fun m!648723 () Bool)

(assert (=> b!684314 m!648723))

(declare-fun m!648725 () Bool)

(assert (=> b!684318 m!648725))

(assert (=> b!684301 m!648721))

(declare-fun m!648727 () Bool)

(assert (=> start!60996 m!648727))

(declare-fun m!648729 () Bool)

(assert (=> b!684311 m!648729))

(assert (=> b!684304 m!648721))

(declare-fun m!648731 () Bool)

(assert (=> b!684307 m!648731))

(declare-fun m!648733 () Bool)

(assert (=> b!684310 m!648733))

(declare-fun m!648735 () Bool)

(assert (=> b!684317 m!648735))

(push 1)

(assert (not b!684300))

(assert (not b!684314))

(assert (not b!684312))

(assert (not b!684317))

(assert (not b!684311))

(assert (not b!684302))

(assert (not b!684310))

(assert (not start!60996))

(assert (not b!684309))

(assert (not b!684318))

(assert (not b!684301))

(assert (not b!684304))

(assert (not b!684307))

(assert (not b!684313))

(assert (not b!684303))

(check-sat)

(pop 1)

