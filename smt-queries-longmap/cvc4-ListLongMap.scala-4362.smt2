; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60204 () Bool)

(assert start!60204)

(declare-fun b!673588 () Bool)

(declare-fun res!440145 () Bool)

(declare-fun e!384634 () Bool)

(assert (=> b!673588 (=> (not res!440145) (not e!384634))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!673588 (= res!440145 (validKeyInArray!0 k!2843))))

(declare-fun b!673589 () Bool)

(declare-fun e!384629 () Bool)

(declare-fun e!384627 () Bool)

(assert (=> b!673589 (= e!384629 e!384627)))

(declare-fun res!440139 () Bool)

(assert (=> b!673589 (=> (not res!440139) (not e!384627))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!673589 (= res!440139 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-datatypes ((List!12859 0))(
  ( (Nil!12856) (Cons!12855 (h!13900 (_ BitVec 64)) (t!19087 List!12859)) )
))
(declare-fun lt!312488 () List!12859)

(declare-datatypes ((array!39251 0))(
  ( (array!39252 (arr!18818 (Array (_ BitVec 32) (_ BitVec 64))) (size!19182 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39251)

(declare-fun acc!681 () List!12859)

(declare-fun $colon$colon!286 (List!12859 (_ BitVec 64)) List!12859)

(assert (=> b!673589 (= lt!312488 ($colon$colon!286 acc!681 (select (arr!18818 a!3626) from!3004)))))

(declare-fun b!673590 () Bool)

(assert (=> b!673590 (= e!384634 e!384629)))

(declare-fun res!440132 () Bool)

(assert (=> b!673590 (=> (not res!440132) (not e!384629))))

(assert (=> b!673590 (= res!440132 (not (= (select (arr!18818 a!3626) from!3004) k!2843)))))

(declare-datatypes ((Unit!23684 0))(
  ( (Unit!23685) )
))
(declare-fun lt!312489 () Unit!23684)

(declare-fun e!384633 () Unit!23684)

(assert (=> b!673590 (= lt!312489 e!384633)))

(declare-fun c!77099 () Bool)

(assert (=> b!673590 (= c!77099 (= (select (arr!18818 a!3626) from!3004) k!2843))))

(declare-fun b!673591 () Bool)

(declare-fun res!440131 () Bool)

(assert (=> b!673591 (=> (not res!440131) (not e!384634))))

(assert (=> b!673591 (= res!440131 (validKeyInArray!0 (select (arr!18818 a!3626) from!3004)))))

(declare-fun b!673592 () Bool)

(declare-fun e!384630 () Bool)

(declare-fun e!384632 () Bool)

(assert (=> b!673592 (= e!384630 e!384632)))

(declare-fun res!440136 () Bool)

(assert (=> b!673592 (=> (not res!440136) (not e!384632))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!673592 (= res!440136 (bvsle from!3004 i!1382))))

(declare-fun b!673593 () Bool)

(declare-fun res!440146 () Bool)

(assert (=> b!673593 (=> (not res!440146) (not e!384634))))

(assert (=> b!673593 (= res!440146 e!384630)))

(declare-fun res!440129 () Bool)

(assert (=> b!673593 (=> res!440129 e!384630)))

(declare-fun e!384628 () Bool)

(assert (=> b!673593 (= res!440129 e!384628)))

(declare-fun res!440124 () Bool)

(assert (=> b!673593 (=> (not res!440124) (not e!384628))))

(assert (=> b!673593 (= res!440124 (bvsgt from!3004 i!1382))))

(declare-fun b!673594 () Bool)

(declare-fun contains!3436 (List!12859 (_ BitVec 64)) Bool)

(assert (=> b!673594 (= e!384632 (not (contains!3436 acc!681 k!2843)))))

(declare-fun b!673595 () Bool)

(declare-fun res!440127 () Bool)

(assert (=> b!673595 (=> (not res!440127) (not e!384634))))

(assert (=> b!673595 (= res!440127 (not (contains!3436 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673596 () Bool)

(assert (=> b!673596 (= e!384628 (contains!3436 acc!681 k!2843))))

(declare-fun b!673597 () Bool)

(declare-fun res!440140 () Bool)

(assert (=> b!673597 (=> (not res!440140) (not e!384627))))

(declare-fun noDuplicate!683 (List!12859) Bool)

(assert (=> b!673597 (= res!440140 (noDuplicate!683 lt!312488))))

(declare-fun res!440134 () Bool)

(assert (=> start!60204 (=> (not res!440134) (not e!384634))))

(assert (=> start!60204 (= res!440134 (and (bvslt (size!19182 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19182 a!3626))))))

(assert (=> start!60204 e!384634))

(assert (=> start!60204 true))

(declare-fun array_inv!14614 (array!39251) Bool)

(assert (=> start!60204 (array_inv!14614 a!3626)))

(declare-fun b!673598 () Bool)

(declare-fun res!440135 () Bool)

(assert (=> b!673598 (=> (not res!440135) (not e!384634))))

(declare-fun arrayContainsKey!0 (array!39251 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!673598 (= res!440135 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!673599 () Bool)

(declare-fun res!440144 () Bool)

(assert (=> b!673599 (=> (not res!440144) (not e!384634))))

(assert (=> b!673599 (= res!440144 (noDuplicate!683 acc!681))))

(declare-fun b!673600 () Bool)

(declare-fun res!440147 () Bool)

(assert (=> b!673600 (=> (not res!440147) (not e!384627))))

(assert (=> b!673600 (= res!440147 (not (contains!3436 lt!312488 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673601 () Bool)

(declare-fun res!440126 () Bool)

(assert (=> b!673601 (=> (not res!440126) (not e!384634))))

(assert (=> b!673601 (= res!440126 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19182 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!673602 () Bool)

(declare-fun res!440133 () Bool)

(assert (=> b!673602 (=> (not res!440133) (not e!384627))))

(assert (=> b!673602 (= res!440133 (not (contains!3436 lt!312488 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673603 () Bool)

(declare-fun res!440128 () Bool)

(assert (=> b!673603 (=> (not res!440128) (not e!384634))))

(declare-fun arrayNoDuplicates!0 (array!39251 (_ BitVec 32) List!12859) Bool)

(assert (=> b!673603 (= res!440128 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!673604 () Bool)

(declare-fun e!384626 () Bool)

(assert (=> b!673604 (= e!384626 (not (contains!3436 lt!312488 k!2843)))))

(declare-fun b!673605 () Bool)

(declare-fun Unit!23686 () Unit!23684)

(assert (=> b!673605 (= e!384633 Unit!23686)))

(declare-fun b!673606 () Bool)

(declare-fun res!440137 () Bool)

(assert (=> b!673606 (=> (not res!440137) (not e!384634))))

(assert (=> b!673606 (= res!440137 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12856))))

(declare-fun b!673607 () Bool)

(declare-fun Unit!23687 () Unit!23684)

(assert (=> b!673607 (= e!384633 Unit!23687)))

(assert (=> b!673607 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312487 () Unit!23684)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39251 (_ BitVec 64) (_ BitVec 32)) Unit!23684)

(assert (=> b!673607 (= lt!312487 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!673607 false))

(declare-fun b!673608 () Bool)

(assert (=> b!673608 (= e!384627 false)))

(declare-fun lt!312490 () Bool)

(assert (=> b!673608 (= lt!312490 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312488))))

(declare-fun b!673609 () Bool)

(declare-fun res!440142 () Bool)

(assert (=> b!673609 (=> (not res!440142) (not e!384627))))

(declare-fun e!384635 () Bool)

(assert (=> b!673609 (= res!440142 e!384635)))

(declare-fun res!440141 () Bool)

(assert (=> b!673609 (=> res!440141 e!384635)))

(declare-fun e!384636 () Bool)

(assert (=> b!673609 (= res!440141 e!384636)))

(declare-fun res!440130 () Bool)

(assert (=> b!673609 (=> (not res!440130) (not e!384636))))

(assert (=> b!673609 (= res!440130 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673610 () Bool)

(assert (=> b!673610 (= e!384635 e!384626)))

(declare-fun res!440143 () Bool)

(assert (=> b!673610 (=> (not res!440143) (not e!384626))))

(assert (=> b!673610 (= res!440143 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!673611 () Bool)

(declare-fun res!440138 () Bool)

(assert (=> b!673611 (=> (not res!440138) (not e!384634))))

(assert (=> b!673611 (= res!440138 (not (contains!3436 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!673612 () Bool)

(declare-fun res!440125 () Bool)

(assert (=> b!673612 (=> (not res!440125) (not e!384634))))

(assert (=> b!673612 (= res!440125 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19182 a!3626))))))

(declare-fun b!673613 () Bool)

(assert (=> b!673613 (= e!384636 (contains!3436 lt!312488 k!2843))))

(assert (= (and start!60204 res!440134) b!673599))

(assert (= (and b!673599 res!440144) b!673611))

(assert (= (and b!673611 res!440138) b!673595))

(assert (= (and b!673595 res!440127) b!673593))

(assert (= (and b!673593 res!440124) b!673596))

(assert (= (and b!673593 (not res!440129)) b!673592))

(assert (= (and b!673592 res!440136) b!673594))

(assert (= (and b!673593 res!440146) b!673606))

(assert (= (and b!673606 res!440137) b!673603))

(assert (= (and b!673603 res!440128) b!673612))

(assert (= (and b!673612 res!440125) b!673588))

(assert (= (and b!673588 res!440145) b!673598))

(assert (= (and b!673598 res!440135) b!673601))

(assert (= (and b!673601 res!440126) b!673591))

(assert (= (and b!673591 res!440131) b!673590))

(assert (= (and b!673590 c!77099) b!673607))

(assert (= (and b!673590 (not c!77099)) b!673605))

(assert (= (and b!673590 res!440132) b!673589))

(assert (= (and b!673589 res!440139) b!673597))

(assert (= (and b!673597 res!440140) b!673600))

(assert (= (and b!673600 res!440147) b!673602))

(assert (= (and b!673602 res!440133) b!673609))

(assert (= (and b!673609 res!440130) b!673613))

(assert (= (and b!673609 (not res!440141)) b!673610))

(assert (= (and b!673610 res!440143) b!673604))

(assert (= (and b!673609 res!440142) b!673608))

(declare-fun m!641961 () Bool)

(assert (=> b!673603 m!641961))

(declare-fun m!641963 () Bool)

(assert (=> b!673602 m!641963))

(declare-fun m!641965 () Bool)

(assert (=> b!673591 m!641965))

(assert (=> b!673591 m!641965))

(declare-fun m!641967 () Bool)

(assert (=> b!673591 m!641967))

(declare-fun m!641969 () Bool)

(assert (=> b!673596 m!641969))

(declare-fun m!641971 () Bool)

(assert (=> b!673595 m!641971))

(declare-fun m!641973 () Bool)

(assert (=> b!673606 m!641973))

(declare-fun m!641975 () Bool)

(assert (=> b!673607 m!641975))

(declare-fun m!641977 () Bool)

(assert (=> b!673607 m!641977))

(declare-fun m!641979 () Bool)

(assert (=> b!673611 m!641979))

(declare-fun m!641981 () Bool)

(assert (=> b!673599 m!641981))

(declare-fun m!641983 () Bool)

(assert (=> start!60204 m!641983))

(assert (=> b!673594 m!641969))

(declare-fun m!641985 () Bool)

(assert (=> b!673598 m!641985))

(declare-fun m!641987 () Bool)

(assert (=> b!673613 m!641987))

(assert (=> b!673590 m!641965))

(assert (=> b!673604 m!641987))

(declare-fun m!641989 () Bool)

(assert (=> b!673588 m!641989))

(declare-fun m!641991 () Bool)

(assert (=> b!673600 m!641991))

(declare-fun m!641993 () Bool)

(assert (=> b!673597 m!641993))

(assert (=> b!673589 m!641965))

(assert (=> b!673589 m!641965))

(declare-fun m!641995 () Bool)

(assert (=> b!673589 m!641995))

(declare-fun m!641997 () Bool)

(assert (=> b!673608 m!641997))

(push 1)

