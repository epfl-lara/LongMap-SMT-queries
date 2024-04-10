; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60012 () Bool)

(assert start!60012)

(declare-fun b!667028 () Bool)

(declare-fun e!381866 () Bool)

(declare-datatypes ((List!12763 0))(
  ( (Nil!12760) (Cons!12759 (h!13804 (_ BitVec 64)) (t!18991 List!12763)) )
))
(declare-fun acc!681 () List!12763)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3340 (List!12763 (_ BitVec 64)) Bool)

(assert (=> b!667028 (= e!381866 (contains!3340 acc!681 k!2843))))

(declare-fun b!667030 () Bool)

(declare-fun res!434315 () Bool)

(declare-fun e!381868 () Bool)

(assert (=> b!667030 (=> res!434315 e!381868)))

(declare-fun lt!310656 () List!12763)

(assert (=> b!667030 (= res!434315 (contains!3340 lt!310656 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667031 () Bool)

(declare-fun res!434309 () Bool)

(assert (=> b!667031 (=> res!434309 e!381868)))

(declare-fun noDuplicate!587 (List!12763) Bool)

(assert (=> b!667031 (= res!434309 (not (noDuplicate!587 lt!310656)))))

(declare-fun b!667032 () Bool)

(declare-fun res!434308 () Bool)

(declare-fun e!381869 () Bool)

(assert (=> b!667032 (=> (not res!434308) (not e!381869))))

(declare-datatypes ((array!39059 0))(
  ( (array!39060 (arr!18722 (Array (_ BitVec 32) (_ BitVec 64))) (size!19086 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39059)

(declare-fun arrayNoDuplicates!0 (array!39059 (_ BitVec 32) List!12763) Bool)

(assert (=> b!667032 (= res!434308 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12760))))

(declare-fun b!667033 () Bool)

(declare-fun res!434314 () Bool)

(assert (=> b!667033 (=> res!434314 e!381868)))

(assert (=> b!667033 (= res!434314 (not (contains!3340 lt!310656 k!2843)))))

(declare-fun b!667034 () Bool)

(declare-fun e!381872 () Bool)

(declare-fun e!381871 () Bool)

(assert (=> b!667034 (= e!381872 e!381871)))

(declare-fun res!434322 () Bool)

(assert (=> b!667034 (=> (not res!434322) (not e!381871))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!667034 (= res!434322 (bvsle from!3004 i!1382))))

(declare-fun b!667035 () Bool)

(declare-fun res!434305 () Bool)

(assert (=> b!667035 (=> (not res!434305) (not e!381869))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!667035 (= res!434305 (validKeyInArray!0 k!2843))))

(declare-fun b!667036 () Bool)

(declare-fun res!434317 () Bool)

(assert (=> b!667036 (=> (not res!434317) (not e!381869))))

(assert (=> b!667036 (= res!434317 (noDuplicate!587 acc!681))))

(declare-fun b!667037 () Bool)

(declare-fun res!434313 () Bool)

(assert (=> b!667037 (=> (not res!434313) (not e!381869))))

(assert (=> b!667037 (= res!434313 e!381872)))

(declare-fun res!434310 () Bool)

(assert (=> b!667037 (=> res!434310 e!381872)))

(assert (=> b!667037 (= res!434310 e!381866)))

(declare-fun res!434321 () Bool)

(assert (=> b!667037 (=> (not res!434321) (not e!381866))))

(assert (=> b!667037 (= res!434321 (bvsgt from!3004 i!1382))))

(declare-fun b!667038 () Bool)

(declare-fun res!434316 () Bool)

(assert (=> b!667038 (=> (not res!434316) (not e!381869))))

(assert (=> b!667038 (= res!434316 (not (contains!3340 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667039 () Bool)

(declare-datatypes ((Unit!23335 0))(
  ( (Unit!23336) )
))
(declare-fun e!381867 () Unit!23335)

(declare-fun Unit!23337 () Unit!23335)

(assert (=> b!667039 (= e!381867 Unit!23337)))

(declare-fun b!667040 () Bool)

(assert (=> b!667040 (= e!381871 (not (contains!3340 acc!681 k!2843)))))

(declare-fun b!667041 () Bool)

(declare-fun res!434320 () Bool)

(assert (=> b!667041 (=> (not res!434320) (not e!381869))))

(assert (=> b!667041 (= res!434320 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19086 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!667042 () Bool)

(assert (=> b!667042 (= e!381869 (not e!381868))))

(declare-fun res!434311 () Bool)

(assert (=> b!667042 (=> res!434311 e!381868)))

(assert (=> b!667042 (= res!434311 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!77 (List!12763 (_ BitVec 64)) List!12763)

(assert (=> b!667042 (= (-!77 lt!310656 k!2843) acc!681)))

(declare-fun $colon$colon!211 (List!12763 (_ BitVec 64)) List!12763)

(assert (=> b!667042 (= lt!310656 ($colon$colon!211 acc!681 k!2843))))

(declare-fun lt!310660 () Unit!23335)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12763) Unit!23335)

(assert (=> b!667042 (= lt!310660 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!79 (List!12763 List!12763) Bool)

(assert (=> b!667042 (subseq!79 acc!681 acc!681)))

(declare-fun lt!310662 () Unit!23335)

(declare-fun lemmaListSubSeqRefl!0 (List!12763) Unit!23335)

(assert (=> b!667042 (= lt!310662 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667042 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310655 () Unit!23335)

(assert (=> b!667042 (= lt!310655 e!381867)))

(declare-fun c!76729 () Bool)

(assert (=> b!667042 (= c!76729 (validKeyInArray!0 (select (arr!18722 a!3626) from!3004)))))

(declare-fun lt!310663 () Unit!23335)

(declare-fun e!381870 () Unit!23335)

(assert (=> b!667042 (= lt!310663 e!381870)))

(declare-fun c!76730 () Bool)

(declare-fun lt!310654 () Bool)

(assert (=> b!667042 (= c!76730 lt!310654)))

(declare-fun arrayContainsKey!0 (array!39059 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!667042 (= lt!310654 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667042 (arrayContainsKey!0 (array!39060 (store (arr!18722 a!3626) i!1382 k!2843) (size!19086 a!3626)) k!2843 from!3004)))

(declare-fun b!667043 () Bool)

(declare-fun Unit!23338 () Unit!23335)

(assert (=> b!667043 (= e!381870 Unit!23338)))

(declare-fun lt!310661 () Unit!23335)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39059 (_ BitVec 64) (_ BitVec 32)) Unit!23335)

(assert (=> b!667043 (= lt!310661 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!667043 false))

(declare-fun b!667029 () Bool)

(declare-fun res!434306 () Bool)

(assert (=> b!667029 (=> res!434306 e!381868)))

(assert (=> b!667029 (= res!434306 (not (subseq!79 acc!681 lt!310656)))))

(declare-fun res!434319 () Bool)

(assert (=> start!60012 (=> (not res!434319) (not e!381869))))

(assert (=> start!60012 (= res!434319 (and (bvslt (size!19086 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19086 a!3626))))))

(assert (=> start!60012 e!381869))

(assert (=> start!60012 true))

(declare-fun array_inv!14518 (array!39059) Bool)

(assert (=> start!60012 (array_inv!14518 a!3626)))

(declare-fun b!667044 () Bool)

(declare-fun res!434323 () Bool)

(assert (=> b!667044 (=> (not res!434323) (not e!381869))))

(assert (=> b!667044 (= res!434323 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!667045 () Bool)

(declare-fun res!434318 () Bool)

(assert (=> b!667045 (=> (not res!434318) (not e!381869))))

(assert (=> b!667045 (= res!434318 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19086 a!3626))))))

(declare-fun b!667046 () Bool)

(declare-fun res!434307 () Bool)

(assert (=> b!667046 (=> res!434307 e!381868)))

(assert (=> b!667046 (= res!434307 lt!310654)))

(declare-fun b!667047 () Bool)

(declare-fun res!434324 () Bool)

(assert (=> b!667047 (=> (not res!434324) (not e!381869))))

(assert (=> b!667047 (= res!434324 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!667048 () Bool)

(declare-fun lt!310659 () Unit!23335)

(assert (=> b!667048 (= e!381867 lt!310659)))

(declare-fun lt!310657 () Unit!23335)

(assert (=> b!667048 (= lt!310657 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667048 (subseq!79 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39059 List!12763 List!12763 (_ BitVec 32)) Unit!23335)

(assert (=> b!667048 (= lt!310659 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!211 acc!681 (select (arr!18722 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667048 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!667049 () Bool)

(declare-fun res!434304 () Bool)

(assert (=> b!667049 (=> (not res!434304) (not e!381869))))

(assert (=> b!667049 (= res!434304 (not (contains!3340 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667050 () Bool)

(declare-fun res!434312 () Bool)

(assert (=> b!667050 (=> res!434312 e!381868)))

(assert (=> b!667050 (= res!434312 (contains!3340 acc!681 k!2843))))

(declare-fun b!667051 () Bool)

(assert (=> b!667051 (= e!381868 true)))

(declare-fun lt!310658 () Bool)

(assert (=> b!667051 (= lt!310658 (contains!3340 lt!310656 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667052 () Bool)

(declare-fun Unit!23339 () Unit!23335)

(assert (=> b!667052 (= e!381870 Unit!23339)))

(assert (= (and start!60012 res!434319) b!667036))

(assert (= (and b!667036 res!434317) b!667038))

(assert (= (and b!667038 res!434316) b!667049))

(assert (= (and b!667049 res!434304) b!667037))

(assert (= (and b!667037 res!434321) b!667028))

(assert (= (and b!667037 (not res!434310)) b!667034))

(assert (= (and b!667034 res!434322) b!667040))

(assert (= (and b!667037 res!434313) b!667032))

(assert (= (and b!667032 res!434308) b!667044))

(assert (= (and b!667044 res!434323) b!667045))

(assert (= (and b!667045 res!434318) b!667035))

(assert (= (and b!667035 res!434305) b!667047))

(assert (= (and b!667047 res!434324) b!667041))

(assert (= (and b!667041 res!434320) b!667042))

(assert (= (and b!667042 c!76730) b!667043))

(assert (= (and b!667042 (not c!76730)) b!667052))

(assert (= (and b!667042 c!76729) b!667048))

(assert (= (and b!667042 (not c!76729)) b!667039))

(assert (= (and b!667042 (not res!434311)) b!667031))

(assert (= (and b!667031 (not res!434309)) b!667046))

(assert (= (and b!667046 (not res!434307)) b!667050))

(assert (= (and b!667050 (not res!434312)) b!667029))

(assert (= (and b!667029 (not res!434306)) b!667033))

(assert (= (and b!667033 (not res!434314)) b!667030))

(assert (= (and b!667030 (not res!434315)) b!667051))

(declare-fun m!637677 () Bool)

(assert (=> b!667044 m!637677))

(declare-fun m!637679 () Bool)

(assert (=> b!667030 m!637679))

(declare-fun m!637681 () Bool)

(assert (=> b!667033 m!637681))

(declare-fun m!637683 () Bool)

(assert (=> b!667028 m!637683))

(declare-fun m!637685 () Bool)

(assert (=> b!667038 m!637685))

(declare-fun m!637687 () Bool)

(assert (=> b!667047 m!637687))

(declare-fun m!637689 () Bool)

(assert (=> b!667029 m!637689))

(declare-fun m!637691 () Bool)

(assert (=> start!60012 m!637691))

(declare-fun m!637693 () Bool)

(assert (=> b!667048 m!637693))

(declare-fun m!637695 () Bool)

(assert (=> b!667048 m!637695))

(declare-fun m!637697 () Bool)

(assert (=> b!667048 m!637697))

(declare-fun m!637699 () Bool)

(assert (=> b!667048 m!637699))

(assert (=> b!667048 m!637695))

(assert (=> b!667048 m!637697))

(declare-fun m!637701 () Bool)

(assert (=> b!667048 m!637701))

(declare-fun m!637703 () Bool)

(assert (=> b!667048 m!637703))

(assert (=> b!667040 m!637683))

(declare-fun m!637705 () Bool)

(assert (=> b!667049 m!637705))

(declare-fun m!637707 () Bool)

(assert (=> b!667035 m!637707))

(declare-fun m!637709 () Bool)

(assert (=> b!667051 m!637709))

(assert (=> b!667042 m!637693))

(assert (=> b!667042 m!637695))

(declare-fun m!637711 () Bool)

(assert (=> b!667042 m!637711))

(declare-fun m!637713 () Bool)

(assert (=> b!667042 m!637713))

(assert (=> b!667042 m!637701))

(declare-fun m!637715 () Bool)

(assert (=> b!667042 m!637715))

(declare-fun m!637717 () Bool)

(assert (=> b!667042 m!637717))

(assert (=> b!667042 m!637695))

(declare-fun m!637719 () Bool)

(assert (=> b!667042 m!637719))

(declare-fun m!637721 () Bool)

(assert (=> b!667042 m!637721))

(declare-fun m!637723 () Bool)

(assert (=> b!667042 m!637723))

(assert (=> b!667042 m!637703))

(declare-fun m!637725 () Bool)

(assert (=> b!667032 m!637725))

(declare-fun m!637727 () Bool)

(assert (=> b!667031 m!637727))

(assert (=> b!667050 m!637683))

(declare-fun m!637729 () Bool)

(assert (=> b!667043 m!637729))

(declare-fun m!637731 () Bool)

(assert (=> b!667036 m!637731))

(push 1)

(assert (not b!667031))

(assert (not b!667042))

(assert (not b!667036))

(assert (not b!667043))

(assert (not b!667044))

(assert (not b!667040))

(assert (not b!667038))

(assert (not b!667035))

(assert (not b!667029))

(assert (not b!667048))

(assert (not b!667028))

(assert (not b!667047))

(assert (not b!667050))

(assert (not b!667032))

(assert (not b!667051))

(assert (not start!60012))

(assert (not b!667033))

(assert (not b!667030))

(assert (not b!667049))

(check-sat)

