; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60160 () Bool)

(assert start!60160)

(declare-fun b!670653 () Bool)

(declare-fun res!437288 () Bool)

(declare-fun e!383467 () Bool)

(assert (=> b!670653 (=> (not res!437288) (not e!383467))))

(declare-datatypes ((List!12710 0))(
  ( (Nil!12707) (Cons!12706 (h!13754 (_ BitVec 64)) (t!18930 List!12710)) )
))
(declare-fun acc!681 () List!12710)

(declare-fun contains!3362 (List!12710 (_ BitVec 64)) Bool)

(assert (=> b!670653 (= res!437288 (not (contains!3362 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670654 () Bool)

(declare-fun res!437280 () Bool)

(declare-fun e!383469 () Bool)

(assert (=> b!670654 (=> res!437280 e!383469)))

(declare-fun lt!312133 () List!12710)

(assert (=> b!670654 (= res!437280 (contains!3362 lt!312133 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670655 () Bool)

(declare-datatypes ((Unit!23539 0))(
  ( (Unit!23540) )
))
(declare-fun e!383470 () Unit!23539)

(declare-fun Unit!23541 () Unit!23539)

(assert (=> b!670655 (= e!383470 Unit!23541)))

(declare-fun b!670656 () Bool)

(declare-fun res!437298 () Bool)

(assert (=> b!670656 (=> (not res!437298) (not e!383467))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39145 0))(
  ( (array!39146 (arr!18762 (Array (_ BitVec 32) (_ BitVec 64))) (size!19126 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39145)

(assert (=> b!670656 (= res!437298 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19126 a!3626))))))

(declare-fun b!670657 () Bool)

(declare-fun res!437286 () Bool)

(assert (=> b!670657 (=> (not res!437286) (not e!383467))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!670657 (= res!437286 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19126 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!670658 () Bool)

(declare-fun res!437291 () Bool)

(assert (=> b!670658 (=> (not res!437291) (not e!383467))))

(declare-fun arrayNoDuplicates!0 (array!39145 (_ BitVec 32) List!12710) Bool)

(assert (=> b!670658 (= res!437291 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!670659 () Bool)

(declare-fun res!437282 () Bool)

(assert (=> b!670659 (=> (not res!437282) (not e!383467))))

(declare-fun noDuplicate!636 (List!12710) Bool)

(assert (=> b!670659 (= res!437282 (noDuplicate!636 acc!681))))

(declare-fun b!670660 () Bool)

(declare-fun e!383464 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!670660 (= e!383464 (contains!3362 lt!312133 k!2843))))

(declare-fun b!670662 () Bool)

(assert (=> b!670662 (= e!383467 (not e!383469))))

(declare-fun res!437279 () Bool)

(assert (=> b!670662 (=> res!437279 e!383469)))

(assert (=> b!670662 (= res!437279 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(assert (=> b!670662 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312133)))

(declare-fun lt!312132 () Unit!23539)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39145 (_ BitVec 64) (_ BitVec 32) List!12710 List!12710) Unit!23539)

(assert (=> b!670662 (= lt!312132 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!312133))))

(declare-fun -!121 (List!12710 (_ BitVec 64)) List!12710)

(assert (=> b!670662 (= (-!121 lt!312133 k!2843) acc!681)))

(declare-fun $colon$colon!253 (List!12710 (_ BitVec 64)) List!12710)

(assert (=> b!670662 (= lt!312133 ($colon$colon!253 acc!681 k!2843))))

(declare-fun lt!312142 () Unit!23539)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12710) Unit!23539)

(assert (=> b!670662 (= lt!312142 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!124 (List!12710 List!12710) Bool)

(assert (=> b!670662 (subseq!124 acc!681 acc!681)))

(declare-fun lt!312137 () Unit!23539)

(declare-fun lemmaListSubSeqRefl!0 (List!12710) Unit!23539)

(assert (=> b!670662 (= lt!312137 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!670662 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!312138 () Unit!23539)

(declare-fun e!383468 () Unit!23539)

(assert (=> b!670662 (= lt!312138 e!383468)))

(declare-fun c!77056 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!670662 (= c!77056 (validKeyInArray!0 (select (arr!18762 a!3626) from!3004)))))

(declare-fun lt!312141 () Unit!23539)

(assert (=> b!670662 (= lt!312141 e!383470)))

(declare-fun c!77057 () Bool)

(declare-fun arrayContainsKey!0 (array!39145 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!670662 (= c!77057 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun lt!312135 () array!39145)

(assert (=> b!670662 (arrayContainsKey!0 lt!312135 k!2843 from!3004)))

(assert (=> b!670662 (= lt!312135 (array!39146 (store (arr!18762 a!3626) i!1382 k!2843) (size!19126 a!3626)))))

(declare-fun b!670663 () Bool)

(declare-fun res!437296 () Bool)

(assert (=> b!670663 (=> (not res!437296) (not e!383467))))

(assert (=> b!670663 (= res!437296 (validKeyInArray!0 k!2843))))

(declare-fun b!670664 () Bool)

(declare-fun res!437293 () Bool)

(assert (=> b!670664 (=> (not res!437293) (not e!383467))))

(assert (=> b!670664 (= res!437293 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12707))))

(declare-fun b!670665 () Bool)

(declare-fun e!383463 () Bool)

(assert (=> b!670665 (= e!383463 (not (contains!3362 lt!312133 k!2843)))))

(declare-fun b!670666 () Bool)

(assert (=> b!670666 (= e!383469 true)))

(assert (=> b!670666 (arrayNoDuplicates!0 lt!312135 (bvadd #b00000000000000000000000000000001 from!3004) lt!312133)))

(declare-fun lt!312134 () Unit!23539)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39145 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12710) Unit!23539)

(assert (=> b!670666 (= lt!312134 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312133))))

(declare-fun b!670667 () Bool)

(declare-fun e!383462 () Bool)

(assert (=> b!670667 (= e!383462 e!383464)))

(declare-fun res!437299 () Bool)

(assert (=> b!670667 (=> res!437299 e!383464)))

(assert (=> b!670667 (= res!437299 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!670668 () Bool)

(declare-fun lt!312136 () Unit!23539)

(assert (=> b!670668 (= e!383468 lt!312136)))

(declare-fun lt!312139 () Unit!23539)

(assert (=> b!670668 (= lt!312139 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!670668 (subseq!124 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39145 List!12710 List!12710 (_ BitVec 32)) Unit!23539)

(assert (=> b!670668 (= lt!312136 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!253 acc!681 (select (arr!18762 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!670668 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!670669 () Bool)

(declare-fun res!437297 () Bool)

(assert (=> b!670669 (=> (not res!437297) (not e!383467))))

(assert (=> b!670669 (= res!437297 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!670670 () Bool)

(declare-fun e!383465 () Bool)

(declare-fun e!383466 () Bool)

(assert (=> b!670670 (= e!383465 e!383466)))

(declare-fun res!437283 () Bool)

(assert (=> b!670670 (=> (not res!437283) (not e!383466))))

(assert (=> b!670670 (= res!437283 (bvsle from!3004 i!1382))))

(declare-fun b!670671 () Bool)

(declare-fun e!383472 () Bool)

(assert (=> b!670671 (= e!383472 (contains!3362 acc!681 k!2843))))

(declare-fun b!670672 () Bool)

(declare-fun res!437290 () Bool)

(assert (=> b!670672 (=> res!437290 e!383469)))

(assert (=> b!670672 (= res!437290 (not (noDuplicate!636 lt!312133)))))

(declare-fun res!437289 () Bool)

(assert (=> start!60160 (=> (not res!437289) (not e!383467))))

(assert (=> start!60160 (= res!437289 (and (bvslt (size!19126 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19126 a!3626))))))

(assert (=> start!60160 e!383467))

(assert (=> start!60160 true))

(declare-fun array_inv!14621 (array!39145) Bool)

(assert (=> start!60160 (array_inv!14621 a!3626)))

(declare-fun b!670661 () Bool)

(assert (=> b!670661 (= e!383466 (not (contains!3362 acc!681 k!2843)))))

(declare-fun b!670673 () Bool)

(declare-fun Unit!23542 () Unit!23539)

(assert (=> b!670673 (= e!383468 Unit!23542)))

(declare-fun b!670674 () Bool)

(declare-fun res!437281 () Bool)

(assert (=> b!670674 (=> (not res!437281) (not e!383467))))

(assert (=> b!670674 (= res!437281 (not (contains!3362 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!670675 () Bool)

(declare-fun Unit!23543 () Unit!23539)

(assert (=> b!670675 (= e!383470 Unit!23543)))

(declare-fun lt!312140 () Unit!23539)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39145 (_ BitVec 64) (_ BitVec 32)) Unit!23539)

(assert (=> b!670675 (= lt!312140 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!670675 false))

(declare-fun b!670676 () Bool)

(declare-fun res!437287 () Bool)

(assert (=> b!670676 (=> res!437287 e!383469)))

(assert (=> b!670676 (= res!437287 (contains!3362 lt!312133 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!670677 () Bool)

(declare-fun res!437292 () Bool)

(assert (=> b!670677 (=> res!437292 e!383469)))

(assert (=> b!670677 (= res!437292 e!383462)))

(declare-fun res!437295 () Bool)

(assert (=> b!670677 (=> (not res!437295) (not e!383462))))

(assert (=> b!670677 (= res!437295 e!383463)))

(declare-fun res!437284 () Bool)

(assert (=> b!670677 (=> res!437284 e!383463)))

(assert (=> b!670677 (= res!437284 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!670678 () Bool)

(declare-fun res!437278 () Bool)

(assert (=> b!670678 (=> (not res!437278) (not e!383467))))

(assert (=> b!670678 (= res!437278 e!383465)))

(declare-fun res!437285 () Bool)

(assert (=> b!670678 (=> res!437285 e!383465)))

(assert (=> b!670678 (= res!437285 e!383472)))

(declare-fun res!437294 () Bool)

(assert (=> b!670678 (=> (not res!437294) (not e!383472))))

(assert (=> b!670678 (= res!437294 (bvsgt from!3004 i!1382))))

(assert (= (and start!60160 res!437289) b!670659))

(assert (= (and b!670659 res!437282) b!670674))

(assert (= (and b!670674 res!437281) b!670653))

(assert (= (and b!670653 res!437288) b!670678))

(assert (= (and b!670678 res!437294) b!670671))

(assert (= (and b!670678 (not res!437285)) b!670670))

(assert (= (and b!670670 res!437283) b!670661))

(assert (= (and b!670678 res!437278) b!670664))

(assert (= (and b!670664 res!437293) b!670658))

(assert (= (and b!670658 res!437291) b!670656))

(assert (= (and b!670656 res!437298) b!670663))

(assert (= (and b!670663 res!437296) b!670669))

(assert (= (and b!670669 res!437297) b!670657))

(assert (= (and b!670657 res!437286) b!670662))

(assert (= (and b!670662 c!77057) b!670675))

(assert (= (and b!670662 (not c!77057)) b!670655))

(assert (= (and b!670662 c!77056) b!670668))

(assert (= (and b!670662 (not c!77056)) b!670673))

(assert (= (and b!670662 (not res!437279)) b!670672))

(assert (= (and b!670672 (not res!437290)) b!670654))

(assert (= (and b!670654 (not res!437280)) b!670676))

(assert (= (and b!670676 (not res!437287)) b!670677))

(assert (= (and b!670677 (not res!437284)) b!670665))

(assert (= (and b!670677 res!437295) b!670667))

(assert (= (and b!670667 (not res!437299)) b!670660))

(assert (= (and b!670677 (not res!437292)) b!670666))

(declare-fun m!641009 () Bool)

(assert (=> b!670674 m!641009))

(declare-fun m!641011 () Bool)

(assert (=> start!60160 m!641011))

(declare-fun m!641013 () Bool)

(assert (=> b!670660 m!641013))

(declare-fun m!641015 () Bool)

(assert (=> b!670666 m!641015))

(declare-fun m!641017 () Bool)

(assert (=> b!670666 m!641017))

(declare-fun m!641019 () Bool)

(assert (=> b!670658 m!641019))

(declare-fun m!641021 () Bool)

(assert (=> b!670664 m!641021))

(declare-fun m!641023 () Bool)

(assert (=> b!670669 m!641023))

(declare-fun m!641025 () Bool)

(assert (=> b!670659 m!641025))

(declare-fun m!641027 () Bool)

(assert (=> b!670668 m!641027))

(declare-fun m!641029 () Bool)

(assert (=> b!670668 m!641029))

(declare-fun m!641031 () Bool)

(assert (=> b!670668 m!641031))

(declare-fun m!641033 () Bool)

(assert (=> b!670668 m!641033))

(assert (=> b!670668 m!641029))

(assert (=> b!670668 m!641031))

(declare-fun m!641035 () Bool)

(assert (=> b!670668 m!641035))

(declare-fun m!641037 () Bool)

(assert (=> b!670668 m!641037))

(assert (=> b!670665 m!641013))

(declare-fun m!641039 () Bool)

(assert (=> b!670671 m!641039))

(declare-fun m!641041 () Bool)

(assert (=> b!670663 m!641041))

(assert (=> b!670661 m!641039))

(declare-fun m!641043 () Bool)

(assert (=> b!670675 m!641043))

(declare-fun m!641045 () Bool)

(assert (=> b!670676 m!641045))

(declare-fun m!641047 () Bool)

(assert (=> b!670653 m!641047))

(declare-fun m!641049 () Bool)

(assert (=> b!670654 m!641049))

(declare-fun m!641051 () Bool)

(assert (=> b!670672 m!641051))

(assert (=> b!670662 m!641027))

(declare-fun m!641053 () Bool)

(assert (=> b!670662 m!641053))

(declare-fun m!641055 () Bool)

(assert (=> b!670662 m!641055))

(declare-fun m!641057 () Bool)

(assert (=> b!670662 m!641057))

(declare-fun m!641059 () Bool)

(assert (=> b!670662 m!641059))

(assert (=> b!670662 m!641035))

(declare-fun m!641061 () Bool)

(assert (=> b!670662 m!641061))

(declare-fun m!641063 () Bool)

(assert (=> b!670662 m!641063))

(declare-fun m!641065 () Bool)

(assert (=> b!670662 m!641065))

(assert (=> b!670662 m!641029))

(declare-fun m!641067 () Bool)

(assert (=> b!670662 m!641067))

(assert (=> b!670662 m!641037))

(assert (=> b!670662 m!641029))

(declare-fun m!641069 () Bool)

(assert (=> b!670662 m!641069))

(push 1)

(assert (not b!670654))

(assert (not b!670668))

(assert (not b!670676))

(assert (not b!670661))

(assert (not b!670674))

(assert (not b!670669))

(assert (not b!670653))

(assert (not b!670672))

(assert (not b!670662))

(assert (not start!60160))

(assert (not b!670664))

(assert (not b!670660))

(assert (not b!670675))

(assert (not b!670663))

(assert (not b!670658))

(assert (not b!670659))

(assert (not b!670665))

(assert (not b!670666))

(assert (not b!670671))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

