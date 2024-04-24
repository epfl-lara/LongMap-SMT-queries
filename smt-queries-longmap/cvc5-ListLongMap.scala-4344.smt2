; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60154 () Bool)

(assert start!60154)

(declare-fun b!670419 () Bool)

(declare-fun res!437081 () Bool)

(declare-fun e!383364 () Bool)

(assert (=> b!670419 (=> (not res!437081) (not e!383364))))

(declare-datatypes ((array!39139 0))(
  ( (array!39140 (arr!18759 (Array (_ BitVec 32) (_ BitVec 64))) (size!19123 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39139)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!12707 0))(
  ( (Nil!12704) (Cons!12703 (h!13751 (_ BitVec 64)) (t!18927 List!12707)) )
))
(declare-fun acc!681 () List!12707)

(declare-fun arrayNoDuplicates!0 (array!39139 (_ BitVec 32) List!12707) Bool)

(assert (=> b!670419 (= res!437081 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!670420 () Bool)

(declare-datatypes ((Unit!23524 0))(
  ( (Unit!23525) )
))
(declare-fun e!383370 () Unit!23524)

(declare-fun Unit!23526 () Unit!23524)

(assert (=> b!670420 (= e!383370 Unit!23526)))

(declare-fun b!670421 () Bool)

(declare-fun res!437097 () Bool)

(assert (=> b!670421 (=> (not res!437097) (not e!383364))))

(declare-fun e!383366 () Bool)

(assert (=> b!670421 (= res!437097 e!383366)))

(declare-fun res!437084 () Bool)

(assert (=> b!670421 (=> res!437084 e!383366)))

(declare-fun e!383368 () Bool)

(assert (=> b!670421 (= res!437084 e!383368)))

(declare-fun res!437100 () Bool)

(assert (=> b!670421 (=> (not res!437100) (not e!383368))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!670421 (= res!437100 (bvsgt from!3004 i!1382))))

(declare-fun b!670422 () Bool)

(declare-fun e!383365 () Unit!23524)

(declare-fun Unit!23527 () Unit!23524)

(assert (=> b!670422 (= e!383365 Unit!23527)))

(declare-fun b!670423 () Bool)

(declare-fun res!437095 () Bool)

(assert (=> b!670423 (=> (not res!437095) (not e!383364))))

(declare-fun contains!3359 (List!12707 (_ BitVec 64)) Bool)

(assert (=> b!670423 (= res!437095 (not (contains!3359 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670424 () Bool)

(declare-fun res!437101 () Bool)

(assert (=> b!670424 (=> (not res!437101) (not e!383364))))

(declare-fun noDuplicate!633 (List!12707) Bool)

(assert (=> b!670424 (= res!437101 (noDuplicate!633 acc!681))))

(declare-fun b!670425 () Bool)

(declare-fun res!437083 () Bool)

(assert (=> b!670425 (=> (not res!437083) (not e!383364))))

(assert (=> b!670425 (= res!437083 (not (contains!3359 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670426 () Bool)

(declare-fun res!437094 () Bool)

(declare-fun e!383373 () Bool)

(assert (=> b!670426 (=> res!437094 e!383373)))

(declare-fun e!383367 () Bool)

(assert (=> b!670426 (= res!437094 e!383367)))

(declare-fun res!437082 () Bool)

(assert (=> b!670426 (=> (not res!437082) (not e!383367))))

(declare-fun e!383363 () Bool)

(assert (=> b!670426 (= res!437082 e!383363)))

(declare-fun res!437098 () Bool)

(assert (=> b!670426 (=> res!437098 e!383363)))

(assert (=> b!670426 (= res!437098 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!670427 () Bool)

(declare-fun res!437089 () Bool)

(assert (=> b!670427 (=> res!437089 e!383373)))

(declare-fun lt!312036 () List!12707)

(assert (=> b!670427 (= res!437089 (contains!3359 lt!312036 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670428 () Bool)

(declare-fun e!383372 () Bool)

(assert (=> b!670428 (= e!383367 e!383372)))

(declare-fun res!437093 () Bool)

(assert (=> b!670428 (=> res!437093 e!383372)))

(assert (=> b!670428 (= res!437093 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!670429 () Bool)

(declare-fun res!437085 () Bool)

(assert (=> b!670429 (=> (not res!437085) (not e!383364))))

(assert (=> b!670429 (= res!437085 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19123 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!670430 () Bool)

(declare-fun lt!312033 () Unit!23524)

(assert (=> b!670430 (= e!383365 lt!312033)))

(declare-fun lt!312040 () Unit!23524)

(declare-fun lemmaListSubSeqRefl!0 (List!12707) Unit!23524)

(assert (=> b!670430 (= lt!312040 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!121 (List!12707 List!12707) Bool)

(assert (=> b!670430 (subseq!121 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39139 List!12707 List!12707 (_ BitVec 32)) Unit!23524)

(declare-fun $colon$colon!250 (List!12707 (_ BitVec 64)) List!12707)

(assert (=> b!670430 (= lt!312033 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!250 acc!681 (select (arr!18759 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!670430 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!670431 () Bool)

(declare-fun res!437086 () Bool)

(assert (=> b!670431 (=> res!437086 e!383373)))

(assert (=> b!670431 (= res!437086 (contains!3359 lt!312036 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670432 () Bool)

(declare-fun res!437088 () Bool)

(assert (=> b!670432 (=> (not res!437088) (not e!383364))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!670432 (= res!437088 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!670433 () Bool)

(assert (=> b!670433 (= e!383363 (not (contains!3359 lt!312036 k!2843)))))

(declare-fun b!670434 () Bool)

(declare-fun res!437096 () Bool)

(assert (=> b!670434 (=> res!437096 e!383373)))

(assert (=> b!670434 (= res!437096 (not (noDuplicate!633 lt!312036)))))

(declare-fun b!670435 () Bool)

(declare-fun res!437090 () Bool)

(assert (=> b!670435 (=> (not res!437090) (not e!383364))))

(assert (=> b!670435 (= res!437090 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12704))))

(declare-fun b!670436 () Bool)

(assert (=> b!670436 (= e!383364 (not e!383373))))

(declare-fun res!437080 () Bool)

(assert (=> b!670436 (=> res!437080 e!383373)))

(assert (=> b!670436 (= res!437080 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!670436 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312036)))

(declare-fun lt!312039 () Unit!23524)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39139 (_ BitVec 64) (_ BitVec 32) List!12707 List!12707) Unit!23524)

(assert (=> b!670436 (= lt!312039 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!312036))))

(declare-fun -!118 (List!12707 (_ BitVec 64)) List!12707)

(assert (=> b!670436 (= (-!118 lt!312036 k!2843) acc!681)))

(assert (=> b!670436 (= lt!312036 ($colon$colon!250 acc!681 k!2843))))

(declare-fun lt!312038 () Unit!23524)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12707) Unit!23524)

(assert (=> b!670436 (= lt!312038 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!670436 (subseq!121 acc!681 acc!681)))

(declare-fun lt!312034 () Unit!23524)

(assert (=> b!670436 (= lt!312034 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!670436 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!312035 () Unit!23524)

(assert (=> b!670436 (= lt!312035 e!383365)))

(declare-fun c!77038 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!670436 (= c!77038 (validKeyInArray!0 (select (arr!18759 a!3626) from!3004)))))

(declare-fun lt!312042 () Unit!23524)

(assert (=> b!670436 (= lt!312042 e!383370)))

(declare-fun c!77039 () Bool)

(assert (=> b!670436 (= c!77039 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun lt!312043 () array!39139)

(assert (=> b!670436 (arrayContainsKey!0 lt!312043 k!2843 from!3004)))

(assert (=> b!670436 (= lt!312043 (array!39140 (store (arr!18759 a!3626) i!1382 k!2843) (size!19123 a!3626)))))

(declare-fun b!670437 () Bool)

(assert (=> b!670437 (= e!383372 (contains!3359 lt!312036 k!2843))))

(declare-fun b!670438 () Bool)

(declare-fun res!437091 () Bool)

(assert (=> b!670438 (=> (not res!437091) (not e!383364))))

(assert (=> b!670438 (= res!437091 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19123 a!3626))))))

(declare-fun b!670439 () Bool)

(declare-fun e!383371 () Bool)

(assert (=> b!670439 (= e!383371 (not (contains!3359 acc!681 k!2843)))))

(declare-fun b!670440 () Bool)

(declare-fun Unit!23528 () Unit!23524)

(assert (=> b!670440 (= e!383370 Unit!23528)))

(declare-fun lt!312037 () Unit!23524)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39139 (_ BitVec 64) (_ BitVec 32)) Unit!23524)

(assert (=> b!670440 (= lt!312037 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!670440 false))

(declare-fun b!670441 () Bool)

(assert (=> b!670441 (= e!383373 true)))

(assert (=> b!670441 (arrayNoDuplicates!0 lt!312043 (bvadd #b00000000000000000000000000000001 from!3004) lt!312036)))

(declare-fun lt!312041 () Unit!23524)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39139 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12707) Unit!23524)

(assert (=> b!670441 (= lt!312041 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312036))))

(declare-fun res!437092 () Bool)

(assert (=> start!60154 (=> (not res!437092) (not e!383364))))

(assert (=> start!60154 (= res!437092 (and (bvslt (size!19123 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19123 a!3626))))))

(assert (=> start!60154 e!383364))

(assert (=> start!60154 true))

(declare-fun array_inv!14618 (array!39139) Bool)

(assert (=> start!60154 (array_inv!14618 a!3626)))

(declare-fun b!670442 () Bool)

(assert (=> b!670442 (= e!383368 (contains!3359 acc!681 k!2843))))

(declare-fun b!670443 () Bool)

(assert (=> b!670443 (= e!383366 e!383371)))

(declare-fun res!437087 () Bool)

(assert (=> b!670443 (=> (not res!437087) (not e!383371))))

(assert (=> b!670443 (= res!437087 (bvsle from!3004 i!1382))))

(declare-fun b!670444 () Bool)

(declare-fun res!437099 () Bool)

(assert (=> b!670444 (=> (not res!437099) (not e!383364))))

(assert (=> b!670444 (= res!437099 (validKeyInArray!0 k!2843))))

(assert (= (and start!60154 res!437092) b!670424))

(assert (= (and b!670424 res!437101) b!670423))

(assert (= (and b!670423 res!437095) b!670425))

(assert (= (and b!670425 res!437083) b!670421))

(assert (= (and b!670421 res!437100) b!670442))

(assert (= (and b!670421 (not res!437084)) b!670443))

(assert (= (and b!670443 res!437087) b!670439))

(assert (= (and b!670421 res!437097) b!670435))

(assert (= (and b!670435 res!437090) b!670419))

(assert (= (and b!670419 res!437081) b!670438))

(assert (= (and b!670438 res!437091) b!670444))

(assert (= (and b!670444 res!437099) b!670432))

(assert (= (and b!670432 res!437088) b!670429))

(assert (= (and b!670429 res!437085) b!670436))

(assert (= (and b!670436 c!77039) b!670440))

(assert (= (and b!670436 (not c!77039)) b!670420))

(assert (= (and b!670436 c!77038) b!670430))

(assert (= (and b!670436 (not c!77038)) b!670422))

(assert (= (and b!670436 (not res!437080)) b!670434))

(assert (= (and b!670434 (not res!437096)) b!670427))

(assert (= (and b!670427 (not res!437089)) b!670431))

(assert (= (and b!670431 (not res!437086)) b!670426))

(assert (= (and b!670426 (not res!437098)) b!670433))

(assert (= (and b!670426 res!437082) b!670428))

(assert (= (and b!670428 (not res!437093)) b!670437))

(assert (= (and b!670426 (not res!437094)) b!670441))

(declare-fun m!640823 () Bool)

(assert (=> b!670427 m!640823))

(declare-fun m!640825 () Bool)

(assert (=> b!670442 m!640825))

(declare-fun m!640827 () Bool)

(assert (=> b!670444 m!640827))

(declare-fun m!640829 () Bool)

(assert (=> b!670436 m!640829))

(declare-fun m!640831 () Bool)

(assert (=> b!670436 m!640831))

(declare-fun m!640833 () Bool)

(assert (=> b!670436 m!640833))

(declare-fun m!640835 () Bool)

(assert (=> b!670436 m!640835))

(declare-fun m!640837 () Bool)

(assert (=> b!670436 m!640837))

(declare-fun m!640839 () Bool)

(assert (=> b!670436 m!640839))

(declare-fun m!640841 () Bool)

(assert (=> b!670436 m!640841))

(declare-fun m!640843 () Bool)

(assert (=> b!670436 m!640843))

(declare-fun m!640845 () Bool)

(assert (=> b!670436 m!640845))

(assert (=> b!670436 m!640831))

(declare-fun m!640847 () Bool)

(assert (=> b!670436 m!640847))

(declare-fun m!640849 () Bool)

(assert (=> b!670436 m!640849))

(declare-fun m!640851 () Bool)

(assert (=> b!670436 m!640851))

(declare-fun m!640853 () Bool)

(assert (=> b!670436 m!640853))

(declare-fun m!640855 () Bool)

(assert (=> start!60154 m!640855))

(declare-fun m!640857 () Bool)

(assert (=> b!670437 m!640857))

(declare-fun m!640859 () Bool)

(assert (=> b!670425 m!640859))

(declare-fun m!640861 () Bool)

(assert (=> b!670419 m!640861))

(assert (=> b!670439 m!640825))

(declare-fun m!640863 () Bool)

(assert (=> b!670432 m!640863))

(declare-fun m!640865 () Bool)

(assert (=> b!670434 m!640865))

(declare-fun m!640867 () Bool)

(assert (=> b!670435 m!640867))

(declare-fun m!640869 () Bool)

(assert (=> b!670441 m!640869))

(declare-fun m!640871 () Bool)

(assert (=> b!670441 m!640871))

(assert (=> b!670433 m!640857))

(declare-fun m!640873 () Bool)

(assert (=> b!670431 m!640873))

(assert (=> b!670430 m!640829))

(assert (=> b!670430 m!640831))

(declare-fun m!640875 () Bool)

(assert (=> b!670430 m!640875))

(declare-fun m!640877 () Bool)

(assert (=> b!670430 m!640877))

(assert (=> b!670430 m!640831))

(assert (=> b!670430 m!640875))

(assert (=> b!670430 m!640839))

(assert (=> b!670430 m!640849))

(declare-fun m!640879 () Bool)

(assert (=> b!670424 m!640879))

(declare-fun m!640881 () Bool)

(assert (=> b!670440 m!640881))

(declare-fun m!640883 () Bool)

(assert (=> b!670423 m!640883))

(push 1)

(assert (not b!670434))

(assert (not b!670435))

(assert (not b!670424))

(assert (not b!670444))

(assert (not b!670433))

(assert (not b!670436))

(assert (not b!670432))

(assert (not b!670439))

(assert (not b!670441))

(assert (not b!670427))

(assert (not b!670442))

(assert (not b!670425))

(assert (not b!670437))

(assert (not b!670419))

(assert (not b!670440))

(assert (not start!60154))

(assert (not b!670430))

(assert (not b!670423))

(assert (not b!670431))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

