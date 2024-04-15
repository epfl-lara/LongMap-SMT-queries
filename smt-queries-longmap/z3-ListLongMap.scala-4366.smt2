; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60212 () Bool)

(assert start!60212)

(declare-fun b!674083 () Bool)

(declare-fun res!440723 () Bool)

(declare-fun e!384770 () Bool)

(assert (=> b!674083 (=> (not res!440723) (not e!384770))))

(declare-datatypes ((List!12907 0))(
  ( (Nil!12904) (Cons!12903 (h!13948 (_ BitVec 64)) (t!19126 List!12907)) )
))
(declare-fun acc!681 () List!12907)

(declare-fun noDuplicate!698 (List!12907) Bool)

(assert (=> b!674083 (= res!440723 (noDuplicate!698 acc!681))))

(declare-fun res!440727 () Bool)

(assert (=> start!60212 (=> (not res!440727) (not e!384770))))

(declare-datatypes ((array!39270 0))(
  ( (array!39271 (arr!18827 (Array (_ BitVec 32) (_ BitVec 64))) (size!19192 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39270)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60212 (= res!440727 (and (bvslt (size!19192 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19192 a!3626))))))

(assert (=> start!60212 e!384770))

(assert (=> start!60212 true))

(declare-fun array_inv!14710 (array!39270) Bool)

(assert (=> start!60212 (array_inv!14710 a!3626)))

(declare-fun b!674084 () Bool)

(declare-fun e!384767 () Bool)

(declare-fun lt!312352 () List!12907)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3429 (List!12907 (_ BitVec 64)) Bool)

(assert (=> b!674084 (= e!384767 (contains!3429 lt!312352 k0!2843))))

(declare-fun b!674085 () Bool)

(declare-fun res!440737 () Bool)

(declare-fun e!384771 () Bool)

(assert (=> b!674085 (=> (not res!440737) (not e!384771))))

(declare-fun arrayNoDuplicates!0 (array!39270 (_ BitVec 32) List!12907) Bool)

(assert (=> b!674085 (= res!440737 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312352))))

(declare-fun b!674086 () Bool)

(declare-fun res!440732 () Bool)

(assert (=> b!674086 (=> (not res!440732) (not e!384771))))

(assert (=> b!674086 (= res!440732 (noDuplicate!698 lt!312352))))

(declare-fun b!674087 () Bool)

(declare-fun res!440724 () Bool)

(assert (=> b!674087 (=> (not res!440724) (not e!384770))))

(declare-fun e!384768 () Bool)

(assert (=> b!674087 (= res!440724 e!384768)))

(declare-fun res!440720 () Bool)

(assert (=> b!674087 (=> res!440720 e!384768)))

(declare-fun e!384772 () Bool)

(assert (=> b!674087 (= res!440720 e!384772)))

(declare-fun res!440736 () Bool)

(assert (=> b!674087 (=> (not res!440736) (not e!384772))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!674087 (= res!440736 (bvsgt from!3004 i!1382))))

(declare-fun b!674088 () Bool)

(declare-fun res!440742 () Bool)

(assert (=> b!674088 (=> (not res!440742) (not e!384770))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!674088 (= res!440742 (validKeyInArray!0 (select (arr!18827 a!3626) from!3004)))))

(declare-fun b!674089 () Bool)

(declare-datatypes ((Unit!23702 0))(
  ( (Unit!23703) )
))
(declare-fun e!384769 () Unit!23702)

(declare-fun Unit!23704 () Unit!23702)

(assert (=> b!674089 (= e!384769 Unit!23704)))

(declare-fun arrayContainsKey!0 (array!39270 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!674089 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312354 () Unit!23702)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39270 (_ BitVec 64) (_ BitVec 32)) Unit!23702)

