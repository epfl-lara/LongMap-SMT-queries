; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60028 () Bool)

(assert start!60028)

(declare-fun b!667782 () Bool)

(declare-fun res!435059 () Bool)

(declare-fun e!382111 () Bool)

(assert (=> b!667782 (=> res!435059 e!382111)))

(declare-datatypes ((List!12815 0))(
  ( (Nil!12812) (Cons!12811 (h!13856 (_ BitVec 64)) (t!19034 List!12815)) )
))
(declare-fun lt!310821 () List!12815)

(declare-fun contains!3337 (List!12815 (_ BitVec 64)) Bool)

(assert (=> b!667782 (= res!435059 (contains!3337 lt!310821 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667783 () Bool)

(declare-fun e!382117 () Bool)

(assert (=> b!667783 (= e!382117 (not e!382111))))

(declare-fun res!435058 () Bool)

(assert (=> b!667783 (=> res!435058 e!382111)))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!667783 (= res!435058 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((array!39086 0))(
  ( (array!39087 (arr!18735 (Array (_ BitVec 32) (_ BitVec 64))) (size!19100 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39086)

(declare-fun arrayNoDuplicates!0 (array!39086 (_ BitVec 32) List!12815) Bool)

(assert (=> b!667783 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!310821)))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun acc!681 () List!12815)

(declare-datatypes ((Unit!23383 0))(
  ( (Unit!23384) )
))
(declare-fun lt!310818 () Unit!23383)

(declare-fun lemmaAddKeyNoContainsInAccStillNoDuplicate!0 (array!39086 (_ BitVec 64) (_ BitVec 32) List!12815 List!12815) Unit!23383)

(assert (=> b!667783 (= lt!310818 (lemmaAddKeyNoContainsInAccStillNoDuplicate!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004) acc!681 lt!310821))))

(declare-fun -!91 (List!12815 (_ BitVec 64)) List!12815)

(assert (=> b!667783 (= (-!91 lt!310821 k!2843) acc!681)))

(declare-fun $colon$colon!224 (List!12815 (_ BitVec 64)) List!12815)

(assert (=> b!667783 (= lt!310821 ($colon$colon!224 acc!681 k!2843))))

(declare-fun lt!310820 () Unit!23383)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12815) Unit!23383)

(assert (=> b!667783 (= lt!310820 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!93 (List!12815 List!12815) Bool)

(assert (=> b!667783 (subseq!93 acc!681 acc!681)))

(declare-fun lt!310819 () Unit!23383)

(declare-fun lemmaListSubSeqRefl!0 (List!12815) Unit!23383)

(assert (=> b!667783 (= lt!310819 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667783 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!310824 () Unit!23383)

(declare-fun e!382114 () Unit!23383)

(assert (=> b!667783 (= lt!310824 e!382114)))

(declare-fun c!76733 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!667783 (= c!76733 (validKeyInArray!0 (select (arr!18735 a!3626) from!3004)))))

(declare-fun lt!310826 () Unit!23383)

(declare-fun e!382109 () Unit!23383)

(assert (=> b!667783 (= lt!310826 e!382109)))

(declare-fun c!76734 () Bool)

(declare-fun arrayContainsKey!0 (array!39086 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!667783 (= c!76734 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!667783 (arrayContainsKey!0 (array!39087 (store (arr!18735 a!3626) i!1382 k!2843) (size!19100 a!3626)) k!2843 from!3004)))

(declare-fun b!667784 () Bool)

(declare-fun res!435063 () Bool)

(assert (=> b!667784 (=> (not res!435063) (not e!382117))))

(declare-fun e!382108 () Bool)

(assert (=> b!667784 (= res!435063 e!382108)))

(declare-fun res!435055 () Bool)

(assert (=> b!667784 (=> res!435055 e!382108)))

(declare-fun e!382116 () Bool)

(assert (=> b!667784 (= res!435055 e!382116)))

(declare-fun res!435062 () Bool)

(assert (=> b!667784 (=> (not res!435062) (not e!382116))))

(assert (=> b!667784 (= res!435062 (bvsgt from!3004 i!1382))))

(declare-fun b!667785 () Bool)

(declare-fun res!435070 () Bool)

(assert (=> b!667785 (=> (not res!435070) (not e!382117))))

(assert (=> b!667785 (= res!435070 (not (contains!3337 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667786 () Bool)

(declare-fun lt!310823 () Unit!23383)

(assert (=> b!667786 (= e!382114 lt!310823)))

(declare-fun lt!310827 () Unit!23383)

(assert (=> b!667786 (= lt!310827 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!667786 (subseq!93 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39086 List!12815 List!12815 (_ BitVec 32)) Unit!23383)

(assert (=> b!667786 (= lt!310823 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!224 acc!681 (select (arr!18735 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!667786 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!667787 () Bool)

(declare-fun res!435051 () Bool)

(assert (=> b!667787 (=> (not res!435051) (not e!382117))))

(assert (=> b!667787 (= res!435051 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12812))))

(declare-fun b!667788 () Bool)

(declare-fun e!382110 () Bool)

(assert (=> b!667788 (= e!382110 (not (contains!3337 lt!310821 k!2843)))))

(declare-fun b!667789 () Bool)

(assert (=> b!667789 (= e!382116 (contains!3337 acc!681 k!2843))))

(declare-fun b!667790 () Bool)

(declare-fun res!435054 () Bool)

(assert (=> b!667790 (=> (not res!435054) (not e!382117))))

(assert (=> b!667790 (= res!435054 (not (contains!3337 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!667791 () Bool)

(declare-fun res!435066 () Bool)

(assert (=> b!667791 (=> res!435066 e!382111)))

(assert (=> b!667791 (= res!435066 (contains!3337 lt!310821 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!667792 () Bool)

(assert (=> b!667792 (= e!382111 true)))

(declare-fun lt!310822 () Bool)

(declare-fun e!382112 () Bool)

(assert (=> b!667792 (= lt!310822 e!382112)))

(declare-fun res!435053 () Bool)

(assert (=> b!667792 (=> res!435053 e!382112)))

(declare-fun e!382113 () Bool)

(assert (=> b!667792 (= res!435053 e!382113)))

(declare-fun res!435069 () Bool)

(assert (=> b!667792 (=> (not res!435069) (not e!382113))))

(assert (=> b!667792 (= res!435069 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667793 () Bool)

(assert (=> b!667793 (= e!382112 e!382110)))

(declare-fun res!435061 () Bool)

(assert (=> b!667793 (=> (not res!435061) (not e!382110))))

(assert (=> b!667793 (= res!435061 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!667794 () Bool)

(declare-fun res!435065 () Bool)

(assert (=> b!667794 (=> (not res!435065) (not e!382117))))

(assert (=> b!667794 (= res!435065 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!667795 () Bool)

(declare-fun res!435067 () Bool)

(assert (=> b!667795 (=> (not res!435067) (not e!382117))))

(assert (=> b!667795 (= res!435067 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!435057 () Bool)

(assert (=> start!60028 (=> (not res!435057) (not e!382117))))

(assert (=> start!60028 (= res!435057 (and (bvslt (size!19100 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19100 a!3626))))))

(assert (=> start!60028 e!382117))

(assert (=> start!60028 true))

(declare-fun array_inv!14618 (array!39086) Bool)

(assert (=> start!60028 (array_inv!14618 a!3626)))

(declare-fun b!667796 () Bool)

(declare-fun res!435056 () Bool)

(assert (=> b!667796 (=> (not res!435056) (not e!382117))))

(assert (=> b!667796 (= res!435056 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19100 a!3626))))))

(declare-fun b!667797 () Bool)

(declare-fun e!382118 () Bool)

(assert (=> b!667797 (= e!382108 e!382118)))

(declare-fun res!435052 () Bool)

(assert (=> b!667797 (=> (not res!435052) (not e!382118))))

(assert (=> b!667797 (= res!435052 (bvsle from!3004 i!1382))))

(declare-fun b!667798 () Bool)

(declare-fun res!435068 () Bool)

(assert (=> b!667798 (=> res!435068 e!382111)))

(declare-fun noDuplicate!606 (List!12815) Bool)

(assert (=> b!667798 (= res!435068 (not (noDuplicate!606 lt!310821)))))

(declare-fun b!667799 () Bool)

(declare-fun res!435060 () Bool)

(assert (=> b!667799 (=> (not res!435060) (not e!382117))))

(assert (=> b!667799 (= res!435060 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19100 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!667800 () Bool)

(declare-fun res!435050 () Bool)

(assert (=> b!667800 (=> (not res!435050) (not e!382117))))

(assert (=> b!667800 (= res!435050 (noDuplicate!606 acc!681))))

(declare-fun b!667801 () Bool)

(declare-fun Unit!23385 () Unit!23383)

(assert (=> b!667801 (= e!382109 Unit!23385)))

(declare-fun b!667802 () Bool)

(assert (=> b!667802 (= e!382118 (not (contains!3337 acc!681 k!2843)))))

(declare-fun b!667803 () Bool)

(declare-fun Unit!23386 () Unit!23383)

(assert (=> b!667803 (= e!382114 Unit!23386)))

(declare-fun b!667804 () Bool)

(declare-fun Unit!23387 () Unit!23383)

(assert (=> b!667804 (= e!382109 Unit!23387)))

(declare-fun lt!310825 () Unit!23383)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39086 (_ BitVec 64) (_ BitVec 32)) Unit!23383)

(assert (=> b!667804 (= lt!310825 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!667804 false))

(declare-fun b!667805 () Bool)

(assert (=> b!667805 (= e!382113 (contains!3337 lt!310821 k!2843))))

(declare-fun b!667806 () Bool)

(declare-fun res!435064 () Bool)

(assert (=> b!667806 (=> (not res!435064) (not e!382117))))

(assert (=> b!667806 (= res!435064 (validKeyInArray!0 k!2843))))

(assert (= (and start!60028 res!435057) b!667800))

(assert (= (and b!667800 res!435050) b!667785))

(assert (= (and b!667785 res!435070) b!667790))

(assert (= (and b!667790 res!435054) b!667784))

(assert (= (and b!667784 res!435062) b!667789))

(assert (= (and b!667784 (not res!435055)) b!667797))

(assert (= (and b!667797 res!435052) b!667802))

(assert (= (and b!667784 res!435063) b!667787))

(assert (= (and b!667787 res!435051) b!667795))

(assert (= (and b!667795 res!435067) b!667796))

(assert (= (and b!667796 res!435056) b!667806))

(assert (= (and b!667806 res!435064) b!667794))

(assert (= (and b!667794 res!435065) b!667799))

(assert (= (and b!667799 res!435060) b!667783))

(assert (= (and b!667783 c!76734) b!667804))

(assert (= (and b!667783 (not c!76734)) b!667801))

(assert (= (and b!667783 c!76733) b!667786))

(assert (= (and b!667783 (not c!76733)) b!667803))

(assert (= (and b!667783 (not res!435058)) b!667798))

(assert (= (and b!667798 (not res!435068)) b!667782))

(assert (= (and b!667782 (not res!435059)) b!667791))

(assert (= (and b!667791 (not res!435066)) b!667792))

(assert (= (and b!667792 res!435069) b!667805))

(assert (= (and b!667792 (not res!435053)) b!667793))

(assert (= (and b!667793 res!435061) b!667788))

(declare-fun m!637699 () Bool)

(assert (=> b!667788 m!637699))

(declare-fun m!637701 () Bool)

(assert (=> b!667798 m!637701))

(declare-fun m!637703 () Bool)

(assert (=> b!667795 m!637703))

(declare-fun m!637705 () Bool)

(assert (=> b!667794 m!637705))

(declare-fun m!637707 () Bool)

(assert (=> b!667790 m!637707))

(declare-fun m!637709 () Bool)

(assert (=> b!667800 m!637709))

(declare-fun m!637711 () Bool)

(assert (=> b!667783 m!637711))

(declare-fun m!637713 () Bool)

(assert (=> b!667783 m!637713))

(declare-fun m!637715 () Bool)

(assert (=> b!667783 m!637715))

(declare-fun m!637717 () Bool)

(assert (=> b!667783 m!637717))

(declare-fun m!637719 () Bool)

(assert (=> b!667783 m!637719))

(declare-fun m!637721 () Bool)

(assert (=> b!667783 m!637721))

(declare-fun m!637723 () Bool)

(assert (=> b!667783 m!637723))

(declare-fun m!637725 () Bool)

(assert (=> b!667783 m!637725))

(assert (=> b!667783 m!637723))

(declare-fun m!637727 () Bool)

(assert (=> b!667783 m!637727))

(declare-fun m!637729 () Bool)

(assert (=> b!667783 m!637729))

(declare-fun m!637731 () Bool)

(assert (=> b!667783 m!637731))

(declare-fun m!637733 () Bool)

(assert (=> b!667783 m!637733))

(declare-fun m!637735 () Bool)

(assert (=> b!667783 m!637735))

(declare-fun m!637737 () Bool)

(assert (=> b!667785 m!637737))

(declare-fun m!637739 () Bool)

(assert (=> b!667782 m!637739))

(assert (=> b!667805 m!637699))

(declare-fun m!637741 () Bool)

(assert (=> b!667802 m!637741))

(declare-fun m!637743 () Bool)

(assert (=> b!667791 m!637743))

(assert (=> b!667786 m!637711))

(assert (=> b!667786 m!637723))

(declare-fun m!637745 () Bool)

(assert (=> b!667786 m!637745))

(declare-fun m!637747 () Bool)

(assert (=> b!667786 m!637747))

(assert (=> b!667786 m!637723))

(assert (=> b!667786 m!637745))

(assert (=> b!667786 m!637719))

(assert (=> b!667786 m!637735))

(assert (=> b!667789 m!637741))

(declare-fun m!637749 () Bool)

(assert (=> start!60028 m!637749))

(declare-fun m!637751 () Bool)

(assert (=> b!667804 m!637751))

(declare-fun m!637753 () Bool)

(assert (=> b!667806 m!637753))

(declare-fun m!637755 () Bool)

(assert (=> b!667787 m!637755))

(push 1)

(assert (not b!667800))

(assert (not b!667806))

(assert (not b!667785))

(assert (not b!667804))

(assert (not b!667795))

(assert (not b!667782))

(assert (not b!667790))

(assert (not b!667794))

(assert (not b!667787))

(assert (not b!667791))

(assert (not b!667783))

(assert (not b!667786))

(assert (not start!60028))

(assert (not b!667798))

(assert (not b!667802))

(assert (not b!667788))

(assert (not b!667789))

(assert (not b!667805))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

