; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59954 () Bool)

(assert start!59954)

(declare-fun b!664853 () Bool)

(declare-fun res!432492 () Bool)

(declare-fun e!381170 () Bool)

(assert (=> b!664853 (=> (not res!432492) (not e!381170))))

(declare-datatypes ((array!39001 0))(
  ( (array!39002 (arr!18693 (Array (_ BitVec 32) (_ BitVec 64))) (size!19057 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39001)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12734 0))(
  ( (Nil!12731) (Cons!12730 (h!13775 (_ BitVec 64)) (t!18962 List!12734)) )
))
(declare-fun acc!681 () List!12734)

(declare-fun arrayNoDuplicates!0 (array!39001 (_ BitVec 32) List!12734) Bool)

(assert (=> b!664853 (= res!432492 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!664854 () Bool)

(declare-datatypes ((Unit!23190 0))(
  ( (Unit!23191) )
))
(declare-fun e!381177 () Unit!23190)

(declare-fun lt!309784 () Unit!23190)

(assert (=> b!664854 (= e!381177 lt!309784)))

(declare-fun lt!309787 () Unit!23190)

(declare-fun lemmaListSubSeqRefl!0 (List!12734) Unit!23190)

(assert (=> b!664854 (= lt!309787 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!50 (List!12734 List!12734) Bool)

(assert (=> b!664854 (subseq!50 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39001 List!12734 List!12734 (_ BitVec 32)) Unit!23190)

(declare-fun $colon$colon!182 (List!12734 (_ BitVec 64)) List!12734)

(assert (=> b!664854 (= lt!309784 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!182 acc!681 (select (arr!18693 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664854 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!664855 () Bool)

(declare-fun res!432480 () Bool)

(assert (=> b!664855 (=> (not res!432480) (not e!381170))))

(declare-fun contains!3311 (List!12734 (_ BitVec 64)) Bool)

(assert (=> b!664855 (= res!432480 (not (contains!3311 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664856 () Bool)

(declare-fun res!432497 () Bool)

(declare-fun e!381173 () Bool)

(assert (=> b!664856 (=> res!432497 e!381173)))

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!664856 (= res!432497 (contains!3311 acc!681 k!2843))))

(declare-fun b!664857 () Bool)

(declare-fun res!432484 () Bool)

(assert (=> b!664857 (=> res!432484 e!381173)))

(declare-fun lt!309786 () List!12734)

(assert (=> b!664857 (= res!432484 (contains!3311 lt!309786 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664858 () Bool)

(declare-fun e!381175 () Unit!23190)

(declare-fun Unit!23192 () Unit!23190)

(assert (=> b!664858 (= e!381175 Unit!23192)))

(declare-fun b!664859 () Bool)

(declare-fun res!432489 () Bool)

(assert (=> b!664859 (=> (not res!432489) (not e!381170))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!664859 (= res!432489 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19057 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!664860 () Bool)

(declare-fun Unit!23193 () Unit!23190)

(assert (=> b!664860 (= e!381175 Unit!23193)))

(declare-fun lt!309788 () Unit!23190)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39001 (_ BitVec 64) (_ BitVec 32)) Unit!23190)

(assert (=> b!664860 (= lt!309788 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!664860 false))

(declare-fun res!432485 () Bool)

(assert (=> start!59954 (=> (not res!432485) (not e!381170))))

(assert (=> start!59954 (= res!432485 (and (bvslt (size!19057 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19057 a!3626))))))

(assert (=> start!59954 e!381170))

(assert (=> start!59954 true))

(declare-fun array_inv!14489 (array!39001) Bool)

(assert (=> start!59954 (array_inv!14489 a!3626)))

(declare-fun b!664861 () Bool)

(declare-fun e!381176 () Bool)

(assert (=> b!664861 (= e!381176 (contains!3311 acc!681 k!2843))))

(declare-fun b!664862 () Bool)

(declare-fun res!432494 () Bool)

(assert (=> b!664862 (=> (not res!432494) (not e!381170))))

(assert (=> b!664862 (= res!432494 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12731))))

(declare-fun b!664863 () Bool)

(declare-fun res!432488 () Bool)

(assert (=> b!664863 (=> (not res!432488) (not e!381170))))

(declare-fun e!381171 () Bool)

(assert (=> b!664863 (= res!432488 e!381171)))

(declare-fun res!432481 () Bool)

(assert (=> b!664863 (=> res!432481 e!381171)))

(assert (=> b!664863 (= res!432481 e!381176)))

(declare-fun res!432490 () Bool)

(assert (=> b!664863 (=> (not res!432490) (not e!381176))))

(assert (=> b!664863 (= res!432490 (bvsgt from!3004 i!1382))))

(declare-fun b!664864 () Bool)

(declare-fun res!432482 () Bool)

(assert (=> b!664864 (=> res!432482 e!381173)))

(declare-fun noDuplicate!558 (List!12734) Bool)

(assert (=> b!664864 (= res!432482 (not (noDuplicate!558 lt!309786)))))

(declare-fun b!664865 () Bool)

(declare-fun res!432478 () Bool)

(assert (=> b!664865 (=> (not res!432478) (not e!381170))))

(assert (=> b!664865 (= res!432478 (not (contains!3311 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!664866 () Bool)

(declare-fun res!432493 () Bool)

(assert (=> b!664866 (=> res!432493 e!381173)))

(assert (=> b!664866 (= res!432493 (not (subseq!50 acc!681 lt!309786)))))

(declare-fun b!664867 () Bool)

(declare-fun res!432495 () Bool)

(assert (=> b!664867 (=> (not res!432495) (not e!381170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!664867 (= res!432495 (validKeyInArray!0 k!2843))))

(declare-fun b!664868 () Bool)

(declare-fun e!381172 () Bool)

(assert (=> b!664868 (= e!381172 (not (contains!3311 acc!681 k!2843)))))

(declare-fun b!664869 () Bool)

(declare-fun res!432486 () Bool)

(assert (=> b!664869 (=> (not res!432486) (not e!381170))))

(declare-fun arrayContainsKey!0 (array!39001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!664869 (= res!432486 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!664870 () Bool)

(declare-fun res!432479 () Bool)

(assert (=> b!664870 (=> res!432479 e!381173)))

(assert (=> b!664870 (= res!432479 (not (contains!3311 lt!309786 k!2843)))))

(declare-fun b!664871 () Bool)

(declare-fun res!432496 () Bool)

(assert (=> b!664871 (=> (not res!432496) (not e!381170))))

(assert (=> b!664871 (= res!432496 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19057 a!3626))))))

(declare-fun b!664872 () Bool)

(assert (=> b!664872 (= e!381170 (not e!381173))))

(declare-fun res!432483 () Bool)

(assert (=> b!664872 (=> res!432483 e!381173)))

(assert (=> b!664872 (= res!432483 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!48 (List!12734 (_ BitVec 64)) List!12734)

(assert (=> b!664872 (= (-!48 lt!309786 k!2843) acc!681)))

(assert (=> b!664872 (= lt!309786 ($colon$colon!182 acc!681 k!2843))))

(declare-fun lt!309792 () Unit!23190)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12734) Unit!23190)

(assert (=> b!664872 (= lt!309792 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!664872 (subseq!50 acc!681 acc!681)))

(declare-fun lt!309789 () Unit!23190)

(assert (=> b!664872 (= lt!309789 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!664872 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!309791 () Unit!23190)

(assert (=> b!664872 (= lt!309791 e!381177)))

(declare-fun c!76555 () Bool)

(assert (=> b!664872 (= c!76555 (validKeyInArray!0 (select (arr!18693 a!3626) from!3004)))))

(declare-fun lt!309790 () Unit!23190)

(assert (=> b!664872 (= lt!309790 e!381175)))

(declare-fun c!76556 () Bool)

(declare-fun lt!309793 () Bool)

(assert (=> b!664872 (= c!76556 lt!309793)))

(assert (=> b!664872 (= lt!309793 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!664872 (arrayContainsKey!0 (array!39002 (store (arr!18693 a!3626) i!1382 k!2843) (size!19057 a!3626)) k!2843 from!3004)))

(declare-fun b!664873 () Bool)

(declare-fun res!432477 () Bool)

(assert (=> b!664873 (=> (not res!432477) (not e!381170))))

(assert (=> b!664873 (= res!432477 (noDuplicate!558 acc!681))))

(declare-fun b!664874 () Bool)

(declare-fun res!432487 () Bool)

(assert (=> b!664874 (=> res!432487 e!381173)))

(assert (=> b!664874 (= res!432487 lt!309793)))

(declare-fun b!664875 () Bool)

(assert (=> b!664875 (= e!381171 e!381172)))

(declare-fun res!432491 () Bool)

(assert (=> b!664875 (=> (not res!432491) (not e!381172))))

(assert (=> b!664875 (= res!432491 (bvsle from!3004 i!1382))))

(declare-fun b!664876 () Bool)

(assert (=> b!664876 (= e!381173 true)))

(declare-fun lt!309785 () Bool)

(assert (=> b!664876 (= lt!309785 (contains!3311 lt!309786 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!664877 () Bool)

(declare-fun Unit!23194 () Unit!23190)

(assert (=> b!664877 (= e!381177 Unit!23194)))

(assert (= (and start!59954 res!432485) b!664873))

(assert (= (and b!664873 res!432477) b!664855))

(assert (= (and b!664855 res!432480) b!664865))

(assert (= (and b!664865 res!432478) b!664863))

(assert (= (and b!664863 res!432490) b!664861))

(assert (= (and b!664863 (not res!432481)) b!664875))

(assert (= (and b!664875 res!432491) b!664868))

(assert (= (and b!664863 res!432488) b!664862))

(assert (= (and b!664862 res!432494) b!664853))

(assert (= (and b!664853 res!432492) b!664871))

(assert (= (and b!664871 res!432496) b!664867))

(assert (= (and b!664867 res!432495) b!664869))

(assert (= (and b!664869 res!432486) b!664859))

(assert (= (and b!664859 res!432489) b!664872))

(assert (= (and b!664872 c!76556) b!664860))

(assert (= (and b!664872 (not c!76556)) b!664858))

(assert (= (and b!664872 c!76555) b!664854))

(assert (= (and b!664872 (not c!76555)) b!664877))

(assert (= (and b!664872 (not res!432483)) b!664864))

(assert (= (and b!664864 (not res!432482)) b!664874))

(assert (= (and b!664874 (not res!432487)) b!664856))

(assert (= (and b!664856 (not res!432497)) b!664866))

(assert (= (and b!664866 (not res!432493)) b!664870))

(assert (= (and b!664870 (not res!432479)) b!664857))

(assert (= (and b!664857 (not res!432484)) b!664876))

(declare-fun m!636053 () Bool)

(assert (=> start!59954 m!636053))

(declare-fun m!636055 () Bool)

(assert (=> b!664867 m!636055))

(declare-fun m!636057 () Bool)

(assert (=> b!664854 m!636057))

(declare-fun m!636059 () Bool)

(assert (=> b!664854 m!636059))

(declare-fun m!636061 () Bool)

(assert (=> b!664854 m!636061))

(declare-fun m!636063 () Bool)

(assert (=> b!664854 m!636063))

(assert (=> b!664854 m!636059))

(assert (=> b!664854 m!636061))

(declare-fun m!636065 () Bool)

(assert (=> b!664854 m!636065))

(declare-fun m!636067 () Bool)

(assert (=> b!664854 m!636067))

(declare-fun m!636069 () Bool)

(assert (=> b!664870 m!636069))

(declare-fun m!636071 () Bool)

(assert (=> b!664876 m!636071))

(declare-fun m!636073 () Bool)

(assert (=> b!664866 m!636073))

(declare-fun m!636075 () Bool)

(assert (=> b!664853 m!636075))

(declare-fun m!636077 () Bool)

(assert (=> b!664855 m!636077))

(declare-fun m!636079 () Bool)

(assert (=> b!664869 m!636079))

(assert (=> b!664872 m!636057))

(declare-fun m!636081 () Bool)

(assert (=> b!664872 m!636081))

(assert (=> b!664872 m!636059))

(declare-fun m!636083 () Bool)

(assert (=> b!664872 m!636083))

(declare-fun m!636085 () Bool)

(assert (=> b!664872 m!636085))

(assert (=> b!664872 m!636065))

(declare-fun m!636087 () Bool)

(assert (=> b!664872 m!636087))

(declare-fun m!636089 () Bool)

(assert (=> b!664872 m!636089))

(assert (=> b!664872 m!636059))

(declare-fun m!636091 () Bool)

(assert (=> b!664872 m!636091))

(declare-fun m!636093 () Bool)

(assert (=> b!664872 m!636093))

(assert (=> b!664872 m!636067))

(declare-fun m!636095 () Bool)

(assert (=> b!664873 m!636095))

(declare-fun m!636097 () Bool)

(assert (=> b!664861 m!636097))

(declare-fun m!636099 () Bool)

(assert (=> b!664862 m!636099))

(declare-fun m!636101 () Bool)

(assert (=> b!664860 m!636101))

(declare-fun m!636103 () Bool)

(assert (=> b!664864 m!636103))

(assert (=> b!664856 m!636097))

(declare-fun m!636105 () Bool)

(assert (=> b!664865 m!636105))

(declare-fun m!636107 () Bool)

(assert (=> b!664857 m!636107))

(assert (=> b!664868 m!636097))

(push 1)

(assert (not b!664870))

(assert (not b!664855))

(assert (not b!664865))

(assert (not b!664857))

(assert (not start!59954))

(assert (not b!664864))

(assert (not b!664873))

(assert (not b!664872))

(assert (not b!664854))

(assert (not b!664867))

(assert (not b!664869))

(assert (not b!664861))

(assert (not b!664853))

(assert (not b!664862))

(assert (not b!664868))

(assert (not b!664876))

(assert (not b!664860))

(assert (not b!664866))

(assert (not b!664856))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