(assert (=> b!674089 (= lt!312354 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!674089 false))

(declare-fun b!674090 () Bool)

(declare-fun e!384766 () Bool)

(assert (=> b!674090 (= e!384766 (not (contains!3429 lt!312352 k0!2843)))))

(declare-fun b!674091 () Bool)

(declare-fun e!384776 () Bool)

(assert (=> b!674091 (= e!384776 e!384766)))

(declare-fun res!440741 () Bool)

(assert (=> b!674091 (=> (not res!440741) (not e!384766))))

(assert (=> b!674091 (= res!440741 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674092 () Bool)

(declare-fun e!384774 () Bool)

(assert (=> b!674092 (= e!384774 e!384771)))

(declare-fun res!440738 () Bool)

(assert (=> b!674092 (=> (not res!440738) (not e!384771))))

(assert (=> b!674092 (= res!440738 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!295 (List!12907 (_ BitVec 64)) List!12907)

(assert (=> b!674092 (= lt!312352 ($colon$colon!295 acc!681 (select (arr!18827 a!3626) from!3004)))))

(declare-fun b!674093 () Bool)

(assert (=> b!674093 (= e!384771 (not true))))

(assert (=> b!674093 (arrayNoDuplicates!0 (array!39271 (store (arr!18827 a!3626) i!1382 k0!2843) (size!19192 a!3626)) (bvadd #b00000000000000000000000000000001 from!3004) lt!312352)))

(declare-fun lt!312353 () Unit!23702)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!39270 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12907) Unit!23702)

(assert (=> b!674093 (= lt!312353 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3626 k0!2843 i!1382 (bvadd #b00000000000000000000000000000001 from!3004) lt!312352))))

(declare-fun b!674094 () Bool)

(declare-fun res!440743 () Bool)

(assert (=> b!674094 (=> (not res!440743) (not e!384770))))

(assert (=> b!674094 (= res!440743 (validKeyInArray!0 k0!2843))))

(declare-fun b!674095 () Bool)

(declare-fun e!384775 () Bool)

(assert (=> b!674095 (= e!384768 e!384775)))

(declare-fun res!440726 () Bool)

(assert (=> b!674095 (=> (not res!440726) (not e!384775))))

(assert (=> b!674095 (= res!440726 (bvsle from!3004 i!1382))))

(declare-fun b!674096 () Bool)

(assert (=> b!674096 (= e!384770 e!384774)))

(declare-fun res!440722 () Bool)

(assert (=> b!674096 (=> (not res!440722) (not e!384774))))

(assert (=> b!674096 (= res!440722 (not (= (select (arr!18827 a!3626) from!3004) k0!2843)))))

(declare-fun lt!312351 () Unit!23702)

(assert (=> b!674096 (= lt!312351 e!384769)))

(declare-fun c!77049 () Bool)

(assert (=> b!674096 (= c!77049 (= (select (arr!18827 a!3626) from!3004) k0!2843))))

(declare-fun b!674097 () Bool)

(declare-fun res!440731 () Bool)

(assert (=> b!674097 (=> (not res!440731) (not e!384770))))

(assert (=> b!674097 (= res!440731 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!674098 () Bool)

(assert (=> b!674098 (= e!384772 (contains!3429 acc!681 k0!2843))))

(declare-fun b!674099 () Bool)

(declare-fun res!440721 () Bool)

(assert (=> b!674099 (=> (not res!440721) (not e!384770))))

(assert (=> b!674099 (= res!440721 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19192 a!3626))))))

(declare-fun b!674100 () Bool)

(declare-fun Unit!23705 () Unit!23702)

(assert (=> b!674100 (= e!384769 Unit!23705)))

(declare-fun b!674101 () Bool)

(declare-fun res!440735 () Bool)

(assert (=> b!674101 (=> (not res!440735) (not e!384771))))

(assert (=> b!674101 (= res!440735 (not (contains!3429 lt!312352 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674102 () Bool)

(declare-fun res!440733 () Bool)

(assert (=> b!674102 (=> (not res!440733) (not e!384770))))

(assert (=> b!674102 (= res!440733 (not (contains!3429 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674103 () Bool)

(declare-fun res!440739 () Bool)

(assert (=> b!674103 (=> (not res!440739) (not e!384770))))

(assert (=> b!674103 (= res!440739 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12904))))

(declare-fun b!674104 () Bool)

(declare-fun res!440740 () Bool)

(assert (=> b!674104 (=> (not res!440740) (not e!384770))))

(assert (=> b!674104 (= res!440740 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!674105 () Bool)

(declare-fun res!440729 () Bool)

(assert (=> b!674105 (=> (not res!440729) (not e!384770))))

(assert (=> b!674105 (= res!440729 (not (contains!3429 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674106 () Bool)

(assert (=> b!674106 (= e!384775 (not (contains!3429 acc!681 k0!2843)))))

(declare-fun b!674107 () Bool)

(declare-fun res!440719 () Bool)

(assert (=> b!674107 (=> (not res!440719) (not e!384770))))

(assert (=> b!674107 (= res!440719 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19192 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!674108 () Bool)

(declare-fun res!440728 () Bool)

(assert (=> b!674108 (=> (not res!440728) (not e!384771))))

(assert (=> b!674108 (= res!440728 (not (contains!3429 lt!312352 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674109 () Bool)

(declare-fun res!440725 () Bool)

(assert (=> b!674109 (=> (not res!440725) (not e!384771))))

(assert (=> b!674109 (= res!440725 e!384776)))

(declare-fun res!440734 () Bool)

(assert (=> b!674109 (=> res!440734 e!384776)))

(assert (=> b!674109 (= res!440734 e!384767)))

(declare-fun res!440730 () Bool)

(assert (=> b!674109 (=> (not res!440730) (not e!384767))))

(assert (=> b!674109 (= res!440730 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!60212 res!440727) b!674083))

(assert (= (and b!674083 res!440723) b!674105))

(assert (= (and b!674105 res!440729) b!674102))

(assert (= (and b!674102 res!440733) b!674087))

(assert (= (and b!674087 res!440736) b!674098))

(assert (= (and b!674087 (not res!440720)) b!674095))

(assert (= (and b!674095 res!440726) b!674106))

(assert (= (and b!674087 res!440724) b!674103))

(assert (= (and b!674103 res!440739) b!674097))

(assert (= (and b!674097 res!440731) b!674099))

(assert (= (and b!674099 res!440721) b!674094))

(assert (= (and b!674094 res!440743) b!674104))

(assert (= (and b!674104 res!440740) b!674107))

(assert (= (and b!674107 res!440719) b!674088))

(assert (= (and b!674088 res!440742) b!674096))

(assert (= (and b!674096 c!77049) b!674089))

(assert (= (and b!674096 (not c!77049)) b!674100))

(assert (= (and b!674096 res!440722) b!674092))

(assert (= (and b!674092 res!440738) b!674086))

(assert (= (and b!674086 res!440732) b!674108))

(assert (= (and b!674108 res!440728) b!674101))

(assert (= (and b!674101 res!440735) b!674109))

(assert (= (and b!674109 res!440730) b!674084))

(assert (= (and b!674109 (not res!440734)) b!674091))

(assert (= (and b!674091 res!440741) b!674090))

(assert (= (and b!674109 res!440725) b!674085))

(assert (= (and b!674085 res!440737) b!674093))

(declare-fun m!641577 () Bool)

(assert (=> b!674090 m!641577))

(declare-fun m!641579 () Bool)

(assert (=> b!674103 m!641579))

(declare-fun m!641581 () Bool)

(assert (=> b!674086 m!641581))

(declare-fun m!641583 () Bool)

(assert (=> b!674089 m!641583))

(declare-fun m!641585 () Bool)

(assert (=> b!674089 m!641585))

(assert (=> b!674084 m!641577))

(declare-fun m!641587 () Bool)

(assert (=> b!674104 m!641587))

(declare-fun m!641589 () Bool)

(assert (=> b!674108 m!641589))

(declare-fun m!641591 () Bool)

(assert (=> b!674088 m!641591))

(assert (=> b!674088 m!641591))

(declare-fun m!641593 () Bool)

(assert (=> b!674088 m!641593))

(declare-fun m!641595 () Bool)

(assert (=> b!674101 m!641595))

(declare-fun m!641597 () Bool)

(assert (=> start!60212 m!641597))

(declare-fun m!641599 () Bool)

(assert (=> b!674105 m!641599))

(declare-fun m!641601 () Bool)

(assert (=> b!674098 m!641601))

(declare-fun m!641603 () Bool)

(assert (=> b!674085 m!641603))

(declare-fun m!641605 () Bool)

(assert (=> b!674094 m!641605))

(declare-fun m!641607 () Bool)

(assert (=> b!674093 m!641607))

(declare-fun m!641609 () Bool)

(assert (=> b!674093 m!641609))

(declare-fun m!641611 () Bool)

(assert (=> b!674093 m!641611))

(declare-fun m!641613 () Bool)

(assert (=> b!674097 m!641613))

(assert (=> b!674096 m!641591))

(assert (=> b!674092 m!641591))

(assert (=> b!674092 m!641591))

(declare-fun m!641615 () Bool)

(assert (=> b!674092 m!641615))

(declare-fun m!641617 () Bool)

(assert (=> b!674102 m!641617))

(declare-fun m!641619 () Bool)

(assert (=> b!674083 m!641619))

(assert (=> b!674106 m!641601))

(check-sat (not b!674094) (not b!674086) (not b!674098) (not b!674105) (not b!674093) (not b!674097) (not b!674084) (not b!674104) (not b!674101) (not b!674090) (not b!674108) (not start!60212) (not b!674089) (not b!674092) (not b!674083) (not b!674102) (not b!674088) (not b!674106) (not b!674085) (not b!674103))
(check-sat)
