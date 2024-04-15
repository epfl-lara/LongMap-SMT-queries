; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59894 () Bool)

(assert start!59894)

(declare-fun b!663058 () Bool)

(declare-fun res!431137 () Bool)

(declare-fun e!380448 () Bool)

(assert (=> b!663058 (=> (not res!431137) (not e!380448))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!38952 0))(
  ( (array!38953 (arr!18668 (Array (_ BitVec 32) (_ BitVec 64))) (size!19033 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38952)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!663058 (= res!431137 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19033 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!663059 () Bool)

(declare-fun e!380447 () Bool)

(declare-fun e!380451 () Bool)

(assert (=> b!663059 (= e!380447 e!380451)))

(declare-fun res!431131 () Bool)

(assert (=> b!663059 (=> (not res!431131) (not e!380451))))

(assert (=> b!663059 (= res!431131 (bvsle from!3004 i!1382))))

(declare-fun b!663060 () Bool)

(declare-fun res!431143 () Bool)

(assert (=> b!663060 (=> (not res!431143) (not e!380448))))

(declare-datatypes ((List!12748 0))(
  ( (Nil!12745) (Cons!12744 (h!13789 (_ BitVec 64)) (t!18967 List!12748)) )
))
(declare-fun arrayNoDuplicates!0 (array!38952 (_ BitVec 32) List!12748) Bool)

(assert (=> b!663060 (= res!431143 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12745))))

(declare-fun b!663061 () Bool)

(declare-fun acc!681 () List!12748)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun contains!3270 (List!12748 (_ BitVec 64)) Bool)

(assert (=> b!663061 (= e!380451 (not (contains!3270 acc!681 k0!2843)))))

(declare-fun b!663062 () Bool)

(declare-fun res!431133 () Bool)

(assert (=> b!663062 (=> (not res!431133) (not e!380448))))

(assert (=> b!663062 (= res!431133 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!663063 () Bool)

(declare-datatypes ((Unit!23048 0))(
  ( (Unit!23049) )
))
(declare-fun e!380450 () Unit!23048)

(declare-fun Unit!23050 () Unit!23048)

(assert (=> b!663063 (= e!380450 Unit!23050)))

(declare-fun b!663064 () Bool)

(declare-fun e!380453 () Bool)

(assert (=> b!663064 (= e!380453 (contains!3270 acc!681 k0!2843))))

(declare-fun b!663065 () Bool)

(declare-fun lt!309008 () Unit!23048)

(assert (=> b!663065 (= e!380450 lt!309008)))

(declare-fun lt!309009 () Unit!23048)

(declare-fun lemmaListSubSeqRefl!0 (List!12748) Unit!23048)

(assert (=> b!663065 (= lt!309009 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun subseq!26 (List!12748 List!12748) Bool)

(assert (=> b!663065 (subseq!26 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!38952 List!12748 List!12748 (_ BitVec 32)) Unit!23048)

(declare-fun $colon$colon!157 (List!12748 (_ BitVec 64)) List!12748)

(assert (=> b!663065 (= lt!309008 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!157 acc!681 (select (arr!18668 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663065 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!663066 () Bool)

(declare-fun e!380452 () Unit!23048)

(declare-fun Unit!23051 () Unit!23048)

(assert (=> b!663066 (= e!380452 Unit!23051)))

(declare-fun lt!309006 () Unit!23048)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38952 (_ BitVec 64) (_ BitVec 32)) Unit!23048)

(assert (=> b!663066 (= lt!309006 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!663066 false))

(declare-fun b!663067 () Bool)

(declare-fun res!431132 () Bool)

(assert (=> b!663067 (=> (not res!431132) (not e!380448))))

(assert (=> b!663067 (= res!431132 (not (contains!3270 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663068 () Bool)

(assert (=> b!663068 (= e!380448 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000)))))

(declare-fun lt!309005 () Unit!23048)

(assert (=> b!663068 (= lt!309005 e!380450)))

(declare-fun c!76332 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!663068 (= c!76332 (validKeyInArray!0 (select (arr!18668 a!3626) from!3004)))))

(declare-fun lt!309007 () Unit!23048)

(assert (=> b!663068 (= lt!309007 e!380452)))

(declare-fun c!76331 () Bool)

(declare-fun arrayContainsKey!0 (array!38952 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!663068 (= c!76331 (arrayContainsKey!0 a!3626 k0!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!663068 (arrayContainsKey!0 (array!38953 (store (arr!18668 a!3626) i!1382 k0!2843) (size!19033 a!3626)) k0!2843 from!3004)))

(declare-fun b!663069 () Bool)

(declare-fun Unit!23052 () Unit!23048)

(assert (=> b!663069 (= e!380452 Unit!23052)))

(declare-fun b!663070 () Bool)

(declare-fun res!431130 () Bool)

(assert (=> b!663070 (=> (not res!431130) (not e!380448))))

(assert (=> b!663070 (= res!431130 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun b!663071 () Bool)

(declare-fun res!431140 () Bool)

(assert (=> b!663071 (=> (not res!431140) (not e!380448))))

(assert (=> b!663071 (= res!431140 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19033 a!3626))))))

(declare-fun b!663072 () Bool)

(declare-fun res!431134 () Bool)

(assert (=> b!663072 (=> (not res!431134) (not e!380448))))

(assert (=> b!663072 (= res!431134 (validKeyInArray!0 k0!2843))))

(declare-fun res!431139 () Bool)

(assert (=> start!59894 (=> (not res!431139) (not e!380448))))

(assert (=> start!59894 (= res!431139 (and (bvslt (size!19033 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19033 a!3626))))))

(assert (=> start!59894 e!380448))

(assert (=> start!59894 true))

(declare-fun array_inv!14551 (array!38952) Bool)

(assert (=> start!59894 (array_inv!14551 a!3626)))

(declare-fun b!663073 () Bool)

(declare-fun res!431136 () Bool)

(assert (=> b!663073 (=> (not res!431136) (not e!380448))))

(assert (=> b!663073 (= res!431136 (not (contains!3270 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!663074 () Bool)

(declare-fun res!431142 () Bool)

(assert (=> b!663074 (=> (not res!431142) (not e!380448))))

(declare-fun noDuplicate!539 (List!12748) Bool)

(assert (=> b!663074 (= res!431142 (noDuplicate!539 acc!681))))

(declare-fun b!663075 () Bool)

(declare-fun res!431141 () Bool)

(assert (=> b!663075 (=> (not res!431141) (not e!380448))))

(assert (=> b!663075 (= res!431141 e!380447)))

(declare-fun res!431138 () Bool)

(assert (=> b!663075 (=> res!431138 e!380447)))

(assert (=> b!663075 (= res!431138 e!380453)))

(declare-fun res!431135 () Bool)

(assert (=> b!663075 (=> (not res!431135) (not e!380453))))

(assert (=> b!663075 (= res!431135 (bvsgt from!3004 i!1382))))

(assert (= (and start!59894 res!431139) b!663074))

(assert (= (and b!663074 res!431142) b!663067))

(assert (= (and b!663067 res!431132) b!663073))

(assert (= (and b!663073 res!431136) b!663075))

(assert (= (and b!663075 res!431135) b!663064))

(assert (= (and b!663075 (not res!431138)) b!663059))

(assert (= (and b!663059 res!431131) b!663061))

(assert (= (and b!663075 res!431141) b!663060))

(assert (= (and b!663060 res!431143) b!663062))

(assert (= (and b!663062 res!431133) b!663071))

(assert (= (and b!663071 res!431140) b!663072))

(assert (= (and b!663072 res!431134) b!663070))

(assert (= (and b!663070 res!431130) b!663058))

(assert (= (and b!663058 res!431137) b!663068))

(assert (= (and b!663068 c!76331) b!663066))

(assert (= (and b!663068 (not c!76331)) b!663069))

(assert (= (and b!663068 c!76332) b!663065))

(assert (= (and b!663068 (not c!76332)) b!663063))

(declare-fun m!634167 () Bool)

(assert (=> b!663072 m!634167))

(declare-fun m!634169 () Bool)

(assert (=> b!663062 m!634169))

(declare-fun m!634171 () Bool)

(assert (=> b!663065 m!634171))

(declare-fun m!634173 () Bool)

(assert (=> b!663065 m!634173))

(declare-fun m!634175 () Bool)

(assert (=> b!663065 m!634175))

(declare-fun m!634177 () Bool)

(assert (=> b!663065 m!634177))

(assert (=> b!663065 m!634173))

(assert (=> b!663065 m!634175))

(declare-fun m!634179 () Bool)

(assert (=> b!663065 m!634179))

(declare-fun m!634181 () Bool)

(assert (=> b!663065 m!634181))

(declare-fun m!634183 () Bool)

(assert (=> start!59894 m!634183))

(declare-fun m!634185 () Bool)

(assert (=> b!663066 m!634185))

(declare-fun m!634187 () Bool)

(assert (=> b!663067 m!634187))

(declare-fun m!634189 () Bool)

(assert (=> b!663064 m!634189))

(declare-fun m!634191 () Bool)

(assert (=> b!663070 m!634191))

(declare-fun m!634193 () Bool)

(assert (=> b!663073 m!634193))

(assert (=> b!663068 m!634173))

(declare-fun m!634195 () Bool)

(assert (=> b!663068 m!634195))

(declare-fun m!634197 () Bool)

(assert (=> b!663068 m!634197))

(assert (=> b!663068 m!634173))

(declare-fun m!634199 () Bool)

(assert (=> b!663068 m!634199))

(declare-fun m!634201 () Bool)

(assert (=> b!663068 m!634201))

(declare-fun m!634203 () Bool)

(assert (=> b!663060 m!634203))

(assert (=> b!663061 m!634189))

(declare-fun m!634205 () Bool)

(assert (=> b!663074 m!634205))

(check-sat (not b!663070) (not b!663066) (not b!663064) (not b!663068) (not b!663074) (not b!663065) (not start!59894) (not b!663067) (not b!663060) (not b!663061) (not b!663073) (not b!663072) (not b!663062))
(check-sat)
